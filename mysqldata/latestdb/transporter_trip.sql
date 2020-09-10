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
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `billedAmount` int DEFAULT NULL,
  `BidValue` int DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `startedBy` int DEFAULT NULL,
  `stoppeddBy` int DEFAULT NULL,
  PRIMARY KEY (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (1,3,1,1,NULL,NULL,'TRIP_TRANSPORTER_ASSIGNED',16,NULL,NULL,NULL,5,'2020-09-01 00:49:31',NULL,NULL,NULL,NULL,NULL,430,NULL,NULL,NULL),(2,4,1,1,1,1,'TRIP_COMPLETED',20,'JNPT','CFS All Cargo','MH02CN4545',6,'2020-08-31 08:22:40',6,'2020-08-31 19:22:40','2020-08-31 13:52:43','2020-08-31 19:23:15',0,400,1,6,7);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-10 18:54:13
