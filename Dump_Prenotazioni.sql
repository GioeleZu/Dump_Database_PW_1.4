-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Prenotazioni
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aerei`
--

DROP TABLE IF EXISTS `aerei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aerei` (
  `ID_Aereo` varchar(36) NOT NULL,
  `Tipo_Aereo` varchar(255) NOT NULL,
  `Capacita` int(11) NOT NULL,
  PRIMARY KEY (`ID_Aereo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerei`
--

LOCK TABLES `aerei` WRITE;
/*!40000 ALTER TABLE `aerei` DISABLE KEYS */;
INSERT INTO `aerei` VALUES ('de6eb9ea-030d-11f0-be6f-d0395730d6ca','Boeing 737',180),('de6ebced-030d-11f0-be6f-d0395730d6ca','Airbus A320',150),('de6ebd82-030d-11f0-be6f-d0395730d6ca','Boeing 777',300),('de6ebdaf-030d-11f0-be6f-d0395730d6ca','Airbus A350',250),('de6ebdd8-030d-11f0-be6f-d0395730d6ca','Boeing 787',280);
/*!40000 ALTER TABLE `aerei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeroporti`
--

DROP TABLE IF EXISTS `aeroporti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aeroporti` (
  `ID_Aeroporto` varchar(3) NOT NULL,
  `Nome_Aeroporto` varchar(255) NOT NULL,
  `Citta` varchar(255) NOT NULL,
  `Nazione` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_Aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeroporti`
--

LOCK TABLES `aeroporti` WRITE;
/*!40000 ALTER TABLE `aeroporti` DISABLE KEYS */;
INSERT INTO `aeroporti` VALUES ('CDG','Charles de Gaulle','Parigi','Francia'),('DXB','Dubai International','Dubai','Emirati Arabi Uniti'),('FCO','Leonardo da Vinci','Roma','Italia'),('JFK','John F. Kennedy','New York','Stati Uniti'),('LHR','Heathrow','Londra','Regno Unito');
/*!40000 ALTER TABLE `aeroporti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biglietti`
--

DROP TABLE IF EXISTS `biglietti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biglietti` (
  `ID_Biglietto` varchar(36) NOT NULL,
  `Data_Emissione` date NOT NULL,
  `Prezzo` decimal(10,2) NOT NULL,
  `Posto` varchar(10) DEFAULT NULL,
  `Classe` varchar(50) DEFAULT NULL,
  `ID_Passeggero` varchar(36) DEFAULT NULL,
  `ID_Volo` varchar(36) NOT NULL,
  PRIMARY KEY (`ID_Biglietto`),
  KEY `ID_Passeggero` (`ID_Passeggero`),
  KEY `ID_Volo` (`ID_Volo`),
  CONSTRAINT `biglietti_ibfk_1` FOREIGN KEY (`ID_Passeggero`) REFERENCES `passeggeri` (`ID_Passeggero`),
  CONSTRAINT `biglietti_ibfk_2` FOREIGN KEY (`ID_Volo`) REFERENCES `voli` (`ID_Volo`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`Prezzo` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biglietti`
--

LOCK TABLES `biglietti` WRITE;
/*!40000 ALTER TABLE `biglietti` DISABLE KEYS */;
INSERT INTO `biglietti` VALUES ('587a18a1-0313-11f0-be6f-d0395730d6ca','2024-03-01',250.00,'12A','Economy','fc44f98f-0309-11f0-be6f-d0395730d6ca','e1294a13-030f-11f0-be6f-d0395730d6ca'),('587c1175-0313-11f0-be6f-d0395730d6ca','2024-03-02',400.00,'5B','Business','fc45094a-0309-11f0-be6f-d0395730d6ca','e12b6522-030f-11f0-be6f-d0395730d6ca'),('587c12cd-0313-11f0-be6f-d0395730d6ca','2024-03-03',600.00,'1A','First','fc4509f1-0309-11f0-be6f-d0395730d6ca','e12b6631-030f-11f0-be6f-d0395730d6ca'),('587c1355-0313-11f0-be6f-d0395730d6ca','2024-03-04',300.00,'22C','Economy','fc450a1b-0309-11f0-be6f-d0395730d6ca','e12b66bd-030f-11f0-be6f-d0395730d6ca'),('587c1442-0313-11f0-be6f-d0395730d6ca','2024-03-05',450.00,'8D','Business','fc450a3d-0309-11f0-be6f-d0395730d6ca','e12b6709-030f-11f0-be6f-d0395730d6ca'),('587c14c3-0313-11f0-be6f-d0395730d6ca','2024-03-06',700.00,'2F','First','fc450a5c-0309-11f0-be6f-d0395730d6ca','e12b6bb2-030f-11f0-be6f-d0395730d6ca'),('587c1538-0313-11f0-be6f-d0395730d6ca','2024-03-07',350.00,'18E','Economy','fc450a7a-0309-11f0-be6f-d0395730d6ca','e12b6c00-030f-11f0-be6f-d0395730d6ca'),('587c5dec-0313-11f0-be6f-d0395730d6ca','2024-03-08',500.00,'10A','Business','fc450a96-0309-11f0-be6f-d0395730d6ca','e12b6c4b-030f-11f0-be6f-d0395730d6ca'),('587c5f35-0313-11f0-be6f-d0395730d6ca','2024-03-09',750.00,'3C','First','fc450abd-0309-11f0-be6f-d0395730d6ca','e12ba431-030f-11f0-be6f-d0395730d6ca'),('587c5fc2-0313-11f0-be6f-d0395730d6ca','2024-03-10',400.00,'15B','Economy','fc450ad9-0309-11f0-be6f-d0395730d6ca','e12ba52f-030f-11f0-be6f-d0395730d6ca'),('fc2ef5af-031d-11f0-be6f-d0395730d6ca','2024-03-01',250.00,'20B','Economy',NULL,'e1294a13-030f-11f0-be6f-d0395730d6ca'),('fc30f140-031d-11f0-be6f-d0395730d6ca','2024-03-02',400.00,'7A','Business',NULL,'e12b6522-030f-11f0-be6f-d0395730d6ca'),('fc30f201-031d-11f0-be6f-d0395730d6ca','2024-03-03',600.00,'9C','First',NULL,'e12b6631-030f-11f0-be6f-d0395730d6ca'),('fc30f283-031d-11f0-be6f-d0395730d6ca','2024-03-04',300.00,'17A','Economy',NULL,'e12b66bd-030f-11f0-be6f-d0395730d6ca'),('fc30f2be-031d-11f0-be6f-d0395730d6ca','2024-03-05',450.00,'4E','Business',NULL,'e12b6709-030f-11f0-be6f-d0395730d6ca'),('fc30f2f3-031d-11f0-be6f-d0395730d6ca','2024-03-06',700.00,'6C','First',NULL,'e12b6bb2-030f-11f0-be6f-d0395730d6ca'),('fc30f327-031d-11f0-be6f-d0395730d6ca','2024-03-07',350.00,'15A','Economy',NULL,'e12b6c00-030f-11f0-be6f-d0395730d6ca'),('fc30f357-031d-11f0-be6f-d0395730d6ca','2024-03-08',500.00,'11B','Business',NULL,'e12b6c4b-030f-11f0-be6f-d0395730d6ca'),('fc30f386-031d-11f0-be6f-d0395730d6ca','2024-03-09',750.00,'5D','First',NULL,'e12ba431-030f-11f0-be6f-d0395730d6ca'),('fc30f3be-031d-11f0-be6f-d0395730d6ca','2024-03-10',400.00,'14D','Economy',NULL,'e12ba52f-030f-11f0-be6f-d0395730d6ca');
/*!40000 ALTER TABLE `biglietti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bigliettidisponibili`
--

DROP TABLE IF EXISTS `bigliettidisponibili`;
/*!50001 DROP VIEW IF EXISTS `bigliettidisponibili`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bigliettidisponibili` AS SELECT
 1 AS `CodiceVolo`,
  1 AS `AeroportoPartenza`,
  1 AS `Data_Di_Partenza`,
  1 AS `Ora_Di_Partenza`,
  1 AS `AeroportoArrivo`,
  1 AS `Data_Di_Arrivo`,
  1 AS `Ora_Di_Arrivo`,
  1 AS `Aereo`,
  1 AS `Capacita`,
  1 AS `Prezzo`,
  1 AS `Classe`,
  1 AS `Posto` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `itinerariocliente`
--

DROP TABLE IF EXISTS `itinerariocliente`;
/*!50001 DROP VIEW IF EXISTS `itinerariocliente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `itinerariocliente` AS SELECT
 1 AS `ID_Passeggero`,
  1 AS `Codice_Biglietto`,
  1 AS `Aeroporto_di_Partenza`,
  1 AS `Data_di_Partenza`,
  1 AS `Ora_di_Partenza`,
  1 AS `Aeroporto_di_Scalo`,
  1 AS `Tempo_di_Attesa`,
  1 AS `Aeroporto_di_Arrivo`,
  1 AS `Data_di_Arrivo`,
  1 AS `Ora_di_Arrivo` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `passeggeri`
--

DROP TABLE IF EXISTS `passeggeri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passeggeri` (
  `ID_Passeggero` varchar(36) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Cognome` varchar(255) NOT NULL,
  `Data_Nascita` date DEFAULT NULL,
  `Carta_Identita` varchar(20) DEFAULT NULL,
  `Passaporto` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Carta_Fedelta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Passeggero`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passeggeri`
--

LOCK TABLES `passeggeri` WRITE;
/*!40000 ALTER TABLE `passeggeri` DISABLE KEYS */;
INSERT INTO `passeggeri` VALUES ('fc44f98f-0309-11f0-be6f-d0395730d6ca','Mario','Rossi','1980-05-15','AB123456','XY789012','mario.rossi@email.com','3331234567','FR123456'),('fc45094a-0309-11f0-be6f-d0395730d6ca','Anna','Verdi','1992-10-22','CD789012','UV345678','anna.verdi@email.com','3459876543','AZ987654'),('fc4509f1-0309-11f0-be6f-d0395730d6ca','Luca','Bianchi','1975-03-08','EF345678','OP123456','luca.bianchi@email.com','3285551212','TY567890'),('fc450a1b-0309-11f0-be6f-d0395730d6ca','Giulia','Neri','1988-12-01','GH901234','QR567890','giulia.neri@email.com','3391122334','UI345678'),('fc450a3d-0309-11f0-be6f-d0395730d6ca','Paolo','Gialli','1965-07-18','IJ567890','ST901234','paolo.gialli@email.com','3474455667','OP789012'),('fc450a5c-0309-11f0-be6f-d0395730d6ca','Francesca','Viola','2000-09-29','KL123456','UV345678','francesca.viola@email.com','3297788990','AS123456'),('fc450a7a-0309-11f0-be6f-d0395730d6ca','Roberto','Arancio','1970-04-05','MN789012','XY901234','roberto.arancio@email.com','3386677889','ZX567890'),('fc450a96-0309-11f0-be6f-d0395730d6ca','Laura','Blu','1983-11-23','OP345678','QR123456','laura.blu@email.com','3492233445','CV901234'),('fc450abd-0309-11f0-be6f-d0395730d6ca','Marco','Marrone','1995-06-12','QR901234','ST567890','marco.marrone@email.com','3348899001','BN345678'),('fc450ad9-0309-11f0-be6f-d0395730d6ca','Elena','Rosa','1978-01-30','ST567890','UV123456','elena.rosa@email.com','3465566778','ML123456');
/*!40000 ALTER TABLE `passeggeri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `passeggeriperclasse`
--

DROP TABLE IF EXISTS `passeggeriperclasse`;
/*!50001 DROP VIEW IF EXISTS `passeggeriperclasse`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `passeggeriperclasse` AS SELECT
 1 AS `Codice_Volo`,
  1 AS `Nome_Passeggero`,
  1 AS `Cognome_Passeggero`,
  1 AS `Posto`,
  1 AS `Classe` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `scali`
--

DROP TABLE IF EXISTS `scali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scali` (
  `ID_Scalo` varchar(36) NOT NULL,
  `Tempo_Attesa` time NOT NULL,
  `ID_Volo` varchar(36) NOT NULL,
  `Aeroporto_Scalo` varchar(3) NOT NULL,
  PRIMARY KEY (`ID_Scalo`),
  KEY `ID_Volo` (`ID_Volo`),
  KEY `Aeroporto_Scalo` (`Aeroporto_Scalo`),
  CONSTRAINT `scali_ibfk_1` FOREIGN KEY (`ID_Volo`) REFERENCES `voli` (`ID_Volo`),
  CONSTRAINT `scali_ibfk_2` FOREIGN KEY (`Aeroporto_Scalo`) REFERENCES `aeroporti` (`ID_Aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scali`
--

LOCK TABLES `scali` WRITE;
/*!40000 ALTER TABLE `scali` DISABLE KEYS */;
INSERT INTO `scali` VALUES ('61613f08-031a-11f0-be6f-d0395730d6ca','03:00:00','e1294a13-030f-11f0-be6f-d0395730d6ca','LHR'),('61633f83-031a-11f0-be6f-d0395730d6ca','01:00:00','e12b6709-030f-11f0-be6f-d0395730d6ca','CDG');
/*!40000 ALTER TABLE `scali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `validitabiglietto`
--

DROP TABLE IF EXISTS `validitabiglietto`;
/*!50001 DROP VIEW IF EXISTS `validitabiglietto`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `validitabiglietto` AS SELECT
 1 AS `Codice_Biglietto`,
  1 AS `Aeroporto_di_Partenza`,
  1 AS `Data_di_Partenza`,
  1 AS `Ora_di_Partenza`,
  1 AS `Aeroporto_di_Arrivo`,
  1 AS `Data_di_Arrivo`,
  1 AS `Ora_di_Arrivo`,
  1 AS `Nome`,
  1 AS `Cognome`,
  1 AS `Classe` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `voli`
--

DROP TABLE IF EXISTS `voli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voli` (
  `ID_Volo` varchar(36) NOT NULL,
  `Data_Partenza` date NOT NULL,
  `Ora_Partenza` time NOT NULL,
  `Data_Arrivo` date NOT NULL,
  `Ora_Arrivo` time NOT NULL,
  `ID_Aereo` varchar(36) NOT NULL,
  `Aeroporto_Partenza` varchar(3) NOT NULL,
  `Aeroporto_Arrivo` varchar(3) NOT NULL,
  PRIMARY KEY (`ID_Volo`),
  KEY `ID_Aereo` (`ID_Aereo`),
  KEY `Aeroporto_Partenza` (`Aeroporto_Partenza`),
  KEY `Aeroporto_Arrivo` (`Aeroporto_Arrivo`),
  CONSTRAINT `voli_ibfk_1` FOREIGN KEY (`ID_Aereo`) REFERENCES `aerei` (`ID_Aereo`),
  CONSTRAINT `voli_ibfk_2` FOREIGN KEY (`Aeroporto_Partenza`) REFERENCES `aeroporti` (`ID_Aeroporto`),
  CONSTRAINT `voli_ibfk_3` FOREIGN KEY (`Aeroporto_Arrivo`) REFERENCES `aeroporti` (`ID_Aeroporto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voli`
--

LOCK TABLES `voli` WRITE;
/*!40000 ALTER TABLE `voli` DISABLE KEYS */;
INSERT INTO `voli` VALUES ('e1294a13-030f-11f0-be6f-d0395730d6ca','2024-03-10','10:00:00','2024-03-10','12:00:00','de6ebced-030d-11f0-be6f-d0395730d6ca','FCO','LHR'),('e12b6522-030f-11f0-be6f-d0395730d6ca','2024-03-11','14:00:00','2024-03-11','17:00:00','de6eb9ea-030d-11f0-be6f-d0395730d6ca','LHR','JFK'),('e12b6631-030f-11f0-be6f-d0395730d6ca','2024-03-12','18:00:00','2024-03-13','01:00:00','de6ebced-030d-11f0-be6f-d0395730d6ca','JFK','FCO'),('e12b66bd-030f-11f0-be6f-d0395730d6ca','2024-03-13','08:00:00','2024-03-13','11:00:00','de6ebdaf-030d-11f0-be6f-d0395730d6ca','CDG','DXB'),('e12b6709-030f-11f0-be6f-d0395730d6ca','2024-03-14','12:00:00','2024-03-14','16:00:00','de6eb9ea-030d-11f0-be6f-d0395730d6ca','DXB','CDG'),('e12b6bb2-030f-11f0-be6f-d0395730d6ca','2024-03-15','16:00:00','2024-03-16','00:00:00','de6ebd82-030d-11f0-be6f-d0395730d6ca','FCO','JFK'),('e12b6c00-030f-11f0-be6f-d0395730d6ca','2024-03-16','20:00:00','2024-03-17','03:00:00','de6ebdd8-030d-11f0-be6f-d0395730d6ca','JFK','LHR'),('e12b6c4b-030f-11f0-be6f-d0395730d6ca','2024-03-10','15:00:00','2024-03-10','19:00:00','de6ebdd8-030d-11f0-be6f-d0395730d6ca','LHR','CDG'),('e12ba431-030f-11f0-be6f-d0395730d6ca','2024-03-14','17:00:00','2024-03-14','22:00:00','de6ebd82-030d-11f0-be6f-d0395730d6ca','CDG','FCO'),('e12ba52f-030f-11f0-be6f-d0395730d6ca','2024-03-19','17:00:00','2024-03-20','00:00:00','de6ebdaf-030d-11f0-be6f-d0395730d6ca','DXB','JFK');
/*!40000 ALTER TABLE `voli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `voliconscalo`
--

DROP TABLE IF EXISTS `voliconscalo`;
/*!50001 DROP VIEW IF EXISTS `voliconscalo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `voliconscalo` AS SELECT
 1 AS `Codice Volo`,
  1 AS `Aeroporto di Partenza`,
  1 AS `Data di Partenza`,
  1 AS `Ora di Partenza`,
  1 AS `Aeroporto di Scalo`,
  1 AS `Tempo di Attesa`,
  1 AS `Aeroporto di Arrivo`,
  1 AS `Data di Arrivo`,
  1 AS `Ora di Arrivo` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bigliettidisponibili`
--

/*!50001 DROP VIEW IF EXISTS `bigliettidisponibili`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bigliettidisponibili` AS select `voli`.`ID_Volo` AS `CodiceVolo`,`aeroporto_di_partenza`.`ID_Aeroporto` AS `AeroportoPartenza`,`voli`.`Data_Partenza` AS `Data_Di_Partenza`,`voli`.`Ora_Partenza` AS `Ora_Di_Partenza`,`aeroporti_arrivo`.`ID_Aeroporto` AS `AeroportoArrivo`,`voli`.`Data_Arrivo` AS `Data_Di_Arrivo`,`voli`.`Ora_Arrivo` AS `Ora_Di_Arrivo`,`aerei`.`Tipo_Aereo` AS `Aereo`,`aerei`.`Capacita` AS `Capacita`,`biglietti`.`Prezzo` AS `Prezzo`,`biglietti`.`Classe` AS `Classe`,`biglietti`.`Posto` AS `Posto` from ((((`voli` join `aerei` on(`voli`.`ID_Aereo` = `aerei`.`ID_Aereo`)) join `aeroporti` `aeroporto_di_partenza` on(`voli`.`Aeroporto_Partenza` = `aeroporto_di_partenza`.`ID_Aeroporto`)) join `aeroporti` `aeroporti_arrivo` on(`voli`.`Aeroporto_Arrivo` = `aeroporti_arrivo`.`ID_Aeroporto`)) join `biglietti` on(`voli`.`ID_Volo` = `biglietti`.`ID_Volo`)) where `biglietti`.`ID_Passeggero` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `itinerariocliente`
--

/*!50001 DROP VIEW IF EXISTS `itinerariocliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `itinerariocliente` AS select `biglietti`.`ID_Passeggero` AS `ID_Passeggero`,`biglietti`.`ID_Biglietto` AS `Codice_Biglietto`,`aeroporti_partenza`.`ID_Aeroporto` AS `Aeroporto_di_Partenza`,`voli`.`Data_Partenza` AS `Data_di_Partenza`,`voli`.`Ora_Partenza` AS `Ora_di_Partenza`,`scali`.`Aeroporto_Scalo` AS `Aeroporto_di_Scalo`,`scali`.`Tempo_Attesa` AS `Tempo_di_Attesa`,`aeroporti_arrivo`.`ID_Aeroporto` AS `Aeroporto_di_Arrivo`,`voli`.`Data_Arrivo` AS `Data_di_Arrivo`,`voli`.`Ora_Arrivo` AS `Ora_di_Arrivo` from ((((`biglietti` join `voli` on(`biglietti`.`ID_Volo` = `voli`.`ID_Volo`)) join `aeroporti` `aeroporti_partenza` on(`voli`.`Aeroporto_Partenza` = `aeroporti_partenza`.`ID_Aeroporto`)) join `aeroporti` `aeroporti_arrivo` on(`voli`.`Aeroporto_Arrivo` = `aeroporti_arrivo`.`ID_Aeroporto`)) left join `scali` on(`voli`.`ID_Volo` = `scali`.`ID_Volo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passeggeriperclasse`
--

/*!50001 DROP VIEW IF EXISTS `passeggeriperclasse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passeggeriperclasse` AS select `voli`.`ID_Volo` AS `Codice_Volo`,`passeggeri`.`Nome` AS `Nome_Passeggero`,`passeggeri`.`Cognome` AS `Cognome_Passeggero`,`biglietti`.`Posto` AS `Posto`,`biglietti`.`Classe` AS `Classe` from ((`biglietti` join `passeggeri` on(`biglietti`.`ID_Passeggero` = `passeggeri`.`ID_Passeggero`)) join `voli` on(`biglietti`.`ID_Volo` = `voli`.`ID_Volo`)) order by `biglietti`.`Classe` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `validitabiglietto`
--

/*!50001 DROP VIEW IF EXISTS `validitabiglietto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `validitabiglietto` AS select `biglietti`.`ID_Biglietto` AS `Codice_Biglietto`,`aeroporti_partenza`.`ID_Aeroporto` AS `Aeroporto_di_Partenza`,`voli`.`Data_Partenza` AS `Data_di_Partenza`,`voli`.`Ora_Partenza` AS `Ora_di_Partenza`,`aeroporti_arrivo`.`ID_Aeroporto` AS `Aeroporto_di_Arrivo`,`voli`.`Data_Arrivo` AS `Data_di_Arrivo`,`voli`.`Ora_Arrivo` AS `Ora_di_Arrivo`,`passeggeri`.`Nome` AS `Nome`,`passeggeri`.`Cognome` AS `Cognome`,`biglietti`.`Classe` AS `Classe` from ((((`biglietti` join `voli` on(`biglietti`.`ID_Volo` = `voli`.`ID_Volo`)) join `passeggeri` on(`biglietti`.`ID_Passeggero` = `passeggeri`.`ID_Passeggero`)) join `aeroporti` `aeroporti_partenza` on(`voli`.`Aeroporto_Partenza` = `aeroporti_partenza`.`ID_Aeroporto`)) join `aeroporti` `aeroporti_arrivo` on(`voli`.`Aeroporto_Arrivo` = `aeroporti_arrivo`.`ID_Aeroporto`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `voliconscalo`
--

/*!50001 DROP VIEW IF EXISTS `voliconscalo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `voliconscalo` AS select `voli`.`ID_Volo` AS `Codice Volo`,`aeroporti_partenza`.`ID_Aeroporto` AS `Aeroporto di Partenza`,`voli`.`Data_Partenza` AS `Data di Partenza`,`voli`.`Ora_Partenza` AS `Ora di Partenza`,`scali`.`Aeroporto_Scalo` AS `Aeroporto di Scalo`,`scali`.`Tempo_Attesa` AS `Tempo di Attesa`,`aeroporti_arrivo`.`ID_Aeroporto` AS `Aeroporto di Arrivo`,`voli`.`Data_Arrivo` AS `Data di Arrivo`,`voli`.`Ora_Arrivo` AS `Ora di Arrivo` from (((`voli` join `aeroporti` `aeroporti_partenza` on(`voli`.`Aeroporto_Partenza` = `aeroporti_partenza`.`ID_Aeroporto`)) join `aeroporti` `aeroporti_arrivo` on(`voli`.`Aeroporto_Arrivo` = `aeroporti_arrivo`.`ID_Aeroporto`)) join `scali` on(`voli`.`ID_Volo` = `scali`.`ID_Volo`)) */;
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

-- Dump completed on 2025-03-18 10:55:12
