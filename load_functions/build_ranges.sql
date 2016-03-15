--USAGE: SELECT * FROM stage.build_ranges('censo_muni_2001_join');

/*
* This function builds...
*/
CREATE OR REPLACE FUNCTION stage.build_ranges(table_name text)
  RETURNS text AS
$BODY$

DECLARE
colnum integer=0;
ranges_query text:='SELECT *, '; --Begin range query with a SELECT
j integer:=0; --Index for range values

BEGIN

--Get column count
EXECUTE E'select count(*) from information_schema.columns where table_name='||quote_literal(table_name)||';' INTO colnum;

--Determine whether a colnum is even or not
--Age groups are always paired (men/women+geometry column+ geoname column)
IF colnum % 2 = 1 THEN
    colnum:=colnum-1;
ELSE
    colnum:=colnum;
END IF;

--Substract geoname and geometry columns from count
colnum:=colnum-2;

-------------------------------------------------------
--TODO: Calculate step (e.g. yearly, quinquennial, etc)
-------------------------------------------------------

--Build range query
FOR i IN 0..(colnum-1)/2 LOOP

	-- Check if we are in the last iteration. Then, assign 100+.
	IF i < (colnum-1)/2 THEN

		-- While it is not the last iteration build ranges by step (e.g. 1, 4, etc)
		ranges_query:=concat(ranges_query,E'int4range( '||j::text||','||(j+4)::text||',''[)'') AS r_'||j::text||'_'||(j+4)::text||' ,' );
		j:=j+5;
	ELSE
		--If its the last iteration, range will end with "100".
		ranges_query:=concat(ranges_query,E'int4range( '||j::text||','||100::text||',''[)'') AS r_'||j::text||'_'||100::text||' ,' );
	END IF;

    
END LOOP;




--Close range query
ranges_query:=ranges_query||'FROM stage.'||table_name||';';




RETURN ranges_query;

END
$BODY$
LANGUAGE plpgsql
