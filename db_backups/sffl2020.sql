-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: sffl
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

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
-- Table structure for table `conferences`
--

DROP TABLE IF EXISTS `conferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conferences` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conferences`
--

LOCK TABLES `conferences` WRITE;
/*!40000 ALTER TABLE `conferences` DISABLE KEYS */;
INSERT INTO `conferences` VALUES ('AC','Avalos-Corona',NULL,NULL),('UDC','U de Colima',NULL,NULL);
/*!40000 ALTER TABLE `conferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division_team`
--

DROP TABLE IF EXISTS `division_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `season_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division_team`
--

LOCK TABLES `division_team` WRITE;
/*!40000 ALTER TABLE `division_team` DISABLE KEYS */;
INSERT INTO `division_team` VALUES (1,'PIR','AN','2020',NULL,NULL),(2,'GAN','AN','2020',NULL,NULL),(3,'CHA','AN','2020',NULL,NULL),(4,'GT','AN','2020',NULL,NULL),(5,'PAT','AS','2020',NULL,NULL),(6,'GOA','AS','2020',NULL,NULL),(7,'BRO','AS','2020',NULL,NULL),(8,'SAL','AS','2020',NULL,NULL),(9,'TRO','UN','2020',NULL,NULL),(10,'VIL','UN','2020',NULL,NULL),(11,'ARR','UN','2020',NULL,NULL),(12,'SKY','UN','2020',NULL,NULL),(13,'COL','US','2020',NULL,NULL),(14,'TIZ','US','2020',NULL,NULL),(15,'PD','US','2020',NULL,NULL),(16,'CAF','US','2020',NULL,NULL);
/*!40000 ALTER TABLE `division_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divisions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conference_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `season_id` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES ('AN','AC Norte','AC',2020,NULL,NULL),('AS','AC Sur','AC',2020,NULL,NULL),('UN','UDC Norte','UDC',2020,NULL,NULL),('US','UDC Sur','UDC',2020,NULL,NULL);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_conference_rivals`
--

DROP TABLE IF EXISTS `extra_conference_rivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_conference_rivals` (
  `season_id` smallint(6) DEFAULT NULL,
  `ac_division` varchar(2) DEFAULT NULL,
  `uc_division` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_conference_rivals`
--

LOCK TABLES `extra_conference_rivals` WRITE;
/*!40000 ALTER TABLE `extra_conference_rivals` DISABLE KEYS */;
INSERT INTO `extra_conference_rivals` VALUES (2020,'AN','US'),(2020,'AS','UN');
/*!40000 ALTER TABLE `extra_conference_rivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franchise_changes`
--

DROP TABLE IF EXISTS `franchise_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franchise_changes` (
  `id` smallint(5) unsigned NOT NULL,
  `franchise_id` varchar(3) DEFAULT NULL,
  `new_name` varchar(255) DEFAULT NULL,
  `new_city` varchar(255) DEFAULT NULL,
  `new_initials` varchar(3) DEFAULT NULL,
  `new_logo` varchar(255) DEFAULT NULL,
  `season_start` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franchise_changes`
--

LOCK TABLES `franchise_changes` WRITE;
/*!40000 ALTER TABLE `franchise_changes` DISABLE KEYS */;
INSERT INTO `franchise_changes` VALUES (1,'TRO','Volcanes','Colima','VOL','',2010),(2,'GT','Gallotes Machos','','GM','',2012),(3,'RUD','Piratas Sexosos','','PS','',2008),(4,'RUD','Rudos','','RUD','',2009),(5,'PAT','Pats','','PAT','',2017),(6,'PD','PAT\'sIDIFUSOS','San Cuilmas','PD','',2018);
/*!40000 ALTER TABLE `franchise_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franchises`
--

DROP TABLE IF EXISTS `franchises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franchises` (
  `id` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `first_season` smallint(6) DEFAULT NULL,
  `last_season` smallint(6) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franchises`
--

LOCK TABLES `franchises` WRITE;
/*!40000 ALTER TABLE `franchises` DISABLE KEYS */;
INSERT INTO `franchises` VALUES ('ARR','Arrabales','San Casteabro','Arrabales',2015,0,'Aurelio\r'),('BRO','Broncos','Colima','Broncos',2017,0,'Remo\r'),('CA','Charal Asesino','Chapala','Charal',2005,2015,'Isaac\r'),('CAF','Cafes','Comala','Cafes',2018,0,'Rente\r'),('CB','Cafebots','Comala','Cafebots',2017,2017,'bot\r'),('CHA','Chaviteros Guapos','Santiaguito','Chaviteros',2005,0,'Arturo\r'),('CHR','Charros','Guadalajara','Charros',2008,2009,'Victor\r'),('CLI','Clippys','Albarrada','Clippys',2017,2017,'bot\r'),('COL','Collimanes','Colima','Collimanes',2005,0,'Rafael\r'),('FLO','Florecitas','Guadalajara','Florecitas',2006,2007,'Gaby\r'),('GAN','Ganaderos','U.A. Tepame','Ganaderos',2005,0,'Fernando\r'),('GOA','GOATs','Boston','GOATs',2017,0,'Adriel\r'),('GT','Gallos Tronados','CajititlÃ¡n','Gallos',2005,0,'Checo\r'),('GUE','Guerreros','San Casmeo','Guerreros',2005,2015,'Miki\r'),('PAT','Charal Asesino','Chapala','Charal',2016,0,'Diego\r'),('PD','Guerreros','San Casmeo','Guerreros',2016,0,'Jesus Paz\r'),('PIR','Piratas','V. de Alvarez','Piratas',2005,0,'Luis Miguel\r'),('PUM','Pumas','UdeC','Pumas',2005,2005,'Hugo B\r'),('RH','Rompehuesos','CoquimatlÃ¡n','Rompehuesos',2007,2008,'Fernanda\r'),('RUD','Rudos','Zapopan','Rudos',2007,2014,'Juan R\r'),('SAL','Salsas','La capacha','Salsas',2005,0,'Andres\r'),('SKY','Skywalkers','Tatooine','Skywalkers',2018,0,'Carlos Rodriguez'),('TIZ','Tiznados','Colima','Tiznados',2005,0,'Edgar\r'),('TRO','Trojans','Mexico City','Trojans',2009,0,'Domingo\r'),('VIL','Villains','Colima','Villains',2010,0,'Angel\r');
/*!40000 ALTER TABLE `franchises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logos`
--

DROP TABLE IF EXISTS `logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logoable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logos`
--

LOCK TABLES `logos` WRITE;
/*!40000 ALTER TABLE `logos` DISABLE KEYS */;
INSERT INTO `logos` VALUES (1,'teams/PIR.jpg','PIR','App\\Team',NULL,NULL),(2,'teams/CHA.jpg','CHA','App\\Team',NULL,NULL),(3,'divisions/US.gif','US','App\\Division',NULL,NULL),(4,'divisions/AN.gif','AN','App\\Division',NULL,NULL),(5,'conferences/AC.gif','AC','App\\Conference',NULL,NULL),(6,'conferences/UDC.gif','UDC','App\\Conference',NULL,NULL);
/*!40000 ALTER TABLE `logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `season_id` smallint(6) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `guest_team` varchar(3) DEFAULT NULL,
  `home_team` varchar(3) DEFAULT NULL,
  `guest_starters_score` tinyint(3) unsigned DEFAULT NULL,
  `home_starters_score` tinyint(3) unsigned DEFAULT NULL,
  `match_type` enum('SEASON','DIVISIONAL','CONFERENCE_FINAL','NOPAL_BOWL','ROUND1','ROUND2') DEFAULT NULL,
  `end_type` enum('REGULAR','BENCH','TIE') DEFAULT NULL,
  `guest_bench_score` tinyint(3) unsigned DEFAULT NULL,
  `home_bench_score` tinyint(3) unsigned DEFAULT NULL,
  `final_winner` enum('HOME','GUEST') DEFAULT NULL,
  `home_advantage` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (2018,1,'TIZ','CHA',33,37,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'PD','PIR',31,61,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'COL','GT',33,24,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'CAF','GAN',32,25,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'PAT','GOA',56,26,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'BRO','SAL',33,58,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'VIL','ARR',56,54,'SEASON','REGULAR',0,0,'',NULL),(2018,1,'TRO','SKY',66,37,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'CHA','PIR',30,51,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'GT','GAN',18,35,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'SAL','PAT',61,44,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'GOA','BRO',44,37,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'SKY','TIZ',33,40,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'TRO','PD',56,47,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'ARR','COL',33,39,'SEASON','REGULAR',0,0,'',NULL),(2018,2,'VIL','CAF',44,45,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'SAL','VIL',44,45,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'BRO','SKY',36,46,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'GOA','TRO',25,53,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'PAT','ARR',36,37,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'PIR','TIZ',53,42,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'GT','PD',28,48,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'GAN','COL',72,48,'SEASON','REGULAR',0,0,'',NULL),(2018,3,'CHA','CAF',29,39,'SEASON','REGULAR',0,0,'',NULL),(2018,4,'GAN','CHA',54,63,'SEASON','REGULAR',0,0,'',NULL),(2018,4,'PIR','GT',22,57,'SEASON','REGULAR',0,0,'',NULL),(2018,4,'VIL','PAT',34,34,'SEASON','BENCH',0,1,'',NULL),(2018,4,'SKY','SAL',56,43,'SEASON','REGULAR',0,0,'',NULL),(2018,4,'TRO','BRO',54,50,'SEASON','REGULAR',0,0,'',NULL),(2018,4,'ARR','GOA',42,42,'SEASON','BENCH',0,1,'',NULL),(2018,4,'TIZ','CAF',37,56,'SEASON','REGULAR',0,0,'',NULL),(2018,4,'COL','PD',19,43,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'PAT','CHA',31,30,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'SAL','PIR',47,53,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'BRO','GT',48,37,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'GOA','GAN',37,40,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'TIZ','VIL',39,44,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'PD','SKY',38,30,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'COL','TRO',43,46,'SEASON','REGULAR',0,0,'',NULL),(2018,5,'CAF','ARR',41,53,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'GOA','VIL',35,45,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'PAT','SKY',37,40,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'SAL','TRO',68,54,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'BRO','ARR',50,48,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'GAN','TIZ',48,47,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'CHA','PD',54,36,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'PIR','COL',48,29,'SEASON','REGULAR',0,0,'',NULL),(2018,6,'GT','CAF',47,29,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'PIR','PAT',27,41,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'GT','SAL',33,20,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'GAN','BRO',32,34,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'CHA','GOA',60,28,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'SKY','VIL',59,43,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'ARR','TRO',39,57,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'PD','TIZ',28,49,'SEASON','REGULAR',0,0,'',NULL),(2018,7,'CAF','COL',41,24,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'TIZ','GT',50,43,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'PD','GAN',46,46,'SEASON','BENCH',0,1,'',NULL),(2018,8,'COL','CHA',25,38,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'CAF','PIR',41,31,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'VIL','BRO',48,26,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'SKY','GOA',39,43,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'TRO','PAT',53,30,'SEASON','REGULAR',0,0,'',NULL),(2018,8,'ARR','SAL',20,48,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'CHA','GT',25,14,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'GAN','PIR',48,33,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'PAT','BRO',41,31,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'GOA','SAL',29,27,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'ARR','TIZ',35,25,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'VIL','PD',60,20,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'SKY','COL',70,29,'SEASON','REGULAR',0,0,'',NULL),(2018,9,'TRO','CAF',38,42,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'PAT','GT',38,27,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'SAL','GAN',48,34,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'BRO','CHA',56,48,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'GOA','PIR',50,49,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'TRO','VIL',52,53,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'SKY','ARR',36,51,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'TIZ','COL',36,27,'SEASON','REGULAR',0,0,'',NULL),(2018,10,'CAF','PD',37,13,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'GAN','PAT',20,44,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'CHA','SAL',40,32,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'PIR','BRO',60,41,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'GT','GOA',31,45,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'TIZ','TRO',40,79,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'PD','ARR',48,52,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'COL','VIL',20,57,'SEASON','REGULAR',0,0,'',NULL),(2018,11,'CAF','SKY',26,65,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'CHA','GAN',57,38,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'GT','PIR',38,48,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'BRO','PAT',54,25,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'SAL','GOA',54,39,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'ARR','VIL',58,44,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'SKY','TRO',25,45,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'CAF','TIZ',34,40,'SEASON','REGULAR',0,0,'',NULL),(2018,12,'PD','COL',16,33,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'PIR','CHA',25,56,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'GAN','GT',36,35,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'PAT','SAL',20,50,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'BRO','GOA',39,42,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'VIL','SKY',31,44,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'TRO','ARR',36,50,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'TIZ','PD',50,46,'SEASON','REGULAR',0,0,'',NULL),(2018,13,'COL','CAF',28,26,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'GT','CHA',45,12,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'PIR','GAN',38,28,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'GOA','PAT',29,25,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'SAL','BRO',44,51,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'VIL','TRO',30,47,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'ARR','SKY',50,51,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'COL','TIZ',33,17,'SEASON','REGULAR',0,0,'',NULL),(2018,14,'PD','CAF',28,34,'SEASON','REGULAR',0,0,'',NULL),(2018,15,'SKY','CAF',31,44,'DIVISIONAL','REGULAR',0,0,'',NULL),(2018,15,'ARR','TRO',21,50,'DIVISIONAL','REGULAR',0,0,'',NULL),(2018,15,'PIR','SAL',45,48,'DIVISIONAL','REGULAR',0,0,'',NULL),(2018,15,'GOA','CHA',37,27,'DIVISIONAL','REGULAR',0,0,'',NULL),(2018,16,'TRO','CAF',44,22,'CONFERENCE_FINAL','REGULAR',0,0,'',NULL),(2018,16,'GOA','SAL',34,51,'CONFERENCE_FINAL','REGULAR',0,0,'',NULL),(2018,17,'SAL','TRO',29,51,'NOPAL_BOWL','REGULAR',0,0,'',NULL),(2019,1,'SKY','PIR',50,33,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'VIL','CHA',72,30,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'TRO','GT',43,37,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'ARR','GAN',42,47,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'TIZ','PAT',47,66,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'PD','SAL',55,42,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'COL','BRO',50,39,'SEASON','REGULAR',0,0,'',NULL),(2019,1,'CAF','GOA',42,53,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'PAT','PIR',33,34,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'SAL','GT',29,36,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'BRO','GAN',49,41,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'GOA','CHA',51,69,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'TIZ','SKY',40,42,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'PD','TRO',43,35,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'COL','ARR',39,54,'SEASON','REGULAR',0,0,'',NULL),(2019,2,'CAF','VIL',49,42,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'PIR','VIL',40,76,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'GT','SKY',29,39,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'GAN','TRO',32,38,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'CHA','ARR',51,52,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'SAL','TIZ',44,39,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'BRO','PD',55,53,'SEASON','REGULAR',0,0,'',NULL),(2019,3,'GOA','COL',50,50,'SEASON','BENCH',44,14,'',NULL),(2019,3,'PAT','CAF',49,50,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'GAN','CHA',29,68,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'GT','PIR',25,18,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'GOA','PAT',34,41,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'BRO','SAL',33,38,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'VIL','ARR',47,29,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'TRO','SKY',42,30,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'TIZ','CAF',44,52,'SEASON','REGULAR',0,0,'',NULL),(2019,4,'COL','PD',46,35,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'CHA','PAT',27,38,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'PIR','SAL',40,37,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'GT','BRO',44,59,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'GAN','GOA',39,38,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'VIL','TIZ',47,57,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'SKY','PD',35,34,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'TRO','COL',23,44,'SEASON','REGULAR',0,0,'',NULL),(2019,5,'ARR','CAF',50,55,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'GAN','VIL',51,41,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'CHA','SKY',44,52,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'PIR','TRO',28,31,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'GT','ARR',42,43,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'GOA','TIZ',39,40,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'PAT','PD',43,21,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'SAL','COL',16,34,'SEASON','REGULAR',0,0,'',NULL),(2019,6,'BRO','CAF',58,47,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'PIR','CHA',27,48,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'GT','GAN',27,61,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'SAL','PAT',33,45,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'GOA','BRO',28,24,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'SKY','VIL',40,40,'SEASON','BENCH',16,24,'',NULL),(2019,7,'ARR','TRO',19,54,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'PD','TIZ',33,42,'SEASON','REGULAR',0,0,'',NULL),(2019,7,'CAF','COL',23,64,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'PAT','GAN',23,36,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'SAL','CHA',38,49,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'BRO','PIR',36,41,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'GOA','GT',14,42,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'TIZ','ARR',49,46,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'PD','VIL',37,47,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'COL','SKY',47,26,'SEASON','REGULAR',0,0,'',NULL),(2019,8,'CAF','TRO',47,50,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'CHA','GT',23,28,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'GAN','PIR',38,46,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'PAT','BRO',31,42,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'GOA','SAL',55,32,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'VIL','TRO',36,50,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'ARR','SKY',45,50,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'TIZ','COL',44,26,'SEASON','REGULAR',0,0,'',NULL),(2019,9,'CAF','PD',35,28,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'VIL','GT',44,37,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'SKY','GAN',49,33,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'TRO','CHA',55,25,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'ARR','PIR',71,24,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'TIZ','BRO',46,21,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'PD','GOA',31,52,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'COL','PAT',40,24,'SEASON','REGULAR',0,0,'',NULL),(2019,10,'CAF','SAL',7,40,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'GT','PAT',27,35,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'GAN','SAL',38,33,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'CHA','BRO',28,33,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'PIR','GOA',26,56,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'TRO','TIZ',32,31,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'ARR','PD',40,38,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'VIL','COL',35,22,'SEASON','REGULAR',0,0,'',NULL),(2019,11,'SKY','CAF',55,21,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'CHA','GAN',29,56,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'PIR','GT',45,46,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'BRO','PAT',30,44,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'SAL','GOA',40,44,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'ARR','VIL',58,51,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'SKY','TRO',13,49,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'CAF','TIZ',25,35,'SEASON','REGULAR',0,0,'',NULL),(2019,12,'PD','COL',35,26,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'CHA','PIR',31,25,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'GAN','GT',48,42,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'PAT','SAL',47,62,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'BRO','GOA',31,37,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'VIL','SKY',25,51,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'TRO','ARR',35,43,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'TIZ','PD',42,34,'SEASON','REGULAR',0,0,'',NULL),(2019,13,'COL','CAF',41,49,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'GT','CHA',36,40,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'PIR','GAN',48,54,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'PAT','GOA',39,41,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'SAL','BRO',59,42,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'TRO','VIL',45,48,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'SKY','ARR',45,45,'SEASON','BENCH',21,20,'',NULL),(2019,14,'COL','TIZ',42,47,'SEASON','REGULAR',0,0,'',NULL),(2019,14,'PD','CAF',24,29,'SEASON','REGULAR',0,0,'',NULL),(2019,15,'SKY','TIZ',31,57,'DIVISIONAL','REGULAR',0,0,'',NULL),(2019,15,'VIL','TRO',54,38,'DIVISIONAL','REGULAR',0,0,'GUEST',NULL),(2020,1,'SKY','VIL',56,47,'SEASON','REGULAR',0,0,'GUEST',''),(2020,1,'PD','TIZ',40,52,'SEASON','REGULAR',0,0,'HOME',''),(2020,1,'PIR','BRO',42,46,'SEASON','REGULAR',0,0,'HOME',''),(2020,1,'GAN','PAT',44,47,'SEASON','REGULAR',0,0,'HOME',''),(2020,1,'CHA','GOA',37,45,'SEASON','REGULAR',0,0,'HOME',''),(2020,1,'ARR','COL',30,46,'SEASON','REGULAR',0,0,'HOME',''),(2020,1,'CAF','GT',29,63,'SEASON','REGULAR',0,0,'HOME',''),(2020,1,'TRO','SAL',43,62,'SEASON','REGULAR',0,0,'HOME',''),(2020,2,'GT','CHA',31,51,'SEASON','REGULAR',0,0,'HOME',''),(2020,2,'GOA','BRO',37,53,'SEASON','REGULAR',0,0,'HOME',''),(2020,2,'VIL','TRO',37,55,'SEASON','REGULAR',0,0,'HOME',''),(2020,2,'CAF','COL',38,45,'SEASON','REGULAR',0,0,'HOME',''),(2020,2,'PIR','PAT',37,30,'SEASON','REGULAR',0,0,'GUEST',''),(2020,2,'SKY','TIZ',40,53,'SEASON','REGULAR',0,0,'HOME',''),(2020,2,'GAN','PD',67,43,'SEASON','REGULAR',0,0,'GUEST',''),(2020,2,'SAL','ARR',75,51,'SEASON','REGULAR',0,0,'GUEST',''),(2020,3,'GAN','PIR',33,61,'SEASON','REGULAR',0,0,'HOME',''),(2020,3,'PAT','GOA',38,37,'SEASON','REGULAR',0,0,'GUEST',''),(2020,3,'TRO','ARR',57,41,'SEASON','REGULAR',0,0,'GUEST',''),(2020,3,'TIZ','CAF',36,53,'SEASON','REGULAR',0,0,'HOME',''),(2020,3,'CHA','SAL',75,75,'SEASON','BENCH',25,10,'GUEST',''),(2020,3,'PD','SKY',35,42,'SEASON','REGULAR',0,0,'HOME',''),(2020,3,'GT','COL',41,60,'SEASON','REGULAR',0,0,'HOME',''),(2020,3,'BRO','VIL',55,34,'SEASON','REGULAR',0,0,'GUEST',''),(2020,4,'SAL','BRO',52,60,'SEASON','REGULAR',0,0,'HOME',''),(2020,4,'SKY','TRO',17,58,'SEASON','REGULAR',0,0,'HOME',''),(2020,4,'VIL','ARR',40,53,'SEASON','REGULAR',0,0,'HOME',''),(2020,4,'COL','TIZ',38,46,'SEASON','REGULAR',0,0,'HOME',''),(2020,4,'GOA','GAN',39,37,'SEASON','REGULAR',0,0,'GUEST',''),(2020,4,'PAT','CHA',32,43,'SEASON','REGULAR',0,0,'HOME',''),(2020,4,'PIR','CAF',47,32,'SEASON','REGULAR',0,0,'GUEST',''),(2020,4,'PD','GT',27,51,'SEASON','REGULAR',0,0,'HOME',''),(2020,5,'CHA','PIR',51,44,'SEASON','REGULAR',0,0,'GUEST',''),(2020,5,'TIZ','PD',24,43,'SEASON','REGULAR',0,0,'HOME',''),(2020,5,'BRO','GT',19,48,'SEASON','REGULAR',0,0,'HOME',''),(2020,5,'COL','TRO',35,31,'SEASON','REGULAR',0,0,'GUEST',''),(2020,5,'GAN','CAF',67,39,'SEASON','REGULAR',0,0,'GUEST',''),(2020,5,'ARR','PAT',38,37,'SEASON','REGULAR',0,0,'GUEST',''),(2020,5,'GOA','SKY',25,42,'SEASON','REGULAR',0,0,'HOME',''),(2020,5,'VIL','SAL',40,52,'SEASON','REGULAR',0,0,'HOME',''),(2020,6,'GAN','CHA',49,31,'SEASON','REGULAR',0,0,'GUEST',''),(2020,6,'PAT','SAL',22,22,'SEASON','BENCH',24,20,'GUEST',''),(2020,6,'ARR','SKY',36,22,'SEASON','REGULAR',0,0,'GUEST',''),(2020,6,'PD','COL',40,43,'SEASON','REGULAR',0,0,'HOME',''),(2020,6,'GOA','PIR',37,21,'SEASON','REGULAR',0,0,'GUEST',''),(2020,6,'VIL','CAF',49,37,'SEASON','REGULAR',0,0,'GUEST',''),(2020,6,'GT','TIZ',45,45,'SEASON','BENCH',36,28,'GUEST',''),(2020,6,'BRO','TRO',26,47,'SEASON','REGULAR',0,0,'HOME',''),(2020,7,'PIR','GT',46,16,'SEASON','REGULAR',0,0,'GUEST',''),(2020,7,'COL','CAF',32,62,'SEASON','REGULAR',0,0,'HOME',''),(2020,7,'SAL','GAN',42,51,'SEASON','REGULAR',0,0,'HOME',''),(2020,7,'BRO','CHA',36,44,'SEASON','REGULAR',0,0,'HOME',''),(2020,7,'TIZ','TRO',42,40,'SEASON','REGULAR',0,0,'GUEST',''),(2020,7,'PD','ARR',33,37,'SEASON','REGULAR',0,0,'HOME',''),(2020,7,'SKY','PAT',27,36,'SEASON','REGULAR',0,0,'HOME',''),(2020,7,'VIL','GOA',35,63,'SEASON','REGULAR',0,0,'HOME',''),(2020,8,'GAN','BRO',32,37,'SEASON','REGULAR',0,0,'HOME',''),(2020,8,'GT','SAL',45,42,'SEASON','REGULAR',0,0,'GUEST',''),(2020,8,'ARR','TIZ',27,42,'SEASON','REGULAR',0,0,'HOME',''),(2020,8,'CAF','SKY',26,41,'SEASON','REGULAR',0,0,'HOME',''),(2020,8,'PIR','PD',30,29,'SEASON','REGULAR',0,0,'GUEST',''),(2020,8,'CHA','COL',65,37,'SEASON','REGULAR',0,0,'GUEST',''),(2020,8,'PAT','VIL',34,50,'SEASON','REGULAR',0,0,'HOME',''),(2020,8,'TRO','GOA',40,55,'SEASON','REGULAR',0,0,'HOME',''),(2020,9,'PIR','GAN',42,44,'SEASON','REGULAR',0,0,'HOME',''),(2020,9,'CHA','GT',40,40,'SEASON','BENCH',8,13,'HOME',''),(2020,9,'GOA','SAL',36,38,'SEASON','REGULAR',0,0,'HOME',''),(2020,9,'CAF','PD',7,50,'SEASON','REGULAR',0,0,'HOME',''),(2020,9,'TIZ','VIL',42,48,'SEASON','REGULAR',0,0,'HOME',''),(2020,9,'SKY','COL',57,37,'SEASON','REGULAR',0,0,'GUEST',''),(2020,9,'PAT','TRO',31,23,'SEASON','REGULAR',0,0,'GUEST',''),(2020,9,'ARR','BRO',26,39,'SEASON','REGULAR',0,0,'HOME',''),(2020,10,'SAL','PIR',23,39,'SEASON','REGULAR',0,0,'HOME',''),(2020,10,'PAT','GT',36,50,'SEASON','REGULAR',0,0,'HOME',''),(2020,10,'TRO','CAF',31,30,'SEASON','REGULAR',0,0,'GUEST',''),(2020,10,'COL','VIL',30,49,'SEASON','REGULAR',0,0,'HOME',''),(2020,10,'TIZ','GAN',33,38,'SEASON','REGULAR',0,0,'HOME',''),(2020,10,'PD','CHA',35,36,'SEASON','REGULAR',0,0,'HOME',''),(2020,10,'GOA','ARR',32,31,'SEASON','REGULAR',0,0,'GUEST',''),(2020,10,'SKY','BRO',53,47,'SEASON','REGULAR',0,0,'GUEST',''),(2020,11,'BRO','PAT',37,37,'SEASON','BENCH',25,10,'GUEST',''),(2020,11,'ARR','VIL',35,58,'SEASON','REGULAR',0,0,'HOME',''),(2020,11,'GT','GOA',44,38,'SEASON','REGULAR',0,0,'GUEST',''),(2020,11,'TRO','PD',35,31,'SEASON','REGULAR',0,0,'GUEST',''),(2020,11,'TIZ','PIR',31,33,'SEASON','REGULAR',0,0,'HOME',''),(2020,11,'COL','GAN',29,50,'SEASON','REGULAR',0,0,'HOME',''),(2020,11,'CAF','CHA',39,38,'SEASON','REGULAR',0,0,'GUEST',''),(2020,11,'SAL','SKY',43,51,'SEASON','REGULAR',0,0,'HOME',''),(2020,12,'GT','GAN',28,43,'SEASON','REGULAR',0,0,'HOME',''),(2020,12,'SAL','PAT',28,34,'SEASON','REGULAR',0,0,'HOME',''),(2020,12,'BRO','GOA',54,50,'SEASON','REGULAR',0,0,'GUEST',''),(2020,12,'TRO','SKY',34,43,'SEASON','REGULAR',0,0,'HOME',''),(2020,12,'VIL','PD',79,26,'SEASON','REGULAR',0,0,'GUEST',''),(2020,12,'CAF','ARR',39,51,'SEASON','REGULAR',0,0,'HOME',''),(2020,12,'COL','PIR',47,65,'SEASON','REGULAR',0,0,'HOME',''),(2020,12,'CHA','TIZ',62,25,'SEASON','REGULAR',0,0,'GUEST',''),(2020,13,'GT','PIR',32,55,'SEASON','REGULAR',0,0,'HOME',''),(2020,13,'CHA','GAN',41,41,'SEASON','BENCH',2,41,'HOME',''),(2020,13,'SAL','GOA',36,51,'SEASON','REGULAR',0,0,'HOME',''),(2020,13,'PAT','BRO',19,48,'SEASON','REGULAR',0,0,'HOME',''),(2020,13,'ARR','TRO',40,44,'SEASON','REGULAR',0,0,'HOME',''),(2020,13,'VIL','SKY',35,40,'SEASON','REGULAR',0,0,'HOME',''),(2020,13,'CAF','TIZ',33,37,'SEASON','REGULAR',0,0,'HOME',''),(2020,13,'COL','PD',39,38,'SEASON','REGULAR',0,0,'GUEST',''),(2020,14,'PIR','CHA',61,54,'SEASON','REGULAR',0,0,'GUEST',''),(2020,14,'GAN','GT',29,49,'SEASON','REGULAR',0,0,'HOME',''),(2020,14,'GOA','PAT',45,21,'SEASON','REGULAR',0,0,'GUEST',''),(2020,14,'BRO','SAL',42,53,'SEASON','REGULAR',0,0,'HOME',''),(2020,14,'TRO','VIL',27,47,'SEASON','REGULAR',0,0,'HOME',''),(2020,14,'SKY','ARR',36,48,'SEASON','REGULAR',0,0,'HOME',''),(2020,14,'TIZ','COL',32,49,'SEASON','REGULAR',0,0,'HOME',''),(2020,14,'PD','CAF',30,30,'SEASON','BENCH',1,47,'HOME',''),(2020,15,'GT','PIR',50,40,'DIVISIONAL','REGULAR',0,0,'GUEST',''),(2020,15,'GAN','BRO',56,39,'DIVISIONAL','REGULAR',0,0,'GUEST',''),(2020,15,'VIL','COL',48,61,'DIVISIONAL','REGULAR',0,0,'HOME',''),(2020,15,'TRO','SKY',34,38,'DIVISIONAL','REGULAR',0,0,'HOME',''),(2020,16,'GT','GAN',37,47,'CONFERENCE_FINAL','REGULAR',0,0,'HOME',''),(2020,16,'COL','SKY',45,41,'CONFERENCE_FINAL','REGULAR',0,0,'GUEST',''),(2020,17,'GAN','COL',65,44,'NOPAL_BOWL','REGULAR',0,0,'GUEST','N');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `division_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_matches`
--

DROP TABLE IF EXISTS `temp_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_matches` (
  `id` smallint(6) DEFAULT NULL,
  `season_id` smallint(6) DEFAULT NULL,
  `week` tinyint(4) DEFAULT NULL,
  `guest_team` varchar(3) DEFAULT NULL,
  `home_team` varchar(3) DEFAULT NULL,
  `scope` enum('D','C','L') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_matches`
--

LOCK TABLES `temp_matches` WRITE;
/*!40000 ALTER TABLE `temp_matches` DISABLE KEYS */;
INSERT INTO `temp_matches` VALUES (1,2020,3,'GAN','PIR','D'),(2,2020,5,'CHA','PIR','D'),(3,2020,13,'GT','PIR','D'),(4,2020,9,'PIR','GAN','D'),(5,2020,13,'CHA','GAN','D'),(6,2020,12,'GT','GAN','D'),(7,2020,14,'PIR','CHA','D'),(8,2020,6,'GAN','CHA','D'),(9,2020,2,'GT','CHA','D'),(10,2020,7,'PIR','GT','D'),(11,2020,14,'GAN','GT','D'),(12,2020,9,'CHA','GT','D'),(13,2020,14,'GOA','PAT','D'),(14,2020,11,'BRO','PAT','D'),(15,2020,12,'SAL','PAT','D'),(16,2020,3,'PAT','GOA','D'),(17,2020,12,'BRO','GOA','D'),(18,2020,13,'SAL','GOA','D'),(19,2020,13,'PAT','BRO','D'),(20,2020,2,'GOA','BRO','D'),(21,2020,4,'SAL','BRO','D'),(22,2020,6,'PAT','SAL','D'),(23,2020,9,'GOA','SAL','D'),(24,2020,14,'BRO','SAL','D'),(25,2020,2,'VIL','TRO','D'),(26,2020,13,'ARR','TRO','D'),(27,2020,4,'SKY','TRO','D'),(28,2020,14,'TRO','VIL','D'),(29,2020,11,'ARR','VIL','D'),(30,2020,1,'SKY','VIL','D'),(31,2020,3,'TRO','ARR','D'),(32,2020,4,'VIL','ARR','D'),(33,2020,14,'SKY','ARR','D'),(34,2020,12,'TRO','SKY','D'),(35,2020,13,'VIL','SKY','D'),(36,2020,6,'ARR','SKY','D'),(37,2020,14,'TIZ','COL','D'),(38,2020,6,'PD','COL','D'),(39,2020,2,'CAF','COL','D'),(40,2020,4,'COL','TIZ','D'),(41,2020,1,'PD','TIZ','D'),(42,2020,13,'CAF','TIZ','D'),(43,2020,13,'COL','PD','D'),(44,2020,5,'TIZ','PD','D'),(45,2020,9,'CAF','PD','D'),(46,2020,7,'COL','CAF','D'),(47,2020,3,'TIZ','CAF','D'),(48,2020,14,'PD','CAF','D'),(49,2020,2,'PIR','PAT','C'),(50,2020,6,'GOA','PIR','C'),(51,2020,1,'PIR','BRO','C'),(52,2020,10,'SAL','PIR','C'),(53,2020,1,'GAN','PAT','C'),(54,2020,4,'GOA','GAN','C'),(55,2020,8,'GAN','BRO','C'),(56,2020,7,'SAL','GAN','C'),(57,2020,4,'PAT','CHA','C'),(58,2020,1,'CHA','GOA','C'),(59,2020,7,'BRO','CHA','C'),(60,2020,3,'CHA','SAL','C'),(61,2020,10,'PAT','GT','C'),(62,2020,11,'GT','GOA','C'),(63,2020,5,'BRO','GT','C'),(64,2020,8,'GT','SAL','C'),(65,2020,5,'COL','TRO','C'),(66,2020,7,'TIZ','TRO','C'),(67,2020,11,'TRO','PD','C'),(68,2020,10,'TRO','CAF','C'),(69,2020,10,'COL','VIL','C'),(70,2020,9,'TIZ','VIL','C'),(71,2020,12,'VIL','PD','C'),(72,2020,6,'VIL','CAF','C'),(73,2020,1,'ARR','COL','C'),(74,2020,8,'ARR','TIZ','C'),(75,2020,7,'PD','ARR','C'),(76,2020,12,'CAF','ARR','C'),(77,2020,9,'SKY','COL','C'),(78,2020,2,'SKY','TIZ','C'),(79,2020,3,'PD','SKY','C'),(80,2020,8,'CAF','SKY','C'),(81,2020,12,'COL','PIR','L'),(82,2020,11,'TIZ','PIR','L'),(83,2020,8,'PIR','PD','L'),(84,2020,4,'PIR','CAF','L'),(85,2020,11,'COL','GAN','L'),(86,2020,10,'TIZ','GAN','L'),(87,2020,2,'GAN','PD','L'),(88,2020,5,'GAN','CAF','L'),(89,2020,8,'CHA','COL','L'),(90,2020,12,'CHA','TIZ','L'),(91,2020,10,'PD','CHA','L'),(92,2020,11,'CAF','CHA','L'),(93,2020,3,'GT','COL','L'),(94,2020,6,'GT','TIZ','L'),(95,2020,4,'PD','GT','L'),(96,2020,1,'CAF','GT','L'),(97,2020,9,'PAT','TRO','L'),(98,2020,8,'PAT','VIL','L'),(99,2020,5,'ARR','PAT','L'),(100,2020,7,'SKY','PAT','L'),(101,2020,8,'TRO','GOA','L'),(102,2020,7,'VIL','GOA','L'),(103,2020,10,'GOA','ARR','L'),(104,2020,5,'GOA','SKY','L'),(105,2020,6,'BRO','TRO','L'),(106,2020,3,'BRO','VIL','L'),(107,2020,9,'ARR','BRO','L'),(108,2020,10,'SKY','BRO','L'),(109,2020,1,'TRO','SAL','L'),(110,2020,5,'VIL','SAL','L'),(111,2020,2,'SAL','ARR','L'),(112,2020,11,'SAL','SKY','L');
/*!40000 ALTER TABLE `temp_matches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-11 12:44:03
