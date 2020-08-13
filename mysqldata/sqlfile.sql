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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,'BID00000001',450,NULL,1,0,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(2,'BID00000002',450,NULL,2,1,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_PENDING',1),(3,'BID00000003',450,NULL,3,1,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_PENDING',1),(4,'BID00000004',450,NULL,4,1,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_PENDING',1),(8,'BID00000005',1350,NULL,8,1,20,'2020-08-09 00:00:00',0,0,NULL,1080,NULL,'BID_PENDING',1),(9,'BID00000009',1350,NULL,9,1,20,'2020-08-09 00:00:00',0,0,NULL,1080,NULL,'BID_PENDING',1),(10,'BID00000010',1350,NULL,10,1,20,'2020-08-09 00:00:00',0,0,NULL,1080,NULL,'BID_PENDING',1),(11,'BID00000011',1350,NULL,11,1,20,'2020-08-09 00:00:00',0,0,NULL,1080,NULL,'BID_PENDING',1),(15,'BID00000012',450,NULL,15,1,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_PENDING',1),(16,'BID00000016',450,NULL,16,0,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(17,'BID00000017',450,NULL,17,0,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(18,'BID00000018',450,NULL,18,0,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_ASSIGNED',2),(19,'BID00000019',450,NULL,19,1,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_PENDING',1),(20,'BID00000020',450,NULL,20,1,20,'2020-08-09 00:00:00',0,0,NULL,360,NULL,'BID_PENDING',1);
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
INSERT INTO `bidschedulemaster` VALUES (1,2,6,1,0,1,20,_binary '',NULL,NULL),(2,6,12,3,0,1,20,_binary '',NULL,NULL),(3,12,24,8,0,1,20,_binary '',NULL,NULL),(4,24,48,6,8,1,20,_binary '',NULL,NULL),(5,48,96,12,8,1,20,_binary '',28,0),(6,96,144,24,8,1,20,_binary '',72,1),(7,144,360,42,8,1,20,_binary '',122,0);
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
  `bidName` varchar(512) DEFAULT NULL,
  `bidValue` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `bidLowerLimit` varchar(512) DEFAULT NULL,
  `SourceName` varchar(512) DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `containerMasterName` varchar(512) DEFAULT NULL,
  `weightDesc` varchar(512) DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  `weightMasterId` int(11) DEFAULT NULL,
  `originalRate` int(11) DEFAULT NULL,
  `biduserStatus` varchar(512) DEFAULT NULL,
  `biduserStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
INSERT INTO `bidusermapping` VALUES (1,1,11,'BID00000001',440,'2020-08-09 12:12:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_CONFIRMED',5),(2,2,11,'BID00000002',430,'2020-08-09 12:14:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(3,8,11,'BID00000005',1200,'2020-08-09 12:14:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(4,3,11,'BID00000003',435,'2020-08-09 12:15:12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(5,4,11,'BID00000004',436,'2020-08-09 12:15:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(6,9,11,'BID00000009',1335,'2020-08-09 12:15:23',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(7,10,11,'BID00000010',1330,'2020-08-09 12:15:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(8,11,11,'BID00000011',1328,'2020-08-09 12:15:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(9,15,10,'BID00000012',430,'2020-08-09 12:52:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(10,16,10,'BID00000016',430,'2020-08-09 12:52:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_CONFIRMED',5),(11,17,10,'BID00000017',430,'2020-08-09 12:52:18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_CONFIRMED',5),(12,19,10,'BID00000019',430,'2020-08-09 12:52:21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(13,18,10,'BID00000018',430,'2020-08-09 12:52:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_CONFIRMED',5),(14,20,10,'BID00000020',430,'2020-08-09 12:52:30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(15,2,10,'BID00000002',430,'2020-08-09 12:52:35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(16,3,10,'BID00000003',430,'2020-08-09 12:52:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(17,4,10,'BID00000004',430,'2020-08-09 12:52:43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(18,2,11,'BID00000002',430,'2020-08-13 16:16:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(19,2,11,'BID00000002',430,'2020-08-13 16:18:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(20,15,11,'BID00000012',450,'2020-08-13 16:20:26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(21,19,11,'BID00000019',450,'2020-08-13 16:20:29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4),(22,20,11,'BID00000020',450,'2020-08-13 16:20:31',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_EDIT',4);
/*!40000 ALTER TABLE `bidusermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsmaster`
--

DROP TABLE IF EXISTS `cfsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cfsmaster` (
  `address1` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `pan` varchar(512) DEFAULT NULL,
  `tan` varchar(512) DEFAULT NULL,
  `portMasterId` int(11) DEFAULT NULL,
  `cfsMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `cfsName` varchar(512) DEFAULT NULL,
  `contactNumber` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `cfsCodeNumber` varchar(512) DEFAULT NULL,
  `gstin` varchar(512) DEFAULT NULL,
  `primaryContactName` varchar(512) DEFAULT NULL,
  `primaryContactNumber` varchar(512) DEFAULT NULL,
  `additionalContactName` varchar(512) DEFAULT NULL,
  `additionalContactNumber` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `locationMasterId` int(11) DEFAULT NULL,
  `stateMasterId` int(11) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`cfsMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
INSERT INTO `cfsmaster` VALUES ('add1','422302','254353fdgfdg34','BTRPG3658K',2,1,'All Cargo  Empty August 9','9886631264','utsav@cfs.com','12','dsgfsdgdf235435','Ganesh','8778787878','Pavan','7889898989',1,'2020-08-09 05:58:31',1,'2020-08-09 05:58:31',1,'add2','landmark',1,1,'44555','45455'),('add1','4001254','254353fdgfdg34','BTRPG3658K',2,2,'cfs 2','9886631264','user2@cfs.in','12','dsgfsdgdf235435','Ganesh','8778787878','Pavan','7889898989',1,'2020-08-09 05:59:45',1,'2020-08-09 05:59:45',1,'add2','landmark',1,1,'44555','564654');
/*!40000 ALTER TABLE `cfsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsratemaster`
--

DROP TABLE IF EXISTS `cfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cfsratemaster` (
  `cfsRateId` int(11) NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int(11) DEFAULT NULL,
  `portMasterId` int(11) DEFAULT NULL,
  `weightMasterId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`cfsRateId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsratemaster`
--

LOCK TABLES `cfsratemaster` WRITE;
/*!40000 ALTER TABLE `cfsratemaster` DISABLE KEYS */;
INSERT INTO `cfsratemaster` VALUES (1,1,2,2,500,1,1,'2020-08-09 06:01:36',1,'2020-08-09 06:01:36',1),(2,1,2,1,1000,1,1,'2020-08-09 06:01:47',1,'2020-08-09 06:01:47',1),(3,1,2,3,1500,1,1,'2020-08-09 06:02:04',1,'2020-08-09 06:02:04',2),(4,1,2,4,2000,1,1,'2020-08-09 06:02:14',1,'2020-08-09 06:02:14',2),(5,2,2,2,5000,1,1,'2020-08-09 06:02:26',1,'2020-08-09 06:02:26',1),(6,2,2,1,10000,1,1,'2020-08-09 06:02:42',1,'2020-08-09 06:02:42',1),(7,2,2,3,15000,1,1,'2020-08-09 06:03:06',1,'2020-08-09 06:03:06',2),(8,2,2,4,20000,1,1,'2020-08-09 06:03:18',1,'2020-08-09 06:03:18',2);
/*!40000 ALTER TABLE `cfsratemaster` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsuserregistration`
--

LOCK TABLES `cfsuserregistration` WRITE;
/*!40000 ALTER TABLE `cfsuserregistration` DISABLE KEYS */;
INSERT INTO `cfsuserregistration` VALUES (1,1,8,'CFS USER 1','Admin','Operations','9886631264','cfs@cargo.com','123456789',20,1,1,1,'2020-08-09 06:12:26',1,'2020-08-09 06:12:26');
/*!40000 ALTER TABLE `cfsuserregistration` ENABLE KEYS */;
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
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,2,2,0,1,'2020-08-09 06:30:18',1,'2020-08-09 06:30:18',1),(2,2,3,2,0,1,'2020-08-09 06:33:15',1,'2020-08-09 06:33:15',2),(3,3,2,3,0,1,'2020-08-09 07:18:43',1,'2020-08-09 07:18:43',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containermaster`
--

LOCK TABLES `containermaster` WRITE;
/*!40000 ALTER TABLE `containermaster` DISABLE KEYS */;
INSERT INTO `containermaster` VALUES (1,'20 FT',1,1,'2020-08-09 06:00:20',1,'2020-08-09 06:00:20'),(2,'40 FT',1,1,'2020-08-09 06:00:26',1,'2020-08-09 06:00:26');
/*!40000 ALTER TABLE `containermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieselratemaster`
--

DROP TABLE IF EXISTS `dieselratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dieselratemaster` (
  `dieselRate` int(11) DEFAULT NULL,
  `dieselRateDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL
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
  `userPassword` varchar(512) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`driverId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Utsav','dfsgdf','utsav@driver.in','9886631264',1,1,'422112','dfgdfg','dfgdfg','dfgdfg',1,1,'435435ghfghf435h',11,'2020-08-09 06:53:47',11,'2020-08-09 06:53:47','123456789',21),(2,'gaurav','fdgfdg','gaurav@driver.in','9886631264',1,1,'422112','dfgdfg','dfgdfg','dfgdfg',1,1,'fdgdfg',10,'2020-08-09 07:28:46',10,'2020-08-09 07:28:46','123456789',22);
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
INSERT INTO `drivertransportermapping` VALUES (1,21,11,11,'2020-08-09 06:53:47',NULL,NULL),(2,22,10,10,'2020-08-09 07:28:46',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationmaster`
--

LOCK TABLES `locationmaster` WRITE;
/*!40000 ALTER TABLE `locationmaster` DISABLE KEYS */;
INSERT INTO `locationmaster` VALUES (1,'Mumbai',1,14,'2020-08-09 05:50:50',NULL,NULL,1);
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
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `bidId` int(11) DEFAULT NULL,
  `assignedToRole` int(11) DEFAULT NULL,
  `assignedToUser` int(11) DEFAULT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS USER 1 CFS USER 1 placed a new Order on 2020-08-09!',1,20,'2020-08-09 06:30:19',0,NULL,1,NULL),(2,'orders','CFS USER 1 CFS USER 1 placed a new Order on 2020-08-09!',2,20,'2020-08-09 06:33:16',0,NULL,1,NULL),(3,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:42:49',0,NULL,1,NULL),(4,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:44:12',0,NULL,1,NULL),(5,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:44:24',0,NULL,1,NULL),(6,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:45:13',0,NULL,1,NULL),(7,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:45:17',0,NULL,1,NULL),(8,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:45:24',0,NULL,1,NULL),(9,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:45:30',0,NULL,1,NULL),(10,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,11,'2020-08-09 06:45:36',0,NULL,1,NULL),(11,'orders','CFS USER 1 CFS USER 1 placed a new Order on 2020-08-09!',3,20,'2020-08-09 07:18:44',0,NULL,1,NULL),(12,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:12',0,NULL,1,NULL),(13,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:16',0,NULL,1,NULL),(14,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:19',0,NULL,1,NULL),(15,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:22',0,NULL,1,NULL),(16,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:27',0,NULL,1,NULL),(17,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:31',0,NULL,1,NULL),(18,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:36',0,NULL,1,NULL),(19,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:40',0,NULL,1,NULL),(20,'orders','Transporter Trans confirmed a bid on 2020-08-09!',1,10,'2020-08-09 07:22:43',0,NULL,1,NULL),(21,'orders','Transporter Trans confirmed a bid on 2020-08-13!',1,11,'2020-08-13 10:46:39',0,NULL,1,NULL),(22,'orders','Transporter Trans confirmed a bid on 2020-08-13!',1,11,'2020-08-13 10:48:39',0,NULL,1,NULL),(23,'orders','Transporter Trans confirmed a bid on 2020-08-13!',1,11,'2020-08-13 10:50:27',0,NULL,1,NULL),(24,'orders','Transporter Trans confirmed a bid on 2020-08-13!',1,11,'2020-08-13 10:50:30',0,NULL,1,NULL),(25,'orders','Transporter Trans confirmed a bid on 2020-08-13!',1,11,'2020-08-13 10:50:32',0,NULL,1,NULL);
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
  `sourceId` int(11) DEFAULT NULL,
  `destinationId` int(11) DEFAULT NULL,
  `totalRate` int(11) DEFAULT NULL,
  `profitRate` int(11) DEFAULT NULL,
  `profitMarginPercentage` int(11) DEFAULT NULL,
  `orderTypeId` int(11) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `masterTypeId` int(11) DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  `orderRemarks` varchar(512) DEFAULT NULL,
  `orderAddress` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `rateExcludingProfit` int(11) DEFAULT NULL,
  `portTerminalId` int(11) DEFAULT NULL,
  `timeslotMasterId` int(11) DEFAULT NULL,
  `orderStatus` varchar(512) DEFAULT NULL,
  `orderStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,2,1000,100,10,NULL,'2020-08-10 01:00:00',2,'CFS','PORT','NA','',0,0,20,'2020-08-09 12:00:18',20,'2020-08-09 06:30:18',900,1,2,'ORDER_ASSIGNED',7),(2,2,1,3000,300,10,NULL,'2020-08-10 03:00:00',4,'PORT','CFS','NA','',0,0,20,'2020-08-09 12:03:15',20,'2020-08-09 06:33:15',2700,1,4,'ORDER_ACCEPTED',6),(3,1,2,1500,150,10,NULL,'2020-08-10 01:00:00',2,'CFS','PORT','Order submitted for 10 AUg 1 AM','',0,0,20,'2020-08-09 12:48:43',20,'2020-08-09 07:18:43',1350,1,2,'ORDER_ASSIGNED',7);
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
-- Table structure for table `portmaster`
--

DROP TABLE IF EXISTS `portmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `portmaster` (
  `portMasterId` int(11) NOT NULL AUTO_INCREMENT,
  `stateMasterId` int(11) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `portName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `locationMasterId` int(11) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`portMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (2,1,'44555','45455','JNPT',1,1,'2020-08-09 05:55:36',1,'2020-08-09 05:55:36',1,'address line 1','address line 1','dfgdfg','411045','Bhushan','9886631264');
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
  `terminal` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`portTerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
INSERT INTO `portterminalmaster` VALUES (1,'Termina JNPT','456',1,'1215',1,'2020-08-09 05:56:01',2,1,'2020-08-09 05:56:01'),(2,'JNPT Terminal 2','56546',1,'5456',1,'2020-08-09 05:57:21',2,1,'2020-08-09 05:57:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'cfs_order_profit','10',1),(2,'bid_lower_limit','20',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemaster`
--

LOCK TABLES `statemaster` WRITE;
/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
INSERT INTO `statemaster` VALUES (1,'Maharashtra',1,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusmaster`
--

LOCK TABLES `statusmaster` WRITE;
/*!40000 ALTER TABLE `statusmaster` DISABLE KEYS */;
INSERT INTO `statusmaster` VALUES (1,'bidStatus',1,1,'2020-08-06 00:00:00',NULL,NULL),(2,'bidusermappingStatus',1,1,'2020-08-06 00:00:00',NULL,NULL),(3,'orderStatus',1,1,'2020-08-06 00:00:00',NULL,NULL),(4,'suborderStatus',1,1,'2020-08-06 00:00:00',NULL,NULL),(5,'tripStatus',1,1,'2020-08-06 00:00:00',NULL,NULL);
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
  `isDelete` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `cotainerId` int(11) DEFAULT NULL,
  `containerType` int(11) DEFAULT NULL,
  `containerWeightType` int(11) DEFAULT NULL,
  `subOrderTotalMargin` int(11) DEFAULT NULL,
  `marginPercent` int(11) DEFAULT NULL,
  `BidScheduleId` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `CutOffTime` datetime DEFAULT NULL,
  `suborderStatus` varchar(512) DEFAULT NULL,
  `suborderStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
INSERT INTO `suborder` VALUES (1,1,450,0,20,'2020-08-09 00:00:00',0,NULL,1,1,2,450,10,2,NULL,'2020-08-09 12:19:18','SUB_ORDER_BID_ASSIGNED',12),(2,1,450,0,20,'2020-08-09 00:00:00',0,NULL,1,1,2,450,10,2,NULL,'2020-08-09 15:00:18','SUB_ORDER_PENDING',11),(3,1,450,0,20,'2020-08-09 00:00:00',0,NULL,1,1,2,450,10,2,NULL,'2020-08-09 15:00:18','SUB_ORDER_PENDING',11),(4,1,450,0,20,'2020-08-09 00:00:00',0,NULL,1,1,2,450,10,2,NULL,'2020-08-09 15:00:18','SUB_ORDER_PENDING',11),(8,2,1350,0,20,'2020-08-09 00:00:00',0,NULL,2,2,3,1350,10,3,NULL,'2020-08-09 20:03:15','SUB_ORDER_PENDING',11),(9,2,1350,0,20,'2020-08-09 00:00:00',0,NULL,2,2,3,1350,10,3,NULL,'2020-08-09 20:03:15','SUB_ORDER_PENDING',11),(10,2,1350,0,20,'2020-08-09 00:00:00',0,NULL,2,2,3,1350,10,3,NULL,'2020-08-09 20:03:15','SUB_ORDER_PENDING',11),(11,2,1350,0,20,'2020-08-09 00:00:00',0,NULL,2,2,3,1350,10,3,NULL,'2020-08-09 20:03:15','SUB_ORDER_PENDING',11),(15,3,450,0,20,'2020-08-09 00:00:00',0,NULL,3,1,2,450,10,2,NULL,'2020-08-09 15:48:43','SUB_ORDER_PENDING',11),(16,3,450,0,20,'2020-08-09 00:00:00',0,NULL,3,1,2,450,10,2,NULL,'2020-08-09 12:52:43','SUB_ORDER_TRIP_STARTED',13),(17,3,450,0,20,'2020-08-09 00:00:00',0,NULL,3,1,2,450,10,2,NULL,'2020-08-09 12:52:43','SUB_ORDER_BID_ASSIGNED',12),(18,3,450,0,20,'2020-08-09 00:00:00',0,NULL,3,1,2,450,10,2,NULL,'2020-08-09 12:52:43','SUB_ORDER_BID_ASSIGNED',12),(19,3,450,0,20,'2020-08-09 00:00:00',0,NULL,3,1,2,450,10,2,NULL,'2020-08-09 15:48:43','SUB_ORDER_PENDING',11),(20,3,450,0,20,'2020-08-09 00:00:00',0,NULL,3,1,2,450,10,2,NULL,'2020-08-09 15:48:43','SUB_ORDER_PENDING',11);
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
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `billedAmount` int(11) DEFAULT NULL,
  `BidValue` int(11) DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `sourceName` varchar(512) DEFAULT NULL,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `tripstatus` varchar(512) DEFAULT NULL,
  `tripStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,1,1,2,1,1,11,'2020-08-09 01:25:21',NULL,'2020-08-09 06:18:08','2020-08-09 06:58:03','2020-08-09 01:25:21',0,NULL,'JNPT','All Cargo  Empty August 9','MH12HU2233',NULL,'TRIP_STARTED',19),(2,16,1,2,2,2,10,'2020-08-09 01:59:02',NULL,'2020-08-09 07:26:57','2020-08-09 07:29:10','2020-08-09 01:59:02',0,NULL,'JNPT','All Cargo  Empty August 9','MH23HY4455',NULL,'TRIP_STARTED',19),(3,17,1,2,NULL,NULL,10,'2020-08-09 12:55:20',NULL,NULL,NULL,NULL,NULL,430,NULL,NULL,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16),(4,18,1,2,NULL,NULL,10,'2020-08-09 12:55:20',NULL,NULL,NULL,NULL,NULL,430,NULL,NULL,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trip_AFTER_INSERT` AFTER INSERT ON `trip` FOR EACH ROW BEGIN

/*Update transporter.suborder set suborderStatus = 'SUB_ORDER_BID_ASSIGNED',
suborderStatusId = 12 Where subOrderId = NEW.subOrderId;

Update transporter.bid set bidStatus = 'BID_ASSIGNED',
bidStatusId = 2 where subOrderId = NEW.subOrderId;*/

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `truck` (
  `truckId` int(11) NOT NULL AUTO_INCREMENT,
  `containerId` int(11) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `truckNumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,0,1,'2020-08-09 06:30:18',1,'2020-08-09 06:30:18','121334gfd'),(2,1,0,1,'2020-08-09 06:30:18',1,'2020-08-09 06:30:18','1212545464'),(3,2,0,1,'2020-08-09 06:33:15',1,'2020-08-09 06:33:15','121546'),(4,2,0,1,'2020-08-09 06:33:15',1,'2020-08-09 06:33:15','121256tr'),(5,3,0,1,'2020-08-09 07:18:43',1,'2020-08-09 07:18:43','fdgdfgfd'),(6,3,0,1,'2020-08-09 07:18:43',1,'2020-08-09 07:18:43','dfgdfgf'),(7,3,0,1,'2020-08-09 07:18:43',1,'2020-08-09 07:18:43','fdgfdg');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$x7WtqVjuBztMPppzAI45BO59VoFVRxaEvxt6qwtBUKXkAzoeZ4WCW','Utsav','P','90047889',1,'[\"AccessAuthFeature\"]'),(10,'transporter@trans.in','$2a$10$J/b4PVqTemUGNjvG2/6dCuNLIsPio.GPS4PMj56ccqapBlRri8NvG','Transporter','Trans','66554788',5,'[\"AccessAuthFeature\"]'),(11,'transporter2@trans.in','$2a$10$YghB1iQi/ksfRTdxHWLDIeAhVaDS.6yTDTtWDstfGDeiquoUnQ3Au','Transporter','Trans','5544789',5,'[\"AccessAuthFeature\"]'),(12,'trans2@trans.in','$2a$10$Isyd2KjXh5eBtUbRoT0B9.OUauNx6KqpiEDvKKlxe40slidJhidqm','Trans','Trans','445577889',5,'[\"AccessAuthFeature\"]'),(14,'cfs@admin.in','$2a$10$r0saHaMwcXkzDoFSqV19/u2OMSx4jJxjxa8pSCbFFekptSSwrjiPW','CFS User','CFS User','90045789',4,'[\"AccessAuthFeature\"]'),(15,'aabb@ddee.ij','$2a$10$Vc8VAd/pX8moufIjYjbIBuaxGHLoS143LhG7Eyy99HtSL30qHn1Tm','abc','def','889745',6,'[\"AccessAuthFeature\"]'),(16,'driver@trans.in','$2a$10$m7bN7/pPdRSkFOo6Gh/GdemLu9x2aUrBnH31q3xQg80b/wKOYyqA.','abc','def','889745',6,'[\"AccessAuthFeature\"]'),(17,'sdgh@sjkdfh.kl','$2a$10$l19BIEuG4coKmf/wDFsDGOS1SEbmklAmkfOPkq7vumhpxSxQPbJMa','awe','asd','545456',6,'[\"AccessAuthFeature\"]'),(18,'sdgh@sjkdfdfh.kl','$2a$10$fu9eab2N6SOegkVC41T8a.jMBLTbHINYcvYfBvtxirWMusA7llKeK','awe','asd','545456',6,'[\"AccessAuthFeature\"]'),(19,'driver@trans11.in','$2a$10$Xfz2EZsVaw5xfFCqPKCSGeyOkqs.cNEhJvrq/0LHuf74HWZskKPqC','My New','Driver','5522885',6,'[\"AccessAuthFeature\"]'),(20,'cfs@cargo.com','$2a$10$P5KDTTwuNMxNpZWkxiWcfO0.BolPnqUFM9UaAaxQAiRCdWST0IkGW','CFS USER 1','CFS USER 1','9886631264',4,'[\"AccessAuthFeature\"]'),(21,'utsav@driver.in','$2a$10$YgNSUkCZBIsAsF6bUMi6neKsXyqtOj1DSQamvSnJmYNmr5nxC4Jg2','Utsav','dfsgdf','9886631264',6,'[\"AccessAuthFeature\"]'),(22,'gaurav@driver.in','$2a$10$HUptBGxE3UI/sWaGeSUdUeRkbxIdwNMAdu4RXaIniAfFDm/lodSzK','gaurav','fdgfdg','9886631264',6,'[\"AccessAuthFeature\"]');
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
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `desc` varchar(512) DEFAULT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
INSERT INTO `vehiclemaster` VALUES (1,'MH12HU2233',1,4,20,'2002',1,1,1,11,'2020-08-09 06:52:55',11,'2020-08-09 06:52:55'),(2,'MH23HY4455',1,2,2,'2005',1,1,1,10,'2020-08-09 07:27:58',10,'2020-08-09 07:27:58');
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
  `createdBy` int(11) NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`vehicletransportermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletransportermapping`
--

LOCK TABLES `vehicletransportermapping` WRITE;
/*!40000 ALTER TABLE `vehicletransportermapping` DISABLE KEYS */;
INSERT INTO `vehicletransportermapping` VALUES (1,11,1,11,'2020-08-09 06:52:55',NULL,NULL),(2,10,2,10,'2020-08-09 07:27:58',NULL,NULL);
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
  `containerMasterId` int(11) DEFAULT NULL,
  `weightDesc` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`weightMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
INSERT INTO `weightmaster` VALUES (1,1,'10 TON',1,1,'2020-08-09 06:00:39',1,'2020-08-09 06:00:39'),(2,1,'5 TON',1,1,'2020-08-09 06:00:52',1,'2020-08-09 06:00:52'),(3,2,'10 TON',1,1,'2020-08-09 06:01:00',1,'2020-08-09 06:01:00'),(4,2,'20 TON',1,1,'2020-08-09 06:01:07',1,'2020-08-09 06:01:07');
/*!40000 ALTER TABLE `weightmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardcfsratemaster`
--

DROP TABLE IF EXISTS `yardcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yardcfsratemaster` (
  `cfsMasterId` int(11) DEFAULT NULL,
  `yardMasterId` int(11) DEFAULT NULL,
  `containerMasterId` int(11) DEFAULT NULL,
  `weightMasterId` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `portMasterId` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `yardCfsRateMasterId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`yardCfsRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardcfsratemaster`
--

LOCK TABLES `yardcfsratemaster` WRITE;
/*!40000 ALTER TABLE `yardcfsratemaster` DISABLE KEYS */;
INSERT INTO `yardcfsratemaster` VALUES (1,1,1,2,500,2,1,0,NULL,'2020-08-09 06:03:48',NULL,1),(1,1,1,1,1000,2,1,0,NULL,'2020-08-09 06:04:11',NULL,2),(1,1,2,3,1500,2,1,0,NULL,'2020-08-09 06:04:24',NULL,3),(1,1,2,4,2000,2,1,0,NULL,'2020-08-09 06:04:38',NULL,4),(2,2,1,1,10000,2,1,0,NULL,'2020-08-09 06:05:10',NULL,6),(2,2,1,2,5000,2,1,0,NULL,'2020-08-09 06:05:55',NULL,7),(2,2,2,3,15000,2,1,0,NULL,'2020-08-09 06:06:13',NULL,8),(2,2,2,4,20000,2,1,0,NULL,'2020-08-09 06:06:26',NULL,9);
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
  `portMasterId` int(11) DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `yardName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
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
INSERT INTO `yardmaster` VALUES (1,2,'dfgdfg','411045','44555','45455','JNPT YARD',1,1,1,'2020-08-09 05:56:35','2020-08-09 05:56:35','dfgdfg','landmark',1,1,'Bhushan','9886631264'),(2,2,'dfgdfg','411045','44555','564654','JNPT YARD 2',1,1,1,'2020-08-09 05:57:02','2020-08-09 05:57:02','dfgdfg','landmark',1,1,'Bhushan','9886631264');
/*!40000 ALTER TABLE `yardmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedaymaster`
--

DROP TABLE IF EXISTS `zonedaymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zonedaymaster` (
  `portId` int(11) DEFAULT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `zoneName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL
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
  `pincode` varchar(512) DEFAULT NULL,
  `zoneName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `zoneDesc` varchar(512) DEFAULT NULL
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
if(starthour between 10 and 18)
then
	if(hours < 8) then
		if(hours <=(18 - starthour))
			then
				select DATE_ADD(StartDate, INTERVAL hours Hour) into CutOffTime;
            else 
				select DATE_ADD(StartDate, INTERVAL (24 + (hours - (18 - starthour))) Hour) into CutOffTime;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetBidNumber`() RETURNS varchar(250) CHARSET utf8
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllCFSContainersbyUserId`(in user_Id int, in type_Id int)
BEGIN

IF (type_Id = 1 or type_Id = 3) Then -- CFS To Yard Or Yard To CFS
Select distinct  c.* from transporter.containermaster c
Inner Join yardcfsratemaster yrm on c.containerMasterId = yrm.containerMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;

ELSEIF (type_Id = 2 or type_Id = 4)  Then -- Port To CFS Or CFS To Port
Select distinct c.* from transporter.containermaster c
Inner Join cfsratemaster crm on c.containerMasterId = crm.containerMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id;
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

Select p.* from transporter.portmaster p
Inner Join cfsratemaster crm on p.portMasterId = crm.portMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCFSWeightsbyUserandContainerId`(in user_Id int, in type_Id int, in container_Id int)
BEGIN

IF (type_Id = 1 or type_Id = 3) Then -- CFS To Yard Or Yard To CFS

Select distinct w.* from transporter.weightmaster w
Inner Join yardcfsratemaster yrm on w.weightMasterId = yrm.weightMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and yrm.containerMasterId = container_Id;

ELSEIF (type_Id = 2 or type_Id = 4)  Then -- Port To CFS Or CFS To Port

Select distinct w.* from transporter.weightmaster w
Inner Join cfsratemaster crm on w.weightMasterId = crm.weightMasterId
Inner Join transporter.cfsuserregistration cur on crm.cfsMasterId = cur.cfsMasterId
Where cur.userId = user_Id and crm.containerMasterId= container_Id;

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

Select y.* from transporter.yardmaster y
Inner Join yardcfsratemaster yrm on y.yardMasterId = yrm.yardMasterId
Inner Join transporter.cfsuserregistration cur on yrm.cfsMasterId = cur.cfsMasterId
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

Select 
 ord.orderId, ord.sourceType,ord.destinationType,ord.orderRemarks,ord.orderDate,ord.totalRate,
 ord.orderStatus,ord.orderStatusId,ptm.terminal,
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
    from transporter.order ord
    inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
    Where ord.createdBy = user_Id And ord.isDeleted = 0;
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
Select subo.subOrderId, subo.subOrderTotalMargin,subo.CutOffTime,subo.subOrderTotal,
subo.subOrderTotalMargin,subo.suborderStatus,suborderStatusId,
wm.weightDesc,cm.containerMasterName
from transporter.suborder subo
left outer join transporter.weightmaster wm on wm.weightMasterId = subo.containerWeightType
left outer join transporter.containermaster cm on cm.containerMasterId = subo.containerType
where subo.createdBy = user_Id and isDelete = 0; 

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

Select t.subOrderId,t.sourceId,t.destinationId,t.assignedVehicle,
t.assignedDriver,t.tripstatus,t.startDate,t.endDate,t.billedAmount,
t.createdBy,t.createdOn, concat(u.firstName ,' ',u.lastName) as DriverName,
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
Left Outer Join transporter.driver u on u.driverId = t.assignedDriver
Where t.createdBy = user_Id;


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
    b.originalRate
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
Where t.tripId = trip_Id;
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
/*!50003 DROP PROCEDURE IF EXISTS `procGetCFSFillOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procGetCFSFillOrder`(in user_Id int, in master_Type int)
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
ord.orderRemarks,ord.orderDate,ord.totalRate,
ord.orderStatus,
subo.subOrderTotalMargin,subo.CutOffTime,subo.suborderStatus,
bid.bidName,
concat(usr.firstName ,' ',usr.lastName) TranporterName,bum.bidValue,bum.biduserStatus,
vhl.vehicleNumber,concat(dusr.firstName ,' ',dusr.lastName) AssignedDriver,dusr.emailid,dusr.mobileNumber,trp.tripstatus,
wm.weightDesc,cm.containerMasterName
from transporter.order ord
inner join transporter.suborder subo on subo.orderId= ord.orderId
inner join transporter.portterminalmaster ptm on ptm.portTerminalId = ord.portTerminalId
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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

end ;;
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
Declare masterType int default 0; 
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

Select settingsValue into profit_margin
from settings Where settingsName = 'cfs_order_profit';

Select settingsValue into bid_limit_percent
from settings Where settingsName = 'bid_lower_limit';


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
			Set cfsRate := (select rate * trucks
			from transporter.cfsratemaster
			Where portMasterId = source_Id  
            and cfsMasterId = destination_Id
			and weightMasterId = weight_type 
            and containerMasterId = containerType);
			
            -- Set subOrderId = 0;
            -- Set cfs_rate = (cfsRate - ((cfsRate * profit_margin) / 100));
             
           
            
            Set orderRate = orderRate + cfsRate;
            -- select concat('** ', cfsRate) AS '** DEBUG:';
		ElseIf masterType = 2 then -- CFS To Port
			Set cfsRate := (select rate * trucks
			from transporter.cfsratemaster
			Where portMasterId = destination_Id and cfsMasterId = source_Id
			and weightMasterId = weight_type and containerMasterId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 3 then -- Yard To CFS
			Set cfsRate := (select rate * trucks
			from transporter.yardcfsratemaster yrm
            inner join transporter.cfsmaster cm on yrm.portMasterId = cm.portMasterId
            and yrm.cfsMasterId = cm.cfsMasterId 
			Where yrm.yardMasterId = source_Id and yrm.cfsMasterId = destination_Id
			and weightMasterId = weight_type and containerMasterId = containerType
            and yrm.portMasterId = cm.portMasterId);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 1 then -- CFS To Yard
			Set cfsRate := (select rate * trucks
			from transporter.yardcfsratemaster yrm
            inner join transporter.cfsmaster cm on yrm.portMasterId = cm.portMasterId
            and yrm.cfsMasterId = cm.cfsMasterId 
			Where yardMasterId = destination_Id and yrm.cfsMasterId = source_Id
			and weightMasterId = weight_type and containerMasterId = containerType
            and yrm.portMasterId = cm.portMasterId);
			Set orderRate = orderRate + cfsRate;
		End if;
        
     END IF;
     UNTIL exit_loop END REPEAT;
    
   close order_cursor;
   
	Set profit_Rate = (orderRate * profit_margin)/ 100;
	Update transporter.order set totalRate = orderRate,
    profitMarginPercentage = profit_margin,
    profitRate = profit_Rate,
    orderStatus = 'ORDER_ACCEPTED',
    orderStatusId = 6,
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    -- Insert SubOrder
Insert into transporter.suborder(orderId,subOrderTotal,isDelete,createdBy,
createdOn,modifiedBy,modifiedOn,cotainerId,containerType,containerWeightType,
subOrderTotalMargin,marginPercent,suborderStatus,suborderStatusId)
Select order_Id, (cr.rate - ((cr.rate * s.settingsValue) / 100)),
0,created_by,CURDATE(),
0,null,t.containerId,c.containerMasterId,
c.weightType,(cr.rate - ((cr.rate * s.settingsValue) / 100)),
s.settingsValue,'SUB_ORDER_PENDING',11
From transporter.order ord
Inner join transporter.container c
on ord.orderId = c.orderId
Inner Join transporter.truck t
on c.containerId = t.containerId
Left Outer Join transporter.cfsratemaster cr on
c.containerMasterId = cr.containerMasterId
 and c.weightType = cr.weightMasterId
Left Outer Join transporter.yardcfsratemaster ym on
c.containerMasterId = ym.containerMasterId
 and c.weightType = ym.weightMasterId
Left Outer Join transporter.portmaster p on cr.portMasterId = p.portMasterId
Left Outer Join transporter.cfsmaster cm on cr.cfsMasterId = cm.cfsMasterId 
Left Outer Join transporter.yardmaster y on ym.yardMasterId = y.yardMasterId
Left Outer Join transporter.cfsmaster ycm on ym.cfsMasterId = ycm.cfsMasterId 
Left Outer join settings s on settingsName = 'cfs_order_profit' 
where ord.orderId = order_Id and
case 
when ord.masterTypeId = 4 then
 cr.portMasterId = ord.sourceId and cr.cfsMasterId = ord.destinationId
when ord.masterTypeId = 2 then
 cr.portMasterId = ord.destinationId and cr.cfsMasterId = ord.sourceId
when ord.masterTypeId = 3 then
 ym.yardMasterId = ord.sourceId and ym.cfsMasterId = ord.destinationId
when ord.masterTypeId = 1 then
 ym.yardMasterId = ord.destinationId and ym.cfsMasterId = ord.sourceId
 end;
            
            
            -- End SubOrder
			-- Insert Bid
			
		Insert into transporter.bid(bidName,originalRate,exhibitionDate,
		subOrderId,isActive,createdBy,createdOn,bidUpperLimit,modifiedBy,
		modifiedOn,bidLowerLimit,bidStatus,bidStatusId)
		Select GetBidNumber(),sub.subOrderTotal,
		null,sub.subOrderId,1,created_by,CURDATE(),0,
		0,null,(sub.subOrderTotal - ((sub.subOrderTotal * bid_limit_percent) / 100)),'BID_PENDING',1
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

-- Dump completed on 2020-08-13 17:25:47
