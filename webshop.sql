-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: webshop
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Prozessor'),(2,'Mainboard'),(3,'Arbeitsspeicher'),(4,'Massenspeicher'),(5,'Kühler'),(6,'Gehäuse'),(7,'Netzteil'),(8,'Grafikkarte'),(9,'Lüfter');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passphrase` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `positions_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `cat_id` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Intel Core Ultra 7 265K','Intel Prozessor der neusten Generation',419.99,1,100),(2,'Intel Core Ultra 9 285K','Intel Prozessor der neusten Generation',649.99,1,50),(3,'Intel Core Ultra 5 245K','Intel Prozessor der neusten Generation',299.99,1,150),(4,'AMD Ryzen 7 9800X3D','AMD Prozessor der neusten Generation mit 3DV-Cache',499.99,1,150),(5,'AMD Ryzen 9 9950X3D','AMD Prozessor der neusten Generation mit 3DV-Cache',699.99,1,150),(6,'AMD Ryzen 9 9900X3D','AMD Prozessor der neusten Generation mit 3DV-Cache',599.99,1,150),(7,'ASUS ROG Strix Z890-E Gaming WIFI','Intel Mainboard mit Z890 Chipsatz. LGA1851 Sockel. ATX Formfaktor.',529.00,2,50),(8,'ASUS ROG Maximus Z890 HERO','Intel Mainboard mit Z890 Chipsatz. LGA1851 Sockel. ATX Formfaktor.',739.00,2,40),(9,'ASUS ROG Maximus Z890 EXTREME','Intel Mainboard mit Z890 Chipsatz. LGA1851 Sockel. E-ATX Formfaktor.',1329.00,2,10),(10,'MSI MEG Z890 Godlike','Intel Mainboard mit Z890 Chipsatz. LGA1851 Sockel. E-ATX Formfaktor',1219.00,2,10),(11,'MSI MPG Z890 Carbon WIFI','Intel Mainboard mit Z890 Chipsatz. LGA1851 Sockel. ATX Formfaktor',489.00,2,50),(12,'MSI MEG Z890 Unify-X','Intel Mainboard mit Z890 Chipsatz. LGA1851 Sockel. ATX Formfaktor',699.00,2,50),(13,'Corsair DIMM 64GB DDR5-6400 (2x 32GB) Dual-Kit','Corsair Vengeance DDR5 Arbeitsspeicher mit Intel XMP Profil.',259.00,3,150),(14,'Corsair DIMM 32GB DDR5-6400 (2x 16GB) Dual-Kit','Corsair Vengeance DDR5 Arbeitsspeicher mit Intel XMP Profil.',129.00,3,150),(15,'SAMSUNG 990 PRO 1 TB','Samsung M.2 PCIe SSD. PCIe 4.0 x4, NVMe 2, M.2 2280',109.00,4,200),(16,'SAMSUNG 990 PRO 2 TB','Samsung M.2 PCIe SSD. PCIe 4.0 x4, NVMe 2, M.2 2280',179.00,4,200),(17,'SAMSUNG 9100 PRO 2 TB','Samsung M.2 PCIe SSD. PCIe 5.0 x4, NVMe 2, M.2 2280',269.00,4,100),(18,'SAMSUNG 980 PRO 2 TB','Samsung M.2 PCIe SSD. PCIe 4.0 x4, NVMe 1.3c, M.2 2280',109.00,4,200),(19,'Corsair MP700 Pro 2 TB','Corsair M.2 PCIe SSD. PCIe 5.0 x4, NVMe 2, M.2 2280',109.00,4,200),(20,'Corsair NAUTILUS 360 RS','AIO Wasserkühlung mit 360mm Radiator',105.00,5,50),(21,'Corsair NAUTILUS 360 RS ARGB','AIO Wasserkühlung mit 360mm Radiator',134.90,5,50),(22,'Corsair 6500X','ATX Tower-Gehäuse mit Tempered Glass',236.00,6,50),(23,'Lian Li O11 Dynamic EVO RGB','ATX Tower-Gehäuse mit Seitenteil aus Glas',179.00,6,50),(24,'Corsair 4000D Airflow','ATX Tower-Gehäuse mit Tempered Glass',99.00,6,70),(25,'Corsair iCUE 5000D RGB Airflow','ATX Tower-Gehäuse mit Tempered Glass und RGB Controller',199.00,6,50),(26,'Corsair RM850x','850 Watt Netzteil. 80+ Gold Zertifizierung',140.00,7,150),(27,'Corsair RM1000x','1000 Watt Netzteil. 80+ Gold Zertifizierung',180.00,7,150),(28,'MSI GeForce RTX 5070 12G GAMING TRIO OC','NVIDIA RTX Grafikkarte der neusten Generation.',709.00,8,50),(29,'MSI GeForce RTX 5090 32G GAMING TRIO OC','NVIDIA RTX Grafikkarte der neusten Generation.',2799.00,8,9),(30,'MSI GeForce RTX 5080 GAMING TRIO OC','NVIDIA RTX Grafikkarte der neusten Generation.',1399.00,8,0),(31,'MSI GeForce RTX 5090 32G VANGUARD SOC LAUNCH EDITION','NVIDIA RTX Grafikkarte der neusten Generation.',3199.00,8,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 13:22:37
