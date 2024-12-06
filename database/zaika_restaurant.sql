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
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantId` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagePath` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `eta` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cuisineType` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurantOwnerId` int NOT NULL,
  PRIMARY KEY (`restaurantId`),
  KEY `idx_restaurantOwnerId` (`restaurantOwnerId`),
  KEY `id1_restaurantOwnerId` (`restaurantOwnerId`),
  KEY `id12_restaurantOwnerId` (`restaurantOwnerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'Victory','Images/veg (1).jpeg',4.8,'30 mins','Vegetarian','Epic Lane, Delhi','Open',101),(2,'Sita’s Serenity','Images/veg (2).jpeg',4.7,'25 mins','Vegetarian','Divine Street, Mumbai','Open',102),(3,'Rani’s Royal Rajma','Images/nonveg (1).jpeg',4.6,'40 mins','Non-Vegetarian','Regal Road, Bangalore','Open',103),(4,'Krishna’s Kebab Kingdom','Images/nonveg (2).jpeg',4.5,'35 mins','Non-Vegetarian','Heroic Avenue, Hyderabad','Open',104),(5,'Lakshman’s Lagoon of Sweets','Images/icecream (1).jpeg',4.9,'20 mins','Desserts','Mythic Drive, Chennai','Open',105),(6,'Ganga’s Gourmet Haven','Images/icecream (2).jpeg',4.7,'25 mins','Desserts','Sacred Street, Pune','Open',106),(7,'Draupadi’s Divine Delights','Images/sweets (1).jpeg',4.8,'30 mins','Sweets','Legend Lane, Kolkata','Open',107),(8,'Indira’s Indulgent Treats','Images/sweets (2).jpeg',4.6,'20 mins','Sweets','Harmony Road, Jaipur','Open',108),(9,'Vikramaditya’s Victory Sweets','Images/sweets (3).jpeg',4.7,'15 mins','Sweets','Triumph Avenue, Ahmedabad','Open',109),(10,'Sita’s Savory Snacks','Images/veg (3).jpeg',4.5,'35 mins','Vegetarian','Bliss Drive, Surat','Open',110),(11,'Rajesh’s Royal Rasoi','Images/nonveg (3).jpeg',4.4,'40 mins','Non-Vegetarian','Delight Street, Agra','Open',111),(12,'Nandini’s Nectar Nook','Images/icecream (3).jpeg',4.6,'30 mins','Desserts','reat Avenue, Kanpur','Open',112),(13,'Amitabh’s Sweet Symphony','Images/sweets (4).jpeg',4.8,'20 mins','Sweets','Sweet Lane, Vadodara','Open',113),(14,'Chandni’s Charming Confections','Images/sweets (5).jpeg',4.7,'25 mins','Sweets','Cherish Street, Coimbatore','Open',114),(15,'Ravi’s Royal Grill','Images/nonveg (4).jpeg',4.5,'35 mins','Non-Vegetarian','Heroic Road, Bhopal','Open',115),(16,'Meera’s Mystic Feasts','Images/nonveg (5).jpeg',4.9,'30 mins','Non-Vegetarian','Enchant Lane, Indore','Open',116),(17,'Kiran’s Kitchen Kingdom','Images/veg (4).jpeg',4.6,'20 mins','Vegetarian','Flavors Street, Mysore','Open',117),(18,'Sonali’s Sweet Escape','Images/icecream (4).jpeg',4.8,'25 mins','Desserts','Treat Avenue, Nagpur','Open',118),(19,'Aishwarya’s Aromatic Delights','Images/icecream (5).jpeg',4.7,'30 mins','Desserts','Bliss Drive, Ludhiana','Open',119),(20,'Prabhas’s Platters of Passion','Images/nonveg (6).jpeg',4.6,'35 mins','Non-Vegetarian','Victory Lane, Visakhapatnam','Open',120);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
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
