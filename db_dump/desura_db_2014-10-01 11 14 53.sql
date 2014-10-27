-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: scraper
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

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
-- Table structure for table `avatar`
--

DROP TABLE IF EXISTS `avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `game_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_FI_1` (`game_id`),
  CONSTRAINT `avatar_FK_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar`
--

LOCK TABLES `avatar` WRITE;
/*!40000 ALTER TABLE `avatar` DISABLE KEYS */;
INSERT INTO `avatar` VALUES (1,'file_2014-10-01 10:13:43.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_11.png',1,'2014-10-01 10:13:43','2014-10-01 10:13:43'),(2,'file_2014-10-01 10:13:47.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_01.png',1,'2014-10-01 10:13:47','2014-10-01 10:13:47'),(3,'file_2014-10-01 10:13:49.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_02.png',1,'2014-10-01 10:13:49','2014-10-01 10:13:49'),(4,'file_2014-10-01 10:13:52.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_03.png',1,'2014-10-01 10:13:52','2014-10-01 10:13:52'),(5,'file_2014-10-01 10:13:55.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_04.png',1,'2014-10-01 10:13:55','2014-10-01 10:13:55'),(6,'file_2014-10-01 10:13:58.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_05.png',1,'2014-10-01 10:13:58','2014-10-01 10:13:58'),(7,'file_2014-10-01 10:14:00.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_06.png',1,'2014-10-01 10:14:00','2014-10-01 10:14:00'),(8,'file_2014-10-01 10:14:04.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_07.png',1,'2014-10-01 10:14:04','2014-10-01 10:14:04'),(9,'file_2014-10-01 10:14:10.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_08.png',1,'2014-10-01 10:14:10','2014-10-01 10:14:10'),(10,'file_2014-10-01 10:14:15.jpeg','http://media.desura.com/cache/images/games/1/14/13939/thumb_620x2000/FOTONICA_09.png',1,'2014-10-01 10:14:15','2014-10-01 10:14:15');
/*!40000 ALTER TABLE `avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--

LOCK TABLES `developer` WRITE;
/*!40000 ALTER TABLE `developer` DISABLE KEYS */;
INSERT INTO `developer` VALUES (1,'Santa Ragione ','2014-10-01 10:13:39','2014-10-01 10:13:39');
/*!40000 ALTER TABLE `developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `developer_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `game_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_FI_1` (`developer_id`),
  CONSTRAINT `game_FK_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'FOTONICA','http://media.desura.com/cache/images/games//1/14/13939/crop_160x220/fontonicaboxshot.jpg','$9.99',1,13939,'fotonica','2014-10-01 10:13:39','2014-10-01 10:13:39');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `game_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `game_FI_1` (`game_id`),
  CONSTRAINT `video_FK_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'file_2014-10-01 10:14:22.mov.mp4','http://cdn.desura.com/cache/videos/games/1/14/13939/encode_mp4/TRAILER_FOTONICA_NEW.mov.mp4',1,'2014-10-01 10:14:22','2014-10-01 10:14:22'),(2,'file_2014-10-01 10:14:22.mov.mp4','http://cdn.desura.com/cache/videos/games/1/14/13939/encode_mp4/TRAILER_FOTONICA.mp4',1,'2014-10-01 10:14:22','2014-10-01 10:14:22'),(3,'file_2014-10-01 10:14:22.mov.mp4','http://cdn.desura.com/cache/videos/games/1/14/13939/encode_mp4/30561434.mp4',1,'2014-10-01 10:14:22','2014-10-01 10:14:22');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-01 16:14:53
