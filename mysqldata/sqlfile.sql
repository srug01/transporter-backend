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
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,'BID00000001',450,NULL,1,1,14,'2020-08-02 00:00:00',0,0,NULL,360,NULL),(2,'BID00000002',4500,NULL,2,1,14,'2020-08-02 00:00:00',0,0,NULL,3600,NULL);
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
  `bidStatus` varchar(512) DEFAULT NULL,
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
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
INSERT INTO `bidusermapping` VALUES (1,1,11,'BID00000001',410,'confirmed','2020-08-02 20:30:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,11,'BID00000002',4000,'confirmed','2020-08-02 20:32:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,1,10,'BID00000001',400,'confirmed','2020-08-02 20:34:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,2,10,'BID00000002',4500,'confirmed','2020-08-02 20:34:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
INSERT INTO `cfsmaster` VALUES ('add1','4001254','55226225','552323255',4,1,'All Cargo  2 Aug','554775','cfs@new.in','CFS01','22566232','ABC Contact','1224558','Additional contact','552655',1,'2020-08-02 13:36:55',1,'2020-08-02 13:36:55',1,'add2','landmark',1,1,'55653','564654');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsratemaster`
--

LOCK TABLES `cfsratemaster` WRITE;
/*!40000 ALTER TABLE `cfsratemaster` DISABLE KEYS */;
INSERT INTO `cfsratemaster` VALUES (3,1,4,5,500,1,1,'2020-08-02 13:38:01',1,'2020-08-02 13:38:01',5),(4,1,4,6,1000,1,1,'2020-08-02 13:38:15',1,'2020-08-02 13:38:15',5),(5,1,4,7,1500,1,1,'2020-08-02 13:38:27',1,'2020-08-02 13:38:27',5),(6,1,4,8,2000,1,1,'2020-08-02 13:38:38',1,'2020-08-02 13:38:38',5),(7,1,4,10,5000,1,1,'2020-08-02 13:38:57',1,'2020-08-02 13:38:57',6),(8,1,4,11,10000,1,1,'2020-08-02 13:39:08',1,'2020-08-02 13:39:08',6),(9,1,4,12,15000,1,1,'2020-08-02 13:39:21',1,'2020-08-02 13:39:21',6),(10,1,4,13,20000,1,1,'2020-08-02 13:39:33',1,'2020-08-02 13:39:33',6),(11,1,4,14,50000,1,1,'2020-08-02 13:40:17',1,'2020-08-02 13:40:17',7),(12,1,4,15,100000,1,1,'2020-08-02 13:41:29',1,'2020-08-02 13:41:29',7),(13,1,4,16,150000,1,1,'2020-08-02 13:41:42',1,'2020-08-02 13:41:42',7),(14,1,4,17,200000,1,1,'2020-08-02 13:41:55',1,'2020-08-02 13:41:55',7);
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
INSERT INTO `cfsuserregistration` VALUES (1,1,7,'CFS User','Designation','Department','90045789','cfs@admin.in','123456789',14,1,1,1,'2020-07-31 11:15:39',1,'2020-07-31 11:15:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,5,1,0,1,'2020-08-02 14:57:51',1,'2020-08-02 14:57:51',5),(2,1,10,1,0,1,'2020-08-02 14:57:51',1,'2020-08-02 14:57:51',6);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containermaster`
--

LOCK TABLES `containermaster` WRITE;
/*!40000 ALTER TABLE `containermaster` DISABLE KEYS */;
INSERT INTO `containermaster` VALUES (5,'20FT',1,1,'2020-07-17 19:45:24',1,'2020-07-17 19:45:24'),(6,'40 FT',1,1,'2020-08-02 13:25:43',1,'2020-08-02 13:25:43'),(7,'ODC',1,1,'2020-08-02 13:31:33',1,'2020-08-02 13:31:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'driver','123','utsav@ghh.kk','447889552',1,1,'445578','add123','add2','landmark',1,1,'998875499',1,'2020-08-01 08:23:23',1,'2020-08-01 08:23:23',NULL,NULL),(2,'abc','def','aabb@ddee.ij','889745',1,1,'5858856','add1','add2','aaa',1,1,'asdsd',1,'2020-08-01 14:40:52',NULL,NULL,'123456789',NULL),(3,'abc','def','driver@trans.in','889745',1,1,'5858856','add1','add2','aaa',1,1,'asdsd',1,'2020-08-01 14:40:52',NULL,NULL,'123456789',NULL),(4,'awe','asd','sdgh@sjkdfdfh.kl','545456',1,1,'11212','dkfn','lnxkvcb','zkvb',1,1,'56456',1,'2020-08-01 15:03:17',1,'2020-08-01 15:03:17','123456789',NULL),(5,'My New','Driver','driver@trans11.in','5522885',1,1,'44145','add1','add2','landmark',1,1,'22554',11,'2020-08-01 22:15:01',11,'2020-08-01 22:15:01','123456789',19),(6,'Bhushan','Gadekar','bhushan@driver.com','9886631264',1,1,'422302','dfgdfg','dfgdfg','dfgdfg',1,1,'fdgdfg4546d',11,'2020-08-02 11:05:02',11,'2020-08-02 11:05:02','bhushan123',20),(7,'Gaurav','fghfh','gaurav@gmail.com','9886631264',1,1,'422112','dfgdfg','dfgdfg','dfgdfg',1,1,'657566758',10,'2020-08-02 15:17:32',10,'2020-08-02 15:17:32','gaurav123',21),(8,'utsav','fdgfdn','utsav@gmail.com','9886631264',1,1,'422112','dfgdfg','fdgfdg','fdgdfg',1,2,'werwerewr',10,'2020-08-02 15:22:39',10,'2020-08-02 15:22:39','utsav123',22);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivertransportermapping`
--

LOCK TABLES `drivertransportermapping` WRITE;
/*!40000 ALTER TABLE `drivertransportermapping` DISABLE KEYS */;
INSERT INTO `drivertransportermapping` VALUES (1,16,10,1,'2020-08-01 14:40:52',NULL,NULL),(2,18,11,1,'2020-08-01 15:03:17',NULL,NULL),(3,19,11,11,'2020-08-01 22:15:01',NULL,NULL),(4,20,11,11,'2020-08-02 11:05:02',NULL,NULL),(5,21,10,10,'2020-08-02 15:17:32',NULL,NULL),(6,22,10,10,'2020-08-02 15:22:39',NULL,NULL);
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
INSERT INTO `locationmaster` VALUES (1,'Mumbai',1,1,'2020-06-26 20:39:22',NULL,NULL,1),(2,'Diu',1,1,'2020-06-26 20:39:22',NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS User CFS User placed a new Order on 2020-08-02!',1,14,'2020-08-02 14:57:52',0,NULL,1,NULL),(2,'orders','Transporter Trans confirmed a bid on 2020-08-02!',1,11,'2020-08-02 15:00:40',0,NULL,1,NULL),(3,'orders','Transporter Trans confirmed a bid on 2020-08-02!',1,11,'2020-08-02 15:02:02',0,NULL,1,NULL),(4,'orders','Transporter Trans confirmed a bid on 2020-08-02!',1,10,'2020-08-02 15:04:49',0,NULL,1,NULL),(5,'orders','Transporter Trans confirmed a bid on 2020-08-02!',1,10,'2020-08-02 15:04:50',0,NULL,1,NULL);
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
  `status` varchar(512) DEFAULT NULL,
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
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `rateExcludingProfit` int(11) DEFAULT NULL,
  `portTerminalId` int(11) DEFAULT NULL,
  `timeslotMasterId` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,4,1,'submitted',5500,550,10,NULL,'2020-08-03 18:30:00',4,'PORT','CFS','NA','',0,0,14,'2020-08-02 14:57:51',14,'2020-08-02 14:57:51',4950,2,4);
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
  `roleId` int(11) DEFAULT NULL,
  `dashboardFull` tinyint(1) DEFAULT NULL,
  `dashboardRead` tinyint(1) DEFAULT NULL,
  `dashboardWrite` tinyint(1) DEFAULT NULL,
  `cfsFull` tinyint(1) DEFAULT NULL,
  `cfsRead` tinyint(1) DEFAULT NULL,
  `cfsWrite` tinyint(1) DEFAULT NULL,
  `createOrderFull` tinyint(1) DEFAULT NULL,
  `createOrderRead` tinyint(1) DEFAULT NULL,
  `createOrderWrite` tinyint(1) DEFAULT NULL,
  `listOrderFull` tinyint(1) DEFAULT NULL,
  `listOrderRead` tinyint(1) DEFAULT NULL,
  `listOrderWrite` tinyint(1) DEFAULT NULL,
  `userRegistrationFull` tinyint(1) DEFAULT NULL,
  `userRegistrationRead` tinyint(1) DEFAULT NULL,
  `userRegistrationWrite` tinyint(1) DEFAULT NULL,
  `userListFull` tinyint(1) DEFAULT NULL,
  `userListRead` tinyint(1) DEFAULT NULL,
  `userListWrite` tinyint(1) DEFAULT NULL,
  `tranporterFull` tinyint(1) DEFAULT NULL,
  `tranporterRead` tinyint(1) DEFAULT NULL,
  `tranporterWrite` tinyint(1) DEFAULT NULL,
  `bidsFull` tinyint(1) DEFAULT NULL,
  `bidsRead` tinyint(1) DEFAULT NULL,
  `bidsWrite` tinyint(1) DEFAULT NULL,
  `vehicleRegistrationFull` tinyint(1) DEFAULT NULL,
  `vehicleRegistrationRead` tinyint(1) DEFAULT NULL,
  `vehicleRegistrationWrite` tinyint(1) DEFAULT NULL,
  `vehicleListFull` tinyint(1) DEFAULT NULL,
  `vehicleListRead` tinyint(1) DEFAULT NULL,
  `vehicleListWrite` tinyint(1) DEFAULT NULL,
  `tranporterRegistrationFull` tinyint(1) DEFAULT NULL,
  `tranporterRegistrationRead` tinyint(1) DEFAULT NULL,
  `tranporterRegistrationWrite` tinyint(1) DEFAULT NULL,
  `tranporterListFull` tinyint(1) DEFAULT NULL,
  `tranporterListRead` tinyint(1) DEFAULT NULL,
  `tranporterListWrite` tinyint(1) DEFAULT NULL,
  `driverRegistrationFull` tinyint(1) DEFAULT NULL,
  `driverRegistrationRead` tinyint(1) DEFAULT NULL,
  `driverRegistrationWrite` tinyint(1) DEFAULT NULL,
  `mastersFull` tinyint(1) DEFAULT NULL,
  `mastersRead` tinyint(1) DEFAULT NULL,
  `mastersWrite` tinyint(1) DEFAULT NULL,
  `cfsMasterFull` tinyint(1) DEFAULT NULL,
  `cfsMasterRead` tinyint(1) DEFAULT NULL,
  `cfsMasterWrite` tinyint(1) DEFAULT NULL,
  `containerMasterFull` tinyint(1) DEFAULT NULL,
  `containerMasterRead` tinyint(1) DEFAULT NULL,
  `containerMasterWrite` tinyint(1) DEFAULT NULL,
  `cfsRateMasterFull` tinyint(1) DEFAULT NULL,
  `cfsRateMasterRead` tinyint(1) DEFAULT NULL,
  `cfsRateMasterWrite` tinyint(1) DEFAULT NULL,
  `dieselMasterFull` tinyint(1) DEFAULT NULL,
  `dieselMasterRead` tinyint(1) DEFAULT NULL,
  `dieselMasterWrite` tinyint(1) DEFAULT NULL,
  `locationMasterFull` tinyint(1) DEFAULT NULL,
  `locationMasterRead` tinyint(1) DEFAULT NULL,
  `locationMasterWrite` tinyint(1) DEFAULT NULL,
  `mileageMasterFull` tinyint(1) DEFAULT NULL,
  `mileageMasterWrite` tinyint(1) DEFAULT NULL,
  `mileageMasterRead` tinyint(1) DEFAULT NULL,
  `portMasterFull` tinyint(1) DEFAULT NULL,
  `portMasterRead` tinyint(1) DEFAULT NULL,
  `portMasterWrite` tinyint(1) DEFAULT NULL,
  `portTerminalMasterFull` tinyint(1) DEFAULT NULL,
  `portTerminalMasterRead` tinyint(1) DEFAULT NULL,
  `portTerminalMasterWrite` tinyint(1) DEFAULT NULL,
  `stateMasterFull` tinyint(1) DEFAULT NULL,
  `stateMasterRead` tinyint(1) DEFAULT NULL,
  `stateMasterWrite` tinyint(1) DEFAULT NULL,
  `weightMasterFull` tinyint(1) DEFAULT NULL,
  `weightMasterRead` tinyint(1) DEFAULT NULL,
  `weightMasterWrite` tinyint(1) DEFAULT NULL,
  `yardMasterFull` tinyint(1) DEFAULT NULL,
  `yardMasterRead` tinyint(1) DEFAULT NULL,
  `yardMasterWrite` tinyint(1) DEFAULT NULL,
  `yardPortMasterFull` tinyint(1) DEFAULT NULL,
  `yardPortMasterRead` tinyint(1) DEFAULT NULL,
  `yardPortMasterWrite` tinyint(1) DEFAULT NULL,
  `yardCFSRateMasterFull` tinyint(1) DEFAULT NULL,
  `yardCFSRateMasterRead` tinyint(1) DEFAULT NULL,
  `yardCFSRateMasterWrite` tinyint(1) DEFAULT NULL,
  `zoneMasterFull` tinyint(1) DEFAULT NULL,
  `zoneMasterRead` tinyint(1) DEFAULT NULL,
  `zoneMasterWrite` tinyint(1) DEFAULT NULL,
  `zoneDayMasterFull` tinyint(1) DEFAULT NULL,
  `zoneDayMasterRead` tinyint(1) DEFAULT NULL,
  `zoneDayMasterWrite` tinyint(1) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`permissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1),(2,4,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1),(3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1),(4,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1),(5,7,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1),(6,8,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1),(7,9,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'2020-08-05 06:33:19',0,'2020-08-05 06:33:19',1);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (4,1,'564654','65454','JNPT',1,1,'2020-07-27 20:40:57',1,'2020-07-27 20:40:57',1,'add1','add2','land','41155',NULL,NULL),(5,1,'554564','564654','New Port Field',1,1,'2020-07-27 21:29:49',1,'2020-07-27 21:29:49',1,'Add1','Add2','Land','444778','Name','Number'),(6,1,'44555','45455','MPT',1,1,'2020-08-02 13:29:01',1,'2020-08-02 13:29:01',1,'Bombay, Maharashtra','Bombay, Maharashtra','Bombay','411045','Bhushan','9886631264');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
INSERT INTO `portterminalmaster` VALUES (1,'Terminal1','8655655',NULL,'44554',NULL,NULL,4,1,NULL),(2,'DP World','15584',1,'7845',1,'2020-08-02 13:29:47',4,1,'2020-08-02 13:29:47'),(3,'GTI','32423',1,'32432',1,'2020-08-02 13:30:06',4,1,'2020-08-02 13:30:06');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `containerType` varchar(512) DEFAULT NULL,
  `containerWeightType` int(11) DEFAULT NULL,
  `subOrderTotalMargin` int(11) DEFAULT NULL,
  `marginPercent` int(11) DEFAULT NULL,
  `BidScheduleId` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `CutOffTime` datetime DEFAULT NULL,
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
INSERT INTO `suborder` VALUES (1,1,450,0,14,'2020-08-02 00:00:00',0,NULL,1,'5',5,450,10,4,NULL,NULL),(2,1,4500,0,14,'2020-08-02 00:00:00',0,NULL,2,'6',10,4500,10,4,NULL,NULL);
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
INSERT INTO `timeslotmaster` VALUES (1,'12','1','12 AM - 1 AM',1,'2020-08-03 00:00:00',NULL,NULL),(2,'1','2','1 AM - 2 AM',1,'2020-08-03 00:00:00',NULL,NULL),(3,'2','3','2 AM - 3 AM',1,'2020-08-03 00:00:00',NULL,NULL),(4,'3','4','3 AM - 4 AM',1,'2020-08-03 00:00:00',NULL,NULL),(5,'4','5','4 AM - 5 AM',1,'2020-08-03 00:00:00',NULL,NULL),(6,'5','6','5 AM - 6 AM',1,'2020-08-03 00:00:00',NULL,NULL),(7,'6','7','6 AM - 7 AM',1,'2020-08-03 00:00:00',NULL,NULL),(8,'7','8','7 AM - 8 AM',1,'2020-08-03 00:00:00',NULL,NULL),(9,'8','9','8 AM - 9 AM',1,'2020-08-03 00:00:00',NULL,NULL),(10,'9','10','9 AM - 10 AM',1,'2020-08-03 00:00:00',NULL,NULL),(11,'10','11','10 AM- 11 AM',1,'2020-08-03 00:00:00',NULL,NULL),(12,'11','12','11 AM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL),(13,'12','13','12 PM - 13 PM',1,'2020-08-03 00:00:00',NULL,NULL),(14,'13','14','13 PM - 14 PM',1,'2020-08-03 00:00:00',NULL,NULL),(15,'14','15','14 PM - 15 PM',1,'2020-08-03 00:00:00',NULL,NULL),(16,'15','16','15 PM - 16 PM',1,'2020-08-03 00:00:00',NULL,NULL),(17,'16','17','16 PM - 17 PM',1,'2020-08-03 00:00:00',NULL,NULL),(18,'17','18','17 PM - 18 PM',1,'2020-08-03 00:00:00',NULL,NULL),(19,'18','19','18 PM - 19 PM',1,'2020-08-03 00:00:00',NULL,NULL),(20,'19','20','19 PM - 20 PM',1,'2020-08-03 00:00:00',NULL,NULL),(21,'20','21','20 PM - 21 PM',1,'2020-08-03 00:00:00',NULL,NULL),(22,'21','22','21 PM - 22 PM',1,'2020-08-03 00:00:00',NULL,NULL),(23,'22','23','22 PM - 23 PM',1,'2020-08-03 00:00:00',NULL,NULL),(24,'23','12','23 PM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL);
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
  `status` varchar(512) DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int(11) DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `billedAmount` int(11) DEFAULT NULL,
  `BidValue` int(11) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `sourceName` varchar(512) DEFAULT NULL,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,1,4,1,NULL,NULL,'Pending',11,'2020-08-02 20:35:44',NULL,NULL,NULL,NULL,NULL,410,NULL,NULL,NULL,NULL),(2,2,4,1,NULL,NULL,'Pending',11,'2020-08-02 20:35:44',NULL,NULL,NULL,NULL,NULL,4000,NULL,NULL,NULL,NULL),(3,1,4,1,6,7,'started',10,'2020-08-02 09:49:11',NULL,'2020-08-02 11:29:53','2020-08-02 15:28:26','2020-08-02 09:49:11',0,NULL,NULL,'All Cargo  2 Aug','JNPT','MH12HU2233'),(4,2,4,1,3,8,'started',10,'2020-08-02 09:52:58',NULL,'2020-08-02 11:29:53','2020-08-02 15:28:42','2020-08-02 09:52:58',0,NULL,NULL,'All Cargo  2 Aug','JNPT','MH-01-9999');
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,0,1,'2020-08-02 14:57:51',1,'2020-08-02 14:57:51','sdfsdufu4434'),(2,2,0,1,'2020-08-02 14:57:51',1,'2020-08-02 14:57:51','bhgu4344');
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
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$x7WtqVjuBztMPppzAI45BO59VoFVRxaEvxt6qwtBUKXkAzoeZ4WCW','Utsav','P','90047889',1,'[\"AccessAuthFeature\"]'),(10,'transporter@trans.in','$2a$10$J/b4PVqTemUGNjvG2/6dCuNLIsPio.GPS4PMj56ccqapBlRri8NvG','Transporter','Trans','66554788',5,'[\"AccessAuthFeature\"]'),(11,'transporter2@trans.in','$2a$10$YghB1iQi/ksfRTdxHWLDIeAhVaDS.6yTDTtWDstfGDeiquoUnQ3Au','Transporter','Trans','5544789',5,'[\"AccessAuthFeature\"]'),(12,'trans2@trans.in','$2a$10$Isyd2KjXh5eBtUbRoT0B9.OUauNx6KqpiEDvKKlxe40slidJhidqm','Trans','Trans','445577889',5,'[\"AccessAuthFeature\"]'),(14,'cfs@admin.in','$2a$10$r0saHaMwcXkzDoFSqV19/u2OMSx4jJxjxa8pSCbFFekptSSwrjiPW','CFS User','CFS User','90045789',7,'[\"AccessAuthFeature\"]'),(15,'aabb@ddee.ij','$2a$10$Vc8VAd/pX8moufIjYjbIBuaxGHLoS143LhG7Eyy99HtSL30qHn1Tm','abc','def','889745',6,'[\"AccessAuthFeature\"]'),(16,'driver@trans.in','$2a$10$m7bN7/pPdRSkFOo6Gh/GdemLu9x2aUrBnH31q3xQg80b/wKOYyqA.','abc','def','889745',6,'[\"AccessAuthFeature\"]'),(17,'sdgh@sjkdfh.kl','$2a$10$l19BIEuG4coKmf/wDFsDGOS1SEbmklAmkfOPkq7vumhpxSxQPbJMa','awe','asd','545456',6,'[\"AccessAuthFeature\"]'),(18,'sdgh@sjkdfdfh.kl','$2a$10$fu9eab2N6SOegkVC41T8a.jMBLTbHINYcvYfBvtxirWMusA7llKeK','awe','asd','545456',6,'[\"AccessAuthFeature\"]'),(19,'driver@trans11.in','$2a$10$Xfz2EZsVaw5xfFCqPKCSGeyOkqs.cNEhJvrq/0LHuf74HWZskKPqC','My New','Driver','5522885',6,'[\"AccessAuthFeature\"]'),(20,'bhushan@driver.com','$2a$10$m2hmnPHK0OW1e0NoG4jJnOwwZFTVfnVvDTsDVih50G1R5cGuDY26S','Bhushan','Gadekar','9886631264',6,'[\"AccessAuthFeature\"]'),(21,'gaurav@gmail.com','$2a$10$D20bp8.OE.gGqakXpnGEDOj.CeKbuaeKjwuKaMUvGZgI5VHroqZki','Gaurav','fghfh','9886631264',6,'[\"AccessAuthFeature\"]'),(22,'utsav@gmail.com','$2a$10$qYVTz88XconJCJH8rNiOiOyi9gal1D.3jMB0ostcrjmmjB1ocOo4W','utsav','fdgfdn','9886631264',6,'[\"AccessAuthFeature\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
INSERT INTO `vehiclemaster` VALUES (2,'MH-01-123455',5,2,500,'2019',1,1,1,1,'2020-07-30 22:04:54',1,'2020-07-30 22:04:54'),(3,'MH-01-9999',4,1,100,'2009',1,1,1,1,'2020-07-31 10:44:09',1,'2020-07-31 10:44:09'),(4,'MH-01-9123',4,1,200,'2020',1,1,1,1,'2020-07-31 10:47:11',1,'2020-07-31 10:47:11'),(5,'MH12CU120',4,1,1,'2002',1,1,1,11,'2020-08-02 11:04:00',11,'2020-08-02 11:04:00'),(6,'MH12HU2233',5,5,1000,'2002',1,1,1,10,'2020-08-02 15:14:10',10,'2020-08-02 15:14:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletransportermapping`
--

LOCK TABLES `vehicletransportermapping` WRITE;
/*!40000 ALTER TABLE `vehicletransportermapping` DISABLE KEYS */;
INSERT INTO `vehicletransportermapping` VALUES (1,11,4,1,'2020-07-31 10:47:11',NULL,NULL),(2,10,3,10,'2020-08-02 00:00:00',NULL,NULL),(3,11,5,11,'2020-08-02 11:04:00',NULL,NULL),(4,10,6,10,'2020-08-02 15:14:10',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
INSERT INTO `weightmaster` VALUES (5,5,'5 TON',1,1,'2020-08-02 13:32:54',1,'2020-08-02 13:32:54'),(6,5,'10 TON',1,1,'2020-08-02 13:33:14',1,'2020-08-02 13:33:14'),(7,5,'15 TON',1,1,'2020-08-02 13:33:24',1,'2020-08-02 13:33:24'),(8,5,'20 TON',1,1,'2020-08-02 13:33:33',1,'2020-08-02 13:33:33'),(10,6,'5 TON',1,1,'2020-08-02 13:34:42',1,'2020-08-02 13:34:42'),(11,6,'10 TON',1,1,'2020-08-02 13:34:50',1,'2020-08-02 13:34:50'),(12,6,'15 TON',1,1,'2020-08-02 13:34:59',1,'2020-08-02 13:34:59'),(13,6,'20 TON',1,1,'2020-08-02 13:35:24',1,'2020-08-02 13:35:24'),(14,7,'5 TON',1,1,'2020-08-02 13:35:30',1,'2020-08-02 13:35:30'),(15,7,'10 TON',1,1,'2020-08-02 13:35:37',1,'2020-08-02 13:35:37'),(16,7,'15 TON',1,1,'2020-08-02 13:35:47',1,'2020-08-02 13:35:47'),(17,7,'20 TON',1,1,'2020-08-02 13:35:55',1,'2020-08-02 13:35:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardcfsratemaster`
--

LOCK TABLES `yardcfsratemaster` WRITE;
/*!40000 ALTER TABLE `yardcfsratemaster` DISABLE KEYS */;
INSERT INTO `yardcfsratemaster` VALUES (1,3,5,5,50,4,1,0,NULL,'2020-08-02 13:47:17',NULL,3),(1,3,5,6,100,4,1,0,NULL,'2020-08-02 13:47:30',NULL,4),(1,3,5,7,150,4,1,0,NULL,'2020-08-02 13:47:46',NULL,5),(1,3,5,8,200,4,1,0,NULL,'2020-08-02 13:48:02',NULL,6),(1,3,6,10,500,4,1,0,NULL,'2020-08-02 13:48:15',NULL,7),(1,3,6,11,1000,4,1,0,NULL,'2020-08-02 13:48:29',NULL,8),(1,3,6,12,1500,4,1,0,NULL,'2020-08-02 13:48:47',NULL,9),(1,3,6,13,2000,4,1,0,NULL,'2020-08-02 13:49:00',NULL,10),(1,3,7,14,5000,4,1,0,NULL,'2020-08-02 13:49:16',NULL,11),(1,3,7,15,10000,4,1,0,NULL,'2020-08-02 13:49:32',NULL,12),(1,3,7,16,15000,4,1,0,NULL,'2020-08-02 13:49:45',NULL,13),(1,3,7,17,20000,4,1,0,NULL,'2020-08-02 13:49:59',NULL,14);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardmaster`
--

LOCK TABLES `yardmaster` WRITE;
/*!40000 ALTER TABLE `yardmaster` DISABLE KEYS */;
INSERT INTO `yardmaster` VALUES (3,4,'fgdfg','411045','2312','23213','Yard Aug 2',1,1,1,'2020-08-02 13:37:42','2020-08-02 13:37:42','fdgfdg','2133',1,1,'Bhushan','9886631264');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 12:15:48
