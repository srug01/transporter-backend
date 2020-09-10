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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'orders','CFS User CFS User placed a new Order on 2020-09-01!',2,NULL,4,'2020-08-31 19:08:48',0,1,NULL),(2,'orders','Transporter ALC confirmed a bid on 2020-09-01!',1,NULL,5,'2020-08-31 19:11:07',0,1,NULL),(3,'orders','Transporter ALC confirmed a bid on 2020-09-01!',1,NULL,5,'2020-08-31 19:11:14',0,1,NULL),(4,'orders','Transporter2 ALC confirmed a bid on 2020-09-01!',1,NULL,6,'2020-08-31 19:13:03',0,1,NULL),(5,'orders','Transporter2 ALC confirmed a bid on 2020-09-01!',1,NULL,6,'2020-08-31 19:13:07',0,1,NULL),(6,'orders','Gaurav CFS Super Admin Gaurav CFS Super Admin placed a new Order on 2020-09-01!',3,NULL,9,'2020-08-31 20:40:03',0,1,NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-10 18:54:12
