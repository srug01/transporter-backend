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
  `bidName` varchar(512) DEFAULT NULL,
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
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,'BID00000001',90,NULL,1,1,14,'2020-08-08 00:00:00',0,0,NULL,72,NULL,'BID_ASSIGNED',2),(2,'BID00000002',180,NULL,2,1,14,'2020-08-08 00:00:00',0,0,NULL,144,NULL,'BID_ASSIGNED',2),(3,'BID00000003',180,NULL,3,1,14,'2020-08-08 00:00:00',0,0,NULL,144,NULL,'BID_PENDING',1);
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
INSERT INTO `bidschedulemaster` VALUES (1,2,6,1,0,1,20,_binary '',NULL,NULL),(2,6,12,3,0,1,20,_binary '',NULL,NULL),(3,12,24,8,0,1,20,_binary '',NULL,NULL),(4,24,48,6,8,1,20,_binary '',NULL,NULL),(5,48,96,12,8,1,20,_binary '',28,0),(6,96,144,24,8,1,20,_binary '',72,1),(7,144,360,42,8,1,20,_binary '',122,0);
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
  `bidName` varchar(512) DEFAULT NULL,
  `bidValue` int DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `bidLowerLimit` varchar(512) DEFAULT NULL,
  `SourceName` varchar(512) DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `containerMasterName` varchar(512) DEFAULT NULL,
  `weightDesc` varchar(512) DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `originalRate` int DEFAULT NULL,
  `biduserStatus` varchar(512) DEFAULT NULL,
  `biduserStatusId` int DEFAULT NULL,
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
INSERT INTO `bidusermapping` VALUES (1,1,10,'BID00000001',75,'2020-08-08 14:47:41',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_CONFIRMED',5),(2,2,10,'BID00000002',169,'2020-08-08 14:48:02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_DISCARD',22),(3,1,11,'BID00000001',75,'2020-08-08 14:49:04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_DISCARD',22),(4,2,11,'BID00000002',165,'2020-08-08 14:49:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_CONFIRMED',5),(5,1,12,'BID00000001',80,'2020-08-08 14:49:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_DISCARD',22),(6,2,12,'BID00000002',170,'2020-08-08 14:49:50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BID_USER_DISCARD',22);
/*!40000 ALTER TABLE `bidusermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsmaster`
--

DROP TABLE IF EXISTS `cfsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsmaster` (
  `address1` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `pan` varchar(512) DEFAULT NULL,
  `tan` varchar(512) DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `cfsMasterId` int NOT NULL AUTO_INCREMENT,
  `cfsName` varchar(512) DEFAULT NULL,
  `contactNumber` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `cfsCodeNumber` varchar(512) DEFAULT NULL,
  `gstin` varchar(512) DEFAULT NULL,
  `primaryContactName` varchar(512) DEFAULT NULL,
  `primaryContactNumber` varchar(512) DEFAULT NULL,
  `additionalContactName` varchar(512) DEFAULT NULL,
  `additionalContactNumber` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
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
INSERT INTO `cfsmaster` VALUES ('add1','4001254','55226225','552323255',4,1,'CFS 01','554775','cfs@new.in','CFS01','22566232','ABC Contact','1224558','Additional contact','552655',1,'2020-07-31 11:12:56',1,'2020-07-31 11:12:56',1,'add2','landmark',1,1,'55653','564654');
/*!40000 ALTER TABLE `cfsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsratemaster`
--

DROP TABLE IF EXISTS `cfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsratemaster` (
  `cfsRateId` int NOT NULL AUTO_INCREMENT,
  `cfsMasterId` int DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  PRIMARY KEY (`cfsRateId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsratemaster`
--

LOCK TABLES `cfsratemaster` WRITE;
/*!40000 ALTER TABLE `cfsratemaster` DISABLE KEYS */;
INSERT INTO `cfsratemaster` VALUES (1,1,4,1,100,1,1,'2020-07-31 11:13:25',1,'2020-07-31 11:13:25',4),(2,1,4,2,200,1,1,'2020-07-31 11:13:45',1,'2020-07-31 11:13:45',5);
/*!40000 ALTER TABLE `cfsratemaster` ENABLE KEYS */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `container` (
  `containerId` int NOT NULL AUTO_INCREMENT,
  `orderId` int DEFAULT NULL,
  `weightType` int DEFAULT NULL,
  `numberOfTrucks` int DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,1,1,0,1,'2020-08-08 09:12:46',1,'2020-08-08 09:12:46',4),(2,2,2,2,0,1,'2020-08-08 09:15:07',1,'2020-08-08 09:15:07',5);
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
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`containerMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containermaster`
--

LOCK TABLES `containermaster` WRITE;
/*!40000 ALTER TABLE `containermaster` DISABLE KEYS */;
INSERT INTO `containermaster` VALUES (4,'10FT',1,1,'2020-07-17 19:45:11',1,'2020-07-17 19:45:11'),(5,'20FT',1,1,'2020-07-17 19:45:24',1,'2020-07-17 19:45:24');
/*!40000 ALTER TABLE `containermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieselratemaster`
--

DROP TABLE IF EXISTS `dieselratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieselratemaster` (
  `dieselRate` int DEFAULT NULL,
  `dieselRateDate` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driverId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(512) DEFAULT NULL,
  `lastname` varchar(512) DEFAULT NULL,
  `emailId` varchar(512) DEFAULT NULL,
  `mobileNumber` varchar(512) NOT NULL,
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
  `userPassword` varchar(512) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`driverId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'driver','123','utsav@ghh.kk','447889552',1,1,'445578','add123','add2','landmark',1,1,'998875499',1,'2020-08-01 08:23:23',1,'2020-08-01 08:23:23',NULL,NULL),(2,'abc','def','aabb@ddee.ij','889745',1,1,'5858856','add1','add2','aaa',1,1,'asdsd',1,'2020-08-01 14:40:52',NULL,NULL,'123456789',NULL),(3,'abc','def','driver@trans.in','889745',1,1,'5858856','add1','add2','aaa',1,1,'asdsd',1,'2020-08-01 14:40:52',NULL,NULL,'123456789',NULL),(4,'awe','asd','sdgh@sjkdfdfh.kl','545456',1,1,'11212','dkfn','lnxkvcb','zkvb',1,1,'56456',1,'2020-08-01 15:03:17',1,'2020-08-01 15:03:17','123456789',NULL),(5,'My New','Driver','driver@trans11.in','5522885',1,1,'44145','add1','add2','landmark',1,1,'22554',11,'2020-08-01 22:15:01',11,'2020-08-01 22:15:01','123456789',19);
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
INSERT INTO `drivertransportermapping` VALUES (1,16,10,1,'2020-08-01 14:40:52',NULL,NULL),(2,18,11,1,'2020-08-01 15:03:17',NULL,NULL),(3,19,11,11,'2020-08-01 22:15:01',NULL,NULL);
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
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
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
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `bidId` int DEFAULT NULL,
  `assignedToRole` int DEFAULT NULL,
  `assignedToUser` int DEFAULT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS Admin User CFS Admin User placed a new Order on 2020-07-19!',1,9,'2020-07-19 11:56:13',0,NULL,1,NULL),(2,'orders','Transporter Trans confirmed a bid on 2020-07-19!',1,10,'2020-07-19 11:58:46',0,NULL,1,NULL),(3,'orders','CFS Admin User CFS Admin User placed a new Order on 2020-07-26!',1,9,'2020-07-25 19:18:40',0,NULL,1,NULL),(4,'orders','Transporter Trans confirmed a bid on 2020-07-26!',1,10,'2020-07-25 19:33:24',0,NULL,1,NULL),(5,'orders','Transporter Trans confirmed a bid on 2020-07-26!',1,10,'2020-07-25 19:33:27',0,NULL,1,NULL),(6,'orders','Trans Trans confirmed a bid on 2020-07-26!',1,12,'2020-07-25 19:38:52',0,NULL,1,NULL),(7,'orders','Trans Trans confirmed a bid on 2020-07-26!',1,12,'2020-07-25 19:38:54',0,NULL,1,NULL),(8,'orders','CFS Admin User CFS Admin User placed a new Order on 2020-07-30!',4,9,'2020-07-30 09:06:09',0,NULL,1,NULL),(9,'orders','CFS User CFS User placed a new Order on 2020-07-31!',1,14,'2020-07-31 11:21:41',0,NULL,1,NULL),(10,'orders','CFS User CFS User placed a new Order on 2020-07-31!',3,14,'2020-07-31 11:28:03',0,NULL,1,NULL),(11,'orders','CFS User CFS User placed a new Order on 2020-07-31!',4,14,'2020-07-31 11:33:04',0,NULL,1,NULL),(12,'orders','CFS User CFS User placed a new Order on 2020-07-31!',5,14,'2020-07-31 11:36:23',0,NULL,1,NULL),(13,'orders','Transporter Trans confirmed a bid on 2020-08-02!',1,10,'2020-08-01 19:30:31',0,NULL,1,NULL),(14,'orders','CFS User CFS User placed a new Order on 2020-08-02!',6,14,'2020-08-01 20:41:42',0,NULL,1,NULL),(15,'orders','Transporter Trans confirmed a bid on 2020-08-02!',1,11,'2020-08-01 20:55:45',0,NULL,1,NULL),(16,'orders','CFS User CFS User placed a new Order on 2020-08-07!',1,14,'2020-08-07 17:16:57',0,NULL,1,NULL),(17,'orders','Transporter Trans confirmed a bid on 2020-08-07!',1,10,'2020-08-07 17:23:05',0,NULL,1,NULL),(18,'orders','Transporter Trans confirmed a bid on 2020-08-07!',1,11,'2020-08-07 17:29:59',0,NULL,1,NULL),(19,'orders','Trans Trans confirmed a bid on 2020-08-07!',1,12,'2020-08-07 17:31:03',0,NULL,1,NULL),(20,'orders','Trans Trans confirmed a bid on 2020-08-07!',1,12,'2020-08-07 18:19:35',0,NULL,1,NULL),(21,'orders','CFS User CFS User placed a new Order on 2020-08-08!',2,14,'2020-08-07 20:59:46',0,NULL,1,NULL),(22,'orders','CFS User CFS User placed a new Order on 2020-08-08!',3,14,'2020-08-07 21:01:48',0,NULL,1,NULL),(23,'orders','CFS User CFS User placed a new Order on 2020-08-08!',4,14,'2020-08-07 21:19:31',0,NULL,1,NULL),(24,'orders','CFS User CFS User placed a new Order on 2020-08-08!',9,14,'2020-08-07 21:33:09',0,NULL,1,NULL),(25,'orders','CFS User CFS User placed a new Order on 2020-08-08!',1,14,'2020-08-08 09:12:47',0,NULL,1,NULL),(26,'orders','CFS User CFS User placed a new Order on 2020-08-08!',2,14,'2020-08-08 09:15:07',0,NULL,1,NULL),(27,'orders','Transporter Trans confirmed a bid on 2020-08-08!',1,10,'2020-08-08 09:17:42',0,NULL,1,NULL),(28,'orders','Transporter Trans confirmed a bid on 2020-08-08!',1,10,'2020-08-08 09:18:02',0,NULL,1,NULL),(29,'orders','Transporter Trans confirmed a bid on 2020-08-08!',1,11,'2020-08-08 09:19:04',0,NULL,1,NULL),(30,'orders','Transporter Trans confirmed a bid on 2020-08-08!',1,11,'2020-08-08 09:19:13',0,NULL,1,NULL),(31,'orders','Trans Trans confirmed a bid on 2020-08-08!',1,12,'2020-08-08 09:19:45',0,NULL,1,NULL),(32,'orders','Trans Trans confirmed a bid on 2020-08-08!',1,12,'2020-08-08 09:19:50',0,NULL,1,NULL);
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
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `totalRate` int DEFAULT NULL,
  `profitRate` int DEFAULT NULL,
  `profitMarginPercentage` int DEFAULT NULL,
  `orderTypeId` int DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `masterTypeId` int DEFAULT NULL,
  `sourceType` varchar(512) DEFAULT NULL,
  `destinationType` varchar(512) DEFAULT NULL,
  `orderRemarks` varchar(512) DEFAULT NULL,
  `orderAddress` varchar(512) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `rateExcludingProfit` int DEFAULT NULL,
  `portTerminalId` int DEFAULT NULL,
  `timeslotMasterId` int DEFAULT NULL,
  `orderStatus` varchar(512) DEFAULT NULL,
  `orderStatusId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,2,100,10,10,NULL,'2020-08-08 19:00:00',1,'CFS','YARD','sd','',0,0,14,'2020-08-08 14:42:46',14,'2020-08-08 09:12:46',90,1,20,'ORDER_ACCEPTED',6),(2,1,4,400,40,10,NULL,'2020-08-12 14:00:00',2,'CFS','PORT','12 AUG 2 PM - 3 PM','',0,0,14,'2020-08-08 14:45:06',14,'2020-08-08 09:15:07',360,1,15,'ORDER_ACCEPTED',6);
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
INSERT INTO `permission` VALUES (1,'dashboardFull',NULL,NULL,NULL,NULL,1),(2,'dashboardRead',NULL,NULL,NULL,NULL,1),(3,'dashboardWrite',NULL,NULL,NULL,NULL,1),(4,'cfsFull',NULL,NULL,NULL,NULL,1),(5,'cfsRead',NULL,NULL,NULL,NULL,1),(6,'cfsWrite',NULL,NULL,NULL,NULL,1),(7,'createOrderFull',NULL,NULL,NULL,NULL,1),(8,'createOrderRead',NULL,NULL,NULL,NULL,1),(9,'createOrderWrite',NULL,NULL,NULL,NULL,1),(10,'listOrderFull',NULL,NULL,NULL,NULL,1),(11,'listOrderRead',NULL,NULL,NULL,NULL,1),(12,'listOrderWrite',NULL,NULL,NULL,NULL,1),(13,'userRegistrationFull',NULL,NULL,NULL,NULL,1),(14,'userRegistrationRead',NULL,NULL,NULL,NULL,1),(15,'userRegistrationWrite',NULL,NULL,NULL,NULL,1),(16,'userListFull',NULL,NULL,NULL,NULL,1),(17,'userListRead',NULL,NULL,NULL,NULL,1),(18,'userListWrite',NULL,NULL,NULL,NULL,1),(19,'tranporterFull',NULL,NULL,NULL,NULL,1),(20,'tranporterRead',NULL,NULL,NULL,NULL,1),(21,'tranporterWrite',NULL,NULL,NULL,NULL,1),(22,'bidsFull',NULL,NULL,NULL,NULL,1),(23,'bidsRead',NULL,NULL,NULL,NULL,1),(24,'bidsWrite',NULL,NULL,NULL,NULL,1),(25,'vehicleRegistrationFull',NULL,NULL,NULL,NULL,1),(26,'vehicleRegistrationRead',NULL,NULL,NULL,NULL,1),(27,'vehicleRegistrationWrite',NULL,NULL,NULL,NULL,1),(28,'vehicleListFull',NULL,NULL,NULL,NULL,1),(29,'vehicleListRead',NULL,NULL,NULL,NULL,1),(30,'vehicleListWrite',NULL,NULL,NULL,NULL,1),(31,'tranporterRegistrationFull',NULL,NULL,NULL,NULL,1),(32,'tranporterRegistrationRead',NULL,NULL,NULL,NULL,1),(33,'tranporterRegistrationWrite',NULL,NULL,NULL,NULL,1),(34,'tranporterListFull',NULL,NULL,NULL,NULL,1),(35,'tranporterListRead',NULL,NULL,NULL,NULL,1),(36,'tranporterListWrite',NULL,NULL,NULL,NULL,1),(37,'driverRegistrationFull',NULL,NULL,NULL,NULL,1),(38,'driverRegistrationRead',NULL,NULL,NULL,NULL,1),(39,'driverRegistrationWrite',NULL,NULL,NULL,NULL,1),(40,'mastersFull',NULL,NULL,NULL,NULL,1),(41,'mastersRead',NULL,NULL,NULL,NULL,1),(42,'mastersWrite',NULL,NULL,NULL,NULL,1),(43,'cfsMasterFull',NULL,NULL,NULL,NULL,1),(44,'cfsMasterRead',NULL,NULL,NULL,NULL,1),(45,'cfsMasterWrite',NULL,NULL,NULL,NULL,1),(46,'containerMasterFull',NULL,NULL,NULL,NULL,1),(47,'containerMasterRead',NULL,NULL,NULL,NULL,1),(48,'containerMasterWrite',NULL,NULL,NULL,NULL,1),(49,'cfsRateMasterFull',NULL,NULL,NULL,NULL,1),(50,'cfsRateMasterRead',NULL,NULL,NULL,NULL,1),(51,'cfsRateMasterWrite',NULL,NULL,NULL,NULL,1),(52,'dieselMasterFull',NULL,NULL,NULL,NULL,1),(53,'dieselMasterRead',NULL,NULL,NULL,NULL,1),(54,'dieselMasterWrite',NULL,NULL,NULL,NULL,1),(55,'locationMasterFull',NULL,NULL,NULL,NULL,1),(56,'locationMasterRead',NULL,NULL,NULL,NULL,1),(57,'locationMasterWrite',NULL,NULL,NULL,NULL,1),(58,'mileageMasterFull',NULL,NULL,NULL,NULL,1),(59,'mileageMasterWrite',NULL,NULL,NULL,NULL,1),(60,'mileageMasterRead',NULL,NULL,NULL,NULL,1),(61,'portMasterFull',NULL,NULL,NULL,NULL,1),(62,'portMasterRead',NULL,NULL,NULL,NULL,1),(63,'portMasterWrite',NULL,NULL,NULL,NULL,1),(64,'portTerminalMasterFull',NULL,NULL,NULL,NULL,1),(65,'portTerminalMasterRead',NULL,NULL,NULL,NULL,1),(66,'portTerminalMasterWrite',NULL,NULL,NULL,NULL,1),(67,'stateMasterFull',NULL,NULL,NULL,NULL,1),(68,'stateMasterRead',NULL,NULL,NULL,NULL,1),(69,'stateMasterWrite',NULL,NULL,NULL,NULL,1),(70,'weightMasterFull',NULL,NULL,NULL,NULL,1),(71,'weightMasterRead',NULL,NULL,NULL,NULL,1),(72,'weightMasterWrite',NULL,NULL,NULL,NULL,1),(73,'yardMasterFull',NULL,NULL,NULL,NULL,1),(74,'yardMasterRead',NULL,NULL,NULL,NULL,1),(75,'yardMasterWrite',NULL,NULL,NULL,NULL,1),(76,'yardCFSRateMasterFull',NULL,NULL,NULL,NULL,1),(77,'yardCFSRateMasterRead',NULL,NULL,NULL,NULL,1),(78,'yardCFSRateMasterWrite',NULL,NULL,NULL,NULL,1),(79,'zoneMasterFull',NULL,NULL,NULL,NULL,1),(80,'zoneMasterRead',NULL,NULL,NULL,NULL,1),(81,'zoneMasterWrite',NULL,NULL,NULL,NULL,1),(82,'zoneDayMasterFull',NULL,NULL,NULL,NULL,1),(83,'zoneDayMasterRead',NULL,NULL,NULL,NULL,1),(84,'zoneDayMasterWrite',NULL,NULL,NULL,NULL,1);
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portmaster` (
  `portMasterId` int NOT NULL AUTO_INCREMENT,
  `stateMasterId` int DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `portName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `primarycontactperson` varchar(512) DEFAULT NULL,
  `primarycontactnumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`portMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (4,1,'564654','65454','JNPT',1,1,'2020-07-27 20:40:57',1,'2020-07-27 20:40:57',1,'add1','add2','land','41155',NULL,NULL),(5,1,'554564','564654','New Port Field',1,1,'2020-07-27 21:29:49',1,'2020-07-27 21:29:49',1,'Add1','Add2','Land','444778','Name','Number');
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
  `terminal` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`portTerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
INSERT INTO `portterminalmaster` VALUES (1,'Terminal1','8655655',NULL,'44554',NULL,NULL,4,1,NULL);
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
INSERT INTO `settings` VALUES (1,'cfs_order_profit','10',1),(2,'bid_lower_limit','20',1);
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
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statusdetails`
--

LOCK TABLES `statusdetails` WRITE;
/*!40000 ALTER TABLE `statusdetails` DISABLE KEYS */;
INSERT INTO `statusdetails` VALUES (1,1,'BID_PENDING',1,1,'2020-08-06 00:00:00',NULL,NULL),(2,1,'BID_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(3,1,'BID_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(4,2,'BID_USER_EDIT',1,1,'2020-08-06 00:00:00',NULL,NULL),(5,2,'BID_USER_CONFIRMED',1,1,'2020-08-06 00:00:00',NULL,NULL),(6,3,'ORDER_ACCEPTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(7,3,'ORDER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(8,3,'ORDER_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(9,3,'ORDER_RECEIVED',1,1,'2020-08-06 00:00:00',NULL,NULL),(10,3,'ORDER_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(11,4,'SUB_ORDER_PENDING',1,1,'2020-08-06 00:00:00',NULL,NULL),(12,4,'SUB_ORDER_BID_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(13,4,'SUB_ORDER_TRIP_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(14,4,'SUB_ORDER_TRIP_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(15,4,'SUB_ORDER_COMPLETED',1,1,'2020-08-06 00:00:00',NULL,NULL),(16,5,'TRIP_TRANSPORTER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(17,5,'TRIP_DRIVER_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(18,5,'TRIP_VEHICLE_ASSIGNED',1,1,'2020-08-06 00:00:00',NULL,NULL),(19,5,'TRIP_STARTED',1,1,'2020-08-06 00:00:00',NULL,NULL),(20,5,'TRIP_COMPLETED',1,1,'2020-08-07 00:00:00',NULL,NULL),(21,5,'TRIP_DRIVER_VEHICLE_ASSIGNED',1,1,'2020-08-07 00:00:00',NULL,NULL),(22,2,'BID_USER_DISCARD',1,1,'2020-08-07 00:00:00',NULL,NULL);
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
  `BidScheduleId` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `CutOffTime` datetime DEFAULT NULL,
  `suborderStatus` varchar(512) DEFAULT NULL,
  `suborderStatusId` int DEFAULT NULL,
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
INSERT INTO `suborder` VALUES (1,1,90,0,14,'2020-08-08 00:00:00',0,NULL,1,'4',1,90,10,1,NULL,'2020-08-08 15:00:00','SUB_ORDER_BID_ASSIGNED',12),(2,2,180,0,14,'2020-08-08 00:00:00',0,NULL,2,'5',2,180,10,5,NULL,'2020-08-08 15:00:00','SUB_ORDER_BID_ASSIGNED',12),(3,2,180,0,14,'2020-08-08 00:00:00',0,NULL,2,'5',2,180,10,5,NULL,'2020-08-08 15:00:00','SUB_ORDER_PENDING',11);
/*!40000 ALTER TABLE `suborder` ENABLE KEYS */;
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
INSERT INTO `timeslotmaster` VALUES (1,'12','01','12 AM - 1 AM',1,'2020-08-03 00:00:00',NULL,NULL),(2,'01','02','1 AM - 2 AM',1,'2020-08-03 00:00:00',NULL,NULL),(3,'02','03','2 AM - 3 AM',1,'2020-08-03 00:00:00',NULL,NULL),(4,'03','04','3 AM - 4 AM',1,'2020-08-03 00:00:00',NULL,NULL),(5,'04','05','4 AM - 5 AM',1,'2020-08-03 00:00:00',NULL,NULL),(6,'05','06','5 AM - 6 AM',1,'2020-08-03 00:00:00',NULL,NULL),(7,'06','07','6 AM - 7 AM',1,'2020-08-03 00:00:00',NULL,NULL),(8,'07','08','7 AM - 8 AM',1,'2020-08-03 00:00:00',NULL,NULL),(9,'08','09','8 AM - 9 AM',1,'2020-08-03 00:00:00',NULL,NULL),(10,'09','10','9 AM - 10 AM',1,'2020-08-03 00:00:00',NULL,NULL),(11,'10','11','10 AM- 11 AM',1,'2020-08-03 00:00:00',NULL,NULL),(12,'11','12','11 AM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL),(13,'12','13','12 PM - 13 PM',1,'2020-08-03 00:00:00',NULL,NULL),(14,'13','14','13 PM - 14 PM',1,'2020-08-03 00:00:00',NULL,NULL),(15,'14','15','14 PM - 15 PM',1,'2020-08-03 00:00:00',NULL,NULL),(16,'15','16','15 PM - 16 PM',1,'2020-08-03 00:00:00',NULL,NULL),(17,'16','17','16 PM - 17 PM',1,'2020-08-03 00:00:00',NULL,NULL),(18,'17','18','17 PM - 18 PM',1,'2020-08-03 00:00:00',NULL,NULL),(19,'18','19','18 PM - 19 PM',1,'2020-08-03 00:00:00',NULL,NULL),(20,'19','20','19 PM - 20 PM',1,'2020-08-03 00:00:00',NULL,NULL),(21,'20','21','20 PM - 21 PM',1,'2020-08-03 00:00:00',NULL,NULL),(22,'21','22','21 PM - 22 PM',1,'2020-08-03 00:00:00',NULL,NULL),(23,'22','23','22 PM - 23 PM',1,'2020-08-03 00:00:00',NULL,NULL),(24,'23','12','23 PM - 12 AM',1,'2020-08-03 00:00:00',NULL,NULL);
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `tripId` int NOT NULL AUTO_INCREMENT,
  `subOrderId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `assignedVehicle` int DEFAULT NULL,
  `assignedDriver` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `billedAmount` int DEFAULT NULL,
  `BidValue` int DEFAULT NULL,
  `destinationName` varchar(512) DEFAULT NULL,
  `sourceName` varchar(512) DEFAULT NULL,
  `vehicleNumber` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `tripstatus` varchar(512) DEFAULT NULL,
  `tripStatusId` int DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (2,1,1,2,NULL,NULL,10,'2020-08-08 15:13:32',NULL,NULL,NULL,NULL,NULL,75,NULL,NULL,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16),(3,2,1,4,NULL,NULL,11,'2020-08-08 15:13:32',NULL,NULL,NULL,NULL,NULL,165,NULL,NULL,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16);
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

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truckId` int NOT NULL AUTO_INCREMENT,
  `containerId` int DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `truckNumber` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,0,1,'2020-08-08 09:12:46',1,'2020-08-08 09:12:46','1234'),(2,2,0,1,'2020-08-08 09:15:07',1,'2020-08-08 09:15:07','1234'),(3,2,0,1,'2020-08-08 09:15:07',1,'2020-08-08 09:15:07','5678');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$x7WtqVjuBztMPppzAI45BO59VoFVRxaEvxt6qwtBUKXkAzoeZ4WCW','Utsav','P','90047889',1,'[\"AccessAuthFeature\"]'),(10,'transporter@trans.in','$2a$10$J/b4PVqTemUGNjvG2/6dCuNLIsPio.GPS4PMj56ccqapBlRri8NvG','Transporter','Trans','66554788',5,'[\"AccessAuthFeature\"]'),(11,'transporter2@trans.in','$2a$10$YghB1iQi/ksfRTdxHWLDIeAhVaDS.6yTDTtWDstfGDeiquoUnQ3Au','Transporter','Trans','5544789',5,'[\"AccessAuthFeature\"]'),(12,'trans2@trans.in','$2a$10$Isyd2KjXh5eBtUbRoT0B9.OUauNx6KqpiEDvKKlxe40slidJhidqm','Trans','Trans','445577889',5,'[\"AccessAuthFeature\"]'),(14,'cfs@admin.in','$2a$10$r0saHaMwcXkzDoFSqV19/u2OMSx4jJxjxa8pSCbFFekptSSwrjiPW','CFS User','CFS User','90045789',4,'[\"AccessAuthFeature\"]'),(15,'aabb@ddee.ij','$2a$10$Vc8VAd/pX8moufIjYjbIBuaxGHLoS143LhG7Eyy99HtSL30qHn1Tm','abc','def','889745',6,'[\"AccessAuthFeature\"]'),(16,'driver@trans.in','$2a$10$m7bN7/pPdRSkFOo6Gh/GdemLu9x2aUrBnH31q3xQg80b/wKOYyqA.','abc','def','889745',6,'[\"AccessAuthFeature\"]'),(17,'sdgh@sjkdfh.kl','$2a$10$l19BIEuG4coKmf/wDFsDGOS1SEbmklAmkfOPkq7vumhpxSxQPbJMa','awe','asd','545456',6,'[\"AccessAuthFeature\"]'),(18,'sdgh@sjkdfdfh.kl','$2a$10$fu9eab2N6SOegkVC41T8a.jMBLTbHINYcvYfBvtxirWMusA7llKeK','awe','asd','545456',6,'[\"AccessAuthFeature\"]'),(19,'driver@trans11.in','$2a$10$Xfz2EZsVaw5xfFCqPKCSGeyOkqs.cNEhJvrq/0LHuf74HWZskKPqC','My New','Driver','5522885',6,'[\"AccessAuthFeature\"]');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `parentRoleId` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
INSERT INTO `vehiclemaster` VALUES (2,'MH-01-123455',5,2,500,'2019',1,1,1,1,'2020-07-30 22:04:54',1,'2020-07-30 22:04:54'),(3,'MH-01-9999',4,1,100,'2009',1,1,1,1,'2020-07-31 10:44:09',1,'2020-07-31 10:44:09'),(4,'MH-01-9123',4,1,200,'2020',1,1,1,1,'2020-07-31 10:47:11',1,'2020-07-31 10:47:11');
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
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
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
INSERT INTO `vehicletransportermapping` VALUES (1,11,4,1,'2020-07-31 10:47:11',NULL,NULL),(2,10,3,10,'2020-08-02 00:00:00',NULL,NULL);
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
  `containerMasterId` int DEFAULT NULL,
  `weightDesc` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`weightMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
INSERT INTO `weightmaster` VALUES (1,4,'10 Ton',1,1,'2020-07-17 19:48:11',1,'2020-07-17 19:48:11'),(2,5,'20 Ton',1,1,'2020-07-29 19:46:51',1,'2020-07-29 19:46:51');
/*!40000 ALTER TABLE `weightmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardcfsratemaster`
--

DROP TABLE IF EXISTS `yardcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardcfsratemaster` (
  `cfsMasterId` int DEFAULT NULL,
  `yardMasterId` int DEFAULT NULL,
  `containerMasterId` int DEFAULT NULL,
  `weightMasterId` int DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `yardCfsRateMasterId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`yardCfsRateMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardcfsratemaster`
--

LOCK TABLES `yardcfsratemaster` WRITE;
/*!40000 ALTER TABLE `yardcfsratemaster` DISABLE KEYS */;
INSERT INTO `yardcfsratemaster` VALUES (1,2,4,1,100,4,1,0,NULL,'2020-07-31 11:14:27',NULL,1),(1,2,5,2,200,4,1,0,NULL,'2020-07-31 11:14:43',NULL,2);
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
  `portMasterId` int DEFAULT NULL,
  `address1` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `latitude` varchar(512) DEFAULT NULL,
  `longitude` varchar(512) DEFAULT NULL,
  `yardName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `address2` varchar(512) DEFAULT NULL,
  `landmark` varchar(512) DEFAULT NULL,
  `locationMasterId` int DEFAULT NULL,
  `stateMasterId` int DEFAULT NULL,
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
INSERT INTO `yardmaster` VALUES (2,4,'Add1','41254','5654564','897685','Yard1',1,1,1,'2020-07-27 21:30:11','2020-07-27 21:30:11','Add2','Land',1,1,'Name','Number');
/*!40000 ALTER TABLE `yardmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedaymaster`
--

DROP TABLE IF EXISTS `zonedaymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonedaymaster` (
  `portId` int DEFAULT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `zoneName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonemaster` (
  `pincode` varchar(512) DEFAULT NULL,
  `zoneName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
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
				select DATE_ADD(StartDate, INTERVAL (hours - 10 + (18 - starthour )) hour) into CutOffTime;
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
t.assignedDriver,t.status,t.startDate,t.endDate,t.billedAmount,
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
    (select  IFNULL(bidValue,0) from transporter.bidusermapping where bidId = b.bidId and userId = user_Id 
    ) as bidValue
    ,b.originalRate
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    -- Inner Join transporter.bidusermapping bm on bm.userId = user_Id 
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=weightMasterId;
    -- Where bm.userId = user_Id;
    
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
    bm.bidValue,b.originalRate
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
    Left Outer Join transporter.containermaster com on sub.containerType= com.containerMasterId
    Left Outer Join transporter.weightmaster wem on containerWeightType=weightMasterId
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
t.assignedDriver,t.status,t.startDate,t.endDate,t.billedAmount,
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
	bd.bidStatusId = 2
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

-- Dump completed on 2020-08-08 16:12:37
