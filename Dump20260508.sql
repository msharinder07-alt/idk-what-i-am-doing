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
  `subject` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `employee_code` (`employee_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_details`
--

LOCK TABLES `teacher_details` WRITE;
/*!40000 ALTER TABLE `teacher_details` DISABLE KEYS */;
INSERT INTO `teacher_details` VALUES (4,'EM1','Ms. Sonali Sharma','XII','Economics');
/*!40000 ALTER TABLE `teacher_details` ENABLE KEYS */;
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
  `Role` enum('Student','Teacher') NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'Atrium','Student'),(2,'Harman070209','Student'),(3,'Chikoo070209','Student'),(4,'first','Teacher'),(5,'stud1','Student'),(6,'stud2','Student'),(7,'stud3','Student'),(8,'stud4','Student'),(9,'teach1','Teacher'),(10,'teach2','Teacher'),(11,'teach3','Teacher'),(12,'tchr01','Teacher'),(13,'tchr02','Teacher'),(14,'stud5','Student');
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

-- Dump completed on 2026-05-08 23:50:30
