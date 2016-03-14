﻿--Age ranges in columns. Integer values become canonical range '[)'
CREATE TABLE stage.censo_ccaa_2001_ranges AS(
SELECT *,
int4range(0,1,'[)') AS rxy_0_1,
int4range(1,2,'[)') AS rxy_1_2,
int4range(2,3,'[)') AS rxy_2_3,
int4range(3,4,'[)') AS rxy_3_4,
int4range(4,5,'[)') AS rxy_4_5,
int4range(5,6,'[)') AS rxy_5_6,
int4range(6,7,'[)') AS rxy_6_7,
int4range(7,8,'[)') AS rxy_7_8,
int4range(8,9,'[)') AS rxy_8_9,
int4range(9,10,'[)') AS rxy_9_10,
int4range(10,11,'[)') AS rxy_10_11,
int4range(11,12,'[)') AS rxy_11_12,
int4range(12,13,'[)') AS rxy_12_13,
int4range(13,14,'[)') AS rxy_13_14,
int4range(14,15,'[)') AS rxy_14_15,
int4range(15,16,'[)') AS rxy_15_16,
int4range(16,17,'[)') AS rxy_16_17,
int4range(17,18,'[)') AS rxy_17_18,
int4range(18,19,'[)') AS rxy_18_19,
int4range(19,20,'[)') AS rxy_19_20,
int4range(20,21,'[)') AS rxy_20_21,
int4range(21,22,'[)') AS rxy_21_22,
int4range(22,23,'[)') AS rxy_22_23,
int4range(23,24,'[)') AS rxy_23_24,
int4range(24,25,'[)') AS rxy_24_25,
int4range(25,26,'[)') AS rxy_25_26,
int4range(26,27,'[)') AS rxy_26_27,
int4range(27,28,'[)') AS rxy_27_28,
int4range(28,29,'[)') AS rxy_28_29,
int4range(29,30,'[)') AS rxy_29_30,
int4range(30,31,'[)') AS rxy_30_31,
int4range(31,32,'[)') AS rxy_31_32,
int4range(32,33,'[)') AS rxy_32_33,
int4range(33,34,'[)') AS rxy_33_34,
int4range(34,35,'[)') AS rxy_34_35,
int4range(35,36,'[)') AS rxy_35_36,
int4range(36,37,'[)') AS rxy_36_37,
int4range(37,38,'[)') AS rxy_37_38,
int4range(38,39,'[)') AS rxy_38_39,
int4range(39,40,'[)') AS rxy_39_40,
int4range(40,41,'[)') AS rxy_40_41,
int4range(41,42,'[)') AS rxy_41_42,
int4range(42,43,'[)') AS rxy_42_43,
int4range(43,44,'[)') AS rxy_43_44,
int4range(44,45,'[)') AS rxy_44_45,
int4range(45,46,'[)') AS rxy_45_46,
int4range(46,47,'[)') AS rxy_46_47,
int4range(47,48,'[)') AS rxy_47_48,
int4range(48,49,'[)') AS rxy_48_49,
int4range(49,50,'[)') AS rxy_49_50,
int4range(50,51,'[)') AS rxy_50_51,
int4range(51,52,'[)') AS rxy_51_52,
int4range(52,53,'[)') AS rxy_52_53,
int4range(53,54,'[)') AS rxy_53_54,
int4range(54,55,'[)') AS rxy_54_55,
int4range(55,56,'[)') AS rxy_55_56,
int4range(56,57,'[)') AS rxy_56_57,
int4range(57,58,'[)') AS rxy_57_58,
int4range(58,59,'[)') AS rxy_58_59,
int4range(59,60,'[)') AS rxy_59_60,
int4range(60,61,'[)') AS rxy_60_61,
int4range(61,62,'[)') AS rxy_61_62,
int4range(62,63,'[)') AS rxy_62_63,
int4range(63,64,'[)') AS rxy_63_64,
int4range(64,65,'[)') AS rxy_64_65,
int4range(65,66,'[)') AS rxy_65_66,
int4range(66,67,'[)') AS rxy_66_67,
int4range(67,68,'[)') AS rxy_67_68,
int4range(68,69,'[)') AS rxy_68_69,
int4range(69,70,'[)') AS rxy_69_70,
int4range(70,71,'[)') AS rxy_70_71,
int4range(71,72,'[)') AS rxy_71_72,
int4range(72,73,'[)') AS rxy_72_73,
int4range(73,74,'[)') AS rxy_73_74,
int4range(74,75,'[)') AS rxy_74_75,
int4range(75,76,'[)') AS rxy_75_76,
int4range(76,77,'[)') AS rxy_76_77,
int4range(77,78,'[)') AS rxy_77_78,
int4range(78,79,'[)') AS rxy_78_79,
int4range(79,80,'[)') AS rxy_79_80,
int4range(80,81,'[)') AS rxy_80_81,
int4range(81,82,'[)') AS rxy_81_82,
int4range(82,83,'[)') AS rxy_82_83,
int4range(83,84,'[)') AS rxy_83_84,
int4range(84,85,'[)') AS rxy_84_85,
int4range(85,86,'[)') AS rxy_85_86,
int4range(86,87,'[)') AS rxy_86_87,
int4range(87,88,'[)') AS rxy_87_88,
int4range(88,89,'[)') AS rxy_88_89,
int4range(89,90,'[)') AS rxy_89_90,
int4range(90,91,'[)') AS rxy_90_91,
int4range(91,92,'[)') AS rxy_91_92,
int4range(92,93,'[)') AS rxy_92_93,
int4range(93,94,'[)') AS rxy_93_94,
int4range(94,95,'[)') AS rxy_94_95,
int4range(95,96,'[)') AS rxy_95_96,
int4range(96,97,'[)') AS rxy_96_97,
int4range(97,98,'[)') AS rxy_97_98,
int4range(98,99,'[)') AS rxy_98_99,
int4range(99,100,'[)') AS rxy_99_100,
int4range(100,null,'[)') AS rxy_100m
FROM stage.censo_ccaa_2001_join);