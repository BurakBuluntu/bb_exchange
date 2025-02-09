CREATE TABLE IF NOT EXISTS `brkblnt_borsa` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Label` varchar(50) NOT NULL,
  `Fiyat` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
)