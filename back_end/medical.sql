-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 18, 2021 at 06:25 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `medical`
--

-- --------------------------------------------------------

--
-- Table structure for table `achat`
--

CREATE TABLE `achat` (
  `id` int(11) NOT NULL,
  `id_fact` int(11) NOT NULL,
  `id_produit` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tax` int(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achat`
--

INSERT INTO `achat` (`id`, `id_fact`, `id_produit`, `quantity`, `montant`, `price`, `tax`) VALUES
(1, 32, 'TR29N36', 1, '86413.91', '86413.91', 1),
(2, 43, 'OI59N50', 1, '44401.35', '44401.35', 1),
(3, 54, 'PI06ZP63A', 1, '60000.81', '60000.81', 1),
(4, 56, 'PI03ZF98R', 1, '506525.74', '506525.74', 1),
(5, 62, 'OI36N01', 1, '60073.36', '60073.36', 1),
(6, 64, 'PI06ZF98A', 2, '285343.18', '285343.18', 1),
(7, 69, 'PI03ZF98N', 1, '811387.87', '811387.87', 1),
(8, 76, 'OI59M50', 1, '34172.50', '34172.50', 1),
(9, 77, 'OI39N53', 2, '49325.64', '49325.64', 1),
(10, 78, '701', 2, '12997.74', '12997.74', 1),
(11, 78, 'AS52', 2, '940.30', '940.30', 1),
(12, 79, 'TR43N01', 1, '97300.25', '97300.25', 1),
(13, 83, 'PI06ZP64A', 1, '56555.07', '56555.07', 1),
(14, 94, '705', 1, '12260.50', '12260.50', 1),
(15, 94, '709', 1, '4690.66', '4690.66', 1),
(16, 94, 'AR31', 1, '2938.62', '2938.62', 1),
(17, 94, '32', 1, '2928.10', '2928.10', 1),
(18, 94, 'AS52', 1, '940.30', '940.30', 1),
(19, 94, '47', 1, '938.12', '938.12', 1),
(20, 96, 'TR49N50', 1, '75855.92', '75855.92', 1),
(21, 102, '701', 2, '12997.74', '12997.74', 1),
(22, 102, 'AS52', 2, '940.30', '940.30', 1),
(23, 102, 'AR31', 1, '2938.62', '2938.62', 1),
(24, 99, 'TR39N51', 1, '99817.50', '99817.50', 1),
(25, 100, '701', 2, '12997.74', '12997.74', 1),
(26, 100, 'AS52', 2, '940.30', '940.30', 1),
(27, 101, 'PI03ZS63D', 1, '190677.52', '190677.52', 1),
(28, 106, 'RI06SF601', 1, '29000.00', '29000.00', 1),
(29, 107, '701', 2, '12997.74', '12997.74', 1),
(30, 107, 'AS52', 2, '940.30', '940.30', 1),
(31, 109, 'PI06ZF95A', 2, '282794.33', '282794.33', 1),
(32, 104, 'PI06ZF98A', 1, '285343.18', '285343.18', 1),
(33, 108, 'OI39N53', 2, '49325.64', '49325.64', 1),
(34, 127, 'PI03ZF98P', 1, '874283.81', '874283.81', 1),
(35, 116, 'PI03ZF95R', 1, '503976.89', '503976.89', 1),
(36, 118, 'PI03ZP64D', 1, '89219.28', '89219.28', 1),
(37, 119, 'PI06ZF95A', 1, '282794.33', '282794.33', 1),
(38, 123, 'PI03ZP64D', 1, '89219.28', '89219.28', 1),
(39, 125, '701', 2, '12997.74', '12997.74', 1),
(40, 125, 'AS52', 2, '940.30', '940.30', 1),
(41, 126, 'PI03ZP64D', 1, '89219.28', '89219.28', 1),
(42, 128, 'TR79N35', 1, '31782.83', '31782.83', 1),
(43, 129, 'OI36N02', 2, '60664.39', '60664.39', 1),
(44, 130, 'PI06ZP63A', 1, '60000.81', '60000.81', 1),
(45, 131, 'TR49N50', 1, '75855.92', '75855.92', 1),
(46, 46, 'PI03ZF98N', 1, '811387.87', '811387.87', 1),
(47, 133, 'PI06ZN85A', 1, '153948.91', '153948.91', 1);

-- --------------------------------------------------------

--
-- Table structure for table `achatdevis`
--

CREATE TABLE `achatdevis` (
  `id` int(11) NOT NULL,
  `id_fact` int(11) DEFAULT NULL,
  `id_produit` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `tax` int(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achatdevis`
--

INSERT INTO `achatdevis` (`id`, `id_fact`, `id_produit`, `quantity`, `montant`, `price`, `tax`) VALUES
(1, 1, '701', 2, '12997.74', '12997.74', 1),
(2, 1, 'AS52', 2, '940.30', '940.30', 1),
(3, 2, 'PI03ZF98N', 1, '811387.87', '811387.87', 1),
(4, 3, 'PI03ZF98N', 1, '811387.87', '811387.87', 1),
(5, 4, 'PI03ZP64D', 1, '89219.28', '89219.28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `companyinfo`
--

CREATE TABLE `companyinfo` (
  `NumRegistreComm` text NOT NULL,
  `NumArtImp` text NOT NULL,
  `Tva` float NOT NULL,
  `NumIdFisc` text NOT NULL,
  `TelOne` text NOT NULL,
  `TelTwo` text NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companyinfo`
--

INSERT INTO `companyinfo` (`NumRegistreComm`, `NumArtImp`, `Tva`, `NumIdFisc`, `TelOne`, `TelTwo`, `Id`) VALUES
('22 / 00 - 0171155A20', '2284.4529.401', 9, '182224500652142', '06 97 07 94 54', '07 74 84 40 90', 1);

-- --------------------------------------------------------

--
-- Table structure for table `devis_berk`
--

CREATE TABLE `devis_berk` (
  `ID` int(11) NOT NULL,
  `Annee` int(5) NOT NULL,
  `foreignID` int(11) NOT NULL,
  `datee` date DEFAULT NULL,
  `foreignyear` int(5) NOT NULL,
  `Numsecsocial` text,
  `Caisse` text,
  `Wilaya` text,
  `patient_nom` text NOT NULL,
  `patient_prenom` text NOT NULL,
  `patient_datenaiss` text NOT NULL,
  `patient_lieunaiss` text NOT NULL,
  `etat` varchar(20) NOT NULL,
  `remise` int(11) DEFAULT '0',
  `montant_total` decimal(10,2) NOT NULL,
  `montant_TTC` decimal(10,2) DEFAULT '0.00',
  `Tva` decimal(10,2) DEFAULT '0.00',
  `Cash` int(3) NOT NULL DEFAULT '1',
  `identifier` float NOT NULL,
  `TVAonly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Remiseonly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TTConly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Nom_Prenom` text,
  `ID_seyed` text,
  `date_cree` date DEFAULT NULL,
  `date_delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devis_berk`
--

INSERT INTO `devis_berk` (`ID`, `Annee`, `foreignID`, `datee`, `foreignyear`, `Numsecsocial`, `Caisse`, `Wilaya`, `patient_nom`, `patient_prenom`, `patient_datenaiss`, `patient_lieunaiss`, `etat`, `remise`, `montant_total`, `montant_TTC`, `Tva`, `Cash`, `identifier`, `TVAonly`, `Remiseonly`, `TTConly`, `Nom_Prenom`, `ID_seyed`, `date_cree`, `date_delivery`) VALUES
(1, 2020, 50, '2020-08-20', 2020, '', 'CASH', '', 'MIR', 'MOHAMED', '2018-08-23', 'ORAN', 'non-finalisé', NULL, '27876.08', '30384.93', '9.00', 0, 0, '2508.85', '0.00', '30384.93', NULL, NULL, '2020-08-20', NULL),
(2, 2020, 81, '2020-11-11', 2020, '', 'CASH', '', 'KHETTAR', 'ABDEL ILLAH', '2000-01-20', 'TLEMCEN', 'non-finalisé', NULL, '811387.87', '884412.78', '9.00', 0, 0, '73024.91', '0.00', '884412.78', NULL, NULL, '2020-11-11', NULL),
(3, 2020, 104, '2021-11-05', 2020, '', 'CASH', '', 'KHEDDAR', 'MUSTAPHA', '2001-11-22', 'SAIDA', 'non-finalisé', 99, '811387.87', '884412.78', '9.00', 0, 0, '900.00', '801387.87', '10900.00', NULL, NULL, '2020-11-05', NULL),
(4, 2020, 112, '2020-11-19', 2020, '', 'CASH', '', 'MERABET', 'BOUMEDYEN', '1986-07-05', 'SIDI BEL ABBES', 'non-finalisé', NULL, '89219.28', '97249.02', '9.00', 0, 0, '8029.74', '0.00', '97249.02', NULL, NULL, '2020-11-19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `devis_facture`
--

CREATE TABLE `devis_facture` (
  `ID` int(11) NOT NULL,
  `Annee` int(5) NOT NULL,
  `foreignID` int(11) NOT NULL,
  `datee` date DEFAULT NULL,
  `foreignyear` int(5) NOT NULL,
  `Numsecsocial` text,
  `Caisse` text,
  `Wilaya` text,
  `patient_nom` text NOT NULL,
  `patient_prenom` text NOT NULL,
  `patient_datenaiss` text NOT NULL,
  `patient_lieunaiss` text NOT NULL,
  `etat` varchar(20) NOT NULL,
  `remise` int(11) DEFAULT '0',
  `montant_total` decimal(10,2) NOT NULL,
  `montant_TTC` decimal(10,2) DEFAULT '0.00',
  `Tva` decimal(10,2) DEFAULT '0.00',
  `Cash` int(3) NOT NULL DEFAULT '1',
  `identifier` float NOT NULL,
  `TVAonly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Remiseonly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TTConly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Nom_Prenom` text,
  `ID_seyed` text,
  `date_cree` date DEFAULT NULL,
  `date_delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `devis_facture`
--

INSERT INTO `devis_facture` (`ID`, `Annee`, `foreignID`, `datee`, `foreignyear`, `Numsecsocial`, `Caisse`, `Wilaya`, `patient_nom`, `patient_prenom`, `patient_datenaiss`, `patient_lieunaiss`, `etat`, `remise`, `montant_total`, `montant_TTC`, `Tva`, `Cash`, `identifier`, `TVAonly`, `Remiseonly`, `TTConly`, `Nom_Prenom`, `ID_seyed`, `date_cree`, `date_delivery`) VALUES
(32, 2020, 25, '2020-06-23', 2020, '120136001080', 'CNAS', 'SAIDA', 'MISSOUNI', 'IMADEDDINE', '2012-04-09', 'Saida', 'non-finalisé', NULL, '86413.91', '94191.16', '9.00', 0, 0, '7777.25', '0.00', '94191.16', NULL, NULL, '2020-06-23', NULL),
(43, 2020, 36, '2020-07-28', 2020, '949 947', 'CAMSSP', '', 'SAHNIN', 'RAYAN TAYEB', '2015-07-03', 'SIDI BEL ABBES', 'non-finalisé', 10, '44401.35', '48397.47', '9.00', 0, 0, '3596.51', '4440.14', '43557.72', NULL, NULL, '2020-07-28', NULL),
(46, 2020, 43, '2020-08-08', 2020, '75 0003 0042 68', 'CNAS', 'MASCARA', 'DALI', 'MAHFOUD', '1975-01-01', 'MASCARA', 'non-finalisé', NULL, '811387.87', '884412.78', '9.00', 0, 0, '73024.91', '0.00', '884412.78', NULL, NULL, '2020-08-08', NULL),
(54, 2020, 55, '2020-08-30', 2020, '46 0090 0068 47', 'CNAS', 'SIDI BEL ABBES', 'OUZROUT', 'ABDELKADER', '1946-05-29', 'TAREF', 'non-finalisé', NULL, '60000.81', '65400.88', '9.00', 0, 0, '5400.07', '0.00', '65400.88', NULL, NULL, '2020-08-30', NULL),
(56, 2020, 57, '2020-08-31', 2020, '71 1222 0029 61', 'CNAS', 'AIN TEMOUCHENT', 'ZEKRAOUI', 'MOHAMED', '1971-07-29', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '506525.74', '552113.06', '9.00', 0, 0, '45587.32', '0.00', '552113.06', NULL, NULL, '2020-08-31', NULL),
(62, 2020, 66, '2020-09-15', 2020, '74 0203 0069 55', 'CNAS', 'SIDI BEL ABBES', 'HABIBECHE', 'MOHAMED NADIR', '2014-09-03', 'SIDI BEL ABBES', 'non-finalisé', NULL, '60073.36', '65479.96', '9.00', 0, 0, '5406.60', '0.00', '65479.96', NULL, NULL, '2020-09-15', NULL),
(64, 2020, 68, '2020-09-16', 2020, '89 0395 0003 45', 'CNAS', 'AIN TEMOUCHENT', 'BENCHIKH', 'MOHAMED', '1989-05-12', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '570686.36', '622048.13', '9.00', 0, 0, '51361.77', '0.00', '622048.13', NULL, NULL, '2020-09-16', NULL),
(69, 2020, 73, '2020-09-23', 2020, '92 0005 0002 72', 'CNAS', 'TEBESSA', 'ROUABHIA', 'MOHAMMED', '1992-03-21', 'TBESSA', 'non-finalisé', NULL, '811387.87', '884412.78', '9.00', 0, 0, '73024.91', '0.00', '884412.78', NULL, NULL, '2020-09-23', NULL),
(76, 2020, 83, '2020-10-05', 2020, '91 0991 0068 32', 'CNAS', 'MASCARA', 'ATTOU', 'HOUCINE', '1991-06-10', 'MASCARA', 'non-finalisé', NULL, '34172.50', '37248.03', '9.00', 0, 0, '3075.53', '0.00', '37248.03', NULL, NULL, '2021-10-05', NULL),
(77, 2020, 85, '2020-10-06', 2020, '15 7438 0004 56', 'CNAS', 'TLEMCEN', 'BENDELAA', 'MOHAMED RAYANE', '2015-06-06', 'TLEMCEN', 'non-finalisé', NULL, '98651.28', '107529.90', '9.00', 0, 0, '8878.62', '0.00', '107529.90', NULL, NULL, '2020-10-06', NULL),
(78, 2020, 85, '2020-10-06', 2020, '15 7438 0004 56', 'CNAS', 'TLEMCEN', 'BENDELAA', 'MOHAMED RAYANE', '2015-06-06', 'TLEMCEN', 'non-finalisé', NULL, '27876.08', '30384.93', '9.00', 0, 5943, '2508.85', '0.00', '30384.93', NULL, NULL, '2020-10-06', NULL),
(79, 2020, 85, '2020-10-06', 2020, '15 7438 0004 56', 'CNAS', 'TLEMCEN', 'BENDELAA', 'MOHAMED RAYANE', '2015-06-06', 'TLEMCEN', 'non-finalisé', NULL, '97300.25', '106057.27', '9.00', 0, 2298, '8757.02', '0.00', '106057.27', NULL, NULL, '2020-10-06', NULL),
(83, 2020, 86, '2020-10-14', 2020, '39 0178 0003 58', 'CNAS', 'CHLEF', 'BAHRI', 'FEDJ', '1939-09-04', 'CHLEF', 'non-finalisé', NULL, '56555.07', '61645.03', '9.00', 0, 0, '5089.96', '0.00', '61645.03', NULL, NULL, '2020-10-14', NULL),
(94, 2020, 99, '2020-10-27', 2020, '79 0435 0048 45', 'CASNOS', 'MOSTAGANEM', 'MOURAD', 'SEDDAK', '1979-04-08', 'MOSTAGANEM', 'non-finalisé', NULL, '24696.30', '26918.97', '9.00', 0, 0, '2222.67', '0.00', '26918.97', NULL, NULL, '2020-10-27', NULL),
(96, 2020, 103, '2020-11-04', 2020, '54 0032 0448 57', 'CASNOS', 'MASCARA', 'HAOUCINE', 'EL HACHEMI', '1954-01-12', 'MASCARA', 'non-finalisé', NULL, '75855.92', '82682.95', '9.00', 0, 0, '6827.03', '0.00', '82682.95', NULL, NULL, '2020-11-04', NULL),
(99, 2020, 106, '2020-11-07', 2020, '78 3510 0024 56', 'CASNOS', 'MASCARA', 'SI TAYEB', 'MERIEME', '2006-03-03', 'MASCARA', 'non-finalisé', NULL, '99817.50', '108801.08', '9.00', 0, 0, '8983.58', '0.00', '108801.08', NULL, NULL, '2020-11-07', NULL),
(100, 2020, 108, '2020-11-09', 2020, '72 2350 0016 58', 'CNAS', 'ORAN', 'SABEUR CHOUIREF', 'BRAHIM', '2016-08-07', 'ORAN', 'non-finalisé', NULL, '27876.08', '30384.93', '9.00', 0, 0, '2508.85', '0.00', '30384.93', NULL, NULL, '2020-11-09', NULL),
(101, 2020, 110, '2020-11-15', 2020, '599 337', 'CAMSSP', '', 'GUITOUN', 'LAID', '1962-01-01', 'NAAMA', 'non-finalisé', NULL, '190677.52', '207838.50', '9.00', 0, 0, '17160.98', '0.00', '207838.50', NULL, NULL, '2020-11-15', NULL),
(102, 2020, 105, '2020-11-12', 2020, '12 1158 0005 69', 'CNAS', 'SAIDA', 'MEKHRAOUI', 'DOUAA', '2012-02-25', 'SAIDA', 'non-finalisé', NULL, '30814.70', '33588.02', '9.00', 0, 0, '2773.32', '0.00', '33588.02', NULL, NULL, '2020-11-12', NULL),
(104, 2020, 124, '2020-12-09', 2020, '770 875', 'CAMSSP', '', 'CHIKER EL MEOUER', 'KAMEL', '1979-09-27', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '285343.18', '311024.07', '9.00', 0, 0, '25680.89', '0.00', '311024.07', NULL, NULL, '2020-12-09', NULL),
(106, 2020, 115, '2020-11-26', 2020, '765 987', 'CAMSSP', '', 'BELOUADI', 'ABBES', '1978-10-12', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '29000.00', '31610.00', '9.00', 0, 0, '2610.00', '0.00', '31610.00', NULL, NULL, '2020-11-26', NULL),
(107, 2020, 116, '2020-11-28', 2020, '90 6704 0006 52', 'CNAS', 'AIN TEMOUCHENT', 'SAIDANE', 'DJOUD ZIAD', '2017-09-06', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '27876.08', '30384.93', '9.00', 0, 0, '2508.85', '0.00', '30384.93', NULL, NULL, '2020-11-28', NULL),
(108, 2020, 127, '2020-12-15', 2020, '81 0087 0192 38', 'CNAS', 'AIN TEMOUCHENT', 'BENYOUCEF', 'MERIEM SABRIA', '2019-10-05', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '98651.28', '107529.90', '9.00', 0, 0, '8878.62', '0.00', '107529.90', NULL, NULL, '2020-12-15', NULL),
(109, 2020, 118, '2020-12-02', 2020, '73 0059 0166 44', 'CNAS', 'TLEMCEN', 'BOUBEKEUR', 'HAFIDA', '1973-01-31', 'TLEMCEN', 'non-finalisé', NULL, '565588.66', '616491.64', '9.00', 0, 0, '50902.98', '0.00', '616491.64', NULL, NULL, '2020-12-02', NULL),
(116, 2021, 139, '2021-01-13', 2021, '91 0958 0078 31', 'CNAS', 'MASCARA', 'SELLEM', 'SIHEM', '1991-04-09', 'MASCARA', 'non-finalisé', NULL, '503976.89', '549334.81', '9.00', 0, 0, '45357.92', '0.00', '549334.81', NULL, NULL, '2021-01-13', NULL),
(118, 2021, 143, '2021-01-19', 2021, '63 1278 0002 56', 'CNAS', 'AIN TEMOUCHENT', 'ELAIHAR', 'ZAHRA', '1963-08-26', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '89219.28', '97249.02', '9.00', 0, 0, '8029.74', '0.00', '97249.02', NULL, NULL, '2021-01-19', NULL),
(119, 2021, 144, '2021-01-19', 2021, '52 1832 0001 68', 'CNAS', 'TLEMCEN', 'BOUMEDIENE', 'AHMED', '1952-11-01', 'TLEMCEN', 'non-finalisé', NULL, '282794.33', '308245.82', '9.00', 0, 0, '25451.49', '0.00', '308245.82', NULL, NULL, '2021-01-19', NULL),
(123, 2021, 145, '2021-01-24', 2021, '55 4310 0003 68', 'CNAS', 'ORAN', 'BOUROUIS', 'MOHAMED', '1955-08-26', 'ORAN', 'non-finalisé', NULL, '89219.28', '97249.02', '9.00', 0, 0, '8029.74', '0.00', '97249.02', NULL, NULL, '2021-01-24', NULL),
(125, 2021, 149, '2021-02-01', 2021, '83 1190 0076 39', 'CNAS', 'SIDI BEL ABBES', 'MADANI', 'JIHANE', '2018-09-11', 'SIDI BEL ABBES', 'non-finalisé', NULL, '27876.08', '30384.93', '9.00', 0, 0, '2508.85', '0.00', '30384.93', NULL, NULL, '2021-02-01', NULL),
(126, 2021, 150, '2021-02-02', 2021, '59 0814 0006 60', 'CNAS', 'AIN TEMOUCHENT', 'BOUDGHENE STAMBOULI', 'AHMED', '1959-03-06', 'TLEMCEN', 'non-finalisé', NULL, '89219.28', '97249.02', '9.00', 0, 0, '8029.74', '0.00', '97249.02', NULL, NULL, '2021-02-02', NULL),
(127, 2021, 128, '2021-02-02', 2021, '917 147', 'CAMSSP', '', 'YOUCEF', 'MALAK', '2011-03-14', 'RILIZANE', 'non-finalisé', NULL, '874283.81', '952969.35', '9.00', 0, 0, '78685.54', '0.00', '952969.35', NULL, NULL, '2021-02-02', NULL),
(128, 2021, 151, '2021-02-06', 2021, '77 2310 0038 55', 'CNAS', 'RELIZANE', 'ANNAG', 'MOUAD ABDERAHMEN', '2016-10-01', 'RELIZANE', 'non-finalisé', NULL, '31782.83', '34643.28', '9.00', 0, 0, '2860.45', '0.00', '34643.28', NULL, NULL, '2021-02-06', NULL),
(129, 2021, 151, '2021-02-06', 2021, '77 2310 0038 55', 'CNAS', 'RELIZANE', 'ANNAG ', 'MOUAD ABDERAHMEN', '2016-10-01', 'AIN TEMOUCHENT', 'non-finalisé', NULL, '121328.78', '132248.37', '9.00', 0, 3609, '10919.59', '0.00', '132248.37', NULL, NULL, '2021-02-06', NULL),
(130, 2021, 152, '2021-02-08', 2021, '93 2230 0002 64', 'CNAS', 'TLEMCEN', 'KEBDANI', 'MERWEN', '1993-05-17', 'TLEMCEN', 'non-finalisé', NULL, '60000.81', '65400.88', '9.00', 0, 0, '5400.07', '0.00', '65400.88', NULL, NULL, '2021-02-08', NULL),
(131, 2021, 154, '2021-02-10', 2021, '90 0057 0375 42', 'CNAS', 'SIDI BEL ABBES', 'REBBAH', 'KHELIFA', '1990-11-27', 'SIDI BEL ABBES', 'non-finalisé', NULL, '75855.92', '82682.95', '9.00', 0, 0, '6827.03', '0.00', '82682.95', NULL, NULL, '2021-02-10', NULL),
(133, 2021, 159, '2021-02-17', 2021, '69 0029 0405 56', 'CNAS', 'TIARET', 'BELDJILALI', 'DRIS', '1969-02-10', 'TIARET', 'non-finalisé', NULL, '153948.91', '167804.31', '9.00', 0, 0, '13855.40', '0.00', '167804.31', NULL, NULL, '2021-02-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dossier`
--

CREATE TABLE `dossier` (
  `ID` int(11) NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `NumSecSocial` text NOT NULL,
  `NumTel` text NOT NULL,
  `Caisse` text NOT NULL,
  `Wilaya` text NOT NULL,
  `year` int(5) NOT NULL,
  `identifier` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dossier`
--

INSERT INTO `dossier` (`ID`, `nom`, `prenom`, `NumSecSocial`, `NumTel`, `Caisse`, `Wilaya`, `year`, `identifier`) VALUES
(25, 'MISSOUNI', 'IMADEDDINE', '120136001080', '00 00 00 00 01', 'CNAS', 'SAIDA', 2020, 0),
(36, 'SAHNIN', 'ABDELHAFID', '949 947', '00 00 00 00 02', 'CAMSSP', '', 2020, 0),
(43, 'DALI', 'MAHFOUD', '75 0003 0042 68', '00 00 00 00 34', 'CNAS', 'MASCARA', 2020, 0),
(50, 'MIR', 'TAHAR', '', '00 00 00 00 03', 'CASH', '', 2020, 0),
(55, 'OUZROUT', 'ABDELKADER', '46 0090 0068 47', '00 00 00 00 04', 'CNAS', 'SIDI BEL ABBES', 2020, 0),
(57, 'ZEKRAOUI', 'MOHAMED', '71 1222 0029 61', '00 00 00 00 05', 'CNAS', 'AIN TEMOUCHENT', 2020, 0),
(66, 'ZOUAOUIA', 'BELKHEIR', '74 0203 0069 55', '00 00 00 00 06', 'CNAS', 'SIDI BEL ABBES', 2020, 0),
(68, 'BENCHIKH', 'MOHAMED', '89 0395 0003 45', '00 00 00 00 07', 'CNAS', 'AIN TEMOUCHENT', 2020, 0),
(73, 'ROUABHIA', 'MOHAMMED', '92 0005 0002 72', '00 00 00 00 08', 'CNAS', 'TEBESSA', 2020, 0),
(81, 'KHETTAR', 'ABDEL ILLAH', '', '00 00 00 00 09', 'CASH', '', 2020, 0),
(83, 'ATTOU', 'HOUCINE', '91 0991 0068 32', '__ __ __ __ __', 'CNAS', 'MASCARA', 2020, 0),
(85, 'BENDELAA', 'MOHAMED RAYANE', '15 7438 0004 56', '00 00 00 00 10', 'CNAS', 'TLEMCEN', 2020, 0),
(86, 'BAHRI', 'FEDJ', '39 0178 0003 58', '00 00 00 00 11', 'CNAS', 'CHLEF', 2020, 0),
(99, 'MOURAD', 'SEDDAK', '79 0435 0048 45', '00 00 00 00 12', 'CASNOS', 'MOSTAGANEM', 2020, 0),
(103, 'HAOUCINE', 'EL HACHEMI', '54 0032 0448 57', '00 00 00 00 13', 'CASNOS', 'MASCARA', 2020, 0),
(104, 'KHEDDAR', 'MUSTAPHA', '', '00 00 00 00 14', 'CASH', '', 2020, 0),
(105, 'MEKHRAOUI', 'DOUAA', '12 1158 0005 69', '00 00 00 00 15', 'CNAS', 'SAIDA', 2020, 0),
(106, 'SI TAYEB', 'ABDELKADER', '78 3510 0024 56', '00 00 00 00 16', 'CASNOS', 'MASCARA', 2020, 0),
(108, 'SABEUR CHOUIREF', 'KADA', '72 2350 0016 58', '00 00 00 00 17', 'CNAS', 'ORAN', 2020, 0),
(110, 'GUITOUN', 'LAID', '599 337', '00 00 00 00 18', 'CAMSSP', '', 2020, 0),
(112, 'MERABET', 'BOUMEDYEN', '', '00 00 00 00 19', 'CASH', '', 2020, 0),
(115, 'BELOUADI', 'ABBES', '765 987', '00 00 00 00 20', 'CAMSSP', '', 2020, 0),
(116, 'SAIDANE', 'HICHEM NABIL', '90 6704 0006 52', '00 00 00 00 21', 'CNAS', 'AIN TEMOUCHENT', 2020, 0),
(118, 'BOUBEKEUR', 'HAFIDA', '73 0059 0166 44', '00 00 00 00 22', 'CNAS', 'TLEMCEN', 2020, 0),
(124, 'CHIKER EL MEOUER', 'KAMEL', '770 875', '00 00 00 00 23', 'CAMSSP', '', 2020, 0),
(127, 'BENYOUCEF', 'ABDEL ILAH', '81 0087 0192 38', '00 00 00 00 24', 'CNAS', 'AIN TEMOUCHENT', 2020, 0),
(128, 'YOUCEF', 'BOUABDELLAH', '917 147', '00 00 00 00 25', 'CAMSSP', '', 2021, 0),
(139, 'SELLEM', 'SIHEM', '91 0958 0078 31', '00 00 00 00 26', 'CNAS', 'MASCARA', 2021, 0),
(143, 'ELAIHAR', 'ZAHRA', '63 1278 0002 56', '00 00 00 00 27', 'CNAS', 'AIN TEMOUCHENT', 2021, 0),
(144, 'BOUMEDIENE', 'AHMED', '52 1832 0001 68', '00 00 00 00 28', 'CNAS', 'TLEMCEN', 2021, 0),
(145, 'BOUROUIS', 'MOHAMED', '55 4310 0003 68', '00 00 00 00 29', 'CNAS', 'ORAN', 2021, 0),
(149, 'MADANI', 'ABDELAZIZ', '83 1190 0076 39', '00 00 00 00 30', 'CNAS', 'SIDI BEL ABBES', 2021, 0),
(150, 'BOUDGHENE STAMBOULI', 'AHMED', '59 0814 0006 60', '00 00 00 00 31', 'CNAS', 'AIN TEMOUCHENT', 2021, 0),
(151, 'ANNAG', 'TOUATI', '77 2310 0038 55', '00 00 00 00 32', 'CNAS', 'RELIZANE', 2021, 0),
(152, 'KEBDANI', 'MERWEN', '93 2230 0002 64', '00 00 00 00 33', 'CNAS', 'TLEMCEN', 2021, 0),
(154, 'REBBAH', 'KHELIFA', '90 0057 0375 42', '00 00 00 00 35', 'CNAS', 'SIDI BEL ABBES', 2021, 0),
(159, 'BELDJILALI', 'DRIS', '69 0029 0405 56', '00 00 00 00 36', 'CNAS', 'TIARET', 2021, 0);

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `NumRef` varchar(15) NOT NULL,
  `Designation` longtext NOT NULL,
  `PrixU` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) DEFAULT '1',
  `tax` int(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`NumRef`, `Designation`, `PrixU`, `quantity`, `tax`) VALUES
('1', 'Orthoprothèse pour amputation méta-tarsophalangienne transmétatarsienne ou pour désarticulation tarsométatarsienne', '2554.51', 1, 1),
('11', 'Orthèse pour pour déformations irréductibles des orteils hallus valgus de 35° griffes.', '2532.55', 1, 1),
('12', 'Orthèse pour trouble complexe  pour amputation d\'un orteil ', '1674.51', 1, 1),
('14', 'Orthèse de correction dans chaussure à tige montante. Mesure prise à l\'arrière du talon. de 8 à 14 cm.pour deformation complexes d\'un pied en equinisme', '7260.37', 1, 1),
('15', 'Orthèse de correction dans chaussure à tige montante mesure prise à l\'arrière du talon de 14 à 18 cmpour deformation complexes d\'un pied en equinisme', '7737.39', 1, 1),
('16', 'Orthèse de correction dans chaussure à tige montante mesure prise à l\'arrière du talon au dessus de 18 cm.', '8185.77', 1, 1),
('172', 'Adjonction pour chaussure orthopedique (Talonnette RC35).', '900.47', 1, 1),
('2', 'Orthoprothèse pour amputation tarsienne (chopart et dérivés) avec faux bout (contre appui tibial capitonné )', '3643.59', 1, 1),
('21', 'Adjonction pour chaussure de paralysie orthèse plantaire.', '1739.93', 1, 1),
('22', 'Adjonction pour chaussure de paralysie baleinage bilatéral et tracteurs releveurs en sangles élastiques fixé sur la claque.', '2298.34', 1, 1),
('24', 'Adjonction pour chaussure de paralysie ressort postérieur en acier inclus dans la tige montante).', '2947.66', 1, 1),
('25', 'Adjonction pour chaussure de paralysie (dispositif externe) à tuteurs métalliques latéraux ', '2695.77', 1, 1),
('32', 'raccourcissement au dessus de 6 cm', '2928.10', 1, 1),
('33', 'Adjonction pour chaussure de compensation extrene de 2 cm minimum d\'épaisseur garnie peau.la longueur du talent ', '3632.24', 1, 1),
('4000BAT01', 'BATTERIES  ', '20550.40', 1, 0),
('41CAA01AR', 'CHAM A AIR ROUE AR P/FT ELECTRIQUE', '2100.00', 1, 0),
('41CHA1FRE', 'CHARGEUR AVEC CABLE', '31112.51', 1, 0),
('41JOY1FRE', 'JOYSTICK', '25270.96', 1, 0),
('41PNE01AR', 'PNEU ROUE ARR P/FT ELECTRIQUE', '4010.25', 1, 0),
('41RAV0001', 'ROULETTE AVANT P/FT ELECTRIQUE', '5911.95', 1, 0),
('45', 'Fermeture a glissiere l\'unite ou bandes adhesives.', '585.00', 1, 1),
('46', ' Gousset elastique sur tige.', '871.86', 1, 1),
('47', ' Bride en T antivarus ou valgus ou releveurs elastiques sans baleinnage.', '938.12', 1, 1),
('49', ' Baleinage unilateral avec capitonnage de protection.', '658.20', 1, 1),
('50', ' Baleinage bilateral avec capitonnage.', '1378.78', 1, 1),
('51', ' Contrefort unilateral en cuir ou en materiaux de synthese .', '726.21', 1, 1),
('54', 'Contrefort bilateral en cuir ou en materiaux de synthese et Tuteur metallique ou plastique bilateral.', '2639.60', 1, 1),
('701', 'Chaussure orthopedique à tige montante ou basse peausserie forte ', '12997.74', 1, 1),
('702', 'Chaussure orthopedique à tige montante ou basse peausserie fine  ', '12707.80', 1, 1),
('703', 'Chaussure  de compensation. peausserie forte ', '10905.20', 1, 1),
('704', 'Chaussure  de compensation. peausserie fine', '10868.10', 1, 1),
('705', 'Chaussure destinée à recevoir un etrier ou une semelle à tourillon.  peausserie forte ', '12260.50', 1, 1),
('706', 'Chaussure  destine à recevoir un etrier ou une semelle à tourillon. peausserie fine ', '12058.30', 1, 1),
('707', 'Chaussure sur appareil.  peausserie forte ', '11113.80', 1, 1),
('708', 'Chaussure sur appareil.  peausserie fine ', '10745.80', 1, 1),
('709', 'Chaussure sur appareil (chaussure de complement ) ', '4690.66', 1, 1),
('721', 'Chaussure d\'appareils spéciaux pour amputation de chopart appareil enveloppant et capitonnant le moignon ', '11750.30', 1, 1),
('722', 'Chaussure d\'appareils spéciaux pour amputation de chopart appareil enveloppant et capitonnant le moignon jusqu\'à 16 cm', '12371.40', 1, 1),
('91', 'Moulage du pied enveloppant les malléoles et le pilon tibial.', '1535.13', 1, 1),
('92', 'Moulage du pied et de la jambe jusqu\'aux plateaux tibiaux', '2725.60', 1, 1),
('AAC001', 'COQUES POUR INTRA -AURICULAIRES/micro contour', '1100.00', 1, 1),
('AACNLSA', 'Aide Auditive Contour Numérique Lègère Sévère type A', '45526.00', 1, 1),
('AACNLSB', 'Aide Auditive Contour Numérique Lègère Sévère type B', '62228.00', 1, 1),
('AACNLSC', 'Aide Auditive Contour Numérique Lègère Sévère typeC', '92553.00', 1, 1),
('AACNLSD', 'Aide Auditive Contour Numérique Lègère Sévère type D', '101660.00', 1, 1),
('AACNMSA', 'Aide Auditive Contour Numérique Moyenne Sévère typeA', '45526.00', 1, 1),
('AACNMSB', 'Aide Auditive Contour Numérique Moyenne Sévère type B', '62228.00', 1, 1),
('AACNMSC', 'Aide Auditive Contour Numérique Moyenne Sévère typeC', '92553.00', 1, 1),
('AACNMSD', 'Aide Auditive Contour Numérique Moyenne Sévère type D', '101660.00', 1, 1),
('AACNPRA', 'Aide Auditive Contour Numérique PRofonde type A', '45526.00', 1, 1),
('AACNPRB', 'Aide Auditive Contour Numérique PRofonde type B', '62228.00', 1, 1),
('AACNPRC', 'Aide Auditive Contour Numérique PRofonde type C', '92553.00', 1, 1),
('AACNPRD', 'Aide Auditive Contour Numérique Profonde type D', '101660.00', 1, 1),
('AACOMM', 'AIDE TECHNIQUE A LA COMMUNICATION', '23540.00', 1, 1),
('AACROS', 'SYSTÈME CROS', '59432.00', 1, 1),
('AAE001', 'EMBOUTS AURICULAIRES EN RESINE DURE', '750.00', 1, 1),
('AAE002', 'EMBOUTS AURICULAIRES EN RESINE SOUPLE', '985.00', 1, 1),
('AAFMEM', 'EMETTEUR FM', '92275.00', 1, 1),
('AAFMRE', 'RECEPTEUR FM', '78200.00', 1, 1),
('AAFMSA', 'SABOT AUDIO', '3999.15', 1, 1),
('AAINLSA', 'Aide Auditive Intra Numérique Lègère Sévère type A', '50078.60', 1, 1),
('AAINLSB', 'Aide Auditive Intra Numérique Lègère Sévère type B', '68450.80', 1, 1),
('AAINLSC', 'Aide Auditive Intra Numérique Lègère Sévère type C', '101808.00', 1, 1),
('AAINLSD', 'Aide Auditive Intra Numérique Lègère Sévère type  D', '111826.00', 1, 1),
('AAP 001', '675 AE', '79.44', 1, 1),
('AAP 002', '312', '79.44', 1, 1),
('AAP 003', 'V13', '79.44', 1, 1),
('AAP 004', '10AT', '79.44', 1, 1),
('AATELC', 'TELECOMMANDE (problème de dextérité .dont mal voyants)', '14848.00', 1, 1),
('AD13', 'Orthèse pour cas complexe compensant ou enveloppant des déformations graves irréductible ou partiellement réductibles.', '7073.54', 1, 1),
('AR31', 'Orthèse intérieure avec ou sans faux-bout de 2 à 6 cm. de raccourcissement.', '2938.62', 1, 1),
('AS52', ' Contrefort bilateral en cuir ou en materiaux de synthese .', '940.30', 1, 1),
('B21N', 'Bandage pour hernie scrotale irreductible ', '6059.47', 1, 1),
('B23N', 'Bandage pour hernie inguinale. ceinture bandage plastron ', '4207.15', 1, 1),
('B9N', 'Bandage pour hernie omblilcale et épigastrique sans ressort ', '3993.52', 1, 1),
('BEQ0201', 'BEQUILLES EN DURAL (unité)', '1767.79', 1, 1),
('BEQ0202', 'BEQUILLES EN DURAL (unité)', '1767.79', 1, 1),
('BEQ0203', 'BEQUILLES EN DURAL (unité)', '1767.79', 1, 1),
('BI00BC00T', 'Bonnet de confort ', '1975.00', 1, 1),
('BI00ML00T', 'Bas pour moignon en laine', '4107.50', 1, 1),
('BI00MT00T', 'Bas pour moignon tissu', '1512.50', 1, 1),
('C.OMBILICAL', 'Ceinture ombilicale ', '576.25', 1, 1),
('C114', 'Collier cervical', '1986.76', 1, 1),
('C160', 'Collier cervical (mini minerve)', '5412.43', 1, 1),
('C2P/SR', 'Corset en plexidur composé par deux plaques une sternale et une située entre les deux omoplates. rassemblées par des sangles.', '11706.56', 1, 1),
('CAN0104', 'CANNE CANADIENNE P.M (unité)', '1615.87', 1, 1),
('CAN0105', 'CANNE CANADIENNE G.M (unité)', '1615.87', 1, 1),
('CAN0201', 'CANNE EN C BOIS', '982.51', 1, 1),
('CAN0301', 'CANNE EN T SIMPLE (BOIS)', '719.21', 1, 1),
('CAN0303', 'CANNE EN T SIMPLE (DURAL)', '719.21', 1, 1),
('CAN0401', 'CANNE TRIPODE P.M', '3106.96', 1, 1),
('CAN0402', 'CANNE TRIPODE GM', '3106.96', 1, 1),
('CAN0501', 'CANNE BLANCHE POUR MALVOYANT', '1457.57', 1, 1),
('CAN0701', 'CANNE POIGNET ANATOMIQUE', '1524.71', 1, 1),
('CAN2002', 'CANNE EN T REGLABLE (DURAL)', '802.98', 1, 1),
('CDM0102', 'CADRE DE MARCHE FIXE', '5905.88', 1, 1),
('CDM0201', 'CADRE DE MARCHE ARTICULE ENFANT', '5905.88', 1, 1),
('CDM0202', 'CADRE DE MARCHE ARTICULE ADULTE', '5905.88', 1, 1),
('CDM0203', 'CADRE DE MARCHE ADULTE ARTICULE AVEC ROUE  ', '5905.88', 1, 1),
('CDM0603', 'CADRE DE MARCHE PLIANT ARTICULE', '6327.88', 1, 1),
('CHAU.B.OUV', 'Chaussure à bout ouvert', '4470.49', 1, 1),
('CIVA', 'Corset d\'immobilisation vertébrale sur mesure . renforcé par un ensemble d\'aciers ressorts dits \'cage demi dorsale \'  ', '11422.06', 1, 1),
('CIVB1', 'Corset d\'immobilisation à \'cage fermée\' renforcement assuré par un ensemble d\'acier ressort ayant une largeur de 10 à 14 mm ', '15017.95', 1, 1),
('CIVB2', 'Corset d\'immobilisation à \'cage ajourée \'. renforcement assuré par un ensemble d\'acier ressort ayant une largeur de 20 à 30 mm ', '15068.53', 1, 1),
('CIVC1', 'Corset d\'immobilisation renforcé par une armature en acier ressort dont les pieces métalliques ont une largeur de 14 à 20 mm ', '14275.91', 1, 1),
('CIVC2', 'Corset d\'immobilisation dit cage ajourée .ce corset comporte une armature identique dans sa conception à celle du type  CIVC1 mais dont les pieces métalliques ont une largeur de 20 mm à 30 mm', '14275.91', 1, 1),
('CMA', 'Ceinture de maitien abdominale sur mesure. cas d\'obesité. éventration et hernie.Réalisée en tissu élastique .', '7167.09', 1, 1),
('CMA.BIS', 'Ceinture de maintien abdominale en élastique ', '6877.09', 1, 1),
('CMABD09', 'Ceinture de maitien abdominale  (sommet de l\'apophyse épineuse de D9)', '9918.38', 1, 1),
('CMABD12', 'Ceinture de maintien abdominale (sommet de l\'apophyse épineuse de D12)', '9038.88', 1, 1),
('CMB', 'Ceinture de maintien Lombaire ', '7735.80', 1, 1),
('CMC', 'Ceinture de maintien lombaire renforcée', '8754.86', 1, 1),
('CMV', 'Verticalisateur (Coque de verticalisation montée sur un support roulant. pivotant et reglable)', '309007.48', 1, 1),
('CRT01', 'ROLLATOR', '6329.38', 1, 1),
('CSA.BIS', 'Ceinture de soutien abdominale en élastique sur mesure', '7737.74', 1, 1),
('CSB.BIS', 'Ceinture de soutien abdominale ', '7218.07', 1, 1),
('CSD', 'Corset siège dynamique avec des mats en carbone', '144000.00', 1, 1),
('CSM', 'Corset siège mobile (sur support roulant. pivotant et reglable. pouvant recevoir une assise)', '176081.50', 1, 1),
('CSTUBEEMB', 'TUBES POUR EMBOUTS  (\'04\')', '400.00', 1, 1),
('CT DOS', 'Ceinture Redressse Dos', '3638.41', 1, 1),
('D.BROWN', 'Attelle Denis Brown', '7362.43', 1, 1),
('D.PETIT', 'Attelle comprenant deux coquilles en métal qui sont montées sur un ensemble d\'équerres et tringleries', '16209.89', 1, 1),
('DAM0101', 'DEAMBULATEUR P.M', '8733.14', 1, 1),
('DAM0102', 'DEAMBULATEUR M.M', '8733.14', 1, 1),
('DAM0103', 'DEAMBULATEUR G.M', '8733.14', 1, 1),
('FA00AF00A', 'FAUTEUIL ACTIF', '30000.00', 1, 0),
('FA00AL00L', 'FAUTEUIL ALUMINIUM STANDARD', '42000.00', 1, 0),
('FA00GR00A', 'FAUTEUIL ROULANT GARDE ROBE', '32749.73', 1, 0),
('FA00IM00A', 'FAUTEUIL ROULANT IMC ', '41539.51', 1, 0),
('FA00RE00A', 'FAUTEUIL ROULANT STANDARD RENFORCE  (+90kgs)', '38216.02', 1, 0),
('FA00SD00A', 'FAUTEUIL ROULANT STD ADULTE', '31278.52', 1, 0),
('FA00TR00A', 'FAUTEUIL ROULANT TRANSFERT', '32506.55', 1, 0),
('FE00SD00A', 'FAUTEUIL ROULANT STD ENFANT', '30954.19', 1, 0),
('FJ00SD00A', 'FAUTEUIL ROULANT STD JUNIOR', '31448.18', 1, 0),
('FL00GR00A', 'FAUTEUIL ROULANT GARDE ROBE SPECIAL (Large)', '35293.70', 1, 0),
('FL00SP00A', 'FAUTEUIL ROULANT SPECIAL (Large)', '32282.30', 1, 0),
('FRT0501', 'FAUTEUIL ROULANT ELECTRONIQUE', '365255.80', 1, 0),
('MAT100', 'MATELATS ANTI ESCARRES A AIR AVEC FLUX MOTORISE ', '22226.40', 1, 1),
('OI29C01', 'Orthèse cuir moulé  (classique)', '165590.32', 1, 1),
('OI29C02', 'Orthèse garnie au mollet et cuissard cuir  (classique)', '152769.31', 1, 1),
('OI29C03', 'Orthèse garnie au mollet et cuissard  (classique)', '165679.38', 1, 1),
('OI29C04', 'Orthèse à etrier démontable : mollet et cuissard  cuir moulé (classique)', '176222.79', 1, 1),
('OI29C05', 'Orthèse à étrier démontable garnie au  mollet et cuissard  cuir (classique)', '161745.20', 1, 1),
('OI29C07', 'Orthèse à étrier non démontable. mollet et cuissard  cuir moulé (classique)', '153402.40', 1, 1),
('OI29C30', 'Orthèse à tourillon. mollet et cuissard  cuir moulé (classique)', '157105.39', 1, 1),
('OI36C01', 'Attelle articulée au genou. cuir moulé (attelle acier piéce sur piéce )', '95559.51', 1, 1),
('OI36C02', 'Orthèse jambière et cuisse ( cuir moulé ) attelle en acier gaine chevre. articulation à chape  ', '73687.48', 1, 1),
('OI36C10', 'Attelle en cuir moulé (trois attelles acier ou alliage léger )', '74849.97', 1, 1),
('OI36D02', 'Attelle articulée au genou. cuir moulé en alliage léger ', '78202.78', 1, 1),
('OI36D10', 'Attelle de contention articulée au genou constituée d\'une attelle externe et d\'une attelle interne et dont les montants  sont galbés ', '63236.17', 1, 1),
('OI36N01', 'Attelle articulée au genou .en polyéthylène (attelle acier piece sur piece )', '60073.36', 1, 1),
('OI36N02', 'Attelle articulée au genou .en polyéthylène (attelle alliage léger )', '60664.39', 1, 1),
('OI36N10', 'Attelle jambière  rigide au genou en polyolefine sans armature ', '34236.76', 1, 1),
('OI36N11', 'Attelle jambière  rigide au genou en polyolefine avec  armature ', '51667.87', 1, 1),
('OI39C01', 'Orthèse à tourillon. mollet et cuissard cuir moulé ', '154479.76', 1, 1),
('OI39C02', 'Orthèse à tourillon avec embrase garnie au mollet et cuissard cuir ', '153698.18', 1, 1),
('OI39C03', 'Orthèse à tourillon avec embrasse garnie au mollet et au cuissard ', '142369.30', 1, 1),
('OI39C04', 'Orthèse  à étrier démontable à clavette. mollet et cuissard cuir moulé ', '156462.59', 1, 1),
('OI39C05', 'Orthése  à étrier démontable à clavette. embrase garnie au mollet et cuissard cuir  ', '149097.05', 1, 1),
('OI39C06', 'Orthèse  à étrier démontable à clavette avec embrasse garnie au mollet et cuissard en  cuir  ', '144780.44', 1, 1),
('OI39C07', 'Orthèse  à étrier  non  demontable(pièce sur pièce)avec mollet et cuissard cuir  moulé ', '154830.35', 1, 1),
('OI39C08', 'Orthèse  à étrier non  démontable (pièce sur pièce)avec embrase garnie au mollet  et  cuissard cuir  ', '157062.98', 1, 1),
('OI39C09', 'Orthèse  à étrier non  démontable  ( pièce sur pièce )avec embrasse garnie au mollet  et  au cuissard  ', '137721.57', 1, 1),
('OI39C30', 'Orthèse jambière et cuisse en acier (attelle en acier) à tourillon ', '152730.37', 1, 1),
('OI39C31', 'Orthèse jambière et cuisse en cuir et acier à étrier démontable .clavette (pièce sur pièce)', '154512.44', 1, 1),
('OI39C50', 'Orthèse cruro jambière avec un seul montant ', '101613.96', 1, 1),
('OI39C91', 'Orthèse à étrier avec attelles latérales en acier (articulation tibio tarsienne à chape et à roulements à billes  ', '124371.75', 1, 1),
('OI39D01', 'Orthèse à tourillon :mollet et cuissard cuir moulé', '154446.32', 1, 1),
('OI39D02', 'Orthèse à tourillon : embrasse garnies  au  mollet et cuissard cuir ', '129304.95', 1, 1),
('OI39D03', 'Orthèse à tourillon : embrasse garnies au  mollet et au cuissard ', '120111.07', 1, 1),
('OI39D04', 'Orthèse à étrier démontable à clavette (pièce sur pièce ): embrasses garnies au  mollet et cuissard cuir moulé ', '152864.47', 1, 1),
('OI39D05', 'Orthèse à étrier démontable à clavette (pièce sur pièce ): embrasse garnie au  mollet et cuissard cuir ', '155887.50', 1, 1),
('OI39D06', 'Orthèse à étrier démontable à clavette (pièce sur pièce ): embrasse garnie au  mollet et au cuissard  ', '138170.06', 1, 1),
('OI39D07', 'Orthèse à étrier non démontable (pièce sur pièce):  mollet et cuissard  cuir moulé', '157033.32', 1, 1),
('OI39D08', 'Orthèse à étrier non démontable (pièce sur pièce). embrasses garnies au  mollet et cuissard  cuir ', '111703.22', 1, 1),
('OI39D30', 'Orthèse en alliage léger et à tourillon ( rigide au genou) ', '144594.96', 1, 1),
('OI39D31', 'Orthèse à étrier démontable .à clavette (pièce sur pièce )', '155640.46', 1, 1),
('OI39D90', 'Orthèse articulée à  tourillon avec attelle en alliage léger ', '131345.73', 1, 1),
('OI39FC01', 'Orthèse du membre inférieur articulée au genou avec verrou. montant en Carbone embrasse en fibre de carbone à tourillon', '167090.00', 1, 1),
('OI39FC07', 'Orthèse du membre inférieur articulée au genou avec verrou. montant en Carbone embrasse en fibre de carbone avec botte rigide', '168521.51', 1, 1),
('OI39G53', 'Gouttière de nuit en polyisoprene (polysar) cruro pédieuse ', '89453.94', 1, 1),
('OI39N50', 'Orthèse cruro jambière avec articulation à chape au genou en polyéthylène ', '91844.54', 1, 1),
('OI39N52', 'Orthèse de décharge et d\'adduction  avec patin et articulation à chape au genou et tourillon à la semelle plastique', '103611.59', 1, 1),
('OI39N53', 'Gouttière de nuit en polyéthylène  cruro pédieuse garnie de mousse', '49325.64', 1, 1),
('OI39S50', 'Orthèse cruropédieuse av/ articulation à chape au genou et à la cheville  avec coque talonnière se prolongeant à l\'avant pied ', '98936.11', 1, 1),
('OI58C30', 'Gaine jambière en cuir ou en Polyéthylène assurant un maintien latéral du calcanium .armée par des montants lateraux et de 02 embrasses ', '69356.18', 1, 1),
('OI59C01', 'Orthèse de jambe à tourillon avec un seul montant latéral ', '42981.15', 1, 1),
('OI59C02', 'Orthèse de jambe à tourillon avec deux montants laéeraux  ', '45740.92', 1, 1),
('OI59C03', 'Orthèse de jambe à étrier démontable avec deux montants latéraux  ', '53529.56', 1, 1),
('OI59C04', 'Orthèse de jambe à étrier non démontable (pièce sur pièce ) ', '53526.77', 1, 1),
('OI59C11', 'Orthèse jambière articulée .deux montants latéraux .deux embrasses dont l\'une forme appui sous condylien ', '45036.88', 1, 1),
('OI59C20', 'Botte rigide ou gaine jambière en cuir moulé .deux montants latéraux .deux embrasses postérieures ', '69984.45', 1, 1),
('OI59C90', ' Appareillage aux IMC .à tourillons avec un seul montant latéral en acier ', '29646.76', 1, 1),
('OI59C91', ' Appareillage aux IMC .à tourillons avec deux montants latéraux en acier ', '31475.93', 1, 1),
('OI59G20', 'Gaine jambière ou botte rigide .deux montants latéraux .deux embrasses posterieures en polyisoprene  (polysar)sans armature ', '52362.52', 1, 1),
('OI59G50', 'Botte de correction en polysard', '42268.75', 1, 1),
('OI59M50', 'Releveur de Pied en Polypropylene', '34172.50', 1, 1),
('OI59N50', 'Botte rigide bivalve de correction des déformations du pied ', '44401.35', 1, 1),
('OI59N66', 'Botte articulée à la cheville en polyethylene (articulation souple ou rigide)', '53125.00', 1, 1),
('OI59S20', 'Botte rigide  ou gaine  jambière .deux montants latéraux .deux embrasses postérieures stratifiées en polyester ', '57306.46', 1, 1),
('OPA9E', 'Orthese plantaire pour pied plat enfant', '1020.00', 1, 1),
('OS13N01', 'Attelle pour épaule sans armature en polyéthylène ', '37154.39', 1, 1),
('OS13N02', 'Attelle pour épaule avec armature en polyéthylène ', '63441.53', 1, 1),
('OS16N02', 'Attelle pour épaule. bras et avant bras avec armature en polyéthylène ', '74320.24', 1, 1),
('OS36C01', 'Attelle pour avant bras et bras articulé au coude en cuir moulé(attelles latérales articulées p/ p.02 embrasses posterieures av/ bras et bras) ', '76672.35', 1, 1),
('OS36N02', 'Orthèse pour bras et avant bras en polyolefine avec armature  ', '59144.36', 1, 1),
('OS36N11', 'Attelle de l\' avant bras et bras rigide au coude en polyéthylène sans armature ', '43549.94', 1, 1),
('OS36N21', 'Attelle de l\'avant bras et bras articulé au coude helicoidale en polyoléfine ', '52225.93', 1, 1),
('OS57N01', 'Gaine rigide d\'avant bras en polyolefine sans armature ', '24701.73', 1, 1),
('OS58C01', 'Attelle de l\'avant bras en cuir moulé sans armature métallique (gaine enveloppant la region métacarpienne et l\'avant bras )', '26479.37', 1, 1),
('OS58C02', 'Attelle de l\'avant bras en cuir moulé avec  armature métallique constituée par une seule attelle palmaire ', '28882.02', 1, 1),
('OS58N01', 'Attelle de l\'avant bras en polyolefine sans armature (gaine enveloppant la region metacarpienne et l\'avant bras )', '29293.07', 1, 1),
('OS58N02', 'Attelle de l\'avant bras en polyolefine avec  armature (gaine enveloppant la region métacarpienne et l\'avant bras )', '36187.76', 1, 1),
('OS59G01', 'Attelle de l\'avant bras.mains et doigts en polyisoprene  (polysar)sans  armature (gaine enveloppant la region metacarpienne et l\'avant bras )', '18628.35', 1, 1),
('OS79G01', 'Attelle mains et doigts en polyisoprene (polysar) (appareil de maintien )', '15399.18', 1, 1),
('P103ZF95R', 'Prothèse définitive en résine et fibre de carbone avec manchon silicone, genou pneumatique et un pied dynamique', '503976.89', 1, 1),
('P103ZF98N', 'Prothèse tubulaire définitive pour amputation de cuisse emboiture stratifiée en carbone. genou mono centrique hydraulique et pied à restitution d\'énergie en carbone', '1600000.00', 1, 1),
('P103ZS63D', 'Prothèse de cuisse tubulaire, emboiture polyster pied articulé', '190677.52', 1, 1),
('PE00IM00A', 'POUSSETTE IMC ACIER', '33879.23', 1, 0),
('PE00IM00L', 'POUSSETTE IMC ALUMINIUM', '50524.80', 1, 0),
('PI01ZF68N', 'Prothése pour désarticulée de hanche. tubulaire à emboiture stratifié de resine avec pied à restitution d\'energie et genou hydraulique .', '908559.22', 1, 1),
('PI01ZS63G', 'Prothése pour désarticulée de hanche. tubulaire à emboiture polyester et pied articulé.', '226625.00', 1, 1),
('PI01ZS64G', 'Prothése pour désarticulée de hanche. tubulaire à emboiture polyester et pied sach', '217122.66', 1, 1),
('PI01ZS65R', 'Prothése pour désarticulée de hanche. tubulaire à emboiture stratifié de resine avec pied dynamique et genou pneumatique .', '646939.64', 1, 1),
('PI03BS63D', 'Prothèse de cuisse .emboiture contact en polyester mollet en bois. pied articulé  ', '127903.77', 1, 1),
('PI03BS64D', 'Prothèse de cuisse. emboiture contact en polyester mollet en bois. pied sach', '129233.04', 1, 1),
('PI03DC13D', 'Prothèse de cuisse en alliage léger. emboiture contact en polyester. mollet en bois et pied articulé', '175546.65', 1, 1),
('PI03DD20D', 'Prothèse de cuisse en alliage léger étrier et quillon dural emboiture en alliage ', '138128.41', 1, 1),
('PI03DD21D', 'Prothèse de cuisse sans pied avec mollet. verrou au genou et  quillon en  alliage léger. mollet dural et quillon ', '147763.53', 1, 1),
('PI03DD23D', 'Prothèse de cuisse avec pied articulé. genou à axe simple et emboiture en  alliage léger ', '152334.74', 1, 1),
('PI03DD53D', 'Prothèse de cuisse avec pied et emboiture à adhérence musculaire avec pied articulé. genou à axes simple et emboiture en  alliage léger ', '152215.41', 1, 1),
('PI03DD53G', 'Prothèse de cuisse avec pied articulé. genou à double articulation et emboiture en  alliage léger  ', '152867.54', 1, 1),
('PI03SS23D', 'Prothèse de cuisse avec pied articulé. emboiture en polyester   ', '133588.38', 1, 1),
('PI03SS53D', 'Prothèse de cuisse avec pied articulé.  emboiture stratifier   ', '137730.84', 1, 1),
('PI03SS54D', 'Prothèse de cuisse avec pied sach.  emboiture à adhérence musculaire en alliage léger   ', '118005.37', 1, 1),
('PI03SS64D', 'Prothèse de cuisse avec pied sach.  emboiture de contact stratifiée   ', '110232.68', 1, 1),
('PI03SS64G', 'Prothèse de cuisse avec pied sach (dispositif à biellettes )  emboiture stratifiée   ', '111746.95', 1, 1),
('PI03ZF95N', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et  fibre de carbone. précédée d\'une emboiture test intermediaire en copolyester / manchon préfabriqué en silicone/ genou hydraulique monocentrique/ pied dynamique avec une lame  en composite ou en carbone   associée à une mousse fonctionnelle.                                                     ', '780328.81', 1, 1),
('PI03ZF95P', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et  fibre de carbone. précédée d\'une emboiture test intermediaire encopolyester / manchon préfabriqué en silicone/ genou hydraulique polycentrique/ pied dynamique avec une  lame  en composite ou en carbone  associée à une mousse fonctionnelle.                ', '840769.00', 1, 1),
('PI03ZF95R', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de carbone. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en silicone  / genou pneumatique monocentrique/ pied dynamique avec une lame en  composite ou en carbone  associée à une mousse fonctionnelle.                       ', '503976.89', 1, 1),
('PI03ZF95Y', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de carbone. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en silicone  / genou pneumatique polycentrique/ pied dynamique avec une lame en  composite ou en carbone  associée à une mousse fonctionnelle.                       ', '503976.89', 1, 1),
('PI03ZF98N', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et  fibre de carbone. précédée d\'une emboiture test intermediaire encopolyester / manchon préfabriqué en silicone/ genou hydraulique monocentrique/ pied à restitution d\'énérgie avec une double lame en carbone .                                                                     ', '811387.87', 1, 1),
('PI03ZF98P', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et  fibre de carbone. précédée d\'une emboiture test intermediaire encopolyester / manchon préfabriqué en silicone/ genou hydraulique polycentrique/ pied à restitution d\'énérgie avec une double lame en carbone.                                                                      ', '874283.81', 1, 1),
('PI03ZF98R', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de carbone. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en silicone  / genou pneumatique monocentrique/ pied à restitution d\'énérgie avec une double lame en carbone                         ', '506525.74', 1, 1),
('PI03ZF98Y', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de carbone. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en silicone  / genou pneumatique polycentrique/ pied à restitution d\'énérgie avec une double lame en carbone                                                   ', '506525.74', 1, 1),
('PI03ZP60A', 'Prothèse de cuisse d\'étude et d\'entrainement  à emboiture platrée ou polyéthylène  à pilon', '41457.06', 1, 1),
('PI03ZP63D', 'Prothèse de cuisse d\'étude et d\'entrainement avec pied articulé emboiture en platre ou polyéthylène', '42446.08', 1, 1),
('PI03ZP63H', 'Prothèse de cuisse d\'étude et d\'entrainement  en platre ou polyéthylène avec pied articulé à frein stabilisateur ', '62158.63', 1, 1),
('PI03ZP64D', 'Prothèse de cuisse d\'étude et d\'entrainement avec pied sach. emboiture platrée ou polyéthylène', '89219.28', 1, 1),
('PI03ZS24D', 'Prothèse tubulaire de cuisse. pied sach emboiture polyester ', '121428.40', 1, 1),
('PI03ZS63D', 'Prothèse de cuisse tubulaire. emboiture polyester  pied articulé', '190677.52', 1, 1),
('PI03ZS64G', 'Prothèse de cuisse tubulaire. emboiture polyester  pied sach', '161308.38', 1, 1),
('PI03ZS95N', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et  fibre de verre. précédée d\'une emboiture test intermediaire encopolyester / manchon préfabriqué en silicone/ genou hydraulique monocentrique/ pied dynamique avec une lame  en composite ou en carbone   associée à une mousse fonctionnelle.                                      ', '613606.90', 1, 1),
('PI03ZS95R', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de verre. précédée d\'une emboiture test intermediaire encopolyester/ manchon préfabriqué en silicone / genou pneumatique monocentrique/ pied dynamique avec une lame en  composite ou en carbone   associée à une mousse fonctionnelle.             ', '486164.40', 1, 1),
('PI03ZS95Y', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de verre. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en silicone  /  genou pneumatique Polycentrique / pied dynamique avec une lame en  composite ou en carbone   associée à une mousse fonctionnelle.                     ', '486164.40', 1, 1),
('PI03ZS98N', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et  fibre de verre. précédée d\'une emboiture test intermediaire encopolyester / manchon préfabriqué en silicone/ genou hydraulique monocentrique/ pied à restitution d\'énérgie avec une double lame en carbone .                                                                                   ', '616155.75', 1, 1),
('PI03ZS98R', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de verre. précédée d\'une emboiture test intermediaire encopolyester/ manchon préfabriqué en silicone  / genou pneumatique monocentrique/ pied à restitution d\'énérgie avec une double lame en carbone   ', '488713.25', 1, 1),
('PI03ZS98Y', 'Prothèse définitive tubulaire/ kit en aluminium/ emboiture  stratifiée en résine et fibre de verre. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en silicone  / genou pneumatique Polycentrique / pied à restitution d\'énérgie avec une double lame en carbone .                                                        ', '488713.25', 1, 1),
('PI04DC13C', 'Prothese de cuisse avec pied articulé en alliage leger. montant acier et emboiture cuir ', '132757.17', 1, 1),
('PI04DD23C', 'Prothèse de cuisse avec pied articulé et alliage léger. montant acier externe et emboiture alliage léger ', '136959.30', 1, 1),
('PI04DD24C', 'Prothèse pour amputation de cuisse moignon très long. ( prothèse avec pied sach ) en alliage léger montants acier et  emboiture alliage léger', '137516.68', 1, 1),
('PI04SC13C', 'Prothèse de cuisse avec pied articulé  en stratifié montant acier emboiture en cuir ', '188615.66', 1, 1),
('PI04SC14C', 'Prothèse de cuisse avec pied sach  en stratifié montant acier emboiture en cuir ', '147931.69', 1, 1),
('PI04SS24C', 'Prothèse de cuisse avec pied sach en stratifiée montant acier externe. emboiture polyester en acier et cuir', '156912.44', 1, 1),
('PI04ZS63N', 'Prothèse tubulaire définitive pour amputation transcon- dylienne. emboiture stratifiée.  genou Gritti et pied articulé ', '210869.91', 1, 1),
('PI04ZS64N', 'Prothèse tubulaire définitive pour amputation transcon- dylienne. emboiture stratifiée.  genou Gritti et pied Sach', '202079.21', 1, 1),
('PI05AC10A', 'Prothèse de jambe (pilon rigide): cuir et montant acier ', '93992.86', 1, 1),
('PI05DC13C', 'Prothèse de jambe avec pied articulé. alliage léger et emboiture en cuir ', '152866.98', 1, 1),
('PI05SC13C', 'Prothèse de jambe avec pied articulé. stratifiée en polyester montants acier .emboiture cuir ', '118908.41', 1, 1),
('PI05SC14C', 'Prothèse de jambe avec pied sach. stratifiée en polyester montants acier .emboiture cuir ', '118908.41', 1, 1),
('PI05ZS63N', 'Prothèse pour désarticulée du genou. ou genou ankylosé. nécessitant un appui du genou fléxion. avec emboiture stratifiée. genou Gritti et pied articulé ', '210869.81', 1, 1),
('PI05ZS64N', 'Prothèse pour désarticulée du genou. ou genou ankylosé. nécessitant un appui du genou fléxion. avec emboiture stratifiée. genou Gritti et pied Sach', '202079.21', 1, 1),
('PI06AC13C', 'Prothèse de jambe en cuir . pied articulé', '132970.34', 1, 1),
('PI06DD31C', 'Prothése de jambe avec manchon et tracteur sans pied à quillon', '117231.11', 1, 1),
('PI06DD33C', 'Prothèse de jambe en alliage léger avec manchon cuir et tracteurs . pied articulé ', '155881.28', 1, 1),
('PI06DD43A', 'Prothèse de jambe en alliage léger avec manchon cuir sans cuissard ni tracteurs. pied articulé  ', '101859.30', 1, 1),
('PI06DD43C', 'Prothèse de jambe avec pied articulé. en alliage léger avec manchon sans tracteurs ', '108768.75', 1, 1),
('PI06DD44A', 'Prothèse de jambe avec pied sach avec manchon cuir sans cuissard ni tracteur  ', '105233.90', 1, 1),
('PI06DD44C', 'Prothèse de jambe avec pied sach avec manchon cuir sans cuissard ou alliage leger   ', '142029.93', 1, 1),
('PI06SF75A', 'Prothèse définitive exosquelettique avec une emboiture  stratifiée en résine et  fibre de carbone  / manchon préfabriqué en copolymére ou en silicone ou en polyuréthane / une gaine d\'etancheité et  protection du genou /   pied dynamique avec ame en bois associée à une mousse fonctionnelle. ', '304751.79', 1, 1),
('PI06SS34C', 'Prothèse de jambe avec pied sach .emboiture en polyester avec manchon et tracteurs  ', '147379.77', 1, 1),
('PI06SS63A', 'Prothèse de jambe de contact avec segment jambier en bois avec pied articulé  ', '107031.93', 1, 1),
('PI06SS64A', 'Prothèse de jambe de contact avec segment jambier en bois avec pied sach ', '103190.03', 1, 1),
('PI06SS85A', 'Prothèse définitive exosquelettique  / emboiture stratifiée en résine et  fibre de verre. / manchon alvéolé  préfabriqué en mousse de Polyethylène / pied dynamique avec ame en bois associée à une mousse fonctionnelle. ', '193244.25', 1, 1),
('PI06ZF95A', 'Prothèse définitive tubulaire / kit en aluminium / emboiture stratifiée en résine et fibre de carbone précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en copolymére ou en silicone ou en polyuréthane / gaine d\'etancheité et de protection du genou /  pied dynamique avec  une lame en  composite ou en carbone   associée à une mousse fonctionnelle  .              ', '282794.33', 1, 1),
('PI06ZF98A', 'Prothèse définitive tubulaire / kit en aluminium / emboiture stratifiée en résine et fibre de carbone précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en copolymére ou en silicone ou en polyuréthane / gaine d\'etancheité et de protection du genou / pied à restitution d\'énérgie avec une double lame en carbone                                                      ', '285343.18', 1, 1),
('PI06ZN85A', 'Prothèse d\'étude et d\'entrainement avec une emboiture thermoformée en Polyèthylene  /  manchon préfabriqué en mousse de polyèthylene / un pied dynamique avec une lame en composite ou en carbone associée à une mousse fonctionnelle. ', '153948.91', 1, 1),
('PI06ZP63A', 'Prothèse  de jambe  d\'étude et d\'entrainement avec pied articulé ', '60000.81', 1, 1),
('PI06ZP64A', 'Prothèse  de jambe  d\'étude et d\'entrainement avec pied articulé', '56555.07', 1, 1),
('PI06ZP66A', 'Prothèse  de jambe  d\'étude et d\'entrainement avec pied sach sans articulation de cheville ', '35702.76', 1, 1),
('PI06ZS63A', 'Prothèse de jambe de contact tubulaire avec pied articulé ', '87799.44', 1, 1),
('PI06ZS64A', 'Prothèse de jambe de contact. tubulaire avec pied sach. revètement ésthetique en matière  plastique cellulaire ', '91382.44', 1, 1),
('PI06ZS85A', 'Prothèse définitive tubulaire /emboiture stratifiée en resine et  fibre de verre. / manchon alvéolé  préfabriqué en mousse de Polyèthylène    /  pied Dynamique  avec une lame en composite ou en carbone associée à une mousse fonctionnelle.  ', '143307.20', 1, 1),
('PI06ZS95A', 'Prothèse définitive tubulaire / kit en aluminium/ emboiture stratifiée en resine et  fibre de verre. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en copolymére ou en silicone ou en polyuréthane /  gaine d\'etancheité et de protection du genou / pied dynamique avec une lame  en composite ou en carbone  associée à une mousse fonctionnelle.  ', '264981.83', 1, 1),
('PI06ZS98A', 'Prothèse définitive tubulaire / kit en aluminium/ emboiture stratifiée en resine et  fibre de verre. précédée d\'une emboiture test intermediaire en copolyester/ manchon préfabriqué en copolymére ou en silicone ou en polyuréthane /  gaine d\'etancheité et de protection du genou  /  pied à restitution d\'énérgie avec une double lame en carbone. ', '267530.68', 1, 1),
('PI07AC12A', 'Prothèse tibiale avec pied rigide. en cuir moulé montant acier', '106665.13', 1, 1),
('PI07AC13A', 'Prothèse tibiale avec pied articulé. en cuir moulé  montants lateraux en acier ou montants antero -posterieurs ', '108890.11', 1, 1),
('PI07DD43A', 'prothese tibiale avec pied articulé sans cuissard  en alliage leger avec gaine cuir interne ', '127085.67', 1, 1),
('PI07DD43C', 'Prothèse tibiale en alliage léger et pied articulé', '138433.16', 1, 1),
('PI07SS22A', 'Prothèse tibiale avec pied rigide. polyester ', '73885.52', 1, 1),
('PI07SS43A', 'Prothèse tibiale avec pied articulé sans cuissard  stratifiée de polyester ', '81361.88', 1, 1),
('PI07SS43C', 'Prothèse avec pied articulé et cuissard stratifié de polyester avec gaine cuir interne ', '108232.00', 1, 1),
('PI07SS44A', 'Prothèse tibiale avec pied sach sans cuissard  stratifiée de polyester ', '98306.25', 1, 1),
('PI26DN10A', 'Prothése plastique pour malformation congenitale  ', '66515.65', 1, 1),
('PI28SS14A', 'Prothèse pour agénésie en polyester sans manchon intermédiaire avec emboiture à sa partie anterieure avec pied sach ', '81051.67', 1, 1),
('PI48AC23A', 'Prothèse pour agenesie en cuir et acier avec pied articulé ', '132154.09', 1, 1),
('PI48AC24A', 'Prothèse pour agénésie en cuir et acier avec pied sach', '117080.91', 1, 1),
('PI48SS23A', 'Prothèse de malformation congenitale avec pied articulé ', '79048.38', 1, 1),
('PI48SS24A', 'Prothèse pour agénésie en polyester. sans manchon intermédiaire avec pied sach ', '82701.88', 1, 1),
('PPSC001', 'POCHES  MONOBLOCS COLOSTOMIES  BTE   30', '340.37', 1, 0),
('PPSC01', 'POCHES COLOSTOMIE D40 BTE   30', '209.83', 1, 0),
('PPSC02', 'POCHES COLOSTOMIE D45 BTE   30', '209.83', 1, 0),
('PPSC03', 'POCHES COLOSTOMIE D50 BTE   30', '209.83', 1, 0),
('PPSC04', 'POCHES COLOSTOMIE D57 BTE   30', '209.83', 1, 0),
('PPSC05', 'POCHES COLOSTOMIE D60 BTE   30', '209.83', 1, 0),
('PPSC06', 'POCHES COLOSTOMIE D70 BTE   30', '209.83', 1, 0),
('PPSC07', 'POCHES COLOSTOMIE D100 BTE  10', '360.47', 1, 0),
('PPSI001', 'POCHES  MONOBLOCS ILEOSTOMIES  BTE   30', '361.38', 1, 0),
('PPSI01', 'POCHES ILLEOSTOMIE D40 BTE   30', '254.89', 1, 0),
('PPSI02', 'POCHES ILLEOSTOMIE D50 BTE   30', '254.89', 1, 0),
('PPSI03', 'POCHES ILLEOSTOMIE D60 BTE   30', '254.89', 1, 0),
('PPSI04', 'POCHES ILLEOSTOMIE D45 BTE   10', '254.89', 1, 0),
('PPSI05', 'POCHES ILLEOSTOMIE D57 BTE   10', '254.89', 1, 0),
('PPSI06', 'POCHES ILLEOSTOMIE D70 BTE   10', '254.89', 1, 0),
('PPSI07', 'POCHES ILLEOSTOMIE D100 BTE  10', '353.11', 1, 0),
('PPSU001', 'POCHES  MONOBLOCS UROSTOMIES  BTE   20', '392.00', 1, 0),
('PPSU01', 'POCHES UROSTOMIE D40 BTE   20', '409.12', 1, 0),
('PPSU02', 'POCHES UROSTOMIE D50 BTE   20', '409.12', 1, 0),
('PPSU03', 'POCHES UROSTOMIE D60 BTE   20', '409.12', 1, 0),
('PPSU04', 'POCHES UROSTOMIE D45 BTE   10', '409.12', 1, 0),
('PPSU05', 'POCHES UROSTOMIE D57 BTE   10', '409.12', 1, 0),
('PS1R01', 'Prothèse pour désarticulation scapulo humérale (épaule) en  chlorure de polyvinyle ', '124222.79', 1, 1),
('PS1Z02', 'Prothèse avec corselet de fixation. en stratifie de polyester avec articulation d\'épaule à rotule ', '147093.12', 1, 1),
('PS2R01', 'Prothèse bras (amputation de bras ) en polyvinyle', '115711.08', 1, 1),
('PS3R01', 'Prothèse bras (emboiture de contact ). chlorure de  polyvinyle', '104974.45', 1, 1),
('PS3S10', 'Prothèse bras. polyester avec emboiture de contact  comportant une prise rapide ', '104213.80', 1, 1),
('PS3S20', 'Prothèse de bras avec emboiture de contact stratifiée de polyester ', '86153.55', 1, 1),
('PS3Z01', 'Prothèse de bras (amputation du bras ) avec emboiture de contact stratifiée de polyester ', '88843.26', 1, 1),
('PS4R01', 'Prothèse d\'avant bras  (désarticulée du coude  ) avec emboiture en chlorure de vinyl  ', '118288.36', 1, 1),
('PS4Z20', 'Prothèse d\'avant bras  (désarticulé du coude  ) avec emboiture de contact stratifiée en polyester  ', '72983.13', 1, 1),
('PS5R01', 'Amputation d\'avant bras(désarticulée de coude ) en chorure de polyvinyle prothèse de vie sociale ', '96950.86', 1, 1),
('PS5S10', 'Amputation d\'avant bras. polyester avec emboiture de contact comportant une prise rapide ', '103249.40', 1, 1),
('PS6R01', 'Amputation d\'avant  bras en chlorure de polyvinyle  (prothèse de vie sociale)', '96411.11', 1, 1),
('PS6S01', 'Amputation ou prothèse  d\'avant  bras en stratifier de polyester  (prothèse de service )', '76503.44', 1, 1),
('PS6S10', 'Amputation ou prothèse d\'avant  bras en polyester avec emboiture de contact comportant une prise rapide  (prothèse de travail )', '96913.99', 1, 1),
('PS7R01', 'Désarticulation carpienne en chlorure de polyvinyle ', '77295.63', 1, 1),
('PS9S02', 'Amputation de doigts', '34657.06', 1, 1),
('PSPPS01', 'tube de pate de protection TUBE', '1460.32', 1, 0),
('RC01', 'Ressemelage complet', '3714.00', 1, 1),
('RC174', 'Remplacer talon', '2007.60', 1, 1),
('RC22', 'Remplacer releveur élastique sur chaussure ordinaire ', '2632.80', 1, 1),
('RC47', 'Remplacer bride en T pour chaussure appareillage à tourillon', '2184.00', 1, 1),
('RCOPA', 'Remplacer semelle de correction Adulte', '3198.00', 1, 1),
('RCOPE', 'Remplacer semelle de correction enfant', '2880.00', 1, 1),
('RE61DOMEM', 'PACK DOMES MICRO CONTOURS ', '985.00', 1, 1),
('RE62TUBEM', 'PACK MICRO TUBES ', '985.00', 1, 1),
('RFA00SD00A', 'Tube d\'accoudoir Gauche  ou Droit ', '516.97', 1, 0),
('RFA01IM01A', 'Croisillon  adulte', '743.61', 1, 0),
('RFA01IM02A', 'Montant avant ', '2366.92', 1, 0),
('RFA01IM03A', 'Montant arrière  ', '2366.91', 1, 0),
('RFA01IM04A', 'Plongeur avant ', '487.13', 1, 0),
('RFA01IM05A', 'Plongeur arrière ', '487.13', 1, 0),
('RFA01IM06A', 'Cadre siège adulte', '579.45', 1, 0),
('RFA01IM07A', 'Axe d\'articulation ', '667.71', 1, 0),
('RFA01IM08A', 'Support écarteur de jambe', '325.79', 1, 0),
('RFA01IM09A', 'Broche d\'assemblage ', '269.16', 1, 0),
('RFA01SD01A', 'Montant avant Gauche  ou Droit', '1953.56', 1, 0),
('RFA01SD02A', 'Montant arrière Gauche  ou Droit ', '2675.65', 1, 0),
('RFA01SD03A', 'Croisillon Gauche  ou Droit ', '854.50', 1, 0),
('RFA01SD04A', 'Plongeur avant Gauche  ou Droit', '550.67', 1, 0),
('RFA01SD05A', 'Plongeur arrière Gauche  ou Droit', '550.67', 1, 0),
('RFA01SD06A', 'Tube porte toile ', '181.42', 1, 0),
('RFA01SD07A', 'Tube d\'assemblage supérieur ', '131.11', 1, 0),
('RFA01SD08A', 'Tube d\'assemblage inferieur ', '164.44', 1, 0),
('RFA02IM02A', 'bras de potence ', '461.52', 1, 0),
('RFA02IM03A', 'Equerre adulte ', '420.21', 1, 0),
('RFA02IM04A', 'Bride repose mollet ', '570.15', 1, 0),
('RFA02IM05A', 'Potence  ', '782.47', 1, 0),
('RFA02IM06A', 'Tige coudée ', '105.35', 1, 0),
('RFA02IM07A', 'Palette  adulte  (\'avec ressort\')', '458.62', 1, 0),
('RFA02IM08A', 'Ressort de compression ', '110.88', 1, 0),
('RFA02SD01A', 'Tube potence  Gauche  ou Droit ', '675.80', 1, 0),
('RFA02SD02A', 'Tube porte-palette Gauche  ou Droit ', '176.86', 1, 0),
('RFA02SD05A', 'Expendeur ', '126.01', 1, 0),
('RFA02SD06A', 'Palette  adulte ', '518.44', 1, 0),
('RFA03IM01A', 'Crosse adulte  ', '2115.89', 1, 0),
('RFA03IM02A', 'Tige de crosse adulte', '155.23', 1, 0),
('RFA03IM03A', 'Traverse adulte ', '369.86', 1, 0),
('RFA03IM04A', 'Etrier ', '371.96', 1, 0),
('RFA03IM05A', 'Crémaillère ', '393.96', 1, 0),
('RFA03IM06A', 'Support cale tronc  ', '305.44', 1, 0),
('RFA03IM07A', 'Poignée de crosse ', '119.94', 1, 0),
('RFA03SD01A', 'Tube de dossier Gauche  ou Droit ', '1148.15', 1, 0),
('RFA03SD02A', 'Poignée de dossier ', '70.02', 1, 0),
('RFA04IM01A', 'Accoudoir  ', '925.41', 1, 0),
('RFA04IM02A', 'Plaque d\'accoudoir ', '193.90', 1, 0),
('RFA04IM03A', 'Appui-bras avec embase ', '214.20', 1, 0),
('RFA04IM04A', 'Goupille avec verrou d\'accoudoir ', '112.83', 1, 0),
('RFA04SD01A', 'Accoudoir complet ', '1046.11', 1, 0),
('RFA04SD02A', 'Plaque d\'accoudoir + quatre rivets', '219.19', 1, 0),
('RFA04SD03A', 'Manchette d\'accoudoir ', '168.39', 1, 0),
('RFA04SD06A', 'Goupille verrou d\'accoudoir ', '127.54', 1, 0),
('RFA05IM02A', 'Jante ', '2037.74', 1, 0),
('RFA05IM03A', 'Chambre à air ', '417.39', 1, 0),
('RFA05IM04A', 'Pneu', '730.31', 1, 0),
('RFA05SD00A', 'Roue arrière complète  avec M/C', '4146.96', 1, 0),
('RFA05SD01A', 'Main courante ', '603.57', 1, 0),
('RFA05SD02A', 'Jante nue complète ', '2303.54', 1, 0),
('RFA05SD03A', 'Moyeu complet avec roulement ', '1186.67', 1, 0),
('RFA05SD04A', 'Roulement pour moyeu ', '114.19', 1, 0),
('RFA05SD05A', 'Axe pour moyeu ', '464.97', 1, 0),
('RFA05SD09A', 'Pneu', '825.57', 1, 0),
('RFA05SD10A', 'Chambre à air  ', '471.84', 1, 0),
('RFA06IM01A', 'Fourche  ', '1582.91', 1, 0),
('RFA06IM02A', 'Roue diam 200 ', '958.64', 1, 0),
('RFA06IM03A', 'Jeu de direction  ', '267.74', 1, 0),
('RFA06SD01A', 'Fourche  ', '1789.37', 1, 0),
('RFA06SD02A', 'Roue avant ', '1083.68', 1, 0),
('RFA06SD06A', 'Jeu de direction complet ', '302.67', 1, 0),
('RFA07GR00A', 'Ensemble siège Garde Robe complet', '5783.15', 1, 0),
('RFA07IM01A', 'Revêtement complet adulte ', '5324.48', 1, 0),
('RFA07SD01A', 'Toile de siège  ', '1041.23', 1, 0),
('RFA07SD02A', 'Toile de dossier   ', '999.01', 1, 0),
('RFA07SD03A', 'Sangle de potence ', '142.18', 1, 0),
('RFA08IM01A', 'Frein  ', '675.78', 1, 0),
('RFA08SD00A', 'Frein Gauche  ou Droit ', '763.93', 1, 0),
('RFA08SD01A', 'Jeu de poignée de frein ', '72.60', 1, 0),
('RFA09IM01A', 'Vis poignée avec collier ', '212.87', 1, 0),
('RFA09IM02A', 'Système de verrouillage complet', '169.55', 1, 0),
('RFA09SD09A', 'Vis de fixation tube de dossier ', '164.12', 1, 0),
('RFJ01IM01A', 'croissillon junior', '755.90', 1, 0),
('RFJ01IM06A', 'Cadre siège junior', '579.45', 1, 0),
('RFJ02IM03A', 'Equerre junior  ', '420.21', 1, 0),
('RFJ02IM04A', 'Palette  junior', '458.62', 1, 0),
('RFJ03IM01A', 'Crosse junior', '1614.94', 1, 0),
('RFJ03IM02A', 'Tige de crosse junior ', '152.39', 1, 0),
('RFJ03IM03A', 'Traverse junior ', '369.86', 1, 0),
('RFJ07IM01A', 'Revêtement complet junior ', '5324.48', 1, 0),
('RFL01SP01A', 'Montant arrière gauche ou droit ', '2366.92', 1, 0),
('RFL01SP02A', 'Montant avant gauche ou droit ', '2366.92', 1, 0),
('RFL01SP03A', 'Croisillon ', '755.91', 1, 0),
('RFL01SP04A', 'Plongeur avant gauche ou droit ', '487.13', 1, 0),
('RFL01SP05A', 'Plongeur arrière gauche ou droit ', '487.13', 1, 0),
('RFL07SP01A', 'Toile de siège ', '921.08', 1, 0),
('RFL07SP02A', 'Toile de dossier ', '883.72', 1, 0),
('RFL07SP03A', 'Sangle de potence ', '125.78', 1, 0),
('RI01CC010', 'Remplacer une ceinture en cuir spéciale pour coque  ', '2458.33', 1, 1),
('RI01XA002', 'Remplacer articulation de hanche', '65015.25', 1, 1),
('RI01ZX001', 'Remplacer un revêtement esthétique en matière cellulaire sur prothèse pour désarticulation de hanche', '18450.00', 1, 1),
('RI01ZZ001', 'Remplacer La coque', '53928.30', 1, 1),
('RI03BS32', 'Remplacer emboiture de contact en stratifiéde polyster sur prothèse bois-demontage-remontage et adaptation compris. soupape comprise', '33252.50', 1, 1),
('RI03DD050', 'Réparer agrandir ou rétrécir l\'emboiture  de (3 ou 4 cm) avec essayage pour prothèse du membre inférieur. (laquage et polissage non compris)', '5110.00', 1, 1),
('RI03DD053', 'Remplacer segment jambier en alliage léger .finition comprise ', '26025.00', 1, 1),
('RI03SF601', 'Remplacement de l\'emboiture en carbone. réadaptation. fixation au fut externe et soupape d\'obturation compris.', '43000.00', 1, 1),
('RI03SS601', 'Remplacement de l\'emboiture de contact. réadaptation. fixation au fut externe et soupape d\'obturation compris.', '52950.00', 1, 1),
('RI03XX001', 'Remplacer manchon en silicone à  accroche distal (femoral)', '105140.34', 1, 1),
('RI03XX013', 'Remplacer valve de dépressurisation pour manchon silicone ', '13291.64', 1, 1),
('RI03XX014', 'Remplacer l\'anneau d\'étanchéité pour manchon silicone', '22648.15', 1, 1),
('RI03XX015', 'Remplacer manchon en silicone à valve femoral', '49098.55', 1, 1),
('RI03ZX001', 'Remplacement de la mousse de revêtement fémoral adulte ', '18450.00', 1, 1),
('RI03ZX003', 'Remplacer le bas de recouvrement adulte', '1487.50', 1, 1),
('RI03ZX004', 'Remplacer le bas de recouvrement  enfant', '1487.50', 1, 1),
('RI03ZX005', 'Remplacement de la mousse de revêtement fémoral enfant ', '15810.00', 1, 1),
('RI04SSG01', 'Remplacement du genou pour amputation Gritti ', '103065.00', 1, 1),
('RI04ZX001', 'Remplacer calotte de genou complet(roulement.renforts du genou soudés.axe des 02 cuvettes.cône et billes.butée et son feutre);réglage de jeux d\'articulation.soudure au cuissard durale ou adaptation et fixation à l\'emboiture de cuisse', '61406.25', 1, 1),
('RI04ZXG02', 'Remplacement d\'un genou multi-axial', '63698.75', 1, 1),
('RI04ZXG03', 'Remplacement d \'un genou multi-axial enfant', '57670.13', 1, 1),
('RI04ZXH01', 'Remplacement du genou mono-axial avec frein adulte', '48571.25', 1, 1),
('RI04ZXH02', 'Remplacement du genou mono-axial avec frein enfant', '91192.50', 1, 1),
('RI04ZXH03', 'Remplacement d\' un genou à verrou', '45954.63', 1, 1),
('RI04ZXN01', 'Remplacement du genou hydraulique Monocentrique', '317941.60', 1, 1),
('RI04ZXN02', 'Remplacement du genou hydraulique polycentrique', '366499.90', 1, 1),
('RI04ZXP02', 'Remplacement du genou pneumatique polycentrique', '144879.70', 1, 1),
('RI04ZXR01', 'Remplacement du genou pneumatique Monocentrique', '161748.20', 1, 1),
('RI06AA003', 'Remplacer la ferrure de hanche', '36143.75', 1, 1),
('RI06BB001', 'Remplacer malléole pour prothèse du membre inferieur ', '8756.25', 1, 1),
('RI06DD007', 'Réparer. river une circulaire d\'emboiture jambière ou de mollet postiche d\'appareil  a marcher sur le genou pour prothèse du membre inferieur ', '2136.25', 1, 1),
('RI06DD054', 'Remplacer emboiture jambiere en fibre avec son manchon feutre ferrures d\'articulation remontées et ajustées.laquage compris', '24695.00', 1, 1),
('RI06DD055', 'Remplacer emboiture jambière ', '52950.00', 1, 1),
('RI06SF601', 'Remplacer emboiture tibiale en fibre de carbone', '29000.00', 1, 1),
('RI06SS040', 'Remplacer emboiture  avec deux manchons amovibles sur un seul montage', '35002.50', 1, 1),
('RI06XC004', 'Remplacer manchon en cuir moulé avec tracteurs et garniture pour emboiture de jambe (moulage non compris)', '13797.50', 1, 1),
('RI06XJ001', 'Remplacer le manchon feutre pour emboiture jambiére ( manchon en polyforme)', '10977.50', 1, 1),
('RI06XX002', 'Remplacer manchon pour moignon long en polyurethane (tibial)', '90593.75', 1, 1),
('RI06XX003', 'Remplacer manchon en polyurethane à valve (tibial)', '127788.53', 1, 1),
('RI06XX004', 'Remplacer manchon en silicone à accroche distal (tibial)', '75053.01', 1, 1),
('RI06XX005', 'Remplacer  manchon en copolymére à valve(tibial)', '90073.50', 1, 1),
('RI06XX006', 'Remplacer manchon en copolymére à accroche distal (tibiale)', '70920.14', 1, 1),
('RI06XX007', 'Remplacer l\'accroche distal ', '32356.00', 1, 1);
INSERT INTO `produits` (`NumRef`, `Designation`, `PrixU`, `quantity`, `tax`) VALUES
('RI06XX008', 'Remplacer la valve de dépressurisation tibiale', '6396.88', 1, 1),
('RI06XX009', 'Remplacer gaine d\'étanchéité et de protection du genou', '10250.00', 1, 1),
('RI06ZX001', 'Remplacement de la mousse de revêtement tibiale adulte', '8547.50', 1, 1),
('RI06ZX004', 'Revetement en matiére plastique cellulaire du segment jambier (bas de recouvrement non compris)', '14302.50', 1, 1),
('RI06ZX005', 'Remplacement de la mousse de revêtement tibiale enfant', '8547.50', 1, 1),
('RI07XA001', 'Remplacer l\'articulation de cheville', '14475.00', 1, 1),
('RI07XA002', 'Remplacer l\'articulation de cheville à clavette', '29562.50', 1, 1),
('RI07XX001', 'Remplacement du bas de cheville  simple avec vissage pour prothèse exosquelettique', '9812.50', 1, 1),
('RI08AB201', 'Remplacement du pied Pirogoff', '26875.00', 1, 1),
('RI08XB302', 'Remplacer pied articulé pour prothése classique', '10437.50', 1, 1),
('RI08XJ301', 'Remplacer pied articulé', '31250.00', 1, 1),
('RI08XJ302', 'Remplacer butée avant et amortisseur arrière en caoutchouc pour pied articulé', '1628.75', 1, 1),
('RI08XJ303', 'Butée excentique réglable de limitation de fléxion', '60968.75', 1, 1),
('RI08XJ401', 'Remplacement du pied SACH ', '11147.50', 1, 1),
('RI08XJ501', 'Remplacer pied dynamique avec ame en bois', '19671.50', 1, 1),
('RI08XJ801', 'Remplacer pied a réstitution d énergie avec une lame en composite ou en carbone', '47756.70', 1, 1),
('RI08XJ802', 'Remplacer pied a réstitution d énergie avec une  double lame en carbone', '74905.80', 1, 1),
('RI08XJ803', 'Remplacer pied a réstitution d énergie avec lame en C en carbone', '201280.40', 1, 1),
('RI08XJ804', 'Remplacer l\'envelloppe pour pied à restitution d\'energie ', '10870.86', 1, 1),
('RI1011', 'Remplacer une articulation de genou libre ', '41170.13', 1, 1),
('RI10117', 'Recoudre une garniture', '625.00', 1, 1),
('RI1012', 'Remplacer une articulation de genou à verrou Hoffa', '51475.00', 1, 1),
('RI1013', 'Verrou a couliseau dit canadien', '29316.63', 1, 1),
('RI1014', 'Remplacer ressort en tissu élastique pour verrou HOFFA pour prothèse du membre inférieur  ', '1467.50', 1, 1),
('RI1019', 'Remplacer une articulation de genou à V COULISSEAU', '43993.75', 1, 1),
('RI1025', 'Remplacer un rivetage', '625.00', 1, 1),
('RI1050', 'Articulation de hanche à chape en remplacement de l\'articulation piéce sur piéce', '22816.25', 1, 1),
('RI1051', 'Remplacer l\'articulation de hanche', '36875.00', 1, 1),
('RI1060', 'Remplacer cuissard en cuir garniture entière de l\'ensemble coussin mousse et courroies  compris pour prothèse du membre inferieur (PI04).(PI05)', '5188.75', 1, 1),
('RI1066', 'Remplacer ceinture droite en cuir hauteur 10 cm', '1628.75', 1, 1),
('RI1068', 'Remplacer ceinture en cuir non garnie hauteur 45 mm', '2457.50', 1, 1),
('RI1070', 'Remplacer la piéce de hanche', '15100.00', 1, 1),
('RI1071', 'Remplacer une fermeture cuir ou tissu ', '2457.50', 1, 1),
('RI1088', 'Regarnir cuissard cuir sans point d\'appui sous ischiatique en agneau chamoise ou basane', '4231.25', 1, 1),
('RI10AA002', 'Remplacer une embrasse en S', '19633.07', 1, 1),
('RI10AA004', 'Remplacer une embrasse droite ', '16163.76', 1, 1),
('RI10AA005', 'Remplacer une embrasse inclinée', '17878.53', 1, 1),
('RI10XA007', 'Remplacer une vis de fixation', '625.00', 1, 1),
('RI10XC004', 'Refaire le sanglage', '12500.00', 1, 1),
('RI10XC050', 'Relaquage interieur polissage extérieur ou laquage intérieur et extérieur d\'une emboiture ou d\'un cuissard postiche', '4868.75', 1, 1),
('RI10XT002', 'Changement de VELCRO', '4356.25', 1, 1),
('RI10XT003', 'Changement de la ceinture de suspension en tissu ', '7237.50', 1, 1),
('RI10XT009', 'Remplacement bretelle présentant à l\'arriére et à l\'avant une partie en tissu élastique sur 25 cm', '1826.25', 1, 1),
('RI29C10', 'Remplacer cuir entier de cuissard jambièr au point d\'appui sous cuissard (sous ischiatique)', '8422.50', 1, 1),
('RI3505', 'Montant de garniture d\'un montant acier de cuissard', '5117.50', 1, 1),
('RI39C01', 'Remplacement montant latéral externe ou interne de cuissard jambiére rigide avec tête  d\'articulation pour étrier ou tourillon', '5346.25', 1, 1),
('RI5814', 'Remplacer un montant en carbone', '31823.34', 1, 1),
('RI5822', 'Regarnir une embrasse ', '875.00', 1, 1),
('RI59F28', 'Regarnir un montant en carbone', '1537.56', 1, 1),
('RI7A01', 'Remplacer butee excentrique', '6949.20', 1, 1),
('RI8904', 'Remplacer semelle acier avec tube tourrilon', '2820.00', 1, 1),
('RI8905', 'Remplacer demi-semelle acier montée sur chaussure à étrier', '2428.80', 1, 1),
('RI8937', 'Remplacer un protège pantalon', '875.00', 1, 1),
('RI8938', 'Remplacer une botte en polypropylène ', '44057.50', 1, 1),
('RI8939', 'Remplacer une botte  polyéthylène ', '37807.50', 1, 1),
('RI8940', 'Remplacer une chaussette en cuir avec lacet ', '4561.25', 1, 1),
('RI8943', 'Remplacer une chaussette en polypropylène ', '31557.50', 1, 1),
('RI8944', 'Remplacer une chaussette polyéthylène ', '25307.50', 1, 1),
('RP01MICAO', 'MICROPHONE 1', '1845.83', 1, 1),
('RP01MICBO', 'MICROPHONE 2', '1903.31', 1, 1),
('RP01MICCO', 'MICROPHONE 3', '2346.70', 1, 1),
('RP01MICDO', 'MICROPHONE 4', '5376.57', 1, 1),
('RP02ECTAO', 'ECOUTEUR 1', '3965.91', 1, 1),
('RP02ECTBO', 'ECOUTEUR 2', '4296.00', 1, 1),
('RP02ECTCO', 'ECOUTEUR 3', '6202.59', 1, 1),
('RP02ECTDO', 'ECOUTEUR 4', '7087.74', 1, 1),
('RP03AMPAO', 'AMPLIFICATEUR 1', '46802.70', 1, 1),
('RP03AMPBO', 'AMPLIFICATEUR 2', '69111.99', 1, 1),
('RP03AMPCO', 'AMPLIFICATEUR 3', '71238.64', 1, 1),
('RP03AMPDO', 'AMPLIFICATEUR 4', '73365.29', 1, 1),
('RP04SETAO', 'SET DE MODIFICATION 1', '752.13', 1, 1),
('RP04SETBO', 'SET DE MODIFICATION 2', '993.53', 1, 1),
('RP04SETCO', 'SET DE MODIFICATION 3', '1668.77', 1, 1),
('RP04SETDO', 'SET DE MODIFICATION 4', '2225.18', 1, 1),
('RP05POTSO', 'Potentiomètre de volume ', '991.89', 1, 1),
('RP06INTSO', 'INTERUPTEUR', '1906.59', 1, 1),
('RP07SUPSO', 'SUPPORT DE PILE  ', '524.66', 1, 1),
('RP08CONPO', 'CONTACT PILE', '108.39', 1, 1),
('RP08FCEIO', 'FACEPLATE', '390.84', 1, 1),
('RP09CER0C', 'Wind & weather protection ', '1957.50', 1, 1),
('RP09COUDO', 'COUDE DE TONALITE', '676.27', 1, 1),
('RP15TUMMO', 'TUBE MMM', '192.14', 1, 1),
('RP18COMSO', 'COMMUTATEUR', '839.16', 1, 1),
('RP19CONTO', 'CONTRÔLE DE VOLUME', '1328.54', 1, 1),
('RP20TUBMO', 'SOUND TUBE METAL', '957.40', 1, 1),
('RP42CONSO', 'TYPE LABEL', '599.40', 1, 1),
('RP46TMMIO', 'TM 4546 MIDDLE CIC', '921.27', 1, 1),
('RP47SUSPO', 'Suspension silicone tube ou Oticon', '1857.33', 1, 1),
('RP63CAFGO', 'FG-38-30797 middle class ', '1560.09', 1, 1),
('RP70TAMPO', 'TAMPER PROOF', '1315.40', 1, 1),
('RP75FILIO', 'PACK FILTRE INTRA (\'2 jeux\')', '1453.35', 1, 1),
('RP76FILCO', 'FILTRES POUR CONTOURS', '206.92', 1, 1),
('RP82CAS0C', 'Battery Holder for FM ', '7974.52', 1, 1),
('RPE01IM01A', 'Châssis poussette ', '1997.47', 1, 0),
('RPE01IM02A', 'Support plongeur ', '301.00', 1, 0),
('RPE01IM03A', 'Plongeur ', '487.13', 1, 0),
('RPE01IM04A', 'Broche d\'assemblage', '269.16', 1, 0),
('RPE01IM05A', 'Siege ', '764.96', 1, 0),
('RPE02IM02A', 'Support cale tête ', '336.58', 1, 0),
('RPE02IM03A', 'Montant support cale tête ', '371.49', 1, 0),
('RPE02IM04A', 'Poignée  poussette', '309.38', 1, 0),
('RPE03IM01A', 'Dossier  poussette', '1542.03', 1, 0),
('RPE03IM02A', 'Equerre poussette', '420.21', 1, 0),
('RPE03IM03A', 'Repose mollet ', '546.00', 1, 0),
('RPE04IM01A', 'Accoudoir   ', '925.41', 1, 0),
('RPE04IM02A', 'Appui-bras avec embase ', '214.04', 1, 0),
('RPE06IM01A', 'Fourche', '1582.91', 1, 0),
('RPE06IM02A', 'Roue diamètre 200', '958.64', 1, 0),
('RPE06IM03A', 'Jeu de direction ', '267.74', 1, 0),
('RPE07IM01A', 'Revêtement complet ', '5324.47', 1, 0),
('RPE08IM01A', 'Frein ', '675.79', 1, 0),
('RPE09IM01A', 'Vis poignée avec collier ', '212.89', 1, 0),
('RPE09IM02A', 'Support écarteur de jambe ', '325.79', 1, 0),
('RPE09IM03A', 'Tige coudée', '105.35', 1, 0),
('RPO5BOBSO', 'BOBINE  ', '382.63', 1, 1),
('RS1R01', 'Remplacement de l\'emboiture  (Coque) de l\'épaule', '35002.50', 1, 1),
('RS1R02', 'Remplacer le gant esthétique ', '18937.50', 1, 1),
('RS1R03', 'Remplacer le sanglage', '12500.00', 1, 1),
('RS1Z03', 'Remplacer l\'articulation d\'épaule ', '39910.13', 1, 1),
('RS2R01', 'Remplacement de l\'emboiture  du bras', '35002.50', 1, 1),
('RS4R01', 'Remplacement de l\'emboiture  du bras ', '35002.50', 1, 1),
('RS4Z01', 'Remplacer l\'articulation du coude ', '104131.50', 1, 1),
('RS5B01', 'Remplacer le raccord en bois', '5625.00', 1, 1),
('RS5R01', 'Remplacement de l\'emboiture  de l\'avant-bras', '35002.50', 1, 1),
('RS7R01', 'Remplacement de l\'emboiture  de l\'avant-bras', '35002.50', 1, 1),
('RS7Z02', 'Remplacer l\'adaptateur pour le dispositif terminal  (Prise rapide)', '48329.76', 1, 1),
('RS8Z04', 'Remplacer l\'articulation de poignet', '81406.06', 1, 1),
('RS9A04', 'Remplacer les doigts ', '16250.00', 1, 1),
('RS9Z01', 'Remplacer la main gant non compris', '29061.25', 1, 1),
('RSZ04', 'Remplacer revetement esthetique ', '12452.25', 1, 1),
('RT1023', 'Remplacer un Plastron ( courroies comprises) ', '11250.00', 1, 1),
('RT59Z01', 'Remplacer une fermeture en tissu', '1875.00', 1, 1),
('RT79K01', 'Remplacer une valve antérieure (moulage non compris)', '10023.49', 1, 1),
('RT79K02', 'Remplacer une valve postérieure (moulage non compris)', '10023.49', 1, 1),
('RTA14', 'Remplacer une vis ', '500.00', 1, 1),
('RTC01', 'Remplacer une sangle en cuir', '2457.50', 1, 1),
('RTC10', ' Refaire un garnissage ', '4231.25', 1, 1),
('RTG10', 'Remplacer une coque pelvienne en polysoprene  ', '77500.00', 1, 1),
('RTG12', 'Refaire le capitonnage des montants occipitaux ', '3125.00', 1, 1),
('RTK01', 'Remplacer une valve antérieure en Copolymère  (moulage non compris)', '52500.00', 1, 1),
('RTK02', 'Remplacer une valve postérieure en  Copolymère  (moulage non compris)', '52500.00', 1, 1),
('RTK10', 'Remplacer la plaque d’appui pour corset 2Pts ', '3750.00', 1, 1),
('RTK12', 'Remplacer une main d’appui', '1000.00', 1, 1),
('RTN01', 'Remplacer une valve antérieure en Polyéthylène  (moulage non compris)', '33375.00', 1, 1),
('RTN02', 'Remplacer une valve postérieure en Polyéthylène  (moulage non compris)', '33375.00', 1, 1),
('RTN10', 'Remplacer une coque pelvienne en Polyéthylène', '44000.00', 1, 1),
('RTN12', 'Remplacer une sous patte en Trolène', '875.00', 1, 1),
('RTT10', 'Remplacer un capitonage', '3750.00', 1, 1),
('RTX01', 'Remplacer une sangle en PVC', '1274.81', 1, 1),
('RTZ01', 'Remplacer sanglage en tissu pour corset 2Pts ', '1875.00', 1, 1),
('RTZ02', 'Remplacer sanglage en tissu pour corset siège ', '5000.00', 1, 1),
('RVM01DM01A', 'Roue arrière droite ', '5609.23', 1, 0),
('RVM01DM02A', 'Roue arrière', '5713.93', 1, 0),
('RVM01DM03A', 'Roue avant ', '4908.92', 1, 0),
('RVM01DM04A', 'Chaine d\'entrainement ', '1448.63', 1, 0),
('RVM02DM05A', 'Moteur', '41194.52', 1, 0),
('RVM04DM01A', 'Fourche avant ', '4156.28', 1, 0),
('RVM05DM01A', 'Amortisseur arrière monté sur le chassis et le train arrière ', '1164.84', 1, 0),
('RVM05DM10A', 'Commutateur ', '833.30', 1, 0),
('RVM07DM01A', 'Châssis ', '6546.37', 1, 0),
('RVM07DM02A', 'Chaise', '3293.16', 1, 0),
('S.P.S', 'Bandage pour hernie omblilcale et épigastique suspensoir ', '1802.19', 1, 1),
('SAMO', 'Selle d\'abduction mobile (Composé d\'un chassis tubulaire ergonomique facilitant la déambulation. et d\'un corset selle sur mesure)', '101123.75', 1, 1),
('SO 01', 'Semelle orthopedique enfant ', '726.03', 1, 1),
('SO 02', 'Semelle orthopedique adulte ', '614.34', 1, 1),
('SPPS01', 'SUPPORT D40 BTE   05', '549.52', 1, 0),
('SPPS02', 'SUPPORT D45 BTE   05', '549.52', 1, 0),
('SPPS03', 'SUPPORT D50 BTE   05', '549.52', 1, 0),
('SPPS04', 'SUPPORT D57 BTE   05', '549.52', 1, 0),
('SPPS05', 'SUPPORT D60 BTE   05', '549.52', 1, 0),
('SPPS06', 'SUPPORT D70 BTE   05', '549.52', 1, 0),
('SPPS07', 'SUPPORT D 100 BTE 05', '940.82', 1, 0),
('TR12D01', 'Protége crane ou casque en alliage leger comportant un capitonnage intèrieur en matière cellulaire avec garnissage en peau.', '29545.70', 1, 1),
('TR12N35', 'Protége crane ou casque en polyolefine comportant un capitonnage intèrieur en matière cellulaire avec garnissage en peau.', '21935.36', 1, 1),
('TR12S42', 'Protége crane ou casque en stratifié de polyestere comportant un capitonnage intèrieur en matière cellulaire  et garnissage intérieur et extérieur en peau. Fixation assurée selon nécessité.', '23744.02', 1, 1),
('TR23N35', 'Collier en polyolefine(polyethylene)limitant les mouvements du cou', '5199.66', 1, 1),
('TR25N36', 'Minerve à base thoracique en plyolefine avec armature (gaine bivalves avec fermeture sous axilliaire. la valve anterieure enveloppe la partie mentonnière. la valve postérieure s\'etendant a la région occipitale.', '19646.04', 1, 1),
('TR29G27', 'Corset à collier. partie tétière amovible s\'étendant des trochanders aux régions occipitales et mentonnières.', '164924.08', 1, 1),
('TR29N36', 'Corset à collier. partie tétière amovible s\'étendant des trochanders aux régions occipitales et mentonnières en polyéthyléne avec armature.', '86413.91', 1, 1),
('TR39K50', 'Corset remontant à la base du cou avec une valve dorsale.deux valves pelviennes et une sternale.', '105075.59', 1, 1),
('TR39N51', 'Corset remontant à la base du cou sans armature mono valve moulé en correction à ouverture médiane.', '99817.50', 1, 1),
('TR43N01', 'Corset siège.constitué d\'une coque montante jusqu\'à l\'épine.', '97300.25', 1, 1),
('TR49C11', 'Corset en cuir moulè avec armature acier ou alliage leger comportant une ceinture pelvienne.', '136969.84', 1, 1),
('TR49G64', 'Corset de sustentation en polyisoprene.', '64556.78', 1, 1),
('TR49K54', 'Corset de maintien pour réduction de scoliose.', '77683.34', 1, 1),
('TR49N36', 'Corset en polyéthyléne avec armature', '66849.63', 1, 1),
('TR49N50', 'Corset sans armature bivalves ou monovalve avec ouverture antérieure. postérieure ou latérale garnie de mousse polyolefine.', '75855.92', 1, 1),
('TR59N50', 'Corset sans armature bivalves ou monovalve avec ouverture antérieure.postérieure ou latérale garnie de mousse polyolefine.', '57167.84', 1, 1),
('TR59V49', 'Bandes plastiques d\'immobilisation en fibre de verre et acetat de cellulose.', '57241.44', 1, 1),
('TR79C11', 'Corset en cuir moulè avec armature acier ou alliage léger comportant une ceinture pelvienne.', '92871.70', 1, 1),
('TR79N35', 'Corset en polyethylene sans armature.', '31782.83', 1, 1),
('TR79N50', 'Corset monovalve sans armature garni de mousse de polyolefine.', '57167.84', 1, 1),
('VM00DE00A', 'VOITURETTE A MOTEUR EL KALA 01 ', '209858.00', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `achatdevis`
--
ALTER TABLE `achatdevis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companyinfo`
--
ALTER TABLE `companyinfo`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `devis_berk`
--
ALTER TABLE `devis_berk`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `devis_facture`
--
ALTER TABLE `devis_facture`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dossier`
--
ALTER TABLE `dossier`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`NumRef`),
  ADD UNIQUE KEY `NumRef_UNIQUE` (`NumRef`);
ALTER TABLE `produits` ADD FULLTEXT KEY `NumRef` (`NumRef`,`Designation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achat`
--
ALTER TABLE `achat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `achatdevis`
--
ALTER TABLE `achatdevis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `companyinfo`
--
ALTER TABLE `companyinfo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `devis_berk`
--
ALTER TABLE `devis_berk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `devis_facture`
--
ALTER TABLE `devis_facture`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `dossier`
--
ALTER TABLE `dossier`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
