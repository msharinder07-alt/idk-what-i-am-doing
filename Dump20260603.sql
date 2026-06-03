-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: school_management_app
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `title` varchar(256) NOT NULL,
  `content` text NOT NULL,
  `target_grade` varchar(100) DEFAULT NULL,
  `post_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES ('attempt 1','Lorem ispum idgaf','XII','2026-04-14 21:58:55',1),('ydhgkjshjkhsdv','shdgbnsbjksb','sdvjjksvbjks','2026-04-16 15:47:30',2),('ydhgkjshjkhsdv','shdgbnsbjksb','sdvjjksvbjks','2026-04-16 15:47:34',3),('bvvjasbvjsv','asbadfadfadfddf','XII','2026-04-16 19:51:02',4),('vjhvjkhadkhkja','dfnvbnbjknknvjknafvjkkjav','XII','2026-04-16 19:52:14',5),('School Reopening','The school for grades IX to XII will open from 25th may','XII','2026-04-16 19:54:02',6);
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_routes`
--

DROP TABLE IF EXISTS `bus_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bus_routes` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `route_name` varchar(50) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `driver_contact` varchar(15) NOT NULL,
  `vehicle_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_routes`
--

LOCK TABLES `bus_routes` WRITE;
/*!40000 ALTER TABLE `bus_routes` DISABLE KEYS */;
INSERT INTO `bus_routes` VALUES (1,'Route 1','Ramesh Kumar','9812345001','KA 01 AB 1234'),(2,'Route 2','Suresh Singh','9812345002','KA 01 AB 5678'),(3,'Route 3','Mahesh Yadav','9812345003','KA 01 AB 9012'),(4,'Route 4','Dinesh Sharma','9812345004','KA 01 AB 3456');
/*!40000 ALTER TABLE `bus_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canteen_daily`
--

DROP TABLE IF EXISTS `canteen_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canteen_daily` (
  `daily_id` int NOT NULL AUTO_INCREMENT,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday') NOT NULL,
  `meal` enum('Breakfast','Lunch','Snacks') NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`daily_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `canteen_daily_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `canteen_menu` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen_daily`
--

LOCK TABLES `canteen_daily` WRITE;
/*!40000 ALTER TABLE `canteen_daily` DISABLE KEYS */;
INSERT INTO `canteen_daily` VALUES (1,'Monday','Breakfast',1),(2,'Monday','Lunch',4),(3,'Monday','Snacks',8),(4,'Tuesday','Breakfast',2),(5,'Tuesday','Lunch',5),(6,'Tuesday','Snacks',9),(7,'Wednesday','Breakfast',3),(8,'Wednesday','Lunch',6),(9,'Wednesday','Snacks',10),(10,'Thursday','Breakfast',1),(11,'Thursday','Lunch',7),(12,'Thursday','Snacks',8),(13,'Friday','Breakfast',2),(14,'Friday','Lunch',4),(15,'Friday','Snacks',9);
/*!40000 ALTER TABLE `canteen_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canteen_menu`
--

DROP TABLE IF EXISTS `canteen_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canteen_menu` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `category` enum('Breakfast','Lunch','Snacks','Beverages') NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canteen_menu`
--

LOCK TABLES `canteen_menu` WRITE;
/*!40000 ALTER TABLE `canteen_menu` DISABLE KEYS */;
INSERT INTO `canteen_menu` VALUES (1,'Poha',25.00,'Breakfast'),(2,'Idli Sambar',40.00,'Breakfast'),(3,'Paratha',35.00,'Breakfast'),(4,'Dal Rice',45.00,'Lunch'),(5,'Rajma Rice',50.00,'Lunch'),(6,'Chole Rice',50.00,'Lunch'),(7,'Paneer Rice',55.00,'Lunch'),(8,'Samosa',15.00,'Snacks'),(9,'Bread Pakoda',20.00,'Snacks'),(10,'Maggi',30.00,'Snacks'),(11,'Chai',10.00,'Beverages'),(12,'Cold Drink',20.00,'Beverages'),(13,'Lassi',25.00,'Beverages');
/*!40000 ALTER TABLE `canteen_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee_structure`
--

DROP TABLE IF EXISTS `fee_structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee_structure` (
  `grade` varchar(10) NOT NULL,
  `term1_fee` decimal(10,2) NOT NULL,
  `term2_fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee_structure`
--

LOCK TABLES `fee_structure` WRITE;
/*!40000 ALTER TABLE `fee_structure` DISABLE KEYS */;
INSERT INTO `fee_structure` VALUES ('I',50000.00,50000.00),('II',50000.00,50000.00),('III',55000.00,55000.00),('IV',60000.00,60000.00),('IX',85000.00,85000.00),('V',65000.00,65000.00),('VI',70000.00,70000.00),('VII',75000.00,75000.00),('VIII',80000.00,80000.00),('X',90000.00,90000.00),('XI',95000.00,95000.00),('XII',100000.00,100000.00);
/*!40000 ALTER TABLE `fee_structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `fee_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `term1_fee` decimal(10,2) NOT NULL,
  `term2_fee` decimal(10,2) NOT NULL,
  `term1_status` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  `term2_status` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  `term1_paid_date` date DEFAULT NULL,
  `term2_paid_date` date DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  KEY `user_id` (`user_id`),
  KEY `grade` (`grade`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`),
  CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`grade`) REFERENCES `fee_structure` (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (12,1,100000.00,100000.00,'Paid','Paid','2024-04-10','2024-10-08','XII'),(13,3,100000.00,100000.00,'Paid','Unpaid','2024-04-05',NULL,'XII'),(14,5,75000.00,75000.00,'Paid','Paid','2024-04-12','2024-10-15','VII'),(15,6,85000.00,85000.00,'Paid','Unpaid','2024-04-03',NULL,'IX'),(16,7,90000.00,90000.00,'Unpaid','Unpaid',NULL,NULL,'X'),(17,8,95000.00,95000.00,'Paid','Paid','2024-04-07','2024-10-20','XI'),(18,9,95000.00,95000.00,'Paid','Unpaid',NULL,NULL,'XI'),(19,10,100000.00,100000.00,'Paid','Unpaid','2024-04-15',NULL,'XII'),(20,11,70000.00,70000.00,'Paid','Paid','2024-04-01','2024-10-05','VI'),(21,12,80000.00,80000.00,'Unpaid','Unpaid',NULL,NULL,'VIII'),(22,13,100000.00,100000.00,'Paid','Paid','2024-04-09','2024-10-12','XII');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homework` (
  `homework_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `grade` varchar(10) NOT NULL,
  `posted_date` date DEFAULT (curdate()),
  PRIMARY KEY (`homework_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `homework_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,'Number Patterns','Complete exercises 3.1 to 3.4 from chapter 3','I','2025-04-07'),(2,1,'Basic Multiplication','Learn tables from 2 to 10 and write them twice','II','2025-04-07'),(3,1,'Fractions Practice','Solve all problems from page 45 and 46 of textbook','III','2025-04-08'),(4,2,'Plant Cell Diagram','Draw and label a plant cell diagram neatly in your notebook','III','2025-04-08'),(5,2,'Food Chains','Write five examples of food chains and draw one','IV','2025-04-09'),(6,2,'States of Matter','Write differences between solids liquids and gases with examples','V','2025-04-09'),(7,3,'Map Work','Mark all Indian states and capitals on the outline map provided','V','2025-04-10'),(8,3,'Ancient Civilisations','Write a one page note on the Indus Valley Civilisation','VI','2025-04-10'),(9,4,'Letter Writing','Write a formal letter to your principal requesting a holiday','VI','2025-04-11'),(10,4,'Grammar Exercise','Complete the tense conversion exercises on page 78','VII','2025-04-11'),(11,1,'Algebra Basics','Solve the linear equations from exercise 5.2','VII','2025-04-12'),(12,1,'Geometry','Construct the given triangles using compass and ruler','VIII','2025-04-12'),(13,6,'Python Basics','Write a program to print fibonacci series up to 100','VIII','2025-04-14'),(14,6,'SQL Queries','Write SELECT queries for the given schema in your practical file','IX','2025-04-14'),(15,7,'Laws of Motion','Solve numericals 1 to 8 from exercise 5 of chapter 3','IX','2025-04-15'),(16,7,'Wave Optics','Write notes on reflection and refraction with ray diagrams','X','2025-04-15'),(17,8,'Periodic Table','Learn the first 30 elements with symbols and atomic numbers','X','2025-04-16'),(18,8,'Chemical Bonding','Draw electron dot structures for the given molecules','XI','2025-04-16'),(19,9,'Cell Division','Write differences between mitosis and meiosis with diagrams','XI','2025-04-17'),(20,9,'Genetics','Solve the given monohybrid and dihybrid cross problems','XII','2025-04-17'),(21,18,'Neural Networks','Write a short note on perceptrons and activation functions','XI','2025-04-18'),(22,18,'Machine Learning','List and explain five real world applications of machine learning','XII','2025-04-18'),(23,1,'Inverese trigo','NCERT Examplar','XII','2026-05-19');
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `mark_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `term` enum('Term1','Term2') NOT NULL,
  `marks_obtained` decimal(5,2) DEFAULT NULL,
  `max_marks` decimal(5,2) DEFAULT '100.00',
  `grade` int NOT NULL,
  PRIMARY KEY (`mark_id`),
  KEY `user_id` (`user_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`),
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,1,7,'Term1',95.00,100.00,12),(2,1,8,'Term1',92.00,100.00,12),(3,1,1,'Term1',97.00,100.00,12),(4,1,4,'Term1',91.00,100.00,12),(5,1,6,'Term1',93.00,100.00,12),(6,1,7,'Term2',94.00,100.00,12),(7,1,8,'Term2',96.00,100.00,12),(8,1,1,'Term2',98.00,100.00,12),(9,1,4,'Term2',92.00,100.00,12),(10,1,6,'Term2',95.00,100.00,12),(11,3,7,'Term1',93.00,100.00,12),(12,3,8,'Term1',94.00,100.00,12),(13,3,1,'Term1',96.00,100.00,12),(14,3,4,'Term1',90.00,100.00,12),(15,3,6,'Term1',92.00,100.00,12),(16,3,7,'Term2',95.00,100.00,12),(17,3,8,'Term2',93.00,100.00,12),(18,3,1,'Term2',97.00,100.00,12),(19,3,4,'Term2',91.00,100.00,12),(20,3,6,'Term2',94.00,100.00,12),(21,5,1,'Term1',78.00,100.00,7),(22,5,2,'Term1',74.00,100.00,7),(23,5,3,'Term1',71.00,100.00,7),(24,5,4,'Term1',80.00,100.00,7),(25,5,17,'Term1',75.00,100.00,7),(26,5,6,'Term1',77.00,100.00,7),(27,5,1,'Term2',76.00,100.00,7),(28,5,2,'Term2',72.00,100.00,7),(29,5,3,'Term2',73.00,100.00,7),(30,5,4,'Term2',79.00,100.00,7),(31,5,17,'Term2',74.00,100.00,7),(32,5,6,'Term2',76.00,100.00,7),(33,6,1,'Term1',82.00,100.00,9),(34,6,2,'Term1',79.00,100.00,9),(35,6,3,'Term1',75.00,100.00,9),(36,6,4,'Term1',85.00,100.00,9),(37,6,17,'Term1',80.00,100.00,9),(38,6,6,'Term1',83.00,100.00,9),(39,6,1,'Term2',80.00,100.00,9),(40,6,2,'Term2',77.00,100.00,9),(41,6,3,'Term2',76.00,100.00,9),(42,6,4,'Term2',84.00,100.00,9),(43,6,17,'Term2',79.00,100.00,9),(44,6,6,'Term2',82.00,100.00,9),(45,7,1,'Term1',70.00,100.00,10),(46,7,2,'Term1',65.00,100.00,10),(47,7,3,'Term1',68.00,100.00,10),(48,7,4,'Term1',72.00,100.00,10),(49,7,17,'Term1',66.00,100.00,10),(50,7,6,'Term1',71.00,100.00,10),(51,7,1,'Term2',72.00,100.00,10),(52,7,2,'Term2',67.00,100.00,10),(53,7,3,'Term2',70.00,100.00,10),(54,7,4,'Term2',74.00,100.00,10),(55,7,17,'Term2',68.00,100.00,10),(56,7,6,'Term2',73.00,100.00,10),(57,8,7,'Term1',85.00,100.00,11),(58,8,8,'Term1',82.00,100.00,11),(59,8,1,'Term1',88.00,100.00,11),(60,8,4,'Term1',84.00,100.00,11),(61,8,6,'Term1',86.00,100.00,11),(62,8,7,'Term2',83.00,100.00,11),(63,8,8,'Term2',80.00,100.00,11),(64,8,1,'Term2',87.00,100.00,11),(65,8,4,'Term2',82.00,100.00,11),(66,8,6,'Term2',85.00,100.00,11),(67,9,7,'Term1',74.00,100.00,11),(68,9,8,'Term1',70.00,100.00,11),(69,9,1,'Term1',76.00,100.00,11),(70,9,4,'Term1',75.00,100.00,11),(71,9,18,'Term1',72.00,100.00,11),(72,9,7,'Term2',76.00,100.00,11),(73,9,8,'Term2',72.00,100.00,11),(74,9,1,'Term2',78.00,100.00,11),(75,9,4,'Term2',77.00,100.00,11),(76,9,18,'Term2',74.00,100.00,11),(77,10,7,'Term1',68.00,100.00,12),(78,10,8,'Term1',65.00,100.00,12),(79,10,1,'Term1',70.00,100.00,12),(80,10,4,'Term1',72.00,100.00,12),(81,10,16,'Term1',88.00,100.00,12),(82,10,7,'Term2',70.00,100.00,12),(83,10,8,'Term2',67.00,100.00,12),(84,10,1,'Term2',72.00,100.00,12),(85,10,4,'Term2',74.00,100.00,12),(86,10,16,'Term2',90.00,100.00,12),(87,11,1,'Term1',60.00,100.00,6),(88,11,2,'Term1',58.00,100.00,6),(89,11,3,'Term1',62.00,100.00,6),(90,11,4,'Term1',65.00,100.00,6),(91,11,17,'Term1',61.00,100.00,6),(92,11,6,'Term1',63.00,100.00,6),(93,11,1,'Term2',62.00,100.00,6),(94,11,2,'Term2',60.00,100.00,6),(95,11,3,'Term2',64.00,100.00,6),(96,11,4,'Term2',67.00,100.00,6),(97,11,17,'Term2',63.00,100.00,6),(98,11,6,'Term2',65.00,100.00,6),(99,12,1,'Term1',75.00,100.00,8),(100,12,2,'Term1',72.00,100.00,8),(101,12,3,'Term1',70.00,100.00,8),(102,12,4,'Term1',78.00,100.00,8),(103,12,17,'Term1',74.00,100.00,8),(104,12,6,'Term1',76.00,100.00,8),(105,12,1,'Term2',77.00,100.00,8),(106,12,2,'Term2',74.00,100.00,8),(107,12,3,'Term2',72.00,100.00,8),(108,12,4,'Term2',80.00,100.00,8),(109,12,17,'Term2',76.00,100.00,8),(110,12,6,'Term2',78.00,100.00,8),(111,13,7,'Term1',72.00,100.00,12),(112,13,8,'Term1',70.00,100.00,12),(113,13,9,'Term1',75.00,100.00,12),(114,13,4,'Term1',74.00,100.00,12),(115,13,16,'Term1',85.00,100.00,12),(116,13,7,'Term2',74.00,100.00,12),(117,13,8,'Term2',72.00,100.00,12),(118,13,9,'Term2',77.00,100.00,12),(119,13,4,'Term2',76.00,100.00,12),(120,13,16,'Term2',87.00,100.00,12);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletter` (
  `newsletter_id` int NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `published_date` date DEFAULT NULL,
  PRIMARY KEY (`newsletter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES (1,'June 2025','End of Term Highlights','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/5298_Grade12_NL_May_June.pdf','2025-06-01'),(2,'July 2025','New Term Welcome','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/4845_NL_grade_12_july.pdf','2025-07-01'),(3,'August 2025','Independence Day Celebrations','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/4131_Grade12_NL_Aug.pdf','2025-08-01'),(4,'September 2025','Science Fair Winners','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/7781_Grade12_NL_Sept_.pdf','2025-09-01'),(5,'October 2025','Diwali and Cultural Fest','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/5035_Grade12_NL_Oct.pdf','2025-10-01'),(6,'December 2025','Vacations and Farewell','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/1892_Grade_12_NL_Dec.pdf','2025-12-01'),(7,'January 2026','New Year New Goals','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/7815_Grade12_NL_Jan.pdf','2026-01-01'),(8,'February 2026','Republic Day Special','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/7803_Grade_12_NL_FEB.pdf','2026-02-01'),(9,'March 2026','Annual Exam Preparation Guide','C:/Users/91956/Desktop/Coding Projects/Python Projects/Newsletters/7922_Grade12_NL_March_(1).pdf','2026-03-01');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_details` (
  `user_id` int NOT NULL,
  `enrollment_no` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `section` char(1) DEFAULT NULL,
  `combination_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `enrollment_no` (`enrollment_no`),
  CONSTRAINT `student_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` VALUES (1,'SM1','Adriyan','XII','B',2),(3,'SM2','Harsh S Nair','XII','B',2),(5,'SM4','Aarav Mehta','VII','A',1),(6,'SM5','Diya Nair','IX','B',1),(7,'SM6','Kabir Singh','X','A',1),(8,'SM7','Ishita Verma','XI','A',2),(9,'SM8','Rohan Das','XI','B',3),(10,'SM9','Meera Kapoor','XII','C',4),(11,'SM10','Aditya Rao','VI','B',1),(12,'SM11','Sneha Patil','VIII','C',1),(13,'SM12','Yash Gupta','XII','A',5);
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_combinations`
--

DROP TABLE IF EXISTS `subject_combinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_combinations` (
  `combination_id` int NOT NULL,
  `subject_id` int NOT NULL,
  PRIMARY KEY (`combination_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `subject_combinations_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_combinations`
--

LOCK TABLES `subject_combinations` WRITE;
/*!40000 ALTER TABLE `subject_combinations` DISABLE KEYS */;
INSERT INTO `subject_combinations` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(1,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,6),(2,6),(2,7),(3,7),(4,7),(5,7),(2,8),(3,8),(4,8),(5,8),(5,9),(4,16),(5,16),(1,17),(3,18);
/*!40000 ALTER TABLE `subject_combinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(100) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Mathematics'),(2,'Science'),(3,'SST'),(4,'English'),(5,'Hindi'),(6,'Computer Science'),(7,'Physics'),(8,'Chemistry'),(9,'Biology'),(10,'Economics'),(11,'Accountancy'),(12,'Business Studies'),(13,'History'),(14,'Geography'),(15,'Political Science'),(16,'Physical Education'),(17,'Language 2'),(18,'AI');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_details`
--

DROP TABLE IF EXISTS `teacher_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_details` (
  `user_id` int NOT NULL,
  `employee_code` varchar(40) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `grade` varchar(100) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `employee_code` (`employee_code`),
  CONSTRAINT `teacher_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_details`
--

LOCK TABLES `teacher_details` WRITE;
/*!40000 ALTER TABLE `teacher_details` DISABLE KEYS */;
INSERT INTO `teacher_details` VALUES (16,'TC001','Priya Sharma','I,II,III',1),(17,'TC002','Ramesh Iyer','III,IV,V',2),(18,'TC003','Sunita Menon','V,VI',3),(19,'TC004','Arvind Kulkarni','VI,VII',4),(20,'TC005','Deepa Nair','VII,VIII',1),(21,'TC006','Karan Mehta','VIII,IX',6),(22,'TC007','Anjali Singh','IX,X',7),(23,'TC008','Vikash Pandey','X,XI',8),(24,'TC009','Neha Joshi','XI,XII',9),(25,'TC010','Suresh Pillai','XI,XII',18);
/*!40000 ALTER TABLE `teacher_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_details`
--

DROP TABLE IF EXISTS `transport_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_details` (
  `user_id` int NOT NULL,
  `mode` enum('Bus','Private') NOT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_contact` varchar(15) DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `transport_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`),
  CONSTRAINT `transport_details_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `bus_routes` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_details`
--

LOCK TABLES `transport_details` WRITE;
/*!40000 ALTER TABLE `transport_details` DISABLE KEYS */;
INSERT INTO `transport_details` VALUES (1,'Private','Rajesh Sharma','9876543210',NULL),(3,'Bus',NULL,NULL,4),(5,'Bus',NULL,NULL,2),(6,'Private','Suresh Nair','9845612378',NULL),(7,'Bus',NULL,NULL,1),(8,'Private','Anita Verma','9812345678',NULL),(9,'Bus',NULL,NULL,3),(10,'Bus',NULL,NULL,2),(11,'Private','Ramesh Rao','9867452310',NULL),(12,'Bus',NULL,NULL,1),(13,'Private','Vikram Gupta','9823456789',NULL);
/*!40000 ALTER TABLE `transport_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Password` varchar(255) NOT NULL,
  `role` enum('Student','Teacher','Admin') NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'Atrium','Student'),(2,'Harman070209','Student'),(3,'Chikoo070209','Student'),(4,'first','Teacher'),(5,'stud1','Student'),(6,'stud2','Student'),(7,'stud3','Student'),(8,'stud4','Student'),(9,'teach1','Teacher'),(10,'teach2','Teacher'),(11,'teach3','Teacher'),(12,'tchr01','Teacher'),(13,'tchr02','Teacher'),(14,'stud5','Student'),(15,'admin1','Admin'),(16,'Teacher@123','Teacher'),(17,'Teacher@123','Teacher'),(18,'Teacher@123','Teacher'),(19,'Teacher@123','Teacher'),(20,'Teacher@123','Teacher'),(21,'Teacher@123','Teacher'),(22,'Teacher@123','Teacher'),(23,'Teacher@123','Teacher'),(24,'Teacher@123','Teacher'),(25,'Teacher@123','Teacher');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-03 20:38:47
