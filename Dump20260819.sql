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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES ('School Reopening','The school for grades IX to XII will open from 25th may','12','2026-04-16 19:54:02',6),('Experiment1','Hello baccho experiment 1','8,7,8,12','2026-08-08 20:39:20',8),('School Reopening','Classes IX to XII will resume from 25th May. Students are requested to report by 8:00 AM.','9,10,11,12','2026-04-20 08:15:00',9),('Science Exhibition','Students of grades VI to VIII are invited to participate in the annual science exhibition.','6,7,8','2026-04-24 10:30:00',10),('Inter-House Football Tournament','Trials for the inter-house football tournament will be conducted next week.','9,10,11,12','2026-05-02 14:20:00',11),('Art Competition','An inter-class art competition will be held in the activity hall.','1,2,3,4,5','2026-05-07 11:00:00',12),('Computer Lab Schedule','The computer laboratory schedule has been updated for middle school classes.','6,7,8','2026-05-10 09:40:00',13),('Library Week','Students are encouraged to borrow at least one book during Library Week.','3,4,5,6,7','2026-05-16 13:15:00',14),('Unit Test Timetable','The timetable for the upcoming unit tests has been uploaded.','9,10','2026-05-22 15:10:00',15),('Physics Practical Session','Additional laboratory sessions have been scheduled before the practical examination.','11,12','2026-06-03 12:25:00',16),('Yoga Day Celebration','International Yoga Day activities will be organized in the school auditorium.','1,2,3,4,5,6,7,8','2026-06-15 08:45:00',17),('Parent Teacher Meeting','Parents are requested to attend the PTM scheduled for the final Saturday of the month.','1,2,3,4,5','2026-06-20 16:10:00',18),('Debate Competition','Students interested in debating may register through their class teachers.','9,10,11,12','2026-07-04 10:05:00',19),('Independence Day Practice','Rehearsals for Independence Day will begin from next Monday.','6,7,8,9,10','2026-07-18 09:15:00',20),('Coding Workshop','An introductory programming workshop will be conducted in the computer lab.','8,9,10,11','2026-07-26 13:30:00',21),('Career Guidance Seminar','A seminar covering engineering, medicine and commerce career paths will be conducted.','11,12','2026-08-05 11:45:00',22),('Olympiad Registration','Registrations for Mathematics and Science Olympiads are now open.','6,7,8,9,10','2026-08-12 14:40:00',23),('Mid-Term Examination','Students are advised to review the examination schedule carefully.','9,10,11,12','2026-08-28 15:25:00',24),('Annual Day Auditions','Students interested in music, dance and drama may participate in the auditions.','3,4,5,6,7,8','2026-09-06 10:20:00',25),('Educational Excursion','Permission slips for the educational trip have been distributed.','7,8,9','2026-09-15 09:50:00',26),('Pre-Board Examination Notice','The pre-board examination schedule has been released.','10,12','2026-10-02 16:05:00',27),('Winter Break Notice','The school will remain closed during the winter vacation period.','1,2,3,4,5,6,7,8,9,10,11,12','2026-12-10 12:00:00',28);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_routes`
--

LOCK TABLES `bus_routes` WRITE;
/*!40000 ALTER TABLE `bus_routes` DISABLE KEYS */;
INSERT INTO `bus_routes` VALUES (1,'Route 1','Ramesh Kumar','9812345001','KA 01 AB 1234'),(2,'Route 2','Suresh Singh','9812345002','KA 01 AB 5678'),(3,'Route 3','Mahesh Yadav','9812345003','KA 01 AB 9012'),(4,'Route 4','Dinesh Sharma','9812345004','KA 01 AB 3456'),(5,'Route 5','Prakash Gowda','9812345005','KA 01 AB 7890'),(6,'Route 6','Ravi Shetty','9812345006','KA 01 AB 2345'),(7,'Route 7','Manjunath Rao','9812345007','KA 01 AB 6789'),(8,'Route 8','Santosh Naik','9812345008','KA 01 AB 1122');
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
  `grade` tinyint NOT NULL,
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
INSERT INTO `fee_structure` VALUES (1,50000.00,50000.00),(2,50000.00,50000.00),(3,55000.00,55000.00),(4,60000.00,60000.00),(5,65000.00,65000.00),(6,70000.00,70000.00),(7,75000.00,75000.00),(8,80000.00,80000.00),(9,85000.00,85000.00),(10,90000.00,90000.00),(11,95000.00,95000.00),(12,100000.00,100000.00);
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
  `grade` tinyint DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  KEY `user_id` (`user_id`),
  KEY `fees_ibfk_2` (`grade`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`User_ID`),
  CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`grade`) REFERENCES `fee_structure` (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (12,1,100000.00,100000.00,'Paid','Paid','2025-04-10','2025-10-08',12),(13,3,100000.00,100000.00,'Paid','Unpaid','2025-04-05',NULL,12),(14,5,75000.00,75000.00,'Paid','Paid','2025-04-12','2025-10-15',7),(15,6,85000.00,85000.00,'Paid','Unpaid','2025-04-03',NULL,9),(16,7,90000.00,90000.00,'Unpaid','Unpaid',NULL,NULL,10),(17,8,95000.00,95000.00,'Paid','Paid','2025-04-07','2025-10-20',11),(18,9,95000.00,95000.00,'Paid','Unpaid',NULL,NULL,11),(19,10,100000.00,100000.00,'Paid','Unpaid','2025-04-15',NULL,12),(20,11,70000.00,70000.00,'Paid','Paid','2025-04-01','2025-10-05',6),(21,12,80000.00,80000.00,'Unpaid','Unpaid',NULL,NULL,8),(22,13,100000.00,100000.00,'Paid','Paid','2025-04-09','2025-10-12',12),(23,26,50000.00,50000.00,'Paid','Paid','2027-04-08','2027-10-11',1),(24,27,50000.00,50000.00,'Paid','Unpaid','2026-04-13',NULL,1),(25,28,50000.00,50000.00,'Unpaid','Unpaid',NULL,NULL,1),(26,29,50000.00,50000.00,'Paid','Paid','2026-04-09','2026-10-15',1),(27,30,50000.00,50000.00,'Paid','Paid','2026-04-05','2026-10-06',1),(28,31,50000.00,50000.00,'Paid','Unpaid','2026-04-18',NULL,1),(29,32,50000.00,50000.00,'Paid','Paid','2026-04-04','2026-10-12',2),(30,33,50000.00,50000.00,'Paid','Paid','2026-04-07','2026-10-14',2),(31,34,50000.00,50000.00,'Paid','Unpaid','2026-04-10',NULL,2),(32,35,50000.00,50000.00,'Unpaid','Unpaid',NULL,NULL,2),(33,36,50000.00,50000.00,'Paid','Paid','2026-04-03','2026-10-08',2),(34,37,50000.00,50000.00,'Paid','Paid','2026-04-16','2026-10-17',2),(35,38,55000.00,55000.00,'Paid','Paid','2026-04-02','2026-10-05',3),(36,39,55000.00,55000.00,'Paid','Paid','2026-04-11','2026-10-19',3),(37,40,55000.00,55000.00,'Paid','Unpaid','2026-04-12',NULL,3),(38,41,55000.00,55000.00,'Paid','Paid','2026-04-06','2026-10-10',3),(39,42,55000.00,55000.00,'Unpaid','Unpaid',NULL,NULL,3),(40,43,55000.00,55000.00,'Paid','Paid','2026-04-14','2026-10-16',3),(41,44,60000.00,60000.00,'Paid','Paid','2026-04-05','2026-10-13',4),(42,45,60000.00,60000.00,'Paid','Paid','2026-04-09','2026-10-18',4),(43,46,60000.00,60000.00,'Paid','Unpaid','2026-04-15',NULL,4),(44,47,60000.00,60000.00,'Paid','Paid','2026-04-03','2026-10-07',4),(45,48,60000.00,60000.00,'Unpaid','Unpaid',NULL,NULL,4),(46,49,60000.00,60000.00,'Paid','Paid','2026-04-17','2026-10-20',4),(47,50,65000.00,65000.00,'Paid','Paid','2026-04-08','2026-10-10',5),(48,51,65000.00,65000.00,'Paid','Unpaid','2026-04-14',NULL,5),(49,52,65000.00,65000.00,'Paid','Paid','2026-04-02','2026-10-09',5),(50,53,65000.00,65000.00,'Paid','Paid','2026-04-12','2026-10-15',5),(51,54,65000.00,65000.00,'Unpaid','Unpaid',NULL,NULL,5),(52,55,65000.00,65000.00,'Paid','Paid','2026-04-18','2026-10-19',5),(53,56,70000.00,70000.00,'Paid','Paid','2026-04-04','2026-10-11',6),(54,57,70000.00,70000.00,'Paid','Paid','2026-04-09','2026-10-16',6),(55,58,70000.00,70000.00,'Paid','Unpaid','2026-04-06',NULL,6),(56,59,70000.00,70000.00,'Paid','Paid','2026-04-13','2026-10-18',6),(57,60,70000.00,70000.00,'Unpaid','Unpaid',NULL,NULL,6),(58,61,70000.00,70000.00,'Paid','Paid','2026-04-15','2026-10-20',6),(59,62,75000.00,75000.00,'Paid','Paid','2026-04-05','2026-10-08',7),(60,63,75000.00,75000.00,'Paid','Paid','2026-04-12','2026-10-17',7),(61,64,75000.00,75000.00,'Paid','Unpaid','2026-04-16',NULL,7),(62,65,75000.00,75000.00,'Paid','Paid','2026-04-03','2026-10-09',7),(63,66,75000.00,75000.00,'Unpaid','Unpaid',NULL,NULL,7),(64,67,75000.00,75000.00,'Paid','Paid','2026-04-10','2026-10-15',7),(65,68,80000.00,80000.00,'Paid','Paid','2026-04-07','2026-10-12',8),(66,69,80000.00,80000.00,'Paid','Unpaid','2026-04-13',NULL,8),(67,70,80000.00,80000.00,'Paid','Paid','2026-04-08','2026-10-18',8),(68,71,80000.00,80000.00,'Paid','Paid','2026-04-05','2026-10-10',8),(69,72,80000.00,80000.00,'Unpaid','Unpaid',NULL,NULL,8),(70,73,80000.00,80000.00,'Paid','Paid','2026-04-15','2026-10-19',8),(71,74,85000.00,85000.00,'Paid','Paid','2026-04-04','2026-10-11',9),(72,75,85000.00,85000.00,'Paid','Paid','2026-04-10','2026-10-16',9),(73,76,85000.00,85000.00,'Paid','Unpaid','2026-04-17',NULL,9),(74,77,85000.00,85000.00,'Paid','Paid','2026-04-02','2026-10-08',9),(75,78,85000.00,85000.00,'Unpaid','Unpaid',NULL,NULL,9),(76,79,85000.00,85000.00,'Paid','Paid','2026-04-14','2026-10-18',9),(77,80,90000.00,90000.00,'Paid','Paid','2026-04-06','2026-10-10',10),(78,81,90000.00,90000.00,'Paid','Paid','2026-04-12','2026-10-17',10),(79,82,90000.00,90000.00,'Paid','Unpaid','2026-04-15',NULL,10),(80,83,90000.00,90000.00,'Paid','Paid','2026-04-03','2026-10-09',10),(81,84,90000.00,90000.00,'Unpaid','Unpaid',NULL,NULL,10),(82,85,90000.00,90000.00,'Paid','Paid','2026-04-18','2026-10-20',10),(83,86,95000.00,95000.00,'Paid','Paid','2026-04-07','2026-10-11',11),(84,87,95000.00,95000.00,'Paid','Unpaid','2026-04-13',NULL,11),(85,88,95000.00,95000.00,'Paid','Paid','2026-04-05','2026-10-15',11),(86,89,95000.00,95000.00,'Paid','Paid','2026-04-10','2026-10-18',11),(87,90,95000.00,95000.00,'Unpaid','Unpaid',NULL,NULL,11),(88,91,95000.00,95000.00,'Paid','Paid','2026-04-16','2026-10-19',11),(89,92,100000.00,100000.00,'Paid','Paid','2026-04-08','2026-10-12',12),(90,93,100000.00,100000.00,'Paid','Unpaid','2026-04-14',NULL,12),(91,94,100000.00,100000.00,'Paid','Paid','2026-04-06','2026-10-16',12),(92,95,100000.00,100000.00,'Paid','Paid','2026-04-12','2026-10-19',12),(93,96,100000.00,100000.00,'Unpaid','Unpaid',NULL,NULL,12),(94,97,100000.00,100000.00,'Paid','Paid','2026-04-17','2026-10-20',12);
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
  `grade` tinyint DEFAULT NULL,
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
INSERT INTO `homework` VALUES (1,1,'Number Patterns','Complete exercises 3.1 to 3.4 from chapter 3',1,'2025-04-07'),(2,1,'Basic Multiplication','Learn tables from 2 to 10 and write them twice',2,'2025-04-07'),(3,1,'Fractions Practice','Solve all problems from page 45 and 46 of textbook',3,'2025-04-08'),(4,2,'Plant Cell Diagram','Draw and label a plant cell diagram neatly in your notebook',3,'2025-04-08'),(5,2,'Food Chains','Write five examples of food chains and draw one',4,'2025-04-09'),(6,2,'States of Matter','Write differences between solids liquids and gases with examples',5,'2025-04-09'),(7,3,'Map Work','Mark all Indian states and capitals on the outline map provided',5,'2025-04-10'),(8,3,'Ancient Civilisations','Write a one page note on the Indus Valley Civilisation',6,'2025-04-10'),(9,4,'Letter Writing','Write a formal letter to your principal requesting a holiday',6,'2025-04-11'),(10,4,'Grammar Exercise','Complete the tense conversion exercises on page 78',7,'2025-04-11'),(11,1,'Algebra Basics','Solve the linear equations from exercise 5.2',7,'2025-04-12'),(12,1,'Geometry','Construct the given triangles using compass and ruler',8,'2025-04-12'),(13,6,'Python Basics','Write a program to print fibonacci series up to 100',8,'2025-04-14'),(14,6,'SQL Queries','Write SELECT queries for the given schema in your practical file',9,'2025-04-14'),(15,7,'Laws of Motion','Solve numericals 1 to 8 from exercise 5 of chapter 3',9,'2025-04-15'),(16,7,'Wave Optics','Write notes on reflection and refraction with ray diagrams',10,'2025-04-15'),(17,8,'Periodic Table','Learn the first 30 elements with symbols and atomic numbers',10,'2025-04-16'),(18,8,'Chemical Bonding','Draw electron dot structures for the given molecules',11,'2025-04-16'),(19,9,'Cell Division','Write differences between mitosis and meiosis with diagrams',11,'2025-04-17'),(20,9,'Genetics','Solve the given monohybrid and dihybrid cross problems',12,'2025-04-17'),(21,18,'Neural Networks','Write a short note on perceptrons and activation functions',11,'2025-04-18'),(22,18,'Machine Learning','List and explain five real world applications of machine learning',12,'2025-04-18'),(23,1,'Inverese trigo','NCERT Examplar',12,'2026-05-19');
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
) ENGINE=InnoDB AUTO_INCREMENT=1171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,1,1,'Term1',94.00,100.00,12),(2,1,4,'Term1',92.00,100.00,12),(3,1,6,'Term1',91.00,100.00,12),(4,1,7,'Term1',89.00,100.00,12),(5,1,8,'Term1',93.00,100.00,12),(6,3,1,'Term1',95.00,100.00,12),(7,3,4,'Term1',94.00,100.00,12),(8,3,6,'Term1',96.00,100.00,12),(9,3,7,'Term1',93.00,100.00,12),(10,3,8,'Term1',97.00,100.00,12),(11,5,1,'Term1',84.00,100.00,7),(12,5,2,'Term1',86.00,100.00,7),(13,5,3,'Term1',82.00,100.00,7),(14,5,4,'Term1',88.00,100.00,7),(15,5,6,'Term1',85.00,100.00,7),(16,5,17,'Term1',87.00,100.00,7),(17,6,1,'Term1',88.00,100.00,9),(18,6,2,'Term1',84.00,100.00,9),(19,6,3,'Term1',86.00,100.00,9),(20,6,4,'Term1',89.00,100.00,9),(21,6,6,'Term1',87.00,100.00,9),(22,6,17,'Term1',85.00,100.00,9),(23,7,1,'Term1',86.00,100.00,10),(24,7,2,'Term1',85.00,100.00,10),(25,7,3,'Term1',84.00,100.00,10),(26,7,4,'Term1',88.00,100.00,10),(27,7,6,'Term1',83.00,100.00,10),(28,7,17,'Term1',87.00,100.00,10),(29,8,1,'Term1',92.00,100.00,11),(30,8,4,'Term1',94.00,100.00,11),(31,8,6,'Term1',91.00,100.00,11),(32,8,7,'Term1',90.00,100.00,11),(33,8,8,'Term1',93.00,100.00,11),(34,9,1,'Term1',88.00,100.00,11),(35,9,4,'Term1',86.00,100.00,11),(36,9,7,'Term1',84.00,100.00,11),(37,9,8,'Term1',87.00,100.00,11),(38,9,18,'Term1',85.00,100.00,11),(39,10,1,'Term1',82.00,100.00,12),(40,10,4,'Term1',84.00,100.00,12),(41,10,7,'Term1',81.00,100.00,12),(42,10,8,'Term1',83.00,100.00,12),(43,10,16,'Term1',80.00,100.00,12),(44,11,1,'Term1',83.00,100.00,6),(45,11,2,'Term1',86.00,100.00,6),(46,11,3,'Term1',82.00,100.00,6),(47,11,4,'Term1',85.00,100.00,6),(48,11,6,'Term1',84.00,100.00,6),(49,11,17,'Term1',87.00,100.00,6),(50,12,1,'Term1',87.00,100.00,8),(51,12,2,'Term1',89.00,100.00,8),(52,12,3,'Term1',86.00,100.00,8),(53,12,4,'Term1',90.00,100.00,8),(54,12,6,'Term1',88.00,100.00,8),(55,12,17,'Term1',87.00,100.00,8),(56,13,4,'Term1',95.00,100.00,12),(57,13,7,'Term1',93.00,100.00,12),(58,13,8,'Term1',94.00,100.00,12),(59,13,9,'Term1',92.00,100.00,12),(60,13,16,'Term1',91.00,100.00,12),(61,26,1,'Term1',88.00,100.00,1),(62,26,2,'Term1',87.00,100.00,1),(63,26,3,'Term1',89.00,100.00,1),(64,26,4,'Term1',90.00,100.00,1),(65,26,6,'Term1',86.00,100.00,1),(66,26,17,'Term1',88.00,100.00,1),(67,27,1,'Term1',91.00,100.00,1),(68,27,2,'Term1',89.00,100.00,1),(69,27,3,'Term1',90.00,100.00,1),(70,27,4,'Term1',92.00,100.00,1),(71,27,6,'Term1',88.00,100.00,1),(72,27,17,'Term1',91.00,100.00,1),(73,28,1,'Term1',84.00,100.00,1),(74,28,2,'Term1',86.00,100.00,1),(75,28,3,'Term1',83.00,100.00,1),(76,28,4,'Term1',87.00,100.00,1),(77,28,6,'Term1',85.00,100.00,1),(78,28,17,'Term1',84.00,100.00,1),(79,29,1,'Term1',88.00,100.00,1),(80,29,2,'Term1',86.00,100.00,1),(81,29,3,'Term1',90.00,100.00,1),(82,29,4,'Term1',89.00,100.00,1),(83,29,6,'Term1',87.00,100.00,1),(84,29,17,'Term1',91.00,100.00,1),(85,30,1,'Term1',84.00,100.00,1),(86,30,2,'Term1',87.00,100.00,1),(87,30,3,'Term1',85.00,100.00,1),(88,30,4,'Term1',88.00,100.00,1),(89,30,6,'Term1',86.00,100.00,1),(90,30,17,'Term1',89.00,100.00,1),(91,31,1,'Term1',92.00,100.00,1),(92,31,2,'Term1',90.00,100.00,1),(93,31,3,'Term1',93.00,100.00,1),(94,31,4,'Term1',91.00,100.00,1),(95,31,6,'Term1',89.00,100.00,1),(96,31,17,'Term1',94.00,100.00,1),(97,32,1,'Term1',86.00,100.00,2),(98,32,2,'Term1',88.00,100.00,2),(99,32,3,'Term1',84.00,100.00,2),(100,32,4,'Term1',87.00,100.00,2),(101,32,6,'Term1',85.00,100.00,2),(102,32,17,'Term1',89.00,100.00,2),(103,33,1,'Term1',90.00,100.00,2),(104,33,2,'Term1',92.00,100.00,2),(105,33,3,'Term1',89.00,100.00,2),(106,33,4,'Term1',91.00,100.00,2),(107,33,6,'Term1',93.00,100.00,2),(108,33,17,'Term1',90.00,100.00,2),(109,34,1,'Term1',82.00,100.00,2),(110,34,2,'Term1',85.00,100.00,2),(111,34,3,'Term1',84.00,100.00,2),(112,34,4,'Term1',86.00,100.00,2),(113,34,6,'Term1',83.00,100.00,2),(114,34,17,'Term1',87.00,100.00,2),(115,35,1,'Term1',94.00,100.00,2),(116,35,2,'Term1',91.00,100.00,2),(117,35,3,'Term1',93.00,100.00,2),(118,35,4,'Term1',95.00,100.00,2),(119,35,6,'Term1',92.00,100.00,2),(120,35,17,'Term1',94.00,100.00,2),(121,36,1,'Term1',87.00,100.00,2),(122,36,2,'Term1',85.00,100.00,2),(123,36,3,'Term1',89.00,100.00,2),(124,36,4,'Term1',88.00,100.00,2),(125,36,6,'Term1',86.00,100.00,2),(126,36,17,'Term1',90.00,100.00,2),(127,37,1,'Term1',91.00,100.00,2),(128,37,2,'Term1',89.00,100.00,2),(129,37,3,'Term1',92.00,100.00,2),(130,37,4,'Term1',90.00,100.00,2),(131,37,6,'Term1',88.00,100.00,2),(132,37,17,'Term1',93.00,100.00,2),(133,38,1,'Term1',85.00,100.00,3),(134,38,2,'Term1',83.00,100.00,3),(135,38,3,'Term1',87.00,100.00,3),(136,38,4,'Term1',86.00,100.00,3),(137,38,6,'Term1',84.00,100.00,3),(138,38,17,'Term1',88.00,100.00,3),(139,39,1,'Term1',93.00,100.00,3),(140,39,2,'Term1',91.00,100.00,3),(141,39,3,'Term1',94.00,100.00,3),(142,39,4,'Term1',92.00,100.00,3),(143,39,6,'Term1',90.00,100.00,3),(144,39,17,'Term1',95.00,100.00,3),(145,40,1,'Term1',88.00,100.00,3),(146,40,2,'Term1',86.00,100.00,3),(147,40,3,'Term1',85.00,100.00,3),(148,40,4,'Term1',89.00,100.00,3),(149,40,6,'Term1',87.00,100.00,3),(150,40,17,'Term1',90.00,100.00,3),(151,41,1,'Term1',90.00,100.00,3),(152,41,2,'Term1',92.00,100.00,3),(153,41,3,'Term1',89.00,100.00,3),(154,41,4,'Term1',91.00,100.00,3),(155,41,6,'Term1',93.00,100.00,3),(156,41,17,'Term1',90.00,100.00,3),(157,42,1,'Term1',83.00,100.00,3),(158,42,2,'Term1',85.00,100.00,3),(159,42,3,'Term1',82.00,100.00,3),(160,42,4,'Term1',86.00,100.00,3),(161,42,6,'Term1',84.00,100.00,3),(162,42,17,'Term1',87.00,100.00,3),(163,43,1,'Term1',96.00,100.00,3),(164,43,2,'Term1',94.00,100.00,3),(165,43,3,'Term1',95.00,100.00,3),(166,43,4,'Term1',93.00,100.00,3),(167,43,6,'Term1',92.00,100.00,3),(168,43,17,'Term1',96.00,100.00,3),(169,44,1,'Term1',89.00,100.00,4),(170,44,2,'Term1',87.00,100.00,4),(171,44,3,'Term1',91.00,100.00,4),(172,44,4,'Term1',88.00,100.00,4),(173,44,6,'Term1',90.00,100.00,4),(174,44,17,'Term1',92.00,100.00,4),(175,45,1,'Term1',94.00,100.00,4),(176,45,2,'Term1',92.00,100.00,4),(177,45,3,'Term1',95.00,100.00,4),(178,45,4,'Term1',93.00,100.00,4),(179,45,6,'Term1',91.00,100.00,4),(180,45,17,'Term1',94.00,100.00,4),(181,46,1,'Term1',84.00,100.00,4),(182,46,2,'Term1',86.00,100.00,4),(183,46,3,'Term1',82.00,100.00,4),(184,46,4,'Term1',87.00,100.00,4),(185,46,6,'Term1',85.00,100.00,4),(186,46,17,'Term1',88.00,100.00,4),(187,47,1,'Term1',91.00,100.00,4),(188,47,2,'Term1',89.00,100.00,4),(189,47,3,'Term1',93.00,100.00,4),(190,47,4,'Term1',90.00,100.00,4),(191,47,6,'Term1',92.00,100.00,4),(192,47,17,'Term1',91.00,100.00,4),(193,48,1,'Term1',86.00,100.00,4),(194,48,2,'Term1',84.00,100.00,4),(195,48,3,'Term1',88.00,100.00,4),(196,48,4,'Term1',85.00,100.00,4),(197,48,6,'Term1',87.00,100.00,4),(198,48,17,'Term1',89.00,100.00,4),(199,49,1,'Term1',96.00,100.00,4),(200,49,2,'Term1',94.00,100.00,4),(201,49,3,'Term1',95.00,100.00,4),(202,49,4,'Term1',97.00,100.00,4),(203,49,6,'Term1',93.00,100.00,4),(204,49,17,'Term1',96.00,100.00,4),(205,50,1,'Term1',88.00,100.00,5),(206,50,2,'Term1',86.00,100.00,5),(207,50,3,'Term1',89.00,100.00,5),(208,50,4,'Term1',87.00,100.00,5),(209,50,6,'Term1',90.00,100.00,5),(210,50,17,'Term1',91.00,100.00,5),(211,51,1,'Term1',92.00,100.00,5),(212,51,2,'Term1',90.00,100.00,5),(213,51,3,'Term1',94.00,100.00,5),(214,51,4,'Term1',91.00,100.00,5),(215,51,6,'Term1',93.00,100.00,5),(216,51,17,'Term1',95.00,100.00,5),(217,52,1,'Term1',83.00,100.00,5),(218,52,2,'Term1',85.00,100.00,5),(219,52,3,'Term1',82.00,100.00,5),(220,52,4,'Term1',86.00,100.00,5),(221,52,6,'Term1',84.00,100.00,5),(222,52,17,'Term1',87.00,100.00,5),(223,53,1,'Term1',90.00,100.00,5),(224,53,2,'Term1',88.00,100.00,5),(225,53,3,'Term1',92.00,100.00,5),(226,53,4,'Term1',89.00,100.00,5),(227,53,6,'Term1',91.00,100.00,5),(228,53,17,'Term1',93.00,100.00,5),(229,54,1,'Term1',85.00,100.00,5),(230,54,2,'Term1',87.00,100.00,5),(231,54,3,'Term1',84.00,100.00,5),(232,54,4,'Term1',88.00,100.00,5),(233,54,6,'Term1',86.00,100.00,5),(234,54,17,'Term1',90.00,100.00,5),(235,55,1,'Term1',95.00,100.00,5),(236,55,2,'Term1',93.00,100.00,5),(237,55,3,'Term1',96.00,100.00,5),(238,55,4,'Term1',94.00,100.00,5),(239,55,6,'Term1',92.00,100.00,5),(240,55,17,'Term1',95.00,100.00,5),(241,56,1,'Term1',87.00,100.00,6),(242,56,2,'Term1',85.00,100.00,6),(243,56,3,'Term1',89.00,100.00,6),(244,56,4,'Term1',86.00,100.00,6),(245,56,6,'Term1',88.00,100.00,6),(246,56,17,'Term1',90.00,100.00,6),(247,57,1,'Term1',93.00,100.00,6),(248,57,2,'Term1',91.00,100.00,6),(249,57,3,'Term1',94.00,100.00,6),(250,57,4,'Term1',92.00,100.00,6),(251,57,6,'Term1',90.00,100.00,6),(252,57,17,'Term1',93.00,100.00,6),(253,58,1,'Term1',81.00,100.00,6),(254,58,2,'Term1',84.00,100.00,6),(255,58,3,'Term1',83.00,100.00,6),(256,58,4,'Term1',85.00,100.00,6),(257,58,6,'Term1',82.00,100.00,6),(258,58,17,'Term1',86.00,100.00,6),(259,59,1,'Term1',89.00,100.00,6),(260,59,2,'Term1',87.00,100.00,6),(261,59,3,'Term1',91.00,100.00,6),(262,59,4,'Term1',88.00,100.00,6),(263,59,6,'Term1',90.00,100.00,6),(264,59,17,'Term1',92.00,100.00,6),(265,60,1,'Term1',84.00,100.00,6),(266,60,2,'Term1',86.00,100.00,6),(267,60,3,'Term1',83.00,100.00,6),(268,60,4,'Term1',87.00,100.00,6),(269,60,6,'Term1',85.00,100.00,6),(270,60,17,'Term1',89.00,100.00,6),(271,61,1,'Term1',93.00,100.00,6),(272,61,2,'Term1',91.00,100.00,6),(273,61,3,'Term1',95.00,100.00,6),(274,61,4,'Term1',92.00,100.00,6),(275,61,6,'Term1',94.00,100.00,6),(276,61,17,'Term1',96.00,100.00,6),(277,62,1,'Term1',88.00,100.00,7),(278,62,2,'Term1',86.00,100.00,7),(279,62,3,'Term1',90.00,100.00,7),(280,62,4,'Term1',87.00,100.00,7),(281,62,6,'Term1',89.00,100.00,7),(282,62,17,'Term1',91.00,100.00,7),(283,63,1,'Term1',94.00,100.00,7),(284,63,2,'Term1',92.00,100.00,7),(285,63,3,'Term1',95.00,100.00,7),(286,63,4,'Term1',93.00,100.00,7),(287,63,6,'Term1',91.00,100.00,7),(288,63,17,'Term1',94.00,100.00,7),(289,64,1,'Term1',82.00,100.00,7),(290,64,2,'Term1',85.00,100.00,7),(291,64,3,'Term1',84.00,100.00,7),(292,64,4,'Term1',86.00,100.00,7),(293,64,6,'Term1',83.00,100.00,7),(294,64,17,'Term1',88.00,100.00,7),(295,65,1,'Term1',90.00,100.00,7),(296,65,2,'Term1',88.00,100.00,7),(297,65,3,'Term1',92.00,100.00,7),(298,65,4,'Term1',89.00,100.00,7),(299,65,6,'Term1',91.00,100.00,7),(300,65,17,'Term1',93.00,100.00,7),(301,66,1,'Term1',85.00,100.00,7),(302,66,2,'Term1',83.00,100.00,7),(303,66,3,'Term1',87.00,100.00,7),(304,66,4,'Term1',84.00,100.00,7),(305,66,6,'Term1',86.00,100.00,7),(306,66,17,'Term1',89.00,100.00,7),(307,67,1,'Term1',96.00,100.00,7),(308,67,2,'Term1',94.00,100.00,7),(309,67,3,'Term1',95.00,100.00,7),(310,67,4,'Term1',97.00,100.00,7),(311,67,6,'Term1',93.00,100.00,7),(312,67,17,'Term1',96.00,100.00,7),(313,68,1,'Term1',87.00,100.00,8),(314,68,2,'Term1',85.00,100.00,8),(315,68,3,'Term1',89.00,100.00,8),(316,68,4,'Term1',86.00,100.00,8),(317,68,6,'Term1',88.00,100.00,8),(318,68,17,'Term1',90.00,100.00,8),(319,69,1,'Term1',92.00,100.00,8),(320,69,2,'Term1',90.00,100.00,8),(321,69,3,'Term1',94.00,100.00,8),(322,69,4,'Term1',91.00,100.00,8),(323,69,6,'Term1',93.00,100.00,8),(324,69,17,'Term1',95.00,100.00,8),(325,70,1,'Term1',83.00,100.00,8),(326,70,2,'Term1',86.00,100.00,8),(327,70,3,'Term1',82.00,100.00,8),(328,70,4,'Term1',85.00,100.00,8),(329,70,6,'Term1',84.00,100.00,8),(330,70,17,'Term1',88.00,100.00,8),(331,71,1,'Term1',90.00,100.00,8),(332,71,2,'Term1',89.00,100.00,8),(333,71,3,'Term1',92.00,100.00,8),(334,71,4,'Term1',91.00,100.00,8),(335,71,6,'Term1',90.00,100.00,8),(336,71,17,'Term1',93.00,100.00,8),(337,72,1,'Term1',86.00,100.00,8),(338,72,2,'Term1',84.00,100.00,8),(339,72,3,'Term1',88.00,100.00,8),(340,72,4,'Term1',85.00,100.00,8),(341,72,6,'Term1',87.00,100.00,8),(342,72,17,'Term1',89.00,100.00,8),(343,73,1,'Term1',95.00,100.00,8),(344,73,2,'Term1',93.00,100.00,8),(345,73,3,'Term1',96.00,100.00,8),(346,73,4,'Term1',94.00,100.00,8),(347,73,6,'Term1',92.00,100.00,8),(348,73,17,'Term1',95.00,100.00,8),(349,74,1,'Term1',88.00,100.00,9),(350,74,2,'Term1',86.00,100.00,9),(351,74,3,'Term1',90.00,100.00,9),(352,74,4,'Term1',87.00,100.00,9),(353,74,6,'Term1',89.00,100.00,9),(354,74,17,'Term1',91.00,100.00,9),(355,75,1,'Term1',94.00,100.00,9),(356,75,2,'Term1',92.00,100.00,9),(357,75,3,'Term1',95.00,100.00,9),(358,75,4,'Term1',93.00,100.00,9),(359,75,6,'Term1',91.00,100.00,9),(360,75,17,'Term1',94.00,100.00,9),(361,76,1,'Term1',83.00,100.00,9),(362,76,2,'Term1',85.00,100.00,9),(363,76,3,'Term1',82.00,100.00,9),(364,76,4,'Term1',86.00,100.00,9),(365,76,6,'Term1',84.00,100.00,9),(366,76,17,'Term1',88.00,100.00,9),(367,77,1,'Term1',90.00,100.00,9),(368,77,2,'Term1',88.00,100.00,9),(369,77,3,'Term1',92.00,100.00,9),(370,77,4,'Term1',89.00,100.00,9),(371,77,6,'Term1',91.00,100.00,9),(372,77,17,'Term1',93.00,100.00,9),(373,78,1,'Term1',85.00,100.00,9),(374,78,2,'Term1',83.00,100.00,9),(375,78,3,'Term1',87.00,100.00,9),(376,78,4,'Term1',84.00,100.00,9),(377,78,6,'Term1',86.00,100.00,9),(378,78,17,'Term1',89.00,100.00,9),(379,79,1,'Term1',96.00,100.00,9),(380,79,2,'Term1',94.00,100.00,9),(381,79,3,'Term1',95.00,100.00,9),(382,79,4,'Term1',97.00,100.00,9),(383,79,6,'Term1',93.00,100.00,9),(384,79,17,'Term1',96.00,100.00,9),(385,80,1,'Term1',87.00,100.00,10),(386,80,2,'Term1',85.00,100.00,10),(387,80,3,'Term1',89.00,100.00,10),(388,80,4,'Term1',86.00,100.00,10),(389,80,6,'Term1',88.00,100.00,10),(390,80,17,'Term1',90.00,100.00,10),(391,81,1,'Term1',92.00,100.00,10),(392,81,2,'Term1',90.00,100.00,10),(393,81,3,'Term1',94.00,100.00,10),(394,81,4,'Term1',91.00,100.00,10),(395,81,6,'Term1',93.00,100.00,10),(396,81,17,'Term1',95.00,100.00,10),(397,82,1,'Term1',84.00,100.00,10),(398,82,2,'Term1',86.00,100.00,10),(399,82,3,'Term1',83.00,100.00,10),(400,82,4,'Term1',87.00,100.00,10),(401,82,6,'Term1',85.00,100.00,10),(402,82,17,'Term1',88.00,100.00,10),(403,83,1,'Term1',91.00,100.00,10),(404,83,2,'Term1',89.00,100.00,10),(405,83,3,'Term1',93.00,100.00,10),(406,83,4,'Term1',90.00,100.00,10),(407,83,6,'Term1',92.00,100.00,10),(408,83,17,'Term1',91.00,100.00,10),(409,84,1,'Term1',82.00,100.00,10),(410,84,2,'Term1',84.00,100.00,10),(411,84,3,'Term1',81.00,100.00,10),(412,84,4,'Term1',85.00,100.00,10),(413,84,6,'Term1',83.00,100.00,10),(414,84,17,'Term1',87.00,100.00,10),(415,85,1,'Term1',95.00,100.00,10),(416,85,2,'Term1',93.00,100.00,10),(417,85,3,'Term1',96.00,100.00,10),(418,85,4,'Term1',94.00,100.00,10),(419,85,6,'Term1',92.00,100.00,10),(420,85,17,'Term1',95.00,100.00,10),(421,86,1,'Term1',91.00,100.00,11),(422,86,4,'Term1',89.00,100.00,11),(423,86,6,'Term1',93.00,100.00,11),(424,86,7,'Term1',90.00,100.00,11),(425,86,8,'Term1',92.00,100.00,11),(426,87,1,'Term1',94.00,100.00,11),(427,87,4,'Term1',92.00,100.00,11),(428,87,7,'Term1',95.00,100.00,11),(429,87,8,'Term1',93.00,100.00,11),(430,87,18,'Term1',91.00,100.00,11),(431,88,1,'Term1',86.00,100.00,11),(432,88,4,'Term1',88.00,100.00,11),(433,88,7,'Term1',84.00,100.00,11),(434,88,8,'Term1',87.00,100.00,11),(435,88,16,'Term1',89.00,100.00,11),(436,89,4,'Term1',93.00,100.00,11),(437,89,7,'Term1',95.00,100.00,11),(438,89,8,'Term1',92.00,100.00,11),(439,89,9,'Term1',94.00,100.00,11),(440,89,16,'Term1',96.00,100.00,11),(441,90,1,'Term1',88.00,100.00,11),(442,90,4,'Term1',86.00,100.00,11),(443,90,6,'Term1',90.00,100.00,11),(444,90,7,'Term1',87.00,100.00,11),(445,90,8,'Term1',89.00,100.00,11),(446,91,1,'Term1',97.00,100.00,11),(447,91,4,'Term1',95.00,100.00,11),(448,91,7,'Term1',96.00,100.00,11),(449,91,8,'Term1',94.00,100.00,11),(450,91,18,'Term1',97.00,100.00,11),(451,92,1,'Term1',93.00,100.00,12),(452,92,4,'Term1',91.00,100.00,12),(453,92,6,'Term1',94.00,100.00,12),(454,92,7,'Term1',92.00,100.00,12),(455,92,8,'Term1',95.00,100.00,12),(456,93,1,'Term1',96.00,100.00,12),(457,93,4,'Term1',94.00,100.00,12),(458,93,7,'Term1',97.00,100.00,12),(459,93,8,'Term1',95.00,100.00,12),(460,93,18,'Term1',93.00,100.00,12),(461,94,1,'Term1',88.00,100.00,12),(462,94,4,'Term1',90.00,100.00,12),(463,94,7,'Term1',86.00,100.00,12),(464,94,8,'Term1',89.00,100.00,12),(465,94,16,'Term1',91.00,100.00,12),(466,95,4,'Term1',94.00,100.00,12),(467,95,7,'Term1',96.00,100.00,12),(468,95,8,'Term1',93.00,100.00,12),(469,95,9,'Term1',95.00,100.00,12),(470,95,16,'Term1',97.00,100.00,12),(471,96,1,'Term1',87.00,100.00,12),(472,96,4,'Term1',85.00,100.00,12),(473,96,6,'Term1',89.00,100.00,12),(474,96,7,'Term1',86.00,100.00,12),(475,96,8,'Term1',88.00,100.00,12),(476,97,1,'Term1',92.00,100.00,12),(477,97,4,'Term1',90.00,100.00,12),(478,97,7,'Term1',94.00,100.00,12),(479,97,8,'Term1',93.00,100.00,12),(480,97,18,'Term1',91.00,100.00,12),(601,1,1,'Term2',96.00,100.00,12),(602,1,4,'Term2',94.00,100.00,12),(603,1,6,'Term2',93.00,100.00,12),(604,1,7,'Term2',92.00,100.00,12),(605,1,8,'Term2',95.00,100.00,12),(606,3,1,'Term2',97.00,100.00,12),(607,3,4,'Term2',96.00,100.00,12),(608,3,6,'Term2',98.00,100.00,12),(609,3,7,'Term2',95.00,100.00,12),(610,3,8,'Term2',99.00,100.00,12),(611,5,1,'Term2',87.00,100.00,7),(612,5,2,'Term2',89.00,100.00,7),(613,5,3,'Term2',85.00,100.00,7),(614,5,4,'Term2',91.00,100.00,7),(615,5,6,'Term2',88.00,100.00,7),(616,5,17,'Term2',90.00,100.00,7),(617,6,1,'Term2',91.00,100.00,9),(618,6,2,'Term2',87.00,100.00,9),(619,6,3,'Term2',89.00,100.00,9),(620,6,4,'Term2',92.00,100.00,9),(621,6,6,'Term2',90.00,100.00,9),(622,6,17,'Term2',88.00,100.00,9),(623,7,1,'Term2',89.00,100.00,10),(624,7,2,'Term2',88.00,100.00,10),(625,7,3,'Term2',87.00,100.00,10),(626,7,4,'Term2',91.00,100.00,10),(627,7,6,'Term2',86.00,100.00,10),(628,7,17,'Term2',90.00,100.00,10),(629,8,1,'Term2',94.00,100.00,11),(630,8,4,'Term2',96.00,100.00,11),(631,8,6,'Term2',93.00,100.00,11),(632,8,7,'Term2',92.00,100.00,11),(633,8,8,'Term2',95.00,100.00,11),(634,9,1,'Term2',91.00,100.00,11),(635,9,4,'Term2',89.00,100.00,11),(636,9,7,'Term2',87.00,100.00,11),(637,9,8,'Term2',90.00,100.00,11),(638,9,18,'Term2',88.00,100.00,11),(639,10,1,'Term2',86.00,100.00,12),(640,10,4,'Term2',88.00,100.00,12),(641,10,7,'Term2',85.00,100.00,12),(642,10,8,'Term2',87.00,100.00,12),(643,10,16,'Term2',84.00,100.00,12),(644,11,1,'Term2',86.00,100.00,6),(645,11,2,'Term2',89.00,100.00,6),(646,11,3,'Term2',85.00,100.00,6),(647,11,4,'Term2',88.00,100.00,6),(648,11,6,'Term2',87.00,100.00,6),(649,11,17,'Term2',90.00,100.00,6),(650,12,1,'Term2',90.00,100.00,8),(651,12,2,'Term2',92.00,100.00,8),(652,12,3,'Term2',89.00,100.00,8),(653,12,4,'Term2',93.00,100.00,8),(654,12,6,'Term2',91.00,100.00,8),(655,12,17,'Term2',90.00,100.00,8),(656,13,4,'Term2',97.00,100.00,12),(657,13,7,'Term2',95.00,100.00,12),(658,13,8,'Term2',96.00,100.00,12),(659,13,9,'Term2',94.00,100.00,12),(660,13,16,'Term2',93.00,100.00,12),(661,26,1,'Term2',90.00,100.00,1),(662,26,2,'Term2',89.00,100.00,1),(663,26,3,'Term2',91.00,100.00,1),(664,26,4,'Term2',92.00,100.00,1),(665,26,6,'Term2',89.00,100.00,1),(666,26,17,'Term2',92.00,100.00,1),(667,27,1,'Term2',93.00,100.00,1),(668,27,2,'Term2',91.00,100.00,1),(669,27,3,'Term2',92.00,100.00,1),(670,27,4,'Term2',94.00,100.00,1),(671,27,6,'Term2',90.00,100.00,1),(672,27,17,'Term2',93.00,100.00,1),(673,28,1,'Term2',87.00,100.00,1),(674,28,2,'Term2',89.00,100.00,1),(675,28,3,'Term2',86.00,100.00,1),(676,28,4,'Term2',90.00,100.00,1),(677,28,6,'Term2',88.00,100.00,1),(678,28,17,'Term2',87.00,100.00,1),(679,29,1,'Term2',90.00,100.00,1),(680,29,2,'Term2',88.00,100.00,1),(681,29,3,'Term2',92.00,100.00,1),(682,29,4,'Term2',91.00,100.00,1),(683,29,6,'Term2',89.00,100.00,1),(684,29,17,'Term2',93.00,100.00,1),(685,30,1,'Term2',87.00,100.00,1),(686,30,2,'Term2',89.00,100.00,1),(687,30,3,'Term2',88.00,100.00,1),(688,30,4,'Term2',91.00,100.00,1),(689,30,6,'Term2',89.00,100.00,1),(690,30,17,'Term2',92.00,100.00,1),(691,31,1,'Term2',94.00,100.00,1),(692,31,2,'Term2',92.00,100.00,1),(693,31,3,'Term2',95.00,100.00,1),(694,31,4,'Term2',93.00,100.00,1),(695,31,6,'Term2',92.00,100.00,1),(696,31,17,'Term2',96.00,100.00,1),(697,32,1,'Term2',89.00,100.00,2),(698,32,2,'Term2',91.00,100.00,2),(699,32,3,'Term2',87.00,100.00,2),(700,32,4,'Term2',90.00,100.00,2),(701,32,6,'Term2',88.00,100.00,2),(702,32,17,'Term2',92.00,100.00,2),(703,33,1,'Term2',93.00,100.00,2),(704,33,2,'Term2',95.00,100.00,2),(705,33,3,'Term2',92.00,100.00,2),(706,33,4,'Term2',94.00,100.00,2),(707,33,6,'Term2',96.00,100.00,2),(708,33,17,'Term2',93.00,100.00,2),(709,34,1,'Term2',85.00,100.00,2),(710,34,2,'Term2',88.00,100.00,2),(711,34,3,'Term2',87.00,100.00,2),(712,34,4,'Term2',89.00,100.00,2),(713,34,6,'Term2',86.00,100.00,2),(714,34,17,'Term2',90.00,100.00,2),(715,35,1,'Term2',96.00,100.00,2),(716,35,2,'Term2',94.00,100.00,2),(717,35,3,'Term2',95.00,100.00,2),(718,35,4,'Term2',97.00,100.00,2),(719,35,6,'Term2',95.00,100.00,2),(720,35,17,'Term2',96.00,100.00,2),(721,36,1,'Term2',90.00,100.00,2),(722,36,2,'Term2',88.00,100.00,2),(723,36,3,'Term2',92.00,100.00,2),(724,36,4,'Term2',91.00,100.00,2),(725,36,6,'Term2',89.00,100.00,2),(726,36,17,'Term2',93.00,100.00,2),(727,37,1,'Term2',94.00,100.00,2),(728,37,2,'Term2',92.00,100.00,2),(729,37,3,'Term2',95.00,100.00,2),(730,37,4,'Term2',93.00,100.00,2),(731,37,6,'Term2',91.00,100.00,2),(732,37,17,'Term2',96.00,100.00,2),(733,38,1,'Term2',88.00,100.00,3),(734,38,2,'Term2',86.00,100.00,3),(735,38,3,'Term2',90.00,100.00,3),(736,38,4,'Term2',89.00,100.00,3),(737,38,6,'Term2',87.00,100.00,3),(738,38,17,'Term2',91.00,100.00,3),(739,39,1,'Term2',95.00,100.00,3),(740,39,2,'Term2',93.00,100.00,3),(741,39,3,'Term2',96.00,100.00,3),(742,39,4,'Term2',94.00,100.00,3),(743,39,6,'Term2',92.00,100.00,3),(744,39,17,'Term2',97.00,100.00,3),(745,40,1,'Term2',91.00,100.00,3),(746,40,2,'Term2',89.00,100.00,3),(747,40,3,'Term2',88.00,100.00,3),(748,40,4,'Term2',92.00,100.00,3),(749,40,6,'Term2',90.00,100.00,3),(750,40,17,'Term2',93.00,100.00,3),(751,41,1,'Term2',93.00,100.00,3),(752,41,2,'Term2',95.00,100.00,3),(753,41,3,'Term2',92.00,100.00,3),(754,41,4,'Term2',94.00,100.00,3),(755,41,6,'Term2',96.00,100.00,3),(756,41,17,'Term2',93.00,100.00,3),(757,42,1,'Term2',86.00,100.00,3),(758,42,2,'Term2',88.00,100.00,3),(759,42,3,'Term2',85.00,100.00,3),(760,42,4,'Term2',89.00,100.00,3),(761,42,6,'Term2',87.00,100.00,3),(762,42,17,'Term2',90.00,100.00,3),(763,43,1,'Term2',98.00,100.00,3),(764,43,2,'Term2',96.00,100.00,3),(765,43,3,'Term2',97.00,100.00,3),(766,43,4,'Term2',95.00,100.00,3),(767,43,6,'Term2',94.00,100.00,3),(768,43,17,'Term2',98.00,100.00,3),(769,29,1,'Term2',90.00,100.00,1),(770,29,2,'Term2',88.00,100.00,1),(771,29,3,'Term2',92.00,100.00,1),(772,29,4,'Term2',91.00,100.00,1),(773,29,6,'Term2',89.00,100.00,1),(774,29,17,'Term2',93.00,100.00,1),(775,30,1,'Term2',87.00,100.00,1),(776,30,2,'Term2',89.00,100.00,1),(777,30,3,'Term2',88.00,100.00,1),(778,30,4,'Term2',91.00,100.00,1),(779,30,6,'Term2',89.00,100.00,1),(780,30,17,'Term2',92.00,100.00,1),(781,31,1,'Term2',94.00,100.00,1),(782,31,2,'Term2',92.00,100.00,1),(783,31,3,'Term2',95.00,100.00,1),(784,31,4,'Term2',93.00,100.00,1),(785,31,6,'Term2',92.00,100.00,1),(786,31,17,'Term2',96.00,100.00,1),(787,32,1,'Term2',89.00,100.00,2),(788,32,2,'Term2',91.00,100.00,2),(789,32,3,'Term2',87.00,100.00,2),(790,32,4,'Term2',90.00,100.00,2),(791,32,6,'Term2',88.00,100.00,2),(792,32,17,'Term2',92.00,100.00,2),(793,33,1,'Term2',93.00,100.00,2),(794,33,2,'Term2',95.00,100.00,2),(795,33,3,'Term2',92.00,100.00,2),(796,33,4,'Term2',94.00,100.00,2),(797,33,6,'Term2',96.00,100.00,2),(798,33,17,'Term2',93.00,100.00,2),(799,34,1,'Term2',85.00,100.00,2),(800,34,2,'Term2',88.00,100.00,2),(801,34,3,'Term2',87.00,100.00,2),(802,34,4,'Term2',89.00,100.00,2),(803,34,6,'Term2',86.00,100.00,2),(804,34,17,'Term2',90.00,100.00,2),(805,35,1,'Term2',96.00,100.00,2),(806,35,2,'Term2',94.00,100.00,2),(807,35,3,'Term2',95.00,100.00,2),(808,35,4,'Term2',97.00,100.00,2),(809,35,6,'Term2',95.00,100.00,2),(810,35,17,'Term2',96.00,100.00,2),(811,36,1,'Term2',90.00,100.00,2),(812,36,2,'Term2',88.00,100.00,2),(813,36,3,'Term2',92.00,100.00,2),(814,36,4,'Term2',91.00,100.00,2),(815,36,6,'Term2',89.00,100.00,2),(816,36,17,'Term2',93.00,100.00,2),(817,37,1,'Term2',94.00,100.00,2),(818,37,2,'Term2',92.00,100.00,2),(819,37,3,'Term2',95.00,100.00,2),(820,37,4,'Term2',93.00,100.00,2),(821,37,6,'Term2',91.00,100.00,2),(822,37,17,'Term2',96.00,100.00,2),(823,38,1,'Term2',88.00,100.00,3),(824,38,2,'Term2',86.00,100.00,3),(825,38,3,'Term2',90.00,100.00,3),(826,38,4,'Term2',89.00,100.00,3),(827,38,6,'Term2',87.00,100.00,3),(828,38,17,'Term2',91.00,100.00,3),(829,39,1,'Term2',95.00,100.00,3),(830,39,2,'Term2',93.00,100.00,3),(831,39,3,'Term2',96.00,100.00,3),(832,39,4,'Term2',94.00,100.00,3),(833,39,6,'Term2',92.00,100.00,3),(834,39,17,'Term2',97.00,100.00,3),(835,40,1,'Term2',91.00,100.00,3),(836,40,2,'Term2',89.00,100.00,3),(837,40,3,'Term2',88.00,100.00,3),(838,40,4,'Term2',92.00,100.00,3),(839,40,6,'Term2',90.00,100.00,3),(840,40,17,'Term2',93.00,100.00,3),(841,41,1,'Term2',93.00,100.00,3),(842,41,2,'Term2',95.00,100.00,3),(843,41,3,'Term2',92.00,100.00,3),(844,41,4,'Term2',94.00,100.00,3),(845,41,6,'Term2',96.00,100.00,3),(846,41,17,'Term2',93.00,100.00,3),(847,42,1,'Term2',86.00,100.00,3),(848,42,2,'Term2',88.00,100.00,3),(849,42,3,'Term2',85.00,100.00,3),(850,42,4,'Term2',89.00,100.00,3),(851,42,6,'Term2',87.00,100.00,3),(852,42,17,'Term2',90.00,100.00,3),(853,43,1,'Term2',98.00,100.00,3),(854,43,2,'Term2',96.00,100.00,3),(855,43,3,'Term2',97.00,100.00,3),(856,43,4,'Term2',95.00,100.00,3),(857,43,6,'Term2',94.00,100.00,3),(858,43,17,'Term2',98.00,100.00,3),(859,44,1,'Term2',92.00,100.00,4),(860,44,2,'Term2',90.00,100.00,4),(861,44,3,'Term2',94.00,100.00,4),(862,44,4,'Term2',91.00,100.00,4),(863,44,6,'Term2',93.00,100.00,4),(864,44,17,'Term2',95.00,100.00,4),(865,45,1,'Term2',96.00,100.00,4),(866,45,2,'Term2',94.00,100.00,4),(867,45,3,'Term2',97.00,100.00,4),(868,45,4,'Term2',95.00,100.00,4),(869,45,6,'Term2',93.00,100.00,4),(870,45,17,'Term2',96.00,100.00,4),(871,46,1,'Term2',87.00,100.00,4),(872,46,2,'Term2',89.00,100.00,4),(873,46,3,'Term2',85.00,100.00,4),(874,46,4,'Term2',90.00,100.00,4),(875,46,6,'Term2',88.00,100.00,4),(876,46,17,'Term2',91.00,100.00,4),(877,47,1,'Term2',94.00,100.00,4),(878,47,2,'Term2',92.00,100.00,4),(879,47,3,'Term2',96.00,100.00,4),(880,47,4,'Term2',93.00,100.00,4),(881,47,6,'Term2',95.00,100.00,4),(882,47,17,'Term2',94.00,100.00,4),(883,48,1,'Term2',89.00,100.00,4),(884,48,2,'Term2',87.00,100.00,4),(885,48,3,'Term2',91.00,100.00,4),(886,48,4,'Term2',88.00,100.00,4),(887,48,6,'Term2',90.00,100.00,4),(888,48,17,'Term2',92.00,100.00,4),(889,49,1,'Term2',98.00,100.00,4),(890,49,2,'Term2',96.00,100.00,4),(891,49,3,'Term2',97.00,100.00,4),(892,49,4,'Term2',99.00,100.00,4),(893,49,6,'Term2',95.00,100.00,4),(894,49,17,'Term2',98.00,100.00,4),(895,50,1,'Term2',91.00,100.00,5),(896,50,2,'Term2',89.00,100.00,5),(897,50,3,'Term2',92.00,100.00,5),(898,50,4,'Term2',90.00,100.00,5),(899,50,6,'Term2',93.00,100.00,5),(900,50,17,'Term2',94.00,100.00,5),(901,51,1,'Term2',95.00,100.00,5),(902,51,2,'Term2',93.00,100.00,5),(903,51,3,'Term2',97.00,100.00,5),(904,51,4,'Term2',94.00,100.00,5),(905,51,6,'Term2',96.00,100.00,5),(906,51,17,'Term2',98.00,100.00,5),(907,52,1,'Term2',86.00,100.00,5),(908,52,2,'Term2',88.00,100.00,5),(909,52,3,'Term2',85.00,100.00,5),(910,52,4,'Term2',89.00,100.00,5),(911,52,6,'Term2',87.00,100.00,5),(912,52,17,'Term2',90.00,100.00,5),(913,53,1,'Term2',93.00,100.00,5),(914,53,2,'Term2',91.00,100.00,5),(915,53,3,'Term2',95.00,100.00,5),(916,53,4,'Term2',92.00,100.00,5),(917,53,6,'Term2',94.00,100.00,5),(918,53,17,'Term2',96.00,100.00,5),(919,54,1,'Term2',88.00,100.00,5),(920,54,2,'Term2',90.00,100.00,5),(921,54,3,'Term2',87.00,100.00,5),(922,54,4,'Term2',91.00,100.00,5),(923,54,6,'Term2',89.00,100.00,5),(924,54,17,'Term2',93.00,100.00,5),(925,55,1,'Term2',97.00,100.00,5),(926,55,2,'Term2',95.00,100.00,5),(927,55,3,'Term2',98.00,100.00,5),(928,55,4,'Term2',96.00,100.00,5),(929,55,6,'Term2',94.00,100.00,5),(930,55,17,'Term2',97.00,100.00,5),(931,56,1,'Term2',90.00,100.00,6),(932,56,2,'Term2',88.00,100.00,6),(933,56,3,'Term2',92.00,100.00,6),(934,56,4,'Term2',89.00,100.00,6),(935,56,6,'Term2',91.00,100.00,6),(936,56,17,'Term2',93.00,100.00,6),(937,57,1,'Term2',96.00,100.00,6),(938,57,2,'Term2',94.00,100.00,6),(939,57,3,'Term2',97.00,100.00,6),(940,57,4,'Term2',95.00,100.00,6),(941,57,6,'Term2',93.00,100.00,6),(942,57,17,'Term2',96.00,100.00,6),(943,58,1,'Term2',84.00,100.00,6),(944,58,2,'Term2',87.00,100.00,6),(945,58,3,'Term2',86.00,100.00,6),(946,58,4,'Term2',88.00,100.00,6),(947,58,6,'Term2',85.00,100.00,6),(948,58,17,'Term2',89.00,100.00,6),(949,59,1,'Term2',92.00,100.00,6),(950,59,2,'Term2',90.00,100.00,6),(951,59,3,'Term2',94.00,100.00,6),(952,59,4,'Term2',91.00,100.00,6),(953,59,6,'Term2',93.00,100.00,6),(954,59,17,'Term2',95.00,100.00,6),(955,60,1,'Term2',87.00,100.00,6),(956,60,2,'Term2',89.00,100.00,6),(957,60,3,'Term2',86.00,100.00,6),(958,60,4,'Term2',90.00,100.00,6),(959,60,6,'Term2',88.00,100.00,6),(960,60,17,'Term2',92.00,100.00,6),(961,61,1,'Term2',96.00,100.00,6),(962,61,2,'Term2',94.00,100.00,6),(963,61,3,'Term2',98.00,100.00,6),(964,61,4,'Term2',95.00,100.00,6),(965,61,6,'Term2',97.00,100.00,6),(966,61,17,'Term2',99.00,100.00,6),(967,62,1,'Term2',91.00,100.00,7),(968,62,2,'Term2',89.00,100.00,7),(969,62,3,'Term2',93.00,100.00,7),(970,62,4,'Term2',90.00,100.00,7),(971,62,6,'Term2',92.00,100.00,7),(972,62,17,'Term2',94.00,100.00,7),(973,63,1,'Term2',96.00,100.00,7),(974,63,2,'Term2',94.00,100.00,7),(975,63,3,'Term2',97.00,100.00,7),(976,63,4,'Term2',95.00,100.00,7),(977,63,6,'Term2',93.00,100.00,7),(978,63,17,'Term2',96.00,100.00,7),(979,64,1,'Term2',85.00,100.00,7),(980,64,2,'Term2',88.00,100.00,7),(981,64,3,'Term2',87.00,100.00,7),(982,64,4,'Term2',89.00,100.00,7),(983,64,6,'Term2',86.00,100.00,7),(984,64,17,'Term2',90.00,100.00,7),(985,65,1,'Term2',93.00,100.00,7),(986,65,2,'Term2',91.00,100.00,7),(987,65,3,'Term2',95.00,100.00,7),(988,65,4,'Term2',92.00,100.00,7),(989,65,6,'Term2',94.00,100.00,7),(990,65,17,'Term2',96.00,100.00,7),(991,66,1,'Term2',88.00,100.00,7),(992,66,2,'Term2',86.00,100.00,7),(993,66,3,'Term2',90.00,100.00,7),(994,66,4,'Term2',87.00,100.00,7),(995,66,6,'Term2',89.00,100.00,7),(996,66,17,'Term2',92.00,100.00,7),(997,67,1,'Term2',98.00,100.00,7),(998,67,2,'Term2',96.00,100.00,7),(999,67,3,'Term2',97.00,100.00,7),(1000,67,4,'Term2',99.00,100.00,7),(1001,67,6,'Term2',95.00,100.00,7),(1002,67,17,'Term2',98.00,100.00,7),(1003,68,1,'Term2',90.00,100.00,8),(1004,68,2,'Term2',88.00,100.00,8),(1005,68,3,'Term2',92.00,100.00,8),(1006,68,4,'Term2',89.00,100.00,8),(1007,68,6,'Term2',91.00,100.00,8),(1008,68,17,'Term2',93.00,100.00,8),(1009,69,1,'Term2',95.00,100.00,8),(1010,69,2,'Term2',93.00,100.00,8),(1011,69,3,'Term2',97.00,100.00,8),(1012,69,4,'Term2',94.00,100.00,8),(1013,69,6,'Term2',96.00,100.00,8),(1014,69,17,'Term2',98.00,100.00,8),(1015,70,1,'Term2',86.00,100.00,8),(1016,70,2,'Term2',89.00,100.00,8),(1017,70,3,'Term2',85.00,100.00,8),(1018,70,4,'Term2',88.00,100.00,8),(1019,70,6,'Term2',87.00,100.00,8),(1020,70,17,'Term2',91.00,100.00,8),(1021,71,1,'Term2',93.00,100.00,8),(1022,71,2,'Term2',91.00,100.00,8),(1023,71,3,'Term2',95.00,100.00,8),(1024,71,4,'Term2',94.00,100.00,8),(1025,71,6,'Term2',92.00,100.00,8),(1026,71,17,'Term2',96.00,100.00,8),(1027,72,1,'Term2',89.00,100.00,8),(1028,72,2,'Term2',87.00,100.00,8),(1029,72,3,'Term2',91.00,100.00,8),(1030,72,4,'Term2',88.00,100.00,8),(1031,72,6,'Term2',90.00,100.00,8),(1032,72,17,'Term2',92.00,100.00,8),(1033,73,1,'Term2',98.00,100.00,8),(1034,73,2,'Term2',96.00,100.00,8),(1035,73,3,'Term2',99.00,100.00,8),(1036,73,4,'Term2',97.00,100.00,8),(1037,73,6,'Term2',95.00,100.00,8),(1038,73,17,'Term2',98.00,100.00,8),(1039,74,1,'Term2',91.00,100.00,9),(1040,74,2,'Term2',89.00,100.00,9),(1041,74,3,'Term2',93.00,100.00,9),(1042,74,4,'Term2',90.00,100.00,9),(1043,74,6,'Term2',92.00,100.00,9),(1044,74,17,'Term2',94.00,100.00,9),(1045,75,1,'Term2',96.00,100.00,9),(1046,75,2,'Term2',94.00,100.00,9),(1047,75,3,'Term2',97.00,100.00,9),(1048,75,4,'Term2',95.00,100.00,9),(1049,75,6,'Term2',93.00,100.00,9),(1050,75,17,'Term2',96.00,100.00,9),(1051,76,1,'Term2',86.00,100.00,9),(1052,76,2,'Term2',88.00,100.00,9),(1053,76,3,'Term2',85.00,100.00,9),(1054,76,4,'Term2',89.00,100.00,9),(1055,76,6,'Term2',87.00,100.00,9),(1056,76,17,'Term2',91.00,100.00,9),(1057,77,1,'Term2',93.00,100.00,9),(1058,77,2,'Term2',91.00,100.00,9),(1059,77,3,'Term2',95.00,100.00,9),(1060,77,4,'Term2',92.00,100.00,9),(1061,77,6,'Term2',94.00,100.00,9),(1062,77,17,'Term2',96.00,100.00,9),(1063,78,1,'Term2',88.00,100.00,9),(1064,78,2,'Term2',86.00,100.00,9),(1065,78,3,'Term2',90.00,100.00,9),(1066,78,4,'Term2',87.00,100.00,9),(1067,78,6,'Term2',89.00,100.00,9),(1068,78,17,'Term2',92.00,100.00,9),(1069,79,1,'Term2',98.00,100.00,9),(1070,79,2,'Term2',96.00,100.00,9),(1071,79,3,'Term2',97.00,100.00,9),(1072,79,4,'Term2',99.00,100.00,9),(1073,79,6,'Term2',95.00,100.00,9),(1074,79,17,'Term2',98.00,100.00,9),(1075,80,1,'Term2',90.00,100.00,10),(1076,80,2,'Term2',88.00,100.00,10),(1077,80,3,'Term2',92.00,100.00,10),(1078,80,4,'Term2',89.00,100.00,10),(1079,80,6,'Term2',91.00,100.00,10),(1080,80,17,'Term2',93.00,100.00,10),(1081,81,1,'Term2',95.00,100.00,10),(1082,81,2,'Term2',93.00,100.00,10),(1083,81,3,'Term2',97.00,100.00,10),(1084,81,4,'Term2',94.00,100.00,10),(1085,81,6,'Term2',96.00,100.00,10),(1086,81,17,'Term2',98.00,100.00,10),(1087,82,1,'Term2',87.00,100.00,10),(1088,82,2,'Term2',89.00,100.00,10),(1089,82,3,'Term2',86.00,100.00,10),(1090,82,4,'Term2',90.00,100.00,10),(1091,82,6,'Term2',88.00,100.00,10),(1092,82,17,'Term2',91.00,100.00,10),(1093,83,1,'Term2',94.00,100.00,10),(1094,83,2,'Term2',92.00,100.00,10),(1095,83,3,'Term2',96.00,100.00,10),(1096,83,4,'Term2',93.00,100.00,10),(1097,83,6,'Term2',95.00,100.00,10),(1098,83,17,'Term2',94.00,100.00,10),(1099,84,1,'Term2',85.00,100.00,10),(1100,84,2,'Term2',87.00,100.00,10),(1101,84,3,'Term2',84.00,100.00,10),(1102,84,4,'Term2',88.00,100.00,10),(1103,84,6,'Term2',86.00,100.00,10),(1104,84,17,'Term2',90.00,100.00,10),(1105,85,1,'Term2',97.00,100.00,10),(1106,85,2,'Term2',95.00,100.00,10),(1107,85,3,'Term2',98.00,100.00,10),(1108,85,4,'Term2',96.00,100.00,10),(1109,85,6,'Term2',94.00,100.00,10),(1110,85,17,'Term2',97.00,100.00,10),(1111,86,1,'Term2',94.00,100.00,11),(1112,86,4,'Term2',92.00,100.00,11),(1113,86,6,'Term2',95.00,100.00,11),(1114,86,7,'Term2',94.00,100.00,11),(1115,86,8,'Term2',97.00,100.00,11),(1116,87,1,'Term2',96.00,100.00,11),(1117,87,4,'Term2',94.00,100.00,11),(1118,87,7,'Term2',97.00,100.00,11),(1119,87,8,'Term2',96.00,100.00,11),(1120,87,18,'Term2',94.00,100.00,11),(1121,88,1,'Term2',89.00,100.00,11),(1122,88,4,'Term2',91.00,100.00,11),(1123,88,7,'Term2',87.00,100.00,11),(1124,88,8,'Term2',90.00,100.00,11),(1125,88,16,'Term2',93.00,100.00,11),(1126,89,4,'Term2',96.00,100.00,11),(1127,89,7,'Term2',97.00,100.00,11),(1128,89,8,'Term2',95.00,100.00,11),(1129,89,9,'Term2',97.00,100.00,11),(1130,89,16,'Term2',98.00,100.00,11),(1131,90,1,'Term2',91.00,100.00,11),(1132,90,4,'Term2',89.00,100.00,11),(1133,90,6,'Term2',92.00,100.00,11),(1134,90,7,'Term2',90.00,100.00,11),(1135,90,8,'Term2',92.00,100.00,11),(1136,91,1,'Term2',98.00,100.00,11),(1137,91,4,'Term2',97.00,100.00,11),(1138,91,7,'Term2',99.00,100.00,11),(1139,91,8,'Term2',97.00,100.00,11),(1140,91,18,'Term2',98.00,100.00,11),(1141,92,1,'Term2',95.00,100.00,12),(1142,92,4,'Term2',93.00,100.00,12),(1143,92,6,'Term2',96.00,100.00,12),(1144,92,7,'Term2',94.00,100.00,12),(1145,92,8,'Term2',97.00,100.00,12),(1146,93,1,'Term2',98.00,100.00,12),(1147,93,4,'Term2',96.00,100.00,12),(1148,93,7,'Term2',99.00,100.00,12),(1149,93,8,'Term2',97.00,100.00,12),(1150,93,18,'Term2',95.00,100.00,12),(1151,94,1,'Term2',90.00,100.00,12),(1152,94,4,'Term2',92.00,100.00,12),(1153,94,7,'Term2',89.00,100.00,12),(1154,94,8,'Term2',91.00,100.00,12),(1155,94,16,'Term2',93.00,100.00,12),(1156,95,4,'Term2',96.00,100.00,12),(1157,95,7,'Term2',98.00,100.00,12),(1158,95,8,'Term2',96.00,100.00,12),(1159,95,9,'Term2',97.00,100.00,12),(1160,95,16,'Term2',99.00,100.00,12),(1161,96,1,'Term2',89.00,100.00,12),(1162,96,4,'Term2',87.00,100.00,12),(1163,96,6,'Term2',91.00,100.00,12),(1164,96,7,'Term2',88.00,100.00,12),(1165,96,8,'Term2',90.00,100.00,12),(1166,97,1,'Term2',94.00,100.00,12),(1167,97,4,'Term2',92.00,100.00,12),(1168,97,7,'Term2',96.00,100.00,12),(1169,97,8,'Term2',95.00,100.00,12),(1170,97,18,'Term2',93.00,100.00,12);
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
  `grade` tinyint DEFAULT NULL,
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
INSERT INTO `student_details` VALUES (1,'SM1','Adriyan',12,'B',2),(3,'SM2','Harsh S Nair',12,'B',2),(5,'SM4','Aarav Mehta',7,'A',1),(6,'SM5','Diya Nair',9,'B',1),(7,'SM6','Kabir Singh',10,'A',1),(8,'SM7','Ishita Verma',11,'A',2),(9,'SM8','Rohan Das',11,'B',3),(10,'SM9','Meera Kapoor',12,'C',4),(11,'SM10','Aditya Rao',6,'B',1),(12,'SM11','Sneha Patil',8,'C',1),(13,'SM12','Yash Gupta',12,'A',5),(26,'SM13','Aarush Sharma',1,'A',1),(27,'SM14','Ananya Nair',1,'A',1),(28,'SM15','Vivaan Gupta',1,'A',1),(29,'SM16','Ishita Rao',1,'B',1),(30,'SM17','Reyansh Mehta',1,'B',1),(31,'SM18','Kiara Kapoor',1,'B',1),(32,'SM19','Arjun Verma',2,'A',1),(33,'SM20','Myra Joshi',2,'A',1),(34,'SM21','Vihaan Reddy',2,'A',1),(35,'SM22','Aadhya Singh',2,'B',1),(36,'SM23','Shaurya Iyer',2,'B',1),(37,'SM24','Siya Kulkarni',2,'B',1),(38,'SM25','Dhruv Patil',3,'A',1),(39,'SM26','Riya Menon',3,'A',1),(40,'SM27','Atharv Desai',3,'A',1),(41,'SM28','Anika Pillai',3,'B',1),(42,'SM29','Krish Malhotra',3,'B',1),(43,'SM30','Avni Sinha',3,'B',1),(44,'SM31','Advik Bansal',4,'A',1),(45,'SM32','Meera Choudhary',4,'A',1),(46,'SM33','Rudra Nair',4,'A',1),(47,'SM34','Tanvi Sharma',4,'B',1),(48,'SM35','Laksh Gupta',4,'B',1),(49,'SM36','Pari Khanna',4,'B',1),(50,'SM37','Yuvan Jain',5,'A',1),(51,'SM38','Navya Reddy',5,'A',1),(52,'SM39','Kabir Kapoor',5,'A',1),(53,'SM40','Aanya Verma',5,'B',1),(54,'SM41','Aryan Nair',5,'B',1),(55,'SM42','Sara Iyer',5,'B',1),(56,'SM43','Dev Malhotra',6,'A',1),(57,'SM44','Anvi Sharma',6,'A',1),(58,'SM45','Rohan Kulkarni',6,'A',1),(59,'SM46','Diya Gupta',6,'B',1),(60,'SM47','Vedant Rao',6,'B',1),(61,'SM48','Ira Mehta',6,'B',1),(62,'SM49','Harshith Nair',7,'A',1),(63,'SM50','Prisha Singh',7,'A',1),(64,'SM51','Kunal Reddy',7,'A',1),(65,'SM52','Aisha Kapoor',7,'B',1),(66,'SM53','Nikhil Verma',7,'B',1),(67,'SM54','Mahi Joshi',7,'B',1),(68,'SM55','Siddharth Sharma',8,'A',1),(69,'SM56','Kashvi Patel',8,'A',1),(70,'SM57','Ayaan Gupta',8,'A',1),(71,'SM58','Ritika Nair',8,'B',1),(72,'SM59','Devansh Iyer',8,'B',1),(73,'SM60','Saanvi Rao',8,'B',1),(74,'SM61','Yash Malhotra',9,'A',1),(75,'SM62','Anushka Mehta',9,'A',1),(76,'SM63','Vihaan Sharma',9,'A',1),(77,'SM64','Tanya Kapoor',9,'B',1),(78,'SM65','Rishabh Verma',9,'B',1),(79,'SM66','Nandini Singh',9,'B',1),(80,'SM67','Aditya Kulkarni',10,'A',1),(81,'SM68','Khushi Nair',10,'A',1),(82,'SM69','Arnav Gupta',10,'A',1),(83,'SM70','Pooja Sharma',10,'B',1),(84,'SM71','Rahul Reddy',10,'B',1),(85,'SM72','Sneha Menon',10,'B',1),(86,'SM73','Rohan Iyer',11,'A',2),(87,'SM74','Aditi Sharma',11,'A',3),(88,'SM75','Karthik Rao',11,'A',4),(89,'SM76','Nisha Gupta',11,'B',5),(90,'SM77','Arjun Menon',11,'B',2),(91,'SM78','Diya Kapoor',11,'B',3),(92,'SM79','Harsh Patel',12,'A',2),(93,'SM80','Ananya Verma',12,'A',3),(94,'SM81','Ritik Sharma',12,'A',4),(95,'SM82','Sakshi Nair',12,'B',5),(96,'SM83','Aman Gupta',12,'B',2),(97,'SM84','Pallavi Rao',12,'B',3);
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
INSERT INTO `teacher_details` VALUES (9,'TC011','Rahul Deshmukh','1,2',1),(10,'TC012','Megha Kapoor','3,4,5',2),(11,'TC013','Ajay Reddy','6,7,8',3),(12,'TC014','Pooja Sharma','9,10',4),(13,'TC015','Nitin Verma','11,12',6),(16,'TC001','Priya Sharma','1,2,3',1),(17,'TC002','Ramesh Iyer','3,4,5',2),(18,'TC003','Sunita Menon','5,6',3),(19,'TC004','Arvind Kulkarni','6,7',4),(20,'TC005','Deepa Nair','7,8',1),(21,'TC006','Karan Mehta','8,9',6),(22,'TC007','Anjali Singh','9,10',7),(23,'TC008','Vikash Pandey','10,11',8),(24,'TC009','Neha Joshi','11,12',9),(25,'TC010','Suresh Pillai','11,12',18),(98,'TC016','Anita Iyer','1,2,3',5),(99,'TC017','Sandeep Nair','4,5,6',17),(100,'TC018','Rohit Kulkarni','7,8,9',1),(101,'TC019','Shalini Gupta','7,8,9',6),(102,'TC020','Vivek Menon','9,10,11,12',7),(103,'TC021','Kavita Rao','9,10,11,12',8),(104,'TC022','Manoj Singh','11,12',9),(105,'TC023','Deepika Joshi','11,12',18),(106,'TC024','Ashish Patel','9,10,11,12',16),(107,'TC025','Sneha Bhat','6,7,8',4);
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
INSERT INTO `transport_details` VALUES (1,'Private','Rajesh Sharma','9876543210',NULL),(3,'Bus',NULL,NULL,4),(5,'Bus',NULL,NULL,2),(6,'Private','Suresh Nair','9845612378',NULL),(7,'Bus',NULL,NULL,1),(8,'Private','Anita Verma','9812345678',NULL),(9,'Bus',NULL,NULL,3),(10,'Bus',NULL,NULL,2),(11,'Private','Ramesh Rao','9867452310',NULL),(12,'Bus',NULL,NULL,1),(13,'Private','Vikram Gupta','9823456789',NULL),(26,'Bus',NULL,NULL,1),(27,'Private','Kiran Sharma','9876501001',NULL),(28,'Bus',NULL,NULL,2),(29,'Bus',NULL,NULL,1),(30,'Private','Rajiv Mehta','9876501002',NULL),(31,'Bus',NULL,NULL,3),(32,'Bus',NULL,NULL,2),(33,'Bus',NULL,NULL,1),(34,'Private','Vijay Reddy','9876501003',NULL),(35,'Bus',NULL,NULL,4),(36,'Bus',NULL,NULL,3),(37,'Private','Anil Iyer','9876501004',NULL),(38,'Bus',NULL,NULL,5),(39,'Private','Ramesh Menon','9876501005',NULL),(40,'Bus',NULL,NULL,2),(41,'Bus',NULL,NULL,5),(42,'Private','Sanjay Malhotra','9876501006',NULL),(43,'Bus',NULL,NULL,1),(44,'Bus',NULL,NULL,6),(45,'Private','Amit Choudhary','9876501007',NULL),(46,'Bus',NULL,NULL,3),(47,'Bus',NULL,NULL,6),(48,'Private','Rohit Gupta','9876501008',NULL),(49,'Bus',NULL,NULL,4),(50,'Bus',NULL,NULL,7),(51,'Private','Suresh Reddy','9876501009',NULL),(52,'Bus',NULL,NULL,5),(53,'Bus',NULL,NULL,7),(54,'Private','Naveen Nair','9876501010',NULL),(55,'Bus',NULL,NULL,2),(56,'Bus',NULL,NULL,8),(57,'Private','Mahesh Sharma','9876501011',NULL),(58,'Bus',NULL,NULL,6),(59,'Bus',NULL,NULL,8),(60,'Private','Pradeep Rao','9876501012',NULL),(61,'Bus',NULL,NULL,3),(62,'Bus',NULL,NULL,1),(63,'Private','Raghav Singh','9876501013',NULL),(64,'Bus',NULL,NULL,7),(65,'Bus',NULL,NULL,2),(66,'Private','Vinod Verma','9876501014',NULL),(67,'Bus',NULL,NULL,5),(68,'Bus',NULL,NULL,3),(69,'Private','Harish Patel','9876501015',NULL),(70,'Bus',NULL,NULL,8),(71,'Bus',NULL,NULL,4),(72,'Private','Mohan Iyer','9876501016',NULL),(73,'Bus',NULL,NULL,6),(74,'Bus',NULL,NULL,5),(75,'Private','Arvind Mehta','9876501017',NULL),(76,'Bus',NULL,NULL,1),(77,'Bus',NULL,NULL,7),(78,'Private','Deepak Kapoor','9876501018',NULL),(79,'Bus',NULL,NULL,2),(80,'Bus',NULL,NULL,8),(81,'Private','Sandeep Nair','9876501019',NULL),(82,'Bus',NULL,NULL,3),(83,'Bus',NULL,NULL,6),(84,'Private','Vikram Reddy','9876501020',NULL),(85,'Bus',NULL,NULL,4),(86,'Bus',NULL,NULL,5),(87,'Private','Ajith Sharma','9876501021',NULL),(88,'Bus',NULL,NULL,7),(89,'Bus',NULL,NULL,1),(90,'Private','Kishore Gupta','9876501022',NULL),(91,'Bus',NULL,NULL,8),(92,'Bus',NULL,NULL,6),(93,'Private','Ravi Verma','9876501023',NULL),(94,'Bus',NULL,NULL,2),(95,'Bus',NULL,NULL,7),(96,'Private','Nitin Rao','9876501024',NULL),(97,'Bus',NULL,NULL,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'Atrium','Student'),(2,'Harman070209','Student'),(3,'Chikoo070209','Student'),(4,'first','Teacher'),(5,'stud1','Student'),(6,'stud2','Student'),(7,'stud3','Student'),(8,'stud4','Student'),(9,'teach1','Student'),(10,'teach2','Student'),(11,'teach3','Student'),(12,'tchr01','Student'),(13,'tchr02','Student'),(14,'stud5','Student'),(15,'admin1','Admin'),(16,'Teacher@123','Teacher'),(17,'Teacher@123','Teacher'),(18,'Teacher@123','Teacher'),(19,'Teacher@123','Teacher'),(20,'Teacher@123','Teacher'),(21,'Teacher@123','Teacher'),(22,'Teacher@123','Teacher'),(23,'Teacher@123','Teacher'),(24,'Teacher@123','Teacher'),(25,'Teacher@123','Teacher'),(26,'stud13','Student'),(27,'stud14','Student'),(28,'stud15','Student'),(29,'stud16','Student'),(30,'stud17','Student'),(31,'stud18','Student'),(32,'stud19','Student'),(33,'stud20','Student'),(34,'stud21','Student'),(35,'stud22','Student'),(36,'stud23','Student'),(37,'stud24','Student'),(38,'stud25','Student'),(39,'stud26','Student'),(40,'stud27','Student'),(41,'stud28','Student'),(42,'stud29','Student'),(43,'stud30','Student'),(44,'stud31','Student'),(45,'stud32','Student'),(46,'stud33','Student'),(47,'stud34','Student'),(48,'stud35','Student'),(49,'stud36','Student'),(50,'stud37','Student'),(51,'stud38','Student'),(52,'stud39','Student'),(53,'stud40','Student'),(54,'stud41','Student'),(55,'stud42','Student'),(56,'stud43','Student'),(57,'stud44','Student'),(58,'stud45','Student'),(59,'stud46','Student'),(60,'stud47','Student'),(61,'stud48','Student'),(62,'stud49','Student'),(63,'stud50','Student'),(64,'stud51','Student'),(65,'stud52','Student'),(66,'stud53','Student'),(67,'stud54','Student'),(68,'stud55','Student'),(69,'stud56','Student'),(70,'stud57','Student'),(71,'stud58','Student'),(72,'stud59','Student'),(73,'stud60','Student'),(74,'stud61','Student'),(75,'stud62','Student'),(76,'stud63','Student'),(77,'stud64','Student'),(78,'stud65','Student'),(79,'stud66','Student'),(80,'stud67','Student'),(81,'stud68','Student'),(82,'stud69','Student'),(83,'stud70','Student'),(84,'stud71','Student'),(85,'stud72','Student'),(86,'stud73','Student'),(87,'stud74','Student'),(88,'stud75','Student'),(89,'stud76','Student'),(90,'stud77','Student'),(91,'stud78','Student'),(92,'stud79','Student'),(93,'stud80','Student'),(94,'stud81','Student'),(95,'stud82','Student'),(96,'stud83','Student'),(97,'stud84','Student'),(98,'teach11','Teacher'),(99,'teach12','Teacher'),(100,'teach13','Teacher'),(101,'teach14','Teacher'),(102,'teach15','Teacher'),(103,'teach16','Teacher'),(104,'teach17','Teacher'),(105,'teach18','Teacher'),(106,'teach19','Teacher'),(107,'teach20','Teacher');
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

-- Dump completed on 2026-08-19 18:35:42
