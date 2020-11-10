-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: transporter
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `bidId` int NOT NULL AUTO_INCREMENT,
  `originalRate` int DEFAULT NULL,
  `exhibitionDate` datetime DEFAULT NULL,
  `subOrderId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `bidUpperLimit` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `bidLowerLimit` int DEFAULT NULL,
  `bidRate` int DEFAULT NULL,
  `bidStatus` varchar(512) DEFAULT NULL,
  `bidStatusId` int DEFAULT NULL,
  `CutOffTime` datetime DEFAULT NULL,
  `BidScheduleId` int DEFAULT NULL,
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (40,810,NULL,100,0,21,'2020-11-10 02:24:29',0,0,NULL,664,NULL,'BID_ASSIGNED',2,NULL,NULL),(41,810,NULL,101,1,21,'2020-11-10 02:24:37',0,0,NULL,664,NULL,'BID_PENDING',1,NULL,NULL),(42,810,NULL,102,1,21,'2020-11-10 02:24:42',0,0,NULL,664,NULL,'BID_PENDING',1,NULL,NULL);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidschedulemaster`
--

DROP TABLE IF EXISTS `bidschedulemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidschedulemaster` (
  `BidScheduleId` int NOT NULL,
  `FromHour` int DEFAULT NULL,
  `ToHour` int DEFAULT NULL,
  `BidingHours` int DEFAULT NULL,
  `WorkingHours` int DEFAULT NULL,
  `GraceHours` int DEFAULT NULL,
  `BidCountUpto` int DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `TotalBidHour` int DEFAULT NULL,
  `IsFullHour` int DEFAULT NULL,
  PRIMARY KEY (`BidScheduleId`),
  UNIQUE KEY `BidScheduleId_UNIQUE` (`BidScheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidschedulemaster`
--

LOCK TABLES `bidschedulemaster` WRITE;
/*!40000 ALTER TABLE `bidschedulemaster` DISABLE KEYS */;
INSERT INTO `bidschedulemaster` VALUES (1,2,6,1,0,1,20,_binary '',NULL,NULL),(2,6,12,3,0,1,20,_binary '',NULL,NULL),(3,12,24,8,0,1,20,_binary '',NULL,NULL),(4,24,48,6,8,1,20,_binary '',6,NULL),(5,48,96,12,8,1,20,_binary '',28,0),(6,96,144,24,8,1,20,_binary '',72,1),(7,144,360,42,8,1,20,_binary '',122,0);
/*!40000 ALTER TABLE `bidschedulemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidusermapping`
--

DROP TABLE IF EXISTS `bidusermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidusermapping` (
  `bidusermappingId` int NOT NULL AUTO_INCREMENT,
  `bidId` int NOT NULL,
  `userId` int NOT NULL,
  `bidValue` int DEFAULT NULL,
  `biduserStatus` varchar(512) DEFAULT NULL,
  `biduserStatusId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `bidSeq` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
INSERT INTO `bidusermapping` VALUES (56,40,21,800,'BID_USER_CONFIRMED',5,21,'2020-11-10 02:24:29',NULL,NULL,'1000007001001'),(57,41,21,790,'BID_USER_EDIT',4,21,'2020-11-10 02:24:37',NULL,NULL,'1000007002001'),(58,42,21,780,'BID_USER_EDIT',4,21,'2020-11-10 02:24:42',NULL,NULL,'1000007003001'),(59,40,15,805,'BID_USER_DISCARD',22,15,'2020-11-10 02:25:14',NULL,NULL,'1000007001002'),(60,41,15,801,'BID_USER_EDIT',4,15,'2020-11-10 02:25:21',NULL,NULL,'1000007002002'),(61,42,15,800,'BID_USER_EDIT',4,15,'2020-11-10 02:25:29',NULL,NULL,'1000007003002');
/*!40000 ALTER TABLE `bidusermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsmaster`
--

DROP TABLE IF EXISTS `cfsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsmaster` (
  `cfsMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsName` varchar(512) DEFAULT NULL,
  `contactNumber` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `cfsCodeNumber` varchar(512) DEFAULT NULL,
  `gstin` varchar(512) DEFAULT NULL,
  `pan` varchar(512) DEFAULT NULL,
  `tan` varchar(512) DEFAULT NULL,
  `primaryContactName` varchar(512) DEFAULT NULL,
  `primaryContactNumber` varchar(512) DEFAULT NULL,
  `additionalContactName` varchar(512) DEFAULT NULL,
  `additionalContactNumber` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(30) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cfsMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
INSERT INTO `cfsmaster` VALUES (1,'CFS All Cargo','8885462130','alc@cfs.com','Add1','Add22','LandMark','411047','CFS001','ldkfjkldfhv','djvhdkjvb','dvbnmbv','Utsav','8795462130','Gaurav','7985462130','44556','552255',1,1,1,1,'2020-08-30 07:25:55',1,'2020-10-25 2:48:08 am',1),(2,'Gaurav CFS','9878745620','cfs@gaurav.in','Add1','Add2','Landmark','401107','CFS002','GSTIN','PANNO','TANNO','Gaurav','8879654120','Gaurav2','7778956410','56456465','564654564',2,2,2,8,'2020-08-31 19:31:50',8,'2020-08-31 19:31:50',1),(3,'CFS New Zone1','7774755000','cfs@zone.in','Add1','','LandMark','425587','CFSZ001','','','','Gaurav','8965412304','','','','',1,1,1,1,'2020-09-12 07:34:20',1,'2020-09-12 07:34:20',1);
/*!40000 ALTER TABLE `cfsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsportratemaster`
--

DROP TABLE IF EXISTS `cfsportratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsportratemaster` (
  `cfsPortRateMasterId` int NOT NULL AUTO_INCREMENT,
  `portMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(30) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `cfsMasterId` int DEFAULT NULL,
  PRIMARY KEY (`cfsPortRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsportratemaster`
--

LOCK TABLES `cfsportratemaster` WRITE;
/*!40000 ALTER TABLE `cfsportratemaster` DISABLE KEYS */;
INSERT INTO `cfsportratemaster` VALUES (1,1,1,300,5,8,1,1,'2020-10-07 17:31:52',1,'2020-10-07 17:31:52',1,1),(2,1,2,400,10,10,1,1,'2020-09-26 18:39:15',1,'2020-09-26 18:39:15',2,3),(3,1,2,250,5,5,1,1,'2020-10-02 05:51:45',1,'2020-10-05 18:36:27',2,1);
/*!40000 ALTER TABLE `cfsportratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsuserregistration`
--

DROP TABLE IF EXISTS `cfsuserregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsuserregistration` (
  `cfsUserRegistrationId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int DEFAULT NULL,
  `userTypeId` int DEFAULT NULL,
  `cfsUserName` varchar(512) DEFAULT NULL,
  `cfsUserDesignation` varchar(512) DEFAULT NULL,
  `cfsUserDepartment` varchar(512) DEFAULT NULL,
  `cfsUserMobileNumber` varchar(512) DEFAULT NULL,
  `cfsUserEmail` varchar(512) DEFAULT NULL,
  `cfsUserPassword` varchar(512) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`cfsUserRegistrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsuserregistration`
--

LOCK TABLES `cfsuserregistration` WRITE;
/*!40000 ALTER TABLE `cfsuserregistration` DISABLE KEYS */;
INSERT INTO `cfsuserregistration` VALUES (1,1,7,'CFS User','Designation','Department','8875415230','alc@admin.in','123456789',4,1,1,1,'2020-08-30 07:34:20',1,'2020-08-30 07:34:20'),(2,2,7,'Gaurav CFS Super Admin','admin','admin','9998887774','cfs@gaurav.in','123456789',9,1,1,8,'2020-08-31 19:34:46',8,'2020-08-31 19:34:46'),(3,1,8,'All cargo User','','','7785624120','alc.user@cfs.in','123456789',10,1,1,4,'2020-09-13 06:57:14',4,'2020-09-13 06:57:14'),(4,3,7,'New Zone CFS','DesT','DepT','8874123546','cfs@newzone.in','123456789',12,1,1,1,'2020-09-23 03:49:06',1,'2020-09-23 03:49:06'),(5,3,8,'CFS USer','T','T','7744884500','cfs@newzone11.in','123456789',14,1,1,1,'2020-09-23 16:30:25',1,'2020-09-23 16:30:25'),(6,1,7,'Newly Created','','','9874120563','newly@cfs.in','123456789',22,1,1,1,'2020-11-05 18:53:37',1,'2020-11-05 18:53:37');
/*!40000 ALTER TABLE `cfsuserregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsyardratemaster`
--

DROP TABLE IF EXISTS `cfsyardratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsyardratemaster` (
  `cfsYardRateMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int NOT NULL,
  `yardMasterId` int NOT NULL,
  `containerMasterId` int NOT NULL,
  `weightMasterId` int NOT NULL,
  `rate` int NOT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `portMasterId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` varchar(30) NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cfsYardRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsyardratemaster`
--

LOCK TABLES `cfsyardratemaster` WRITE;
/*!40000 ALTER TABLE `cfsyardratemaster` DISABLE KEYS */;
INSERT INTO `cfsyardratemaster` VALUES (1,2,2,3,3,900,18,10,2,1,0,'2020-10-07 17:37:40',NULL,NULL),(2,1,1,3,3,500,5,8,1,1,0,'2020-09-15 21:28:18',NULL,NULL),(3,1,3,2,2,250,4,4,1,1,1,'2020-10-01 01:32:23',NULL,NULL),(4,1,1,1,1,750,10,10,1,1,1,'2020-10-07 17:36:40',1,'2020-10-09 15:22:34');
/*!40000 ALTER TABLE `cfsyardratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `container` (
  `containerId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `weightType` int DEFAULT NULL,
  `numberOfTrucks` int DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (35,1000007,3,3,3,0,1,'2020-11-09 20:53:56',1,'2020-11-09 20:53:56'),(36,1000008,1,2,1,0,1,'2020-11-10 17:44:26',1,'2020-11-10 17:44:26'),(37,1000008,2,2,2,0,1,'2020-11-10 17:44:26',1,'2020-11-10 17:44:26');
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containermaster`
--

DROP TABLE IF EXISTS `containermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `containermaster` (
  `containerMasterId` int NOT NULL AUTO_INCREMENT,
  `containerMasterName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(30) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`containerMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containermaster`
--

LOCK TABLES `containermaster` WRITE;
/*!40000 ALTER TABLE `containermaster` DISABLE KEYS */;
INSERT INTO `containermaster` VALUES (1,'10 FT',1,1,'2020-08-30 07:35:17',1,'2020-10-25 2:49:01 am'),(2,'20 FT',1,1,'2020-08-30 07:35:34',1,'2020-08-30 07:35:34'),(3,'40FT',1,8,'2020-08-31 19:26:46',8,'2020-08-31 19:26:46');
/*!40000 ALTER TABLE `containermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieselratemaster`
--

DROP TABLE IF EXISTS `dieselratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieselratemaster` (
  `dieselRateId` int NOT NULL AUTO_INCREMENT,
  `dieselRate` int DEFAULT NULL,
  `dieselRateDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`dieselRateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieselratemaster`
--

LOCK TABLES `dieselratemaster` WRITE;
/*!40000 ALTER TABLE `dieselratemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `dieselratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driverId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(512) DEFAULT NULL,
  `lastname` varchar(512) DEFAULT NULL,
  `emailId` varchar(512) DEFAULT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `userPassword` varchar(512) DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `identitytype` int DEFAULT NULL,
  `identitynumber` varchar(512) DEFAULT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`driverId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Driver','ALC','driver@alc.in','7894561230','123456789',1,1,'410254','Add1','Add2','Landmark',1,4,'425252',6,'2020-08-31 19:22:30',6,'2020-08-31 19:22:30',7),(2,'Driver2','Driver','driver2@alc.in','8877445563','123456789',1,1,'447445','Add1','Add2','LandMark',1,1,'1123547865',5,'2020-09-20 19:52:36',5,'2020-09-20 19:52:36',11),(3,'Driver','Last','driver@alctransporter.in','8897456210','11111111',1,1,'411258','Add1','Add2','Land Mark',1,4,'1257455',1,'2020-10-02 14:07:51',1,'2020-10-02 14:07:51',NULL),(4,'Driver10','ALC','driver10@alc.in','8874512036',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,20,'2020-10-02 13:44:23',NULL,NULL,20);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivertransportermapping`
--

DROP TABLE IF EXISTS `drivertransportermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivertransportermapping` (
  `drivertransportermappingId` int NOT NULL AUTO_INCREMENT,
  `driverId` int NOT NULL,
  `userId` int NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`drivertransportermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivertransportermapping`
--

LOCK TABLES `drivertransportermapping` WRITE;
/*!40000 ALTER TABLE `drivertransportermapping` DISABLE KEYS */;
INSERT INTO `drivertransportermapping` VALUES (1,7,6,6,'2020-08-31 19:22:30',NULL,NULL),(2,11,5,5,'2020-09-20 19:52:36',NULL,NULL),(3,13,5,5,'2020-09-23 14:27:19',NULL,NULL);
/*!40000 ALTER TABLE `drivertransportermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationmaster`
--

DROP TABLE IF EXISTS `locationmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationmaster` (
  `locationMasterId` int NOT NULL AUTO_INCREMENT,
  `locationName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(512) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(512) DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  PRIMARY KEY (`locationMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationmaster`
--

LOCK TABLES `locationmaster` WRITE;
/*!40000 ALTER TABLE `locationmaster` DISABLE KEYS */;
INSERT INTO `locationmaster` VALUES (1,'Mumbai',1,1,'2020-08-30 07:19:33',NULL,NULL,1),(2,'Civil Line',1,8,'2020-08-31 19:27:40',NULL,NULL,2),(3,'Pune',1,1,'2020-09-12 07:42:02',NULL,NULL,1),(4,'New Location',1,NULL,NULL,1,'2020-10-24 1:27:41 am',9),(5,'New2',1,1,'2020-10-24 1:23:48 am',NULL,NULL,9),(6,'Test',0,1,'2020-10-24 1:33:14 am',1,'2020-10-24 1:43:34 am',5);
/*!40000 ALTER TABLE `locationmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mastertype`
--

DROP TABLE IF EXISTS `mastertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mastertype` (
  `masterTypeId` int NOT NULL AUTO_INCREMENT,
  `masterType` varchar(512) DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`masterTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mastertype`
--

LOCK TABLES `mastertype` WRITE;
/*!40000 ALTER TABLE `mastertype` DISABLE KEYS */;
INSERT INTO `mastertype` VALUES (1,'cfsToyard','CFS','YARD'),(2,'cfsToport','CFS','PORT'),(3,'yardTocfs','YARD','CFS'),(4,'portTocfs','PORT','CFS');
/*!40000 ALTER TABLE `mastertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mileagemaster`
--

DROP TABLE IF EXISTS `mileagemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mileagemaster` (
  `mileageId` int NOT NULL AUTO_INCREMENT,
  `containerId` int DEFAULT NULL,
  `weightId` int DEFAULT NULL,
  `mileage` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`mileageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mileagemaster`
--

LOCK TABLES `mileagemaster` WRITE;
/*!40000 ALTER TABLE `mileagemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `mileagemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notificationId` int NOT NULL AUTO_INCREMENT,
  `notificationType` varchar(512) DEFAULT NULL,
  `notificationDesc` varchar(512) DEFAULT NULL,
  `orderId` int NOT NULL,
  `bidId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `assignedToRole` int DEFAULT NULL,
  `assignedToUser` int DEFAULT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS User CFS User placed a new Order on 2020-09-01!',2,NULL,4,'2020-08-31 19:08:48',0,1,NULL),(2,'orders','Transporter ALC confirmed a bid on 2020-09-01!',1,NULL,5,'2020-08-31 19:11:07',0,1,NULL),(3,'orders','Transporter ALC confirmed a bid on 2020-09-01!',1,NULL,5,'2020-08-31 19:11:14',0,1,NULL),(4,'orders','Transporter2 ALC confirmed a bid on 2020-09-01!',1,NULL,6,'2020-08-31 19:13:03',0,1,NULL),(5,'orders','Transporter2 ALC confirmed a bid on 2020-09-01!',1,NULL,6,'2020-08-31 19:13:07',0,1,NULL),(6,'orders','Gaurav CFS Super Admin Gaurav CFS Super Admin placed a new Order on 2020-09-01!',3,NULL,9,'2020-08-31 20:40:03',0,1,NULL),(7,'orders','undefined placed a new Order on 2020-09-20!',4,NULL,9,'2020-09-20 06:27:12',0,1,NULL),(8,'orders','undefined placed a new Order on 2020-09-21!',5,NULL,9,'2020-09-20 18:49:53',0,1,NULL),(9,'orders','undefined placed a new Order on 2020-09-21!',6,NULL,9,'2020-09-20 19:08:46',0,1,NULL),(10,'orders','Transporter ALC confirmed a bid on 2020-09-21!',1,NULL,5,'2020-09-20 19:11:05',0,1,NULL),(11,'orders','Transporter ALC confirmed a bid on 2020-09-21!',1,NULL,5,'2020-09-20 19:11:18',0,1,NULL),(12,'orders','Transporter2 ALC confirmed a bid on 2020-09-21!',1,NULL,6,'2020-09-20 19:13:21',0,1,NULL),(13,'orders','Transporter ALC confirmed a bid on 2020-09-21!',1,NULL,5,'2020-09-20 19:33:58',0,1,NULL),(14,'orders','Transporter2 ALC confirmed a bid on 2020-09-21!',1,NULL,6,'2020-09-20 19:34:28',0,1,NULL),(15,'orders','undefined placed a new Order on 2020-09-25!',7,NULL,9,'2020-09-24 20:34:26',0,1,NULL),(16,'orders','undefined placed a new Order on 2020-09-26!',8,NULL,9,'2020-09-25 21:38:52',0,1,NULL),(17,'orders','Transporter ALC confirmed a bid on 2020-09-26!',1,NULL,5,'2020-09-26 15:11:23',0,1,NULL),(18,'orders','Transporter ALC confirmed a bid on 2020-09-26!',1,NULL,5,'2020-09-26 15:15:41',0,1,NULL),(19,'orders','undefined placed a new Order on 2020-09-27!',9,NULL,12,'2020-09-26 18:40:23',0,1,NULL),(20,'orders','Transporter ALC confirmed a bid on 2020-09-27!',1,NULL,5,'2020-09-26 18:43:28',0,1,NULL),(21,'orders','Transporter2 ALC confirmed a bid on 2020-09-27!',1,NULL,6,'2020-09-26 18:56:28',0,1,NULL),(22,'orders','Transporter2 ALC confirmed a bid on 2020-09-27!',1,NULL,6,'2020-09-26 18:59:07',0,1,NULL),(23,'orders','Transporter2 ALC confirmed a bid on 2020-09-27!',1,NULL,6,'2020-09-26 19:08:45',0,1,NULL),(24,'orders','Transporter2 ALC confirmed a bid on 2020-09-27!',1,NULL,6,'2020-09-26 19:10:04',0,1,NULL),(25,'orders','Transporter ALC confirmed a bid on 2020-09-27!',1,NULL,5,'2020-09-26 19:27:27',0,1,NULL),(26,'orders','Transporter2 ALC confirmed a bid on 2020-09-27!',1,NULL,6,'2020-09-26 19:30:05',0,1,NULL),(27,'orders','undefined placed a new Order on 2020-09-28!',10,NULL,12,'2020-09-28 16:37:16',0,1,NULL),(28,'orders','Transporter ALC confirmed a bid on 2020-09-28!',1,NULL,5,'2020-09-28 16:38:34',0,1,NULL),(29,'orders','Transporter2 ALC confirmed a bid on 2020-09-28!',1,NULL,6,'2020-09-28 16:39:16',0,1,NULL),(30,'orders','undefined placed a new Order on 2020-10-08!',11,NULL,9,'2020-10-07 19:44:49',0,1,NULL),(31,'orders','undefined placed a new Order on 2020-10-09!',12,NULL,9,'2020-10-09 04:54:56',0,1,NULL),(32,'orders','undefined placed a new Order on 2020-10-09!',13,NULL,9,'2020-10-09 13:29:18',0,1,NULL),(33,'orders','undefined placed a new Order on 2020-10-09!',14,NULL,9,'2020-10-09 13:32:59',0,1,NULL),(34,'orders','undefined placed a new Order on 2020-10-09!',15,NULL,9,'2020-10-09 13:36:32',0,1,NULL),(35,'orders','undefined placed a new Order on 2020-10-09!',16,NULL,9,'2020-10-09 13:39:29',0,1,NULL),(36,'orders','undefined placed a new Order on 2020-10-09!',17,NULL,9,'2020-10-09 13:40:35',0,1,NULL),(37,'orders','undefined placed a new Order on 2020-10-28!',18,NULL,9,'2020-10-27 19:10:34',0,1,NULL),(38,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-27 19:11:44',0,1,NULL),(39,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-27 19:12:11',0,1,NULL),(40,'orders','undefined placed a new Order on 2020-10-28!',19,NULL,9,'2020-10-28 16:43:44',0,1,NULL),(41,'orders','undefined placed a new Order on 2020-10-28!',20,NULL,9,'2020-10-28 16:44:42',0,1,NULL),(42,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:46:54',0,1,NULL),(43,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:47:02',0,1,NULL),(44,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:47:11',0,1,NULL),(45,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:47:17',0,1,NULL),(46,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:47:27',0,1,NULL),(47,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:48:46',0,1,NULL),(48,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:49:05',0,1,NULL),(49,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 16:49:12',0,1,NULL),(50,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 16:50:33',0,1,NULL),(51,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 16:50:44',0,1,NULL),(52,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 16:50:50',0,1,NULL),(53,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 16:52:06',0,1,NULL),(54,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 16:52:44',0,1,NULL),(55,'orders','undefined placed a new Order on 2020-10-28!',21,NULL,9,'2020-10-28 17:13:55',0,1,NULL),(56,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 17:14:51',0,1,NULL),(57,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 17:15:01',0,1,NULL),(58,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 17:15:12',0,1,NULL),(59,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 17:16:02',0,1,NULL),(60,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 17:16:13',0,1,NULL),(61,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 17:16:24',0,1,NULL),(62,'orders','undefined placed a new Order on 2020-10-28!',22,NULL,4,'2020-10-28 17:19:39',0,1,NULL),(63,'orders','undefined placed a new Order on 2020-10-28!',23,NULL,4,'2020-10-28 17:53:50',0,1,NULL),(64,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 17:56:28',0,1,NULL),(65,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 17:57:17',0,1,NULL),(66,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 17:58:05',0,1,NULL),(67,'orders','Transporter2 ALC confirmed a bid on 2020-10-28!',1,NULL,6,'2020-10-28 17:58:23',0,1,NULL),(68,'orders','Transporter Third confirmed a bid on 2020-10-28!',1,NULL,15,'2020-10-28 18:04:13',0,1,NULL),(69,'orders','Transporter Third confirmed a bid on 2020-10-28!',1,NULL,15,'2020-10-28 18:04:19',0,1,NULL),(70,'orders','Transporter Third confirmed a bid on 2020-10-28!',1,NULL,15,'2020-10-28 18:05:31',0,1,NULL),(71,'orders','Transporter Third confirmed a bid on 2020-10-28!',1,NULL,15,'2020-10-28 18:05:36',0,1,NULL),(72,'orders','Transporter Third confirmed a bid on 2020-10-28!',1,NULL,15,'2020-10-28 18:05:39',0,1,NULL),(73,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 18:12:03',0,1,NULL),(74,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 18:12:11',0,1,NULL),(75,'orders','Transporter ALC confirmed a bid on 2020-10-28!',1,NULL,5,'2020-10-28 18:12:17',0,1,NULL),(76,'orders','undefined placed a new Order on 2020-11-03!',1000000,NULL,9,'2020-11-03 17:12:45',0,1,NULL),(77,'orders','undefined placed a new Order on 2020-11-03!',1000001,NULL,9,'2020-11-03 18:17:45',0,1,NULL),(78,'orders','undefined placed a new Order on 2020-11-03!',1000002,NULL,9,'2020-11-03 18:19:12',0,1,NULL),(79,'orders','undefined placed a new Order on 2020-11-03!',1000003,NULL,9,'2020-11-03 18:25:10',0,1,NULL),(80,'orders','undefined placed a new Order on 2020-11-03!',1000004,NULL,9,'2020-11-03 18:26:09',0,1,NULL),(81,'orders','undefined placed a new Order on 2020-11-03!',1000005,NULL,9,'2020-11-03 18:26:58',0,1,NULL),(82,'orders','Transporter ALC confirmed a bid on 2020-11-04!',1,NULL,5,'2020-11-03 19:38:32',0,1,NULL),(83,'orders','Transporter ALC confirmed a bid on 2020-11-04!',1,NULL,5,'2020-11-03 19:38:42',0,1,NULL),(84,'orders','Transporter ALC confirmed a bid on 2020-11-04!',1,NULL,5,'2020-11-03 19:40:04',0,1,NULL),(85,'orders','Transporter2 ALC confirmed a bid on 2020-11-04!',1,NULL,6,'2020-11-03 19:44:21',0,1,NULL),(86,'orders','Transporter2 ALC confirmed a bid on 2020-11-04!',1,NULL,6,'2020-11-03 19:46:29',0,1,NULL),(87,'orders','Transporter2 ALC confirmed a bid on 2020-11-04!',1,NULL,6,'2020-11-03 19:46:54',0,1,NULL),(88,'orders','undefined placed a new Order on 2020-11-08!',1000006,NULL,9,'2020-11-08 08:08:31',0,1,NULL),(89,'orders','New Transporter confirmed a bid on 2020-11-08!',1,NULL,21,'2020-11-08 09:25:35',0,1,NULL),(90,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:06:29',0,1,NULL),(91,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:06:37',0,1,NULL),(92,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:06:43',0,1,NULL),(93,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:06:56',0,1,NULL),(94,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:14:28',0,1,NULL),(95,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:15:39',0,1,NULL),(96,'orders','Transporter Third confirmed a bid on 2020-11-09!',1,NULL,15,'2020-11-09 07:31:09',0,1,NULL),(97,'orders','undefined placed a new Order on 2020-11-10!',1000007,NULL,9,'2020-11-09 20:53:57',0,1,NULL),(98,'orders','New Transporter confirmed a bid on 2020-11-10!',1,NULL,21,'2020-11-09 20:54:30',0,1,NULL),(99,'orders','New Transporter confirmed a bid on 2020-11-10!',1,NULL,21,'2020-11-09 20:54:37',0,1,NULL),(100,'orders','New Transporter confirmed a bid on 2020-11-10!',1,NULL,21,'2020-11-09 20:54:43',0,1,NULL),(101,'orders','Transporter Third confirmed a bid on 2020-11-10!',1,NULL,15,'2020-11-09 20:55:14',0,1,NULL),(102,'orders','Transporter Third confirmed a bid on 2020-11-10!',1,NULL,15,'2020-11-09 20:55:21',0,1,NULL),(103,'orders','Transporter Third confirmed a bid on 2020-11-10!',1,NULL,15,'2020-11-09 20:55:29',0,1,NULL),(104,'orders','undefined placed a new Order on 2020-11-10!',1000008,NULL,10,'2020-11-10 17:44:27',0,1,NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderTypeId` int DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `masterTypeId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  `orderRemarks` varchar(512) DEFAULT NULL,
  `orderAddress` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `orderStatus` varchar(512) DEFAULT NULL,
  `orderStatusId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `totalRate` int DEFAULT NULL,
  `profitRate` int DEFAULT NULL,
  `portTerminalId` int DEFAULT NULL,
  `profitMarginPercentage` int DEFAULT NULL,
  `rateExcludingProfit` int DEFAULT NULL,
  `timeslotMasterId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=1000009 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1000007,1,'2020-11-19 03:00:00',1,2,2,'CFS','YARD','19 Nov 2020 3 am - 4 am','',0,0,'ORDER_ACCEPTED',6,9,'2020-11-10 02:23:56',9,'2020-11-09 20:53:56',2700,270,0,0,2430,4),(1000008,2,'2020-11-12 05:00:00',2,1,1,'CFS','PORT','12 Nov 5 AM 6 AM','',0,0,'ORDER_ACCEPTED',6,10,'2020-11-10 23:14:26',10,'2020-11-10 17:44:26',1100,73,1,0,1027,6);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permissionId` int NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'admindashboardFull',NULL,NULL,NULL,NULL,1),(2,'admindashboardRead',NULL,NULL,NULL,NULL,1),(3,'admindashboardWrite',NULL,NULL,NULL,NULL,1),(4,'cfsFull',NULL,NULL,NULL,NULL,1),(5,'cfsRead',NULL,NULL,NULL,NULL,1),(6,'cfsWrite',NULL,NULL,NULL,NULL,1),(7,'cfscreateOrderFull',NULL,NULL,NULL,NULL,1),(8,'cfscreateOrderRead',NULL,NULL,NULL,NULL,1),(9,'cfscreateOrderWrite',NULL,NULL,NULL,NULL,1),(10,'cfslistOrderFull',NULL,NULL,NULL,NULL,1),(11,'cfslistOrderRead',NULL,NULL,NULL,NULL,1),(12,'cfslistOrderWrite',NULL,NULL,NULL,NULL,1),(13,'cfsuserRegistrationFull',NULL,NULL,NULL,NULL,1),(14,'cfsuserRegistrationRead',NULL,NULL,NULL,NULL,1),(15,'cfsuserRegistrationWrite',NULL,NULL,NULL,NULL,1),(16,'cfsuserListFull',NULL,NULL,NULL,NULL,1),(17,'cfsuserListRead',NULL,NULL,NULL,NULL,1),(18,'cfsuserListWrite',NULL,NULL,NULL,NULL,1),(19,'transporterFull',NULL,NULL,NULL,NULL,1),(20,'transporterRead',NULL,NULL,NULL,NULL,1),(21,'transporterWrite',NULL,NULL,NULL,NULL,1),(22,'transporterbidsFull',NULL,NULL,NULL,NULL,1),(23,'transporterbidsRead',NULL,NULL,NULL,NULL,1),(24,'transporterbidsWrite',NULL,NULL,NULL,NULL,1),(25,'transportervehicleRegistrationFull',NULL,NULL,NULL,NULL,1),(26,'transportervehicleRegistrationRead',NULL,NULL,NULL,NULL,1),(27,'transportervehicleRegistrationWrite',NULL,NULL,NULL,NULL,1),(28,'transportervehicleListFull',NULL,NULL,NULL,NULL,1),(29,'transportervehicleListRead',NULL,NULL,NULL,NULL,1),(30,'transportervehicleListWrite',NULL,NULL,NULL,NULL,1),(31,'transporterRegistrationFull',NULL,NULL,NULL,NULL,1),(32,'transporterRegistrationRead',NULL,NULL,NULL,NULL,1),(33,'transporterRegistrationWrite',NULL,NULL,NULL,NULL,1),(34,'transportertransporterListFull',NULL,NULL,NULL,NULL,1),(35,'transporterListRead',NULL,NULL,NULL,NULL,1),(36,'transporterListWrite',NULL,NULL,NULL,NULL,1),(37,'transporterdriverRegistrationFull',NULL,NULL,NULL,NULL,1),(38,'transporterdriverRegistrationRead',NULL,NULL,NULL,NULL,1),(39,'transporterdriverRegistrationWrite',NULL,NULL,NULL,NULL,1),(40,'adminmastersFull',NULL,NULL,NULL,NULL,1),(41,'adminmastersRead',NULL,NULL,NULL,NULL,1),(42,'adminmastersWrite',NULL,NULL,NULL,NULL,1),(43,'admincfsMasterFull',NULL,NULL,NULL,NULL,1),(44,'admincfsMasterRead',NULL,NULL,NULL,NULL,1),(45,'admincfsMasterWrite',NULL,NULL,NULL,NULL,1),(46,'admincontainerMasterFull',NULL,NULL,NULL,NULL,1),(47,'admincontainerMasterRead',NULL,NULL,NULL,NULL,1),(48,'admincontainerMasterWrite',NULL,NULL,NULL,NULL,1),(49,'admincfsRateMasterFull',NULL,NULL,NULL,NULL,1),(50,'admincfsRateMasterRead',NULL,NULL,NULL,NULL,1),(51,'admincfsRateMasterWrite',NULL,NULL,NULL,NULL,1),(52,'admindieselMasterFull',NULL,NULL,NULL,NULL,1),(53,'admindieselMasterRead',NULL,NULL,NULL,NULL,1),(54,'admindieselMasterWrite',NULL,NULL,NULL,NULL,1),(55,'adminlocationMasterFull',NULL,NULL,NULL,NULL,1),(56,'adminlocationMasterRead',NULL,NULL,NULL,NULL,1),(57,'adminlocationMasterWrite',NULL,NULL,NULL,NULL,1),(58,'adminmileageMasterFull',NULL,NULL,NULL,NULL,1),(59,'adminmileageMasterWrite',NULL,NULL,NULL,NULL,1),(60,'adminmileageMasterRead',NULL,NULL,NULL,NULL,1),(61,'adminportMasterFull',NULL,NULL,NULL,NULL,1),(62,'adminportMasterRead',NULL,NULL,NULL,NULL,1),(63,'adminportMasterWrite',NULL,NULL,NULL,NULL,1),(64,'adminportTerminalMasterFull',NULL,NULL,NULL,NULL,1),(65,'adminportTerminalMasterRead',NULL,NULL,NULL,NULL,1),(66,'adminportTerminalMasterWrite',NULL,NULL,NULL,NULL,1),(67,'adminstateMasterFull',NULL,NULL,NULL,NULL,1),(68,'adminstateMasterRead',NULL,NULL,NULL,NULL,1),(69,'adminstateMasterWrite',NULL,NULL,NULL,NULL,1),(70,'adminweightMasterFull',NULL,NULL,NULL,NULL,1),(71,'adminweightMasterRead',NULL,NULL,NULL,NULL,1),(72,'adminweightMasterWrite',NULL,NULL,NULL,NULL,1),(73,'adminyardMasterFull',NULL,NULL,NULL,NULL,1),(74,'adminyardMasterRead',NULL,NULL,NULL,NULL,1),(75,'adminyardMasterWrite',NULL,NULL,NULL,NULL,1),(76,'adminyardCFSRateMasterFull',NULL,NULL,NULL,NULL,1),(77,'adminyardCFSRateMasterRead',NULL,NULL,NULL,NULL,1),(78,'adminyardCFSRateMasterWrite',NULL,NULL,NULL,NULL,1),(79,'adminzoneMasterFull',NULL,NULL,NULL,NULL,1),(80,'adminzoneMasterRead',NULL,NULL,NULL,NULL,1),(81,'adminzoneMasterWrite',NULL,NULL,NULL,NULL,1),(82,'adminzoneDayMasterFull',NULL,NULL,NULL,NULL,1),(83,'adminzoneDayMasterRead',NULL,NULL,NULL,NULL,1),(84,'adminzoneDayMasterWrite',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionrolemapping`
--

DROP TABLE IF EXISTS `permissionrolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissionrolemapping` (
  `permissionroleId` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `roleId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`permissionroleId`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionrolemapping`
--

LOCK TABLES `permissionrolemapping` WRITE;
/*!40000 ALTER TABLE `permissionrolemapping` DISABLE KEYS */;
INSERT INTO `permissionrolemapping` VALUES (1,1,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(2,2,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(3,3,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(4,4,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(5,5,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(6,6,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(7,7,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(8,8,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(9,9,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(10,10,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(11,11,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(12,12,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(13,13,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(14,14,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(15,15,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(16,16,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(17,17,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(18,18,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(19,19,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(20,20,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(21,21,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(22,22,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(23,23,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(24,24,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(25,25,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(26,26,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(27,27,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(28,28,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(29,29,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(30,30,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(31,31,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(32,32,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(33,33,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(34,34,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(35,35,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(36,36,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(37,37,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(38,38,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(39,39,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(40,40,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(41,41,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(42,42,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(43,43,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(44,44,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(45,45,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(46,46,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(47,47,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(48,48,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(49,49,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(50,50,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(51,51,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(52,52,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(53,53,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(54,54,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(55,55,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(56,56,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(57,57,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(58,58,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(59,59,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(60,60,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(61,61,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(62,62,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(63,63,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(64,64,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(65,65,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(66,66,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(67,67,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(68,68,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(69,69,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(70,70,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(71,71,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(72,72,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(73,73,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(74,74,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(75,75,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(76,76,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(77,77,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(78,78,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(79,79,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(80,80,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(81,81,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(82,82,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(83,83,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(84,84,1,1,0,'0000-00-00 00:00:00',NULL,NULL),(85,4,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(86,5,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(87,6,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(88,7,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(89,8,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(90,9,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(91,10,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(92,11,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(93,12,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(94,13,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(95,14,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(96,15,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(97,16,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(98,17,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(99,18,4,1,0,'0000-00-00 00:00:00',NULL,NULL),(100,19,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(101,20,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(102,21,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(103,22,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(104,23,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(105,24,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(106,25,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(107,26,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(108,27,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(109,28,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(110,29,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(111,30,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(112,31,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(113,32,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(114,33,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(115,34,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(116,35,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(117,36,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(118,37,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(119,38,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(120,39,5,1,0,'0000-00-00 00:00:00',NULL,NULL),(121,1,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(122,2,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(123,3,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(124,40,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(125,41,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(126,42,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(127,43,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(128,44,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(129,45,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(130,46,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(131,47,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(132,48,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(133,49,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(134,50,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(135,51,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(136,52,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(137,53,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(138,54,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(139,55,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(140,56,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(141,57,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(142,58,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(143,59,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(144,60,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(145,61,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(146,62,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(147,63,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(148,64,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(149,65,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(150,66,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(151,67,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(152,68,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(153,69,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(154,70,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(155,71,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(156,72,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(157,73,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(158,74,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(159,75,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(160,76,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(161,77,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(162,78,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(163,79,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(164,80,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(165,81,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(166,82,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(167,83,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(168,84,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(169,4,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(170,5,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(171,6,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(172,7,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(173,8,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(174,9,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(175,10,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(176,11,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(177,12,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(178,13,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(179,14,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(180,15,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(181,16,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(182,17,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(183,18,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(184,19,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(185,20,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(186,21,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(187,22,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(188,23,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(189,24,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(190,25,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(191,26,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(192,27,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(193,28,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(194,29,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(195,30,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(196,31,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(197,32,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(198,33,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(199,34,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(200,35,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(201,36,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(202,37,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(203,38,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(204,39,10,0,1,'2020-10-04 18:03:46',NULL,NULL),(248,1,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(249,2,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(250,3,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(251,40,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(252,41,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(253,42,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(254,43,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(255,44,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(256,45,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(257,46,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(258,47,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(259,48,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(260,49,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(261,50,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(262,51,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(263,52,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(264,53,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(265,54,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(266,55,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(267,56,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(268,57,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(269,58,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(270,59,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(271,60,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(272,61,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(273,62,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(274,63,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(275,64,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(276,65,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(277,66,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(278,67,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(279,68,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(280,69,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(281,70,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(282,71,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(283,72,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(284,73,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(285,74,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(286,75,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(287,76,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(288,77,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(289,78,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(290,79,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(291,80,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(292,81,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(293,82,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(294,83,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(295,84,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(296,4,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(297,5,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(298,6,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(299,7,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(300,8,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(301,9,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(302,10,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(303,11,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(304,12,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(305,13,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(306,14,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(307,15,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(308,16,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(309,17,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(310,18,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(311,19,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(312,20,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(313,21,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(314,22,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(315,23,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(316,24,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(317,25,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(318,26,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(319,27,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(320,28,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(321,29,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(322,30,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(323,31,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(324,32,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(325,33,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(326,34,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(327,35,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(328,36,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(329,37,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(330,38,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(331,39,16,1,1,'2020-10-06 00:33:38',NULL,NULL),(375,1,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(376,2,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(377,3,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(378,40,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(379,41,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(380,42,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(381,43,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(382,44,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(383,45,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(384,46,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(385,47,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(386,48,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(387,49,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(388,50,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(389,51,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(390,52,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(391,53,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(392,54,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(393,55,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(394,56,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(395,57,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(396,58,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(397,59,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(398,60,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(399,61,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(400,62,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(401,63,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(402,64,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(403,65,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(404,66,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(405,67,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(406,68,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(407,69,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(408,70,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(409,71,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(410,72,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(411,73,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(412,74,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(413,75,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(414,76,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(415,77,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(416,78,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(417,79,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(418,80,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(419,81,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(420,82,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(421,83,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(422,84,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(423,4,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(424,5,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(425,6,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(426,7,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(427,8,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(428,9,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(429,10,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(430,11,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(431,12,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(432,13,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(433,14,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(434,15,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(435,16,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(436,17,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(437,18,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(438,19,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(439,20,21,0,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(440,21,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(441,22,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(442,23,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(443,24,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(444,25,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(445,26,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(446,27,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(447,28,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(448,29,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(449,30,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(450,31,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(451,32,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(452,33,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(453,34,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(454,35,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(455,36,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(456,37,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(457,38,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31'),(458,39,21,1,1,'2020-10-06 00:53:49',1,'2020-10-06 01:51:31');
/*!40000 ALTER TABLE `permissionrolemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portcfsratemaster`
--

DROP TABLE IF EXISTS `portcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portcfsratemaster` (
  `portCfsRateMasterId` int NOT NULL AUTO_INCREMENT,
  `portMasterId` int NOT NULL,
  `cfsMasterId` int NOT NULL,
  `weightMasterId` int NOT NULL,
  `rate` int NOT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` varchar(30) NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  `containerMasterId` int NOT NULL,
  PRIMARY KEY (`portCfsRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portcfsratemaster`
--

LOCK TABLES `portcfsratemaster` WRITE;
/*!40000 ALTER TABLE `portcfsratemaster` DISABLE KEYS */;
INSERT INTO `portcfsratemaster` VALUES (1,1,1,1,400,15,11,1,1,'2020-10-07 17:33:01',1,'2020-10-07 17:33:01',1),(2,1,1,2,230,3,3,1,1,'2020-10-05 18:38:51',NULL,NULL,2);
/*!40000 ALTER TABLE `portcfsratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portmaster`
--

DROP TABLE IF EXISTS `portmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portmaster` (
  `portMasterId` int NOT NULL AUTO_INCREMENT,
  `portName` varchar(512) DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(512) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`portMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (1,'JNPT',1,1,'add1','Add2','Port area','412457','Utsav','5522334789',1,1,'2020-08-30 07:20:23',1,'2020-08-30 07:20:23','41252','553266'),(2,'CH Port',2,2,'ad1','add2','landmark','412014','Gaurav','8974562130',1,8,'2020-08-31 19:28:33',8,'2020-08-31 19:28:33','144545','544515'),(3,'Pune Port',1,3,'add1','','','477856','Gaurav','8896547123',1,1,'2020-09-12 07:42:59',1,'2020-10-24 2:12:13 am','55653',''),(4,'test',5,6,'add1','','','478957','test','458478858',0,1,'2020-10-24 2:05:38 am',1,'2020-10-24 2:08:17 am','','');
/*!40000 ALTER TABLE `portmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portterminalmaster`
--

DROP TABLE IF EXISTS `portterminalmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portterminalmaster` (
  `portTerminalId` int NOT NULL AUTO_INCREMENT,
  `portMasterId` int DEFAULT NULL,
  `terminal` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(512) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`portTerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
INSERT INTO `portterminalmaster` VALUES (1,1,'Terminal1','4444554777','555525',1,'2020-09-12 09:07:01',1,'2020-09-12 09:07:01',1),(2,2,'CH Terminal','54545616','564561321',8,'2020-08-31 19:28:59',8,'2020-08-31 19:28:59',1),(4,2,'test','444','555',1,'2020-10-25 12:20:36 am',1,'2020-10-25 12:23:31 am',0);
/*!40000 ALTER TABLE `portterminalmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `settingsId` int NOT NULL AUTO_INCREMENT,
  `settingsName` varchar(512) DEFAULT NULL,
  `settingsValue` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`settingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'New Setting','10',1),(2,'TotalBids','3',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statemaster`
--

DROP TABLE IF EXISTS `statemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statemaster` (
  `stateMasterId` int NOT NULL AUTO_INCREMENT,
  `stateName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(512) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`stateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemaster`
--

LOCK TABLES `statemaster` WRITE;
/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
INSERT INTO `statemaster` VALUES (1,'Maharashtra',1,NULL,NULL,NULL,NULL),(3,'Chandigrah',0,NULL,NULL,NULL,NULL),(4,'Goa',0,NULL,NULL,NULL,NULL),(5,'Gujarat',1,NULL,NULL,1,'Tue Oct 20 2020 01:26:34 GMT+0530 (India Standard Time)'),(6,'Rajasthan',1,NULL,NULL,1,'2020-10-19T19:59:20.219Z'),(7,'Tamilnadu',1,NULL,NULL,1,'2020-10-20 1:57:45 am'),(8,'MadhyaPradesh',0,1,'2020-10-20 2:00:16 am',1,'2020-10-24 12:36:50 am'),(9,'Daman',1,1,'2020-10-24 12:39:10 am',NULL,NULL);
/*!40000 ALTER TABLE `statemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusdetails`
--

DROP TABLE IF EXISTS `statusdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusdetails` (
  `statusDetailsId` int NOT NULL AUTO_INCREMENT,
  `statusMasterId` int NOT NULL,
  `statusDetailsName` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`statusDetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusdetails`
--

LOCK TABLES `statusdetails` WRITE;
/*!40000 ALTER TABLE `statusdetails` DISABLE KEYS */;
INSERT INTO `statusdetails` VALUES (1,1,'BID_PENDING',1,1,'2020-08-06 00:00:00',NULL,NULL),(2,1,'BID_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(3,1,'BID_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(4,2,'BID_USER_EDIT',1,1,'2020-08-06 00:00:00',NULL,NULL),(5,2,'BID_USER_CONFIRMED',1,1,'2020-08-06 00:00:00',NULL,NULL),(6,3,'ORDER_ACCEPTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(7,3,'ORDER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(8,3,'ORDER_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(9,3,'ORDER_DELIVERED',1,1,'2020-08-06 00:00:00',NULL,NULL),(10,3,'ORDER_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(11,4,'SUB_ORDER_PENDING',1,1,'2020-08-06 00:00:00',NULL,NULL),(12,4,'SUB_ORDER_BID_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(13,4,'SUB_ORDER_TRIP_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(14,4,'SUB_ORDER_TRIP_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(15,4,'SUB_ORDER_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(16,5,'TRIP_TRANSPORTER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(17,5,'TRIP_DRIVER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(18,5,'TRIP_VEHICLE_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(19,5,'TRIP_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(20,5,'TRIP_COMPLETED',1,1,'2020-08-07 00:00:00',NULL,NULL),(21,5,'TRIP_DRIVER_VEHICLE_ASSIGNED',1,1,'2020-08-07 00:00:00',NULL,NULL),(22,2,'BID_USER_DISCARD',1,1,'2020-08-07 00:00:00',NULL,NULL),(23,5,'TRIP_DISCARD_ADMIN',1,1,'2020-11-10 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `statusdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusmaster`
--

DROP TABLE IF EXISTS `statusmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statusmaster` (
  `statusMasterId` int NOT NULL AUTO_INCREMENT,
  `statusMasterName` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`statusMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusmaster`
--

LOCK TABLES `statusmaster` WRITE;
/*!40000 ALTER TABLE `statusmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `statusmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suborder`
--

DROP TABLE IF EXISTS `suborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suborder` (
  `subOrderId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `subOrderTotal` int DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `cotainerId` int DEFAULT NULL,
  `containerType` varchar(512) DEFAULT NULL,
  `containerWeightType` int DEFAULT NULL,
  `subOrderTotalMargin` int DEFAULT NULL,
  `marginPercent` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `suborderStatus` varchar(512) DEFAULT NULL,
  `suborderStatusId` int DEFAULT NULL,
  `bidLimit` int DEFAULT NULL,
  `subOrderSeq` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
INSERT INTO `suborder` VALUES (100,1000007,900,0,9,'2020-11-10 02:23:56',0,NULL,35,'3',3,810,0,NULL,'SUB_ORDER_BID_ASSIGNED',12,18,'1000007001'),(101,1000007,900,0,9,'2020-11-10 02:23:56',0,NULL,35,'3',3,810,0,NULL,'SUB_ORDER_PENDING',11,18,'1000007002'),(102,1000007,900,0,9,'2020-11-10 02:23:56',0,NULL,35,'3',3,810,0,NULL,'SUB_ORDER_PENDING',11,18,'1000007003'),(103,1000008,300,0,10,'2020-11-10 23:14:26',0,NULL,36,'1',1,276,0,NULL,'SUB_ORDER_PENDING',11,5,'1000008001'),(104,1000008,300,0,10,'2020-11-10 23:14:26',0,NULL,36,'1',1,276,0,NULL,'SUB_ORDER_PENDING',11,5,'1000008002'),(105,1000008,250,0,10,'2020-11-10 23:14:26',0,NULL,37,'2',2,238,0,NULL,'SUB_ORDER_PENDING',11,5,'1000008003'),(106,1000008,250,0,10,'2020-11-10 23:14:26',0,NULL,37,'2',2,238,0,NULL,'SUB_ORDER_PENDING',11,5,'1000008004');
/*!40000 ALTER TABLE `suborder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_update`
--

DROP TABLE IF EXISTS `tbl_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_update` (
  `bidMarginRate` int DEFAULT NULL,
  `cfsMasterId` int DEFAULT NULL,
  `cfsYardRateMasterId` int DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `containerMasterName` varchar(150) DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `weightDesc` varchar(150) DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `yardMasterId` int DEFAULT NULL,
  `yardName` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_update`
--

LOCK TABLES `tbl_update` WRITE;
/*!40000 ALTER TABLE `tbl_update` DISABLE KEYS */;
INSERT INTO `tbl_update` VALUES (4,1,0,2,'20 FT',4,1,200,'20 Ton',2,3,'Yard2'),(10,1,0,1,'10 FT',10,1,500,'10 Ton',1,1,'Yard1');
/*!40000 ALTER TABLE `tbl_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_update_json`
--

DROP TABLE IF EXISTS `tbl_update_json`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_update_json` (
  `permissionId` int DEFAULT NULL,
  `permissionName` varchar(150) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `roleId` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_update_json`
--

LOCK TABLES `tbl_update_json` WRITE;
/*!40000 ALTER TABLE `tbl_update_json` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_update_json` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeslotmaster`
--

DROP TABLE IF EXISTS `timeslotmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslotmaster` (
  `timeslotMasterId` int NOT NULL AUTO_INCREMENT,
  `fromValue` varchar(512) NOT NULL,
  `toValue` varchar(512) NOT NULL,
  `actualValue` varchar(512) NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`timeslotMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeslotmaster`
--

LOCK TABLES `timeslotmaster` WRITE;
/*!40000 ALTER TABLE `timeslotmaster` DISABLE KEYS */;
INSERT INTO `timeslotmaster` VALUES (1,'12','01','12 AM - 1 AM',1,'2020-08-03 00:00:00',NULL,NULL),(2,'01','02','1 AM - 2 AM',1,'2020-08-03 00:00:00',NULL,NULL),(3,'02','03','2 AM - 3 AM',1,'2020-08-03 00:00:00',NULL,NULL),(4,'03','04','3 AM - 4 AM',1,'2020-08-03 00:00:00',NULL,NULL),(5,'04','05','4 AM - 5 AM',1,'2020-08-03 00:00:00',NULL,NULL),(6,'05','06','5 AM - 6 AM',1,'2020-08-03 00:00:00',NULL,NULL),(7,'06','07','6 AM - 7 AM',1,'2020-08-03 00:00:00',NULL,NULL),(8,'07','08','7 AM - 8 AM',1,'2020-08-03 00:00:00',NULL,NULL),(9,'08','09','8 AM - 9 AM',1,'2020-08-03 00:00:00',NULL,NULL),(10,'09','10','9 AM - 10 AM',1,'2020-08-03 00:00:00',NULL,NULL),(11,'10','11','10 AM- 11 AM',1,'2020-08-03 00:00:00',NULL,NULL),(12,'11','12','11 AM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL),(13,'12','13','12 PM - 1 PM',1,'2020-08-03 00:00:00',NULL,NULL),(14,'13','14','1 PM - 2 PM',1,'2020-08-03 00:00:00',NULL,NULL),(15,'14','15','2 PM - 3 PM',1,'2020-08-03 00:00:00',NULL,NULL),(16,'15','16','3 PM - 4 PM',1,'2020-08-03 00:00:00',NULL,NULL),(17,'16','17','4 PM - 5 PM',1,'2020-08-03 00:00:00',NULL,NULL),(18,'17','18','5 PM - 6 PM',1,'2020-08-03 00:00:00',NULL,NULL),(19,'18','19','6 PM - 7 PM',1,'2020-08-03 00:00:00',NULL,NULL),(20,'19','20','7 PM - 8 PM',1,'2020-08-03 00:00:00',NULL,NULL),(21,'20','21','8 PM - 9 PM',1,'2020-08-03 00:00:00',NULL,NULL),(22,'21','22','9 PM - 10 PM',1,'2020-08-03 00:00:00',NULL,NULL),(23,'22','23','10 PM - 11 PM',1,'2020-08-03 00:00:00',NULL,NULL),(24,'23','12','11 PM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `timeslotmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporterregistration`
--

DROP TABLE IF EXISTS `transporterregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporterregistration` (
  `transporterId` int NOT NULL AUTO_INCREMENT,
  `transporterName` varchar(512) DEFAULT NULL,
  `transporterMobileNumber` varchar(512) DEFAULT NULL,
  `transporterEmail` varchar(512) DEFAULT NULL,
  `transporterAddress` varchar(512) DEFAULT NULL,
  `transporterPincode` varchar(512) DEFAULT NULL,
  `transporterGSTIN` varchar(512) DEFAULT NULL,
  `transporterPAN` varchar(512) DEFAULT NULL,
  `transporterPartner` varchar(512) DEFAULT NULL,
  `transporterPartnerPAN` varchar(512) DEFAULT NULL,
  `transporterPartnerAddress` varchar(512) DEFAULT NULL,
  `transporterBankAccNumber` varchar(512) DEFAULT NULL,
  `transporterBankAccType` varchar(512) DEFAULT NULL,
  `transporterBankName` varchar(512) DEFAULT NULL,
  `transporterBankBranch` varchar(512) DEFAULT NULL,
  `transporterBankIFSC` varchar(512) DEFAULT NULL,
  `transporterAddressFile` varchar(512) DEFAULT NULL,
  `transporterGstFile` varchar(512) DEFAULT NULL,
  `transporterPanFile` varchar(512) DEFAULT NULL,
  `transporterPermitFile` varchar(512) DEFAULT NULL,
  `transporterLicenseFile` varchar(512) DEFAULT NULL,
  `transporterOtherFile` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`transporterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporterregistration`
--

LOCK TABLES `transporterregistration` WRITE;
/*!40000 ALTER TABLE `transporterregistration` DISABLE KEYS */;
INSERT INTO `transporterregistration` VALUES (1,'Transporter Third','7774102563','transporter3@alc.in','Address1','114','114','118','Partner','4445','address2','123','a','aa','aa','aa','','','','','','',1,1,0,'2020-10-07 16:43:37',0,'2020-10-07 16:43:37',15),(2,'New Transporter','9700456321','new@transporter.in',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,21);
/*!40000 ALTER TABLE `transporterregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `tripId` int NOT NULL AUTO_INCREMENT,
  `subOrderId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `assignedVehicle` int DEFAULT NULL,
  `assignedDriver` int DEFAULT NULL,
  `tripstatus` varchar(512) DEFAULT NULL,
  `tripStatusId` int DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `sourceName` varchar(512) DEFAULT NULL,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `startDate` varchar(512) DEFAULT NULL,
  `endDate` varchar(512) DEFAULT NULL,
  `billedAmount` int DEFAULT NULL,
  `BidValue` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `startedBy` int DEFAULT NULL,
  `stoppeddBy` int DEFAULT NULL,
  `tripSeq` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (38,100,2,2,NULL,NULL,'TRIP_DISCARD_ADMIN',23,NULL,NULL,NULL,21,'2020-11-10 02:29:35',NULL,NULL,NULL,NULL,NULL,800,0,NULL,NULL,NULL),(39,100,2,2,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,21,'2020-11-10 22:43:12',NULL,NULL,NULL,NULL,NULL,800,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trip_AFTER_UPDATE` AFTER UPDATE ON `trip` FOR EACH ROW BEGIN
IF(NEW.tripStatusId = 21) Then -- Both Vehicle And Driver Assigned

update transporter.order ord 
inner join transporter.suborder sub  on ord.orderId = sub.orderId 
and OLD.subOrderId = sub.subOrderId
set ord.orderStatus = 'ORDER_ASSIGNED',
	ord.orderStatusId = 7
where sub.subOrderId = OLD.subOrderId;

ElseIF(NEW.tripStatusId = 19) Then -- Trip Started

update transporter.suborder 
set suborderStatus = 'SUB_ORDER_TRIP_STARTED',
suborderStatusId = 13
Where subOrderId = OLD.subOrderId;

ElseIF(NEW.tripStatusId = 20) Then -- Trip Completed

update transporter.suborder 
set suborderStatus = 'SUB_ORDER_TRIP_COMPLETED',
suborderStatusId = 14
Where subOrderId = OLD.subOrderId;

update transporter.order ord 
inner join transporter.suborder sub  on ord.orderId = sub.orderId 
and OLD.subOrderId = sub.subOrderId
set ord.orderStatus = 'ORDER_DELIVERED',
	ord.orderStatusId = 9
where sub.subOrderId = OLD.subOrderId;



End If;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truckId` int NOT NULL AUTO_INCREMENT,
  `containerId` int DEFAULT NULL,
  `truckNumber` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (79,35,'',NULL,NULL,NULL,NULL,NULL),(80,35,'',NULL,NULL,NULL,NULL,NULL),(81,35,'',NULL,NULL,NULL,NULL,NULL),(82,36,'',NULL,NULL,NULL,NULL,NULL),(83,36,'',NULL,NULL,NULL,NULL,NULL),(84,37,'',NULL,NULL,NULL,NULL,NULL),(85,37,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `firstName` varchar(512) NOT NULL,
  `lastName` varchar(512) NOT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `typeSyscode` int NOT NULL,
  `permissions` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$g4gC9K5ebPMdTS2Aosq55ehc.i.N15Bo/wJ994P/ZlM.NqkExMxpa','utsav','demo','9886631264',1,'[\"AccessAuthFeature\"]'),(3,'cfs@hotmail.com','$2a$10$zFSpbpbu3L1ms6QPh78I9.tP28nzE4DfBrj5vyujWGBFaMP6tlHJW','Utsav','Purohit','9886631264',4,'[\"AccessAuthFeature\"]'),(4,'alc@admin.in','$2a$10$u1ELBUU.FGlKqvthzGvAt.xNhXHh9uUXhWOc3f0RNouaTYV0SSKpq','CFS User','CFS User','8875415230',7,'[\"AccessAuthFeature\"]'),(5,'transporter@alc.in','$2a$10$9hAh5NBg.YU73fkkRLmor.Xwy1POsXg5cApaiGF3Hhoci2D01N.62','Transporter','ALC','7789445620',5,'[\"AccessAuthFeature\"]'),(6,'transporter2@alc.in','$2a$10$cRWLZ/YInsJlmmCo0DLHsedcopBJlNVXZkEjQMjTiauWmImYOc.rW','Transporter2','ALC','7784562013',5,'[\"AccessAuthFeature\"]'),(7,'driver@alc.in','$2a$10$T6.Z3nMwE3IDcb25KqU8veJ3JZS6c6YvEapbVgwMcdsFBleuUV0qC','Driver','ALC','7894561230',6,'[\"AccessAuthFeature\"]'),(8,'gaurav@gmail.com','$2a$10$y0MXM6Yu9jH/h8IP1.H6juhR52MP0lbsvNgojGnR4aTdVnfTfDbIq','Gaurav','Admin','9547865231',1,'[\"AccessAuthFeature\"]'),(9,'cfs@gaurav.in','$2a$10$s.Z581LEsX4.EaoLBBknTOsV7EhqwwPodpYGXnflgDNzbFGdlUnIK','Gaurav CFS Super Admin','Gaurav CFS Super Admin','9998887774',7,'[\"AccessAuthFeature\"]'),(10,'alc.user@cfs.in','$2a$10$FhWa.y90jf.oPhuWcQ.RReg2BKa3Iooc.jh2HK8mFzV3wgwEHDxZW','All cargo User','All cargo User','7785624120',8,'[\"AccessAuthFeature\"]'),(11,'driver2@alc.in','$2a$10$fJOlGusegArXlN4EdiCgO.dt/4VMAlUasyBvrPd0g6jIrSdNo0Dty','Driver2','Driver','8877445563',6,'[\"AccessAuthFeature\"]'),(12,'cfs@newzone.in','$2a$10$4TL6akxNfhYnRZKeRWyKmO1Pz4oUPAwqLWjQcnCiAr7GBEJtgrqsC','New Zone CFS','New Zone CFS','8874123546',7,'[\"AccessAuthFeature\"]'),(13,'driver@alctransporter.in','$2a$10$8nyR.6cHf572J5m2PIKdkOeWASZJHH/d35Gn0fMO7ALb.gnwLX2nC','Driver','Last','8897456210',6,'[\"AccessAuthFeature\"]'),(14,'cfs@newzone11.in','$2a$10$UpDBqPeeSL.2ccdqZSs.GOV6uhnEt.WX3rmA6FYkiyhJ3g8aUaYvG','CFS USer','CFS USer','7744884500',4,'[\"AccessAuthFeature\"]'),(15,'transporter3@alc.in','$2a$10$u5PE89RY3wX/OrmGt.CgmuUJ81GkO/fQgzzBwDLmXta/xJwoEaQ6S','Transporter','Third','7774102563',5,'[\"AccessAuthFeature\"]'),(16,'driver5@alc.in','$2a$10$QHowQ7FWBj0YOC4d/Kv/i.pd8mF/aL.33magF3Y3havGVhOTVwrri','Driver5','ALC','8745210036',6,'[\"AccessAuthFeature\"]'),(17,'driver7@alc.in','$2a$10$kF9sHsQvSdeZeuU3cyG6f.wqoLaHBLiIlUFq4GsHpiFWRxmP6gzt.','Driver7','ALC','8841254632',6,'[\"AccessAuthFeature\"]'),(18,'driver8@alc.in','$2a$10$8DaEKFI1xxX/xRAMiQzVLuVy3ifwNLtmElhs9lwRgHRqZwrwV/IgO','Driver8','ALC','8879451023',6,'[\"AccessAuthFeature\"]'),(19,'driver9@alc.in','$2a$10$AB8cmXnXFMAbTXNQO/DryOcyobhqUTjjWoTSlnetavFhjKL/QoQn6','Driver9','ALC','9987456120',6,'[\"AccessAuthFeature\"]'),(20,'driver10@alc.in','$2a$10$tAUfo9mBp4GrNUgPfW4u1uRdD1LUKoIL2r11h2JwY4NYYFZhK8.LK','Driver10','ALC','8874512036',6,'[\"AccessAuthFeature\"]'),(21,'new@transporter.in','$2a$10$qAj.EDz5zFYvoZZ14Syy8OitDVrDXTccY9DfCoHKXBcvWZ25KILX2','New','Transporter','9700456321',5,'[\"AccessAuthFeature\"]'),(22,'newly@cfs.in','$2a$10$znGxkKNEBk1PRPxR5WL8Mukr9dnMV0HKEZWQx.QTBYBUIuketo6WW','Newly Created','Newly Created','9874120563',7,'[\"AccessAuthFeature\"]');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userratings`
--

DROP TABLE IF EXISTS `userratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userratings` (
  `userratingId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `ratingStatus` int DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`userratingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userratings`
--

LOCK TABLES `userratings` WRITE;
/*!40000 ALTER TABLE `userratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `userratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `roleName` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `parentRoleId` int DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin',1,1,'2020-06-26 21:11:31',NULL,NULL,NULL),(2,'Import Customer',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(3,'Export Customer',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(4,'CFS Customer',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(5,'Transporter',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(6,'Driver',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(7,'CFS User Admin',1,1,'2020-07-17 00:00:00',NULL,NULL,4),(8,'CFS User Super Admin',1,1,'2020-07-17 00:00:00',NULL,NULL,4),(9,'CFS User Viewer',1,1,'2020-07-17 00:00:00',NULL,NULL,4),(10,'fddfgfdg',1,1,'2020-10-04 12:33:46',NULL,NULL,NULL),(11,'Admin',1,1,'2020-10-05 18:40:31',NULL,NULL,NULL),(12,'Admin',1,1,'2020-10-05 18:43:19',NULL,NULL,NULL),(13,'Admin',1,1,'2020-10-05 18:50:02',NULL,NULL,NULL),(14,'Admin',1,1,'2020-10-05 18:51:26',NULL,NULL,NULL),(15,'Admin',1,1,'2020-10-05 18:56:12',NULL,NULL,NULL),(16,'New Role',1,1,'2020-10-05 19:03:38',NULL,NULL,NULL),(17,'New Role 1',1,1,'2020-10-05 19:10:09',NULL,NULL,NULL),(18,'New Role9',1,1,'2020-10-05 19:15:10',NULL,NULL,NULL),(19,'New Role99',1,1,'2020-10-05 19:20:40',NULL,NULL,NULL),(20,'NewRole27',1,1,'2020-10-05 19:22:22',NULL,NULL,NULL),(21,'New 27',1,1,'2020-10-05 19:23:50',NULL,NULL,NULL);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrolemapping`
--

DROP TABLE IF EXISTS `userrolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrolemapping` (
  `userroleId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`userroleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrolemapping`
--

LOCK TABLES `userrolemapping` WRITE;
/*!40000 ALTER TABLE `userrolemapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `userrolemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicleId` int NOT NULL AUTO_INCREMENT,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `desc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiclemaster`
--

DROP TABLE IF EXISTS `vehiclemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiclemaster` (
  `vehicleMasterId` int NOT NULL AUTO_INCREMENT,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `vehicleType` int DEFAULT NULL,
  `vehicleCapacity` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `manufactureYear` varchar(512) DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`vehicleMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
INSERT INTO `vehiclemaster` VALUES (1,'MH02CN4545',1,1,400,'2019',1,0,1,1,'2020-10-07 18:17:23',1,'2020-10-07 18:17:23'),(2,'MH412210',1,1,500,'2009',1,1,1,5,'2020-09-20 20:08:31',5,'2020-09-20 20:08:31');
/*!40000 ALTER TABLE `vehiclemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletransportermapping`
--

DROP TABLE IF EXISTS `vehicletransportermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletransportermapping` (
  `vehicletransportermappingId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `vehicleMasterId` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdBy` int NOT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  PRIMARY KEY (`vehicletransportermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletransportermapping`
--

LOCK TABLES `vehicletransportermapping` WRITE;
/*!40000 ALTER TABLE `vehicletransportermapping` DISABLE KEYS */;
INSERT INTO `vehicletransportermapping` VALUES (1,6,1,'2020-08-31 19:21:19',6,NULL,NULL),(2,5,2,'2020-09-20 20:08:31',5,NULL,NULL);
/*!40000 ALTER TABLE `vehicletransportermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weightmaster`
--

DROP TABLE IF EXISTS `weightmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weightmaster` (
  `weightMasterId` int NOT NULL AUTO_INCREMENT,
  `weightDesc` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` varchar(30) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  PRIMARY KEY (`weightMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
INSERT INTO `weightmaster` VALUES (1,'10 Ton',1,1,'2020-08-30 07:35:52',1,'2020-10-25 2:49:51 am',1),(2,'20 Ton',1,1,'2020-08-30 07:36:01',1,'2020-08-30 07:36:01',2),(3,'40 Ton',1,8,'2020-08-31 19:27:00',8,'2020-08-31 19:27:00',3);
/*!40000 ALTER TABLE `weightmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardcfsratemaster`
--

DROP TABLE IF EXISTS `yardcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardcfsratemaster` (
  `yardCfsRateMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int DEFAULT NULL,
  `yardMasterId` int DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `bidMarginRate` int DEFAULT NULL,
  `orderMarginRate` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` varchar(30) DEFAULT NULL,
  `modifiedOn` varchar(30) DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  PRIMARY KEY (`yardCfsRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardcfsratemaster`
--

LOCK TABLES `yardcfsratemaster` WRITE;
/*!40000 ALTER TABLE `yardcfsratemaster` DISABLE KEYS */;
INSERT INTO `yardcfsratemaster` VALUES (1,2,2,2,2,700,22,15,1,0,NULL,NULL,NULL,2),(2,2,2,3,3,400,7,8,0,1,1,'2020-10-25 1:55:34 am','2020-10-25 1:56:44 am',2);
/*!40000 ALTER TABLE `yardcfsratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardmaster`
--

DROP TABLE IF EXISTS `yardmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardmaster` (
  `yardMasterId` int NOT NULL AUTO_INCREMENT,
  `yardName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` varchar(512) DEFAULT NULL,
  `modifiedOn` varchar(512) DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`yardMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardmaster`
--

LOCK TABLES `yardmaster` WRITE;
/*!40000 ALTER TABLE `yardmaster` DISABLE KEYS */;
INSERT INTO `yardmaster` VALUES (1,'Yard1',1,'Add1','Add2','Land','445578','556655','5222565',1,1,'2020-08-30 07:21:43','2020-10-24 12:50:41 pm',1,1,1,'Utsav','5857475565'),(2,'CH Yard',1,'Add1','Add2','Landmark','412230','sdjkf','sdnbf',8,8,'2020-08-31 19:29:56','2020-08-31 19:29:56',2,2,2,'Gaurav','9876543210'),(3,'Yard2',1,'add1','Add2','','455210','','',1,1,'2020-09-27 20:34:02','2020-09-27 20:34:02',1,1,1,'Utsav','9541203547'),(4,'test',0,'add1','','','447788','','',1,1,'2020-10-25 12:25:33 am','2020-10-25 12:27:29 am',3,3,1,'test','9899745120');
/*!40000 ALTER TABLE `yardmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedaymaster`
--

DROP TABLE IF EXISTS `zonedaymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonedaymaster` (
  `zoneDayMasterId` int NOT NULL AUTO_INCREMENT,
  `zoneName` varchar(512) DEFAULT NULL,
  `portId` int DEFAULT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`zoneDayMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonedaymaster`
--

LOCK TABLES `zonedaymaster` WRITE;
/*!40000 ALTER TABLE `zonedaymaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonedaymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonemaster`
--

DROP TABLE IF EXISTS `zonemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonemaster` (
  `zoneMasterId` int NOT NULL AUTO_INCREMENT,
  `zoneName` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `zoneDesc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`zoneMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonemaster`
--

LOCK TABLES `zonemaster` WRITE;
/*!40000 ALTER TABLE `zonemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `zonemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'transporter'
--

--
-- Dumping routines for database 'transporter'
--
/*!50003 DROP FUNCTION IF EXISTS `FuncGetBidCutofftime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FuncGetBidCutofftime`(StartDate datetime, IsFullTime int , hours int) RETURNS varchar(30) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare CutOffTime varchar(30);
declare starthour int;
declare endhour int;
declare dateaddition int default 0 ;
 select  HOUR(StartDate) into starthour;
 
 if(hours < 8) then
	 if(starthour between 10 and 18) then
					if((18 - starthour) > 5) then
					  select DATE_ADD(StartDate, INTERVAL hours hour)  into CutOffTime;
                      end if;
                      if((18 - starthour) < 6) then
					  select DATE_ADD(StartDate, INTERVAL((18 - starthour) + 16 + (6 - (18 - starthour))) hour)  into CutOffTime;
                      end if;
				else if(starthour < 10) then
					select DATE_ADD(StartDate, INTERVAL (hours + (10 - starthour )) hour) into CutOffTime;
				else if(starthour > 18) then
					select DATE_ADD(StartDate, INTERVAL (hours + 10 + (24 - starthour )) hour) into CutOffTime;
			end if;  
		end if; 
		end if;
  end if;   
    
    
 -- odd hours
if(IsFullTime = 0) 
	then
		 if(starthour between 10 and 18) then
				  select DATE_ADD(StartDate, INTERVAL hours hour)  into CutOffTime;
			else if(starthour < 10) then
				select DATE_ADD(StartDate, INTERVAL (hours + (10 - starthour )) hour) into CutOffTime;
			else if(starthour > 18) then
				select DATE_ADD(StartDate, INTERVAL (hours + 10 + (24 - starthour )) hour) into CutOffTime;
		end if;  
	end if; 
    end if;
end if;
-- full hors divided by 24
if(IsFullTime = 1) 
    then
			if(starthour between 11 and 18) then
				select DATE_ADD(StartDate, INTERVAL hours hour)  into CutOffTime; -- 42,12 hours
			else if(starthour < 11) then
				select DATE_ADD(StartDate, INTERVAL (hours - 16 + (10 - starthour )) hour)  into CutOffTime; -- 42,12 hours
            else if(starthour > 18) then
				select DATE_ADD(StartDate, INTERVAL (hours -  (starthour  - 18)) hour)  into CutOffTime; -- 42,12 hours    
                 
			end if;
	end if; 
	end if;
   end if;
   
   RETURN CutOffTime;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetBidSeq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetBidSeq`(sub_orderId int) RETURNS varchar(15) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare returnVal varchar(15);
declare subordseq varchar(15);
declare maxNum bigint;
set maxNum = 0;

Select subOrderSeq into subordseq from transporter.suborder where subOrderId = sub_orderId;

If exists(Select * from transporter.bid where subOrderId = sub_orderId) > 0 then
Select ifnull(bidSeq,0) into maxNum from transporter.bidusermapping bum
Inner Join transporter.bid b on b.bidId = bum.bidId
where subOrderId = sub_orderId
order by bidusermappingId desc limit 1;
end if;

If(maxNum = 0) then
	select concat(subordseq,'001') into returnVal;  
else
	Select concat(subordseq, Lpad(Max(right(maxNum,3) + 1),3,'0')) into returnVal;
End If;
RETURN returnVal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getCutOfftimebyOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getCutOfftimebyOrderId`(order_Id int) RETURNS varchar(25) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare returnVal varchar(25);
Select case when bis.WorkingHours = 0 then DATE_ADD(ord.createdon, INTERVAL bis.bidingHours HOUR)
when bis.WorkingHours > 0 then FuncGetBidCutofftime(ord.createdon,bis.IsFullhour,bis.totalbidhour) end
into  returnVal
From transporter.order ord
inner join transporter.bidschedulemaster bis on 
TIMESTAMPDIFF(HOUR, ord.createdOn, ord.orderdate) between bis.fromHour and bis.ToHour
where ord.orderId = order_Id;
 
RETURN DATE_FORMAT(returnVal, '%d-%b-%Y %a %H:%i');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetSubOrderSeq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetSubOrderSeq`(order_Id int) RETURNS varchar(15) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare returnVal varchar(15);
declare maxNum int;
set maxNum = 0;

If exists(Select * from transporter.suborder where orderId = order_Id) > 0 then
Select ifnull(subOrderSeq,0) into maxNum from transporter.suborder where orderId = order_Id
order by subOrderId desc limit 1;
end if;
If(maxNum = 0) then
	select concat(convert(order_Id,char),'001') into returnVal;  
else
	Select concat(convert(order_Id,char), Lpad(Max(right(maxNum,3) + 1),3,'0')) into returnVal;
End If;
RETURN returnVal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AwardBidbymappingId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AwardBidbymappingId`(in bum_Id int, 
in subOrder_Id int)
BEGIN

declare bid_Id int;
    DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;

START TRANSACTION;
Select bidId into bid_Id from transporter.bidusermapping where bidusermappingId = bum_Id;
-- updte the order on 20 bid first come first serve basis
update bidusermapping bum set biduserStatus = 'BID_USER_CONFIRMED', biduserStatusId = 5
Where bum.bidusermappingId = bum_Id;
  
  -- inserting the confirmed order details to trip
  insert into transporter.trip
(subOrderId,sourceId,destinationId,tripstatus,tripStatusId,createdBy,createdOn,bidValue,isActive)
SELECT subo.subOrderId, ord.sourceId, ord.destinationId, 'TRIP_TRANSPORTER_ASSIGNED',16, userId, now(), bum.bidValue,1
FROM transporter.bidusermapping bum
inner join transporter.bid bd on bd.bidId = bum.bidId
inner join transporter.suborder subo on subo.subOrderId= bd.subOrderId
inner join transporter.order ord on ord.orderId = subo.orderId
left outer join transporter.trip trip on trip.subOrderId = subo.subOrderId 
where biduserStatus = 'BID_USER_CONFIRMED' and bum.bidusermappingId = bum_Id;

update transporter.suborder sub 
inner join transporter.trip trp  on sub.subOrderId = trp.subOrderId 
set sub.suborderStatus = 'SUB_ORDER_BID_ASSIGNED',
	suborderStatusId = 12
where suborderStatusId != 12 and sub.subOrderId = subOrder_Id;


update transporter.bid bd 
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bd.bidStatus = 'BID_ASSIGNED',
	bd.bidStatusId = 2, 
    bd.isActive = 0
where bidStatusId != 2 and bidId = bid_Id;

update  transporter.bidusermapping bum  
inner join transporter.bid bd on bum.bidId = bd.bidId
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bum.biduserStatus = 'BID_USER_DISCARD',
	bum.biduserStatusId = 22
where biduserStatusId != 5 and biduserStatusId != 22 and bum.bidId = bid_Id;

COMMIT WORK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CleanOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CleanOrders`()
BEGIN

Delete from transporter.trip;
Delete from transporter.bidusermapping;
Delete from transporter.bid;
Delete from transporter.container;
Delete from transporter.truck;
Delete from transporter.suborder;
Delete from transporter.order;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllBids` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllBids`(IN OrderId int )
BEGIN

Select * from transporter2.bid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSbyUserId`(in user_Id int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;

If (roleId = 1) then -- admin
Select cm.* from transporter.cfsmaster cm where isActive = 1;
else
Select cm.* from transporter.cfsmaster cm
Inner Join transporter.cfsuserregistration cur on cm.cfsMasterId = cur.cfsMasterId
Where cur.userId =  user_Id and cm.isActive = 1;
End If;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSContainerAndWeights` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSContainerAndWeights`(
In master_type_Id int,
In cfs_master_Id int
)
BEGIN

If(master_type_Id = 1) then -- CFS to Yard 

Select cfs.cfsMasterId,c.containerMasterId,c.containerMasterName,
 w.weightMasterId,w.weightDesc,
 IFNULL(yrm.rate,0) rate,
 IFNULL(yrm.bidMarginRate,0) bidMarginRate, IFNULL(yrm.orderMarginRate,0) orderMarginRate,
 y.yardMasterId,y.yardName, cfs.portMasterId,
 IFNULL(yrm.cfsYardRateMasterId,0) cfsYardRateMasterId
 from transporter.weightmaster w
Inner Join transporter.containermaster c on c.containerMasterId = w.containerMasterId
Left Outer Join transporter.cfsmaster cfs on cfs.cfsMasterId = cfs_master_Id
left Outer Join transporter.yardmaster y on 
 cfs.portMasterId = y.portMasterId  
Left Outer Join transporter.cfsyardratemaster yrm on 
c.containerMasterId = yrm.containerMasterId and w.weightMasterId = yrm.weightMasterId
and yrm.cfsMasterId = cfs_master_Id and yrm.yardMasterId = y.yardMasterId
Where c.isActive = 1
order by y.yardMasterId,c.containerMasterId;

ElseIf(master_type_Id = 3) then -- Yard to CFS

Select cfs.cfsMasterId,c.containerMasterId,c.containerMasterName,
 w.weightMasterId,w.weightDesc,
 IFNULL(yrm.rate,0) rate,
 IFNULL(yrm.bidMarginRate,0) bidMarginRate, IFNULL(yrm.orderMarginRate,0) orderMarginRate,
 y.yardMasterId,y.yardName,cfs.portMasterId,
 IFNULL(yrm.yardCfsRateMasterId,0) yardCfsRateMasterId
 from transporter.weightmaster w
Inner Join transporter.containermaster c on c.containerMasterId = w.containerMasterId
Left Outer Join transporter.cfsmaster cfs on cfs.cfsMasterId = cfs_master_Id
left Outer Join transporter.yardmaster y on 
 cfs.portMasterId = y.portMasterId  
Left Outer Join transporter.yardcfsratemaster yrm on 
c.containerMasterId = yrm.containerMasterId and w.weightMasterId = yrm.weightMasterId
and yrm.cfsMasterId = cfs_master_Id and yrm.yardMasterId = y.yardMasterId
Where c.isActive = 1
order by y.yardMasterId,c.containerMasterId;

ElseIf(master_type_Id = 2) then -- CFS to Port

Select cfs.cfsMasterId,c.containerMasterId,c.containerMasterName,
 w.weightMasterId,w.weightDesc,
 IFNULL(prm.rate,0) rate,
 IFNULL(prm.bidMarginRate,0) bidMarginRate, IFNULL(prm.orderMarginRate,0) orderMarginRate,
 cfs.portMasterId,IFNULL(prm.cfsPortRateMasterId,0) cfsPortRateMasterId
 from transporter.weightmaster w
Inner Join transporter.containermaster c on c.containerMasterId = w.containerMasterId
Left Outer Join transporter.cfsmaster cfs on cfs.cfsMasterId = cfs_master_Id
Left Outer Join transporter.cfsportratemaster prm on 
c.containerMasterId = prm.containerMasterId and w.weightMasterId = prm.weightMasterId
and prm.cfsMasterId = cfs_master_Id and prm.portMasterId = cfs.portMasterId
Where c.isActive = 1
order by c.containerMasterId;

ElseIf(master_type_Id = 4) then -- Port to CFS

Select cfs.cfsMasterId,c.containerMasterId,c.containerMasterName,
 w.weightMasterId,w.weightDesc,
 IFNULL(prm.rate,0) rate,
 IFNULL(prm.bidMarginRate,0) bidMarginRate, IFNULL(prm.orderMarginRate,0) orderMarginRate,
 cfs.portMasterId,IFNULL(prm.portCfsRateMasterId,0) portCfsRateMasterId
 from transporter.weightmaster w
Inner Join transporter.containermaster c on c.containerMasterId = w.containerMasterId
Left Outer Join transporter.cfsmaster cfs on cfs.cfsMasterId = cfs_master_Id
Left Outer Join transporter.portcfsratemaster prm on 
c.containerMasterId = prm.containerMasterId and w.weightMasterId = prm.weightMasterId
and prm.cfsMasterId = cfs_master_Id and prm.portMasterId = cfs.portMasterId
Where c.isActive = 1
order by c.containerMasterId;

End If;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllCFSContainersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCFSContainersbyUserId`(in user_Id int, in type_Id int, in port_yard_Id int)
BEGIN

IF (type_Id = 1) Then -- CFS To Yard
Select distinct  c.* from transporter.containermaster c
Inner Join transporter.cfsyardratemaster yrm on c.containerMasterId = yrm.containerMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and yrm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 2)  Then -- CFS To Port
Select distinct c.* from transporter.containermaster c
Inner Join transporter.cfsportratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.portMasterId = port_yard_Id;

ELSEIF (type_Id = 3)  Then -- Yard To CFS
Select distinct c.* from transporter.containermaster c
Inner Join transporter.yardcfsratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 4)  Then -- Port To CFS
Select distinct c.* from transporter.containermaster c
Inner Join transporter.portcfsratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.portMasterId = port_yard_Id;

End IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSPortsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSPortsbyUserId`(in user_Id int)
BEGIN

Select distinct p.* from transporter.portmaster p
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id 
Inner join transporter.cfsmaster cfs on cur.cfsMasterId = cfs.cfsMasterId and p.portMasterId = cfs.portMasterId
-- Left Outer Join transporter.cfsportratemaster crm on p.portMasterId = crm.portMasterId and crm.cfsMasterId = cur.cfsMasterId
-- Left Outer Join transporter.portcfsratemaster prm on p.portMasterId = prm.portMasterId and prm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSWeightsbyUserandContainerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSWeightsbyUserandContainerId`(in user_Id int, in type_Id int, in container_Id int, in port_yard_Id int)
BEGIN

IF (type_Id = 1) Then -- CFS To Yard

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.cfsyardratemaster yrm on w.weightMasterId = yrm.weightMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and yrm.containerMasterId = container_Id
and yrm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 2)  Then -- -- CFS To Port

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.cfsportratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id
and crm.portMasterId = port_yard_Id;

ELSEIF (type_Id = 3)  Then -- -- Yard To CFS

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.yardcfsratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id
and crm.yardMasterId = port_yard_Id;

ELSEIF (type_Id = 4)  Then -- -- Port To CFS

Select distinct w.* from transporter.weightmaster w
Inner Join transporter.portcfsratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id
and crm.portMasterId = port_yard_Id;

End IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllCFSYardsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSYardsbyUserId`(in user_Id int)
BEGIN

Select distinct y.* from transporter.yardmaster y
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id 
Inner Join transporter.cfsmaster cm on cm.cfsMasterId = cur.cfsMasterId and cm.portMasterId = y.portMasterId
-- Left Outer Join transporter.yardcfsratemaster yrm on y.yardMasterId = yrm.yardMasterId and yrm.cfsMasterId = cur.cfsMasterId
-- Left Outer Join transporter.cfsyardratemaster crm on y.yardMasterId = crm.yardMasterId and crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllDriversbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDriversbyUserId`(in user_Id int)
BEGIN
Select d.* from transporter.driver d
Inner join transporter.drivertransportermapping dtm on d.userId = dtm.driverId
Where dtm.userId = user_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllGroupCFSUsersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllGroupCFSUsersbyUserId`(in user_Id int)
BEGIN

declare cfs_Id int;
Select cfsMasterId into cfs_Id 
from transporter.cfsuserregistration where userId = user_Id;

Select u.userId,u.email,u.firstName,u.lastName,u.mobileNumber,
u.typeSyscode from transporter.user u
inner Join transporter.cfsuserregistration cur on cur.userId = u.userId 
-- Inner Join transporter.cfsmaster cfm on cur.cfsMasterId = cfm.cfsMasterId
Where  cur.cfsMasterId = cfs_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllOrdersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllOrdersbyUserId`(in user_Id int)
BEGIN

declare role_Id int;
Select typeSyscode into role_Id from transporter.user where userId = user_Id;

if(role_Id = 1) then

select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn,getCutOfftimebyOrderId(ord.orderId) as CutOffTime
from transporter.order ord
left join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
where ord.isDeleted = 0 order by CutOffTime desc;  
Else

select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn
from transporter.order ord
left outer join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
where ord.createdBy = user_Id and ord.isDeleted = 0;
End if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPermissionsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPermissionsbyUserId`(in user_Id int)
BEGIN
declare role_Id int;

Select typeSyscode into role_Id from transporter.user
where userId = user_Id;

Select GROUP_CONCAT(p.permissionName) as Permissions from permission p 
inner join permissionrolemapping prm on p.permissionId = prm.permissionId
Where prm.roleId = role_Id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllSubOrdersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSubOrdersbyUserId`(in user_Id int)
BEGIN

declare role_Id int;
Select typeSyscode into role_Id from transporter.user where userId = user_Id;

if(role_Id = 1 or role_Id = 5) then
Select ord.orderId, subo.subOrderId,subo.subOrderSeq, subo.subOrderTotalMargin, '' as CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
where subo.isDelete = 0;
else
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
where subo.createdBy = user_Id and subo.isDelete = 0; 
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllTransporter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTransporter`()
BEGIN
SELECT userId, email , firstName , lastname , mobileNumber
 FROM transporter.user
where typeSyscode = 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllTripsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTripsbyUserId`(in user_Id int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;


If (roleId = 5) then -- Transporter 

Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
v.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = v.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = v.vehicletype
left outer join transporter.containermaster c on so.containerType = c.containerMasterId
left outer join transporter.weightmaster w on so.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where t.createdBy = user_Id and t.isActive = 1 ;

Elseif(roleId = 6) then -- Driver
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
v.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = v.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = v.vehicletype
left outer join transporter.containermaster c on so.containerType = c.containerMasterId
left outer join transporter.weightmaster w on so.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where u.userId = user_Id and t.isActive = 1 ;

Elseif(roleId = 4 or roleId= 7 or roleId = 8 or roleId = 9) then -- CFS Users
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
v.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = v.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = v.vehicletype
left outer join transporter.containermaster c on so.containerType = c.containerMasterId
left outer join transporter.weightmaster w on so.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where ord.createdBy = user_Id and t.isActive = 1 ;

else -- admin

Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(dusr.firstName ,' ',dusr.lastName) as DriverName,
vhl.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy;

End If;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllVehiclesbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehiclesbyUserId`(in user_Id int)
BEGIN

Select v.* from transporter.vehiclemaster v
Inner join transporter.vehicletransportermapping vtm on v.vehicleMasterId = vtm.vehicleMasterId
Where vtm.userId = user_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBidDetailsByBidId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidDetailsByBidId`(in bidId Int)
BEGIN
if(bidId=0) then
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
map.bidName ,map.bidName ,map.bidValue , map.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId;
else
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
map.bidName ,map.bidName ,map.bidValue , map.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId
  where bi.bidId = bidId;
 END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBidListForFilters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBidListForFilters`(
in order_Id int,
in transporter_Id int,
in bid_user_statusId int)
BEGIN

Select b.bidId,
bum.bidSeq,b.originalRate, bum.bidValue,
bum.biduserStatus,
case when b.CutOffTime is not null then
concat(DATE_FORMAT(b.CutOffTime,'%d-%b-%Y'),' On ',DATE_FORMAT(b.CutOffTime,'%H:%i:%s'))
else
''
end as CutOffTime,
concat(usr.firstName ,' ',usr.lastName) TransporterName
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
Inner join  transporter.bid b on b.subOrderId= subo.subOrderId
Inner join transporter.bidusermapping bum on bum.bidId = b.bidId
Inner join transporter.user usr on usr.userId = bum.userId
Where ord.orderId = order_Id
and (bum.userId = transporter_Id or (transporter_Id is null or transporter_Id = 0)) 
and (bum.biduserStatusId = bid_user_statusId or (bid_user_statusId is null or bid_user_statusId= 0)); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getbidsbySubOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getbidsbySubOrderId`(in subOrder_Id int)
BEGIN
SELECT map.bidSeq,
case when bi.exhibitionDate is null then '' else DATE_FORMAT(bi.exhibitionDate,'%d-%b-%Y') end as exhibitionDate,
bi.subOrderId,bi.createdBy,bi.originalRate ,
map.bidValue , map.biduserStatus, map.biduserStatusId, map.createdOn ,map.userId
      , concat(us.firstName, ' ', us.lastName) as TransporterName,us.email,
      map.bidusermappingId
FROM transporter.bid bi
Inner Join transporter.suborder subo on bi.subOrderId = subo.subOrderId
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId
  where subo.subOrderId = subOrder_Id
  order by case when map.modifiedOn is null then map.createdOn else map.createdOn end desc  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBidsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidsbyUserId`(In user_Id int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;


if roleId = 5 then -- Transporter
	
    Select b.bidId,bum.bidSeq,b.bidLowerLimit,
    case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  SorurceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    com.containerMasterName, wem.weightDesc,
    com.containerMasterId, wem.weightMasterId,
    -- (select  IFNULL(bidValue,0) from transporter.bidusermapping where bidId = b.bidId and userId = user_Id 
    -- ) as bidValue
    case when bum.userId = user_Id then bidValue else null end as bidValue,
    case when bum.userId = user_Id then biduserStatus else null end as biduserStatus,
    sub.subOrderTotalMargin as originalRate,bum.bidusermappingId,
    concat(usr.firstName ,' ',usr.lastName) TransporterName,
    sub.subOrderId,ifnull(bum.bidusermappingId,0) as bidusermappingId
    from transporter.order ord
    Inner Join transporter.suborder sub on ord.orderId = sub.orderId
    Inner Join  transporter.bid b  on sub.subOrderId = b.subOrderId
    Inner Join transporter.bidusermapping bum on b.bidId = bum.bidId and bum.userId = user_Id
    Inner join transporter.user usr on usr.userId = bum.userId
    -- Inner Join transporter.bidusermapping bm on bm.userId = user_Id 
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
    Where b.isActive = 1 ;  
    
else -- Admin User
    Select b.bidId,bm.bidSeq,b.bidLowerLimit,
    case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  SorurceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    com.containerMasterName, wem.weightDesc,
    com.containerMasterId, wem.weightMasterId,
    bm.bidValue,bm.biduserStatus, sub.subOrderTotalMargin as originalRate,
    concat(usr.firstName ,' ',usr.lastName) TransporterName,
      sub.subOrderId,ifnull(bm.bidusermappingId,0) as bidusermappingId
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
    Left Outer join transporter.user usr on usr.userId = bm.userId
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
    ;
    
End if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getBidsforBidding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getBidsforBidding`(in user_Id int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;

Select sub.subOrderId,
    cast((sub.subOrderTotalMargin - ((sub.subOrderTotalMargin * sub.bidLimit) / 100)) as UNSIGNED )
    as bidLowerLimit,
    case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    com.containerMasterName, wem.weightDesc,
    com.containerMasterId, wem.weightMasterId,
    case when bum.userId = user_Id then bidValue else null end as bidValue,
    case when bum.userId = user_Id then biduserStatus else null end as biduserStatus,
    sub.subOrderTotalMargin as originalRate,bum.bidusermappingId
    from transporter.order ord
    Left Outer Join transporter.suborder sub on ord.orderId = sub.orderId
    Left Outer Join  transporter.bid b  on sub.subOrderId = b.subOrderId
    Left Outer Join transporter.bidusermapping bum on b.bidId = bum.bidId and bum.userId = user_Id 
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
     Where sub.isDelete = 0 and sub.suborderStatusId <> 12;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForAdmin`(in user_Id int)
BEGIN



-- Get All Orders
CREATE TEMPORARY TABLE Orders
select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId;


-- Get All SubOrders
CREATE TEMPORARY TABLE SubOrders
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId;


-- Get All Bids
CREATE TEMPORARY TABLE Bids
Select b.bidName,  b.subOrderId, 
b.bidStatus, b.originalRate, bm.bidValue,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
bm.biduserStatus as AwardStatus, ord.sourceType, ord.destinationType,
c.containerMasterName,w.weightDesc
from transporter.bid b
Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
Inner Join transporter.suborder subo on b.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = bm.userId;

-- Get All Trips

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy;

Select count(*) as TotalOrders from Orders;
Select count(*) as TotalSubOrders from SubOrders;
Select count(*) as TotalBids from Bids;
Select count(*) as TotalTrips from Trips;

Select * from Orders;
Select * from SubOrders;
Select * from Bids;
Select * from Trips;

DROP TEMPORARY TABLE Orders;
DROP TEMPORARY TABLE SubOrders;
DROP TEMPORARY TABLE Bids;
DROP TEMPORARY TABLE Trips;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForCFS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForCFS`(IN user_Id int)
BEGIN

CREATE TEMPORARY TABLE Orders
select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
Where ord.createdBy =  user_Id;

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
where ord.createdBy =  user_Id;

Select count(*) as TotalOrders from Orders;
Select count(*) as TotalTrips from Trips;

Select * from Orders;
Select * from Trips;

DROP TEMPORARY TABLE Orders;
DROP TEMPORARY TABLE Trips;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForDriver` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForDriver`(In user_Id int)
BEGIN

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where dusr.userId = user_Id;

Select count(*) as TotalTrips from Trips;
Select * from Trips;

DROP TEMPORARY TABLE Trips;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForTransporter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForTransporter`(In user_Id int)
BEGIN

-- Get All SubOrders
CREATE TEMPORARY TABLE SubOrders
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId;

-- Get All Bids
CREATE TEMPORARY TABLE Bids
Select b.bidName,  b.subOrderId, 
b.bidStatus, b.originalRate, bm.bidValue,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
bm.biduserStatus as AwardStatus, ord.sourceType, ord.destinationType,
c.containerMasterName,w.weightDesc
from transporter.bid b
Inner Join transporter.bidusermapping bm on b.bidId = bm.bidId and bm.userId = user_Id
Inner Join transporter.suborder subo on b.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = bm.userId;

CREATE TEMPORARY TABLE Trips
Select t.tripId, subo.subOrderId, concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
Where t.createdBy = user_Id;


Select count(*) as TotalSubOrders from SubOrders;
Select count(*) as TotalBids from Bids;
Select count(*) as TotalTrips from Trips;


Select * from SubOrders;
Select * from Bids;
Select * from Trips;


DROP TEMPORARY TABLE SubOrders;
DROP TEMPORARY TABLE Bids;
DROP TEMPORARY TABLE Trips;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getOrderListForFilters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOrderListForFilters`(
in source_Id int, 
in destination_Id int,
in from_date varchar(50),
in to_date varchar(50),
in order_type int,
in order_status int,
in cust_Id int,
in current_user_Id int
-- out total_count int,
-- out return_Val varchar(150)
)
BEGIN

declare role_type int default 0;

Select typeSyscode into role_type from transporter.user where userId = current_user_Id;

-- CREATE TEMPORARY TABLE Orders
select   
ord.orderId, ord.sourceType,ord.destinationType,
concat(usr.firstName ,' ',usr.lastName) CustomerName,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,ord.totalRate,
ord.orderStatus,DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn,getCutOfftimebyOrderId(ord.orderId) as CutOffTime
from transporter.order ord
Left Outer join transporter.user usr on ord.createdBy = usr.userId
left join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
where ord.isDeleted = 0
and (ord.sourceId = source_Id or (source_Id is null or source_Id = 0)) 
and (ord.destinationId = destination_Id or (destination_Id is null or destination_Id = 0))
and 
(from_date = '' or DATE_FORMAT(orderDate,'%d-%m-%Y') >= DATE_FORMAT(from_date,'%d-%m-%Y')) and 
(to_date = '' or DATE_FORMAT(orderDate,'%d-%m-%Y') <= DATE_FORMAT(to_date,'%d-%m-%Y'))
and (ord.masterTypeId = order_type or (order_type is null or order_type= 0))
and (ord.orderStatusId = order_status or (order_status is null or order_status = 0))
and (ord.createdBy = cust_Id or (cust_Id is null or cust_Id  = 0))
and
(case when role_type <> 1 then ord.createdBy = current_user_Id else 1=1 end)
order by CutOffTime asc
;  

-- Select count(*) into total_count from Orders;
-- Select Concat("(", cast(total_count as char) , ") Rows Returned")  into return_Val;

-- Select * from Orders;

-- Drop table Orders;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPermissionsbyRoleId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPermissionsbyRoleId`(in role_Id int)
BEGIN
Select p.permissionId,p.permissionName,prm.permissionroleId,prm.isActive 
from transporter.permission p 
Inner Join transporter.permissionrolemapping prm on p.permissionId = prm.permissionId
where prm.roleId = role_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSubOrderListForFilters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubOrderListForFilters`(
in order_Id int, 
in cutoff_date varchar(50),
in suborder_date varchar(50),
in container_type int,
in weight_type int,
in suborder_status int
)
BEGIN
Select ord.orderId, subo.subOrderId,subo.subOrderTotal, subo.subOrderTotalMargin,
case when b.CutOffTime is not null then
concat(DATE_FORMAT(b.CutOffTime,'%d-%b-%Y'),' On ',DATE_FORMAT(b.CutOffTime,'%H:%i:%s'))
else
''
end as CutOffTime,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate,
subo.suborderStatus
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.bid b on subo.orderId = b.subOrderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
where ord.orderId = order_Id 
and (cutoff_date = '' or DATE_FORMAT(b.CutOffTime,'%d-%m-%Y') = DATE_FORMAT(cutoff_date,'%d-%m-%Y')) 
and (suborder_date = '' or DATE_FORMAT(subo.createdOn,'%d-%m-%Y') = DATE_FORMAT(suborder_date,'%d-%m-%Y'))
and (subo.containerType = container_type or (container_type is null or container_type= 0))
and (subo.containerWeightType = weight_type or (weight_type is null or weight_type= 0)) 
and (subo.suborderStatusId = suborder_status or (suborder_status is null or suborder_status= 0)) 
and subo.isDelete = 0;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSubOrdersbyOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getSubOrdersbyOrderId`(in order_Id int)
BEGIN

Select ord.orderId, subo.subOrderId,subo.subOrderSeq, subo.subOrderTotalMargin,subo.suborderStatus,
c.containerMasterName,w.weightDesc, DATE_FORMAT(subo.createdOn,'%d-%b-%Y') as SubOrderDate,
case when ifnull(bm.bidusermappingId,0) = 0 then false else true end as bidAwarded
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.bid b on subo.subOrderId = b.subOrderId
left outer join transporter.bidusermapping bm on b.bidId = bm.bidId and biduserStatusId = 5
where ord.orderId = order_Id and subo.isDelete = 0; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTripbySubOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTripbySubOrderId`(in subOrder_Id int)
BEGIN
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(dusr.firstName ,' ',dusr.lastName) as DriverName,
vhl.vehicleNumber,t.tripId,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
where t.subOrderId = subOrder_Id and t.isActive = 1  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTripDetailsbyTripId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripDetailsbyTripId`(in trip_Id int)
BEGIN

Select t.tripId, subo.subOrderId, 
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,t.billedAmount,
 t.sourceId,t.destinationId,
 DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
 case when t.startedBy is not null then concat(stusr.firstName ,' ',stusr.lastName) else 'NA' end as StartedBy,
 case when t.startDate is not null then concat(DATE_FORMAT(t.startDate,'%d-%b-%Y'),' On ',DATE_FORMAT(t.startDate,'%H:%i:%s')) else 'NA' end StartedAt,
 case when t.stoppeddBy is not null then concat(edusr.firstName ,' ',edusr.lastName) else 'NA' end as StoppedBy,
 case when t.endDate is not null then concat(DATE_FORMAT(t.endDate,'%d-%b-%Y'),' On ',DATE_FORMAT(t.endDate,'%H:%i:%s')) else 'NA' end StoppedAt
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
left outer join transporter.user stusr on stusr.userId = t.startedBy
left outer join transporter.user edusr on edusr.userId = t.stoppeddBy
Where t.tripId = trip_Id and t.isActive = 1 ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTripsbyId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripsbyId`(in trip_Id int)
BEGIN
Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, u.firstName + " - " + u.lastName as DriverName,
v.vehicleNumber,t.tripId,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName
from transporter.trip t
Inner Join transporter.suborder so on t.subOrderId = so.subOrderId
Inner Join transporter.order ord on so.orderId = ord.orderId
Left Outer Join transporter.vehiclemaster v on v.vehicleMasterId = t.assignedVehicle
Left Outer Join transporter.user u on u.userId = t.assignedDriver
Where t.tripId = trip_Id and t.isActive = 1 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTripsListForFilters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTripsListForFilters`(
in order_Id int, 
in source_Id int, 
in destination_Id int,
in container_type int,
in weight_type int,
in tripStatus int
)
BEGIN

Select t.tripId, subo.subOrderId, 
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
concat(usr.firstName ,' ',usr.lastName) TransporterName,
 vhl.vehicleNumber AssignedVehicle,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,
 cm.containerMasterName TransporterContainer,wm.weightDesc TransporterWeight,
 c.containerMasterName OrderContainer,w.weightDesc Orderweight, t.tripstatus,t.billedAmount,
 t.sourceId,t.destinationId,
 DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,
 case when t.startedBy is not null then concat(stusr.firstName ,' ',stusr.lastName) else 'NA' end as StartedBy,
 case when t.startDate is not null then concat(DATE_FORMAT(t.startDate,'%d-%b-%Y'),' On ',DATE_FORMAT(t.startDate,'%H:%i:%s')) else 'NA' end StartedAt,
 case when t.stoppeddBy is not null then concat(edusr.firstName ,' ',edusr.lastName) else 'NA' end as StoppedBy,
 case when t.endDate is not null then concat(DATE_FORMAT(t.endDate,'%d-%b-%Y'),' On ',DATE_FORMAT(t.endDate,'%H:%i:%s')) else 'NA' end StoppedAt
from transporter.trip t
Inner join transporter.suborder subo on t.subOrderId = subo.subOrderId
Inner Join transporter.order ord on subo.orderId = ord.orderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = t.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = t.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
left outer join transporter.containermaster c on subo.containerType = c.containerMasterId
left outer join transporter.weightmaster w on subo.containerWeightType = w.weightMasterId
left outer join transporter.user usr on usr.userId = t.createdBy
left outer join transporter.user stusr on stusr.userId = t.startedBy
left outer join transporter.user edusr on edusr.userId = t.stoppeddBy
Where ord.orderId = order_Id
and (ord.sourceId = source_Id or (source_Id is null or source_Id = 0)) 
and (ord.destinationId = destination_Id or (destination_Id is null or destination_Id = 0))
and (subo.containerType = container_type or (container_type is null or container_type= 0))
and (subo.containerWeightType = weight_type or (weight_type is null or weight_type= 0)) 
and (t.tripStatusId = tripStatus or (tripStatus is null or tripStatus = 0))
and t.isActive = 1 
;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MULTIPLETABLES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MULTIPLETABLES`(IN userid varchar(10),IN roleid varchar(10))
BEGIN
SELECT c.* FROM transporter2.cfsmaster c
Left Outer Join locationmaster l on c.locationId = l.locationId;

/*Inner Join transporter2.user u 
on c.userId = u.id and c.roleId = u.typeSyscode
Where c.userId = userid and c.roleId = roleid;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `postOrderProcessing_OLD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `postOrderProcessing_OLD`(in order_Id int)
Begin
Declare cfsRate decimal(10,2);
Declare containerType int default 0;
Declare weightType int default 0;
Declare trucks int default 0;
Declare orderRate decimal(10,2) default 0.00;
Declare masterType int default 0; 
Declare sourceID int default 0;
Declare destinationID int default 0;
Declare profit_margin decimal(10,2);
Declare profit_Rate decimal(10,2);
Declare order_date datetime;
Declare fromVal varchar(15);
Declare timeSlotId int default 0;

Select masterTypeId,sourceId,destinationId,DATE(orderDate),timeslotMasterId 
into masterType,sourceID,destinationID,order_date,timeSlotId
FROM transporter2.order where orderid = order_Id;

Select fromValue into  fromVal from transporter.timeslotmaster Where timeslotMasterId = timeSlotId;
Set fromVal = Concat(cast(order_date as char(12)) ,  fromVal ,":00:00"); 

Update transporter.order set orderDate = fromVal where orderid = order_Id;

Select settings_value into profit_margin
from settings Where settings_name = 'cfs_order_profit';



Begin
   DECLARE exit_loop int default 0; 
   DECLARE order_cursor CURSOR FOR
     Select container_type, weight_type,no_of_trucks
     from transporter2.container where orderId = order_Id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
   OPEN order_cursor;
   
   REPEAT
  
     FETCH  order_cursor INTO containerType,weightType,trucks;
     
     IF NOT exit_loop  THEN
		If masterType = 4 then
			Set cfsRate := (select rate * trucks
			from transporter2.cfsratemaster
			Where portId = sourceID and cfsId = destinationID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
		ElseIf masterType = 2 then
			Set cfsRate := (select rate * trucks
			from transporter2.cfsratemaster
			Where portId = destinationID and cfsId = sourceID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 3 then
			Set cfsRate := (select rate * trucks
			from transporter2.yardcfsratemaster
			Where yardId = sourceID and cfsId = destinationID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 1 then
			Set cfsRate := (select rate * trucks
			from transporter2.yardcfsratemaster
			Where yardId = destinationID and cfsId = sourceID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
		End if;
        
     END IF;
     UNTIL exit_loop END REPEAT;
    
   close order_cursor;
   
	Set profit_Rate = (orderRate * profit_margin)/ 100;
	Update transporter2.order set totalRate = orderRate,
    profitMarginPercentage = profit_margin,
    profitRate = profit_Rate,
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    Insert into transporter2.bid(bidName,containerId,container_type,
    container_weight_type,source_type,destination_type,original_rate,
    bid_rate,margin_percent,order_masterTypeId,
    source_name,destination_name,orderId,is_active,created_by,created_on) 
	Select GetBidNumber(),t.containerId,c.container_type,c.weight_type,
    ord.source_type,ord.destination_type,cr.rate,
    (cr.rate - ((cr.rate * s.settings_value) / 100)),
    s.settings_value,ord.masterTypeId,
    case 
    When ord.masterTypeId = 4 then 
    p.port_name
    When ord.masterTypeId = 2 then 
    cm.cfs_name
    When ord.masterTypeId = 3 then 
    y.yard_name
    When ord.masterTypeId = 1 then 
    ycm.cfs_name
    end,
    case 
    When ord.masterTypeId = 4 then 
    cm.cfs_name
    When ord.masterTypeId = 2 then 
    p.port_name
    When ord.masterTypeId = 3 then 
    ycm.cfs_name
    When ord.masterTypeId = 1 then 
    y.yard_name
    end,
	ord.orderId,1,1,CURDATE()
 	From transporter2.order ord
	Inner join transporter2.container c
	on ord.orderId = c.orderId
	Inner Join transporter2.truck t
	on c.containerId = t.containerId
    Left Outer Join transporter2.cfsratemaster cr on
    c.container_type = cr.containerId and c.weight_type = cr.weightId
    Left Outer Join transporter2.yardcfsratemaster ym on
    c.container_type = ym.containerId and c.weight_type = ym.weightId
        Left Outer Join transporter2.portmaster p on cr.portId = p.portId
    Left Outer Join transporter2.cfsmaster cm on cr.cfsId = cm.cfsMasterId 
    Left Outer Join transporter2.yardmaster y on ym.yardId = y.yardId
    Left Outer Join transporter2.cfsmaster ycm on ym.cfsId = ycm.cfsMasterId 
    Left Outer join settings s on settings_name = 'cfs_order_profit' 
	where ord.orderId = order_Id and
    case 
    when ord.masterTypeId = 4 then
     cr.portId = ord.sourceId and cr.cfsId = ord.destinationId
	when ord.masterTypeId = 2 then
	 cr.portId = ord.destinationId and cr.cfsId = ord.sourceId
	when ord.masterTypeId = 3 then
	 ym.yardId = ord.sourceId and ym.cfsId = ord.destinationId
	when ord.masterTypeId = 1 then
	 ym.yardId = ord.destinationId and ym.cfsId = ord.sourceId
     end;
    
  End;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procGetCFSFillOrder_OLD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetCFSFillOrder_OLD`(in user_Id int, in master_Type int)
BEGIN
Declare sourcetype varchar(20);
Declare destinationtype varchar(20);

Select sourceType,destinationType 
into sourcetype,destinationtype
From transporter2.mastertype where masterTypeId = master_Type;

IF(master_Type = 4) THEN
Select rat.containerMasterId,cont.containerMasterName,rat.weightMasterId,
wt.weightDesc
from transporter.cfsuserregistration reg
Inner Join transporter.cfsmaster mas on reg.cfsMasterId = mas.cfsMasterId
Inner Join transporter.cfsratemaster rat on mas.portMasterId = rat.portMasterId
Inner join transporter.containermaster cont 
on rat.containerMasterId = cont.containerMasterId 
Inner Join transporter.weightmaster wt 
on rat.weightMasterId = wt.weightMasterId 
Where reg.userId= user_Id and rat.isActive = 1;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procGetOrderDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetOrderDetails`(orderid int)
BEGIN
select ord.orderId, ord.sourceType,ord.destinationType,
case 
    When ord.masterTypeId = 4 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.sourceId)
    When ord.masterTypeId = 2 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    When ord.masterTypeId = 3 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.sourceId)
    When ord.masterTypeId = 1 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.sourceId)
    end  sourceName,
    case 
    When ord.masterTypeId = 4 then 
    (Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 2 then 
    (Select p.portName from portmaster p  where p.portMasterId = ord.destinationId)
    When ord.masterTypeId = 3 then 
	(Select cm.cfsName from cfsmaster cm where cm.cfsMasterId =  ord.destinationId)
    When ord.masterTypeId = 1 then 
    (Select y.yardName from yardmaster y where y.yardMasterId = ord.destinationId)
    end as destinationName,
    ptm.terminal,
ord.orderRemarks,concat(DATE_FORMAT(ord.orderDate, '%d-%b-%Y %a'),' ',tm.actualValue) as orderDate ,
ord.totalRate,
ord.orderStatus,

case when orderid is null then '' else getCutOfftimebyOrderId(orderid) end cutOffTime
/*subo.subOrderTotalMargin,bid.CutOffTime,subo.suborderStatus,
bum.bidSeq,
concat(usr.firstName ,' ',usr.lastName) TranporterName,bum.bidValue,bum.biduserStatus,
vhl.vehicleNumber,
case when trp.assignedDriver is not null then 
concat(dusr.firstName ,' ',dusr.lastName) else '' end AssignedDriver,dusr.emailid,dusr.mobileNumber,trp.tripstatus,
wm.weightDesc,cm.containerMasterName*/
from transporter.order ord
left outer join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
left outer join transporter.timeslotmaster tm on tm.timeslotMasterId = ord.timeslotMasterId
/*inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
left outer join  transporter.bid bid on bid.subOrderId= subo.subOrderId
left outer join transporter.bidusermapping bum on bum.bidId = bid.bidId
left outer join transporter.user usr on usr.userId = bum.userId
left outer join transporter.trip trp on trp.subOrderId = subo.subOrderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = trp.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = trp.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype
-- where  ord.orderId = orderid; */
where  (ord.orderId = orderid or orderid is null); 
-- and (bum.biduserstatusId != 22 or bum.biduserstatusId is null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procSchedulerConfirmBid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procSchedulerConfirmBid`()
BEGIN


declare totalbids int;

     DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;
  SET SQL_SAFE_UPDATES = 0;
 START TRANSACTION;
 Select settingsValue into totalbids from transporter.settings where settingsName = 'TotalBids';
-- First update the suborder with the Bid schedule master id and cutofftime as per there timing
update transporter.bid  b
inner join transporter.suborder sub on b.subOrderId = sub.subOrderId
inner join transporter.order ord  on sub.orderid = ord.orderid
inner join transporter.bidschedulemaster bis on TIMESTAMPDIFF(HOUR, ord.createdOn, ord.orderdate) between bis.fromHour and bis.ToHour
set b.BidScheduleId = bis.BidScheduleId,
	b.CutOffTime = case when bis.WorkingHours = 0 then DATE_ADD(ord.createdOn, INTERVAL bis.bidingHours HOUR) 
	 when bis.WorkingHours > 0 then FuncGetBidCutofftime(ord.createdon,bis.IsFullhour,bis.totalbidhour)
	end 
where b.BidScheduleId is null;
-- updte the order on 20 bid first come first serve basis
update bidusermapping bum
inner join 
(
	select bidusermappingId -- um.bidId,um.userid,min(bidValue) bidValue, min(createdOn) createdOn
	from
	(
	SELECT  bd.bidId , Count(bd.bidId) BidCount,bd.CutOffTime
	FROM transporter.bid bd
	inner join transporter.bidusermapping bum on bum.bidId = bd.bidId
	inner join transporter.suborder subo on subo.subOrderId = bd.subOrderId
	group by bd.bidId, bd.CutOffTime
	)bid
	inner join (
select * from 
(
SELECT bidusermappingId ,bidId,userId,bidValue,biduserStatus,DENSE_RANK() OVER (PARTITION BY
                     bidid
                 ORDER BY
                     bidValue,createdOn
                ) bid_rank

FROM transporter.bidusermapping
)t1
where bid_rank = 1) um on um.bidid= bid.bidId
	where bidcount >= totalbids  or( bidcount > 0 and CutOffTime <= now())
) dtl on dtl.bidusermappingId = bum.bidusermappingId and biduserStatus = 'BID_USER_EDIT'

  set biduserStatus = 'BID_USER_CONFIRMED', biduserStatusId = 5;
  
  -- inserting the confirmed order details to trip
  insert into transporter.trip
(subOrderId,sourceId,destinationId,tripstatus,tripStatusId,createdBy,createdOn,bidValue,isActive)
SELECT subo.subOrderId, ord.sourceId, ord.destinationId, 'TRIP_TRANSPORTER_ASSIGNED',16, userId, now(), bum.bidValue,1
FROM transporter.bidusermapping bum
inner join transporter.bid bd on bd.bidId = bum.bidId
inner join transporter.suborder subo on subo.subOrderId= bd.subOrderId
inner join transporter.order ord on ord.orderId = subo.orderId
left outer join transporter.trip trip on trip.subOrderId = subo.subOrderId 
where biduserStatus = 'BID_USER_CONFIRMED' and tripId is null;

update transporter.suborder sub 
inner join transporter.trip trp  on sub.subOrderId = trp.subOrderId 
set sub.suborderStatus = 'SUB_ORDER_BID_ASSIGNED',
	suborderStatusId = 12
where suborderStatusId != 12;


update transporter.bid bd 
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bd.bidStatus = 'BID_ASSIGNED',
	bd.bidStatusId = 2, 
    bd.isActive = 0
where bidStatusId != 2;

update  transporter.bidusermapping bum  
inner join transporter.bid bd on bum.bidid = bd.bidid
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bum.biduserStatus = 'BID_USER_DISCARD',
	bum.biduserStatusId = 22
where biduserStatusId != 5 and biduserStatusId != 22;



 update transporter.bid set cutofftime = now();
 COMMIT WORK;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procSchedulerConfirmBidForLogicTesting` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procSchedulerConfirmBidForLogicTesting`(
in created_on varchar(30),
in orderdate varchar(30),
in created_ontime_slot int,
in is_runSched int,
in cutoff_time varchar(30),
in cutoff_time_slot int
)
BEGIN
Declare porder_date datetime;
Declare fromVal varchar(30);
declare totalbids int;
declare cutoffSlot varchar(30);

Select settingsValue into totalbids from transporter.settings where settingsName = 'TotalBids';
Select fromValue into  fromVal from transporter.timeslotmaster Where timeslotMasterId = created_ontime_slot;
Set fromVal = concat(fromVal,":00:00"); 

Select fromValue into  cutoffSlot from transporter.timeslotmaster Where timeslotMasterId = cutoff_time_slot;
Set cutoffSlot = concat(cutoffSlot,":00:00"); 

Set created_on = concat(created_on,' ' ,CURRENT_TIME());
set porder_date =  CONCAT(DATE(orderdate),' ',fromVal);
set cutoff_time =  CONCAT(cutoff_time,' ',cutoffSlot);

SET SQL_SAFE_UPDATES = 0;

If(is_runSched = 0) then
Select case when bis.WorkingHours = 0 then DATE_ADD(created_on, INTERVAL bis.bidingHours HOUR)
when bis.WorkingHours > 0 then FuncGetBidCutofftime(created_on,bis.IsFullhour,bis.totalbidhour) end
CutOffTime
From transporter.bidschedulemaster bis
where TIMESTAMPDIFF(HOUR, created_on, porder_date)
between bis.fromHour and bis.ToHour;
Else
-- First update the suborder with the Bid schedule master id and cutofftime as per there timing
update transporter.bid  b
inner join transporter.suborder sub on b.subOrderId = sub.subOrderId
inner join transporter.order ord  on sub.orderid = ord.orderid
inner join transporter.bidschedulemaster bis on TIMESTAMPDIFF(HOUR, ord.createdOn, ord.orderdate) between bis.fromHour and bis.ToHour
set b.BidScheduleId = bis.BidScheduleId,
	b.CutOffTime = case when bis.WorkingHours = 0 then DATE_ADD(ord.createdOn, INTERVAL bis.bidingHours HOUR) 
	 when bis.WorkingHours > 0 then FuncGetBidCutofftime(ord.createdon,bis.IsFullhour,bis.totalbidhour)
	end 
where b.BidScheduleId is null;
-- updte the order on 20 bid first come first serve basis
update bidusermapping bum
inner join 
(
	select bidusermappingId -- um.bidId,um.userid,min(bidValue) bidValue, min(createdOn) createdOn
	from
	(
	SELECT  bd.bidId , Count(bd.bidId) BidCount,bd.CutOffTime
	FROM transporter.bid bd
	inner join transporter.bidusermapping bum on bum.bidId = bd.bidId
	inner join transporter.suborder subo on subo.subOrderId = bd.subOrderId
	group by bd.bidId, bd.CutOffTime
	)bid
	inner join (
select * from 
(
SELECT bidusermappingId ,bidId,userId,bidValue,biduserStatus,DENSE_RANK() OVER (PARTITION BY
                     bidid
                 ORDER BY
                     bidValue,createdOn
                ) bid_rank

FROM transporter.bidusermapping
)t1
where bid_rank = 1) um on um.bidid= bid.bidId
	where bidcount >= totalbids  or( bidcount > 0 and CutOffTime <= cutoff_time)
) dtl on dtl.bidusermappingId = bum.bidusermappingId and biduserStatus = 'BID_USER_EDIT'

  set biduserStatus = 'BID_USER_CONFIRMED', biduserStatusId = 5;
  
  -- inserting the confirmed order details to trip
  insert into transporter.trip
(subOrderId,sourceId,destinationId,tripstatus,tripStatusId,createdBy,createdOn,bidValue)
SELECT subo.subOrderId, ord.sourceId, ord.destinationId, 'TRIP_TRANSPORTER_ASSIGNED',16, userId, now(), bum.bidValue
FROM transporter.bidusermapping bum
inner join transporter.bid bd on bd.bidId = bum.bidId
inner join transporter.suborder subo on subo.subOrderId= bd.subOrderId
inner join transporter.order ord on ord.orderId = subo.orderId
left outer join transporter.trip trip on trip.subOrderId = subo.subOrderId 
where biduserStatus = 'BID_USER_CONFIRMED' and tripId is null;

update transporter.suborder sub 
inner join transporter.trip trp  on sub.subOrderId = trp.subOrderId 
set sub.suborderStatus = 'SUB_ORDER_BID_ASSIGNED',
	suborderStatusId = 12
where suborderStatusId != 12;


update transporter.bid bd 
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bd.bidStatus = 'BID_ASSIGNED',
	bd.bidStatusId = 2, 
    bd.isActive = 0
where bidStatusId != 2;

update  transporter.bidusermapping bum  
inner join transporter.bid bd on bum.bidid = bd.bidid
inner join transporter.trip trp  on bd.subOrderId = trp.subOrderId 
set bum.biduserStatus = 'BID_USER_DISCARD',
	bum.biduserStatusId = 22
where biduserStatusId != 5 and biduserStatusId != 22;
End If;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `repTreeViewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `repTreeViewOrder`()
BEGIN
select ord.orderId ,ord.sourceType as Source,ord.destinationType as Destination,
ord.orderRemarks as Remarks, DATE_FORMAT(ord.orderDate,'%d-%b-%Y') as OrderDate,ord.totalRate as OrderTotal,
ord.orderStatus as orderStatus
/*subo.suborderId,subo.subOrderTotal,cm.containerMasterName,
wm.weightDesc,subo.suborderStatus
bid.CutOffTime, bid.bidName,bid.bidStatus,
concat(usr.firstName ,' ',usr.lastName) UserName,bum.bidValue,bum.biduserStatus,
trp.assignedVehicle,trp.assignedDriver,trp.tripstatus*/
from transporter.order ord;
/*Inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.bid bid on bid.subOrderId= subo.subOrderId
left outer join transporter.bidusermapping bum on bum.bidId = bid.bidId
left outer join transporter.user usr on usr.userId = bum.userId
left outer join transporter.trip trp on trp.subOrderId = subo.subOrderId
left outer join transporter.containermaster cm on cm.containerMasterId = subo.containerType
left outer join transporter.weightmaster wm on wm.weightMasterId = subo.containerWeightType;
-- where   bum.biduserstatusId != 22;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RevokebidbysubOrderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RevokebidbysubOrderId`( 
in subOrder_Id int)
BEGIN

declare bid_Id int;
    DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;

START TRANSACTION;
Select bidId into bid_Id from transporter.bid where subOrderId = subOrder_Id;
-- updte the order on 20 bid first come first serve basis

  
  -- inserting the confirmed order details to trip
  update transporter.trip
  set tripstatus = 'TRIP_DISCARD_ADMIN',tripStatusId = 23,
  isActive = 0 where subOrderId = subOrder_Id;


update transporter.suborder sub 
set sub.suborderStatus = 'SUB_ORDER_PENDING',
	suborderStatusId = 11
where subOrderId = subOrder_Id;


update transporter.bid bd 
set bd.bidStatus = 'BID_PENDING',
	bd.bidStatusId = 1, 
    bd.isActive = 1
where bidStatusId = 2 and bidId = bid_Id;

update  transporter.bidusermapping bum  
set bum.biduserStatus = 'BID_USER_EDIT',
	bum.biduserStatusId = 4
where  bum.bidId = bid_Id;

COMMIT WORK;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveBatchUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveBatchUpdate`(
In master_type_Id int,
In is_update bit,
In bulk_data json)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;


START TRANSACTION;

If(master_type_Id = 1) then -- CFS To Yard

 Create Temporary table tbl_update
-- Insert into transporter.cfsyardratemaster(bidMarginRate,cfsMasterId,containerMasterId,
-- orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,isActive,createdBy,createdOn)
SELECT
  json_tb.bidMarginRate,
  json_tb.cfsMasterId,
  json_tb.cfsYardRateMasterId,
  json_tb.containerMasterId,
  json_tb.containerMasterName,
  json_tb.orderMarginRate,
  json_tb.portMasterId,
  json_tb.rate,
  json_tb.weightDesc,
  json_tb.weightMasterId,
  json_tb.yardMasterId,
  json_tb.yardName
  -- if(json_type(json_extract(JSON_OBJECT('b',json_tb.quantity),'$.b')) = 'NULL',1 ,0) 'quantity_is_null'

FROM JSON_TABLE
(
bulk_data
, "$[*]"
COLUMNS
(
bidMarginRate int PATH "$.bidMarginRate",
cfsMasterId int PATH "$.cfsMasterId",
cfsYardRateMasterId int PATH "$.cfsYardRateMasterId",
containerMasterId int PATH "$.containerMasterId",
containerMasterName varchar(150) PATH "$.containerMasterName",
orderMarginRate int PATH "$.orderMarginRate",
portMasterId int PATH "$.portMasterId",
rate int PATH "$.rate",
weightDesc varchar(150) PATH "$.weightDesc",
weightMasterId int PATH "$.weightMasterId",
yardMasterId int PATH "$.yardMasterId",
yardName varchar(150) PATH "$.yardName"
)
) json_tb;

If(is_update = 0) then
Insert into transporter.cfsyardratemaster(bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,isActive,createdBy,createdOn)
Select bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,1,1,now()
from tbl_update
Where cfsYardRateMasterId = 0 and rate > 0;
else
Update transporter.cfsyardratemaster yrm
Inner Join tbl_update u on yrm.cfsYardRateMasterId = u.cfsYardRateMasterId
set yrm.rate = u.rate , yrm.bidMarginRate = u.bidMarginRate, yrm.orderMarginRate = u.orderMarginRate; 
end if;
Drop Table tbl_update;

ElseIf(master_type_Id = 3) then -- Yard to CFS

Create Temporary table tbl_update
-- Insert into transporter.cfsyardratemaster(bidMarginRate,cfsMasterId,containerMasterId,
-- orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,isActive,createdBy,createdOn)
SELECT
  json_tb.bidMarginRate,
  json_tb.cfsMasterId,
  json_tb.yardCfsRateMasterId,
  json_tb.containerMasterId,
  json_tb.containerMasterName,
  json_tb.orderMarginRate,
  json_tb.portMasterId,
  json_tb.rate,
  json_tb.weightDesc,
  json_tb.weightMasterId,
  json_tb.yardMasterId,
  json_tb.yardName
  -- if(json_type(json_extract(JSON_OBJECT('b',json_tb.quantity),'$.b')) = 'NULL',1 ,0) 'quantity_is_null'

FROM JSON_TABLE
(
bulk_data
, "$[*]"
COLUMNS
(
bidMarginRate int PATH "$.bidMarginRate",
cfsMasterId int PATH "$.cfsMasterId",
yardCfsRateMasterId int PATH "$.yardCfsRateMasterId",
containerMasterId int PATH "$.containerMasterId",
containerMasterName varchar(150) PATH "$.containerMasterName",
orderMarginRate int PATH "$.orderMarginRate",
portMasterId int PATH "$.portMasterId",
rate int PATH "$.rate",
weightDesc varchar(150) PATH "$.weightDesc",
weightMasterId int PATH "$.weightMasterId",
yardMasterId int PATH "$.yardMasterId",
yardName varchar(150) PATH "$.yardName"
)
) json_tb;

If(is_update = 0) then
Insert into transporter.yardcfsratemaster(bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,isActive,createdBy,createdOn)
Select bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,1,1,now()
from tbl_update
Where yardCfsRateMasterId = 0 and rate > 0;
else
Update transporter.yardcfsratemaster yrm
Inner Join tbl_update u on yrm.yardCfsRateMasterId = u.yardCfsRateMasterId
set yrm.rate = u.rate , yrm.bidMarginRate = u.bidMarginRate, yrm.orderMarginRate = u.orderMarginRate; 
end if;

Drop Table tbl_update;

ElseIf(master_type_Id = 2) then -- CFS to Port

Create Temporary table tbl_update
-- Insert into transporter.cfsyardratemaster(bidMarginRate,cfsMasterId,containerMasterId,
-- orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,isActive,createdBy,createdOn)
SELECT
  json_tb.bidMarginRate,
  json_tb.cfsMasterId,
  json_tb.cfsPortRateMasterId,
  json_tb.containerMasterId,
  json_tb.containerMasterName,
  json_tb.orderMarginRate,
  json_tb.portMasterId,
  json_tb.rate,
  json_tb.weightDesc,
  json_tb.weightMasterId
  
  -- if(json_type(json_extract(JSON_OBJECT('b',json_tb.quantity),'$.b')) = 'NULL',1 ,0) 'quantity_is_null'

FROM JSON_TABLE
(
bulk_data
, "$[*]"
COLUMNS
(
bidMarginRate int PATH "$.bidMarginRate",
cfsMasterId int PATH "$.cfsMasterId",
cfsPortRateMasterId int PATH "$.cfsPortRateMasterId",
containerMasterId int PATH "$.containerMasterId",
containerMasterName varchar(150) PATH "$.containerMasterName",
orderMarginRate int PATH "$.orderMarginRate",
portMasterId int PATH "$.portMasterId",
rate int PATH "$.rate",
weightDesc varchar(150) PATH "$.weightDesc",
weightMasterId int PATH "$.weightMasterId"

)
) json_tb;

If(is_update = 0) then
Insert into transporter.cfsportratemaster(bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,isActive,createdBy,createdOn)
Select bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,1,1,now()
from tbl_update
Where cfsPortRateMasterId = 0 and rate > 0;
else
Update transporter.cfsportratemaster prm
Inner Join tbl_update u on prm.cfsPortRateMasterId = u.cfsPortRateMasterId
set prm.rate = u.rate , prm.bidMarginRate = u.bidMarginRate, prm.orderMarginRate = u.orderMarginRate; 
end if;

Drop Table tbl_update;


ElseIf(master_type_Id = 4) then -- Port to CFS

Create Temporary table tbl_update
-- Insert into transporter.cfsyardratemaster(bidMarginRate,cfsMasterId,containerMasterId,
-- orderMarginRate,portMasterId,rate,weightMasterId,yardMasterId,isActive,createdBy,createdOn)
SELECT
  json_tb.bidMarginRate,
  json_tb.cfsMasterId,
  json_tb.portCfsRateMasterId,
  json_tb.containerMasterId,
  json_tb.containerMasterName,
  json_tb.orderMarginRate,
  json_tb.portMasterId,
  json_tb.rate,
  json_tb.weightDesc,
  json_tb.weightMasterId
  
  -- if(json_type(json_extract(JSON_OBJECT('b',json_tb.quantity),'$.b')) = 'NULL',1 ,0) 'quantity_is_null'

FROM JSON_TABLE
(
bulk_data
, "$[*]"
COLUMNS
(
bidMarginRate int PATH "$.bidMarginRate",
cfsMasterId int PATH "$.cfsMasterId",
portCfsRateMasterId int PATH "$.portCfsRateMasterId",
containerMasterId int PATH "$.containerMasterId",
containerMasterName varchar(150) PATH "$.containerMasterName",
orderMarginRate int PATH "$.orderMarginRate",
portMasterId int PATH "$.portMasterId",
rate int PATH "$.rate",
weightDesc varchar(150) PATH "$.weightDesc",
weightMasterId int PATH "$.weightMasterId"

)
) json_tb;

If(is_update = 0) then
Insert into transporter.portcfsratemaster(bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,isActive,createdBy,createdOn)
Select bidMarginRate,cfsMasterId,containerMasterId,
orderMarginRate,portMasterId,rate,weightMasterId,1,1,now()
from tbl_update
Where portCfsRateMasterId = 0 and rate > 0;
else
Update transporter.portcfsratemaster prm
Inner Join tbl_update u on prm.portCfsRateMasterId = u.portCfsRateMasterId
set prm.rate = u.rate , prm.bidMarginRate = u.bidMarginRate, prm.orderMarginRate = u.orderMarginRate; 
end if;


Drop Table tbl_update;

End If;




COMMIT;
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `saveBidforTransporter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `saveBidforTransporter`(
in sub_orderId int,
in user_Id int,
in bidVal int
)
BEGIN
declare bid_Id int;
set bid_Id = 0;


select bidId into bid_Id from transporter.bid where subOrderId = sub_orderId;
If(bid_Id = 0) then
	Insert into transporter.bid(originalRate,exhibitionDate,
		subOrderId,isActive,createdBy,createdOn,bidUpperLimit,modifiedBy,
		modifiedOn,bidLowerLimit,bidStatus,bidStatusId)
		Select sub.subOrderTotalMargin,
		null,sub.subOrderId,1,user_Id,Now(),0,
		0,null,(sub.subOrderTotalMargin - ((sub.subOrderTotalMargin * sub.bidLimit) / 100)),'BID_PENDING',1
        From suborder sub 
        Where sub.subOrderId = sub_orderId;
        SELECT LAST_INSERT_ID() into bid_Id;
    Insert into transporter.bidusermapping(bidSeq,bidId,userId,bidValue,biduserStatus,biduserStatusId,createdBy,createdOn)
    values(GetBidSeq(sub_orderId),bid_Id,user_Id,bidVal,'BID_USER_EDIT',4,user_Id,Now());
        
else    

IF Exists(Select * from transporter.bidusermapping	Where bidId = bid_Id and userId = user_Id) then
    Update transporter.bidusermapping  set bidValue = bidVal, biduserStatus = 'BID_USER_EDIT',biduserStatusId = 4,
    modifiedBy = user_Id,modifiedOn = Now()
    Where bidId = bid_Id and userId = user_Id;
Else
 Insert into transporter.bidusermapping(bidSeq,bidId,userId,bidValue,biduserStatus,biduserStatusId,createdBy,createdOn)
    values(GetBidSeq(sub_orderId),bid_Id,user_Id,bidVal,'BID_USER_EDIT',4,user_Id,Now());
End If;    
End If;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `savePermissionRole` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `savePermissionRole`(
in role_Id int,
in user_Id int,
in permissions json)
BEGIN

DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;


START TRANSACTION;

Create temporary table tbl_update
SELECT
  json_tb.permissionId,
  json_tb.permissionName,
  json_tb.isActive
  -- if(json_type(json_extract(JSON_OBJECT('b',json_tb.quantity),'$.b')) = 'NULL',1 ,0) 'quantity_is_null'
FROM JSON_TABLE
(
permissions
, "$[*]"
COLUMNS
(
permissionId int PATH "$.permissionId",
permissionName varchar(150) PATH "$.permissionName",
isActive tinyint(1) PATH "$.isActive"
)
) json_tb;


If Not Exists (Select * from transporter.permissionrolemapping where roleId = role_Id) then  
Begin

	Insert into transporter.permissionrolemapping(roleId,permissionId,isActive,createdBy,createdOn)
    Select role_Id,permissionId,isActive,user_Id,now() from tbl_update;
End;    
Else

Begin

DECLARE permission_Id INTEGER DEFAULT 0;
DECLARE is_Active tinyint(1) DEFAULT 0;

DECLARE exit_loop int default 0; 
DECLARE curPermissions CURSOR FOR Select permissionId,isActive from tbl_update;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
OPEN curPermissions;
REPEAT
     FETCH  curPermissions INTO permission_Id,is_Active;
IF NOT exit_loop  THEN

	If Not Exists (Select * from transporter.permissionrolemapping where roleId = role_Id and 
    permissionId = permission_Id) then 
    Begin
		
		Insert into transporter.permissionrolemapping(roleId,permissionId,isActive,createdBy,createdOn)
		Values
		(role_Id,permission_Id,is_Active,user_Id,now());
	End;
	Else
    Begin
		
		Update transporter.permissionrolemapping set isActive = is_Active,
		modifiedBy = user_Id,modifiedOn = now() 
		Where permissionId = permission_Id and roleId = role_Id;
	End;
	End If;
END IF;
     UNTIL exit_loop END REPEAT;
CLOSE curPermissions;

End;

Drop Table tbl_update;

End If;

Commit;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SEARCHCFSLOCATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SEARCHCFSLOCATION`(IN userId varchar(10))
BEGIN
	SELECT l.*,m.cfsMasterId,m.cfs_name FROM transporter2.locationmaster l
    Inner join transporter2.cfsmaster m
    on l.locationId = m.locationId; 
    -- WHERE m.userId = userId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subOrderProcessing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subOrderProcessing`(in order_Id int)
Begin
Declare cfsRate decimal(10,2);
Declare containerType int default 0;
Declare weight_type int default 0;
Declare trucks int default 0;
Declare orderRate decimal(10,2) default 0.00;
Declare masterType, cnt int default 0; 
Declare source_Id int default 0;
Declare destination_Id int default 0;
Declare profit_margin, bid_limit_percent decimal(10,2) default 0.00;
Declare profit_Rate, cfs_rate decimal(10,2) default 0.00;
Declare container_Id int default 0;
Declare created_by int default 0;
Declare subOrderId int default 0;
Declare order_date datetime;
Declare fromVal varchar(30);
Declare timeSlotId int default 0;
-- For Debug 
-- select concat('** ', msg) AS '** DEBUG:';
--
Select masterTypeId,sourceId,destinationId,createdBy,DATE(orderDate),timeslotMasterId  
into masterType,source_Id,destination_Id,created_by,order_date,timeSlotId
FROM transporter.order where orderId = order_Id;

Select fromValue into  fromVal from transporter.timeslotmaster Where timeslotMasterId = timeSlotId;
Set fromVal = concat(fromVal,":00:00"); 

Update transporter.order set orderDate = CONCAT(DATE(order_date),' ',fromVal) where orderid = order_Id;

/*Select settingsValue into profit_margin
from settings Where settingsName = 'cfs_order_profit';

Select settingsValue into bid_limit_percent
from settings Where settingsName = 'bid_lower_limit';*/


Begin
   DECLARE exit_loop int default 0; 
   DECLARE order_cursor CURSOR FOR
     Select containerMasterId, weightType,numberOfTrucks,container_Id
     from transporter.container where orderId = order_Id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
   OPEN order_cursor;
   
   REPEAT
  
     FETCH  order_cursor INTO containerType,weight_type,trucks,container_Id;
     
     IF NOT exit_loop  THEN
		If masterType = 4 then -- Port To CFS
		select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.portcfsratemaster
			Where portMasterId = source_Id  
            and cfsMasterId = destination_Id
			and weightMasterId = weight_type 
            and containerMasterId = containerType;
			
            -- Set subOrderId = 0;
            -- Set cfs_rate = (cfsRate - ((cfsRate * profit_margin) / 100));
             
           
            
            Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
            -- select concat('** ', cfsRate) AS '** DEBUG:';
		ElseIf masterType = 2 then -- CFS To Port
			select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.cfsportratemaster
			Where portMasterId = destination_Id and cfsMasterId = source_Id
			and weightMasterId = weight_type and containerMasterId = containerType;
			Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
        ElseIf masterType = 3 then -- Yard To CFS
			select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.yardcfsratemaster yrm
            inner join transporter.cfsmaster cm on yrm.portMasterId = cm.portMasterId
            and yrm.cfsMasterId = cm.cfsMasterId 
			Where yrm.yardMasterId = source_Id and yrm.cfsMasterId = destination_Id
			and weightMasterId = weight_type and containerMasterId = containerType
            and yrm.portMasterId = cm.portMasterId;
			Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
        ElseIf masterType = 1 then -- CFS To Yard
			select rate * trucks, orderMarginRate into
             cfsRate,profit_margin
			from transporter.cfsyardratemaster yrm
            inner join transporter.cfsmaster cm on yrm.portMasterId = cm.portMasterId
            and yrm.cfsMasterId = cm.cfsMasterId 
			Where yardMasterId = destination_Id and yrm.cfsMasterId = source_Id
			and weightMasterId = weight_type and containerMasterId = containerType
            and yrm.portMasterId = cm.portMasterId;
			Set orderRate = orderRate + cfsRate;
            Set profit_Rate = profit_Rate + ((cfsRate * profit_margin)/ 100);
		End if;
        Set cnt = cnt + 1;
     END IF;
     UNTIL exit_loop END REPEAT;
    
   close order_cursor;
   
	-- Set profit_Rate = (orderRate * profit_margin)/ 100;
	Update transporter.order set totalRate = orderRate,
    profitMarginPercentage = 0,
    profitRate = profit_Rate,
    orderStatus = 'ORDER_ACCEPTED',
    orderStatusId = 6,
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    -- Insert SubOrder
Insert into transporter.suborder(orderId,subOrderTotal,bidLimit,isDelete,createdBy,
createdOn,modifiedBy,modifiedOn,cotainerId,containerType,containerWeightType,
subOrderTotalMargin,marginPercent,suborderStatus,suborderStatusId,subOrderSeq)
Select order_Id,
case 
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select rate  from transporter.cfsportratemaster 
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select rate  from transporter.portcfsratemaster 
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select rate 
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select rate  
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId and cy.yardMasterId = ord.destinationId 
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end ,
case 
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select  bidMarginRate from transporter.cfsportratemaster 
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select bidMarginRate from transporter.portcfsratemaster 
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select  bidMarginRate 
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select bidMarginRate
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId and cy.yardMasterId = ord.destinationId 
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end, 
0,created_by,Now(),
0,null,t.containerId,c.containerMasterId,
c.weightType,
case 
when ord.masterTypeId = 2 then  -- CFS To Port
	(Select (rate - ((rate * orderMarginRate) / 100)) from transporter.cfsportratemaster 
	where cfsMasterId = ord.sourceId and portMasterId = ord.destinationId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 4 then  -- Port To CFS
	(Select (rate - ((rate * orderMarginRate) / 100)) from transporter.portcfsratemaster 
	where cfsMasterId = ord.destinationId and portMasterId = ord.sourceId
	and containerMasterId = c.containerMasterId and weightMasterId = c.weightType)
when ord.masterTypeId = 3 then  -- Yard To CFS
	(Select (rate - ((rate * orderMarginRate) / 100)) 
    from transporter.yardcfsratemaster yc
    inner join transporter.cfsmaster cfs on yc.cfsMasterId = cfs.cfsMasterId and yc.portMasterId = cfs.portMasterId
	where yc.cfsMasterId = ord.destinationId and yc.yardMasterId = ord.sourceId
	and yc.containerMasterId = c.containerMasterId and yc.weightMasterId = c.weightType and yc.portMasterId = cfs.portMasterId)
when ord.masterTypeId = 1 then  -- CFS To Yard
	(Select (rate - ((rate * orderMarginRate) / 100)) 
    from transporter.cfsyardratemaster cy
    inner join transporter.cfsmaster cfs on cy.cfsMasterId = cfs.cfsMasterId and cy.portMasterId = cfs.portMasterId
	where cy.cfsMasterId = ord.sourceId  and cy.yardMasterId = ord.destinationId
	and cy.containerMasterId = c.containerMasterId and cy.weightMasterId = c.weightType and cy.portMasterId = cfs.portMasterId)
end,
0,'SUB_ORDER_PENDING',11,GetSubOrderSeq(order_Id)
From transporter.order ord
Inner join transporter.container c
on ord.orderId = c.orderId
Inner Join transporter.truck t
on c.containerId = t.containerId
-- Left Outer join settings s on settingsName = 'cfs_order_profit' 
where ord.orderId = order_Id;

            
            
            -- End SubOrder
			-- Insert Bid
			
		/*Insert into transporter.bid(bidName,originalRate,exhibitionDate,
		subOrderId,isActive,createdBy,createdOn,bidUpperLimit,modifiedBy,
		modifiedOn,bidLowerLimit,bidStatus,bidStatusId)
		Select GetBidNumber(),sub.subOrderTotalMargin,
		null,sub.subOrderId,1,created_by,CURDATE(),0,
		0,null,(sub.subOrderTotalMargin - ((sub.subOrderTotalMargin * sub.bidLimit) / 100)),'BID_PENDING',1
        From suborder sub 
        Where orderId = order_Id;*/
        
                
            -- End Bid   
    
  End;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_proc`()
BEGIN

declare role_Id int default 21;
declare user_Id int default 1;

DECLARE permission_Id INTEGER DEFAULT 0;
DECLARE is_Active tinyint(1) DEFAULT 0;

DECLARE exit_loop int default 0; 

DECLARE curPermissions CURSOR FOR Select permissionId,isActive from tbl_update_json;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
OPEN curPermissions;
REPEAT
     FETCH  curPermissions INTO permission_Id,is_Active;
IF NOT exit_loop  THEN

	If Not Exists (Select * from transporter.permissionrolemapping where roleId = role_Id and 
    permissionId = permission_Id) then 
    Begin
		Insert into transporter.permissionrolemapping(roleId,permissionId,isActive,createdBy,createdOn)
		Values
		(role_Id,permission_Id,is_Active,user_Id,now());
	End;
	Else
    Begin
		Update transporter.permissionrolemapping set isActive = is_Active,
		modifiedBy = user_Id,modifiedOn = now() 
		Where permissionId = permission_Id and roleId = role_Id;
	End;
	End If;
END IF;
     UNTIL exit_loop END REPEAT;
CLOSE curPermissions;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-10 23:58:58
