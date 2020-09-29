-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: transporter
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bid` (
  `bidId` int(11) NOT NULL AUTO_INCREMENT,
  `bidName` varchar(512) DEFAULT NULL,
  `originalRate` int(11) DEFAULT NULL,
  `exhibitionDate` datetime DEFAULT NULL,
  `subOrderId` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `bidUpperLimit` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `bidLowerLimit` int(11) DEFAULT NULL,
  `bidRate` int(11) DEFAULT NULL,
  `bidStatus` varchar(512) DEFAULT NULL,
  `bidStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (4,'BID00000001',450,NULL,10,0,4,'2020-08-30 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(5,'BID00000005',450,NULL,11,0,4,'2020-08-30 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(6,'BID00000006',450,NULL,12,0,4,'2020-09-02 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(7,'BID00000007',450,NULL,13,0,4,'2020-09-02 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(9,'BID00000008',450,NULL,15,0,4,'2020-09-02 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(10,'BID00000010',450,NULL,16,0,4,'2020-09-02 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidschedulemaster`
--

DROP TABLE IF EXISTS `bidschedulemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bidschedulemaster` (
  `BidScheduleId` int(11) NOT NULL,
  `FromHour` int(11) DEFAULT NULL,
  `ToHour` int(11) DEFAULT NULL,
  `BidingHours` int(11) DEFAULT NULL,
  `WorkingHours` int(11) DEFAULT NULL,
  `GraceHours` int(11) DEFAULT NULL,
  `BidCountUpto` int(11) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `TotalBidHour` int(11) DEFAULT NULL,
  `IsFullHour` int(11) DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bidusermapping` (
  `bidusermappingId` int(11) NOT NULL AUTO_INCREMENT,
  `bidId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bidValue` int(11) DEFAULT NULL,
  `biduserStatus` varchar(512) DEFAULT NULL,
  `biduserStatusId` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
INSERT INTO `bidusermapping` VALUES (1,4,5,440,'BID_USER_DISCARD',22,NULL,NULL,NULL,NULL),(2,5,5,360,'BID_USER_CONFIRMED',5,NULL,NULL,NULL,NULL),(3,4,6,430,'BID_USER_CONFIRMED',5,NULL,NULL,NULL,NULL),(4,5,6,400,'BID_USER_DISCARD',22,NULL,NULL,NULL,NULL),(5,6,5,400,'BID_USER_CONFIRMED',5,NULL,NULL,NULL,NULL),(6,7,5,430,'BID_USER_DISCARD',22,NULL,NULL,NULL,NULL),(7,6,6,410,'BID_USER_DISCARD',22,NULL,NULL,NULL,NULL),(8,7,6,410,'BID_USER_CONFIRMED',5,NULL,NULL,NULL,NULL),(9,9,5,360,'BID_USER_CONFIRMED',5,NULL,NULL,NULL,NULL),(10,10,5,450,'BID_USER_CONFIRMED',5,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bidusermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsmaster`
--

DROP TABLE IF EXISTS `cfsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cfsmaster` (
  `cfsMasterId` int(11) NOT NULL AUTO_INCREMENT,
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
  `portMasterId` int(11) DEFAULT NULL,
  `locationMasterId` int(11) DEFAULT NULL,
  `stateMasterId` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cfsMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
INSERT INTO `cfsmaster` VALUES (1,'CFS All Cargo','8885462130','alc@cfs.com','Add1','Add2','LandMark','411047','CFS001','ldkfjkldfhv','djvhdkjvb','dvbnmbv','Utsav','8795462130','Gaurav','7985462130','44556','552255',1,1,1,1,'2020-08-30 07:25:55',1,'2020-08-30 07:25:55',1),(2,'CFS-T1','6123456789','cfst1@gotek.dev','Addr1','Addr2','NA','400020','A1234','','','','Test Contact','6123456789','','','123','123',1,1,1,1,'2020-09-02 14:28:54',1,'2020-09-02 14:28:54',1),(3,'CFS-T2','6234567890','cfst2@gotek.dev','Addr1','Addr2','NA','400020','A1235','','','','Test Contact','6123456788','','','123','123',2,1,1,1,'2020-09-02 15:23:02',1,'2020-09-02 15:23:02',1);
/*!40000 ALTER TABLE `cfsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsportratemaster`
--

DROP TABLE IF EXISTS `cfsportratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cfsportratemaster` (
  `cfsPortRateMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `portMasterId` int(11) DEFAULT NULL,
  `weightMasterId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `bidMarginRate` int(11) DEFAULT NULL,
  `orderMarginRate` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  `cfsMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cfsPortRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsportratemaster`
--

LOCK TABLES `cfsportratemaster` WRITE;
/*!40000 ALTER TABLE `cfsportratemaster` DISABLE KEYS */;
INSERT INTO `cfsportratemaster` VALUES (1,1,1,500,20,10,1,1,'2020-08-30 07:36:38',1,'2020-08-30 07:36:38',1,1),(2,2,2,1000,20,10,1,1,'2020-09-02 15:17:30',1,'2020-09-02 15:17:30',2,2);
/*!40000 ALTER TABLE `cfsportratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsuserregistration`
--

DROP TABLE IF EXISTS `cfsuserregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cfsuserregistration` (
  `cfsUserRegistrationId` int(11) NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int(11) DEFAULT NULL,
  `userTypeId` int(11) DEFAULT NULL,
  `cfsUserName` varchar(512) DEFAULT NULL,
  `cfsUserDesignation` varchar(512) DEFAULT NULL,
  `cfsUserDepartment` varchar(512) DEFAULT NULL,
  `cfsUserMobileNumber` varchar(512) DEFAULT NULL,
  `cfsUserEmail` varchar(512) DEFAULT NULL,
  `cfsUserPassword` varchar(512) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`cfsUserRegistrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsuserregistration`
--

LOCK TABLES `cfsuserregistration` WRITE;
/*!40000 ALTER TABLE `cfsuserregistration` DISABLE KEYS */;
INSERT INTO `cfsuserregistration` VALUES (1,1,7,'CFS User','Designation','Department','8875415230','alc@admin.in','123456789',4,1,1,1,'2020-08-30 07:34:20',1,'2020-08-30 07:34:20'),(2,3,7,'RatnaUsr1','NA','NA','6123456789','cfst2@gotek.dev','password1',9,1,1,1,'2020-09-02 15:47:13',1,'2020-09-02 15:47:13'),(3,3,8,'cfst2usr1','NA','NA','6123456789','cfst2usr1@gotek.dev','password1',10,1,1,1,'2020-09-02 18:12:23',1,'2020-09-02 18:12:23');
/*!40000 ALTER TABLE `cfsuserregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsyardratemaster`
--

DROP TABLE IF EXISTS `cfsyardratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cfsyardratemaster` (
  `cfsYardRateMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int(11) NOT NULL,
  `yardMasterId` int(11) NOT NULL,
  `containerMasterId` int(11) NOT NULL,
  `weightMasterId` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `bidMarginRate` int(11) DEFAULT NULL,
  `orderMarginRate` int(11) DEFAULT NULL,
  `portMasterId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`cfsYardRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsyardratemaster`
--

LOCK TABLES `cfsyardratemaster` WRITE;
/*!40000 ALTER TABLE `cfsyardratemaster` DISABLE KEYS */;
INSERT INTO `cfsyardratemaster` VALUES (1,3,2,2,2,2000,20,10,2,1,0,'2020-09-02 15:23:10',NULL,NULL),(2,1,1,1,1,500,20,10,1,1,0,'2020-09-02 19:39:01',NULL,NULL);
/*!40000 ALTER TABLE `cfsyardratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `container` (
  `containerId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `weightType` int(11) DEFAULT NULL,
  `numberOfTrucks` int(11) DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (4,4,1,2,1,0,1,'2020-08-30 08:07:53',1,'2020-08-30 08:07:53'),(5,5,1,2,1,0,1,'2020-09-02 06:15:50',1,'2020-09-02 06:15:50'),(6,6,1,2,1,0,1,'2020-09-02 19:49:00',1,'2020-09-02 19:49:00');
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containermaster`
--

DROP TABLE IF EXISTS `containermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `containermaster` (
  `containerMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `containerMasterName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`containerMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containermaster`
--

LOCK TABLES `containermaster` WRITE;
/*!40000 ALTER TABLE `containermaster` DISABLE KEYS */;
INSERT INTO `containermaster` VALUES (1,'10 FT',1,1,'2020-08-30 07:35:17',1,'2020-08-30 07:35:17'),(2,'20 FT',1,1,'2020-08-30 07:35:34',1,'2020-08-30 07:35:34'),(3,'40 FT',1,1,'2020-09-02 15:15:04',1,'2020-09-02 15:15:04');
/*!40000 ALTER TABLE `containermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieselratemaster`
--

DROP TABLE IF EXISTS `dieselratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dieselratemaster` (
  `dieselRateId` int(11) NOT NULL AUTO_INCREMENT,
  `dieselRate` int(11) DEFAULT NULL,
  `dieselRateDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `driver` (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(512) DEFAULT NULL,
  `lastname` varchar(512) DEFAULT NULL,
  `emailId` varchar(512) DEFAULT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `userPassword` varchar(512) DEFAULT NULL,
  `locationMasterId` int(11) DEFAULT NULL,
  `stateMasterId` int(11) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `identitytype` int(11) DEFAULT NULL,
  `identitynumber` varchar(512) DEFAULT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`driverId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Transporter1 ','Driver','alc@driver.in','88774452632','123456789',1,1,'4411008','Add1','Add2','LandMark',1,3,'5525566',6,'2020-08-30 11:23:21',6,'2020-08-30 11:23:21',7),(2,'driver123','driver','driver@trans.in','7788954520','123456789',1,1,'44142','add1','add2','djf',1,4,'4454545',5,'2020-09-02 20:07:01',5,'2020-09-02 20:07:01',11);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivertransportermapping`
--

DROP TABLE IF EXISTS `drivertransportermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drivertransportermapping` (
  `drivertransportermappingId` int(11) NOT NULL AUTO_INCREMENT,
  `driverId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`drivertransportermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivertransportermapping`
--

LOCK TABLES `drivertransportermapping` WRITE;
/*!40000 ALTER TABLE `drivertransportermapping` DISABLE KEYS */;
INSERT INTO `drivertransportermapping` VALUES (1,7,6,6,'2020-08-30 11:23:21',NULL,NULL),(2,11,5,5,'2020-09-02 20:07:01',NULL,NULL);
/*!40000 ALTER TABLE `drivertransportermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationmaster`
--

DROP TABLE IF EXISTS `locationmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `locationmaster` (
  `locationMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `locationName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `stateMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`locationMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationmaster`
--

LOCK TABLES `locationmaster` WRITE;
/*!40000 ALTER TABLE `locationmaster` DISABLE KEYS */;
INSERT INTO `locationmaster` VALUES (1,'Mumbai',1,1,'2020-08-30 07:19:33',NULL,NULL,1),(2,'Ratnagiri',1,1,'2020-09-02 14:46:24',NULL,NULL,1);
/*!40000 ALTER TABLE `locationmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mastertype`
--

DROP TABLE IF EXISTS `mastertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mastertype` (
  `masterTypeId` int(11) NOT NULL AUTO_INCREMENT,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mileagemaster` (
  `mileageId` int(11) NOT NULL AUTO_INCREMENT,
  `containerId` int(11) DEFAULT NULL,
  `weightId` int(11) DEFAULT NULL,
  `mileage` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notification` (
  `notificationId` int(11) NOT NULL AUTO_INCREMENT,
  `notificationType` varchar(512) DEFAULT NULL,
  `notificationDesc` varchar(512) DEFAULT NULL,
  `orderId` int(11) NOT NULL,
  `bidId` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `assignedToRole` int(11) DEFAULT NULL,
  `assignedToUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS User CFS User placed a new Order on 2020-08-30!',3,NULL,4,'2020-08-30 08:04:52',0,1,NULL),(2,'orders','CFS User CFS User placed a new Order on 2020-08-30!',4,NULL,4,'2020-08-30 08:07:54',0,1,NULL),(3,'orders','All Cargo Transporter confirmed a bid on 2020-08-30!',1,NULL,5,'2020-08-30 11:10:51',0,1,NULL),(4,'orders','All Cargo Transporter confirmed a bid on 2020-08-30!',1,NULL,5,'2020-08-30 11:11:41',0,1,NULL),(5,'orders','All Cargo Transporter confirmed a bid on 2020-08-30!',1,NULL,5,'2020-08-30 11:12:00',0,1,NULL),(6,'orders','All Cargo Transporter 2 confirmed a bid on 2020-08-30!',1,NULL,6,'2020-08-30 11:13:36',0,1,NULL),(7,'orders','All Cargo Transporter 2 confirmed a bid on 2020-08-30!',1,NULL,6,'2020-08-30 11:13:42',0,1,NULL),(8,'orders','CFS User CFS User placed a new Order on 2020-09-02!',5,NULL,4,'2020-09-02 06:15:51',0,1,NULL),(9,'orders','All Cargo Transporter confirmed a bid on 2020-09-02!',1,NULL,5,'2020-09-02 06:16:50',0,1,NULL),(10,'orders','All Cargo Transporter confirmed a bid on 2020-09-02!',1,NULL,5,'2020-09-02 06:16:52',0,1,NULL),(11,'orders','All Cargo Transporter 2 confirmed a bid on 2020-09-02!',1,NULL,6,'2020-09-02 06:17:41',0,1,NULL),(12,'orders','All Cargo Transporter 2 confirmed a bid on 2020-09-02!',1,NULL,6,'2020-09-02 06:17:46',0,1,NULL),(13,'orders','All Cargo Transporter confirmed a bid on 2020-09-02!',1,NULL,5,'2020-09-02 06:18:16',0,1,NULL),(14,'orders','CFS User CFS User placed a new Order on 2020-09-03!',6,NULL,4,'2020-09-02 19:49:01',0,1,NULL),(15,'orders','All Cargo Transporter confirmed a bid on 2020-09-03!',1,NULL,5,'2020-09-02 19:55:59',0,1,NULL),(16,'orders','All Cargo Transporter confirmed a bid on 2020-09-03!',1,NULL,5,'2020-09-02 19:57:11',0,1,NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderTypeId` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `masterTypeId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `destinationId` int(11) DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  `orderRemarks` varchar(512) DEFAULT NULL,
  `orderAddress` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `orderStatus` varchar(512) DEFAULT NULL,
  `orderStatusId` int(11) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `totalRate` int(11) DEFAULT NULL,
  `profitRate` int(11) DEFAULT NULL,
  `portTerminalId` int(11) DEFAULT NULL,
  `profitMarginPercentage` int(11) DEFAULT NULL,
  `rateExcludingProfit` int(11) DEFAULT NULL,
  `timeslotMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (4,NULL,'2020-09-01 11:00:00',2,1,1,'CFS','PORT','01 SEP 11 AM - 12 AM','',0,0,'ORDER_ACCEPTED',6,4,'2020-08-30 11:30:59',4,'2020-08-30 08:07:53',1000,100,1,0,900,12),(5,NULL,'2020-09-05 11:00:00',2,1,1,'CFS','PORT','05 SEP 11 AM - 12 AM','',0,0,'ORDER_ACCEPTED',6,4,'2020-09-02 06:15:50',4,'2020-09-02 06:15:50',1000,100,1,0,900,12),(6,NULL,'2020-09-04 11:00:00',1,1,1,'CFS','YARD','04 SEP 11 AM','',0,0,'ORDER_DELIVERED',9,4,'2020-09-02 20:09:31',4,'2020-09-02 19:49:00',1000,100,0,0,900,12);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permission` (
  `permissionId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
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
INSERT INTO `permission` VALUES (1,'dashboardFull',NULL,NULL,NULL,NULL,1),(2,'dashboardRead',NULL,NULL,NULL,NULL,1),(3,'dashboardWrite',NULL,NULL,NULL,NULL,1),(4,'cfsFull',NULL,NULL,NULL,NULL,1),(5,'cfsRead',NULL,NULL,NULL,NULL,1),(6,'cfsWrite',NULL,NULL,NULL,NULL,1),(7,'createOrderFull',NULL,NULL,NULL,NULL,1),(8,'createOrderRead',NULL,NULL,NULL,NULL,1),(9,'createOrderWrite',NULL,NULL,NULL,NULL,1),(10,'listOrderFull',NULL,NULL,NULL,NULL,1),(11,'listOrderRead',NULL,NULL,NULL,NULL,1),(12,'listOrderWrite',NULL,NULL,NULL,NULL,1),(13,'userRegistrationFull',NULL,NULL,NULL,NULL,1),(14,'userRegistrationRead',NULL,NULL,NULL,NULL,1),(15,'userRegistrationWrite',NULL,NULL,NULL,NULL,1),(16,'userListFull',NULL,NULL,NULL,NULL,1),(17,'userListRead',NULL,NULL,NULL,NULL,1),(18,'userListWrite',NULL,NULL,NULL,NULL,1),(19,'tranporterFull',NULL,NULL,NULL,NULL,1),(20,'tranporterRead',NULL,NULL,NULL,NULL,1),(21,'tranporterWrite',NULL,NULL,NULL,NULL,1),(22,'bidsFull',NULL,NULL,NULL,NULL,1),(23,'bidsRead',NULL,NULL,NULL,NULL,1),(24,'bidsWrite',NULL,NULL,NULL,NULL,1),(25,'vehicleRegistrationFull',NULL,NULL,NULL,NULL,1),(26,'vehicleRegistrationRead',NULL,NULL,NULL,NULL,1),(27,'vehicleRegistrationWrite',NULL,NULL,NULL,NULL,1),(28,'vehicleListFull',NULL,NULL,NULL,NULL,1),(29,'vehicleListRead',NULL,NULL,NULL,NULL,1),(30,'vehicleListWrite',NULL,NULL,NULL,NULL,1),(31,'tranporterRegistrationFull',NULL,NULL,NULL,NULL,1),(32,'tranporterRegistrationRead',NULL,NULL,NULL,NULL,1),(33,'tranporterRegistrationWrite',NULL,NULL,NULL,NULL,1),(34,'tranporterListFull',NULL,NULL,NULL,NULL,1),(35,'tranporterListRead',NULL,NULL,NULL,NULL,1),(36,'tranporterListWrite',NULL,NULL,NULL,NULL,1),(37,'driverRegistrationFull',NULL,NULL,NULL,NULL,1),(38,'driverRegistrationRead',NULL,NULL,NULL,NULL,1),(39,'driverRegistrationWrite',NULL,NULL,NULL,NULL,1),(40,'mastersFull',NULL,NULL,NULL,NULL,1),(41,'mastersRead',NULL,NULL,NULL,NULL,1),(42,'mastersWrite',NULL,NULL,NULL,NULL,1),(43,'cfsMasterFull',NULL,NULL,NULL,NULL,1),(44,'cfsMasterRead',NULL,NULL,NULL,NULL,1),(45,'cfsMasterWrite',NULL,NULL,NULL,NULL,1),(46,'containerMasterFull',NULL,NULL,NULL,NULL,1),(47,'containerMasterRead',NULL,NULL,NULL,NULL,1),(48,'containerMasterWrite',NULL,NULL,NULL,NULL,1),(49,'cfsRateMasterFull',NULL,NULL,NULL,NULL,1),(50,'cfsRateMasterRead',NULL,NULL,NULL,NULL,1),(51,'cfsRateMasterWrite',NULL,NULL,NULL,NULL,1),(52,'dieselMasterFull',NULL,NULL,NULL,NULL,1),(53,'dieselMasterRead',NULL,NULL,NULL,NULL,1),(54,'dieselMasterWrite',NULL,NULL,NULL,NULL,1),(55,'locationMasterFull',NULL,NULL,NULL,NULL,1),(56,'locationMasterRead',NULL,NULL,NULL,NULL,1),(57,'locationMasterWrite',NULL,NULL,NULL,NULL,1),(58,'mileageMasterFull',NULL,NULL,NULL,NULL,1),(59,'mileageMasterWrite',NULL,NULL,NULL,NULL,1),(60,'mileageMasterRead',NULL,NULL,NULL,NULL,1),(61,'portMasterFull',NULL,NULL,NULL,NULL,1),(62,'portMasterRead',NULL,NULL,NULL,NULL,1),(63,'portMasterWrite',NULL,NULL,NULL,NULL,1),(64,'portTerminalMasterFull',NULL,NULL,NULL,NULL,1),(65,'portTerminalMasterRead',NULL,NULL,NULL,NULL,1),(66,'portTerminalMasterWrite',NULL,NULL,NULL,NULL,1),(67,'stateMasterFull',NULL,NULL,NULL,NULL,1),(68,'stateMasterRead',NULL,NULL,NULL,NULL,1),(69,'stateMasterWrite',NULL,NULL,NULL,NULL,1),(70,'weightMasterFull',NULL,NULL,NULL,NULL,1),(71,'weightMasterRead',NULL,NULL,NULL,NULL,1),(72,'weightMasterWrite',NULL,NULL,NULL,NULL,1),(73,'yardMasterFull',NULL,NULL,NULL,NULL,1),(74,'yardMasterRead',NULL,NULL,NULL,NULL,1),(75,'yardMasterWrite',NULL,NULL,NULL,NULL,1),(76,'yardCFSRateMasterFull',NULL,NULL,NULL,NULL,1),(77,'yardCFSRateMasterRead',NULL,NULL,NULL,NULL,1),(78,'yardCFSRateMasterWrite',NULL,NULL,NULL,NULL,1),(79,'zoneMasterFull',NULL,NULL,NULL,NULL,1),(80,'zoneMasterRead',NULL,NULL,NULL,NULL,1),(81,'zoneMasterWrite',NULL,NULL,NULL,NULL,1),(82,'zoneDayMasterFull',NULL,NULL,NULL,NULL,1),(83,'zoneDayMasterRead',NULL,NULL,NULL,NULL,1),(84,'zoneDayMasterWrite',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissionrolemapping`
--

DROP TABLE IF EXISTS `permissionrolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissionrolemapping` (
  `permissionroleId` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`permissionroleId`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissionrolemapping`
--

LOCK TABLES `permissionrolemapping` WRITE;
/*!40000 ALTER TABLE `permissionrolemapping` DISABLE KEYS */;
INSERT INTO `permissionrolemapping` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,1),(7,7,1,1),(8,8,1,1),(9,9,1,1),(10,10,1,1),(11,11,1,1),(12,12,1,1),(13,13,1,1),(14,14,1,1),(15,15,1,1),(16,16,1,1),(17,17,1,1),(18,18,1,1),(19,19,1,1),(20,20,1,1),(21,21,1,1),(22,22,1,1),(23,23,1,1),(24,24,1,1),(25,25,1,1),(26,26,1,1),(27,27,1,1),(28,28,1,1),(29,29,1,1),(30,30,1,1),(31,31,1,1),(32,32,1,1),(33,33,1,1),(34,34,1,1),(35,35,1,1),(36,36,1,1),(37,37,1,1),(38,38,1,1),(39,39,1,1),(40,40,1,1),(41,41,1,1),(42,42,1,1),(43,43,1,1),(44,44,1,1),(45,45,1,1),(46,46,1,1),(47,47,1,1),(48,48,1,1),(49,49,1,1),(50,50,1,1),(51,51,1,1),(52,52,1,1),(53,53,1,1),(54,54,1,1),(55,55,1,1),(56,56,1,1),(57,57,1,1),(58,58,1,1),(59,59,1,1),(60,60,1,1),(61,61,1,1),(62,62,1,1),(63,63,1,1),(64,64,1,1),(65,65,1,1),(66,66,1,1),(67,67,1,1),(68,68,1,1),(69,69,1,1),(70,70,1,1),(71,71,1,1),(72,72,1,1),(73,73,1,1),(74,74,1,1),(75,75,1,1),(76,76,1,1),(77,77,1,1),(78,78,1,1),(79,79,1,1),(80,80,1,1),(81,81,1,1),(82,82,1,1),(83,83,1,1),(84,84,1,1),(85,4,4,1),(86,5,4,1),(87,6,4,1),(88,7,4,1),(89,8,4,1),(90,9,4,1),(91,10,4,1),(92,11,4,1),(93,12,4,1),(94,13,4,1),(95,14,4,1),(96,15,4,1),(97,16,4,1),(98,17,4,1),(99,18,4,1),(100,19,5,1),(101,20,5,1),(102,21,5,1),(103,22,5,1),(104,23,5,1),(105,24,5,1),(106,25,5,1),(107,26,5,1),(108,27,5,1),(109,28,5,1),(110,29,5,1),(111,30,5,1),(112,31,5,1),(113,32,5,1),(114,33,5,1),(115,34,5,1),(116,35,5,1),(117,36,5,1),(118,37,5,1),(119,38,5,1),(120,39,5,1);
/*!40000 ALTER TABLE `permissionrolemapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portcfsratemaster`
--

DROP TABLE IF EXISTS `portcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `portcfsratemaster` (
  `portCfsRateMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `portMasterId` int(11) NOT NULL,
  `cfsMasterId` int(11) NOT NULL,
  `weightMasterId` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `bidMarginRate` int(11) DEFAULT NULL,
  `orderMarginRate` int(11) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int(11) NOT NULL,
  PRIMARY KEY (`portCfsRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portcfsratemaster`
--

LOCK TABLES `portcfsratemaster` WRITE;
/*!40000 ALTER TABLE `portcfsratemaster` DISABLE KEYS */;
INSERT INTO `portcfsratemaster` VALUES (1,1,1,1,400,15,10,1,1,'2020-08-30 07:38:32',1,'2020-08-30 07:38:32',1);
/*!40000 ALTER TABLE `portcfsratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portmaster`
--

DROP TABLE IF EXISTS `portmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `portmaster` (
  `portMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `portName` varchar(512) DEFAULT NULL,
  `stateMasterId` int(11) DEFAULT NULL,
  `locationMasterId` int(11) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`portMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (1,'JNPT',1,1,'add1','Add2','Port area','412457','Utsav','5522334789',1,1,'2020-08-30 07:20:23',1,'2020-08-30 07:20:23','41252','553266'),(2,'Ratnagiri',1,2,'Addr1','Addr2','NA','600201','Test','6123456789',1,1,'2020-09-02 14:51:08',1,'2020-09-02 14:51:08','123','123');
/*!40000 ALTER TABLE `portmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portterminalmaster`
--

DROP TABLE IF EXISTS `portterminalmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `portterminalmaster` (
  `portTerminalId` int(11) NOT NULL AUTO_INCREMENT,
  `portMasterId` int(11) DEFAULT NULL,
  `terminal` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`portTerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
INSERT INTO `portterminalmaster` VALUES (1,1,'Terminal1','4444554','555525',1,'2020-08-30 07:20:50',1,'2020-08-30 07:20:50',1),(2,2,'T1','123','123',1,'2020-09-02 14:54:31',1,'2020-09-02 14:54:31',1);
/*!40000 ALTER TABLE `portterminalmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `settingsId` int(11) NOT NULL AUTO_INCREMENT,
  `settingsName` varchar(512) DEFAULT NULL,
  `settingsValue` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`settingsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statemaster`
--

DROP TABLE IF EXISTS `statemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statemaster` (
  `stateMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`stateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemaster`
--

LOCK TABLES `statemaster` WRITE;
/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
INSERT INTO `statemaster` VALUES (1,'Maharashtra',1,NULL,NULL,NULL,NULL),(2,'Gujarat',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `statemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusdetails`
--

DROP TABLE IF EXISTS `statusdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statusdetails` (
  `statusDetailsId` int(11) NOT NULL AUTO_INCREMENT,
  `statusMasterId` int(11) NOT NULL,
  `statusDetailsName` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`statusDetailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusdetails`
--

LOCK TABLES `statusdetails` WRITE;
/*!40000 ALTER TABLE `statusdetails` DISABLE KEYS */;
INSERT INTO `statusdetails` VALUES (1,1,'BID_PENDING',1,1,'2020-08-06 00:00:00',NULL,NULL),(2,1,'BID_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(3,1,'BID_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(4,2,'BID_USER_EDIT',1,1,'2020-08-06 00:00:00',NULL,NULL),(5,2,'BID_USER_CONFIRMED',1,1,'2020-08-06 00:00:00',NULL,NULL),(6,3,'ORDER_ACCEPTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(7,3,'ORDER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(8,3,'ORDER_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(9,3,'ORDER_DELIVERED',1,1,'2020-08-06 00:00:00',NULL,NULL),(10,3,'ORDER_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(11,4,'SUB_ORDER_PENDING',1,1,'2020-08-06 00:00:00',NULL,NULL),(12,4,'SUB_ORDER_BID_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(13,4,'SUB_ORDER_TRIP_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(14,4,'SUB_ORDER_TRIP_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(15,4,'SUB_ORDER_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(16,5,'TRIP_TRANSPORTER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(17,5,'TRIP_DRIVER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(18,5,'TRIP_VEHICLE_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(19,5,'TRIP_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(20,5,'TRIP_COMPLETED',1,1,'2020-08-07 00:00:00',NULL,NULL),(21,5,'TRIP_DRIVER_VEHICLE_ASSIGNED',1,1,'2020-08-07 00:00:00',NULL,NULL),(22,2,'BID_USER_DISCARD',1,1,'2020-08-07 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `statusdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statusmaster`
--

DROP TABLE IF EXISTS `statusmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statusmaster` (
  `statusMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `statusMasterName` varchar(512) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `suborder` (
  `subOrderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `subOrderTotal` int(11) DEFAULT NULL,
  `BidScheduleId` int(11) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `cotainerId` int(11) DEFAULT NULL,
  `containerType` varchar(512) DEFAULT NULL,
  `containerWeightType` int(11) DEFAULT NULL,
  `subOrderTotalMargin` int(11) DEFAULT NULL,
  `marginPercent` int(11) DEFAULT NULL,
  `bidLimit` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `CutOffTime` datetime DEFAULT NULL,
  `suborderStatus` varchar(512) DEFAULT NULL,
  `suborderStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
INSERT INTO `suborder` VALUES (10,4,450,4,0,4,'2020-08-30 00:00:00',0,NULL,4,'1',1,450,0,20,NULL,'2020-09-04 10:11:40','SUB_ORDER_BID_ASSIGNED',12),(11,4,450,4,0,4,'2020-08-30 00:00:00',0,NULL,4,'1',1,450,0,20,NULL,'2020-09-04 10:11:40','SUB_ORDER_BID_ASSIGNED',12),(12,5,450,5,0,4,'2020-09-02 00:00:00',0,NULL,5,'1',1,450,0,20,NULL,'2020-09-04 10:11:40','SUB_ORDER_BID_ASSIGNED',12),(13,5,450,5,0,4,'2020-09-02 00:00:00',0,NULL,5,'1',1,450,0,20,NULL,'2020-09-04 10:11:40','SUB_ORDER_BID_ASSIGNED',12),(15,6,450,4,0,4,'2020-09-02 00:00:00',0,NULL,6,'1',1,450,0,20,NULL,'2020-09-04 10:11:40','SUB_ORDER_BID_ASSIGNED',12),(16,6,450,4,0,4,'2020-09-02 00:00:00',0,NULL,6,'1',1,450,0,20,NULL,'2020-09-04 10:11:40','SUB_ORDER_BID_ASSIGNED',12);
/*!40000 ALTER TABLE `suborder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeslotmaster`
--

DROP TABLE IF EXISTS `timeslotmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `timeslotmaster` (
  `timeslotMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `fromValue` varchar(512) NOT NULL,
  `toValue` varchar(512) NOT NULL,
  `actualValue` varchar(512) NOT NULL,
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`timeslotMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeslotmaster`
--

LOCK TABLES `timeslotmaster` WRITE;
/*!40000 ALTER TABLE `timeslotmaster` DISABLE KEYS */;
INSERT INTO `timeslotmaster` VALUES (1,'12','01','12 AM - 1 AM',1,'2020-08-03 00:00:00',NULL,NULL),(2,'01','02','1 AM - 2 AM',1,'2020-08-03 00:00:00',NULL,NULL),(3,'02','03','2 AM - 3 AM',1,'2020-08-03 00:00:00',NULL,NULL),(4,'03','04','3 AM - 4 AM',1,'2020-08-03 00:00:00',NULL,NULL),(5,'04','05','4 AM - 5 AM',1,'2020-08-03 00:00:00',NULL,NULL),(6,'05','06','5 AM - 6 AM',1,'2020-08-03 00:00:00',NULL,NULL),(7,'06','07','6 AM - 7 AM',1,'2020-08-03 00:00:00',NULL,NULL),(8,'07','08','7 AM - 8 AM',1,'2020-08-03 00:00:00',NULL,NULL),(9,'08','09','8 AM - 9 AM',1,'2020-08-03 00:00:00',NULL,NULL),(10,'09','10','9 AM - 10 AM',1,'2020-08-03 00:00:00',NULL,NULL),(11,'10','11','10 AM- 11 AM',1,'2020-08-03 00:00:00',NULL,NULL),(12,'11','12','11 AM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL),(13,'12','13','12 PM - 13 PM',1,'2020-08-03 00:00:00',NULL,NULL),(14,'13','14','13 PM - 14 PM',1,'2020-08-03 00:00:00',NULL,NULL),(15,'14','15','14 PM - 15 PM',1,'2020-08-03 00:00:00',NULL,NULL),(16,'15','16','15 PM - 16 PM',1,'2020-08-03 00:00:00',NULL,NULL),(17,'16','17','16 PM - 17 PM',1,'2020-08-03 00:00:00',NULL,NULL),(18,'17','18','17 PM - 18 PM',1,'2020-08-03 00:00:00',NULL,NULL),(19,'18','19','18 PM - 19 PM',1,'2020-08-03 00:00:00',NULL,NULL),(20,'19','20','19 PM - 20 PM',1,'2020-08-03 00:00:00',NULL,NULL),(21,'20','21','20 PM - 21 PM',1,'2020-08-03 00:00:00',NULL,NULL),(22,'21','22','21 PM - 22 PM',1,'2020-08-03 00:00:00',NULL,NULL),(23,'22','23','22 PM - 23 PM',1,'2020-08-03 00:00:00',NULL,NULL),(24,'23','12','23 PM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `timeslotmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporterregistration`
--

DROP TABLE IF EXISTS `transporterregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transporterregistration` (
  `transporterId` int(11) NOT NULL AUTO_INCREMENT,
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
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`transporterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporterregistration`
--

LOCK TABLES `transporterregistration` WRITE;
/*!40000 ALTER TABLE `transporterregistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporterregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trip` (
  `tripId` int(11) NOT NULL AUTO_INCREMENT,
  `subOrderId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `destinationId` int(11) DEFAULT NULL,
  `assignedVehicle` int(11) DEFAULT NULL,
  `assignedDriver` int(11) DEFAULT NULL,
  `tripstatus` varchar(512) DEFAULT NULL,
  `tripStatusId` int(11) DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `sourceName` varchar(512) DEFAULT NULL,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `billedAmount` int(11) DEFAULT NULL,
  `BidValue` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `startedBy` int(11) DEFAULT NULL,
  `stoppeddBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,11,1,1,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,5,'2020-08-30 12:06:40',NULL,NULL,NULL,NULL,NULL,360,NULL,NULL,NULL),(2,10,1,1,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,6,'2020-08-30 12:06:40',NULL,NULL,NULL,NULL,NULL,430,NULL,NULL,NULL),(3,12,1,1,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,5,'2020-09-02 06:21:40',NULL,NULL,NULL,NULL,NULL,400,NULL,NULL,NULL),(4,13,1,1,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,6,'2020-09-02 06:21:40',NULL,NULL,NULL,NULL,NULL,410,NULL,NULL,NULL),(6,15,1,1,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,5,'2020-09-02 19:56:40',NULL,NULL,NULL,NULL,NULL,360,NULL,NULL,NULL),(7,16,1,1,1,2,'TRIP_COMPLETED',20,'Yard1','CFS All Cargo','MH 02 1111',5,'2020-09-02 20:07:21',5,'2020-09-02 20:07:21','2020-09-02 20:09:17','2020-09-02 20:09:31',0,450,1,5,5);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trip_au` AFTER UPDATE ON `trip` FOR EACH ROW IF(NEW.tripStatusId = 21) Then -- Both Vehicle And Driver Assigned

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



End If */;;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `truck` (
  `truckId` int(11) NOT NULL AUTO_INCREMENT,
  `containerId` int(11) DEFAULT NULL,
  `truckNumber` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (7,4,'2222',0,1,'2020-08-30 08:07:53',1,'2020-08-30 08:07:53'),(8,4,'5555',0,1,'2020-08-30 08:07:53',1,'2020-08-30 08:07:53'),(9,5,'777',0,1,'2020-09-02 06:15:50',1,'2020-09-02 06:15:50'),(10,5,'555',0,1,'2020-09-02 06:15:50',1,'2020-09-02 06:15:50'),(11,6,'555',0,1,'2020-09-02 19:49:00',1,'2020-09-02 19:49:00'),(12,6,'444',0,1,'2020-09-02 19:49:00',1,'2020-09-02 19:49:00');
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `firstName` varchar(512) NOT NULL,
  `lastName` varchar(512) NOT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `typeSyscode` int(11) NOT NULL,
  `permissions` text,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$g4gC9K5ebPMdTS2Aosq55ehc.i.N15Bo/wJ994P/ZlM.NqkExMxpa','utsav','demo','9886631264',1,'[\"AccessAuthFeature\"]'),(3,'cfs@hotmail.com','$2a$10$zFSpbpbu3L1ms6QPh78I9.tP28nzE4DfBrj5vyujWGBFaMP6tlHJW','Utsav','Purohit','9886631264',4,'[\"AccessAuthFeature\"]'),(4,'alc@admin.in','$2a$10$u1ELBUU.FGlKqvthzGvAt.xNhXHh9uUXhWOc3f0RNouaTYV0SSKpq','CFS User','CFS User','8875415230',7,'[\"AccessAuthFeature\"]'),(5,'alc@transporter.in','$2a$10$yoaaMSAfyYt4QUXz6cpHKeHzeVXzplBb1Wm6cihB1mPEFOnGDHRB6','All Cargo','Transporter','9875461230',5,'[\"AccessAuthFeature\"]'),(6,'alc@transporter2.in','$2a$10$QHjd46LvEZYsFZdF/Xi/0uF15q5T0Zui23oL53FeeRcwoxXSXNJxW','All Cargo','Transporter 2','7775213680',5,'[\"AccessAuthFeature\"]'),(7,'alc@driver.in','$2a$10$mlo7kkE7WuXQ15dgwoK9TOI1mVZ5F9wISKG2OY0XztWUhNyLqVcYi','Transporter1 ','Driver','88774452632',6,'[\"AccessAuthFeature\"]'),(8,'transporter@cfs.com','$2a$10$NZ9NBXPKNzdx3Y0iQFldHOTUHZc6jCqrhAaCo2KBi1gORFbqOJaJ6','Bhushan','Gadekar','9886631264',4,'[\"AccessAuthFeature\"]'),(9,'cfst2@gotek.dev','$2a$10$Ye60TZf0/uXhUNNN5U28/.JwFr8Dl5L91MLHST22UwGtRqpS0bJBC','RatnaUsr1','RatnaUsr1','6123456789',7,'[\"AccessAuthFeature\"]'),(10,'cfst2usr1@gotek.dev','$2a$10$uyBOLAMAfWH2rYZ1uaVzpO53qZms4uFk5vVy89KQe5ADEVRWuWKP.','cfst2usr1','cfst2usr1','6123456789',8,'[\"AccessAuthFeature\"]'),(11,'driver@trans.in','$2a$10$7g/kFz1TgWDBpYfVfreKbOyZqdpalxhD9ADWaHDBmQTXgU4osrWsy','driver123','driver','7788954520',6,'[\"AccessAuthFeature\"]');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userrole` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `parentRoleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin',1,1,'2020-06-26 21:11:31',NULL,NULL,NULL),(2,'Import Customer',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(3,'Export Customer',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(4,'CFS Customer',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(5,'Transporter',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(6,'Driver',1,1,'2020-06-26 21:12:54',NULL,NULL,NULL),(7,'CFS User Admin',1,1,'2020-07-17 00:00:00',NULL,NULL,4),(8,'CFS User Super Admin',1,1,'2020-07-17 00:00:00',NULL,NULL,4),(9,'CFS User Viewer',1,1,'2020-07-17 00:00:00',NULL,NULL,4);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrolemapping`
--

DROP TABLE IF EXISTS `userrolemapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userrolemapping` (
  `userroleId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicle` (
  `vehicleId` int(11) NOT NULL AUTO_INCREMENT,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehiclemaster` (
  `vehicleMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `vehicleType` int(11) DEFAULT NULL,
  `vehicleCapacity` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `manufactureYear` varchar(512) DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`vehicleMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
INSERT INTO `vehiclemaster` VALUES (1,'MH 02 1111',1,1,500,'2019',1,1,1,5,'2020-09-02 06:28:28',5,'2020-09-02 06:28:28');
/*!40000 ALTER TABLE `vehiclemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletransportermapping`
--

DROP TABLE IF EXISTS `vehicletransportermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicletransportermapping` (
  `vehicletransportermappingId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `vehicleMasterId` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicletransportermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletransportermapping`
--

LOCK TABLES `vehicletransportermapping` WRITE;
/*!40000 ALTER TABLE `vehicletransportermapping` DISABLE KEYS */;
INSERT INTO `vehicletransportermapping` VALUES (1,5,1,'2020-09-02 06:28:28',5,NULL,NULL);
/*!40000 ALTER TABLE `vehicletransportermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weightmaster`
--

DROP TABLE IF EXISTS `weightmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `weightmaster` (
  `weightMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `weightDesc` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`weightMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
INSERT INTO `weightmaster` VALUES (1,'10 Ton',1,1,'2020-08-30 07:35:52',1,'2020-08-30 07:35:52',1),(2,'20 Ton',1,1,'2020-08-30 07:36:01',1,'2020-08-30 07:36:01',2);
/*!40000 ALTER TABLE `weightmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardcfsratemaster`
--

DROP TABLE IF EXISTS `yardcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yardcfsratemaster` (
  `yardCfsRateMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int(11) DEFAULT NULL,
  `yardMasterId` int(11) DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  `weightMasterId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `bidMarginRate` int(11) DEFAULT NULL,
  `orderMarginRate` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`yardCfsRateMasterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardcfsratemaster`
--

LOCK TABLES `yardcfsratemaster` WRITE;
/*!40000 ALTER TABLE `yardcfsratemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `yardcfsratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardmaster`
--

DROP TABLE IF EXISTS `yardmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yardmaster` (
  `yardMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `yardName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int(11) DEFAULT NULL,
  `locationMasterId` int(11) DEFAULT NULL,
  `stateMasterId` int(11) DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`yardMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardmaster`
--

LOCK TABLES `yardmaster` WRITE;
/*!40000 ALTER TABLE `yardmaster` DISABLE KEYS */;
INSERT INTO `yardmaster` VALUES (1,'Yard1',1,'Add1','Add2','Land','445578','556655','5222565',1,1,'2020-08-30 07:21:43','2020-08-30 07:21:43',1,1,1,'Utsav','5857475565'),(2,'RatnaYard1',1,'Addr1','Addr2','NA','629103','123','123',1,1,'2020-09-02 15:19:34','2020-09-02 15:19:34',2,2,1,'Test','6123456789');
/*!40000 ALTER TABLE `yardmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedaymaster`
--

DROP TABLE IF EXISTS `zonedaymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zonedaymaster` (
  `zoneDayMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `zoneName` varchar(512) DEFAULT NULL,
  `portId` int(11) DEFAULT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zonemaster` (
  `zoneMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `zoneName` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
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
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `evtSchedulerBid` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = '+00:00' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `evtSchedulerBid` ON SCHEDULE EVERY 5 MINUTE STARTS '2020-08-30 11:26:40' ON COMPLETION NOT PRESERVE ENABLE DO call procSchedulerConfirmBid() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FuncGetBidCutofftime`(`StartDate` datetime, `IsFullTime` int, `hours` int) RETURNS varchar(30) CHARSET utf8mb4
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
/*!50003 DROP FUNCTION IF EXISTS `GetBidNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetBidNumber`() RETURNS varchar(250) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
declare returnVal varchar(250);
declare maxVal int;

Select  max(bidId) + 1 into maxVal from transporter.bid;
if maxVal is null then
set maxVal:= 1;
end if;
SELECT concat('BID' , LPAD(maxVal, 8, '0')) into returnVal;
RETURN returnVal;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSbyUserId`(IN `user_Id` int)
BEGIN

Select cm.* from transporter.cfsmaster cm
Inner Join transporter.cfsuserregistration cur on cm.cfsMasterId = cur.cfsMasterId
Where cur.userId =  user_Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCFSContainersbyUserId`(IN `user_Id` int, IN `type_Id` int, IN `port_yard_Id` int)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSPortsbyUserId`(IN `user_Id` int)
BEGIN

Select distinct p.* from transporter.portmaster p
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id
Left Outer Join transporter.cfsportratemaster crm on p.portMasterId = crm.portMasterId and crm.cfsMasterId = cur.cfsMasterId
Left Outer Join transporter.portcfsratemaster prm on p.portMasterId = prm.portMasterId and prm.cfsMasterId = cur.cfsMasterId
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSWeightsbyUserandContainerId`(IN `user_Id` int, IN `type_Id` int, IN `container_Id` int, IN `port_yard_Id` int)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSYardsbyUserId`(IN `user_Id` int)
BEGIN

Select distinct y.* from transporter.yardmaster y
Inner Join transporter.cfsuserregistration cur on cur.userId = user_Id
Left Outer Join transporter.yardcfsratemaster yrm on y.yardMasterId = yrm.yardMasterId and yrm.cfsMasterId = cur.cfsMasterId
Left Outer Join transporter.cfsyardratemaster crm on y.yardMasterId = crm.yardMasterId and crm.cfsMasterId = cur.cfsMasterId
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllDriversbyUserId`(IN `user_Id` int)
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
/*!50003 DROP PROCEDURE IF EXISTS `GetAllOrdersbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllOrdersbyUserId`(IN `user_Id` int)
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
DATE_FORMAT(ord.createdOn,'%d-%b-%Y') as CreatedOn
from transporter.order ord
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
where ord.isDeleted = 0;
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
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPermissionsbyUserId`(IN `role_Id` tinyint)
BEGIN
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllSubOrdersbyUserId`(IN `user_Id` int)
BEGIN

declare role_Id int;
Select typeSyscode into role_Id from transporter.user where userId = user_Id;

if(role_Id = 1 or role_Id = 5) then
Select ord.orderId, subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllTripsbyUserId`(IN `user_Id` int)
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
Where t.createdBy = user_Id ;

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
Where u.userId = user_Id ;

else

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllVehiclesbyUserId`(IN `user_Id` int)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidDetailsByBidId`(IN `bidId` int)
BEGIN
if(bidId=0) then
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
bi.bidName ,map.bidValue , bi.bidStatus,map.createdOn ,map.userId
      , us.firstName,us.email
FROM transporter.bid bi
 left outer join bidusermapping map on map.bidId = bi.bidId
  left outer join user us on map.userId = us.userId;
else
SELECT bi.bidName,bi.exhibitionDate,bi.subOrderId,bi.createdBy,bi.originalRate ,
bi.bidName ,map.bidValue , bi.bidStatus,map.createdOn ,map.userId
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
/*!50003 DROP PROCEDURE IF EXISTS `GetBidsbyUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBidsbyUserId`(IN `user_Id` int)
BEGIN

declare roleId int;

Select typeSyscode into roleId from transporter.user
where userId = user_Id;


if roleId = 5 then -- Transporter

    Select b.bidId,b.bidName,b.bidLowerLimit,
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
    b.originalRate,bum.bidusermappingId
    from transporter.order ord
    Left Outer Join transporter.suborder sub on ord.orderId = sub.orderId
    Left Outer Join  transporter.bid b  on sub.subOrderId = b.subOrderId
    Left Outer Join transporter.bidusermapping bum on b.bidId = bum.bidId and bum.userId = user_Id
    -- Inner Join transporter.bidusermapping bm on bm.userId = user_Id
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=wem.weightMasterId
    Where b.isActive = 1;

else -- Admin User
    Select b.bidId,b.bidName,b.bidLowerLimit,
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
    bm.bidValue,bm.biduserStatus, b.originalRate
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
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
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardForAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForAdmin`(IN `user_id` tinyint)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForCFS`(IN `user_Id` int)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForDriver`(IN `user_Id` int)
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDashboardForTransporter`(IN `user_Id` int)
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
/*!50003 DROP PROCEDURE IF EXISTS `GetTripDetailsbyTripId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripDetailsbyTripId`(IN `trip_Id` int)
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
Where t.tripId = trip_Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTripsbyId`(IN `trip_Id` int)
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
Where t.tripId = trip_Id;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetOrderDetails`(IN `orderid` int)
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
ord.orderRemarks,ord.orderDate,ord.totalRate,
ord.orderStatus,
subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
bid.bidName,
concat(usr.firstName ,' ',usr.lastName) TranporterName,bum.bidValue,bum.biduserStatus,
vhl.vehicleNumber,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,dusr.emailid,dusr.mobileNumber,trp.tripstatus,
wm.weightDesc,cm.containerMasterName
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
left outer join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
inner join  transporter.bid bid on bid.subOrderId= subo.subOrderId
left outer join transporter.bidusermapping bum on bum.bidId = bid.bidId
left outer join transporter.user usr on usr.userId = bum.userId
left outer join transporter.trip trp on trp.subOrderId = subo.subOrderId
left outer join transporter.vehiclemaster vhl on vhl.vehicleMasterId = trp.assignedVehicle
left outer join transporter.driver dusr on dusr.driverId = trp.assignedDriver
left outer join transporter.weightmaster wm on wm.weightMasterId = vhl.vehiclecapacity
left outer join transporter.containermaster cm on cm.containerMasterId = vhl.vehicletype

where  (ord.orderId = orderid or orderid is null) and (bum.biduserstatusId != 22 or bum.biduserstatusId is null);
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procSchedulerConfirmBid`()
BEGIN
SET SQL_SAFE_UPDATES = 0;


-- First update the suborder with the Bid schedule master id and cutofftime as per there timing
update transporter.suborder  sub
inner join transporter.order ord  on sub.orderid = ord.orderid
inner join transporter.bidschedulemaster bis on TIMESTAMPDIFF(HOUR, ord.createdOn, ord.orderdate) between bis.fromHour and bis.ToHour
set sub.BidScheduleId = bis.BidScheduleId,
	sub.CutOffTime = case when bis.WorkingHours = 0 then DATE_ADD(ord.createdOn, INTERVAL bis.bidingHours HOUR)
	 when bis.WorkingHours > 0 then FuncGetBidCutofftime(ord.createdon,bis.IsFullhour,bis.totalbidhour)
	end
where sub.BidScheduleId is null;
-- updte the order on 20 bid first come first serve basis
update bidusermapping bum
inner join
(
	select bidusermappingId -- um.bidId,um.userid,min(bidValue) bidValue, min(createdOn) createdOn
	from
	(
	SELECT  bd.bidId , Count(bd.bidId) BidCount,subo.CutOffTime
	FROM transporter.bid bd
	inner join transporter.bidusermapping bum on bum.bidId = bd.bidId
	inner join transporter.suborder subo on subo.subOrderId = bd.subOrderId
	group by bd.bidId, subo.CutOffTime
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
	where bidcount >= 20  or( bidcount > 0 and CutOffTime <= now())
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

update transporter.suborder set cutofftime = now();

end ;;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subOrderProcessing`(IN `order_Id` int)
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
subOrderTotalMargin,marginPercent,suborderStatus,suborderStatusId)
Select order_Id,
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
0,created_by,CURDATE(),
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
0,'SUB_ORDER_PENDING',11
From transporter.order ord
Inner join transporter.container c
on ord.orderId = c.orderId
Inner Join transporter.truck t
on c.containerId = t.containerId
-- Left Outer join settings s on settingsName = 'cfs_order_profit'
where ord.orderId = order_Id;



            -- End SubOrder
			-- Insert Bid

		Insert into transporter.bid(bidName,originalRate,exhibitionDate,
		subOrderId,isActive,createdBy,createdOn,bidUpperLimit,modifiedBy,
		modifiedOn,bidLowerLimit,bidStatus,bidStatusId)
		Select GetBidNumber(),sub.subOrderTotal,
		null,sub.subOrderId,1,created_by,CURDATE(),0,
		0,null,(sub.subOrderTotal - ((sub.subOrderTotal * sub.bidLimit) / 100)),'BID_PENDING',1
        From suborder sub
        Where orderId = order_Id;


            -- End Bid

  End;
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

-- Dump completed on 2020-09-04 15:44:56