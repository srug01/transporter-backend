/*
-- Query: SELECT * FROM transporter.mastertype
LIMIT 0, 1000

-- Date: 2020-08-30 12:13
*/
INSERT INTO `mastertype` (`masterTypeId`,`masterType`,`sourceType`,`destinationType`) VALUES (1,'cfsToyard','CFS','YARD');
INSERT INTO `mastertype` (`masterTypeId`,`masterType`,`sourceType`,`destinationType`) VALUES (2,'cfsToport','CFS','PORT');
INSERT INTO `mastertype` (`masterTypeId`,`masterType`,`sourceType`,`destinationType`) VALUES (3,'yardTocfs','YARD','CFS');
INSERT INTO `mastertype` (`masterTypeId`,`masterType`,`sourceType`,`destinationType`) VALUES (4,'portTocfs','PORT','CFS');
