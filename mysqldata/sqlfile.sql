-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: transporter2
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
  `bidName` varchar(512) NOT NULL,
  `original_rate` int DEFAULT NULL,
  `exhibition_date` datetime DEFAULT NULL,
  `suborderId` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `bid_upper_limit` int DEFAULT NULL,
  `bid_lower_limit` int DEFAULT NULL,
  `bid_rate` int DEFAULT NULL,
  `margin_percent` int DEFAULT NULL,
  PRIMARY KEY (`bidId`),
  KEY `suborderId_idx` (`suborderId`),
  CONSTRAINT `suborderId` FOREIGN KEY (`suborderId`) REFERENCES `suborder` (`suborderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
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
  `bidName` varchar(512) NOT NULL,
  `bidValue` int NOT NULL,
  `bidStatus` varchar(512) NOT NULL,
  PRIMARY KEY (`bidusermappingId`),
  KEY `bidId_idx` (`bidId`),
  KEY `biduserId_idx` (`userId`),
  CONSTRAINT `bidId` FOREIGN KEY (`bidId`) REFERENCES `bid` (`bidId`),
  CONSTRAINT `biduserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidusermapping`
--

LOCK TABLES `bidusermapping` WRITE;
/*!40000 ALTER TABLE `bidusermapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `bidusermapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsmaster`
--

DROP TABLE IF EXISTS `cfsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsmaster` (
  `cfs_name` varchar(512) NOT NULL,
  `contact_no` varchar(512) NOT NULL,
  `email_id` varchar(512) NOT NULL,
  `address` varchar(512) DEFAULT NULL,
  `pincode` varchar(512) NOT NULL,
  `cfs_code_no` varchar(512) DEFAULT NULL,
  `gstn` varchar(512) DEFAULT NULL,
  `pan` varchar(512) DEFAULT NULL,
  `tan` varchar(512) DEFAULT NULL,
  `primary_contact_name` varchar(512) DEFAULT NULL,
  `primary_mobile_no` varchar(512) DEFAULT NULL,
  `additional_contact_name` varchar(512) DEFAULT NULL,
  `additional_mobile_no` varchar(512) DEFAULT NULL,
  `portId` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cfsMasterId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cfsMasterId`),
  KEY `portId_idx` (`portId`),
  CONSTRAINT `cfsportId` FOREIGN KEY (`portId`) REFERENCES `portmaster` (`portId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsratemaster`
--

DROP TABLE IF EXISTS `cfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsratemaster` (
  `cfs_rateId` int NOT NULL AUTO_INCREMENT,
  `cfsId` int NOT NULL,
  `portId` int NOT NULL,
  `weightId` int NOT NULL,
  `rate` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `containerId` int NOT NULL,
  PRIMARY KEY (`cfs_rateId`),
  KEY `cfsratecfsId_idx` (`cfsId`),
  KEY `cfsrateportId_idx` (`portId`),
  KEY `cfsratecontainerId_idx` (`containerId`),
  KEY `cfsrateweightId_idx` (`weightId`),
  CONSTRAINT `cfsratecfsId` FOREIGN KEY (`cfsId`) REFERENCES `cfsmaster` (`cfsMasterId`),
  CONSTRAINT `cfsratecontainerId` FOREIGN KEY (`containerId`) REFERENCES `containermaster` (`containerId`),
  CONSTRAINT `cfsrateportId` FOREIGN KEY (`portId`) REFERENCES `portmaster` (`portId`),
  CONSTRAINT `cfsrateweightId` FOREIGN KEY (`weightId`) REFERENCES `weightmaster` (`weightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsratemaster`
--

LOCK TABLES `cfsratemaster` WRITE;
/*!40000 ALTER TABLE `cfsratemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfsratemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsuserregistration`
--

DROP TABLE IF EXISTS `cfsuserregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsuserregistration` (
  `cfs_user_registrationId` int NOT NULL AUTO_INCREMENT,
  `cfsId` int NOT NULL,
  `user_typeId` int NOT NULL,
  `cfs_user_name` varchar(512) NOT NULL,
  `cfs_user_designation` varchar(512) DEFAULT NULL,
  `cfs_user_department` varchar(512) DEFAULT NULL,
  `cfs_user_mobile_no` varchar(512) NOT NULL,
  `cfs_user_email` varchar(512) DEFAULT NULL,
  `cfs_user_password` varchar(512) DEFAULT NULL,
  `cfs_user_confirm_password` varchar(512) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `cfs_user_is_active` tinyint(1) NOT NULL,
  `cfs_user_is_verify` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`cfs_user_registrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsuserregistration`
--

LOCK TABLES `cfsuserregistration` WRITE;
/*!40000 ALTER TABLE `cfsuserregistration` DISABLE KEYS */;
INSERT INTO `cfsuserregistration` VALUES (1,1,4,'First Name','Designation','department','5577889','user@email.in','123456789','123456789',4,1,1,1,'2020-07-04 18:41:40',NULL,NULL),(2,3,5,'CFS Master 3','Designation','Department','55447788','cfs@user2.com','123456789','123456789',5,1,1,1,'2020-07-05 12:29:34',NULL,NULL),(3,3,4,'CFS USER','Designation','Department','9004788445','cfs@master3.in','123456789','123456789',6,1,1,1,'2020-07-05 12:41:18',NULL,NULL);
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
  `container_type` int NOT NULL,
  `weight_type` int NOT NULL,
  `no_of_trucks` int NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,1,1,2,0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(2,1,2,2,3,0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(3,2,10,1,2,0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(4,2,10,2,1,0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(5,2,30,3,1,0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(6,3,10,1,2,0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(7,3,20,2,3,0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(8,3,30,3,1,0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(9,4,1,1,2,0,1,'2020-07-03 06:48:21',1,'2020-07-03 06:48:21'),(10,5,1,1,1,0,1,'2020-07-03 07:57:10',1,'2020-07-03 07:57:10'),(11,6,1,1,1,0,1,'2020-07-03 08:09:26',1,'2020-07-03 08:09:26'),(12,7,1,1,1,0,1,'2020-07-03 08:14:26',1,'2020-07-03 08:14:26'),(13,8,1,1,2,0,1,'2020-07-03 08:17:05',1,'2020-07-03 08:17:05'),(14,9,1,1,3,0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47'),(15,10,1,1,4,0,1,'2020-07-05 13:02:57',1,'2020-07-05 13:02:57');
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containermaster`
--

DROP TABLE IF EXISTS `containermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `containermaster` (
  `containerId` int NOT NULL AUTO_INCREMENT,
  `container_name` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`containerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `containermaster`
--

LOCK TABLES `containermaster` WRITE;
/*!40000 ALTER TABLE `containermaster` DISABLE KEYS */;
INSERT INTO `containermaster` VALUES (1,'10FT',1,1,'2020-06-28 18:31:46',NULL,NULL),(2,'20FT',1,1,'2020-06-28 18:32:01',NULL,NULL),(3,'40FT',1,1,'2020-06-28 18:32:12',NULL,NULL);
/*!40000 ALTER TABLE `containermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieselratemaster`
--

DROP TABLE IF EXISTS `dieselratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieselratemaster` (
  `diesel_rateId` int NOT NULL AUTO_INCREMENT,
  `diesel_rate` int NOT NULL,
  `date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`diesel_rateId`)
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
  `locationId` int NOT NULL AUTO_INCREMENT,
  `locationName` varchar(512) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationmaster`
--

LOCK TABLES `locationmaster` WRITE;
/*!40000 ALTER TABLE `locationmaster` DISABLE KEYS */;
INSERT INTO `locationmaster` VALUES (1,'Mumbai',1,1,'2020-06-26 20:39:22'),(2,'Diu',1,1,'2020-06-26 20:39:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mastertype`
--

LOCK TABLES `mastertype` WRITE;
/*!40000 ALTER TABLE `mastertype` DISABLE KEYS */;
INSERT INTO `mastertype` VALUES (1,'portTocfs','port','cfs');
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
  `containerId` int NOT NULL,
  `weightId` int NOT NULL,
  `mileage` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
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
  `orderId` int DEFAULT NULL,
  `createdBy` int DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `assignToRole` int DEFAULT NULL,
  `assignToUser` int DEFAULT NULL,
  PRIMARY KEY (`notificationId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS Customer placed a new Order on 2020-07-03!',4,2,'2020-07-03 06:48:24',0,1,NULL),(2,'orders','CFS Customer placed a new Order on 2020-07-03!',6,2,'2020-07-03 08:09:30',0,1,NULL),(3,'orders','CFS Customer placed a new Order on 2020-07-03!',7,2,'2020-07-03 08:14:28',0,1,NULL),(4,'orders','CFS Customer placed a new Order on 2020-07-03!',8,2,'2020-07-03 08:17:08',0,1,NULL),(5,'orders','CFS Customer placed a new Order on 2020-07-03!',9,2,'2020-07-03 08:18:49',0,1,NULL),(6,'orders','CFS USER CFS USER placed a new Order on 2020-07-05!',10,6,'2020-07-05 13:03:22',0,1,NULL),(7,'orders','CFS Master 3 CFS Master 3 confirmed a bid on 2020-07-05!',1,5,'2020-07-05 13:17:08',1,1,NULL);
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
  `order_typeId` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `master_typeId` int DEFAULT NULL,
  `sourceId` int DEFAULT NULL,
  `destinationId` int DEFAULT NULL,
  `destination_type` varchar(512) DEFAULT NULL,
  `source_type` varchar(512) DEFAULT NULL,
  `order_remarks` varchar(512) DEFAULT NULL,
  `order_address` varchar(512) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `status` varchar(512) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  `containers` text,
  `totalRate` int DEFAULT NULL,
  `profitRate` int DEFAULT NULL,
  `profitMarginPercentage` int DEFAULT NULL,
  `rateexcludingProfit` int DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `mastertype_idx` (`master_typeId`),
  CONSTRAINT `mastertype` FOREIGN KEY (`master_typeId`) REFERENCES `mastertype` (`masterTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2020-05-31 18:30:00',1,1,1,'cfs','port','Test Remarks','',0,NULL,'submitted',1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15',NULL,4000,400,10,3600),(2,1,'2020-06-26 18:30:00',1,2,1,'cfs','port','Test Remarks','',0,NULL,'submitted',6,'2020-06-26 21:33:11',6,'2020-06-26 21:33:11',NULL,NULL,NULL,NULL,NULL),(3,1,'2020-06-28 18:30:00',1,2,1,'cfs','port','Test Ordre Remarks','',0,NULL,'submitted',1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42',NULL,NULL,NULL,NULL,NULL),(4,1,'2020-07-02 18:30:00',1,2,1,'cfs','port','test','',0,NULL,'submitted',2,'2020-07-03 06:48:21',2,'2020-07-03 06:48:21',NULL,NULL,NULL,NULL,NULL),(5,1,'2020-07-02 18:30:00',1,1,1,'cfs','port','test','',0,NULL,'submitted',2,'2020-07-03 07:57:10',2,'2020-07-03 07:57:10',NULL,NULL,NULL,NULL,NULL),(6,1,'2020-07-02 18:30:00',1,1,1,'cfs','port','New Order','',0,NULL,'submitted',2,'2020-07-03 08:09:26',2,'2020-07-03 08:09:26',NULL,500,50,10,450),(7,1,'2020-07-02 18:30:00',1,2,1,'cfs','port','JNPT','',0,NULL,'submitted',2,'2020-07-03 08:14:26',2,'2020-07-03 08:14:26',NULL,NULL,NULL,10,NULL),(8,1,'2020-07-02 18:30:00',1,2,1,'cfs','port','Add','',0,NULL,'submitted',2,'2020-07-03 08:17:05',2,'2020-07-03 08:17:05',NULL,NULL,NULL,10,NULL),(9,1,'2020-07-02 18:30:00',1,1,1,'cfs','port','Working Order Example','',0,NULL,'submitted',2,'2020-07-03 08:18:47',2,'2020-07-03 08:18:47',NULL,1500,150,10,1350),(10,1,'2020-07-04 18:30:00',1,1,1,'cfs','port','New Order','',0,NULL,'submitted',6,'2020-07-05 13:02:57',6,'2020-07-05 13:02:57',NULL,2000,200,10,1800);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portmaster`
--

DROP TABLE IF EXISTS `portmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portmaster` (
  `portId` int NOT NULL AUTO_INCREMENT,
  `port_name` varchar(512) NOT NULL,
  `stateId` int NOT NULL,
  `location` varchar(500) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `latitude` varchar(145) DEFAULT NULL,
  `longitude` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`portId`),
  KEY `stateId_idx` (`stateId`),
  CONSTRAINT `stateId` FOREIGN KEY (`stateId`) REFERENCES `statemaster` (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (1,'Mumbai Port',1,'1',1,1,'2020-06-26 21:10:57',1,'2020-06-26 21:10:57',NULL,NULL),(2,'JNPT',2,'2',1,1,'2020-06-26 21:31:29',1,'2020-06-26 21:31:29',NULL,NULL);
/*!40000 ALTER TABLE `portmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portterminalmaster`
--

DROP TABLE IF EXISTS `portterminalmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portterminalmaster` (
  `portterminalId` int NOT NULL AUTO_INCREMENT,
  `portId` int NOT NULL,
  `terminal` varchar(45) NOT NULL,
  `latitude` varchar(145) DEFAULT NULL,
  `longitude` varchar(145) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`portterminalId`),
  KEY `portId_idx` (`portId`),
  CONSTRAINT `portId` FOREIGN KEY (`portId`) REFERENCES `portmaster` (`portId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portterminalmaster`
--

LOCK TABLES `portterminalmaster` WRITE;
/*!40000 ALTER TABLE `portterminalmaster` DISABLE KEYS */;
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
  `settings_name` varchar(512) NOT NULL,
  `settings_value` varchar(512) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`settingsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'cfs_order_profit','10',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statemaster`
--

DROP TABLE IF EXISTS `statemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statemaster` (
  `stateId` int NOT NULL AUTO_INCREMENT,
  `state` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemaster`
--

LOCK TABLES `statemaster` WRITE;
/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
INSERT INTO `statemaster` VALUES (1,'Maharashtra',1,1,'2020-06-26 21:10:09',1,'2020-06-26 21:10:09'),(2,'Gujarat',1,1,'2020-06-26 21:30:47',1,'2020-06-26 21:30:47');
/*!40000 ALTER TABLE `statemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suborder`
--

DROP TABLE IF EXISTS `suborder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suborder` (
  `suborderId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `subordertotal` decimal(10,2) DEFAULT NULL,
  `is_delete` tinyint DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `containerId` int NOT NULL,
  `container_type` int NOT NULL,
  `container_weight_type` int NOT NULL,
  `subordertotal_margin` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`suborderId`),
  KEY `orderId_idx` (`orderId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborder`
--

LOCK TABLES `suborder` WRITE;
/*!40000 ALTER TABLE `suborder` DISABLE KEYS */;
/*!40000 ALTER TABLE `suborder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporter2registration`
--

DROP TABLE IF EXISTS `transporter2registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporter2registration` (
  `transporter2Id` int NOT NULL AUTO_INCREMENT,
  `transporter2_name` varchar(512) DEFAULT NULL,
  `transporter2_mobile_no` varchar(512) NOT NULL,
  `transporter2_email` varchar(512) DEFAULT NULL,
  `transporter2_address` varchar(512) DEFAULT NULL,
  `transporter2_pincode` varchar(512) DEFAULT NULL,
  `transporter2_GSTIN` varchar(512) DEFAULT NULL,
  `transporter2_PAN` varchar(512) DEFAULT NULL,
  `transporter2_partner` varchar(512) DEFAULT NULL,
  `transporter2_partner_PAN` varchar(512) DEFAULT NULL,
  `transporter2_partner_address` varchar(512) DEFAULT NULL,
  `transporter2_bank_acno` varchar(512) DEFAULT NULL,
  `transporter2_ac_type` varchar(512) DEFAULT NULL,
  `transporter2_bank_name` varchar(512) DEFAULT NULL,
  `transporter2_bank_branch` varchar(512) DEFAULT NULL,
  `transporter2_bank_ifsc` varchar(512) DEFAULT NULL,
  `transporter2_address_file` varchar(512) DEFAULT NULL,
  `transporter2_gst_file` varchar(512) DEFAULT NULL,
  `transporter2_pan_card` varchar(512) DEFAULT NULL,
  `transporter2_permit_card` varchar(512) DEFAULT NULL,
  `transporter2_license_card` varchar(512) DEFAULT NULL,
  `transporter2_other_card` varchar(512) DEFAULT NULL,
  `transporter2_is_active` tinyint(1) NOT NULL,
  `transporter2_is_verify` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`transporter2Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporter2registration`
--

LOCK TABLES `transporter2registration` WRITE;
/*!40000 ALTER TABLE `transporter2registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `transporter2registration` ENABLE KEYS */;
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
  `truck_no` varchar(512) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,'5678',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(2,1,'1234',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(3,2,'1234',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(4,2,'5678',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(5,2,'1014',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(6,3,'1234',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(7,3,'5678',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(8,3,'1123',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(9,4,'123456',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(10,5,'2257',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(11,6,'5678',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(12,6,'1234',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(13,7,'5565',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(14,7,'8877',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(15,7,'1234',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(16,8,'2257',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(17,9,'9999',0,1,'2020-07-03 06:48:21',1,'2020-07-03 06:48:21'),(18,9,'1234',0,1,'2020-07-03 06:48:21',1,'2020-07-03 06:48:21'),(19,10,'9999',0,1,'2020-07-03 07:57:10',1,'2020-07-03 07:57:10'),(20,11,'7899',0,1,'2020-07-03 08:09:26',1,'2020-07-03 08:09:26'),(21,12,'1234',0,1,'2020-07-03 08:14:26',1,'2020-07-03 08:14:26'),(22,13,'9876',0,1,'2020-07-03 08:17:05',1,'2020-07-03 08:17:05'),(23,13,'5432',0,1,'2020-07-03 08:17:05',1,'2020-07-03 08:17:05'),(24,14,'1234',0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47'),(25,14,'5678',0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47'),(26,14,'9999',0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47'),(27,15,'5555',0,1,'2020-07-05 13:02:57',1,'2020-07-05 13:02:57'),(28,15,'1245',0,1,'2020-07-05 13:02:57',1,'2020-07-05 13:02:57'),(29,15,'9999',0,1,'2020-07-05 13:02:57',1,'2020-07-05 13:02:57'),(30,15,'1234',0,1,'2020-07-05 13:02:57',1,'2020-07-05 13:02:57'),(31,15,'1235',0,1,'2020-07-05 13:02:57',1,'2020-07-05 13:02:57');
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(512) NOT NULL,
  `password` varchar(512) NOT NULL,
  `firstName` varchar(512) NOT NULL,
  `lastName` varchar(512) NOT NULL,
  `mobileNumber` varchar(512) NOT NULL,
  `typeSyscode` int NOT NULL,
  `permissions` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$x7WtqVjuBztMPppzAI45BO59VoFVRxaEvxt6qwtBUKXkAzoeZ4WCW','Utsav','P','90047889',1,'[\"AccessAuthFeature\"]'),(2,'cfs@customer.in','$2a$10$n0a2x0KIkAk2o1.1zoUJP.6L1dj64VBXY13k23xe5xni88QzC/mbi','CFS','Customer','4457895',4,'[\"AccessAuthFeature\"]'),(3,'admin@admin.com','$2a$10$0BXhpf.VXgo5DoxyNh5.NexjKhK8RMrDGRhk6P/kHnNtvPabW7m6W','admin','admin','90047553',1,'[\"CreateVehicle\",\"UpdateVehicle\",\"DeleteVehicle\"]'),(4,'user@email.in','$2a$10$29GBPzgUJhwlmH6Fl.03lOO4Zg7faFU6cGiWvFUrCDiLMe8GAR6ye','First Name','First Name','5577889',4,'[\"AccessAuthFeature\"]'),(5,'cfs@user2.com','$2a$10$i5BBLqLwBIwzktMUvEHCdOgkpi3rg86UF4yDOMdoXneJm3gia217.','CFS Master 3','CFS Master 3','55447788',5,'[\"AccessAuthFeature\"]'),(6,'cfs@master3.in','$2a$10$bdwf6VO6YHUN4Pe3u0WBqOgwE2hZoZwMzKi7tbHowZ/SyKUFY0lEy','CFS USER','CFS USER','9004788445',4,'[\"AccessAuthFeature\"]');
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
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,'Admin',1,1,'2020-06-26 21:11:31',NULL,NULL),(2,'Import Customer',1,1,'2020-06-26 21:12:54',NULL,NULL),(3,'Export Customer',1,1,'2020-06-26 21:12:54',NULL,NULL),(4,'CFS Customer',1,1,'2020-06-26 21:12:54',NULL,NULL),(5,'transporter2',1,1,'2020-06-26 21:12:54',NULL,NULL),(6,'Driver',1,1,'2020-06-26 21:12:54',NULL,NULL);
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
  PRIMARY KEY (`userroleId`),
  KEY `userroleId_idx` (`roleId`),
  KEY `usermappingId_idx` (`userId`),
  CONSTRAINT `usermappingId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `userroleId` FOREIGN KEY (`roleId`) REFERENCES `userrole` (`roleId`)
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
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `vehicleId` int NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(512) NOT NULL,
  `vehicle_type` varchar(512) NOT NULL,
  `vehicle_capacity` varchar(512) NOT NULL,
  `weight` int DEFAULT NULL,
  `manufacture_year` varchar(512) DEFAULT NULL,
  `stateId` int DEFAULT NULL,
  `owned` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiclemaster`
--

LOCK TABLES `vehiclemaster` WRITE;
/*!40000 ALTER TABLE `vehiclemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiclemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weightmaster`
--

DROP TABLE IF EXISTS `weightmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weightmaster` (
  `weightId` int NOT NULL AUTO_INCREMENT,
  `weight_description` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `containerId` int NOT NULL,
  PRIMARY KEY (`weightId`),
  KEY `containerId_idx` (`containerId`),
  CONSTRAINT `containerId` FOREIGN KEY (`containerId`) REFERENCES `containermaster` (`containerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `weightmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardcfsratemaster`
--

DROP TABLE IF EXISTS `yardcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardcfsratemaster` (
  `yard_cfs_rateId` int NOT NULL AUTO_INCREMENT,
  `cfsId` int NOT NULL,
  `yardId` int NOT NULL,
  `containerId` int NOT NULL,
  `weightId` int NOT NULL,
  `rate` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `portId` int NOT NULL,
  PRIMARY KEY (`yard_cfs_rateId`),
  KEY `yardratecfsId_idx` (`cfsId`),
  KEY `yardrateyardId_idx` (`yardId`),
  KEY `yardratecontainerId_idx` (`containerId`),
  KEY `yardrateweightId_idx` (`weightId`),
  CONSTRAINT `yardratecfsId` FOREIGN KEY (`cfsId`) REFERENCES `cfsmaster` (`cfsMasterId`),
  CONSTRAINT `yardratecontainerId` FOREIGN KEY (`containerId`) REFERENCES `containermaster` (`containerId`),
  CONSTRAINT `yardrateweightId` FOREIGN KEY (`weightId`) REFERENCES `weightmaster` (`weightId`),
  CONSTRAINT `yardrateyardId` FOREIGN KEY (`yardId`) REFERENCES `yardmaster` (`yardId`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardmaster` (
  `yardId` int NOT NULL AUTO_INCREMENT,
  `yard_name` varchar(512) NOT NULL,
  `portId` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `address` mediumtext,
  `pincode` varchar(15) DEFAULT NULL,
  `latitude` varchar(145) DEFAULT NULL,
  `longitude` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`yardId`),
  KEY `portId_idx` (`portId`),
  CONSTRAINT `yardportId` FOREIGN KEY (`portId`) REFERENCES `portmaster` (`portId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardmaster`
--

LOCK TABLES `yardmaster` WRITE;
/*!40000 ALTER TABLE `yardmaster` DISABLE KEYS */;
INSERT INTO `yardmaster` VALUES (1,'New Yard',1,1,1,'2020-07-01 21:07:46',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `yardmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedaymaster`
--

DROP TABLE IF EXISTS `zonedaymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonedaymaster` (
  `zone_dayId` int NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(512) NOT NULL,
  `portId` int NOT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`zone_dayId`)
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
  `zoneId` int NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(512) NOT NULL,
  `zone_description` varchar(512) NOT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`zoneId`)
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
-- Dumping routines for database 'transporter2'
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

Select  max(bidId) + 1 into maxVal from transporter22.bid;
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

Select * from transporter22.bid;

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

Select typeSyscode into roleId from transporter22.user
where id = user_Id;


if roleId = 5 then -- transporter2
	Select b.bidName,b.source_name,b.destination_name,
    b.container_type, b.container_weight_type,
    bm.bidValue
    from transporter22.bid b
    Left Outer Join bidusermapping bm on b.bidId = bm.bidId
    and bm.userId = user_Id;
    
else -- Admin User
    Select b.bidName,b.source_name,b.destination_name,
    b.container_type, b.container_weight_type,
    bm.bidValue
    from transporter22.bid b
    Left Outer Join bidusermapping bm on b.bidId = bm.bidId;
    
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
SELECT c.* FROM transporter22.cfsmaster c
Left Outer Join locationmaster l on c.locationId = l.locationId;

/*Inner Join transporter22.user u 
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

Select master_typeId,sourceId,destinationId 
into masterType,sourceID,destinationID
FROM transporter22.order where orderid = order_Id;

Select settings_value into profit_margin
from settings Where settings_name = 'cfs_order_profit';

Begin
   DECLARE exit_loop int default 0; 
   DECLARE order_cursor CURSOR FOR
     Select container_type, weight_type,no_of_trucks
     from transporter22.container where orderId = order_Id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
   OPEN order_cursor;
   
   REPEAT
  
     FETCH  order_cursor INTO containerType,weightType,trucks;
     
     IF NOT exit_loop  THEN
		If masterType = 1 then
			Set cfsRate := (select rate * trucks
			from transporter22.cfsratemaster
			Where portId = sourceID and cfsId = destinationID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
		ElseIf masterType = 2 then
			Set cfsRate := (select rate * trucks
			from transporter22.cfsratemaster
			Where portId = destinationID and cfsId = sourceID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 3 then
			Set cfsRate := (select rate * trucks
			from transporter22.yardcfsratemaster
			Where yardId = sourceID and cfsId = destinationID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 4 then
			Set cfsRate := (select rate * trucks
			from transporter22.yardcfsratemaster
			Where yardId = destinationID and cfsId = sourceID
			and weightId = weightType and containerId = containerType);
			Set orderRate = orderRate + cfsRate;
		End if;
        
     END IF;
     UNTIL exit_loop END REPEAT;
    
   close order_cursor;
   
	Set profit_Rate = (orderRate * profit_margin)/ 100;
	Update transporter22.order set totalRate = orderRate,
    profitMarginPercentage = profit_margin,
    profitRate = profit_Rate,
    rateexcludingProfit = orderRate - profit_Rate
    Where orderId = order_Id;
    
    
    Insert into transporter22.bid(bidName,containerId,container_type,
    container_weight_type,source_type,destination_type,original_rate,
    bid_rate,margin_percent,order_master_typeId,
    source_name,destination_name,orderId,is_active,created_by,created_on) 
	Select GetBidNumber(),t.containerId,c.container_type,c.weight_type,
    ord.source_type,ord.destination_type,cr.rate,
    (cr.rate - ((cr.rate * s.settings_value) / 100)),
    s.settings_value,ord.master_typeId,
    case 
    When ord.master_typeId = 1 then 
    p.port_name
    When ord.master_typeId = 2 then 
    cm.cfs_name
    When ord.master_typeId = 3 then 
    y.yard_name
    When ord.master_typeId = 4 then 
    ycm.cfs_name
    end,
    case 
    When ord.master_typeId = 1 then 
    cm.cfs_name
    When ord.master_typeId = 2 then 
    p.port_name
    When ord.master_typeId = 3 then 
    ycm.cfs_name
    When ord.master_typeId = 4 then 
    y.yard_name
    end,
	ord.orderId,1,1,CURDATE()
 	From transporter22.order ord
	Inner join transporter22.container c
	on ord.orderId = c.orderId
	Inner Join transporter22.truck t
	on c.containerId = t.containerId
    Left Outer Join transporter22.cfsratemaster cr on
    c.container_type = cr.containerId and c.weight_type = cr.weightId
    Left Outer Join transporter22.yardcfsratemaster ym on
    c.container_type = ym.containerId and c.weight_type = ym.weightId
        Left Outer Join transporter22.portmaster p on cr.portId = p.portId
    Left Outer Join transporter22.cfsmaster cm on cr.cfsId = cm.cfsMasterId 
    Left Outer Join transporter22.yardmaster y on ym.yardId = y.yardId
    Left Outer Join transporter22.cfsmaster ycm on ym.cfsId = ycm.cfsMasterId 
    Left Outer join settings s on settings_name = 'cfs_order_profit' 
	where ord.orderId = order_Id and
    case 
    when ord.master_typeId = 1 then
     cr.portId = ord.sourceId and cr.cfsId = ord.destinationId
	when ord.master_typeId = 2 then
	 cr.portId = ord.destinationId and cr.cfsId = ord.sourceId
	when ord.master_typeId = 3 then
	 ym.yardId = ord.sourceId and ym.cfsId = ord.destinationId
	when ord.master_typeId = 4 then
	 ym.yardId = ord.destinationId and ym.cfsId = ord.sourceId
     end;
    
  End;
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
	SELECT l.*,m.cfsMasterId,m.cfs_name FROM transporter22.locationmaster l
    Inner join transporter22.cfsmaster m
    on l.locationId = m.locationId; 
    -- WHERE m.userId = userId;
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

-- Dump completed on 2020-07-10  3:26:29
