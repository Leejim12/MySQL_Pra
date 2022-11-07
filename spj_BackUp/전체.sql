-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 10.125.121.242    Database: pnusw01db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `num` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `id` varchar(10) NOT NULL,
  `postdate` timestamp NOT NULL,
  `visitcount` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `board_mem_fk` (`id`),
  CONSTRAINT `board_mem_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`),
  CONSTRAINT `board_men_fk` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j`
--

DROP TABLE IF EXISTS `j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `j` (
  `jno` char(4) NOT NULL,
  `jname` char(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  PRIMARY KEY (`jno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j`
--

LOCK TABLES `j` WRITE;
/*!40000 ALTER TABLE `j` DISABLE KEYS */;
INSERT INTO `j` VALUES ('J1','Sorter','Paris'),('J2','Display','Rome'),('J3','OCR','Athens'),('J4','Console','Athens'),('J5','RAID','London'),('J6','EDS','Oslo'),('J7','Tape','London');
/*!40000 ALTER TABLE `j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` varchar(10) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `regidate` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p`
--

DROP TABLE IF EXISTS `p`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p` (
  `pno` char(4) NOT NULL,
  `pname` char(10) NOT NULL,
  `color` char(10) NOT NULL,
  `weight` double NOT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`pno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p`
--

LOCK TABLES `p` WRITE;
/*!40000 ALTER TABLE `p` DISABLE KEYS */;
INSERT INTO `p` VALUES ('P1','Nut','Red',12,'London'),('P2','Bolt','Green',17,'Paris'),('P3','Screw','Blue',17,'Oslo'),('P4','Screw','Red',14,'London'),('P5','Cam','Blue',12,'Paris'),('P6','Cog','Red',19,'London');
/*!40000 ALTER TABLE `p` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s`
--

DROP TABLE IF EXISTS `s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s` (
  `sno` char(4) NOT NULL,
  `sname` char(10) NOT NULL,
  `status` int NOT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s`
--

LOCK TABLES `s` WRITE;
/*!40000 ALTER TABLE `s` DISABLE KEYS */;
INSERT INTO `s` VALUES ('s1','Smith',20,'London'),('s2','Jones',10,'Paris'),('s3','Blakes',30,'Paris'),('s4','Clark',20,'London'),('s5','Adams',30,'Athens');
/*!40000 ALTER TABLE `s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spj`
--

DROP TABLE IF EXISTS `spj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spj` (
  `sno` char(4) NOT NULL,
  `pno` char(4) NOT NULL,
  `jno` char(4) NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spj`
--

LOCK TABLES `spj` WRITE;
/*!40000 ALTER TABLE `spj` DISABLE KEYS */;
INSERT INTO `spj` VALUES ('S1','P1','J1',200),('S1','P1','J4',700),('S2','P3','J1',400),('S2','P3','J2',200),('S2','P3','J3',200),('S2','P3','J4',500),('S2','P3','J5',600),('S2','P3','J6',400),('S2','P3','J7',800),('S2','P5','J2',100),('S3','P3','J1',200),('S3','P4','J2',500),('S4','P6','J3',300),('S4','P6','J7',300),('S5','P2','J2',200),('S5','P2','J4',100),('S5','P5','J5',500),('S5','P5','J7',100),('S5','P6','J2',200),('S5','P1','J4',100),('S5','P3','J4',200),('S5','P4','J4',800),('S5','P5','J4',400),('S5','P6','J4',500),('S10','P1','J4',300),('S5','P1','J4',300);
/*!40000 ALTER TABLE `spj` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-02 16:23:47
