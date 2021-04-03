-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: securityrat
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `ALTERNATIVEINSTANCE`
--

DROP TABLE IF EXISTS `ALTERNATIVEINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALTERNATIVEINSTANCE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `alternativeset_id` bigint(20) DEFAULT NULL,
  `requirementskeleton_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alternativeinstance_alternativeset_id` (`alternativeset_id`),
  KEY `fk_alternativeinstance_requirementskeleton_id` (`requirementskeleton_id`),
  CONSTRAINT `fk_alternativeinstance_alternativeset_id` FOREIGN KEY (`alternativeset_id`) REFERENCES `ALTERNATIVESET` (`id`),
  CONSTRAINT `fk_alternativeinstance_requirementskeleton_id` FOREIGN KEY (`requirementskeleton_id`) REFERENCES `REQUIREMENTSKELETON` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALTERNATIVEINSTANCE`
--

LOCK TABLES `ALTERNATIVEINSTANCE` WRITE;
/*!40000 ALTER TABLE `ALTERNATIVEINSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ALTERNATIVEINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ALTERNATIVESET`
--

DROP TABLE IF EXISTS `ALTERNATIVESET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALTERNATIVESET` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `optcolumn_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_alternativeset_optcolumn_id` (`optcolumn_id`),
  CONSTRAINT `fk_alternativeset_optcolumn_id` FOREIGN KEY (`optcolumn_id`) REFERENCES `OPTCOLUMN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALTERNATIVESET`
--

LOCK TABLES `ALTERNATIVESET` WRITE;
/*!40000 ALTER TABLE `ALTERNATIVESET` DISABLE KEYS */;
/*!40000 ALTER TABLE `ALTERNATIVESET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLLECTIONCATEGORY`
--

DROP TABLE IF EXISTS `COLLECTIONCATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLLECTIONCATEGORY` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTIONCATEGORY`
--

LOCK TABLES `COLLECTIONCATEGORY` WRITE;
/*!40000 ALTER TABLE `COLLECTIONCATEGORY` DISABLE KEYS */;
INSERT INTO `COLLECTIONCATEGORY` VALUES (1,'Application Security Verification Standard Project v4.0','The OWASP Application Security Verification Standard (ASVS) Project provides a basis for testing web application technical security controls and also provides developers with a list of requirements for secure development.',0,_binary ''),(2,'Application Security Verification Levels','The Application Security Verification Standard defines three security verification levels, with each level increasing in depth.',1,_binary '');
/*!40000 ALTER TABLE `COLLECTIONCATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLLECTIONINSTANCE`
--

DROP TABLE IF EXISTS `COLLECTIONINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLLECTIONINSTANCE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `collectioncategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collectioninstance_collectioncategory_id` (`collectioncategory_id`),
  CONSTRAINT `fk_collectioninstance_collectioncategory_id` FOREIGN KEY (`collectioncategory_id`) REFERENCES `COLLECTIONCATEGORY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTIONINSTANCE`
--

LOCK TABLES `COLLECTIONINSTANCE` WRITE;
/*!40000 ALTER TABLE `COLLECTIONINSTANCE` DISABLE KEYS */;
INSERT INTO `COLLECTIONINSTANCE` VALUES (1,'L1','ASVS Level 1 is for low assurance levels, and is completely penetration testable',0,_binary '',2),(2,'L2','ASVS Level 2 is for applications that contain sensitive data, which requires protection and is the recommended level for most apps',1,_binary '',2),(3,'L3','ASVS Level 3 is for the most critical applications -applications that perform high value transactions, contain sensitive medical data, or any application that requires the highest level of trust.',2,_binary '',2),(4,'V1 - Architecture','Architecture, Design and Threat Modeling Requirements',10,_binary '',1),(5,'V2 - Authentication','Authentication Verification Requirements',20,_binary '',1),(6,'V3 - Session','Session Management Verification Requirements',30,_binary '',1),(7,'V4 - Access','Access Control Verification Requirements',40,_binary '',1),(8,'V5 - Validation','Validation, Sanitization and Encoding Verification Requirements',50,_binary '',1),(9,'V6 - Cryptography','Stored Cryptography Verification Requirements',60,_binary '',1),(10,'V7 - Error','Error Handling and Logging Verification Requirements',70,_binary '',1),(11,'V8 - Data','Data Protection Verification Requirements',80,_binary '',1),(12,'V9 - Communications','Communications Verification Requirements',90,_binary '',1),(13,'V10 - Malicious','Malicious Code Verification Requirements',100,_binary '',1),(14,'V11 - BusLogic','Business Logic Verification Requirements',110,_binary '',1),(15,'V12 - Files','File and Resources Verification Requirements',120,_binary '',1),(16,'V13 - API','API and Web Service Verification Requirements',130,_binary '',1),(17,'V14 - Config','Configuration Verification Requirements',140,_binary '',1);
/*!40000 ALTER TABLE `COLLECTIONINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPTCOLUMN`
--

DROP TABLE IF EXISTS `OPTCOLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPTCOLUMN` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `optcolumntype_id` bigint(20) DEFAULT NULL,
  `isVisibleByDefault` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `fk_optcolumn_optcolumntype_id` (`optcolumntype_id`),
  CONSTRAINT `fk_optcolumn_optcolumntype_id` FOREIGN KEY (`optcolumntype_id`) REFERENCES `OPTCOLUMNTYPE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMN`
--

LOCK TABLES `OPTCOLUMN` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMN` DISABLE KEYS */;
INSERT INTO `OPTCOLUMN` VALUES (1,'CWE Link','n',0,_binary '',1,_binary ''),(2,'NIST Link','A link to a NIST item',1,_binary '',1,_binary '');
/*!40000 ALTER TABLE `OPTCOLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPTCOLUMNCONTENT`
--

DROP TABLE IF EXISTS `OPTCOLUMNCONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPTCOLUMNCONTENT` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `optcolumn_id` bigint(20) DEFAULT NULL,
  `requirementskeleton_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_optcolumncontent_optcolumn_id` (`optcolumn_id`),
  KEY `fk_optcolumncontent_requirementskeleton_id` (`requirementskeleton_id`),
  CONSTRAINT `fk_optcolumncontent_optcolumn_id` FOREIGN KEY (`optcolumn_id`) REFERENCES `OPTCOLUMN` (`id`),
  CONSTRAINT `fk_optcolumncontent_requirementskeleton_id` FOREIGN KEY (`requirementskeleton_id`) REFERENCES `REQUIREMENTSKELETON` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMNCONTENT`
--

LOCK TABLES `OPTCOLUMNCONTENT` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMNCONTENT` DISABLE KEYS */;
INSERT INTO `OPTCOLUMNCONTENT` VALUES (1,'',1,1),(2,'',2,1),(3,'1053',1,2),(4,'',2,2),(5,'1110',1,3),(6,'',2,3),(7,'1059',1,4),(8,'',2,4),(9,'1059',1,5),(10,'',2,5),(11,'637',1,6),(12,'',2,6),(13,'637',1,7),(14,'',2,7),(15,'306',1,8),(16,'',2,8),(17,'306',1,9),(18,'',2,9),(19,'306',1,10),(20,'',2,10),(21,'602',1,11),(22,'',2,11),(23,'284',1,12),(24,'',2,12),(25,'272',1,13),(26,'',2,13),(27,'272',1,14),(28,'',2,14),(29,'284',1,15),(30,'',2,15),(31,'275',1,16),(32,'',2,16),(33,'1029',1,17),(34,'',2,17),(35,'502',1,18),(36,'',2,18),(37,'602',1,19),(38,'',2,19),(39,'116',1,20),(40,'',2,20),(41,'320',1,21),(42,'',2,21),(43,'320',1,22),(44,'',2,22),(45,'320',1,23),(46,'',2,23),(47,'320',1,24),(48,'',2,24),(49,'1009',1,25),(50,'',2,25),(51,'',1,26),(52,'',2,26),(53,'',1,27),(54,'',2,27),(55,'',1,28),(56,'',2,28),(57,'319',1,29),(58,'',2,29),(59,'295',1,30),(60,'',2,30),(61,'284',1,31),(62,'',2,31),(63,'1059',1,32),(64,'',2,32),(65,'362',1,33),(66,'',2,33),(67,'367',1,34),(68,'',2,34),(69,'552',1,35),(70,'',2,35),(71,'646',1,36),(72,'',2,36),(73,'250',1,37),(74,'',2,37),(75,'923',1,38),(76,'',2,38),(77,'494',1,39),(78,'',2,39),(79,'1104',1,40),(80,'',2,40),(81,'',1,41),(82,'',2,41),(83,'265',1,42),(84,'',2,42),(85,'477',1,43),(86,'',2,43),(87,'521',1,44),(88,'5.1.1.2',2,44),(89,'521',1,45),(90,'5.1.1.2',2,45),(91,'521',1,46),(92,'5.1.1.2',2,46),(93,'521',1,47),(94,'5.1.1.2',2,47),(95,'620',1,48),(96,'5.1.1.2',2,48),(97,'620',1,49),(98,'5.1.1.2',2,49),(99,'521',1,50),(100,'5.1.1.2',2,50),(101,'521',1,51),(102,'5.1.1.2',2,51),(103,'521',1,52),(104,'5.1.1.2',2,52),(105,'263',1,53),(106,'5.1.1.2',2,53),(107,'521',1,54),(108,'5.1.1.2',2,54),(109,'521',1,55),(110,'5.1.1.2',2,55),(111,'307',1,56),(112,'5.2.2, 5.1.1.2, 5.1.4.2, 5.1.5.2',2,56),(113,'304',1,57),(114,'5.2.10',2,57),(115,'620',1,58),(116,'',2,58),(117,'308',1,59),(118,'5.2.5',2,59),(119,'319',1,60),(120,'5.2.6',2,60),(121,'308',1,61),(122,'5.2.8',2,61),(123,'308',1,62),(124,'5.2.9',2,62),(125,'330',1,63),(126,'5.1.1.2, A.3',2,63),(127,'308',1,64),(128,'6.1.3',2,64),(129,'287',1,65),(130,'6.1.4',2,65),(131,'916',1,66),(132,'5.1.1.2',2,66),(133,'916',1,67),(134,'5.1.1.2',2,67),(135,'916',1,68),(136,'5.1.1.2',2,68),(137,'916',1,69),(138,'5.1.1.2',2,69),(139,'916',1,70),(140,'5.1.1.2',2,70),(141,'640',1,71),(142,'5.1.1.2',2,71),(143,'640',1,72),(144,'5.1.1.2',2,72),(145,'640',1,73),(146,'5.1.1.2',2,73),(147,'16',1,74),(148,'5.1.1.2, A.3',2,74),(149,'304',1,75),(150,'6.1.2.3',2,75),(151,'640',1,76),(152,'5.1.1.2',2,76),(153,'308',1,77),(154,'6.1.2.3',2,77),(155,'308',1,78),(156,'5.1.2.2',2,78),(157,'330',1,79),(158,'5.1.2.2',2,79),(159,'310',1,80),(160,'5.1.2.2',2,80),(161,'287',1,81),(162,'5.1.3.2',2,81),(163,'287',1,82),(164,'5.1.3.2',2,82),(165,'287',1,83),(166,'5.1.3.2',2,83),(167,'523',1,84),(168,'5.1.3.2',2,84),(169,'256',1,85),(170,'5.1.3.2',2,85),(171,'310',1,86),(172,'5.1.3.2',2,86),(173,'613',1,87),(174,'5.1.4.2, 5.1.5.2',2,87),(175,'320',1,88),(176,'5.1.4.2, 5.1.5.2',2,88),(177,'326',1,89),(178,'5.1.4.2, 5.1.5.2',2,89),(179,'287',1,90),(180,'5.1.4.2, 5.1.5.2',2,90),(181,'287',1,91),(182,'5.1.5.2',2,91),(183,'613',1,92),(184,'5.2.1',2,92),(185,'308',1,93),(186,'5.2.3',2,93),(187,'320',1,94),(188,'5.1.7.2',2,94),(189,'330',1,95),(190,'5.1.7.2',2,95),(191,'327',1,96),(192,'5.1.7.2',2,96),(193,'287',1,97),(194,'5.1.1.1',2,97),(195,'255',1,98),(196,'5.1.1.1',2,98),(197,'522',1,99),(198,'5.1.1.1',2,99),(199,'798',1,100),(200,'',2,100),(201,'598',1,101),(202,'',2,101),(203,'384',1,102),(204,'7.1',2,102),(205,'331',1,103),(206,'7.1',2,103),(207,'539',1,104),(208,'7.1',2,104),(209,'331',1,105),(210,'7.1',2,105),(211,'613',1,106),(212,'7.1',2,106),(213,'613',1,107),(214,'7.2',2,107),(215,'613',1,108),(216,'',2,108),(217,'613',1,109),(218,'7.1',2,109),(219,'614',1,110),(220,'7.1.1',2,110),(221,'1004',1,111),(222,'7.1.1',2,111),(223,'16',1,112),(224,'7.1.1',2,112),(225,'16',1,113),(226,'7.1.1',2,113),(227,'16',1,114),(228,'7.1.1',2,114),(229,'290',1,115),(230,'7.1.2',2,115),(231,'798',1,116),(232,'',2,116),(233,'345',1,117),(234,'',2,117),(235,'613',1,118),(236,'7.2.1',2,118),(237,'613',1,119),(238,'7.2.1',2,119),(239,'778',1,120),(240,'',2,120),(241,'602',1,121),(242,'',2,121),(243,'639',1,122),(244,'',2,122),(245,'285',1,123),(246,'',2,123),(247,'276',1,124),(248,'',2,124),(249,'285',1,125),(250,'',2,125),(251,'639',1,126),(252,'',2,126),(253,'352',1,127),(254,'',2,127),(255,'419',1,128),(256,'',2,128),(257,'548',1,129),(258,'',2,129),(259,'732',1,130),(260,'',2,130),(261,'235',1,131),(262,'',2,131),(263,'915',1,132),(264,'',2,132),(265,'20',1,133),(266,'',2,133),(267,'20',1,134),(268,'',2,134),(269,'601',1,135),(270,'',2,135),(271,'116',1,136),(272,'',2,136),(273,'138',1,137),(274,'',2,137),(275,'147',1,138),(276,'',2,138),(277,'95',1,139),(278,'',2,139),(279,'94',1,140),(280,'',2,140),(281,'918',1,141),(282,'',2,141),(283,'159',1,142),(284,'',2,142),(285,'94',1,143),(286,'',2,143),(287,'116',1,144),(288,'',2,144),(289,'176',1,145),(290,'',2,145),(291,'79',1,146),(292,'',2,146),(293,'89',1,147),(294,'',2,147),(295,'89',1,148),(296,'',2,148),(297,'830',1,149),(298,'',2,149),(299,'943',1,150),(300,'',2,150),(301,'78',1,151),(302,'',2,151),(303,'829',1,152),(304,'',2,152),(305,'643',1,153),(306,'',2,153),(307,'120',1,154),(308,'',2,154),(309,'134',1,155),(310,'',2,155),(311,'190',1,156),(312,'',2,156),(313,'502',1,157),(314,'',2,157),(315,'611',1,158),(316,'',2,158),(317,'502',1,159),(318,'',2,159),(319,'95',1,160),(320,'',2,160),(321,'311',1,161),(322,'',2,161),(323,'311',1,162),(324,'',2,162),(325,'311',1,163),(326,'',2,163),(327,'310',1,164),(328,'',2,164),(329,'327',1,165),(330,'',2,165),(331,'326',1,166),(332,'',2,166),(333,'326',1,167),(334,'',2,167),(335,'326',1,168),(336,'',2,168),(337,'326',1,169),(338,'',2,169),(339,'326',1,170),(340,'',2,170),(341,'385',1,171),(342,'',2,171),(343,'338',1,172),(344,'',2,172),(345,'338',1,173),(346,'',2,173),(347,'338',1,174),(348,'',2,174),(349,'798',1,175),(350,'',2,175),(351,'320',1,176),(352,'',2,176),(353,'532',1,177),(354,'',2,177),(355,'532',1,178),(356,'',2,178),(357,'778',1,179),(358,'',2,179),(359,'778',1,180),(360,'',2,180),(361,'778',1,181),(362,'',2,181),(363,'285',1,182),(364,'',2,182),(365,'117',1,183),(366,'',2,183),(367,'117',1,184),(368,'',2,184),(369,'200',1,185),(370,'',2,185),(371,'',1,186),(372,'',2,186),(373,'210',1,187),(374,'',2,187),(375,'544',1,188),(376,'',2,188),(377,'460',1,189),(378,'',2,189),(379,'524',1,190),(380,'',2,190),(381,'524',1,191),(382,'',2,191),(383,'233',1,192),(384,'',2,192),(385,'770',1,193),(386,'',2,193),(387,'19',1,194),(388,'',2,194),(389,'19',1,195),(390,'',2,195),(391,'525',1,196),(392,'',2,196),(393,'922',1,197),(394,'',2,197),(395,'922',1,198),(396,'',2,198),(397,'319',1,199),(398,'',2,199),(399,'212',1,200),(400,'',2,200),(401,'285',1,201),(402,'',2,201),(403,'200',1,202),(404,'',2,202),(405,'532',1,203),(406,'',2,203),(407,'226',1,204),(408,'',2,204),(409,'327',1,205),(410,'',2,205),(411,'285',1,206),(412,'',2,206),(413,'319',1,207),(414,'',2,207),(415,'326',1,208),(416,'',2,208),(417,'326',1,209),(418,'',2,209),(419,'295',1,210),(420,'',2,210),(421,'319',1,211),(422,'',2,211),(423,'287',1,212),(424,'',2,212),(425,'299',1,213),(426,'',2,213),(427,'544',1,214),(428,'',2,214),(429,'749',1,215),(430,'',2,215),(431,'359',1,216),(432,'',2,216),(433,'272',1,217),(434,'',2,217),(435,'507',1,218),(436,'',2,218),(437,'511',1,219),(438,'',2,219),(439,'511',1,220),(440,'',2,220),(441,'507',1,221),(442,'',2,221),(443,'16',1,222),(444,'',2,222),(445,'353',1,223),(446,'',2,223),(447,'350',1,224),(448,'',2,224),(449,'841',1,225),(450,'',2,225),(451,'799',1,226),(452,'',2,226),(453,'770',1,227),(454,'',2,227),(455,'770',1,228),(456,'',2,228),(457,'841',1,229),(458,'',2,229),(459,'367',1,230),(460,'',2,230),(461,'754',1,231),(462,'',2,231),(463,'390',1,232),(464,'',2,232),(465,'400',1,233),(466,'',2,233),(467,'409',1,234),(468,'',2,234),(469,'770',1,235),(470,'',2,235),(471,'434',1,236),(472,'',2,236),(473,'22',1,237),(474,'',2,237),(475,'73',1,238),(476,'',2,238),(477,'98',1,239),(478,'',2,239),(479,'641',1,240),(480,'',2,240),(481,'78',1,241),(482,'',2,241),(483,'829',1,242),(484,'',2,242),(485,'922',1,243),(486,'',2,243),(487,'509',1,244),(488,'',2,244),(489,'552',1,245),(490,'',2,245),(491,'434',1,246),(492,'',2,246),(493,'918',1,247),(494,'',2,247),(495,'116',1,248),(496,'',2,248),(497,'419',1,249),(498,'',2,249),(499,'598',1,250),(500,'',2,250),(501,'285',1,251),(502,'',2,251),(503,'434',1,252),(504,'',2,252),(505,'650',1,253),(506,'',2,253),(507,'20',1,254),(508,'',2,254),(509,'352',1,255),(510,'',2,255),(511,'779',1,256),(512,'',2,256),(513,'436',1,257),(514,'',2,257),(515,'345',1,258),(516,'',2,258),(517,'20',1,259),(518,'',2,259),(519,'345',1,260),(520,'',2,260),(521,'770',1,261),(522,'',2,261),(523,'285',1,262),(524,'',2,262),(525,'',1,263),(526,'',2,263),(527,'120',1,264),(528,'',2,264),(529,'16',1,265),(530,'',2,265),(531,'',1,266),(532,'',2,266),(533,'',1,267),(534,'',2,267),(535,'1026',1,268),(536,'',2,268),(537,'1002',1,269),(538,'',2,269),(539,'714',1,270),(540,'',2,270),(541,'829',1,271),(542,'',2,271),(543,'',1,272),(544,'',2,272),(545,'265',1,273),(546,'',2,273),(547,'209',1,274),(548,'',2,274),(549,'497',1,275),(550,'',2,275),(551,'200',1,276),(552,'',2,276),(553,'173',1,277),(554,'',2,277),(555,'116',1,278),(556,'',2,278),(557,'1021',1,279),(558,'',2,279),(559,'116',1,280),(560,'',2,280),(561,'523',1,281),(562,'',2,281),(563,'116',1,282),(564,'',2,282),(565,'346',1,283),(566,'',2,283),(567,'749',1,284),(568,'',2,284),(569,'346',1,285),(570,'',2,285),(571,'346',1,286),(572,'',2,286),(573,'306',1,287),(574,'',2,287);
/*!40000 ALTER TABLE `OPTCOLUMNCONTENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPTCOLUMNTYPE`
--

DROP TABLE IF EXISTS `OPTCOLUMNTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPTCOLUMNTYPE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMNTYPE`
--

LOCK TABLES `OPTCOLUMNTYPE` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMNTYPE` DISABLE KEYS */;
INSERT INTO `OPTCOLUMNTYPE` VALUES (1,'shortString','A short string');
/*!40000 ALTER TABLE `OPTCOLUMNTYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECTTYPE`
--

DROP TABLE IF EXISTS `PROJECTTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECTTYPE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTTYPE`
--

LOCK TABLES `PROJECTTYPE` WRITE;
/*!40000 ALTER TABLE `PROJECTTYPE` DISABLE KEYS */;
INSERT INTO `PROJECTTYPE` VALUES (1,'OWASP ASVS',NULL,0,_binary '');
/*!40000 ALTER TABLE `PROJECTTYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECTTYPE_OPTCOLUMN`
--

DROP TABLE IF EXISTS `PROJECTTYPE_OPTCOLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECTTYPE_OPTCOLUMN` (
  `optcolumns_id` bigint(20) NOT NULL,
  `projecttypes_id` bigint(20) NOT NULL,
  PRIMARY KEY (`projecttypes_id`,`optcolumns_id`),
  KEY `fk_optcolumn_optcolumn_projecttype_id` (`optcolumns_id`),
  CONSTRAINT `fk_optcolumn_optcolumn_projecttype_id` FOREIGN KEY (`optcolumns_id`) REFERENCES `OPTCOLUMN` (`id`),
  CONSTRAINT `fk_projecttype_optcolumn_optcolumn_id` FOREIGN KEY (`projecttypes_id`) REFERENCES `PROJECTTYPE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTTYPE_OPTCOLUMN`
--

LOCK TABLES `PROJECTTYPE_OPTCOLUMN` WRITE;
/*!40000 ALTER TABLE `PROJECTTYPE_OPTCOLUMN` DISABLE KEYS */;
INSERT INTO `PROJECTTYPE_OPTCOLUMN` VALUES (1,1),(2,1);
/*!40000 ALTER TABLE `PROJECTTYPE_OPTCOLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROJECTTYPE_STATUSCOLUMN`
--

DROP TABLE IF EXISTS `PROJECTTYPE_STATUSCOLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROJECTTYPE_STATUSCOLUMN` (
  `statuscolumns_id` bigint(20) NOT NULL,
  `projecttypes_id` bigint(20) NOT NULL,
  PRIMARY KEY (`projecttypes_id`,`statuscolumns_id`),
  KEY `fk_statuscolumn_statuscolumn_projecttype_id` (`statuscolumns_id`),
  CONSTRAINT `fk_projecttype_statuscolumn_statuscolumn_id` FOREIGN KEY (`projecttypes_id`) REFERENCES `PROJECTTYPE` (`id`),
  CONSTRAINT `fk_statuscolumn_statuscolumn_projecttype_id` FOREIGN KEY (`statuscolumns_id`) REFERENCES `STATUSCOLUMN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTTYPE_STATUSCOLUMN`
--

LOCK TABLES `PROJECTTYPE_STATUSCOLUMN` WRITE;
/*!40000 ALTER TABLE `PROJECTTYPE_STATUSCOLUMN` DISABLE KEYS */;
INSERT INTO `PROJECTTYPE_STATUSCOLUMN` VALUES (1,1);
/*!40000 ALTER TABLE `PROJECTTYPE_STATUSCOLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQCATEGORY`
--

DROP TABLE IF EXISTS `REQCATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQCATEGORY` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `shortcut` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQCATEGORY`
--

LOCK TABLES `REQCATEGORY` WRITE;
/*!40000 ALTER TABLE `REQCATEGORY` DISABLE KEYS */;
INSERT INTO `REQCATEGORY` VALUES (1,'Secure Software Development Lifecycle Requirements','V1.1','',10000,_binary ''),(2,'Authentication Architectural Requirements','V1.2','',10010,_binary ''),(3,'Session Management Architectural Requirements','V1.3','',10020,_binary ''),(4,'Access Control Architectural Requirements','V1.4','',10030,_binary ''),(5,'Input and Output Architectural Requirements','V1.5','',10040,_binary ''),(6,'Cryptographic Architectural Requirements','V1.6','',10050,_binary ''),(7,'Errors, Logging and Auditing Architectural Requirements','V1.7','',10060,_binary ''),(8,'Data Protection and Privacy Architectural Requirements','V1.8','',10070,_binary ''),(9,'Communications Architectural Requirements','V1.9','',10080,_binary ''),(10,'Malicious Software Architectural Requirements','V1.10','',10090,_binary ''),(11,'Business Logic Architectural Requirements','V1.11','',10100,_binary ''),(12,'Secure File Upload Architectural Requirements','V1.12','',10110,_binary ''),(13,'API Architectural Requirements','V1.13','',10120,_binary ''),(14,'Configuration Architectural Requirements','V1.14','',10130,_binary ''),(15,'Password Security Requirements','V2.1','',20000,_binary ''),(16,'General Authenticator Requirements','V2.2','',20010,_binary ''),(17,'Authenticator Lifecycle Requirements','V2.3','',20020,_binary ''),(18,'Credential Storage Requirements','V2.4','',20030,_binary ''),(19,'Credential Recovery Requirements','V2.5','',20040,_binary ''),(20,'Look-up Secret Verifier Requirements','V2.6','',20050,_binary ''),(21,'Out of Band Verifier Requirements','V2.7','',20060,_binary ''),(22,'Single or Multi Factor One Time Verifier Requirements','V2.8','',20070,_binary ''),(23,'Cryptographic Software and Devices Verifier Requirements','V2.9','',20080,_binary ''),(24,'Service Authentication Requirements','V2.10','',20090,_binary ''),(25,'Fundamental Session Management Requirements','V3.1','',30000,_binary ''),(26,'Session Binding Requirements','V3.2','',30010,_binary ''),(27,'Session Logout and Timeout Requirements','V3.3','',30020,_binary ''),(28,'Cookie-based Session Management','V3.4','',30030,_binary ''),(29,'Token-based Session Management','V3.5','',30040,_binary ''),(30,'Re-authentication from a Federation or Assertion','V3.6','',30050,_binary ''),(31,'Defenses Against Session Management Exploits','V3.7','',30060,_binary ''),(32,'General Access Control Design','V4.1','',40000,_binary ''),(33,'Operation Level Access Control','V4.2','',40010,_binary ''),(34,'Other Access Control Considerations','V4.3','',40020,_binary ''),(35,'Input Validation Requirements','V5.1','',50000,_binary ''),(36,'Sanitization and Sandboxing Requirements','V5.2','',50010,_binary ''),(37,'Output Encoding and Injection Prevention Requirements','V5.3','',50020,_binary ''),(38,'Memory, String, and Unmanaged Code Requirements','V5.4','',50030,_binary ''),(39,'Deserialization Prevention Requirements','V5.5','',50040,_binary ''),(40,'Data Classification','V6.1','',60000,_binary ''),(41,'Algorithms','V6.2','',60010,_binary ''),(42,'Random Values','V6.3','',60020,_binary ''),(43,'Secret Management','V6.4','',60030,_binary ''),(44,'Log Content Requirements','V7.1','',70000,_binary ''),(45,'Log Processing Requirements','V7.2','',70010,_binary ''),(46,'Log Protection Requirements','V7.3','',70020,_binary ''),(47,'Error Handling','V7.4','',70030,_binary ''),(48,'General Data Protection','V8.1','',80000,_binary ''),(49,'Client-side Data Protection','V8.2','',80010,_binary ''),(50,'Sensitive Private Data','V8.3','',80020,_binary ''),(51,'Client Communications Security Requirements','V9.1','',90000,_binary ''),(52,'Server Communications Security Requirements','V9.2','',90010,_binary ''),(53,'Code Integrity Controls','V10.1','',100000,_binary ''),(54,'Malicious Code Search','V10.2','',100010,_binary ''),(55,'Deployed Application Integrity Controls','V10.3','',100020,_binary ''),(56,'Business Logic Security Requirements','V11.1','',110000,_binary ''),(57,'File Upload Requirements','V12.1','',120000,_binary ''),(58,'File Integrity Requirements','V12.2','',120010,_binary ''),(59,'File Execution Requirements','V12.3','',120020,_binary ''),(60,'File Storage Requirements','V12.4','',120030,_binary ''),(61,'File Download Requirements','V12.5','',120040,_binary ''),(62,'SSRF Protection Requirements','V12.6','',120050,_binary ''),(63,'Generic Web Service Security Verification Requirements','V13.1','',130000,_binary ''),(64,'RESTful Web Service Verification Requirements','V13.2','',130010,_binary ''),(65,'SOAP Web Service Verification Requirements','V13.3','',130020,_binary ''),(66,'GraphQL and other Web Service Data Layer Security Requirements','V13.4','',130030,_binary ''),(67,'Build','V14.1','',140000,_binary ''),(68,'Dependency','V14.2','',140010,_binary ''),(69,'Unintended Security Disclosure Requirements','V14.3','',140020,_binary ''),(70,'HTTP Security Headers Requirements','V14.4','',140030,_binary ''),(71,'Validate HTTP Request Header Requirements','V14.5','',140040,_binary '');
/*!40000 ALTER TABLE `REQCATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENTSKELETON`
--

DROP TABLE IF EXISTS `REQUIREMENTSKELETON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIREMENTSKELETON` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `universal_id` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `reqcategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_requirementskeleton_reqcategory_id` (`reqcategory_id`),
  CONSTRAINT `fk_requirementskeleton_reqcategory_id` FOREIGN KEY (`reqcategory_id`) REFERENCES `REQCATEGORY` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENTSKELETON`
--

LOCK TABLES `REQUIREMENTSKELETON` WRITE;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON` DISABLE KEYS */;
INSERT INTO `REQUIREMENTSKELETON` VALUES (1,NULL,'V1.1.1','Verify the use of a secure software development lifecycle that addresses security in all stages of development. ([C1](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',1),(2,NULL,'V1.1.2','Verify the use of threat modeling for every design change or sprint planning to identify threats, plan for countermeasures, facilitate appropriate risk responses, and guide security testing.',10,_binary '',1),(3,NULL,'V1.1.3','Verify that all user stories and features contain functional security constraints, such as \"As a user, I should be able to view and edit my profile. I should not be able to view or edit anyone else\'s profile\"',20,_binary '',1),(4,NULL,'V1.1.4','Verify documentation and justification of all the application\'s trust boundaries, components, and significant data flows.',30,_binary '',1),(5,NULL,'V1.1.5','Verify definition and security analysis of the application\'s high-level architecture and all connected remote services. ([C1](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',40,_binary '',1),(6,NULL,'V1.1.6','Verify implementation of centralized, simple (economy of design), vetted, secure, and reusable security controls to avoid duplicate, missing, ineffective, or insecure controls. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',50,_binary '',1),(7,NULL,'V1.1.7','Verify availability of a secure coding checklist, security requirements, guideline, or policy to all developers and testers.',60,_binary '',1),(8,NULL,'V1.2.1','Verify that communications between application components, including APIs, middleware and data layers, are authenticated and use individual user accounts. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',2),(9,NULL,'V1.2.2','Verify that the application uses a single vetted authentication mechanism that is known to be secure, can be extended to include strong authentication, and has sufficient logging and monitoring to detect account abuse or breaches.',10,_binary '',2),(10,NULL,'V1.2.3','Verify that all authentication pathways and identity management APIs implement consistent authentication security control strength, such that there are no weaker alternatives per the risk of the application.',20,_binary '',2),(11,NULL,'V1.4.1','Verify that trusted enforcement points such as at access control gateways, servers, and serverless functions enforce access controls. Never enforce access controls on the client.',0,_binary '',4),(12,NULL,'V1.4.2','Verify that the chosen access control solution is flexible enough to meet the application\'s needs. ',10,_binary '',4),(13,NULL,'V1.4.3','Verify enforcement of the principle of least privilege in functions, data files, URLs, controllers, services, and other resources. This implies protection against spoofing and elevation of privilege.',20,_binary '',4),(14,NULL,'V1.4.4','Verify that communications between application components, including APIs, middleware and data layers, are performed with the least necessary privileges. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',4),(15,NULL,'V1.4.5','Verify the application uses a single and well-vetted access control mechanism for accessing protected data and resources. All requests must pass through this single mechanism to avoid copy and paste or insecure alternative paths. ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',40,_binary '',4),(16,NULL,'V1.4.6','Verify that attribute or feature-based access control is used whereby the code checks the user\'s authorization for a feature/data item rather than just their role. Permissions should still be allocated using roles. ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',50,_binary '',4),(17,NULL,'V1.5.1','Verify that input and output requirements clearly define how to handle and process data based on type, content, and applicable laws, regulations, and other policy compliance. ',0,_binary '',5),(18,NULL,'V1.5.2','Verify that serialization is not used when communicating with untrusted clients. If this is not possible, ensure that adequate integrity controls (and possibly encryption if sensitive data is sent) are enforced to prevent deserialization attacks including object injection.',10,_binary '',5),(19,NULL,'V1.5.3','Verify that input validation is enforced on a trusted service layer. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',5),(20,NULL,'V1.5.4','Verify that output encoding occurs close to or by the interpreter for which it is intended. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',5),(21,NULL,'V1.6.1','Verify that there is an explicit policy for management of cryptographic keys and that a cryptographic key lifecycle follows a key management standard such as NIST SP 800-57.',0,_binary '',6),(22,NULL,'V1.6.2','Verify that consumers of cryptographic services protect key material and other secrets by using key vaults or API based alternatives.',10,_binary '',6),(23,NULL,'V1.6.3','Verify that all keys and passwords are replaceable and are part of a well-defined process to re-encrypt sensitive data.',20,_binary '',6),(24,NULL,'V1.6.4','Verify that symmetric keys, passwords, or API secrets generated by or shared with clients are used only in protecting low risk secrets, such as encrypting local storage, or temporary ephemeral uses such as parameter obfuscation. Sharing secrets with clients is clear-text equivalent and architecturally should be treated as such.',30,_binary '',6),(25,NULL,'V1.7.1','Verify that a common logging format and approach is used across the system.  ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',7),(26,NULL,'V1.7.2','Verify that logs are securely transmitted to a preferably remote system for analysis, detection, alerting, and escalation. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',7),(27,NULL,'V1.8.1','Verify that all sensitive data is identified and classified into protection levels.',0,_binary '',8),(28,NULL,'V1.8.2','Verify that all protection levels have an associated set of protection requirements, such as encryption requirements, integrity requirements, retention, privacy and other confidentiality requirements, and that these are applied in the architecture.',10,_binary '',8),(29,NULL,'V1.9.1','Verify the application encrypts communications between components, particularly when these components are in different containers, systems, sites, or cloud providers. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',9),(30,NULL,'V1.9.2','Verify that application components verify the authenticity of each side in a communication link to prevent person-in-the-middle attacks. For example, application components should validate TLS certificates and chains.',10,_binary '',9),(31,NULL,'V1.10.1','Verify that a source code control system is in use, with procedures to ensure that check-ins are accompanied by issues or change tickets. The source code control system should have access control and identifiable users to allow traceability of any changes.',0,_binary '',10),(32,NULL,'V1.11.1','Verify the definition and documentation of all application components in terms of the business or security functions they provide.',0,_binary '',11),(33,NULL,'V1.11.2','Verify that all high-value business logic flows, including authentication, session management and access control, do not share unsynchronized state.',10,_binary '',11),(34,NULL,'V1.11.3','Verify that all high-value business logic flows, including authentication, session management and access control are thread safe and resistant to time-of-check and time-of-use race conditions.',20,_binary '',11),(35,NULL,'V1.12.1','Verify that user-uploaded files are stored outside of the web root.',0,_binary '',12),(36,NULL,'V1.12.2','Verify that user-uploaded files - if required to be displayed or downloaded from the application - are served by either octet stream downloads, or from an unrelated domain, such as a cloud file storage bucket. Implement a suitable content security policy (CSP) to reduce the risk from XSS vectors or other attacks from the uploaded file.',10,_binary '',12),(37,NULL,'V1.14.1','Verify the use of unique or special low-privilege operating system accounts for all application components, services, and servers. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',14),(38,NULL,'V1.14.2','Verify the segregation of components of differing trust levels through well-defined security controls, firewall rules, API gateways, reverse proxies, cloud-based security groups, or similar mechanisms.',10,_binary '',14),(39,NULL,'V1.14.3','Verify that if deploying binaries to untrusted devices makes use of binary signatures, trusted connections, and verified endpoints.',20,_binary '',14),(40,NULL,'V1.14.4','Verify that the build pipeline warns of out-of-date or insecure components and takes appropriate actions.',30,_binary '',14),(41,NULL,'V1.14.5','Verify that the build pipeline contains a build step to automatically build and verify the secure deployment of the application, particularly if the application infrastructure is software defined, such as cloud environment build scripts.',40,_binary '',14),(42,NULL,'V1.14.6','Verify that application deployments adequately sandbox, containerize and/or isolate at the network level to delay and deter attackers from attacking other applications, especially when they are performing sensitive or dangerous actions such as deserialization. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',50,_binary '',14),(43,NULL,'V1.14.7','Verify the application does not use unsupported, insecure, or deprecated client-side technologies such as NSAPI plugins, Flash, Shockwave, ActiveX, Silverlight, NACL, or client-side Java applets.',60,_binary '',14),(44,NULL,'V2.1.1','Verify that user set passwords are at least 12 characters in length. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',15),(45,NULL,'V2.1.2','Verify that passwords 64 characters or longer are permitted. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',15),(46,NULL,'V2.1.3','Verify that passwords can contain spaces and truncation is not performed. Consecutive multiple spaces MAY optionally be coalesced. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',15),(47,NULL,'V2.1.4','Verify that Unicode characters are permitted in passwords. A single Unicode code point is considered a character, so 12 emoji or 64 kanji characters should be valid and permitted.',30,_binary '',15),(48,NULL,'V2.1.5','Verify users can change their password.',40,_binary '',15),(49,NULL,'V2.1.6','Verify that password change functionality requires the user\'s current and new password.',50,_binary '',15),(50,NULL,'V2.1.7','Verify that passwords submitted during account registration, login, and password change are checked against a set of breached passwords either locally (such as the top 1,000 or 10,000 most common passwords which match the system\'s password policy) or using an external API. If using an API a zero knowledge proof or other mechanism should be used to ensure that the plain text password is not sent or used in verifying the breach status of the password. If the password is breached, the application must require the user to set a new non-breached password. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',60,_binary '',15),(51,NULL,'V2.1.8','Verify that a password strength meter is provided to help users set a stronger password.',70,_binary '',15),(52,NULL,'V2.1.9','Verify that there are no password composition rules limiting the type of characters permitted. There should be no requirement for upper or lower case or numbers or special characters. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',80,_binary '',15),(53,NULL,'V2.1.10','Verify that there are no periodic credential rotation or password history requirements.',90,_binary '',15),(54,NULL,'V2.1.11','Verify that \"paste\" functionality, browser password helpers, and external password managers are permitted.',100,_binary '',15),(55,NULL,'V2.1.12','Verify that the user can choose to either temporarily view the entire masked password, or temporarily view the last typed character of the password on platforms that do not have this as native functionality.',110,_binary '',15),(56,NULL,'V2.2.1','Verify that anti-automation controls are effective at mitigating breached credential testing, brute force, and account lockout attacks. Such controls include blocking the most common breached passwords, soft lockouts, rate limiting, CAPTCHA, ever increasing delays between attempts, IP address restrictions, or risk-based restrictions such as location, first login on a device, recent attempts to unlock the account, or similar. Verify that no more than 100 failed attempts per hour is possible on a single account.',0,_binary '',16),(57,NULL,'V2.2.2','Verify that the use of weak authenticators (such as SMS and email) is limited to secondary verification and transaction approval and not as a replacement for more secure authentication methods. Verify that stronger methods are offered before weak methods, users are aware of the risks, or that proper measures are in place to limit the risks of account compromise.',10,_binary '',16),(58,NULL,'V2.2.3','Verify that secure notifications are sent to users after updates to authentication details, such as credential resets, email or address changes, logging in from unknown or risky locations. The use of push notifications - rather than SMS or email - is preferred, but in the absence of push notifications, SMS or email is acceptable as long as no sensitive information is disclosed in the notification.',20,_binary '',16),(59,NULL,'V2.2.4','Verify impersonation resistance against phishing, such as the use of multi-factor authentication, cryptographic devices with intent (such as connected keys with a push to authenticate), or at higher AAL levels, client-side certificates.',30,_binary '',16),(60,NULL,'V2.2.5','Verify that where a credential service provider (CSP) and the application verifying authentication are separated, mutually authenticated TLS is in place between the two endpoints.',40,_binary '',16),(61,NULL,'V2.2.6','Verify replay resistance through the mandated use of OTP devices, cryptographic authenticators, or lookup codes.',50,_binary '',16),(62,NULL,'V2.2.7','Verify intent to authenticate by requiring the entry of an OTP token or user-initiated action such as a button press on a FIDO hardware key.',60,_binary '',16),(63,NULL,'V2.3.1','Verify system generated initial passwords or activation codes SHOULD be securely randomly generated, SHOULD be at least 6 characters long, and MAY contain letters and numbers, and expire after a short period of time. These initial secrets must not be permitted to become the long term password.',0,_binary '',17),(64,NULL,'V2.3.2','Verify that enrollment and use of subscriber-provided authentication devices are supported, such as a U2F or FIDO tokens.',10,_binary '',17),(65,NULL,'V2.3.3','Verify that renewal instructions are sent with sufficient time to renew time bound authenticators.',20,_binary '',17),(66,NULL,'V2.4.1','Verify that passwords are stored in a form that is resistant to offline attacks. Passwords SHALL be salted and hashed using an approved one-way key derivation or password hashing function. Key derivation and password hashing functions take a password, a salt, and a cost factor as inputs when generating a password hash. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',18),(67,NULL,'V2.4.2','Verify that the salt is at least 32 bits in length and be chosen arbitrarily to minimize salt value collisions among stored hashes. For each credential, a unique salt value and the resulting hash SHALL be stored. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',18),(68,NULL,'V2.4.3','Verify that if PBKDF2 is used, the iteration count SHOULD be as large as verification server performance will allow, typically at least 100,000 iterations. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',18),(69,NULL,'V2.4.4','Verify that if bcrypt is used, the work factor SHOULD be as large as verification server performance will allow, typically at least 13. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',18),(70,NULL,'V2.4.5','Verify that an additional iteration of a key derivation function is performed, using a salt value that is secret and known only to the verifier. Generate the salt value using an approved random bit generator [SP 800-90Ar1] and provide at least the minimum security strength specified in the latest revision of SP 800-131A. The secret salt value SHALL be stored separately from the hashed passwords (e.g., in a specialized device like a hardware security module).',40,_binary '',18),(71,NULL,'V2.5.1','Verify that a system generated initial activation or recovery secret is not sent in clear text to the user. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',19),(72,NULL,'V2.5.2','Verify password hints or knowledge-based authentication (so-called \"secret questions\") are not present.',10,_binary '',19),(73,NULL,'V2.5.3','Verify password credential recovery does not reveal the current password in any way. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',19),(74,NULL,'V2.5.4','Verify shared or default accounts are not present (e.g. \"root\", \"admin\", or \"sa\").',30,_binary '',19),(75,NULL,'V2.5.5','Verify that if an authentication factor is changed or replaced, that the user is notified of this event.',40,_binary '',19),(76,NULL,'V2.5.6','Verify forgotten password, and other recovery paths use a secure recovery mechanism, such as TOTP or other soft token, mobile push, or another offline recovery mechanism. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',50,_binary '',19),(77,NULL,'V2.5.7','Verify that if OTP or multi-factor authentication factors are lost, that evidence of identity proofing is performed at the same level as during enrollment.',60,_binary '',19),(78,NULL,'V2.6.1','Verify that lookup secrets can be used only once.',0,_binary '',20),(79,NULL,'V2.6.2','Verify that lookup secrets have sufficient randomness (112 bits of entropy), or if less than 112 bits of entropy, salted with a unique and random 32-bit salt and hashed with an approved one-way hash.',10,_binary '',20),(80,NULL,'V2.6.3','Verify that lookup secrets are resistant to offline attacks, such as predictable values.',20,_binary '',20),(81,NULL,'V2.7.1','Verify that clear text out of band (NIST \"restricted\") authenticators, such as SMS or PSTN, are not offered by default, and stronger alternatives such as push notifications are offered first.',0,_binary '',21),(82,NULL,'V2.7.2','Verify that the out of band verifier expires out of band authentication requests, codes, or tokens after 10 minutes.',10,_binary '',21),(83,NULL,'V2.7.3','Verify that the out of band verifier authentication requests, codes, or tokens are only usable once, and only for the original authentication request.',20,_binary '',21),(84,NULL,'V2.7.4','Verify that the out of band authenticator and verifier communicates over a secure independent channel.',30,_binary '',21),(85,NULL,'V2.7.5','Verify that the out of band verifier retains only a hashed version of the authentication code.',40,_binary '',21),(86,NULL,'V2.7.6','Verify that the initial authentication code is generated by a secure random number generator, containing at least 20 bits of entropy (typically a six digital random number is sufficient).',50,_binary '',21),(87,NULL,'V2.8.1','Verify that time-based OTPs have a defined lifetime before expiring.',0,_binary '',22),(88,NULL,'V2.8.2','Verify that symmetric keys used to verify submitted OTPs are highly protected, such as by using a hardware security module or secure operating system based key storage.',10,_binary '',22),(89,NULL,'V2.8.3','Verify that approved cryptographic algorithms are used in the generation, seeding, and verification.',20,_binary '',22),(90,NULL,'V2.8.4','Verify that time-based OTP can be used only once within the validity period.',30,_binary '',22),(91,NULL,'V2.8.5','Verify that if a time-based multi factor OTP token is re-used during the validity period, it is logged and rejected with secure notifications being sent to the holder of the device.',40,_binary '',22),(92,NULL,'V2.8.6','Verify physical single factor OTP generator can be revoked in case of theft or other loss. Ensure that revocation is immediately effective across logged in sessions, regardless of location.',50,_binary '',22),(93,NULL,'V2.8.7','Verify that biometric authenticators are limited to use only as secondary factors in conjunction with either something you have and something you know.',60,_binary '',22),(94,NULL,'V2.9.1','Verify that cryptographic keys used in verification are stored securely and protected against disclosure, such as using a TPM or HSM, or an OS service that can use this secure storage.',0,_binary '',23),(95,NULL,'V2.9.2','Verify that the challenge nonce is at least 64 bits in length, and statistically unique or unique over the lifetime of the cryptographic device.',10,_binary '',23),(96,NULL,'V2.9.3','Verify that approved cryptographic algorithms are used in the generation, seeding, and verification.',20,_binary '',23),(97,NULL,'V2.10.1','Verify that integration secrets do not rely on unchanging passwords, such as API keys or shared privileged accounts.',0,_binary '',24),(98,NULL,'V2.10.2','Verify that if passwords are required, the credentials are not a default account.',10,_binary '',24),(99,NULL,'V2.10.3','Verify that passwords are stored with sufficient protection to prevent offline recovery attacks, including local system access.',20,_binary '',24),(100,NULL,'V2.10.4','Verify passwords, integrations with databases and third-party systems, seeds and internal secrets, and API keys are managed securely and not included in the source code or stored within source code repositories. Such storage SHOULD resist offline attacks. The use of a secure software key store (L1), hardware trusted platform module (TPM), or a hardware security module (L3) is recommended for password storage.',30,_binary '',24),(101,NULL,'V3.1.1','Verify the application never reveals session tokens in URL parameters or error messages. ',0,_binary '',25),(102,NULL,'V3.2.1','Verify the application generates a new session token on user authentication. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',26),(103,NULL,'V3.2.2','Verify that session tokens possess at least 64 bits of entropy. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',26),(104,NULL,'V3.2.3','Verify the application only stores session tokens in the browser using secure methods such as appropriately secured cookies (see section 3.4) or HTML 5 session storage.',20,_binary '',26),(105,NULL,'V3.2.4','Verify that session token are generated using approved cryptographic algorithms. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',26),(106,NULL,'V3.3.1','Verify that logout and expiration invalidate the session token, such that the back button or a downstream relying party does not resume an authenticated session, including across relying parties. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',27),(107,NULL,'V3.3.2','If authenticators permit users to remain logged in, verify that re-authentication occurs periodically both when actively used or after an idle period. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',27),(108,NULL,'V3.3.3','Verify that the application terminates all other active sessions after a successful password change, and that this is effective across the application, federated login (if present), and any relying parties.',20,_binary '',27),(109,NULL,'V3.3.4','Verify that users are able to view and log out of any or all currently active sessions and devices.',30,_binary '',27),(110,NULL,'V3.4.1','Verify that cookie-based session tokens have the \'Secure\' attribute set. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',28),(111,NULL,'V3.4.2','Verify that cookie-based session tokens have the \'HttpOnly\' attribute set. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',28),(112,NULL,'V3.4.3','Verify that cookie-based session tokens utilize the \'SameSite\' attribute to limit exposure to cross-site request forgery attacks. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',28),(113,NULL,'V3.4.4','Verify that cookie-based session tokens use \"__Host-\" prefix (see references) to provide session cookie confidentiality.',30,_binary '',28),(114,NULL,'V3.4.5','Verify that if the application is published under a domain name with other applications that set or use session cookies that might override or disclose the session cookies, set the path attribute in cookie-based session tokens using the most precise path possible. ([C6](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',40,_binary '',28),(115,NULL,'V3.5.1','Verify the application does not treat OAuth and refresh tokens &mdash; on their own &mdash; as the presence of the subscriber and allows users to terminate trust relationships with linked applications. ',0,_binary '',29),(116,NULL,'V3.5.2','Verify the application uses session tokens rather than static API secrets and keys, except with legacy implementations.',10,_binary '',29),(117,NULL,'V3.5.3','Verify that stateless session tokens use digital signatures, encryption, and other countermeasures to protect against tampering, enveloping, replay, null cipher, and key substitution attacks.',20,_binary '',29),(118,NULL,'V3.6.1','Verify that relying parties specify the maximum authentication time to credential service providers (CSPs) and that CSPs re-authenticate the subscriber if they haven\'t used a session within that period.',0,_binary '',30),(119,NULL,'V3.6.2','Verify that credential service providers (CSPs) inform relying parties of the last authentication event, to allow RPs to determine if they need to re-authenticate the user.',10,_binary '',30),(120,NULL,'V3.7.1','Verify the application ensures a valid login session or requires re-authentication or secondary verification before allowing any sensitive transactions or account modifications.',0,_binary '',31),(121,NULL,'V4.1.1','Verify that the application enforces access control rules on a trusted service layer, especially if client-side access control is present and could be bypassed.',0,_binary '',32),(122,NULL,'V4.1.2','Verify that all user and data attributes and policy information used by access controls cannot be manipulated by end users unless specifically authorized.',10,_binary '',32),(123,NULL,'V4.1.3','Verify that the principle of least privilege exists - users should only be able to access functions, data files, URLs, controllers, services, and other resources, for which they possess specific authorization. This implies protection against spoofing and elevation of privilege. ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',32),(124,NULL,'V4.1.4','Verify that the principle of deny by default exists whereby new users/roles start with minimal or no permissions and users/roles do not receive access to new features until access is explicitly assigned.  ([C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',32),(125,NULL,'V4.1.5','Verify that access controls fail securely including when an exception occurs. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',40,_binary '',32),(126,NULL,'V4.2.1','Verify that sensitive data and APIs are protected against direct object attacks targeting creation, reading, updating and deletion of records, such as creating or updating someone else\'s record, viewing everyone\'s records, or deleting all records.',0,_binary '',33),(127,NULL,'V4.2.2','Verify that the application or framework enforces a strong anti-CSRF mechanism to protect authenticated functionality, and effective anti-automation or anti-CSRF protects unauthenticated functionality.',10,_binary '',33),(128,NULL,'V4.3.1','Verify administrative interfaces use appropriate multi-factor authentication to prevent unauthorized use.',0,_binary '',34),(129,NULL,'V4.3.2','Verify that directory browsing is disabled unless deliberately desired. Additionally, applications should not allow discovery or disclosure of file or directory metadata, such as Thumbs.db, .DS_Store, .git or .svn folders.',10,_binary '',34),(130,NULL,'V4.3.3','Verify the application has additional authorization (such as step up or adaptive authentication) for lower value systems, and / or segregation of duties for high value applications to enforce anti-fraud controls as per the risk of application and past fraud.',20,_binary '',34),(131,NULL,'V5.1.1','Verify that the application has defenses against HTTP parameter pollution attacks, particularly if the application framework makes no distinction about the source of request parameters (GET, POST, cookies, headers, or environment variables).',0,_binary '',35),(132,NULL,'V5.1.2','Verify that frameworks protect against mass parameter assignment attacks, or that the application has countermeasures to protect against unsafe parameter assignment, such as marking fields private or similar. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',35),(133,NULL,'V5.1.3','Verify that all input (HTML form fields, REST requests, URL parameters, HTTP headers, cookies, batch files, RSS feeds, etc) is validated using positive validation (whitelisting). ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',35),(134,NULL,'V5.1.4','Verify that structured data is strongly typed and validated against a defined schema including allowed characters, length and pattern (e.g. credit card numbers or telephone, or validating that two related fields are reasonable, such as checking that suburb and zip/postcode match). ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',35),(135,NULL,'V5.1.5','Verify that URL redirects and forwards only allow whitelisted destinations, or show a warning when redirecting to potentially untrusted content.',40,_binary '',35),(136,NULL,'V5.2.1','Verify that all untrusted HTML input from WYSIWYG editors or similar is properly sanitized with an HTML sanitizer library or framework feature. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',36),(137,NULL,'V5.2.2','Verify that unstructured data is sanitized to enforce safety measures such as allowed characters and length.',10,_binary '',36),(138,NULL,'V5.2.3','Verify that the application sanitizes user input before passing to mail systems to protect against SMTP or IMAP injection.',20,_binary '',36),(139,NULL,'V5.2.4','Verify that the application avoids the use of eval() or other dynamic code execution features. Where there is no alternative, any user input being included must be sanitized or sandboxed before being executed.',30,_binary '',36),(140,NULL,'V5.2.5','Verify that the application protects against template injection attacks by ensuring that any user input being included is sanitized or sandboxed.',40,_binary '',36),(141,NULL,'V5.2.6','Verify that the application protects against SSRF attacks, by validating or sanitizing untrusted data or HTTP file metadata, such as filenames and URL input fields, use whitelisting of protocols, domains, paths and ports.',50,_binary '',36),(142,NULL,'V5.2.7','Verify that the application sanitizes, disables, or sandboxes user-supplied Scalable Vector Graphics (SVG) scriptable content, especially as they relate to XSS resulting from inline scripts, and foreignObject.',60,_binary '',36),(143,NULL,'V5.2.8','Verify that the application sanitizes, disables, or sandboxes user-supplied scriptable or expression template language content, such as Markdown, CSS or XSL stylesheets, BBCode, or similar.',70,_binary '',36),(144,NULL,'V5.3.1','Verify that output encoding is relevant for the interpreter and context required. For example, use encoders specifically for HTML values, HTML attributes, JavaScript, URL Parameters, HTTP headers, SMTP, and others as the context requires, especially from untrusted inputs (e.g. names with Unicode or apostrophes, such as \\u306d\\u3053 or O\'Hara). ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',37),(145,NULL,'V5.3.2','Verify that output encoding preserves the user\'s chosen character set and locale, such that any Unicode character point is valid and safely handled. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',37),(146,NULL,'V5.3.3','Verify that context-aware, preferably automated - or at worst, manual - output escaping protects against reflected, stored, and DOM based XSS. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',37),(147,NULL,'V5.3.4','Verify that data selection or database queries (e.g. SQL, HQL, ORM, NoSQL) use parameterized queries, ORMs, entity frameworks, or are otherwise protected from database injection attacks. ([C3](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',37),(148,NULL,'V5.3.5','Verify that where parameterized or safer mechanisms are not present, context-specific output encoding is used to protect against injection attacks, such as the use of SQL escaping to protect against SQL injection. ([C3, C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',40,_binary '',37),(149,NULL,'V5.3.6','Verify that the application protects against JavaScript or JSON injection attacks, including for eval attacks, remote JavaScript includes, content security policy (CSP) bypasses, DOM XSS, and JavaScript expression evaluation. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',50,_binary '',37),(150,NULL,'V5.3.7','Verify that the application protects against LDAP Injection vulnerabilities, or that specific security controls to prevent LDAP Injection have been implemented. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',60,_binary '',37),(151,NULL,'V5.3.8','Verify that the application protects against OS command injection and that operating system calls use parameterized OS queries or use contextual command line output encoding. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',70,_binary '',37),(152,NULL,'V5.3.9','Verify that the application protects against Local File Inclusion (LFI) or Remote File Inclusion (RFI) attacks.',80,_binary '',37),(153,NULL,'V5.3.10','Verify that the application protects against XPath injection or XML injection attacks. ([C4](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',90,_binary '',37),(154,NULL,'V5.4.1','Verify that the application uses memory-safe string, safer memory copy and pointer arithmetic to detect or prevent stack, buffer, or heap overflows.',0,_binary '',38),(155,NULL,'V5.4.2','Verify that format strings do not take potentially hostile input, and are constant.',10,_binary '',38),(156,NULL,'V5.4.3','Verify that sign, range, and input validation techniques are used to prevent integer overflows.',20,_binary '',38),(157,NULL,'V5.5.1','Verify that serialized objects use integrity checks or are encrypted to prevent hostile object creation or data tampering. ([C5](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',39),(158,NULL,'V5.5.2','Verify that the application correctly restricts XML parsers to only use the most restrictive configuration possible and to ensure that unsafe features such as resolving external entities are disabled to prevent XXE. ',10,_binary '',39),(159,NULL,'V5.5.3','Verify that deserialization of untrusted data is avoided or is protected in both custom code and third-party libraries (such as JSON, XML and YAML parsers). ',20,_binary '',39),(160,NULL,'V5.5.4','Verify that when parsing JSON in browsers or JavaScript-based backends, JSON.parse is used to parse the JSON document. Do not use eval() to parse JSON.',30,_binary '',39),(161,NULL,'V6.1.1','Verify that regulated private data is stored encrypted while at rest, such as personally identifiable information (PII), sensitive personal information, or data assessed likely to be subject to EU\'s GDPR.',0,_binary '',40),(162,NULL,'V6.1.2','Verify that regulated health data is stored encrypted while at rest, such as medical records, medical device details, or de-anonymized research records.',10,_binary '',40),(163,NULL,'V6.1.3','Verify that regulated financial data is stored encrypted while at rest, such as financial accounts, defaults or credit history, tax records, pay history, beneficiaries, or de-anonymized market or research records.',20,_binary '',40),(164,NULL,'V6.2.1','Verify that all cryptographic modules fail securely, and errors are handled in a way that does not enable Padding Oracle attacks.',0,_binary '',41),(165,NULL,'V6.2.2','Verify that industry proven or government approved cryptographic algorithms, modes, and libraries are used, instead of custom coded cryptography. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',41),(166,NULL,'V6.2.3','Verify that encryption initialization vector, cipher configuration, and block modes are configured securely using the latest advice.',20,_binary '',41),(167,NULL,'V6.2.4','Verify that random number, encryption or hashing algorithms, key lengths, rounds, ciphers or modes, can be reconfigured, upgraded, or swapped at any time, to protect against cryptographic breaks. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',41),(168,NULL,'V6.2.5','Verify that known insecure block modes (i.e. ECB, etc.), padding modes (i.e. PKCS#1 v1.5, etc.), ciphers with small block sizes (i.e. Triple-DES, Blowfish, etc.), and weak hashing algorithms (i.e. MD5, SHA1, etc.) are not used unless required for backwards compatibility.',40,_binary '',41),(169,NULL,'V6.2.6','Verify that nonces, initialization vectors, and other single use numbers must not be used more than once with a given encryption key. The method of generation must be appropriate for the algorithm being used.',50,_binary '',41),(170,NULL,'V6.2.7','Verify that encrypted data is authenticated via signatures, authenticated cipher modes, or HMAC to ensure that ciphertext is not altered by an unauthorized party.',60,_binary '',41),(171,NULL,'V6.2.8','Verify that all cryptographic operations are constant-time, with no \'short-circuit\' operations in comparisons, calculations, or returns, to avoid leaking information.',70,_binary '',41),(172,NULL,'V6.3.1','Verify that all random numbers, random file names, random GUIDs, and random strings are generated using the cryptographic module\'s approved cryptographically secure random number generator when these random values are intended to be not guessable by an attacker.',0,_binary '',42),(173,NULL,'V6.3.2','Verify that random GUIDs are created using the GUID v4 algorithm, and a cryptographically-secure pseudo-random number generator (CSPRNG). GUIDs created using other pseudo-random number generators may be predictable.',10,_binary '',42),(174,NULL,'V6.3.3','Verify that random numbers are created with proper entropy even when the application is under heavy load, or that the application degrades gracefully in such circumstances.',20,_binary '',42),(175,NULL,'V6.4.1','Verify that a secrets management solution such as a key vault is used to securely create, store, control access to and destroy secrets. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',43),(176,NULL,'V6.4.2','Verify that key material is not exposed to the application but instead uses an isolated security module like a vault for cryptographic operations. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',43),(177,NULL,'V7.1.1','Verify that the application does not log credentials or payment details. Session tokens should only be stored in logs in an irreversible, hashed form. ([C9, C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',44),(178,NULL,'V7.1.2','Verify that the application does not log other sensitive data as defined under local privacy laws or relevant security policy. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',44),(179,NULL,'V7.1.3','Verify that the application logs security relevant events including successful and failed authentication events, access control failures, deserialization failures and input validation failures. ([C5, C7](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',44),(180,NULL,'V7.1.4','Verify that each log event includes necessary information that would allow for a detailed investigation of the timeline when an event happens. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',44),(181,NULL,'V7.2.1','Verify that all authentication decisions are logged, without storing sensitive session identifiers or passwords. This should include requests with relevant metadata needed for security investigations. ',0,_binary '',45),(182,NULL,'V7.2.2','Verify that all access control decisions can be logged and all failed decisions are logged. This should include requests with relevant metadata needed for security investigations.',10,_binary '',45),(183,NULL,'V7.3.1','Verify that the application appropriately encodes user-supplied data to prevent log injection. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',46),(184,NULL,'V7.3.2','Verify that all events are protected from injection when viewed in log viewing software. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',46),(185,NULL,'V7.3.3','Verify that security logs are protected from unauthorized access and modification. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',46),(186,NULL,'V7.3.4','Verify that time sources are synchronized to the correct time and time zone. Strongly consider logging only in UTC if systems are global to assist with post-incident forensic analysis. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',46),(187,NULL,'V7.4.1','Verify that a generic message is shown when an unexpected or security sensitive error occurs, potentially with a unique ID which support personnel can use to investigate.  ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',47),(188,NULL,'V7.4.2','Verify that exception handling (or a functional equivalent) is used across the codebase to account for expected and unexpected error conditions. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',10,_binary '',47),(189,NULL,'V7.4.3','Verify that a \"last resort\" error handler is defined which will catch all unhandled exceptions. ([C10](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',20,_binary '',47),(190,NULL,'V8.1.1','Verify the application protects sensitive data from being cached in server components such as load balancers and application caches.',0,_binary '',48),(191,NULL,'V8.1.2','Verify that all cached or temporary copies of sensitive data stored on the server are protected from unauthorized access or purged/invalidated after the authorized user accesses the sensitive data.',10,_binary '',48),(192,NULL,'V8.1.3','Verify the application minimizes the number of parameters in a request, such as hidden fields, Ajax variables, cookies and header values.',20,_binary '',48),(193,NULL,'V8.1.4','Verify the application can detect and alert on abnormal numbers of requests, such as by IP, user, total per hour or day, or whatever makes sense for the application.',30,_binary '',48),(194,NULL,'V8.1.5','Verify that regular backups of important data are performed and that test restoration of data is performed.',40,_binary '',48),(195,NULL,'V8.1.6','Verify that backups are stored securely to prevent data from being stolen or corrupted.',50,_binary '',48),(196,NULL,'V8.2.1','Verify the application sets sufficient anti-caching headers so that sensitive data is not cached in modern browsers.',0,_binary '',49),(197,NULL,'V8.2.2','Verify that data stored in client side storage (such as HTML5 local storage, session storage, IndexedDB, regular cookies or Flash cookies) does not contain sensitive data or PII.',10,_binary '',49),(198,NULL,'V8.2.3','Verify that authenticated data is cleared from client storage, such as the browser DOM, after the client or session is terminated.',20,_binary '',49),(199,NULL,'V8.3.1','Verify that sensitive data is sent to the server in the HTTP message body or headers, and that query string parameters from any HTTP verb do not contain sensitive data.',0,_binary '',50),(200,NULL,'V8.3.2','Verify that users have a method to remove or export their data on demand.',10,_binary '',50),(201,NULL,'V8.3.3','Verify that users are provided clear language regarding collection and use of supplied personal information and that users have provided opt-in consent for the use of that data before it is used in any way.',20,_binary '',50),(202,NULL,'V8.3.4','Verify that all sensitive data created and processed by the application has been identified, and ensure that a policy is in place on how to deal with sensitive data. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',50),(203,NULL,'V8.3.5','Verify accessing sensitive data is audited (without logging the sensitive data itself), if the data is collected under relevant data protection directives or where logging of access is required.',40,_binary '',50),(204,NULL,'V8.3.6','Verify that sensitive information contained in memory is overwritten as soon as it is no longer required to mitigate memory dumping attacks, using zeroes or random data.',50,_binary '',50),(205,NULL,'V8.3.7','Verify that sensitive or private information that is required to be encrypted, is encrypted using approved algorithms that provide both confidentiality and integrity. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',60,_binary '',50),(206,NULL,'V8.3.8','Verify that sensitive personal information is subject to data retention classification, such that old or out of date data is deleted automatically, on a schedule, or as the situation requires.',70,_binary '',50),(207,NULL,'V9.1.1','Verify that secured TLS is used for all client connectivity, and does not fall back to insecure or unencrypted protocols. ([C8](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',51),(208,NULL,'V9.1.2','Verify using online or up to date TLS testing tools that only strong algorithms, ciphers, and protocols are enabled, with the strongest algorithms and ciphers set as preferred.',10,_binary '',51),(209,NULL,'V9.1.3','Verify that old versions of SSL and TLS protocols, algorithms, ciphers, and configuration are disabled, such as SSLv2, SSLv3, or TLS 1.0 and TLS 1.1. The latest version of TLS should be the preferred cipher suite.',20,_binary '',51),(210,NULL,'V9.2.1','Verify that connections to and from the server use trusted TLS certificates. Where internally generated or self-signed certificates are used, the server must be configured to only trust specific internal CAs and specific self-signed certificates. All others should be rejected.',0,_binary '',52),(211,NULL,'V9.2.2','Verify that encrypted communications such as TLS is used for all inbound and outbound connections, including for management ports, monitoring, authentication, API, or web service calls, database, cloud, serverless, mainframe, external, and partner connections. The server must not fall back to insecure or unencrypted protocols.',10,_binary '',52),(212,NULL,'V9.2.3','Verify that all encrypted connections to external systems that involve sensitive information or functions are authenticated.',20,_binary '',52),(213,NULL,'V9.2.4','Verify that proper certification revocation, such as Online Certificate Status Protocol (OCSP) Stapling, is enabled and configured.',30,_binary '',52),(214,NULL,'V9.2.5','Verify that backend TLS connection failures are logged.',40,_binary '',52),(215,NULL,'V10.1.1','Verify that a code analysis tool is in use that can detect potentially malicious code, such as time functions, unsafe file operations and network connections.',0,_binary '',53),(216,NULL,'V10.2.1','Verify that the application source code and third party libraries do not contain unauthorized phone home or data collection capabilities. Where such functionality exists, obtain the user\'s permission for it to operate  before collecting any data.',0,_binary '',54),(217,NULL,'V10.2.2','Verify that the application does not ask for unnecessary or excessive permissions to privacy related features or sensors, such as contacts, cameras, microphones, or location.',10,_binary '',54),(218,NULL,'V10.2.3','Verify that the application source code and third party libraries do not contain back doors, such as hard-coded or additional undocumented accounts or keys, code obfuscation, undocumented binary blobs, rootkits, or anti-debugging, insecure debugging features, or otherwise out of date, insecure, or hidden functionality that could be used maliciously if discovered.',20,_binary '',54),(219,NULL,'V10.2.4','Verify that the application source code and third party libraries do not contain time bombs by searching for date and time related functions.',30,_binary '',54),(220,NULL,'V10.2.5','Verify that the application source code and third party libraries do not contain malicious code, such as salami attacks, logic bypasses, or logic bombs.',40,_binary '',54),(221,NULL,'V10.2.6','Verify that the application source code and third party libraries do not contain Easter eggs or any other potentially unwanted functionality.',50,_binary '',54),(222,NULL,'V10.3.1','Verify that if the application has a client or server auto-update feature, updates should be obtained over secure channels and digitally signed. The update code must validate the digital signature of the update before installing or executing the update.',0,_binary '',55),(223,NULL,'V10.3.2','Verify that the application employs integrity protections, such as code signing or sub-resource integrity. The application must not load or execute code from untrusted sources, such as loading includes, modules, plugins, code, or libraries from untrusted sources or the Internet.',10,_binary '',55),(224,NULL,'V10.3.3','Verify that the application has protection from sub-domain takeovers if the application relies upon DNS entries or DNS sub-domains, such as expired domain names, out of date DNS pointers or CNAMEs, expired projects at public source code repos, or transient cloud APIs, serverless functions, or storage buckets (*autogen-bucket-id*.cloud.example.com) or similar. Protections can include ensuring that DNS names used by applications are regularly checked for expiry or change.',20,_binary '',55),(225,NULL,'V11.1.1','Verify the application will only process business logic flows for the same user in sequential step order and without skipping steps.',0,_binary '',56),(226,NULL,'V11.1.2','Verify the application will only process business logic flows with all steps being processed in realistic human time, i.e. transactions are not submitted too quickly.',10,_binary '',56),(227,NULL,'V11.1.3','Verify the application has appropriate limits for specific business actions or transactions which are correctly enforced on a per user basis.',20,_binary '',56),(228,NULL,'V11.1.4','Verify the application has sufficient anti-automation controls to detect and protect against data exfiltration, excessive business logic requests, excessive file uploads or denial of service attacks.',30,_binary '',56),(229,NULL,'V11.1.5','Verify the application has business logic limits or validation to protect against likely business risks or threats, identified using threat modeling or similar methodologies.',40,_binary '',56),(230,NULL,'V11.1.6','Verify the application does not suffer from \"time of check to time of use\" (TOCTOU) issues or other race conditions for sensitive operations.',50,_binary '',56),(231,NULL,'V11.1.7','Verify the application monitors for unusual events or activity from a business logic perspective. For example, attempts to perform actions out of order or actions which a normal user would never attempt. ([C9](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',60,_binary '',56),(232,NULL,'V11.1.8','Verify the application has configurable alerting when automated attacks or unusual activity is detected.',70,_binary '',56),(233,NULL,'V12.1.1','Verify that the application will not accept large files that could fill up storage or cause a denial of service.',0,_binary '',57),(234,NULL,'V12.1.2','Verify that compressed files are checked for \"zip bombs\" - small input files that will decompress into huge files thus exhausting file storage limits.',10,_binary '',57),(235,NULL,'V12.1.3','Verify that a file size quota and maximum number of files per user is enforced to ensure that a single user cannot fill up the storage with too many files, or excessively large files.',20,_binary '',57),(236,NULL,'V12.2.1','Verify that files obtained from untrusted sources are validated to be of expected type based on the file\'s content.',0,_binary '',58),(237,NULL,'V12.3.1','Verify that user-submitted filename metadata is not used directly by system or framework filesystems and that a URL API is used to protect against path traversal.',0,_binary '',59),(238,NULL,'V12.3.2','Verify that user-submitted filename metadata is validated or ignored to prevent the disclosure, creation, updating or removal of local files (LFI).',10,_binary '',59),(239,NULL,'V12.3.3','Verify that user-submitted filename metadata is validated or ignored to prevent the disclosure or execution of remote files (RFI), which may also lead to SSRF. ',20,_binary '',59),(240,NULL,'V12.3.4','Verify that the application protects against reflective file download (RFD) by validating or ignoring user-submitted filenames in a JSON, JSONP, or URL parameter, the response Content-Type header should be set to text/plain, and the Content-Disposition header should have a fixed filename.',30,_binary '',59),(241,NULL,'V12.3.5','Verify that untrusted file metadata is not used directly with system API or libraries, to protect against OS command injection.',40,_binary '',59),(242,NULL,'V12.3.6','Verify that the application does not include and execute functionality from untrusted sources, such as unverified content distribution networks, JavaScript libraries, node npm libraries, or server-side DLLs.',50,_binary '',59),(243,NULL,'V12.4.1','Verify that files obtained from untrusted sources are stored outside the web root, with limited permissions, preferably with strong validation.',0,_binary '',60),(244,NULL,'V12.4.2','Verify that files obtained from untrusted sources are scanned by antivirus scanners to prevent upload of known malicious content.',10,_binary '',60),(245,NULL,'V12.5.1','Verify that the web tier is configured to serve only files with specific file extensions to prevent unintentional information and source code leakage. For example, backup files (e.g. .bak), temporary working files (e.g. .swp), compressed files (.zip, .tar.gz, etc) and other extensions commonly used by editors should be blocked unless required.',0,_binary '',61),(246,NULL,'V12.5.2','Verify that direct requests to uploaded files will never be executed as HTML/JavaScript content.',10,_binary '',61),(247,NULL,'V12.6.1','Verify that the web or application server is configured with a whitelist of resources or systems to which the server can send requests or load data/files from.',0,_binary '',62),(248,NULL,'V13.1.1','Verify that all application components use the same encodings and parsers to avoid parsing attacks that exploit different URI or file parsing behavior that could be used in SSRF and RFI attacks.',0,_binary '',63),(249,NULL,'V13.1.2','Verify that access to administration and management functions is limited to authorized administrators.',10,_binary '',63),(250,NULL,'V13.1.3','Verify API URLs do not expose sensitive information, such as the API key, session tokens etc.',20,_binary '',63),(251,NULL,'V13.1.4','Verify that authorization decisions are made at both the URI, enforced by programmatic or declarative security at the controller or router, and at the resource level, enforced by model-based permissions.',30,_binary '',63),(252,NULL,'V13.1.5','Verify that requests containing unexpected or missing content types are rejected with appropriate headers (HTTP response status 406 Unacceptable or 415 Unsupported Media Type).',40,_binary '',63),(253,NULL,'V13.2.1','Verify that enabled RESTful HTTP methods are a valid choice for the user or action, such as preventing normal users using DELETE or PUT on protected API or resources.',0,_binary '',64),(254,NULL,'V13.2.2','Verify that JSON schema validation is in place and verified before accepting input.',10,_binary '',64),(255,NULL,'V13.2.3','Verify that RESTful web services that utilize cookies are protected from Cross-Site Request Forgery via the use of at least one or more of the following: triple or double submit cookie pattern (see [references](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet)), CSRF nonces, or ORIGIN request header checks.',20,_binary '',64),(256,NULL,'V13.2.4','Verify that REST services have anti-automation controls to protect against excessive calls, especially if the API is unauthenticated.',30,_binary '',64),(257,NULL,'V13.2.5','Verify that REST services explicitly check the incoming Content-Type to be the expected one, such as application/xml or application/JSON.',40,_binary '',64),(258,NULL,'V13.2.6','Verify that the message headers and payload are trustworthy and not modified in transit. Requiring strong encryption for transport (TLS only) may be sufficient in many cases as it provides both confidentiality and integrity protection. Per-message digital signatures can provide additional assurance on top of the transport protections for high-security applications but bring with them additional complexity and risks to weigh against the benefits.',50,_binary '',64),(259,NULL,'V13.3.1','Verify that XSD schema validation takes place to ensure a properly formed XML document, followed by validation of each input field before any processing of that data takes place.',0,_binary '',65),(260,NULL,'V13.3.2','Verify that the message payload is signed using WS-Security to ensure reliable transport between client and service.',10,_binary '',65),(261,NULL,'V13.4.1','Verify that query whitelisting or a combination of depth limiting and amount limiting should be used to prevent GraphQL or data layer expression denial of service (DoS) as a result of expensive, nested queries. For more advanced scenarios, query cost analysis should be used.',0,_binary '',66),(262,NULL,'V13.4.2','Verify that GraphQL or other data layer authorization logic should be implemented at the business logic layer instead of the GraphQL layer.',10,_binary '',66),(263,NULL,'V14.1.1','Verify that the application build and deployment processes are performed in a secure and repeatable way, such as CI / CD automation, automated configuration management, and automated deployment scripts.',0,_binary '',67),(264,NULL,'V14.1.2','Verify that compiler flags are configured to enable all available buffer overflow protections and warnings, including stack randomization, data execution prevention, and to break the build if an unsafe pointer, memory, format string, integer, or string operations are found.',10,_binary '',67),(265,NULL,'V14.1.3','Verify that server configuration is hardened as per the recommendations of the application server and frameworks in use.',20,_binary '',67),(266,NULL,'V14.1.4','Verify that the application, configuration, and all dependencies can be re-deployed using automated deployment scripts, built from a documented and tested runbook in a reasonable time, or restored from backups in a timely fashion.',30,_binary '',67),(267,NULL,'V14.1.5','Verify that authorized administrators can verify the integrity of all security-relevant configurations to detect tampering.',40,_binary '',67),(268,NULL,'V14.2.1','Verify that all components are up to date, preferably using a dependency checker during build or compile time. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',0,_binary '',68),(269,NULL,'V14.2.2','Verify that all unneeded features, documentation, samples, configurations are removed, such as sample applications, platform documentation, and default or example users.',10,_binary '',68),(270,NULL,'V14.2.3','Verify that if application assets, such as JavaScript libraries, CSS stylesheets or web fonts, are hosted externally on a content delivery network (CDN) or external provider, Subresource Integrity (SRI) is used to validate the integrity of the asset.',20,_binary '',68),(271,NULL,'V14.2.4','Verify that third party components come from pre-defined, trusted and continually maintained repositories. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',30,_binary '',68),(272,NULL,'V14.2.5','Verify that an inventory catalog is maintained of all third party libraries in use. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',40,_binary '',68),(273,NULL,'V14.2.6','Verify that the attack surface is reduced by sandboxing or encapsulating third party libraries to expose only the required behaviour into the application. ([C2](https://www.owasp.org/index.php/OWASP_Proactive_Controls#tab=Formal_Numbering))',50,_binary '',68),(274,NULL,'V14.3.1','Verify that web or application server and framework error messages are configured to deliver user actionable, customized responses to eliminate any unintended security disclosures.',0,_binary '',69),(275,NULL,'V14.3.2','Verify that web or application server and application framework debug modes are disabled in production to eliminate debug features, developer consoles, and unintended security disclosures.',10,_binary '',69),(276,NULL,'V14.3.3','Verify that the HTTP headers or any part of the HTTP response do not expose detailed version information of system components.',20,_binary '',69),(277,NULL,'V14.4.1','Verify that every HTTP response contains a content type header specifying a safe character set (e.g., UTF-8, ISO 8859-1).',0,_binary '',70),(278,NULL,'V14.4.2','Verify that all API responses contain Content-Disposition: attachment; filename=\"api.json\" (or other appropriate filename for the content type).',10,_binary '',70),(279,NULL,'V14.4.3','Verify that a content security policy (CSP) is in place that helps mitigate impact for XSS attacks like HTML, DOM, JSON, and JavaScript injection vulnerabilities.',20,_binary '',70),(280,NULL,'V14.4.4','Verify that all responses contain X-Content-Type-Options: nosniff.',30,_binary '',70),(281,NULL,'V14.4.5','Verify that HTTP Strict Transport Security headers are included on all responses and for all subdomains, such as Strict-Transport-Security: max-age=15724800; includeSubdomains.',40,_binary '',70),(282,NULL,'V14.4.6','Verify that a suitable \"Referrer-Policy\" header is included, such as \"no-referrer\" or \"same-origin\".',50,_binary '',70),(283,NULL,'V14.4.7','Verify that a suitable X-Frame-Options or Content-Security-Policy: frame-ancestors header is in use for sites where content should not be embedded in a third-party site.',60,_binary '',70),(284,NULL,'V14.5.1','Verify that the application server only accepts the HTTP methods in use by the application or API, including pre-flight OPTIONS.',0,_binary '',71),(285,NULL,'V14.5.2','Verify that the supplied Origin header is not used for authentication or access control decisions, as the Origin header can easily be changed by an attacker.',10,_binary '',71),(286,NULL,'V14.5.3','Verify that the cross-domain resource sharing (CORS) Access-Control-Allow-Origin header uses a strict white-list of trusted domains to match against and does not support the \"null\" origin.',20,_binary '',71),(287,NULL,'V14.5.4','Verify that HTTP headers added by a trusted proxy or SSO devices, such as a bearer token, are authenticated by the application.',30,_binary '',71);
/*!40000 ALTER TABLE `REQUIREMENTSKELETON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENTSKELETON_COLLECTIONINSTANCE`
--

DROP TABLE IF EXISTS `REQUIREMENTSKELETON_COLLECTIONINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIREMENTSKELETON_COLLECTIONINSTANCE` (
  `collectioninstances_id` bigint(20) NOT NULL,
  `requirementskeletons_id` bigint(20) NOT NULL,
  PRIMARY KEY (`requirementskeletons_id`,`collectioninstances_id`),
  KEY `fk_collectioninstance_collectioninstance_requirementskeleton_id` (`collectioninstances_id`),
  CONSTRAINT `fk_collectioninstance_collectioninstance_requirementskeleton_id` FOREIGN KEY (`collectioninstances_id`) REFERENCES `COLLECTIONINSTANCE` (`id`),
  CONSTRAINT `fk_requirementskeleton_collectioninstance_collectioninstance_id` FOREIGN KEY (`requirementskeletons_id`) REFERENCES `REQUIREMENTSKELETON` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENTSKELETON_COLLECTIONINSTANCE`
--

LOCK TABLES `REQUIREMENTSKELETON_COLLECTIONINSTANCE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_COLLECTIONINSTANCE` DISABLE KEYS */;
INSERT INTO `REQUIREMENTSKELETON_COLLECTIONINSTANCE` VALUES (1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,63),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,81),(1,82),(1,83),(1,84),(1,87),(1,101),(1,102),(1,103),(1,104),(1,106),(1,107),(1,110),(1,111),(1,112),(1,113),(1,114),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,157),(1,158),(1,159),(1,160),(1,164),(1,177),(1,178),(1,187),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,207),(1,208),(1,209),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,233),(1,237),(1,238),(1,239),(1,240),(1,241),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,253),(1,254),(1,255),(1,259),(1,268),(1,269),(1,270),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70),(2,71),(2,72),(2,73),(2,74),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(2,86),(2,87),(2,88),(2,89),(2,90),(2,91),(2,92),(2,93),(2,94),(2,95),(2,96),(2,97),(2,98),(2,99),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,120),(2,121),(2,122),(2,123),(2,124),(2,125),(2,126),(2,127),(2,128),(2,129),(2,130),(2,131),(2,132),(2,133),(2,134),(2,135),(2,136),(2,137),(2,138),(2,139),(2,140),(2,141),(2,142),(2,143),(2,144),(2,145),(2,146),(2,147),(2,148),(2,149),(2,150),(2,151),(2,152),(2,153),(2,154),(2,155),(2,156),(2,157),(2,158),(2,159),(2,160),(2,161),(2,162),(2,163),(2,164),(2,165),(2,166),(2,167),(2,168),(2,169),(2,172),(2,173),(2,175),(2,176),(2,177),(2,178),(2,179),(2,180),(2,181),(2,182),(2,183),(2,184),(2,185),(2,186),(2,187),(2,188),(2,189),(2,190),(2,191),(2,192),(2,193),(2,196),(2,197),(2,198),(2,199),(2,200),(2,201),(2,202),(2,203),(2,204),(2,205),(2,206),(2,207),(2,208),(2,209),(2,210),(2,211),(2,212),(2,213),(2,216),(2,217),(2,222),(2,223),(2,224),(2,225),(2,226),(2,227),(2,228),(2,229),(2,230),(2,231),(2,232),(2,233),(2,234),(2,235),(2,236),(2,237),(2,238),(2,239),(2,240),(2,241),(2,242),(2,243),(2,244),(2,245),(2,246),(2,247),(2,248),(2,249),(2,250),(2,251),(2,252),(2,253),(2,254),(2,255),(2,256),(2,257),(2,258),(2,259),(2,260),(2,261),(2,262),(2,263),(2,264),(2,265),(2,266),(2,268),(2,269),(2,270),(2,271),(2,272),(2,273),(2,274),(2,275),(2,276),(2,277),(2,278),(2,279),(2,280),(2,281),(2,282),(2,283),(2,284),(2,285),(2,286),(2,287),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90),(3,91),(3,92),(3,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110),(3,111),(3,112),(3,113),(3,114),(3,115),(3,116),(3,117),(3,118),(3,119),(3,120),(3,121),(3,122),(3,123),(3,124),(3,125),(3,126),(3,127),(3,128),(3,129),(3,130),(3,131),(3,132),(3,133),(3,134),(3,135),(3,136),(3,137),(3,138),(3,139),(3,140),(3,141),(3,142),(3,143),(3,144),(3,145),(3,146),(3,147),(3,148),(3,149),(3,150),(3,151),(3,152),(3,153),(3,154),(3,155),(3,156),(3,157),(3,158),(3,159),(3,160),(3,161),(3,162),(3,163),(3,164),(3,165),(3,166),(3,167),(3,168),(3,169),(3,170),(3,171),(3,172),(3,173),(3,174),(3,175),(3,176),(3,177),(3,178),(3,179),(3,180),(3,181),(3,182),(3,183),(3,184),(3,185),(3,186),(3,187),(3,188),(3,189),(3,190),(3,191),(3,192),(3,193),(3,194),(3,195),(3,196),(3,197),(3,198),(3,199),(3,200),(3,201),(3,202),(3,203),(3,204),(3,205),(3,206),(3,207),(3,208),(3,209),(3,210),(3,211),(3,212),(3,213),(3,214),(3,215),(3,216),(3,217),(3,218),(3,219),(3,220),(3,221),(3,222),(3,223),(3,224),(3,225),(3,226),(3,227),(3,228),(3,229),(3,230),(3,231),(3,232),(3,233),(3,234),(3,235),(3,236),(3,237),(3,238),(3,239),(3,240),(3,241),(3,242),(3,243),(3,244),(3,245),(3,246),(3,247),(3,248),(3,249),(3,250),(3,251),(3,252),(3,253),(3,254),(3,255),(3,256),(3,257),(3,258),(3,259),(3,260),(3,261),(3,262),(3,263),(3,264),(3,265),(3,266),(3,267),(3,268),(3,269),(3,270),(3,271),(3,272),(3,273),(3,274),(3,275),(3,276),(3,277),(3,278),(3,279),(3,280),(3,281),(3,282),(3,283),(3,284),(3,285),(3,286),(3,287),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,14),(4,15),(4,16),(4,17),(4,18),(4,19),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(5,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),(5,77),(5,78),(5,79),(5,80),(5,81),(5,82),(5,83),(5,84),(5,85),(5,86),(5,87),(5,88),(5,89),(5,90),(5,91),(5,92),(5,93),(5,94),(5,95),(5,96),(5,97),(5,98),(5,99),(5,100),(6,101),(6,102),(6,103),(6,104),(6,105),(6,106),(6,107),(6,108),(6,109),(6,110),(6,111),(6,112),(6,113),(6,114),(6,115),(6,116),(6,117),(6,118),(6,119),(6,120),(7,121),(7,122),(7,123),(7,124),(7,125),(7,126),(7,127),(7,128),(7,129),(7,130),(8,131),(8,132),(8,133),(8,134),(8,135),(8,136),(8,137),(8,138),(8,139),(8,140),(8,141),(8,142),(8,143),(8,144),(8,145),(8,146),(8,147),(8,148),(8,149),(8,150),(8,151),(8,152),(8,153),(8,154),(8,155),(8,156),(8,157),(8,158),(8,159),(8,160),(9,161),(9,162),(9,163),(9,164),(9,165),(9,166),(9,167),(9,168),(9,169),(9,170),(9,171),(9,172),(9,173),(9,174),(9,175),(9,176),(10,177),(10,178),(10,179),(10,180),(10,181),(10,182),(10,183),(10,184),(10,185),(10,186),(10,187),(10,188),(10,189),(11,190),(11,191),(11,192),(11,193),(11,194),(11,195),(11,196),(11,197),(11,198),(11,199),(11,200),(11,201),(11,202),(11,203),(11,204),(11,205),(11,206),(12,207),(12,208),(12,209),(12,210),(12,211),(12,212),(12,213),(12,214),(13,215),(13,216),(13,217),(13,218),(13,219),(13,220),(13,221),(13,222),(13,223),(13,224),(14,225),(14,226),(14,227),(14,228),(14,229),(14,230),(14,231),(14,232),(15,233),(15,234),(15,235),(15,236),(15,237),(15,238),(15,239),(15,240),(15,241),(15,242),(15,243),(15,244),(15,245),(15,246),(15,247),(16,248),(16,249),(16,250),(16,251),(16,252),(16,253),(16,254),(16,255),(16,256),(16,257),(16,258),(16,259),(16,260),(16,261),(16,262),(17,263),(17,264),(17,265),(17,266),(17,267),(17,268),(17,269),(17,270),(17,271),(17,272),(17,273),(17,274),(17,275),(17,276),(17,277),(17,278),(17,279),(17,280),(17,281),(17,282),(17,283),(17,284),(17,285),(17,286),(17,287);
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_COLLECTIONINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENTSKELETON_PROJECTTYPE`
--

DROP TABLE IF EXISTS `REQUIREMENTSKELETON_PROJECTTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIREMENTSKELETON_PROJECTTYPE` (
  `projecttypes_id` bigint(20) NOT NULL,
  `requirementskeletons_id` bigint(20) NOT NULL,
  PRIMARY KEY (`requirementskeletons_id`,`projecttypes_id`),
  KEY `fk_projecttype_projecttype_requirementskeleton_id` (`projecttypes_id`),
  CONSTRAINT `fk_projecttype_projecttype_requirementskeleton_id` FOREIGN KEY (`projecttypes_id`) REFERENCES `PROJECTTYPE` (`id`),
  CONSTRAINT `fk_requirementskeleton_projecttype_projecttype_id` FOREIGN KEY (`requirementskeletons_id`) REFERENCES `REQUIREMENTSKELETON` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENTSKELETON_PROJECTTYPE`
--

LOCK TABLES `REQUIREMENTSKELETON_PROJECTTYPE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_PROJECTTYPE` DISABLE KEYS */;
INSERT INTO `REQUIREMENTSKELETON_PROJECTTYPE` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(1,186),(1,187),(1,188),(1,189),(1,190),(1,191),(1,192),(1,193),(1,194),(1,195),(1,196),(1,197),(1,198),(1,199),(1,200),(1,201),(1,202),(1,203),(1,204),(1,205),(1,206),(1,207),(1,208),(1,209),(1,210),(1,211),(1,212),(1,213),(1,214),(1,215),(1,216),(1,217),(1,218),(1,219),(1,220),(1,221),(1,222),(1,223),(1,224),(1,225),(1,226),(1,227),(1,228),(1,229),(1,230),(1,231),(1,232),(1,233),(1,234),(1,235),(1,236),(1,237),(1,238),(1,239),(1,240),(1,241),(1,242),(1,243),(1,244),(1,245),(1,246),(1,247),(1,248),(1,249),(1,250),(1,251),(1,252),(1,253),(1,254),(1,255),(1,256),(1,257),(1,258),(1,259),(1,260),(1,261),(1,262),(1,263),(1,264),(1,265),(1,266),(1,267),(1,268),(1,269),(1,270),(1,271),(1,272),(1,273),(1,274),(1,275),(1,276),(1,277),(1,278),(1,279),(1,280),(1,281),(1,282),(1,283),(1,284),(1,285),(1,286),(1,287);
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_PROJECTTYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIREMENTSKELETON_TAGINSTANCE`
--

DROP TABLE IF EXISTS `REQUIREMENTSKELETON_TAGINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIREMENTSKELETON_TAGINSTANCE` (
  `taginstances_id` bigint(20) NOT NULL,
  `requirementskeletons_id` bigint(20) NOT NULL,
  PRIMARY KEY (`requirementskeletons_id`,`taginstances_id`),
  KEY `fk_taginstance_taginstance_requirementskeleton_id` (`taginstances_id`),
  CONSTRAINT `fk_requirementskeleton_taginstance_taginstance_id` FOREIGN KEY (`requirementskeletons_id`) REFERENCES `REQUIREMENTSKELETON` (`id`),
  CONSTRAINT `fk_taginstance_taginstance_requirementskeleton_id` FOREIGN KEY (`taginstances_id`) REFERENCES `TAGINSTANCE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENTSKELETON_TAGINSTANCE`
--

LOCK TABLES `REQUIREMENTSKELETON_TAGINSTANCE` WRITE;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_TAGINSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_TAGINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SLIDETEMPLATE`
--

DROP TABLE IF EXISTS `SLIDETEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SLIDETEMPLATE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `content` text,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SLIDETEMPLATE`
--

LOCK TABLES `SLIDETEMPLATE` WRITE;
/*!40000 ALTER TABLE `SLIDETEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SLIDETEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATUSCOLUMN`
--

DROP TABLE IF EXISTS `STATUSCOLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATUSCOLUMN` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_enum` bit(1) DEFAULT NULL,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUSCOLUMN`
--

LOCK TABLES `STATUSCOLUMN` WRITE;
/*!40000 ALTER TABLE `STATUSCOLUMN` DISABLE KEYS */;
INSERT INTO `STATUSCOLUMN` VALUES (1,'Notes',NULL,_binary '\0',0,_binary '');
/*!40000 ALTER TABLE `STATUSCOLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATUSCOLUMNVALUE`
--

DROP TABLE IF EXISTS `STATUSCOLUMNVALUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATUSCOLUMNVALUE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `statuscolumn_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_statuscolumnvalue_statuscolumn_id` (`statuscolumn_id`),
  CONSTRAINT `fk_statuscolumnvalue_statuscolumn_id` FOREIGN KEY (`statuscolumn_id`) REFERENCES `STATUSCOLUMN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUSCOLUMNVALUE`
--

LOCK TABLES `STATUSCOLUMNVALUE` WRITE;
/*!40000 ALTER TABLE `STATUSCOLUMNVALUE` DISABLE KEYS */;
/*!40000 ALTER TABLE `STATUSCOLUMNVALUE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAGCATEGORY`
--

DROP TABLE IF EXISTS `TAGCATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAGCATEGORY` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAGCATEGORY`
--

LOCK TABLES `TAGCATEGORY` WRITE;
/*!40000 ALTER TABLE `TAGCATEGORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAGCATEGORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAGINSTANCE`
--

DROP TABLE IF EXISTS `TAGINSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAGINSTANCE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `show_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `tagcategory_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_taginstance_tagcategory_id` (`tagcategory_id`),
  CONSTRAINT `fk_taginstance_tagcategory_id` FOREIGN KEY (`tagcategory_id`) REFERENCES `TAGCATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAGINSTANCE`
--

LOCK TABLES `TAGINSTANCE` WRITE;
/*!40000 ALTER TABLE `TAGINSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAGINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAINING`
--

DROP TABLE IF EXISTS `TRAINING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAINING` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `all_requirements_selected` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAINING`
--

LOCK TABLES `TRAINING` WRITE;
/*!40000 ALTER TABLE `TRAINING` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAINING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAININGBRANCHNODE`
--

DROP TABLE IF EXISTS `TRAININGBRANCHNODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAININGBRANCHNODE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `anchor` int(11) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainingbranchnode_node_id` (`node_id`),
  CONSTRAINT `fk_trainingbranchnode_node_id` FOREIGN KEY (`node_id`) REFERENCES `TRAININGTREENODE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAININGBRANCHNODE`
--

LOCK TABLES `TRAININGBRANCHNODE` WRITE;
/*!40000 ALTER TABLE `TRAININGBRANCHNODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAININGBRANCHNODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAININGCATEGORYNODE`
--

DROP TABLE IF EXISTS `TRAININGCATEGORYNODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAININGCATEGORYNODE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainingcategorynode_node_id` (`node_id`),
  KEY `fk_trainingcategorynode_category_id` (`category_id`),
  CONSTRAINT `fk_trainingcategorynode_category_id` FOREIGN KEY (`category_id`) REFERENCES `REQCATEGORY` (`id`),
  CONSTRAINT `fk_trainingcategorynode_node_id` FOREIGN KEY (`node_id`) REFERENCES `TRAININGTREENODE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAININGCATEGORYNODE`
--

LOCK TABLES `TRAININGCATEGORYNODE` WRITE;
/*!40000 ALTER TABLE `TRAININGCATEGORYNODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAININGCATEGORYNODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAININGCUSTOMSLIDENODE`
--

DROP TABLE IF EXISTS `TRAININGCUSTOMSLIDENODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAININGCUSTOMSLIDENODE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` text,
  `anchor` int(11) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainingcustomslidenode_node_id` (`node_id`),
  CONSTRAINT `fk_trainingcustomslidenode_node_id` FOREIGN KEY (`node_id`) REFERENCES `TRAININGTREENODE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAININGCUSTOMSLIDENODE`
--

LOCK TABLES `TRAININGCUSTOMSLIDENODE` WRITE;
/*!40000 ALTER TABLE `TRAININGCUSTOMSLIDENODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAININGCUSTOMSLIDENODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAININGGENERATEDSLIDENODE`
--

DROP TABLE IF EXISTS `TRAININGGENERATEDSLIDENODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAININGGENERATEDSLIDENODE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) DEFAULT NULL,
  `optcolumn_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_traininggeneratedslidenode_node_id` (`node_id`),
  KEY `fk_traininggeneratedslidenode_optcolumn_id` (`optcolumn_id`),
  CONSTRAINT `fk_traininggeneratedslidenode_node_id` FOREIGN KEY (`node_id`) REFERENCES `TRAININGTREENODE` (`id`),
  CONSTRAINT `fk_traininggeneratedslidenode_optcolumn_id` FOREIGN KEY (`optcolumn_id`) REFERENCES `OPTCOLUMN` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAININGGENERATEDSLIDENODE`
--

LOCK TABLES `TRAININGGENERATEDSLIDENODE` WRITE;
/*!40000 ALTER TABLE `TRAININGGENERATEDSLIDENODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAININGGENERATEDSLIDENODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAININGREQUIREMENTNODE`
--

DROP TABLE IF EXISTS `TRAININGREQUIREMENTNODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAININGREQUIREMENTNODE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_id` bigint(20) DEFAULT NULL,
  `requirementskeleton_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainingrequirementnode_node_id` (`node_id`),
  KEY `fk_trainingrequirementnode_requirementskeleton_id` (`requirementskeleton_id`),
  CONSTRAINT `fk_trainingrequirementnode_node_id` FOREIGN KEY (`node_id`) REFERENCES `TRAININGTREENODE` (`id`),
  CONSTRAINT `fk_trainingrequirementnode_requirementskeleton_id` FOREIGN KEY (`requirementskeleton_id`) REFERENCES `REQUIREMENTSKELETON` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAININGREQUIREMENTNODE`
--

LOCK TABLES `TRAININGREQUIREMENTNODE` WRITE;
/*!40000 ALTER TABLE `TRAININGREQUIREMENTNODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAININGREQUIREMENTNODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAININGTREENODE`
--

DROP TABLE IF EXISTS `TRAININGTREENODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAININGTREENODE` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_type` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `parent_id_id` bigint(20) DEFAULT NULL,
  `training_id_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trainingtreenode_parent_id_id` (`parent_id_id`),
  KEY `fk_trainingtreenode_training_id_id` (`training_id_id`),
  CONSTRAINT `fk_trainingtreenode_parent_id_id` FOREIGN KEY (`parent_id_id`) REFERENCES `TRAININGTREENODE` (`id`),
  CONSTRAINT `fk_trainingtreenode_training_id_id` FOREIGN KEY (`training_id_id`) REFERENCES `TRAINING` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAININGTREENODE`
--

LOCK TABLES `TRAININGTREENODE` WRITE;
/*!40000 ALTER TABLE `TRAININGTREENODE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAININGTREENODE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAINING_COLLECTION`
--

DROP TABLE IF EXISTS `TRAINING_COLLECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAINING_COLLECTION` (
  `collections_id` bigint(20) NOT NULL,
  `trainings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`trainings_id`,`collections_id`),
  KEY `fk_collectioninstance_collection_training_id` (`collections_id`),
  CONSTRAINT `fk_collectioninstance_collection_training_id` FOREIGN KEY (`collections_id`) REFERENCES `COLLECTIONINSTANCE` (`id`),
  CONSTRAINT `fk_training_collection_collectioninstance_id` FOREIGN KEY (`trainings_id`) REFERENCES `TRAINING` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAINING_COLLECTION`
--

LOCK TABLES `TRAINING_COLLECTION` WRITE;
/*!40000 ALTER TABLE `TRAINING_COLLECTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAINING_COLLECTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAINING_OPTCOLUMN`
--

DROP TABLE IF EXISTS `TRAINING_OPTCOLUMN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAINING_OPTCOLUMN` (
  `optcolumns_id` bigint(20) NOT NULL,
  `trainings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`trainings_id`,`optcolumns_id`),
  KEY `fk_optcolumn_optcolumn_training_id` (`optcolumns_id`),
  CONSTRAINT `fk_optcolumn_optcolumn_training_id` FOREIGN KEY (`optcolumns_id`) REFERENCES `OPTCOLUMN` (`id`),
  CONSTRAINT `fk_training_optcolumn_optcolumn_id` FOREIGN KEY (`trainings_id`) REFERENCES `TRAINING` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAINING_OPTCOLUMN`
--

LOCK TABLES `TRAINING_OPTCOLUMN` WRITE;
/*!40000 ALTER TABLE `TRAINING_OPTCOLUMN` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAINING_OPTCOLUMN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRAINING_PROJECTTYPE`
--

DROP TABLE IF EXISTS `TRAINING_PROJECTTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRAINING_PROJECTTYPE` (
  `projecttypes_id` bigint(20) NOT NULL,
  `trainings_id` bigint(20) NOT NULL,
  PRIMARY KEY (`trainings_id`,`projecttypes_id`),
  KEY `fk_projecttype_projecttype_training_id` (`projecttypes_id`),
  CONSTRAINT `fk_projecttype_projecttype_training_id` FOREIGN KEY (`projecttypes_id`) REFERENCES `PROJECTTYPE` (`id`),
  CONSTRAINT `fk_training_projecttype_projecttype_id` FOREIGN KEY (`trainings_id`) REFERENCES `TRAINING` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRAINING_PROJECTTYPE`
--

LOCK TABLES `TRAINING_PROJECTTYPE` WRITE;
/*!40000 ALTER TABLE `TRAINING_PROJECTTYPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRAINING_PROJECTTYPE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-21 11:29:42
