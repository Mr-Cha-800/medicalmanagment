-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: medical
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `achat`
--

DROP TABLE IF EXISTS `achat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_fact` int(11) NOT NULL,
  `id_produit` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `montant` float NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achat`
--

LOCK TABLES `achat` WRITE;
/*!40000 ALTER TABLE `achat` DISABLE KEYS */;
INSERT INTO `achat` VALUES (109,80,'12385j',1,800,800),(110,81,'12385j',1,800,800),(111,81,'2N6DJK',1,200,200),(112,81,'kjhg',3,960,960),(113,82,'sdq',1,512,512),(114,82,'kjhg',1,960,960),(115,82,'dgfhjkl',1,512,512),(116,82,'2N6DJK',1,200,200),(117,82,'12385j',1,800,800);
/*!40000 ALTER TABLE `achat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyinfo`
--

DROP TABLE IF EXISTS `companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyinfo` (
  `NumRegistreComm` text NOT NULL,
  `NumArtImp` text NOT NULL,
  `Tva` float NOT NULL,
  `NumIdFisc` text NOT NULL,
  `TelOne` text NOT NULL,
  `TelTwo` text NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinfo`
--

LOCK TABLES `companyinfo` WRITE;
/*!40000 ALTER TABLE `companyinfo` DISABLE KEYS */;
INSERT INTO `companyinfo` VALUES ('22 / 00 - 0171155A20','2284.4529.401',9,'182224500652142','06 97 07 94 54','07 74 84 40 90',1);
/*!40000 ALTER TABLE `companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devis_facture`
--

DROP TABLE IF EXISTS `devis_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devis_facture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Annee` int(5) NOT NULL,
  `foreignID` int(11) NOT NULL,
  `datee` date DEFAULT NULL,
  `foreignyear` int(5) NOT NULL,
  `patient_nom` text NOT NULL,
  `patient_prenom` text NOT NULL,
  `patient_datenaiss` text NOT NULL,
  `patient_lieunaiss` text NOT NULL,
  `etat` varchar(20) NOT NULL,
  `montant_total` float NOT NULL,
  `identifier` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devis_facture`
--

LOCK TABLES `devis_facture` WRITE;
/*!40000 ALTER TABLE `devis_facture` DISABLE KEYS */;
INSERT INTO `devis_facture` VALUES (80,2020,175757643,'2020-12-13',2020,'Chaker','Dorbane','2020-12-09','mlkjh','finalisé',800,1016),(81,2020,175757643,'2020-12-14',2020,'Chaker','Dorbane','2020-12-11','sq','finalisé',3880,3537),(82,2020,175757643,'2020-12-14',2020,'Chaker','Dorbane','2020-12-23','qq','finalisé',2984,5024);
/*!40000 ALTER TABLE `devis_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dossier`
--

DROP TABLE IF EXISTS `dossier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dossier` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `NumSecSocial` text NOT NULL,
  `NumTel` text NOT NULL,
  `Caisse` text NOT NULL,
  `Wilaya` text NOT NULL,
  `year` int(5) NOT NULL,
  `identifier` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=175757654 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dossier`
--

LOCK TABLES `dossier` WRITE;
/*!40000 ALTER TABLE `dossier` DISABLE KEYS */;
INSERT INTO `dossier` VALUES (175757643,'Chaker','Dorbane','12 5482 3686 42','05 59 34 15 27','CNAS','ALGER',2020,0);
/*!40000 ALTER TABLE `dossier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `NumRef` varchar(15) NOT NULL,
  `Designation` longtext NOT NULL,
  `PrixU` float NOT NULL,
  `quantity` int(11) DEFAULT '1',
  PRIMARY KEY (`NumRef`),
  UNIQUE KEY `NumRef_UNIQUE` (`NumRef`),
  FULLTEXT KEY `NumRef` (`NumRef`,`Designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES ('12385j','une chaise une chaise une chaise une chaise une chaise une chaise ',800,1),('2N6DJK','Un marteau Un marteau Un marteau Un marteau Un marteau Un marteau Un marteau Un',200,1),('dgfhjkl',' une fenetre une fenetre une fenetre une fenetre une fenetre une fenetre une fenetre ',512,1),('kjhg',' un ordinateurun ordinateurun ordinateurun ordinateurun ordinateurun ordinateurun ordinateur',960,1),('sdq','un verraeayehabea un verraeayehabea un verraeayehabea un verraeayehabea un verraeayehabea un verraeayehabea un verraeayehabea un verraeayehabea un verraeayehabea ',512,1);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14  3:33:21
