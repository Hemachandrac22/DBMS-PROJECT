-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: ptms
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `collaborations`
--

DROP TABLE IF EXISTS `collaborations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaborations` (
  `C_id` int NOT NULL AUTO_INCREMENT,
  `Teams` text,
  `Resources` text,
  `Budget` decimal(10,2) DEFAULT NULL,
  `Joint_deadlines` date DEFAULT NULL,
  `Communication_channel` varchar(100) DEFAULT NULL,
  `Task_id` int DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  PRIMARY KEY (`C_id`),
  KEY `Task_id` (`Task_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `collaborations_ibfk_1` FOREIGN KEY (`Task_id`) REFERENCES `task` (`Task_id`),
  CONSTRAINT `collaborations_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborations`
--

LOCK TABLES `collaborations` WRITE;
/*!40000 ALTER TABLE `collaborations` DISABLE KEYS */;
/*!40000 ALTER TABLE `collaborations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminder`
--

DROP TABLE IF EXISTS `reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reminder` (
  `Rem_id` int NOT NULL AUTO_INCREMENT,
  `Reminder_date` datetime DEFAULT NULL,
  `Repeat_interval` varchar(50) DEFAULT NULL,
  `Notification_method` varchar(50) DEFAULT NULL,
  `Task_id` int DEFAULT NULL,
  PRIMARY KEY (`Rem_id`),
  KEY `Task_id` (`Task_id`),
  CONSTRAINT `reminder_ibfk_1` FOREIGN KEY (`Task_id`) REFERENCES `task` (`Task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminder`
--

LOCK TABLES `reminder` WRITE;
/*!40000 ALTER TABLE `reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `Task_id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) DEFAULT NULL,
  `Description` text,
  `Due_date` date DEFAULT NULL,
  `Priority` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Actual_time` int DEFAULT NULL,
  `Estimated_time` int DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  PRIMARY KEY (`Task_id`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'n1','e1@gmail.com','p1','r1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workbreak`
--

DROP TABLE IF EXISTS `workbreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workbreak` (
  `Break_id` int NOT NULL AUTO_INCREMENT,
  `start_time` time DEFAULT NULL,
  `End_time` time DEFAULT NULL,
  `Break_type` varchar(50) DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  `Task_id` int DEFAULT NULL,
  PRIMARY KEY (`Break_id`),
  KEY `User_id` (`User_id`),
  KEY `Task_id` (`Task_id`),
  CONSTRAINT `workbreak_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`User_id`),
  CONSTRAINT `workbreak_ibfk_2` FOREIGN KEY (`Task_id`) REFERENCES `task` (`Task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workbreak`
--

LOCK TABLES `workbreak` WRITE;
/*!40000 ALTER TABLE `workbreak` DISABLE KEYS */;
/*!40000 ALTER TABLE `workbreak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ptms'
--

--
-- Dumping routines for database 'ptms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 21:49:14
