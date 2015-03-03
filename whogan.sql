-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: whogan
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `COUNTRY_NAME` varchar(255) DEFAULT NULL,
  `REGION_ID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `REGION_ID` (`REGION_ID`),
  CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`REGION_ID`) REFERENCES `regions` (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('CA','Canada',2),('DE','Germany',1),('UK','United Kingdom',1),('US','United States of America',2);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `DEPARTMENT_ID` int(10) unsigned NOT NULL,
  `DEPARTMENT_NAME` varchar(255) NOT NULL,
  `MANAGER_ID` int(10) unsigned DEFAULT NULL,
  `LOCATION_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(50,'Shipping',124,1500),(60,'IT',103,1400),(80,'Sales',149,2500),(90,'Executive',100,1700),(110,'Accounting',205,1800),(190,'Contracting',206,1700);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EMPLOYEE_ID` int(6) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(20) NOT NULL,
  `SALARY` int(20) DEFAULT NULL,
  `MANAGER_ID` int(10) unsigned DEFAULT NULL,
  `DEPARTMENT_ID` int(10) unsigned NOT NULL,
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steven ','King','SKING','515 .123.4567','1987-06-17','AD_PRES',24000,100,90),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21','AD_VP',17000,100,90),(102,'Lex','Da Haan','LDEHAAN','515.123.4569','1993-01-13','AD_VP',17000,100,90),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','IT_PROG',9000,102,60),(104,'Bruce','Ernst','BERFNST','590.423.4568','1991-05-21','IT_PROG',6000,103,60),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07','IT_PROG',4200,103,60),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-16','ST_MAN',5800,100,50),(141,'Trenna','Rajs','TRAJS','650.121.8009','1995-10-17','ST_CLERK',3500,124,50),(142,'Curtis','Davies','CDAVIES','650.121.2994','1997-01-29','ST_CLERK',3100,124,50),(143,'Randall','Matos','RMATOS','650.121.2874','1998-03-15','ST_CLERK',2600,124,50),(144,'Peter','Vargas','PVARGAS','650.121.2004','1998-07-09','ST_CLERK',2500,124,50),(149,'Eleni','ZLotkey','EZLOTKEV','011.44.1344.429018','2000-01-29','SA_MAN',10500,100,80),(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11','SA_REP',11000,149,80),(176,'Johnathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24','SA_REP',8600,149,80),(178,'Kimberley','Grant','KGRANT','011.44.1644.429263','1999-05-24','SA_REP',7000,149,10),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17','AD_ASST',4400,101,10),(201,'Michael','Harstein','MHARSTEIN','515.123.5555','1996-02-17','MK_MAN',13000,100,20),(202,'Pat','Fay','PFAY','603.123.6666','1997-08-17','MK_REP',6000,201,20),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1994-06-07','AC_MGR',12000,101,110),(206,'William','Gietz','WGIETZ','515.123.4444','1994-06-07','AC_ACCOUNT',8300,205,110);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_grades` (
  `GRADE_LEVEL` varchar(10) NOT NULL,
  `LOWEST_SAL` int(10) unsigned DEFAULT NULL,
  `HIGHEST_SAL` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`GRADE_LEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_grades`
--

LOCK TABLES `job_grades` WRITE;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` VALUES ('A',1000,2999),('B',3000,5999),('C',6000,9999),('D',10000,14999),('E',15000,24999),('F',25000,40000);
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_history` (
  `EMPLOYEE_ID` int(6) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(20) NOT NULL,
  `DEPARTMENT_ID` int(10) unsigned NOT NULL,
  KEY `JOB_ID` (`JOB_ID`),
  KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`),
  CONSTRAINT `job_history_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`),
  CONSTRAINT `job_history_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES (102,'1993-01-13','1998-07-24','IT_PROG',60),(101,'1989-09-21','1993-10-27','AC_ACCOUNT',110),(101,'1993-10-28','1997-03-15','AC_MGR',110),(201,'1996-02-17','1999-12-19','MK_REP',20),(114,'1998-03-24','1999-12-31','ST_CLERK',50),(122,'1999-01-01','1999-12-31','ST_CLERK',50),(200,'1987-09-17','1993-06-17','AD_ASST',90),(176,'1998-03-24','1998-12-31','SA_REP',80),(176,'1999-01-01','1999-12-31','SA_MAN',80),(200,'1994-07-01','1998-12-31','AC_ACCOUNT',90);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `JOB_ID` varchar(20) NOT NULL,
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` int(10) unsigned DEFAULT NULL,
  `MAX_SALARY` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AC_ACCOUNT','Public  Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AD_ASST','Administration Assistant',3000,6000),('AD_PRES','President',20000,40000),('AD_VP','Administration Vice President',15000,30000),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('SA_MAN','Sales Manager',10000,20000),('SA_REP','Sales Representative',6000,12000),('ST_CLERK','Stock Clerk',2000,5000),('ST_MAN','Stock Manager',10000,20000);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `LOCATION_ID` int(10) unsigned NOT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `POSTAL_CODE` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) NOT NULL,
  `STATE_PROVINCE` varchar(255) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) NOT NULL,
  PRIMARY KEY (`LOCATION_ID`),
  KEY `COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `countries` (`COUNTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1700,'2004 VARCHARade Rd','98199','Seattle','Washington','US'),(1800,'460 Bloor St. W.','ON M5S 1XB','Toronto','Ontario','CA'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `REGION_ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Europe'),(2,'Americas'),(3,'Asia'),(4,'Middle East and Africa');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-21 11:35:12
