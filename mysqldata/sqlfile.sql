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
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,'BID00000001',450,NULL,1,1,1,'2020-07-26 00:00:00',0,0,NULL,360,NULL),(2,'BID00000002',450,NULL,2,1,1,'2020-07-26 00:00:00',0,0,NULL,360,NULL),(3,'BID00000003',NULL,NULL,3,1,1,'2020-07-30 00:00:00',0,0,NULL,NULL,NULL),(4,'BID00000004',NULL,NULL,4,1,1,'2020-07-30 00:00:00',0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
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
  `bidStatus` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`bidusermappingId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
INSERT INTO `bidusermapping` VALUES (1,1,10,'BID00000001',400,'confirmed'),(2,2,10,'BID00000002',410,'confirmed'),(3,1,12,'BID00000001',370,'confirmed'),(4,2,12,'BID00000002',390,'confirmed');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
INSERT INTO `cfsmaster` VALUES ('Address1','41147','PAN','TAN',4,3,'All Cargo CFS1','22455','alc@cfs.in','CFS01','GST','Primary Contact','4455789','Additional contact','447784',1,'2020-07-27 21:33:08',1,'2020-07-27 21:33:08',1,'Add2','Land',1,1,'44545','545454'),('Address','44147','PAN','TAN',4,4,'CFS2','5547789','utsav@gg.kk','CFS02','GST','Primary Contact','2244789','additional','554478',1,'2020-07-19 11:53:37',1,'2020-07-19 11:53:37',1,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsratemaster`
--

LOCK TABLES `cfsratemaster` WRITE;
/*!40000 ALTER TABLE `cfsratemaster` DISABLE KEYS */;
INSERT INTO `cfsratemaster` VALUES (8,3,4,1,200,1,1,'2020-07-29 19:46:22',1,'2020-07-29 19:46:22',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsuserregistration`
--

LOCK TABLES `cfsuserregistration` WRITE;
/*!40000 ALTER TABLE `cfsuserregistration` DISABLE KEYS */;
INSERT INTO `cfsuserregistration` VALUES (1,1,4,'First Name','Designation','department','5577889','user@email.in','123456789',4,1,1,1,'2020-07-04 18:41:40',NULL,NULL),(2,3,5,'CFS Master 3','Designation','Department','55447788','cfs@user2.com','123456789',5,1,1,1,'2020-07-05 12:29:34',NULL,NULL),(3,3,4,'CFS USER','Designation','Department','9004788445','cfs@master3.in','123456789',6,1,1,1,'2020-07-05 12:41:18',NULL,NULL),(4,1,6,'CFS ALL CARGO USER','TEST','TEST','9004944658','alc@cfs.in','123456789',0,1,1,1,'2020-07-16 20:10:16',1,'2020-07-16 20:10:16'),(5,1,6,'CFS ALL CARGO USER1','Designation','Department','5547899','alc@cfs.in','123456789',8,1,1,1,'2020-07-16 20:32:33',1,'2020-07-16 20:32:33'),(6,3,7,'CFS Admin User','Designation','Department','4477889','cfs@admin.in','123456789',9,1,1,1,'2020-07-19 11:48:16',1,'2020-07-19 11:48:16');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,1,2,0,1,'2020-07-25 19:18:40',1,'2020-07-25 19:18:40',4),(2,2,2,2,0,1,'2020-07-30 08:16:46',1,'2020-07-30 08:16:46',5),(3,3,2,2,0,1,'2020-07-30 09:02:19',1,'2020-07-30 09:02:19',5),(4,4,2,2,0,1,'2020-07-30 09:06:09',1,'2020-07-30 09:06:09',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS Admin User CFS Admin User placed a new Order on 2020-07-19!',1,9,'2020-07-19 11:56:13',0,NULL,1,NULL),(2,'orders','Transporter Trans confirmed a bid on 2020-07-19!',1,10,'2020-07-19 11:58:46',0,NULL,1,NULL),(3,'orders','CFS Admin User CFS Admin User placed a new Order on 2020-07-26!',1,9,'2020-07-25 19:18:40',0,NULL,1,NULL),(4,'orders','Transporter Trans confirmed a bid on 2020-07-26!',1,10,'2020-07-25 19:33:24',0,NULL,1,NULL),(5,'orders','Transporter Trans confirmed a bid on 2020-07-26!',1,10,'2020-07-25 19:33:27',0,NULL,1,NULL),(6,'orders','Trans Trans confirmed a bid on 2020-07-26!',1,12,'2020-07-25 19:38:52',0,NULL,1,NULL),(7,'orders','Trans Trans confirmed a bid on 2020-07-26!',1,12,'2020-07-25 19:38:54',0,NULL,1,NULL),(8,'orders','CFS Admin User CFS Admin User placed a new Order on 2020-07-30!',4,9,'2020-07-30 09:06:09',0,NULL,1,NULL);
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
  `status` varchar(512) DEFAULT NULL,
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
  `createdOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `rateExcludingProfit` int DEFAULT NULL,
  `portTerminalId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,4,3,'submitted',1000,100,10,NULL,'2020-07-25 18:30:00',4,'PORT','CFS','test','',0,0,1,'2020-07-25 19:18:40',1,'2020-07-25 19:18:40',900,NULL),(2,3,2,'submitted',0,0,0,NULL,'2020-07-29 18:30:00',1,'CFS','YARD','test','',0,0,1,'2020-07-30 08:16:46',1,'2020-07-30 08:16:46',0,1),(3,3,2,'submitted',0,0,0,NULL,'2020-07-29 18:30:00',1,'CFS','YARD','YARD Order','',0,0,1,'2020-07-30 09:02:19',1,'2020-07-30 09:02:19',0,1),(4,3,2,'submitted',2000,200,10,NULL,'2020-07-29 18:30:00',1,'CFS','YARD','CFS Yard Order ','',0,0,1,'2020-07-30 09:06:09',1,'2020-07-30 09:06:09',1800,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
  `CreatedOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `portMasterId` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`portTerminalId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
INSERT INTO `portterminalmaster` VALUES (1,'Terminal1','8655655',NULL,'44554',NULL,NULL,NULL,4,1);
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
  PRIMARY KEY (`subOrderId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
INSERT INTO `suborder` VALUES (1,1,450,0,1,'2020-07-26 00:00:00',0,NULL,1,'4',1,450,10),(2,1,450,0,1,'2020-07-26 00:00:00',0,NULL,1,'4',1,450,10),(3,4,NULL,0,1,'2020-07-30 00:00:00',0,NULL,4,'5',2,NULL,10),(4,4,NULL,0,1,'2020-07-30 00:00:00',0,NULL,4,'5',2,NULL,10);
/*!40000 ALTER TABLE `suborder` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,0,1,'2020-07-25 19:18:40',1,'2020-07-25 19:18:40','5678'),(2,1,0,1,'2020-07-25 19:18:40',1,'2020-07-25 19:18:40','1234'),(3,2,0,1,'2020-07-30 08:16:46',1,'2020-07-30 08:16:46','1234'),(4,2,0,1,'2020-07-30 08:16:46',1,'2020-07-30 08:16:46','5678'),(5,3,0,1,'2020-07-30 09:02:19',1,'2020-07-30 09:02:19','5678'),(6,3,0,1,'2020-07-30 09:02:19',1,'2020-07-30 09:02:19','1234'),(7,4,0,1,'2020-07-30 09:06:09',1,'2020-07-30 09:06:09','5678'),(8,4,0,1,'2020-07-30 09:06:09',1,'2020-07-30 09:06:09','1234');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$x7WtqVjuBztMPppzAI45BO59VoFVRxaEvxt6qwtBUKXkAzoeZ4WCW','Utsav','P','90047889',1,'[\"AccessAuthFeature\"]'),(9,'cfs@admin.in','$2a$10$C5ZiRJ8xR3Be3uG4eh8onehOLLlGVODTpBypZu6BfZRoNj0prASMS','CFS Admin User','CFS Admin User','4477889',7,'[\"AccessAuthFeature\"]'),(10,'transporter@trans.in','$2a$10$J/b4PVqTemUGNjvG2/6dCuNLIsPio.GPS4PMj56ccqapBlRri8NvG','Transporter','Trans','66554788',5,'[\"AccessAuthFeature\"]'),(11,'transporter2@trans.in','$2a$10$YghB1iQi/ksfRTdxHWLDIeAhVaDS.6yTDTtWDstfGDeiquoUnQ3Au','Transporter','Trans','5544789',5,'[\"AccessAuthFeature\"]'),(12,'trans2@trans.in','$2a$10$Isyd2KjXh5eBtUbRoT0B9.OUauNx6KqpiEDvKKlxe40slidJhidqm','Trans','Trans','445577889',5,'[\"AccessAuthFeature\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
INSERT INTO `vehiclemaster` VALUES (2,'MH-01-123455',5,2,500,'2019',1,1,1,1,'2020-07-30 22:04:54',1,'2020-07-30 22:04:54');
/*!40000 ALTER TABLE `vehiclemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletransportermapping`
--

DROP TABLE IF EXISTS `vehicletransportermapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletransportermapping` (
  `vehicletransportermappingId` int NOT NULL,
  `userId` int NOT NULL,
  `vehicleMasterId` int NOT NULL,
  `createdBy` int NOT NULL,
  `createdOn` datetime NOT NULL,
  `modifiedOn` datetime DEFAULT NULL,
  `modifiedBy` int DEFAULT NULL,
  PRIMARY KEY (`vehicletransportermappingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletransportermapping`
--

LOCK TABLES `vehicletransportermapping` WRITE;
/*!40000 ALTER TABLE `vehicletransportermapping` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardcfsratemaster`
--

LOCK TABLES `yardcfsratemaster` WRITE;
/*!40000 ALTER TABLE `yardcfsratemaster` DISABLE KEYS */;
INSERT INTO `yardcfsratemaster` VALUES (3,2,5,2,1000,4,1,0,NULL,'2020-07-29 19:54:05',NULL,2);
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
    (case When bm.userId = user_Id then bm.bidValue else 0 end  
    ) as bidValue
    ,b.originalRate
    from transporter.bid b
    Left Outer Join transporter.suborder sub on b.subOrderId = sub.subOrderId
    Left Outer Join transporter.order ord on sub.orderId = ord.orderId
    Left Outer Join transporter.bidusermapping bm on b.bidId = bm.bidId
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
/*!50003 DROP PROCEDURE IF EXISTS `postOrderProcessing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `postOrderProcessing`(in order_Id int)
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

Select masterTypeId,sourceId,destinationId 
into masterType,sourceID,destinationID
FROM transporter2.order where orderid = order_Id;

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

-- For Debug 
-- select concat('** ', msg) AS '** DEBUG:';
--
Select masterTypeId,sourceId,destinationId,createdBy 
into masterType,source_Id,destination_Id,created_by
FROM transporter.order where orderId = order_Id;

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
			and weightId = weight_type and containerMasterId = containerType);
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
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    -- Insert SubOrder
Insert into transporter.suborder(orderId,subOrderTotal,isDelete,createdBy,
createdOn,modifiedBy,modifiedOn,cotainerId,containerType,containerWeightType,
subOrderTotalMargin,marginPercent)
Select order_Id, (cr.rate - ((cr.rate * s.settingsValue) / 100)),
0,created_by,CURDATE(),
0,null,t.containerId,c.containerMasterId,
c.weightType,(cr.rate - ((cr.rate * s.settingsValue) / 100)),
s.settingsValue
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
		modifiedOn,bidLowerLimit)
		Select GetBidNumber(),sub.subOrderTotal,
		null,sub.subOrderId,1,created_by,CURDATE(),0,
		0,null,(sub.subOrderTotal - ((sub.subOrderTotal * bid_limit_percent) / 100))
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

-- Dump completed on 2020-07-31 12:26:24
