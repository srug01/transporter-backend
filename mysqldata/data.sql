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
  `bidName` varchar(30) NOT NULL,
  `containerId` int NOT NULL,
  `container_type` int NOT NULL,
  `container_weight_type` int NOT NULL,
  `source_type` varchar(45) NOT NULL,
  `destination_type` varchar(45) NOT NULL,
  `original_rate` decimal(10,2) DEFAULT NULL,
  `exhibition_date` datetime DEFAULT NULL,
  `orderId` int NOT NULL,
  `is_active` tinyint NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `bid_upper_limit` decimal(10,2) DEFAULT NULL,
  `bid_lower_limit` decimal(10,2) DEFAULT NULL,
  `order_master_type_syscode` int DEFAULT NULL,
  `source_name` varchar(45) DEFAULT NULL,
  `destination_name` varchar(45) DEFAULT NULL,
  `bid_rate` decimal(10,2) DEFAULT NULL,
  `margin_percent` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`bidId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (22,'BID00000001',14,1,1,'port','cfs',500.00,NULL,9,1,1,'2020-07-03 00:00:00',NULL,NULL,NULL,NULL,1,'Mumbai Port','CFS1',450.00,10.00),(23,'BID00000023',14,1,1,'port','cfs',500.00,NULL,9,1,1,'2020-07-03 00:00:00',NULL,NULL,NULL,NULL,1,'Mumbai Port','CFS1',450.00,10.00),(24,'BID00000024',14,1,1,'port','cfs',500.00,NULL,9,1,1,'2020-07-03 00:00:00',NULL,NULL,NULL,NULL,1,'Mumbai Port','CFS1',450.00,10.00);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
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
  `port_syscode` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `locationId` int DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `cfsMasterId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cfsMasterId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsmaster`
--

LOCK TABLES `cfsmaster` WRITE;
/*!40000 ALTER TABLE `cfsmaster` DISABLE KEYS */;
INSERT INTO `cfsmaster` VALUES ('CFS1','77855544','cfs@user.in','A-13,Agatsya CHS','401107','CFS01','44778','PANNO','4478','Primary Contact','9004944647','additional','4478896',1,1,1,'2020-07-01 20:49:44',NULL,NULL,1,NULL,2,1);
/*!40000 ALTER TABLE `cfsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfsratemaster`
--

DROP TABLE IF EXISTS `cfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfsratemaster` (
  `cfs_rate_syscode` int NOT NULL AUTO_INCREMENT,
  `cfs_syscode` int NOT NULL,
  `port_syscode` int NOT NULL,
  `weight_syscode` int NOT NULL,
  `rate` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `container_syscode` int NOT NULL,
  PRIMARY KEY (`cfs_rate_syscode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfsratemaster`
--

LOCK TABLES `cfsratemaster` WRITE;
/*!40000 ALTER TABLE `cfsratemaster` DISABLE KEYS */;
INSERT INTO `cfsratemaster` VALUES (1,1,1,1,500,1,1,'2020-07-02 00:00:00',NULL,NULL,1),(2,1,1,2,1000,1,1,'2020-07-02 00:00:00',NULL,NULL,2);
/*!40000 ALTER TABLE `cfsratemaster` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,1,1,1,2,0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(2,1,2,2,3,0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(3,2,10,1,2,0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(4,2,10,2,1,0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(5,2,30,3,1,0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(6,3,10,1,2,0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(7,3,20,2,3,0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(8,3,30,3,1,0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(9,4,1,1,2,0,1,'2020-07-03 06:48:21',1,'2020-07-03 06:48:21'),(10,5,1,1,1,0,1,'2020-07-03 07:57:10',1,'2020-07-03 07:57:10'),(11,6,1,1,1,0,1,'2020-07-03 08:09:26',1,'2020-07-03 08:09:26'),(12,7,1,1,1,0,1,'2020-07-03 08:14:26',1,'2020-07-03 08:14:26'),(13,8,1,1,2,0,1,'2020-07-03 08:17:05',1,'2020-07-03 08:17:05'),(14,9,1,1,3,0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47');
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `containermaster`
--

DROP TABLE IF EXISTS `containermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `containermaster` (
  `container_syscode` int NOT NULL AUTO_INCREMENT,
  `container_name` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`container_syscode`)
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
  `diesel_rate_syscode` int NOT NULL AUTO_INCREMENT,
  `diesel_rate` int NOT NULL,
  `date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`diesel_rate_syscode`)
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
  `mileage_syscode` int NOT NULL AUTO_INCREMENT,
  `container_syscode` int NOT NULL,
  `weight_syscode` int NOT NULL,
  `mileage` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`mileage_syscode`)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS Customer placed a new Order on 2020-07-03!',4,2,'2020-07-03 06:48:24',0,1,NULL),(2,'orders','CFS Customer placed a new Order on 2020-07-03!',6,2,'2020-07-03 08:09:30',0,1,NULL),(3,'orders','CFS Customer placed a new Order on 2020-07-03!',7,2,'2020-07-03 08:14:28',0,1,NULL),(4,'orders','CFS Customer placed a new Order on 2020-07-03!',8,2,'2020-07-03 08:17:08',0,1,NULL),(5,'orders','CFS Customer placed a new Order on 2020-07-03!',9,2,'2020-07-03 08:18:49',0,1,NULL);
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
  `order_type_syscode` int DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `master_type_syscode` int DEFAULT NULL,
  `source_syscode` int DEFAULT NULL,
  `destination_syscode` int DEFAULT NULL,
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
  `totalRate` decimal(10,2) DEFAULT NULL,
  `profitRate` decimal(10,2) DEFAULT NULL,
  `profitMarginPercentage` decimal(10,2) DEFAULT NULL,
  `rateexcludingProfit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2020-05-31 18:30:00',1,1,1,'cfs','port','Test Remarks','',0,NULL,'submitted',1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15',NULL,4000.00,400.00,10.00,3600.00),(2,1,'2020-06-26 18:30:00',1,2,1,'cfs','port','Test Remarks','',0,NULL,'submitted',6,'2020-06-26 21:33:11',6,'2020-06-26 21:33:11',NULL,NULL,NULL,NULL,NULL),(3,1,'2020-06-28 18:30:00',1,2,1,'cfs','port','Test Ordre Remarks','',0,NULL,'submitted',1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42',NULL,NULL,NULL,NULL,NULL),(4,1,'2020-07-02 18:30:00',1,2,1,'cfs','port','test','',0,NULL,'submitted',2,'2020-07-03 06:48:21',2,'2020-07-03 06:48:21',NULL,NULL,NULL,NULL,NULL),(5,1,'2020-07-02 18:30:00',1,1,1,'cfs','port','test','',0,NULL,'submitted',2,'2020-07-03 07:57:10',2,'2020-07-03 07:57:10',NULL,NULL,NULL,NULL,NULL),(6,1,'2020-07-02 18:30:00',1,1,1,'cfs','port','New Order','',0,NULL,'submitted',2,'2020-07-03 08:09:26',2,'2020-07-03 08:09:26',NULL,500.00,50.00,10.00,450.00),(7,1,'2020-07-02 18:30:00',1,2,1,'cfs','port','JNPT','',0,NULL,'submitted',2,'2020-07-03 08:14:26',2,'2020-07-03 08:14:26',NULL,NULL,NULL,10.00,NULL),(8,1,'2020-07-02 18:30:00',1,2,1,'cfs','port','Add','',0,NULL,'submitted',2,'2020-07-03 08:17:05',2,'2020-07-03 08:17:05',NULL,NULL,NULL,10.00,NULL),(9,1,'2020-07-02 18:30:00',1,1,1,'cfs','port','Working Order Example','',0,NULL,'submitted',2,'2020-07-03 08:18:47',2,'2020-07-03 08:18:47',NULL,1500.00,150.00,10.00,1350.00);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portmaster`
--

DROP TABLE IF EXISTS `portmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portmaster` (
  `port_syscode` int NOT NULL AUTO_INCREMENT,
  `port_name` varchar(512) NOT NULL,
  `state_syscode` int NOT NULL,
  `location_syscode` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`port_syscode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portmaster`
--

LOCK TABLES `portmaster` WRITE;
/*!40000 ALTER TABLE `portmaster` DISABLE KEYS */;
INSERT INTO `portmaster` VALUES (1,'Mumbai Port',1,1,1,1,'2020-06-26 21:10:57',1,'2020-06-26 21:10:57'),(2,'JNPT',2,2,1,1,'2020-06-26 21:31:29',1,'2020-06-26 21:31:29');
/*!40000 ALTER TABLE `portmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `settings_syscode` int NOT NULL AUTO_INCREMENT,
  `settings_name` varchar(512) NOT NULL,
  `settings_value` varchar(512) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`settings_syscode`)
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
  `state_syscode` int NOT NULL AUTO_INCREMENT,
  `state` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`state_syscode`)
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
-- Table structure for table `transporterregistration`
--

DROP TABLE IF EXISTS `transporterregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporterregistration` (
  `transporter_syscode` int NOT NULL AUTO_INCREMENT,
  `transporter_name` varchar(512) DEFAULT NULL,
  `transporter_mobile_no` varchar(512) NOT NULL,
  `transporter_email` varchar(512) DEFAULT NULL,
  `transporter_address` varchar(512) DEFAULT NULL,
  `transporter_pincode` varchar(512) DEFAULT NULL,
  `transporter_GSTIN` varchar(512) DEFAULT NULL,
  `transporter_PAN` varchar(512) DEFAULT NULL,
  `transporter_partner` varchar(512) DEFAULT NULL,
  `transporter_partner_PAN` varchar(512) DEFAULT NULL,
  `transporter_partner_address` varchar(512) DEFAULT NULL,
  `transporter_bank_acno` varchar(512) DEFAULT NULL,
  `transporter_ac_type` varchar(512) DEFAULT NULL,
  `transporter_bank_name` varchar(512) DEFAULT NULL,
  `transporter_bank_branch` varchar(512) DEFAULT NULL,
  `transporter_bank_ifsc` varchar(512) DEFAULT NULL,
  `transporter_address_file` varchar(512) DEFAULT NULL,
  `transporter_gst_file` varchar(512) DEFAULT NULL,
  `transporter_pan_card` varchar(512) DEFAULT NULL,
  `transporter_permit_card` varchar(512) DEFAULT NULL,
  `transporter_license_card` varchar(512) DEFAULT NULL,
  `transporter_other_card` varchar(512) DEFAULT NULL,
  `transporter_is_active` tinyint(1) NOT NULL,
  `transporter_is_verify` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`transporter_syscode`)
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
  `truck_no` varchar(512) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `modify_on` datetime DEFAULT NULL,
  PRIMARY KEY (`truckId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (1,1,'5678',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(2,1,'1234',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(3,2,'1234',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(4,2,'5678',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(5,2,'1014',0,1,'2020-06-26 21:13:15',1,'2020-06-26 21:13:15'),(6,3,'1234',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(7,3,'5678',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(8,3,'1123',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(9,4,'123456',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(10,5,'2257',0,1,'2020-06-26 21:33:11',1,'2020-06-26 21:33:11'),(11,6,'5678',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(12,6,'1234',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(13,7,'5565',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(14,7,'8877',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(15,7,'1234',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(16,8,'2257',0,1,'2020-06-29 15:39:42',1,'2020-06-29 15:39:42'),(17,9,'9999',0,1,'2020-07-03 06:48:21',1,'2020-07-03 06:48:21'),(18,9,'1234',0,1,'2020-07-03 06:48:21',1,'2020-07-03 06:48:21'),(19,10,'9999',0,1,'2020-07-03 07:57:10',1,'2020-07-03 07:57:10'),(20,11,'7899',0,1,'2020-07-03 08:09:26',1,'2020-07-03 08:09:26'),(21,12,'1234',0,1,'2020-07-03 08:14:26',1,'2020-07-03 08:14:26'),(22,13,'9876',0,1,'2020-07-03 08:17:05',1,'2020-07-03 08:17:05'),(23,13,'5432',0,1,'2020-07-03 08:17:05',1,'2020-07-03 08:17:05'),(24,14,'1234',0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47'),(25,14,'5678',0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47'),(26,14,'9999',0,1,'2020-07-03 08:18:47',1,'2020-07-03 08:18:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$x7WtqVjuBztMPppzAI45BO59VoFVRxaEvxt6qwtBUKXkAzoeZ4WCW','Utsav','P','90047889',1,'[\"AccessAuthFeature\"]'),(2,'cfs@customer.in','$2a$10$n0a2x0KIkAk2o1.1zoUJP.6L1dj64VBXY13k23xe5xni88QzC/mbi','CFS','Customer','4457895',4,'[\"AccessAuthFeature\"]');
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
INSERT INTO `userrole` VALUES (1,'Admin',1,1,'2020-06-26 21:11:31',NULL,NULL),(2,'Import Customer',1,1,'2020-06-26 21:12:54',NULL,NULL),(3,'Export Customer',1,1,'2020-06-26 21:12:54',NULL,NULL),(4,'CFS Customer',1,1,'2020-06-26 21:12:54',NULL,NULL),(5,'Transporter',1,1,'2020-06-26 21:12:54',NULL,NULL),(6,'Driver',1,1,'2020-06-26 21:12:54',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrolemapping`
--

LOCK TABLES `userrolemapping` WRITE;
/*!40000 ALTER TABLE `userrolemapping` DISABLE KEYS */;
INSERT INTO `userrolemapping` VALUES (1,1,1,1,'Admin Role'),(2,2,4,1,'CFS Customer Role'),(3,3,5,1,'Transporter Role'),(4,4,6,1,'Driver Role'),(5,5,4,1,'CFS Customer Role'),(6,6,4,1,'CFS Customer Role'),(7,7,5,1,'Transporter Role'),(8,8,6,1,'Driver Role');
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
  `vehicle_syscode` int NOT NULL AUTO_INCREMENT,
  `vehicle_no` varchar(512) NOT NULL,
  `vehicle_type` varchar(512) NOT NULL,
  `vehicle_capacity` varchar(512) NOT NULL,
  `weight` int DEFAULT NULL,
  `manufacture_year` varchar(512) DEFAULT NULL,
  `state_syscode` int DEFAULT NULL,
  `owned` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`vehicle_syscode`)
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
  `weight_syscode` int NOT NULL AUTO_INCREMENT,
  `weight_description` varchar(512) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`weight_syscode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weightmaster`
--

LOCK TABLES `weightmaster` WRITE;
/*!40000 ALTER TABLE `weightmaster` DISABLE KEYS */;
INSERT INTO `weightmaster` VALUES (1,'1TON',1,1,'2020-06-28 18:32:27',NULL,NULL),(2,'2TON',1,1,'2020-06-28 18:32:45',NULL,NULL),(3,'4TON',1,1,'2020-06-28 18:32:56',NULL,NULL);
/*!40000 ALTER TABLE `weightmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardcfsratemaster`
--

DROP TABLE IF EXISTS `yardcfsratemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardcfsratemaster` (
  `yard_cfs_rate_syscode` int NOT NULL AUTO_INCREMENT,
  `cfs_syscode` int NOT NULL,
  `yard_syscode` int NOT NULL,
  `container_syscode` int NOT NULL,
  `weight_syscode` int NOT NULL,
  `rate` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`yard_cfs_rate_syscode`)
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
  `yard_syscode` int NOT NULL AUTO_INCREMENT,
  `yard_name` varchar(512) NOT NULL,
  `port_syscode` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`yard_syscode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardmaster`
--

LOCK TABLES `yardmaster` WRITE;
/*!40000 ALTER TABLE `yardmaster` DISABLE KEYS */;
INSERT INTO `yardmaster` VALUES (1,'New Yard',1,1,1,'2020-07-01 21:07:46',NULL,NULL);
/*!40000 ALTER TABLE `yardmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yardportmapping`
--

DROP TABLE IF EXISTS `yardportmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yardportmapping` (
  `yard_port_mapping_syscode` int NOT NULL AUTO_INCREMENT,
  `yard_syscode` int NOT NULL,
  `port_syscode` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`yard_port_mapping_syscode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yardportmapping`
--

LOCK TABLES `yardportmapping` WRITE;
/*!40000 ALTER TABLE `yardportmapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `yardportmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonedaymaster`
--

DROP TABLE IF EXISTS `zonedaymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonedaymaster` (
  `zone_day_syscode` int NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(512) NOT NULL,
  `port_syscode` int NOT NULL,
  `import` datetime DEFAULT NULL,
  `export` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`zone_day_syscode`)
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
  `zone_syscode` int NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(512) NOT NULL,
  `zone_description` varchar(512) NOT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`zone_syscode`)
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

Select * from transporter.bid;

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
SELECT c.* FROM transporter.cfsmaster c
Inner Join transporter.user u
on c.userId = u.id and c.roleId = u.typeSyscode
Where c.userId = userid and c.roleId = roleid;
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

Select master_type_syscode,source_syscode,destination_syscode
into masterType,sourceID,destinationID
FROM transporter.order where orderid = order_Id;

Select settings_value into profit_margin
from settings Where settings_name = 'cfs_order_profit';

Begin
   DECLARE exit_loop int default 0;
   DECLARE order_cursor CURSOR FOR
     Select container_type, weight_type,no_of_trucks
     from transporter.container where orderId = order_Id;
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = 1;
   OPEN order_cursor;

   REPEAT

     FETCH  order_cursor INTO containerType,weightType,trucks;

     IF NOT exit_loop  THEN
		If masterType = 1 then
			Set cfsRate := (select rate * trucks
			from transporter.cfsratemaster
			Where port_syscode = sourceID and cfs_syscode = destinationID
			and weight_syscode = weightType and container_syscode = containerType);
			Set orderRate = orderRate + cfsRate;
		ElseIf masterType = 2 then
			Set cfsRate := (select rate * trucks
			from transporter.cfsratemaster
			Where port_syscode = destinationID and cfs_syscode = sourceID
			and weight_syscode = weightType and container_syscode = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 3 then
			Set cfsRate := (select rate * trucks
			from transporter.yardcfsratemaster
			Where yard_syscode = sourceID and cfs_syscode = destinationID
			and weight_syscode = weightType and container_syscode = containerType);
			Set orderRate = orderRate + cfsRate;
        ElseIf masterType = 4 then
			Set cfsRate := (select rate * trucks
			from transporter.yardcfsratemaster
			Where yard_syscode = destinationID and cfs_syscode = sourceID
			and weight_syscode = weightType and container_syscode = containerType);
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


    Insert into transporter.bid(bidName,containerId,container_type,
    container_weight_type,source_type,destination_type,original_rate,
    bid_rate,margin_percent,order_master_type_syscode,
    source_name,destination_name,orderId,is_active,created_by,created_on)
	Select GetBidNumber(),t.containerId,c.container_type,c.weight_type,
    ord.source_type,ord.destination_type,cr.rate,
    (cr.rate - ((cr.rate * s.settings_value) / 100)),
    s.settings_value,ord.master_type_syscode,
    case
    When ord.master_type_syscode = 1 then
    p.port_name
    When ord.master_type_syscode = 2 then
    cm.cfs_name
    When ord.master_type_syscode = 3 then
    y.yard_name
    When ord.master_type_syscode = 4 then
    ycm.cfs_name
    end,
    case
    When ord.master_type_syscode = 1 then
    cm.cfs_name
    When ord.master_type_syscode = 2 then
    p.port_name
    When ord.master_type_syscode = 3 then
    ycm.cfs_name
    When ord.master_type_syscode = 4 then
    y.yard_name
    end,
	ord.orderId,1,1,CURDATE()
 	From transporter.order ord
	Inner join transporter.container c
	on ord.orderId = c.orderId
	Inner Join transporter.truck t
	on c.containerId = t.containerId
    Left Outer Join transporter.cfsratemaster cr on
    c.container_type = cr.container_syscode and c.weight_type = cr.weight_syscode
    Left Outer Join transporter.yardcfsratemaster ym on
    c.container_type = ym.container_syscode and c.weight_type = ym.weight_syscode
        Left Outer Join transporter.portmaster p on cr.port_syscode = p.port_syscode
    Left Outer Join transporter.cfsmaster cm on cr.cfs_syscode = cm.cfsMasterId
    Left Outer Join transporter.yardmaster y on ym.yard_syscode = y.yard_syscode
    Left Outer Join transporter.cfsmaster ycm on ym.cfs_syscode = ycm.cfsMasterId
    Left Outer join settings s on settings_name = 'cfs_order_profit'
	where ord.orderId = order_Id and
    case
    when ord.master_type_syscode = 1 then
     cr.port_syscode = ord.source_syscode and cr.cfs_syscode = ord.destination_syscode
	when ord.master_type_syscode = 2 then
	 cr.port_syscode = ord.destination_syscode and cr.cfs_syscode = ord.source_syscode
	when ord.master_type_syscode = 3 then
	 ym.yard_syscode = ord.source_syscode and ym.cfs_syscode = ord.destination_syscode
	when ord.master_type_syscode = 4 then
	 ym.yard_syscode = ord.destination_syscode and ym.cfs_syscode = ord.source_syscode
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
	SELECT l.*,m.cfsMasterId,m.cfs_name FROM transporter.locationmaster l
    Inner join transporter.cfsmaster m
    on l.locationId = m.locationId
    WHERE m.userId = userId;
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

-- Dump completed on 2020-07-03 15:18:38
