-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: submit_221109
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `강사`
--

DROP TABLE IF EXISTS `강사`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `강사` (
  `강사번호` int NOT NULL,
  `이름` varchar(45) NOT NULL,
  `나이` varchar(45) NOT NULL,
  `성별` varchar(45) NOT NULL,
  PRIMARY KEY (`강사번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `강사`
--

LOCK TABLES `강사` WRITE;
/*!40000 ALTER TABLE `강사` DISABLE KEYS */;
/*!40000 ALTER TABLE `강사` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `강의`
--

DROP TABLE IF EXISTS `강의`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `강의` (
  `시간` int DEFAULT NULL,
  `장소` varchar(45) DEFAULT NULL,
  `강사번호` int DEFAULT NULL,
  `과목번호` int DEFAULT NULL,
  KEY `fk_강의_강사_idx` (`강사번호`),
  KEY `fk_강의_과목1_idx` (`과목번호`),
  CONSTRAINT `fk_강의_강사` FOREIGN KEY (`강사번호`) REFERENCES `강사` (`강사번호`),
  CONSTRAINT `fk_강의_과목1` FOREIGN KEY (`과목번호`) REFERENCES `과목` (`과목번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `강의`
--

LOCK TABLES `강의` WRITE;
/*!40000 ALTER TABLE `강의` DISABLE KEYS */;
/*!40000 ALTER TABLE `강의` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `과목`
--

DROP TABLE IF EXISTS `과목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `과목` (
  `과목번호` int NOT NULL,
  `과목명` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`과목번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `과목`
--

LOCK TABLES `과목` WRITE;
/*!40000 ALTER TABLE `과목` DISABLE KEYS */;
/*!40000 ALTER TABLE `과목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `수업`
--

DROP TABLE IF EXISTS `수업`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `수업` (
  `과목번호` int DEFAULT NULL,
  `학번` int DEFAULT NULL,
  KEY `fk_수업_과목1_idx` (`과목번호`),
  KEY `fk_수업_학생1_idx` (`학번`),
  CONSTRAINT `fk_수업_과목1` FOREIGN KEY (`과목번호`) REFERENCES `과목` (`과목번호`),
  CONSTRAINT `fk_수업_학생1` FOREIGN KEY (`학번`) REFERENCES `학생` (`학번`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `수업`
--

LOCK TABLES `수업` WRITE;
/*!40000 ALTER TABLE `수업` DISABLE KEYS */;
/*!40000 ALTER TABLE `수업` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `학생`
--

DROP TABLE IF EXISTS `학생`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `학생` (
  `학번` int NOT NULL,
  `이름` varchar(45) DEFAULT NULL,
  `주소` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`학번`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `학생`
--

LOCK TABLES `학생` WRITE;
/*!40000 ALTER TABLE `학생` DISABLE KEYS */;
/*!40000 ALTER TABLE `학생` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 17:32:00
