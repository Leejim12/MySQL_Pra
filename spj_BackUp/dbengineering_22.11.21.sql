-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbengineering
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
-- Table structure for table `과목`
--

DROP TABLE IF EXISTS `과목`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `과목` (
  `과목번호` char(6) NOT NULL,
  `과목명` char(50) NOT NULL,
  `영문명` char(50) NOT NULL,
  `담당교수` char(7) NOT NULL,
  `학점` int NOT NULL,
  `시수` int NOT NULL,
  `이수구분` enum('교양','전공') NOT NULL,
  `학기` enum('1','여름','2','겨울') NOT NULL,
  `학년` enum('1','2','3','4') NOT NULL,
  `설명` text,
  PRIMARY KEY (`과목번호`),
  KEY `담당교수` (`담당교수`),
  CONSTRAINT `과목_ibfk_1` FOREIGN KEY (`담당교수`) REFERENCES `교수` (`사번`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `과목`
--

LOCK TABLES `과목` WRITE;
/*!40000 ALTER TABLE `과목` DISABLE KEYS */;
INSERT INTO `과목` VALUES ('K20002','컴퓨터네트워크','Computer Network','1000001',2,2,'전공','1','1','컴퓨터 네트워크에 대한 기본적 이해'),('K20012','정보보호개론','Introduction to Infromation Protection','1000001',4,3,'전공','2','1','정보보호 기술과 솔루션에 대한 기본적 이해'),('K20013','인터넷프로그래밍','Internet Programming','1000001',3,4,'전공','2','1','HTML과 CSS에 대한 학습'),('K20023','프로그래밍언어','Programming Language','1000002',4,4,'전공','2','1','프로그래밍 언어의 기본 원리'),('K20033','데이터베이스','Database','1000002',3,3,'전공','2','1','데이터 모델링 SQL 언어 습득'),('K20035','운영체제','Operating System','1000004',3,3,'전공','2','1','운영체제의 주요 역할 이해'),('K20045','컴퓨터소프트웨어개론','Introduction to Computer Software','1000002',3,3,'전공','1','1','컴퓨터 소프트웨어에 대한 기본적 이해'),('K20056','컴퓨터활용','Computer Practical Use','1000003',2,3,'전공','1','1','컴퓨터 활용에 대한 기본적 이해'),('K20077','컴퓨터개론','Introduction to Computer','1000004',3,3,'전공','1','1','컴퓨터에 대한 기본적 이해'),('Y00132','의사소통능력','Communication Skills','1000004',1,1,'교양','2','1','의사소통능력과 대인관계능력 계발');
/*!40000 ALTER TABLE `과목` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `교수`
--

DROP TABLE IF EXISTS `교수`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `교수` (
  `사번` char(7) NOT NULL,
  `이름` char(20) NOT NULL,
  `학과` char(2) NOT NULL,
  `전자우편` char(50) NOT NULL,
  `전화번호` char(20) DEFAULT NULL,
  PRIMARY KEY (`사번`),
  KEY `학과` (`학과`),
  CONSTRAINT `교수_ibfk_1` FOREIGN KEY (`학과`) REFERENCES `학과` (`학과번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `교수`
--

LOCK TABLES `교수` WRITE;
/*!40000 ALTER TABLE `교수` DISABLE KEYS */;
INSERT INTO `교수` VALUES ('1000001','김교수','01','kim@school.ac.kr','010-000-0001'),('1000002','이교수','01','lee@school.ac.kr','010-000-0002'),('1000003','박교수','01','park@school.ac.kr','010-000-0003'),('1000004','최교수','01','choi@school.ac.kr',NULL),('1000005','한교수','04','han@school.ac.kr',NULL);
/*!40000 ALTER TABLE `교수` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `교수별담당과목`
--

DROP TABLE IF EXISTS `교수별담당과목`;
/*!50001 DROP VIEW IF EXISTS `교수별담당과목`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `교수별담당과목` AS SELECT 
 1 AS `사번`,
 1 AS `이름`,
 1 AS `학과명`,
 1 AS `과목수`,
 1 AS `학점수`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `교수정보`
--

DROP TABLE IF EXISTS `교수정보`;
/*!50001 DROP VIEW IF EXISTS `교수정보`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `교수정보` AS SELECT 
 1 AS `사번`,
 1 AS `이름`,
 1 AS `학과`,
 1 AS `학과명`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `담당교과`
--

DROP TABLE IF EXISTS `담당교과`;
/*!50001 DROP VIEW IF EXISTS `담당교과`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `담당교과` AS SELECT 
 1 AS `사번`,
 1 AS `이름`,
 1 AS `학과명`,
 1 AS `과목명`,
 1 AS `학점`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `수강신청`
--

DROP TABLE IF EXISTS `수강신청`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `수강신청` (
  `수강신청번호` char(7) NOT NULL,
  `학번` char(7) NOT NULL,
  `날짜` datetime NOT NULL,
  `연도` char(4) NOT NULL,
  `학기` enum('1','여름','2','겨울') NOT NULL,
  PRIMARY KEY (`수강신청번호`),
  KEY `학번` (`학번`),
  CONSTRAINT `수강신청_ibfk_1` FOREIGN KEY (`학번`) REFERENCES `학생` (`학번`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `수강신청`
--

LOCK TABLES `수강신청` WRITE;
/*!40000 ALTER TABLE `수강신청` DISABLE KEYS */;
INSERT INTO `수강신청` VALUES ('1610001','1601001','2016-03-02 00:00:00','2016','1'),('1610002','1601002','2016-03-01 00:00:00','2016','1'),('1810001','1801001','2018-03-02 00:00:00','2018','1'),('1810002','1801002','2018-03-02 00:00:00','2018','1'),('1810003','1804003','2018-03-01 00:00:00','2018','1'),('1820001','1801001','2018-08-28 00:00:00','2018','2'),('1820002','1601001','2018-08-29 00:00:00','2018','2'),('1820003','1801002','2018-08-25 00:00:00','2018','2'),('1820004','1601002','2018-08-26 00:00:00','2018','2'),('1820005','1804003','2018-08-27 00:00:00','2018','2'),('1820006','1601001','2022-11-17 00:00:00','2020','2');
/*!40000 ALTER TABLE `수강신청` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `수강신청내역`
--

DROP TABLE IF EXISTS `수강신청내역`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `수강신청내역` (
  `수강신청번호` char(7) NOT NULL,
  `일련번호` int NOT NULL,
  `과목번호` char(6) NOT NULL,
  `평점` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`수강신청번호`,`일련번호`),
  KEY `과목번호` (`과목번호`),
  CONSTRAINT `수강신청내역_ibfk_1` FOREIGN KEY (`수강신청번호`) REFERENCES `수강신청` (`수강신청번호`),
  CONSTRAINT `수강신청내역_ibfk_2` FOREIGN KEY (`과목번호`) REFERENCES `과목` (`과목번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `수강신청내역`
--

LOCK TABLES `수강신청내역` WRITE;
/*!40000 ALTER TABLE `수강신청내역` DISABLE KEYS */;
INSERT INTO `수강신청내역` VALUES ('1610001',1,'K20045',3),('1610001',2,'K20056',3),('1610001',3,'K20077',3),('1610002',1,'K20045',4),('1610002',2,'K20056',3),('1610002',3,'K20077',0),('1810001',1,'K20002',4),('1810001',2,'K20045',0),('1810001',3,'K20056',4),('1810002',1,'K20077',0),('1810002',2,'K20002',2),('1810002',3,'K20045',3),('1810003',1,'K20077',1),('1810003',2,'K20002',3),('1810003',3,'K20045',1),('1820001',1,'K20012',-1),('1820001',2,'K20013',-1),('1820001',3,'K20023',-1),('1820002',1,'K20013',-1),('1820002',2,'K20023',-1),('1820002',3,'K20033',-1),('1820003',1,'K20033',-1),('1820003',2,'K20035',-1),('1820003',3,'K20012',-1),('1820003',4,'Y00132',-1),('1820004',1,'K20012',-1),('1820004',2,'K20012',-1),('1820004',3,'K20023',-1),('1820005',1,'K20023',-1),('1820005',2,'K20033',-1),('1820005',3,'K20035',-1),('1820005',4,'K20012',-1),('1820005',5,'Y00132',-1);
/*!40000 ALTER TABLE `수강신청내역` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `학과`
--

DROP TABLE IF EXISTS `학과`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `학과` (
  `학과번호` char(2) NOT NULL,
  `학과명` char(20) NOT NULL,
  `전화번호` char(20) NOT NULL,
  PRIMARY KEY (`학과번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `학과`
--

LOCK TABLES `학과` WRITE;
/*!40000 ALTER TABLE `학과` DISABLE KEYS */;
INSERT INTO `학과` VALUES ('01','컴퓨터정보학과','022-200-3000'),('02','전자공학과','022-200-4000'),('03','전기공학과','022-200-5000'),('04','정보통신공학과','022-200-6000'),('05','무화과','010-000-0000');
/*!40000 ALTER TABLE `학과` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `학생`
--

DROP TABLE IF EXISTS `학생`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `학생` (
  `학번` char(7) NOT NULL,
  `학과` char(2) NOT NULL,
  `이름` char(20) NOT NULL,
  `학년` enum('1','2','3','4') NOT NULL,
  `주소` char(200) DEFAULT NULL,
  `시군구` char(20) DEFAULT NULL,
  `시도` char(20) DEFAULT NULL,
  `우편번호` char(20) DEFAULT NULL,
  `전자우편` char(50) DEFAULT NULL,
  PRIMARY KEY (`학번`),
  KEY `학과` (`학과`),
  CONSTRAINT `학생_ibfk_1` FOREIGN KEY (`학과`) REFERENCES `학과` (`학과번호`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `학생`
--

LOCK TABLES `학생` WRITE;
/*!40000 ALTER TABLE `학생` DISABLE KEYS */;
INSERT INTO `학생` VALUES ('1601001','01','이서준','1','이번길200','신한구','특별시','02345','seojoon@school.ac.kr'),('1601002','01','최예준','1','사번길400','산업시','그래도','04567',NULL),('1801001','01','김민준','1','일번길100','우리구','특별시','01234','minjoon@school.ac.kr'),('1801002','01','박주원','1','삼번길300','국민시','그래도','03456',NULL),('1804003','04','윤서연','1','오번길500','하나시','그래도','05678','seoyone@school.ac.kr');
/*!40000 ALTER TABLE `학생` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbengineering'
--

--
-- Dumping routines for database 'dbengineering'
--
/*!50003 DROP FUNCTION IF EXISTS `GradeGet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GradeGet`(평점 int) RETURNS varchar(5) CHARSET utf8mb4
BEGIN
	declare result varchar(5);
    if 평점 = 0 then
		set result ='미취득';
	else
		set result = '취득';
	end if;
	return result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `pass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pass`(평점 int) RETURNS varchar(5) CHARSET utf8mb4
BEGIN
	declare result varchar(5);
    if 평점 = 0 then
		set result ='미취득';
	else
		set result = '취득';
	end if;
	return result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `userFunc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `userFunc`(value1 INT,value2 INT) RETURNS int
BEGIN
	return (value1 + value2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dorepeat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dorepeat`(in p1 int,out y int)
BEGIN
	declare x int;
    set x = 1;
    repeat 
		set x = x+1;
        set y = x;
	until x>=p1
    end repeat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_mysql_repeat_loop()` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_mysql_repeat_loop()`()
BEGIN
	declare x int;
    declare str varchar(255);
    set x = 1;
    set str = '';
	repeat
		set str = concat(str,x,',');
        set x = x+1;
	until x>5
    end repeat;
    select str;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_mysql_while_loop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_mysql_while_loop`()
BEGIN
	declare x int;
    declare str varchar(255);
    set x = 1;
    set str = '';
    while x <= 5 do
		set str = concat(str,x,',');
        set x = x+1;
	end while;
    select str;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `새수강신청` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `새수강신청`(in 학번 char(7),out 수강신청_번호 int)
BEGIN
	declare exit handler for 1452
    select 'a foreign key constraint fails';
	select max(수강신청번호) into 수강신청_번호 from 수강신청;
    set 수강신청_번호 = 수강신청번호 +1;
    insert into 수강신청(수강신청번호,학번,날짜,연도,학기)
    values(수강신청_번호,학번,curdate(),'2020','2');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `새학과` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `새학과`(in 학과_번호 varchar(2), in 학과_명 varchar(10), in 전화_번호 varchar(20))
BEGIN
	insert into 학과(학과번호,학과명,전화번호) values(학과_번호,학과_명,전화_번호);
    select 학과번호,학과명,전화번호 from 학과 where 학과번호 = 학과_번호;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `통계` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `통계`()
BEGIN
	select count(distinct 학생.학번) as '학생수',count(distinct 교수.사번) as '교수수',count(distinct 과목.과목번호) as '과목수'
    from 학생,교수,과목;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `교수별담당과목`
--

/*!50001 DROP VIEW IF EXISTS `교수별담당과목`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `교수별담당과목` AS select `교수`.`사번` AS `사번`,`교수`.`이름` AS `이름`,`학과`.`학과명` AS `학과명`,count(distinct `과목`.`과목명`) AS `과목수`,sum(`과목`.`학점`) AS `학점수` from ((`교수` join `학과`) join `과목`) where ((`교수`.`학과` = `학과`.`학과번호`) and (`과목`.`담당교수` = `교수`.`사번`)) group by `교수`.`사번` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `교수정보`
--

/*!50001 DROP VIEW IF EXISTS `교수정보`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `교수정보` AS select `교수`.`사번` AS `사번`,`교수`.`이름` AS `이름`,`교수`.`학과` AS `학과`,`학과`.`학과명` AS `학과명` from (`교수` join `학과`) where (`교수`.`학과` = `학과`.`학과번호`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `담당교과`
--

/*!50001 DROP VIEW IF EXISTS `담당교과`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `담당교과` AS select `교수`.`사번` AS `사번`,`교수`.`이름` AS `이름`,`학과`.`학과명` AS `학과명`,`과목`.`과목명` AS `과목명`,`과목`.`학점` AS `학점` from ((`교수` join `학과`) join `과목`) where ((`교수`.`학과` = `학과`.`학과번호`) and (`교수`.`사번` = `과목`.`담당교수`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-21 14:17:17
