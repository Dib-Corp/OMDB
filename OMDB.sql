/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.0.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: imdb
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Cast`
--

DROP TABLE IF EXISTS `Cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cast` (
  `Mediaid` bigint(20) NOT NULL,
  `Director` varchar(50) NOT NULL,
  `MainStar` varchar(50) NOT NULL,
  `CoStar` varchar(50) DEFAULT NULL,
  `OtherStars` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Mediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cast`
--

LOCK TABLES `Cast` WRITE;
/*!40000 ALTER TABLE `Cast` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Cast` VALUES
(1,'Andrew-Staton','Ben-Burtt','Elissa-Knight','Jeff-Garlin,Fred-Willard,John-Ratzenberger,Sigourney-Weaver,Karleen-Griffin,Kim-Kompf,Niki-Mcelroy,Garret-Palmer,Lori-Richardson,Jessica-Skelton'),
(2,'Scott-Frank','Anya-Taylor','Chloe-Pirrie','Bill-Camp,Marielle,Heller,Marcin-Dorocinski,Thomas-Brodie,Moss-Ingram'),
(10,'Ryan-Coogler','Miles-Caton','Saul-Willams','Michael-B-Jordan,Jack-O`Connel,Tenaj-Jackson,Andrene-Hammond,Dave-Maldonado,Yao');
/*!40000 ALTER TABLE `Cast` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Cover`
--

DROP TABLE IF EXISTS `Cover`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cover` (
  `MediaId` bigint(20) NOT NULL,
  `ImgLink` varchar(230) NOT NULL,
  PRIMARY KEY (`MediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cover`
--

LOCK TABLES `Cover` WRITE;
/*!40000 ALTER TABLE `Cover` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Cover` VALUES
(1,'https://m.media-amazon.com/images/I/41rJO1gF4ZL._SL500_.jpg'),
(2,'https://upload.wikimedia.org/wikipedia/en/1/12/The_Queen%27s_Gambit_%28miniseries%29.png'),
(10,'https://play-lh.googleusercontent.com/H43uxhxnizdh6xoljMadvBS-5pt_9E5m2qfxrTgAB9xs8Z96mzSZbZvSNusIdLQCzz_ncF1tX7E4XjJBdqU=w240-h480-rw');
/*!40000 ALTER TABLE `Cover` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `MediaBasics`
--

DROP TABLE IF EXISTS `MediaBasics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MediaBasics` (
  `MediaId` bigint(20) NOT NULL AUTO_INCREMENT,
  `MainTitle` varchar(120) NOT NULL,
  `Is-Adult` tinyint(4) DEFAULT NULL,
  `Start-Year` varchar(200) DEFAULT NULL,
  `End-Year` varchar(200) DEFAULT NULL,
  `Runtime-Min` bigint(20) DEFAULT NULL,
  `Genres` varchar(200) NOT NULL,
  PRIMARY KEY (`MediaId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediaBasics`
--

LOCK TABLES `MediaBasics` WRITE;
/*!40000 ALTER TABLE `MediaBasics` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `MediaBasics` VALUES
(1,'Wall-E',0,'2008','',98,'SciFi,Adventure'),
(2,'The Queen\'s Gambit',1,'2020','2020',462,'Drama,Psychological,chess,addiction'),
(3,'Openings',1,'2020','2020',59,'Drama,Psychological,chess,addiction'),
(4,'Exchanges',1,'2020','2020',65,'Drama,Psychological,chess,addiction'),
(5,'Doubled Pawns',1,'2020','2020',46,'Drama,Psychological,chess,addiction'),
(6,'Middle Game',1,'2020','2020',49,'Drama,Psychological,chess,addiction'),
(7,'Fork',1,'2020','2020',48,'Drama,Psychological,chess,addiction'),
(8,'Adjournment',1,'2020','2020',60,'Drama,Psychological,chess,addiction'),
(9,'End Game',1,'2020','2020',68,'Drama,Psychological,chess,addiction'),
(10,'Sinners',1,'2025',NULL,138,'Vampire,Music,OldTime,Horror');
/*!40000 ALTER TABLE `MediaBasics` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `MediaEpsiode`
--

DROP TABLE IF EXISTS `MediaEpsiode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MediaEpsiode` (
  `MediaId` bigint(20) NOT NULL,
  `ParentMediaID` bigint(20) NOT NULL,
  `SeasonNumber` bigint(20) DEFAULT NULL,
  `EpsiodeNumber` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MediaId`),
  CONSTRAINT `TitleEpsiode_TitleNames_FK` FOREIGN KEY (`MediaId`) REFERENCES `MediaBasics` (`MediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediaEpsiode`
--

LOCK TABLES `MediaEpsiode` WRITE;
/*!40000 ALTER TABLE `MediaEpsiode` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `MediaEpsiode` VALUES
(3,2,1,1),
(4,2,1,2),
(5,2,1,3),
(6,2,1,4),
(7,2,1,5),
(8,2,1,6),
(9,2,1,7);
/*!40000 ALTER TABLE `MediaEpsiode` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `Rating/Description`
--

DROP TABLE IF EXISTS `Rating/Description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rating/Description` (
  `MediaId` bigint(20) NOT NULL,
  `Rating` float DEFAULT NULL,
  `Desc` varchar(250) NOT NULL,
  PRIMARY KEY (`MediaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating/Description`
--

LOCK TABLES `Rating/Description` WRITE;
/*!40000 ALTER TABLE `Rating/Description` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `Rating/Description` VALUES
(1,90,'A robot who is responsible for cleaning a waste-covered Earth meets another robot and falls in love with her. Together, they set out on a journey that will alter the fate of mankind.'),
(2,85,'in a 1950s orphanage, a young girl reveals an astonishing talent for chess and begins an unlikely journey to stardom while grappling with addiction'),
(3,83,'Sent to an orphanage at age nine, Beth develops an uncanny flair for chess and a growing dependence on the tranquilizers given to children'),
(4,82,'Suddenly plunged into a confusing new life in suburbia, teenage Beth studies her high school classmates and hatches a plan to enter a chess tournament'),
(5,82,'The trip to Cincinnati launches Beth and her mother into a whirlwind of travel and press coverage. Beth sets her sights on the U.S. Open in Las Vegas'),
(6,82,'Russian class opens the door to a new social scene. In Mexico City, Beth meets the intimidating Borgov, while her mother cozies up to a pen pal'),
(7,81,'Back home in Kentucky, a shaken Beth reconnects with a former opponent who offers to help sharpen her game ahead of the U.S. Championship'),
(8,82,'After training with Benny in New York, Beth heads to Paris for her rematch with Borgov. But a wild night sends her into a self-destructive spiral'),
(9,86,'A visit from an old friend forces Beth to reckon with her past and rethink her priorities — just in time for the biggest match of her life'),
(10,75,'Trying to leave their troubled lives behind, twin brothers return to their hometown to start again, only to discover that an even greater evil is waiting to welcome them back');
/*!40000 ALTER TABLE `Rating/Description` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-23 23:56:49
