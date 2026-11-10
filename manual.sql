-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: pm07_v15
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.22.04.4

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
-- Table structure for table `access_probe`
--

DROP TABLE IF EXISTS `access_probe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_probe` (
  `id` int NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_probe`
--

LOCK TABLES `access_probe` WRITE;
/*!40000 ALTER TABLE `access_probe` DISABLE KEYS */;
INSERT INTO `access_probe` VALUES (1,10);
/*!40000 ALTER TABLE `access_probe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `event_at` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `link_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `expires_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,'Договор 15-01, ООО Стройбаза','2026-11-01 09:10:00',20.00,1,1,'2026-11-10'),(2,'Договор 15-02, ИП Ковалев','2026-11-02 10:40:00',25.00,2,2,'2026-11-15'),(3,'Договор 15-03, ООО Монтаж-Сервис','2026-11-03 08:20:00',30.00,3,1,'2026-11-12'),(4,'Договор 15-04, ООО Ремонт Плюс','2026-11-04 12:05:00',25.00,4,1,'2026-11-20');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `event_at` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `link_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `expires_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Перфоратор Makita HR2470','2026-11-01 09:00:00',20.00,NULL,1,'2027-04-30'),(2,'Строительные леса, комплект','2026-11-02 10:30:00',25.00,NULL,2,'2027-10-31'),(3,'Генератор Huter DN6500','2026-11-03 08:15:00',30.00,NULL,1,'2027-06-30'),(4,'Компрессор Fubag IR 50','2026-11-04 12:00:00',25.00,NULL,1,'2027-03-31');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returns`
--

DROP TABLE IF EXISTS `returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `returns` (
  `id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `event_at` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `link_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `expires_on` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returns`
--

LOCK TABLES `returns` WRITE;
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
INSERT INTO `returns` VALUES (1,'Возврат по договору 15-01','2026-11-05 09:00:00',20.00,1,1,'2026-11-10'),(2,'Возврат по договору 15-02','2026-11-06 11:00:00',25.00,2,2,'2026-11-15'),(3,'Возврат по договору 15-03','2026-11-07 08:30:00',30.00,3,1,'2026-11-12'),(4,'Возврат по договору 15-04','2026-11-08 12:30:00',25.00,4,1,'2026-11-20');
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-10 17:36:46
