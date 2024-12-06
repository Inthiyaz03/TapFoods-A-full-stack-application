-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: zaika
-- ------------------------------------------------------
-- Server version	8.0.28

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
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phoneNo` varchar(200) NOT NULL,
  `address` varchar(450) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` enum('Customers','RestaurentAdmin','DeliveryAgent','SystemAdmin') DEFAULT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastLoginDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `restaurantOwnerId` int DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `idx_user_restaurantOwnerId` (`restaurantOwnerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (12,'Inthiyaz Shaik','20ka1a0303@gmail.com','9346002947','1224-L4 kethireddy colony','thor','uips','Customers','2024-12-02 14:49:16','2024-12-02 14:49:16',NULL),(13,'Inthiyaz Shaik','20ka1a0303@gmail.com','9346002947','1224-L4 kethireddy colony','hulk','ivml','RestaurentAdmin','2024-12-02 15:12:41','2024-12-02 15:12:41',101),(14,'Inthiyaz Shaik','20ka1a0303@gmail.com','9346002947','1224-L4 kethireddy colony','loki','mplj','DeliveryAgent','2024-12-02 15:14:35','2024-12-02 15:14:35',NULL),(15,'Inthiyaz Shaik','20ka1a0303@gmail.com','9346002947','1224-L4 kethireddy colony','hawk','ibxl','SystemAdmin','2024-12-02 15:14:35','2024-12-02 15:14:35',NULL);
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

-- Dump completed on 2024-12-06 19:51:04
