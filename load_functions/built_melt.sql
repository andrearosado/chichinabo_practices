--USAGE: SELECT * FROM stage.build_melt('censo_muni_2001_join','wkb_geometry','where_geon');

/*
* This function builds...
*/
CREATE OR REPLACE FUNCTION stage.build_melt(table_name text, col_geom text, col_geoname text)
  RETURNS text AS
$BODY$

DECLARE
colnum integer=0;
melt_query text; --Begin melt query with a SELECT
j integer:=0; --Index for melt values
step integer:=1;

BEGIN

--Get column count
EXECUTE E'select count(*) from information_schema.columns where table_name='||quote_literal(table_name)||';' INTO colnum;

--Determine whether a colnum is even or not
--Age groups are always paired (men/women+geometry column+ geoname column)
--We first remove any serial column created in the import (e.g. 'ogr_fid')
IF colnum % 2 = 1 THEN
    colnum:=colnum-1;
ELSE
    colnum:=colnum;
END IF;

-- Substract geoname and geometry columns from count
-- Substract redundant age group (0 <-> 100) to get a divisible number (e.g. 100, 20, etc)
colnum:=colnum-2-2;


-- Calculate step (e.g. yearly, quinquennial, etc)
step:=100/(colnum/2);

--RAISE NOTICE 'Age grouping (%)', step;
--RAISE NOTICE 'Colnum (%)', colnum;

--Build melt query
FOR i IN 0..(colnum-1)/2 LOOP

	-- Check if we are in the last iteration. Then, assign 100+.
	IF i < (colnum-1)/2 THEN

		-- While it is not the last iteration build melt by step (e.g. 1, 4, etc)
		melt_query:=concat(melt_query,
		'SELECT '|| col_geoname ||' AS where_geoname,  '|| col_geom ||' AS where_boundary, xy_'||j::text||'_'||(j+step)::text||' as xy, xx_'||j::text||'_'||(j+step)::text||' as xx, r_'||j::text||'_'||(j+step)::text||' as age FROM rangos UNION ');

		j:=j+step;
	
	ELSE
		--If its the last iteration, melt will end with "100".
		melt_query:=concat(melt_query,
		
		'SELECT '|| col_geoname ||' AS where_geoname,  '|| col_geom ||' AS where_boundary, xy_'||j::text||'_'||100::text||' as xy, xx_'||j::text||'_'||100::text||' as xx, r_'||j::text||'_'||100::text||' as age FROM rangos; ');


	END IF;

    
END LOOP;




RETURN melt_query;

END
$BODY$
LANGUAGE plpgsql
