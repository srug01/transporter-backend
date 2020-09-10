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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'utsav@hotmail.com','$2a$10$g4gC9K5ebPMdTS2Aosq55ehc.i.N15Bo/wJ994P/ZlM.NqkExMxpa','utsav','demo','9886631264',1,'[\"AccessAuthFeature\"]'),(3,'cfs@hotmail.com','$2a$10$zFSpbpbu3L1ms6QPh78I9.tP28nzE4DfBrj5vyujWGBFaMP6tlHJW','Utsav','Purohit','9886631264',4,'[\"AccessAuthFeature\"]'),(4,'alc@admin.in','$2a$10$u1ELBUU.FGlKqvthzGvAt.xNhXHh9uUXhWOc3f0RNouaTYV0SSKpq','CFS User','CFS User','8875415230',7,'[\"AccessAuthFeature\"]'),(5,'transporter@alc.in','$2a$10$9hAh5NBg.YU73fkkRLmor.Xwy1POsXg5cApaiGF3Hhoci2D01N.62','Transporter','ALC','7789445620',5,'[\"AccessAuthFeature\"]'),(6,'transporter2@alc.in','$2a$10$cRWLZ/YInsJlmmCo0DLHsedcopBJlNVXZkEjQMjTiauWmImYOc.rW','Transporter2','ALC','7784562013',5,'[\"AccessAuthFeature\"]'),(7,'driver@alc.in','$2a$10$T6.Z3nMwE3IDcb25KqU8veJ3JZS6c6YvEapbVgwMcdsFBleuUV0qC','Driver','ALC','7894561230',6,'[\"AccessAuthFeature\"]'),(8,'gaurav@gmail.com','$2a$10$y0MXM6Yu9jH/h8IP1.H6juhR52MP0lbsvNgojGnR4aTdVnfTfDbIq','Gaurav','Admin','9547865231',1,'[\"AccessAuthFeature\"]'),(9,'cfs@gaurav.in','$2a$10$s.Z581LEsX4.EaoLBBknTOsV7EhqwwPodpYGXnflgDNzbFGdlUnIK','Gaurav CFS Super Admin','Gaurav CFS Super Admin','9998887774',7,'[\"AccessAuthFeature\"]');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-10 18:54:16
