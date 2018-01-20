-- MySQL dump 10.13  Distrib 5.7.17, for osx10.12 (x86_64)
--
-- Host: localhost    Database: cars
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `year` year(4) NOT NULL,
  `model` char(20) NOT NULL,
  `color` char(20) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `quantity` tinyint(2) unsigned DEFAULT '0',
  `maker_id` tinyint(4) unsigned NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `maker_id` (`maker_id`),
  CONSTRAINT `car_ibfk_1` FOREIGN KEY (`maker_id`) REFERENCES `maker` (`maker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,2016,'Camry','silver',31000.00,6,5),(2,2016,'Camry','green',29000.00,2,5),(3,2016,'Camry','black',30500.00,8,5),(4,2016,'Corolla','silver',18000.00,12,5),(5,2016,'Corolla','black',19500.00,12,5),(6,2016,'Highlander','black',32500.00,5,5),(7,2017,'Highlander','black',38500.00,5,5),(8,2016,'Highlander','silver',30000.00,2,5),(9,2016,'Highlander','white',31000.00,1,5),(10,2017,'Camry','silver',33000.00,14,5);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_sold`
--

DROP TABLE IF EXISTS `car_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_sold` (
  `empl_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int(6) unsigned NOT NULL,
  `quantity` int(6) unsigned NOT NULL,
  PRIMARY KEY (`empl_id`,`car_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `car_sold_ibfk_1` FOREIGN KEY (`empl_id`) REFERENCES `salesman` (`empl_id`),
  CONSTRAINT `car_sold_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_sold`
--

LOCK TABLES `car_sold` WRITE;
/*!40000 ALTER TABLE `car_sold` DISABLE KEYS */;
INSERT INTO `car_sold` VALUES (1,1,3),(1,2,5),(1,3,5),(2,7,2),(3,5,1),(4,6,2),(5,4,2),(6,8,3),(7,3,5),(8,9,6);
/*!40000 ALTER TABLE `car_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_service`
--

DROP TABLE IF EXISTS `customer_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_service` (
  `empl_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` tinyint(3) unsigned NOT NULL,
  `telephone` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`empl_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `customer_service_ibfk_1` FOREIGN KEY (`empl_id`) REFERENCES `employee` (`empl_id`),
  CONSTRAINT `customer_service_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_service`
--

LOCK TABLES `customer_service` WRITE;
/*!40000 ALTER TABLE `customer_service` DISABLE KEYS */;
INSERT INTO `customer_service` VALUES (11,3,3012561230),(12,3,3012561231),(13,3,3012561232),(14,3,3012561233),(15,3,3012561234);
/*!40000 ALTER TABLE `customer_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `empl_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `relationship` enum('child','spouse') DEFAULT NULL,
  PRIMARY KEY (`empl_id`,`first_name`,`last_name`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`empl_id`) REFERENCES `employee` (`empl_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (1,'Alex','Price','M',NULL,'child'),(1,'Jeany','Price','F',NULL,'child'),(1,'Lisa','Jackson','F',NULL,'spouse'),(1,'Madison','Price','M',NULL,'child'),(5,'Emily','Nixon','F',NULL,'child'),(5,'Emma','Lee','F',NULL,'spouse'),(5,'Jack','Nixon','M',NULL,'child'),(13,'Elisabeth','Price','F',NULL,'spouse'),(14,'Chad','Jackson','M',NULL,'spouse'),(15,'Tom','Lee','M',NULL,'spouse');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `empl_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ssn` int(9) unsigned NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `data_hire` date DEFAULT NULL,
  PRIMARY KEY (`empl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,180252547,'Eric','Price','M',NULL,NULL),(2,180252548,'Susan','Smith','F',NULL,NULL),(3,180252549,'John','Price','M',NULL,NULL),(4,180252540,'Eric','Dao','M',NULL,NULL),(5,180252541,'Henry','Nixon','M',NULL,NULL),(6,180252557,'Alice','Smith','F',NULL,NULL),(7,180252587,'Windy','Kim','F',NULL,NULL),(8,180252547,'Alex','Gao','M',NULL,NULL),(9,180252647,'Jack','Smith','M',NULL,NULL),(10,180272547,'Jude','Lee','M',NULL,NULL),(11,180222547,'Rebbecca','Clinton','F',NULL,NULL),(12,180952522,'Ella','Price','F',NULL,NULL),(13,180233647,'James','Zhan','M',NULL,NULL),(14,180298547,'Robin','Jackson','F',NULL,NULL),(15,180275647,'Jeanie','Lee','F',NULL,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maker`
--

DROP TABLE IF EXISTS `maker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maker` (
  `maker_id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `maker_name` char(20) NOT NULL,
  PRIMARY KEY (`maker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maker`
--

LOCK TABLES `maker` WRITE;
/*!40000 ALTER TABLE `maker` DISABLE KEYS */;
INSERT INTO `maker` VALUES (1,'BMW'),(2,'BENZ'),(3,'AUDI'),(4,'CADILLAC'),(5,'TOYOTO'),(6,'HYUNDAI'),(7,'FORD'),(8,'HONDA'),(9,'NISSAN'),(10,'CHRYSLER');
/*!40000 ALTER TABLE `maker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesman` (
  `empl_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`empl_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `salesman_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,2),(7,2),(8,2),(9,2),(10,2);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `team_name` char(20) NOT NULL,
  `empl_id` smallint(3) unsigned NOT NULL,
  `title` enum('Team Leader','Team Member') DEFAULT 'Team Member',
  PRIMARY KEY (`team_id`,`empl_id`),
  KEY `empl_id` (`empl_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`empl_id`) REFERENCES `employee` (`empl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Dragon',1,'Team Leader'),(1,'Dragon',2,'Team Member'),(1,'Dragon',3,'Team Member'),(1,'Dragon',4,'Team Member'),(1,'Dragon',5,'Team Member'),(2,'Tiger',6,'Team Leader'),(2,'Tiger',7,'Team Member'),(2,'Tiger',8,'Team Member'),(2,'Tiger',9,'Team Member'),(2,'Tiger',10,'Team Member'),(3,'Nurse',11,'Team Leader'),(3,'Nurse',12,'Team Member'),(3,'Nurse',13,'Team Member'),(3,'Nurse',14,'Team Member'),(3,'Nurse',15,'Team Member');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-29 16:49:31
