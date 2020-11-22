CREATE DATABASE  IF NOT EXISTS `sp_travel` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sp_travel`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: sp_travel
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(255) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'CalebYeoh50@hotmail.com','Caleb Yeoh','Jiale578'),(2,'UserTest@gmail.com','UserTest','UserTest978'),(3,'UserCust@yahoo.com','CustomerUser','Biz45Tech1');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary`
--

DROP TABLE IF EXISTS `itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerary` (
  `Itinerary_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Day` int(11) NOT NULL,
  `Activity` longtext NOT NULL,
  `Travel_ID` int(11) NOT NULL,
  PRIMARY KEY (`Itinerary_ID`),
  KEY `Travel_ID_idx` (`Travel_ID`),
  CONSTRAINT `Travel_ID` FOREIGN KEY (`Travel_ID`) REFERENCES `travel_listing` (`Travel_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary`
--

LOCK TABLES `itinerary` WRITE;
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
INSERT INTO `itinerary` VALUES (1,12,'Culture, Food & Drinks, Historical Sites',1),(2,2,'Sightseeing, Food & Drinks & Leisure',1),(3,16,'Historical Sites, Culture, Food & Beverages, Anime & Manga, Shrines',2),(4,4,'Leisure, Sightseeing, Food & Drinks',2),(5,14,'Historical Sites, Culture, Food & Beverages, Anime & Manga, Shrines',2),(6,5,'See all the history to modern of Japanese Inventions',2),(7,3,'Watch and experience of different kinds of AI Technology',1),(8,3,'Sightseeing and explore of all the surrondings areas',4),(9,5,'Relaxation and leisure in a peaceful time',6);
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_listing`
--

DROP TABLE IF EXISTS `travel_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_listing` (
  `Travel_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Description` longtext NOT NULL,
  `Price` int(11) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Travel_Period` varchar(50) NOT NULL,
  `Image_URL` longtext NOT NULL,
  `Date_Inserted` timestamp NOT NULL,
  PRIMARY KEY (`Travel_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_listing`
--

LOCK TABLES `travel_listing` WRITE;
/*!40000 ALTER TABLE `travel_listing` DISABLE KEYS */;
INSERT INTO `travel_listing` VALUES (1,'SG Tourism','Virtual_Tourism_in_Singapore',2300,'Singapore','11-2016','https://SGTours.jpg','2016-07-23 07:30:00'),(2,'JP Tourism','Virtual_Tourism_in_Japan',3150,'Japan','08-2022','https://JPNTours.jpg','2022-01-11 02:00:00'),(3,'Sentosa Island','Sentosa Island in Singapore',450,'Singapore','03-2018','https://SentosaIsland.jpg','2017-08-19 08:45:00'),(4,'Tokyo Tower','Old Tokyo Tower in Japan',300,'Japan','06-2023','https://TokyoTower.jpg','2023-01-07 01:55:00'),(5,'Wild Wild Wet','Pasir Ris D\' Resort',1250,'Singapore','01-2017','https://WWW.jpg','2016-09-19 06:30:00'),(6,'JP VT2','Virtual_Tourism_in_Japan',910,'Japan','12-2019','https://JPvt2.jpg','2019-08-22 03:20:00'),(7,'Japanese Invention','Virtual_Tourism_in_Japan',4000,'Japan','05-2027','https://JapanInvent.jpg','2027-03-14 00:45:00'),(8,'AI Technology','Virtual_Tourism_in_Singapore',5230,'Singapore','10-2030','https://AI_sg.jpg','2026-05-27 13:00:00'),(9,'Car Exhibition','Virtual Car Exhibition',1790,'USA','07-2024','https://CarExhibit.jpg','2024-04-06 05:00:00'),(10,'Studio Cafe','Food & Drinks, Musics',750,'Norway','02-2029','https://StudioCafe.jpg','2028-12-12 09:15:00');
/*!40000 ALTER TABLE `travel_listing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-16 21:52:25
