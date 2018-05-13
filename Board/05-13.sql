-- MySQL dump 10.13  Distrib 5.7.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bbs
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `post_seq` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contents` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` int(11) DEFAULT '1',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'aaa','bbb','kdhong',1,'2018-05-12 06:50:49'),(2,'aaa','bbb','kdhong',1,'2018-05-12 06:51:12'),(3,'hhh','hello','aaa',1,'2018-05-12 07:45:16'),(4,'123','12312312','aaa',1,'2018-05-12 11:24:16'),(5,'awerawerew','awerwer','aaa',1,'2018-05-12 11:25:04'),(6,'1arwer','awerawer','aaa',1,'2018-05-12 11:25:37'),(7,'werwerwr','awrwer','aaa',1,'2018-05-12 11:30:01'),(8,'awerwera','awrwerw','aaa',1,'2018-05-12 13:44:25'),(9,'awerwerew','asdfasdfasdf','aaa',1,'2018-05-12 14:37:18'),(10,'asfasdfasdfasd','asdfasdfdas','aaa',1,'2018-05-12 14:37:21'),(11,'awerweraew','rawerawerawer','aaa',1,'2018-05-12 14:37:24'),(12,'asdfsdfsdafa','awerewrwerawer','aaa',1,'2018-05-12 14:37:27'),(13,'fasdfs','fasdfasdfsdf','aaa',1,'2018-05-12 14:37:31'),(14,'awefwerweqrqwer','qrwerearsdfdsf','aaa',1,'2018-05-12 14:37:35'),(15,'123','1231','aaa',1,'2018-05-12 14:37:37'),(16,'3453453','534535','aaa',1,'2018-05-12 14:37:40'),(17,'qqqweqwe','zsdfzsdfzsdfz','aaa',1,'2018-05-12 14:37:43'),(18,'arwerawe','awerwezsdfdsf','aaa',1,'2018-05-12 14:37:47'),(19,'zdzdfgzdfgzdfg','zdfgzdfgdgffdg','aaa',1,'2018-05-12 14:37:50'),(20,'12321','awerwerawerw','aaa',1,'2018-05-12 14:37:52'),(21,'a','a','aaa',1,'2018-05-13 06:38:02'),(22,'빨간 맛','궁금해 허니','aaa',0,'2018-05-13 07:52:09'),(23,'방가방가','부탄 사람','aaa',0,'2018-05-13 08:02:36');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('???','123','??','??'),('aaa','1234','AAA','남자'),('ㄱㄱㄱ','123','rrrr','여자'),('ㅈㅈㅈ','123','123','여자');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-13 17:10:41
