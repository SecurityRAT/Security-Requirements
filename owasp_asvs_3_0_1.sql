-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: securityrat
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
INSERT INTO `ALTERNATIVEINSTANCE` VALUES (1,'This nees to be java,util.random',1,1);
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
INSERT INTO `ALTERNATIVESET` VALUES (1,'JavA','dfdf0',0,'',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTIONCATEGORY`
--

LOCK TABLES `COLLECTIONCATEGORY` WRITE;
/*!40000 ALTER TABLE `COLLECTIONCATEGORY` DISABLE KEYS */;
INSERT INTO `COLLECTIONCATEGORY` VALUES (1,'Level','Level which determines the ASVS requirements',0,''),(2,'Artifact Type','Characteristics of the developed artifact',10,''),(3,'Authentication','How are the artifact clients/consumers authenticated?',20,''),(4,'Session management','Does the artifact implement session management?',30,''),(5,'Reachability','From where is the artifact reachable',40,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTIONINSTANCE`
--

LOCK TABLES `COLLECTIONINSTANCE` WRITE;
/*!40000 ALTER TABLE `COLLECTIONINSTANCE` DISABLE KEYS */;
INSERT INTO `COLLECTIONINSTANCE` VALUES (1,'Level 1: Opportunistic','An application achieves ASVS Level 1 (or Opportunistic) if it adequately defends against application security vulnerabilities that are easy to discover, and included in the OWASP Top 10 and other similar checklists.',0,'',1),(2,'Level 2: Standard','An application achieves ASVS Level 2 (or Standard) if it adequately defends against most of the risks associated with software today.',10,'',1),(3,'Level 3: Advanced','ASVS Level 3 is the highest level of verification within the ASVS. This level is typically reserved for applications that require significant levels of security verification, such as those that may be found within areas of military, health and safety, critical infrastructure, etc.',20,'',1),(4,'Frontend Application','Server application intended to communicate with human users via a browser.',0,'',2),(5,'Web Service','E.g. REST or SOAP',10,'',2),(6,'Mobile App','Apps running on mobile devices (IOS, Android, Windows Phone...)',20,'',2),(7,'Single Sign-On Client','The system utilizes a central SSO service for authenticating its clients/consumers = client passwords are never transmitted through the artifact.',0,'',3),(8,'Centralized','The artifact authenticates the users/consumers, but doesn\'t store passwords or authentication tokens itself. These are stored in a central service (e.g. LDAP).',10,'',3),(9,'Local','The artifact authenticates the consumers itself and also stores the passwords',20,'',3),(10,'Client certificate authentication','The artifact utilizes a TLS certifcate authentication',30,'',3),(11,'No Authentication','The artifact doesn\'t authenticate it\'s consumers',40,'',3),(12,'No Session Management','The artifact doesn\'t have any session state',0,'',4),(13,'Session IDs','The artifact empoys sessions and uses session IDs',10,'',4),(14,'Externally','The artifact is reachable from the Internet',0,'',5),(15,'Internally','The artifact is reachable only from the internal company network',10,'',5);
/*!40000 ALTER TABLE `COLLECTIONINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `CONFIGCONSTANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONFIGCONSTANT` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONFIGCONSTANT`
--

LOCK TABLES `CONFIGCONSTANT` WRITE;
/*!40000 ALTER TABLE `CONFIGCONSTANT` DISABLE KEYS */;
INSERT INTO `CONFIGCONSTANT` VALUES (1,'customRequirementName','CUS-','This is the short name representation for the custom requirements.'),(2,'filenamePrefix','SSDLC','This property will be used as prefix for the exported yaml file.'),(3,'ticketDescription','New development of a Secure SDLC Artifact.','This represents the default description value when exporting a requirement set.'),(4,'reportJIRAQueue','APPSEC','This property gives the queue where tickets should be opened whenever suggestions to the requirements are sent.'),(5,'reportJIRAHost','https://jira-appsec-qa.svc.mamdev.server.lan','The Jira host address for tracking the feedbacks to the requirements. https://jira-appsec-qa.svc.mamdev.server.lan'),(6,'reportJIRAIssueType','Bug','This is a jira issue type. It will be used to create ticket whenever a suggestion is given to a requirement.'),(7,'summaryForSuggestion','Feedback for a SSDLC requirement.','This represents the title of the created ticket whenever a suggestion is given to a requirement.'),(8,'ticketComment','A new version of the Secure SDLC Artifact §artifact_name§ has been exported.You can view and import it into the Secure SDLC Tool with the following link:§import_link§ This link corresponds to the attachment with the following name:§filename§','This will be added as comment when exporting a requirement set into a JIRA ticket.The placeholders §artifact_name§, §import_link§, §filename§ represent respectively the system artifact name, the import link and the filename of the attached file.'),(10,'securityCAT','https://localhost:8080','The URL for the SecurityCAT application.'),(11,'summaryPrefix','','This property is used to prefix the value of the summary field when creating a ticket on export.'),(12,'welcomeMessage','# Welcome to SecurityRAT','This property defines the welcome message in the home page. Markdown supported.'),(13,'JIRAIssueLinkTypeName','Relates','The default issue link type name used to link tickets in the same JIRA instance. Check the possible values for your instance using the rest URI (/rest/api/2/issueLinkType).'),(14,'JIRARemoteIssueLinkRelationshipName','relates to','The \'relationship\' name used to link remote tickets. That is tickets in different JIRA instances. More information [here](https://developer.atlassian.com/server/jira/platform/jira-rest-api-for-remote-issue-links/).'),(23,'defaultJIRAQueueForYAML','','This value defines the default JIRA queue (e.g. https://test-jira.com/browse/TEST) used to save your requirements to JIRA.'),(24,'JIRAHostPlaceholder','https://jira-appsec-qa.svc.mamdev.server.lan','Default host value for the **create JIRA tickets process**. When defined, the user could only provide a JIRA project name instead of the whole queue URL.'),(25,'defaultJIRAQueueForYAML','','This value defines the default JIRA queue (e.g. https://test-jira.com/browse/TEST) used to save your requirements.'),(26,'defaultJIRAHost','','Default JIRA host used in multiple Interfaces such as **create JIRA tickets** or **import**. When defined, the user could only provide a JIRA project name or ticket key instead of the whole URL.');
/*!40000 ALTER TABLE `CONFIGCONSTANT` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMN`
--

LOCK TABLES `OPTCOLUMN` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMN` DISABLE KEYS */;
INSERT INTO `OPTCOLUMN` VALUES (1,'More Information','More information for the given requriement',0,'',1, b'1');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMNCONTENT`
--

LOCK TABLES `OPTCOLUMNCONTENT` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMNCONTENT` DISABLE KEYS */;
INSERT INTO `OPTCOLUMNCONTENT` VALUES (1,'For more information see [OWASP Application Security Architecture Cheat Sheet](https://www.owasp.org/index.php/Application_Security_Architecture_Cheat_Sheet)',1,1),(2,'Check [OWASP Application Threat Modeling](https://www.owasp.org/index.php/Application_Threat_Modeling) or [Microsoft STRIDE](https://msdn.microsoft.com/en-us/library/ee823878aspx) for more information regarding Threat Modeling.\n\nTools:\n\n* [OWASP Threat Dragon](Application Threat Modeling)\n* [Microsoft Threat Modeling Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49168)',1,6),(3,'* For more information see [OWASP Authentication Cheat Sheet](https://www.owasp.org/index.php/Authentication_Cheat_Sheet)\n* [Testing for authentication](https://www.owasp.org/index.php/Testing_for_authentication)',1,12),(4,'* For more information see [OWASP Session Management Cheat Sheet](https://www.owasp.org/index.php/Session_Management_Cheat_Sheet)\n* [Testing for Session Management](https://www.owasp.org/index.php/Testing_for_Session_Management)',1,41),(5,'* For more information see [OWASP Access Control Cheat Sheet](https://www.owasp.org/index.php/Access_Control_Cheat_Sheet)',1,54),(6,'* For more information see [OWASP Input Validation Cheat Sheet](https://www.owasp.org/index.php/Input_Validation_Cheat_Sheet)\n* [Testing for Input Validation](https://www.owasp.org/index.php/Testing_for_Input_Validation)',1,69),(7,'* For more information see \n* [OWASP SQL Injection Prevention Cheat Sheet](https://www.owasp.org/index.php/SQL_Injection_Prevention_Cheat_Sheet)\n* [OWASP Query Parameterization Cheat Sheet](https://www.owasp.org/index.php/Query_Parameterization_Cheat_Sheet)\n* [Testing for SQL Injection](https://www.owasp.org/index.php/Testing_for_SQL_Injection)',1,70),(8,'* For more information see [OWASP LDAP Injection Prevention Cheat Sheet](https://www.owasp.org/index.php/LDAP_Injection_Prevention_Cheat_Sheet)\n* [Testing for LDAP Injection](https://www.owasp.org/index.php?title=Testing_for_LDAP_Injection)',1,71),(9,'For more information see \n* [OWASP Command Injection Defense Cheat Sheet](https://www.owasp.org/index.php/Command_Injection_Defense_Cheat_Sheet)\n* [OWASP Injection Prevention Cheat Sheet](https://www.owasp.org/index.php/Injection_Prevention_Cheat_Sheet)\n* [Testing for Command Injection](https://www.owasp.org/index.php/Testing_for_Command_Injection)',1,72),(10,'* For more information see \n* [OWASP XML External Entity (XXE) Prevention Cheat Sheet](https://www.owasp.org/index.php/XML_External_Entity_(XXE)_Prevention_Cheat_Sheet)\n* [OWASP XML Security Cheat Sheet](https://www.owasp.org/index.php/XML_Security_Cheat_Sheet)\n* [Testing for XML Injection](https://www.owasp.org/index.php?title=Testing_for_XML_Injection)',1,74),(11,'* For more information see \n* [OWASP XSS (Cross Site Scripting) Prevention Cheat Sheet](goo.gl/PdYWVP)\n* [OWASP DOM based XSS Prevention Cheat Sheet](https://www.owasp.org/index.php/DOM_based_XSS_Prevention_Cheat_Sheet)\n* [OWASP XSS Filter Evasion Cheat Sheet](https://www.owasp.org/index.php/XSS_Filter_Evasion_Cheat_Sheet)\n* [Testing for Cross site scripting](https://www.owasp.org/index.php/Testing_for_Cross_site_scripting)',1,75),(12,'For more information see [OWASP Cryptographic Storage Cheat Sheet](https://www.owasp.org/index.php/Cryptographic_Storage_Cheat_Sheet)',1,87),(13,'For more information see [OWASP Logging Cheat Sheet](https://www.owasp.org/index.php/Logging_Cheat_Sheet)',1,97),(14,'For more information see [OWASP Transport Layer Protection Cheat Sheet](https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet)',1,121),(15,'For more information see [OWASP Pinning Cheat Sheet](https://www.owasp.org/index.php/Pinning_Cheat_Sheet)',1,127),(16,'For more information see [OWASP HTTP Strict Transport Security Cheat Sheet](https://www.owasp.org/index.php/HTTP_Strict_Transport_Security_Cheat_Sheet)',1,128),(17,'For more information see [OWASP Content Security Policy Cheat Sheet](https://www.owasp.org/index.php/Content_Security_Policy_Cheat_Sheet)\n\nYou can evaluate the effectiveness of CSP here:\n\n* https://csp-evaluator.withgoogle.com',1,140),(18,'For more information see \n* [OWASP Business Logic Security Cheat Sheet](https://www.owasp.org/index.php/Business_Logic_Security_Cheat_Sheet)\n* [OWASP Transaction Authorization Cheat Sheet](https://www.owasp.org/index.php/Transaction_Authorization_Cheat_Sheet)',1,144),(19,'For more information see \n* [OWASP IOS Developer Cheat Sheet](https://www.owasp.org/index.php/IOS_Developer_Cheat_Sheet)\n* [OWASP Android Testing Cheat Sheet](https://www.owasp.org/index.php/Android_Testing_Cheat_Sheet)\n* [OWASP IOS Application Security Testing Cheat Sheet](https://www.owasp.org/index.php/IOS_Application_Security_Testing_Cheat_Sheet)\n* [OWASP Mobile Jailbreaking Cheat Sheet](https://www.owasp.org/index.php/Mobile_Jailbreaking_Cheat_Sheet)',1,155),(20,'For more information see \n* [OWASP Web Service Security Cheat Sheet](https://www.owasp.org/index.php/Web_Service_Security_Cheat_Sheet)\n* [OWASP REST Security Cheat Sheet](https://www.owasp.org/index.php/REST_Security_Cheat_Sheet)\n* [OWASP REST Assessment Cheat Sheet](https://www.owasp.org/index.php/REST_Assessment_Cheat_Sheet)',1,166),(21,'For more information see [OWASP 3rd Party Javascript Management Cheat Sheet](https://www.owasp.org/index.php/3rd_Party_Javascript_Management_Cheat_Sheet)',1,185),(22,'For more information see [OWASP AJAX Security Cheat Sheet](https://www.owasp.org/index.php/AJAX_Security_Cheat_Sheet)',1,116),(23,'For more information see [OWASP Choosing and Using Security Questions Cheat Sheet](https://www.owasp.org/index.php/Choosing_and_Using_Security_Questions_Cheat_Sheet)',1,32),(24,'For more information see [OWASP Clickjacking Defense Cheat Sheet](https://www.owasp.org/index.php/Clickjacking_Defense_Cheat_Sheet)',1,137),(25,'For more information see \n* [OWASP Credential Stuffing Prevention Cheat Sheet](https://www.owasp.org/index.php/Credential_Stuffing_Prevention_Cheat_Sheet)\n* [OWASP Denial of Service Cheat Sheet](https://www.owasp.org/index.php/Denial_of_Service_Cheat_Sheet)',1,28),(26,'For more information see [OWASP Cross-Site Request Forgery (CSRF) Prevention Cheat Sheet](https://goo.gl/SfRajj)',1,62),(27,'For more information see [OWASP Forgot Password Cheat Sheet](https://www.owasp.org/index.php/Forgot_Password_Cheat_Sheet)',1,18),(28,'For more information see [OWASP HTML5 Security Cheat Sheet](https://www.owasp.org/index.php/HTML5_Security_Cheat_Sheet)',1,118),(29,'For more information see [OWASP Mass Assignment Cheat Sheet](https://www.owasp.org/index.php/Mass_Assignment_Cheat_Sheet)',1,76),(30,'For more information see [OWASP SAML Security Cheat Sheet](https://www.owasp.org/index.php/SAML_Security_Cheat_Sheet)',1,136),(31,'For more information see [OWASP Unvalidated Redirects and Forwards Cheat Sheet](https://www.owasp.org/index.php/Unvalidated_Redirects_and_Forwards_Cheat_Sheet)',1,146),(32,'For more information see [OWASP User Privacy Protection Cheat Sheet](https://www.owasp.org/index.php/User_Privacy_Protection_Cheat_Sheet)',1,103),(33,'For more information see [OWASP Password Storage Cheat Sheet](https://www.owasp.org/index.php/Password_Storage_Cheat_Sheet)\n\n* [Argon2](https://en.wikipedia.org/wiki/Argon2) is recommended as hashing method',1,23),(34,'For more information see [OWASP Insecure Direct Object Reference Prevention Cheat Sheet\n](https://www.owasp.org/index.php/Insecure_Direct_Object_Reference_Prevention_Cheat_Sheet)',1,55),(35,'For more information see [OWASP Key Management Cheat Sheet](https://www.owasp.org/index.php/Key_Management_Cheat_Sheet)',1,91),(36,'For more information see [OWASP Regular Expression Security Cheatsheet](https://www.owasp.org/index.php/Regular_Expression_Security_Cheatsheet)',1,79);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMNTYPE`
--

LOCK TABLES `OPTCOLUMNTYPE` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMNTYPE` DISABLE KEYS */;
INSERT INTO `OPTCOLUMNTYPE` VALUES (1,'Text','Column with text and markdown');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTTYPE`
--

LOCK TABLES `PROJECTTYPE` WRITE;
/*!40000 ALTER TABLE `PROJECTTYPE` DISABLE KEYS */;
INSERT INTO `PROJECTTYPE` VALUES (1,'Default','Default implementation type with columns \"Fulfilled\" and \"Comment\".',0,'');
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
INSERT INTO `PROJECTTYPE_OPTCOLUMN` VALUES (1,1);
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
INSERT INTO `PROJECTTYPE_STATUSCOLUMN` VALUES (1,1),(2,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQCATEGORY`
--

LOCK TABLES `REQCATEGORY` WRITE;
/*!40000 ALTER TABLE `REQCATEGORY` DISABLE KEYS */;
INSERT INTO `REQCATEGORY` VALUES (1,'Architecture, design and threat modelling','ASVS_3.0.1_V1',NULL,0,''),(2,'Authentication','ASVS_3.0.1_V2',NULL,10,''),(3,'Session management','ASVS_3.0.1_V3',NULL,20,''),(4,'Access control','ASVS_3.0.1_V4',NULL,30,''),(5,'Malicious input handling','ASVS_3.0.1_V5',NULL,40,''),(6,'Cryptography at rest','ASVS_3.0.1_V7',NULL,60,''),(7,'Error handling and logging','ASVS_3.0.1_V8',NULL,70,''),(8,'Data protection','ASVS_3.0.1_V9',NULL,80,''),(9,'Communications','ASVS_3.0.1_V10',NULL,90,''),(10,'HTTP security configuration','ASVS_3.0.1_V11',NULL,100,''),(11,'Malicious controls','ASVS_3.0.1_V13',NULL,120,''),(12,'Business logic','ASVS_3.0.1_V15',NULL,140,''),(13,'File and resources','ASVS_3.0.1_V16',NULL,150,''),(14,'Mobile','ASVS_3.0.1_V17',NULL,160,''),(15,'Web services','ASVS_3.0.1_V18',NULL,170,''),(16,'Configuration','ASVS_3.0.1_V19',NULL,180,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENTSKELETON`
--

LOCK TABLES `REQUIREMENTSKELETON` WRITE;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON` DISABLE KEYS */;
INSERT INTO `REQUIREMENTSKELETON` VALUES (1,NULL,'ASVS_3.0.1_1.1','Verify that all application components are identified and are known to be needed.',0,'',1),(2,NULL,'ASVS_3.0.1_1.2','Verify that all components, such as libraries, modules, and external systems, that are not part of the application but that the application relies on to operate are identified.',10,'',1),(3,NULL,'ASVS_3.0.1_1.3','Verify that a high-level architecture for the application has been defined.',20,'',1),(4,NULL,'ASVS_3.0.1_1.4','Verify that all application components are defined in terms of the business functions and/or security functions they provide.',30,'',1),(5,NULL,'ASVS_3.0.1_1.5','Verify that all components that are not part of the application but that the application relies on to operate are defined in terms of the functions, and/or security functions, they provide.',40,'',1),(6,NULL,'ASVS_3.0.1_1.6','Verify that a threat model for the target application has been produced and covers off risks associated with Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of privilege (STRIDE).',50,'',1),(7,NULL,'ASVS_3.0.1_1.7','Verify all security controls (including libraries that call external security services) have a centralized implementation.',60,'',1),(8,NULL,'ASVS_3.0.1_1.8','Verify that components are segregated from each other via a defined security control, such as network segmentation, firewall rules, or cloud based security groups.',70,'',1),(9,NULL,'ASVS_3.0.1_1.9','Verify the application has a clear separation between the data layer, controller layer and the display layer, such that security decisions can be enforced on trusted systems.',80,'',1),(10,NULL,'ASVS_3.0.1_1.10','Verify that there is no sensitive business logic, secret keys or other proprietary information in client side code.',90,'',1),(11,NULL,'ASVS_3.0.1_1.11','Verify that all application components, libraries, modules, frameworks, platform, and operating systems are free from known vulnerabilities.',100,'',1),(12,NULL,'ASVS_3.0.1_2.1','Verify all pages and resources by default require authentication except those specifically intended to be public (Principle of complete mediation).',0,'',2),(13,NULL,'ASVS_3.0.1_2.2','Verify that forms containing credentials are not filled in by the application. Pre-filling by the application implies that credentials are stored in plaintext or a reversible format, which is explicitly prohibited. ',10,'',2),(16,NULL,'ASVS_3.0.1_2.4','Verify all authentication controls are enforced on the server side.',30,'',2),(17,NULL,'ASVS_3.0.1_2.6','Verify all authentication controls fail securely to ensure attackers cannot log in.',50,'',2),(18,NULL,'ASVS_3.0.1_2.8','Verify all account identity authentication functions (such as update profile, forgot password, disabled / lost token, help desk or IVR) that might regain access to the account are at least as resistant to attack as the primary authentication mechanism.',70,'',2),(20,NULL,'ASVS_3.0.1_2.7','Verify password entry fields allow, or encourage, the use of passphrases, and do not prevent password managers, long passphrases or highly complex passwords being entered.',60,'',2),(21,NULL,'ASVS_3.0.1_2.9','Verify that the changing password functionality includes the old password, the new password, and a password confirmation.',80,'',2),(22,NULL,'ASVS_3.0.1_2.12','Verify that all authentication decisions can be logged, without storing sensitive session identifiers or passwords. This should include requests with relevant metadata needed for security investigations.',110,'',2),(23,NULL,'ASVS_3.0.1_2.13','Verify that account passwords are one way hashed with a salt, and there is sufficient work factor to defeat brute force and password hash recovery attacks.',120,'',2),(24,NULL,'ASVS_3.0.1_2.16','Verify that credentials are transported using a suitable encrypted link and that all pages/functions that require a user to enter credentials are done so using an encrypted link.',150,'',2),(25,NULL,'ASVS_3.0.1_2.17','Verify that the forgotten password function and other recovery paths do not reveal the current password and that the new password is not sent in clear text to the user.',160,'',2),(26,NULL,'ASVS_3.0.1_2.18','Verify that information enumeration is not possible via login, password reset, or forgot account functionality.',170,'',2),(27,NULL,'ASVS_3.0.1_2.19','Verify there are no default passwords in use for the application framework or any components used by the application (such as \'admin/password\').',180,'',2),(28,NULL,'ASVS_3.0.1_2.20','Verify that anti-automation is in place to prevent breached credential testing, brute forcing, and account lockout attacks.',190,'',2),(29,NULL,'ASVS_3.0.1_2.21','Verify that all authentication credentials for accessing services external to the application are encrypted and stored in a protected location.',200,'',2),(30,NULL,'ASVS_3.0.1_2.22','Verify that forgotten password and other recovery paths use a TOTP or other soft token, mobile push, or other offline recovery mechanism. Use of a random value in an e-mail or SMS should be a last resort and is known weak. ',210,'',2),(31,NULL,'ASVS_3.0.1_2.23','Verify that account lockout is divided into soft and hard lock status, and these are not mutually exclusive. If an account is temporarily soft locked out due to a brute force attack, this should not reset the hard lock status.',220,'',2),(32,NULL,'ASVS_3.0.1_2.24','Verify that if shared knowledge based questions (also known as \'secret questions\') are required, the questions do not violate privacy laws and are sufficiently strong to protect accounts from malicious recovery. ',230,'',2),(33,NULL,'ASVS_3.0.1_2.25','Verify that the system can be configured to disallow the use of a configurable number of previous passwords.',240,'',2),(34,NULL,'ASVS_3.0.1_2.26','Verify that risk based re-authentication, two factor or transaction signing is in place for high value transactions.',250,'',2),(35,NULL,'ASVS_3.0.1_2.27','Verify that measures are in place to block the use of commonly chosen passwords and weak passphrases.',260,'',2),(36,NULL,'ASVS_3.0.1_2.28','Verify that all authentication challenges, whether successful or failed, should respond in the same average response time.',270,'',2),(37,NULL,'ASVS_3.0.1_2.29','Verify that secrets, API keys, and passwords are not included in the source code, or online source code repositories.',280,'',2),(38,NULL,'ASVS_3.0.1_2.31','Verify that if an application allows users to authenticate, they can authenticate using two-factor authentication or other strong authentication, or any similar scheme that provides protection against username + password disclosure.',310,'',2),(39,NULL,'ASVS_3.0.1_2.32','Verify that administrative interfaces are not accessible to untrusted parties.',310,'',2),(40,NULL,'ASVS_3.0.1_2.33','Browser autocomplete, and integration with password managers are permitted unless prohibited by risk based policy.',320,'',2),(41,NULL,'ASVS_3.0.1_3.1','Verify that there is no custom session manager, or that the custom session manager is resistant against all common session management attacks.',0,'',3),(42,NULL,'ASVS_3.0.1_3.2','Verify that sessions are invalidated when the user logs out.',10,'',3),(43,NULL,'ASVS_3.0.1_3.3','Verify that sessions timeout after a specified period of inactivity.',20,'',3),(44,NULL,'ASVS_3.0.1_3.4','Verify that sessions timeout after an administratively-configurable maximum time period regardless of activity (an absolute timeout).',30,'',3),(45,NULL,'ASVS_3.0.1_3.5','Verify that all pages that require authentication have easy and visible access to logout functionality.',40,'',3),(46,NULL,'ASVS_3.0.1_3.6','Verify that the session id is never disclosed in URLs, error messages, or logs. This includes verifying that the application does not support URL rewriting of session cookies.',50,'',3),(47,NULL,'ASVS_3.0.1_3.7','Verify that all successful authentication and re-authentication generates a new session and session id.',60,'',3),(48,NULL,'ASVS_3.0.1_3.10','Verify that only session ids generated by the application framework are recognized as active by the application.',90,'',3),(49,NULL,'ASVS_3.0.1_3.11','Verify that session ids are sufficiently long, random and unique across the correct active session base.',100,'',3),(50,NULL,'ASVS_3.0.1_3.12','Verify that session ids stored in cookies have their path set to an appropriately restrictive value for the application, and authentication session tokens additionally set the \'HttpOnly\' and \'secure\' attributes',110,'',3),(51,NULL,'ASVS_3.0.1_3.16','Verify that the application limits the number of active concurrent sessions.',150,'',3),(52,NULL,'ASVS_3.0.1_3.17','Verify that an active session list is displayed in the account profile or similar of each user. The user should be able to terminate any active session.',160,'',3),(53,NULL,'ASVS_3.0.1_3.18','Verify the user is prompted with the option to terminate all other active sessions after a successful change password process.',170,'',3),(54,NULL,'ASVS_3.0.1_4.1','Verify that the principle of least privilege exists - users should only be able to access functions, data files, URLs, controllers, services, and other resources, for which they possess specific authorization. This implies protection against spoofing and elevation of privilege.',0,'',4),(55,NULL,'ASVS_3.0.1_4.4','Verify that access to sensitive records is protected, such that only authorized objects or data is accessible to each user (for example, protect against users tampering with a parameter to see or alter another user\'s account).',30,'',4),(56,NULL,'ASVS_3.0.1_4.5','Verify that directory browsing is disabled unless deliberately desired. Additionally, applications should not allow discovery or disclosure of file or directory metadata, such as Thumbs.db, .DS_Store, .git or .svn folders.',40,'',4),(57,NULL,'ASVS_3.0.1_4.8','Verify that access controls fail securely.',50,'',4),(58,NULL,'ASVS_3.0.1_4.9','Verify that the same access control rules implied by the presentation layer are enforced on the server side.',80,'',4),(59,NULL,'ASVS_3.0.1_4.10','Verify that all user and data attributes and policy information used by access controls cannot be manipulated by end users unless specifically authorized.',90,'',4),(60,NULL,'ASVS_3.0.1_4.11','Verify that there is a centralized mechanism (including libraries that call external authorization services) for protecting access to each type of protected resource.',100,'',4),(61,NULL,'ASVS_3.0.1_4.12','Verify that all access control decisions can be logged and all failed decisions are logged.',110,'',4),(62,NULL,'ASVS_3.0.1_4.13','Verify that the application or framework uses strong random anti-CSRF tokens or has another transaction protection mechanism.',120,'',4),(63,NULL,'ASVS_3.0.1_4.14','Verify the system can protect against aggregate or continuous access of secured functions, resources, or data. For example, consider the use of a resource governor to limit the number of edits per hour or to prevent the entire database from being scraped by an individual user.',130,'',4),(64,NULL,'ASVS_3.0.1_4.15','Verify the application has additional authorization (such as step up or adaptive authentication) for lower value systems, and / or segregation of duties for high value applications to enforce anti-fraud controls as per the risk of application and past fraud.',140,'',4),(65,NULL,'ASVS_3.0.1_4.16','Verify that the application correctly enforces context-sensitive authorisation so as to not allow unauthorised manipulation by means of parameter tampering.',150,'',4),(66,NULL,'ASVS_3.0.1_5.1','Verify that the runtime environment is not susceptible to buffer overflows, or that security controls prevent buffer overflows.',0,'',5),(67,NULL,'ASVS_3.0.1_5.3','Verify that server side input validation failures result in request rejection and are logged.',20,'',5),(68,NULL,'ASVS_3.0.1_5.5','Verify that input validation routines are enforced on the server side.',40,'',5),(69,NULL,'ASVS_3.0.1_5.6','Verify that a single input validation control is used by the application for each type of data that is accepted.',50,'',5),(70,NULL,'ASVS_3.0.1_5.10','Verify that all SQL queries, HQL, OSQL, NOSQL and stored procedures, calling of stored procedures are protected by the use of prepared statements or query parameterization, and thus not susceptible to SQL injection',90,'',5),(71,NULL,'ASVS_3.0.1_5.11','Verify that the application is not susceptible to LDAP Injection, or that security controls prevent LDAP Injection.',100,'',5),(72,NULL,'ASVS_3.0.1_5.12','Verify that the application is not susceptible to OS Command Injection, or that security controls prevent OS Command Injection.',110,'',5),(73,NULL,'ASVS_3.0.1_5.13','Verify that the application is not susceptible to Remote File Inclusion (RFI) or Local File Inclusion (LFI) when content is used that is a path to a file.',120,'',5),(74,NULL,'ASVS_3.0.1_5.14','Verify that the application is not susceptible to common XML attacks, such as XPath query tampering, XML External Entity attacks, and XML injection attacks.',130,'',5),(75,NULL,'ASVS_3.0.1_5.15','Ensure that all string variables placed into HTML or other web client code is either properly contextually encoded manually, or utilize templates that automatically encode contextually to ensure the application is not susceptible to reflected, stored and DOM Cross-Site Scripting (XSS) attacks.',140,'',5),(76,NULL,'ASVS_3.0.1_5.16','If the application framework allows automatic mass parameter assignment (also called automatic variable binding) from the inbound request to a model, verify that security sensitive fields such as “accountBalance”, “role” or “password” are protected from malicious automatic binding.',150,'',5),(77,NULL,'ASVS_3.0.1_5.17','Verify that the application has defenses against HTTP parameter pollution attacks, particularly if the application framework makes no distinction about the source of request parameters (GET, POST, cookies, headers, environment, etc.)',160,'',5),(78,NULL,'ASVS_3.0.1_5.18','Verify that client side validation is used as a second line of defense, in addition to server side validation.',170,'',5),(79,NULL,'ASVS_3.0.1_5.19','Verify that all input data is validated, not only HTML form fields but all sources of input such as REST calls, query parameters, HTTP headers, cookies, batch files, RSS feeds, etc; using positive validation (whitelisting), then lesser forms of validation such as greylisting (eliminating known bad strings), or rejecting bad inputs (blacklisting).',180,'',5),(80,NULL,'ASVS_3.0.1_5.20','Verify that structured data is strongly typed and validated against a defined schema including allowed characters, length and pattern (e.g. credit card numbers or telephone, or validating that two related fields are reasonable, such as validating suburbs and zip or post codes match).',190,'',5),(81,NULL,'ASVS_3.0.1_5.21','Verify that unstructured data is sanitized to enforce generic safety measures such as allowed characters and length, and characters potentially harmful in given context should be escaped (e.g. natural names with Unicode or apostrophes, such as mS or O\'Hara)',200,'',5),(82,NULL,'ASVS_3.0.1_5.22','Make sure untrusted HTML from WYSIWYG editors or similar are properly sanitized with an HTML sanitizer and handle it appropriately according to the input validation task and encoding task.',210,'',5),(83,NULL,'ASVS_3.0.1_5.23','For auto-escaping template technology, if UI escaping is disabled, ensure that HTML sanitization is enabled instead.',220,'',5),(84,NULL,'ASVS_3.0.1_5.24','Verify that data transferred from one DOM context to another, uses safe JavaScript methods, such as using .innerText and .val.',230,'',5),(85,NULL,'ASVS_3.0.1_5.25','Verify when parsing JSON in browsers, that JSON.parse is used to parse JSON on the client. Do not use eval() to parse JSON on the client.',240,'',5),(86,NULL,'ASVS_3.0.1_5.26','Verify that authenticated data is cleared from client storage, such as the browser DOM, after the session is terminated.',250,'',5),(87,NULL,'ASVS_3.0.1_7.2','Verify that all cryptographic modules fail securely, and errors are handled in a way that does not enable oracle padding.',10,'',6),(88,NULL,'ASVS_3.0.1_7.6','Verify that all random numbers, random file names, random GUIDs, and random strings are generated using the cryptographic module’s approved random number generator when these random values are intended to be not guessable by an attacker.',50,'',6),(89,NULL,'ASVS_3.0.1_7.7','Verify that cryptographic algorithms used by the application have been validated against FIPS 140-2 or an equivalent standard.',60,'',6),(90,NULL,'ASVS_3.0.1_7.8','Verify that cryptographic modules operate in their approved mode according to their published security policies.',70,'',6),(91,NULL,'ASVS_3.0.1_7.9','Verify that there is an explicit policy for how cryptographic keys are managed (e.g., generated, distributed, revoked, and expired). Verify that this key lifecycle is properly enforced.',80,'',6),(92,NULL,'ASVS_3.0.1_7.11','Verify that all consumers of cryptographic services do not have direct access to key material. Isolate cryptographic processes, including master secrets and consider the use of a virtualized or physical hardware key vault (HSM). ',100,'',6),(93,NULL,'ASVS_3.0.1_7.12','Personally Identifiable Information should be stored encrypted at rest and ensure that communication goes via protected channels.',110,'',6),(94,NULL,'ASVS_3.0.1_7.13','Verify that sensitive passwords or key material maintained in memory is overwritten with zeros as soon as it no longer required, to mitigate memory dumping attacks.',120,'',6),(95,NULL,'ASVS_3.0.1_7.14','Verify that all keys and passwords are replaceable, and are generated or replaced at installation time.',130,'',6),(96,NULL,'ASVS_3.0.1_7.15','Verify that random numbers are created with proper entropy even when the application is under heavy load, or that the application degrades gracefully in such circumstances.',140,'',6),(97,NULL,'ASVS_3.0.1_8.1','Verify that the application does not output error messages or stack traces containing sensitive data that could assist an attacker, including session id, software/framework versions and personal information',0,'',7),(98,NULL,'ASVS_3.0.1_8.2','Verify that error handling logic in security controls denies access by default.',10,'',7),(99,NULL,'ASVS_3.0.1_8.3','Verify security logging controls provide the ability to log success and particularly failure events that are identified as security-relevant.',20,'',7),(100,NULL,'ASVS_3.0.1_8.4','Verify that each log event includes necessary information that would allow for a detailed investigation of the timeline when an event happens.',30,'',7),(101,NULL,'ASVS_3.0.1_8.5','Verify that all events that include untrusted data will not execute as code in the intended log viewing software.',40,'',7),(102,NULL,'ASVS_3.0.1_8.6','Verify that security logs are protected from unauthorized access and modification.',50,'',7),(103,NULL,'ASVS_3.0.1_8.7','Verify that the application does not log sensitive data as defined under local privacy laws or regulations, organizational sensitive data as defined by a risk assessment, or sensitive authentication data that could assist an attacker, including user\'s session identifiers, passwords, hashes, or API tokens.',60,'',7),(104,NULL,'ASVS_3.0.1_8.8','Verify that all non-printable symbols and field separators are properly encoded in log entries, to prevent log injection.',70,'',7),(105,NULL,'ASVS_3.0.1_8.9','Verify that log fields from trusted and untrusted sources are distinguishable in log entries.',80,'',7),(106,NULL,'ASVS_3.0.1_8.10','Verify that an audit log or similar allows for non-repudiation of key transactions.',90,'',7),(107,NULL,'ASVS_3.0.1_8.11','Verify that security logs have some form of integrity checking or controls to prevent unauthorized modification.',100,'',7),(108,NULL,'ASVS_3.0.1_8.12','Verify that the logs are stored on a different partition than the application is running with proper log rotation.',110,'',7),(109,NULL,'ASVS_3.0.1_8.13','Time sources should be synchronized to ensure logs have the correct time',120,'',7),(110,NULL,'ASVS_3.0.1_9.1','Verify that all forms containing sensitive information have disabled client side caching, including autocomplete features.',0,'',8),(111,NULL,'ASVS_3.0.1_9.2','Verify that the list of sensitive data processed by the application is identified, and that there is an explicit policy for how access to this data must be controlled, encrypted and enforced under relevant data protection directives.',10,'',8),(112,NULL,'ASVS_3.0.1_9.3','Verify that all sensitive data is sent to the server in the HTTP message body or headers (i.e., URL parameters are never used to send sensitive data).',20,'',8),(113,NULL,'ASVS_3.0.1_9.4','Verify that the application sets appropriate anti-caching headers as per the risk of the application, such as the following:  Expires: Tue, 03 Jul 2001 06:00:00 GMT Last-Modified: {now} GMT Cache-Control: no-store, no-cache, must-revalidate, max-age=0 Cache-Control: post-check=0, pre-check=0 Pragma: no-cache',30,'',8),(114,NULL,'ASVS_3.0.1_9.5','Verify that on the server, all cached or temporary copies of sensitive data stored are protected from unauthorized access or purged/invalidated after the authorized user accesses the sensitive data.',40,'',8),(115,NULL,'ASVS_3.0.1_9.6','Verify that there is a method to remove each type of sensitive data from the application at the end of the required retention policy.',50,'',8),(116,NULL,'ASVS_3.0.1_9.7','Verify the application minimizes the number of parameters in a request, such as hidden fields, Ajax variables, cookies and header values.',60,'',8),(117,NULL,'ASVS_3.0.1_9.8','Verify the application has the ability to detect and alert on abnormal numbers of requests for data harvesting for an example screen scraping.',70,'',8),(118,NULL,'ASVS_3.0.1_9.9','Verify that data stored in client side storage (such as HTML5 local storage, session storage, IndexedDB, regular cookies or Flash cookies) does not contain sensitive data or PII.',80,'',8),(119,NULL,'ASVS_3.0.1_9.10','Verify accessing sensitive data is logged, if the data is collected under relevant data protection directives or where logging of accesses is required.',90,'',8),(120,NULL,'ASVS_3.0.1_9.11','Verify that sensitive information maintained in memory is overwritten with zeros as soon as it no longer required, to mitigate memory dumping attacks.',100,'',8),(121,NULL,'ASVS_3.0.1_10.1','Verify that a path can be built from a trusted CA to each Transport Layer Security (TLS) server certificate, and that each server certificate is valid.',0,'',9),(122,NULL,'ASVS_3.0.1_10.3','Verify that TLS is used for all connections (including both external and backend connections) that are authenticated or that involve sensitive data or functions, and does not fall back to insecure or unencrypted protocols. Ensure the strongest alternative is the preferred algorithm.',20,'',9),(123,NULL,'ASVS_3.0.1_10.4','Verify that backend TLS connection failures are logged.',30,'',9),(124,NULL,'ASVS_3.0.1_10.5','Verify that certificate paths are built and verified for all client certificates using configured trust anchors and revocation information.',40,'',9),(125,NULL,'ASVS_3.0.1_10.6','Verify that all connections to external systems that involve sensitive information or functions are authenticated.',50,'',9),(126,NULL,'ASVS_3.0.1_10.8','Verify that there is a single standard TLS implementation that is used by the application that is configured to operate in an approved mode of operation.',70,'',9),(127,NULL,'ASVS_3.0.1_10.10','Verify that TLS certificate public key pinning (HPKP) is implemented with production and backup public keys. For more information, please see the references below. ',90,'',9),(128,NULL,'ASVS_3.0.1_10.11','Verify that HTTP Strict Transport Security headers are included on all requests and for all subdomains, such as Strict-Transport-Security: max-age=15724800; includeSubdomains',100,'',9),(129,NULL,'ASVS_3.0.1_10.12','Verify that production website URL has been submitted to preloaded list of Strict Transport Security domains maintained by web browser vendors. Please see the references below.',110,'',9),(130,NULL,'ASVS_3.0.1_10.13','Ensure forward secrecy ciphers are in use to mitigate passive attackers recording traffic.',120,'',9),(131,NULL,'ASVS_3.0.1_10.14','Verify that proper certification revocation, such as Online Certificate Status Protocol (OCSP) Stapling, is enabled and configured.',130,'',9),(132,NULL,'ASVS_3.0.1_10.15','Verify that only strong algorithms, ciphers, and protocols are used, through all the certificate hierarchy, including root and intermediary certificates of your selected certifying authority.',140,'',9),(133,NULL,'ASVS_3.0.1_10.16','Verify that the TLS settings are in line with current leading practice, particularly as common configurations, ciphers, and algorithms become insecure.',150,'',9),(134,NULL,'ASVS_3.0.1_11.1','Verify that the application accepts only a defined set of required HTTP request methods, such as GET and POST are accepted, and unused methods (e.g. TRACE, PUT, and DELETE) are explicitly blocked.',0,'',10),(135,NULL,'ASVS_3.0.1_11.2','Verify that every HTTP response contains a content type header specifying a safe character set (e.g., UTF-8, ISO 8859-1).',10,'',10),(136,NULL,'ASVS_3.0.1_11.3','Verify that HTTP headers added by a trusted proxy or SSO devices, such as a bearer token, are authenticated by the application.',20,'',10),(137,NULL,'ASVS_3.0.1_11.4','Verify that a suitable X-FRAME-OPTIONS header is in use for sites where content should not be viewed in a 3rd-party X-Frame.',30,'',10),(138,NULL,'ASVS_3.0.1_11.5','Verify that the HTTP headers or any part of the HTTP response do not expose detailed version information of system components.',40,'',10),(139,NULL,'ASVS_3.0.1_11.6','Verify that all API responses contain X-Content-Type-Options: nosniff and Content-Disposition: attachment; filename=\'api.json\' (or other appropriate filename for the content type).',50,'',10),(140,NULL,'ASVS_3.0.1_11.7','Verify that a content security policy (CSPv2) is in place that helps mitigate common DOM, XSS, JSON, and JavaScript injection vulnerabilities.',60,'',10),(141,NULL,'ASVS_3.0.1_11.8','Verify that the X-XSS-Protection: 1; mode=block header is in place to enable browser reflected XSS filters.',70,'',10),(142,NULL,'ASVS_3.0.1_13.1','Verify all malicious activity is adequately sandboxed, containerized or isolated to delay and deter attackers from attacking other applications.',0,'',11),(143,NULL,'ASVS_3.0.1_13.2','Verify that the application source code, and as many third party libraries as possible, does not contain back doors, Easter eggs, and logic flaws in authentication, access control, input validation, and the business logic of high value transactions.',10,'',11),(144,NULL,'ASVS_3.0.1_15.1','Verify the application will only process business logic flows in sequential step order, with all steps being processed in realistic human time, and not process out of order, skipped steps, process steps from another user, or too quickly submitted transactions.',0,'',12),(145,NULL,'ASVS_3.0.1_15.2','Verify the application has business limits and correctly enforces on a per user basis, with configurable alerting and automated reactions to automated or unusual attack.',10,'',12),(146,NULL,'ASVS_3.0.1_16.1','Verify that URL redirects and forwards only allow whitelisted destinations, or show a warning when redirecting to potentially untrusted content.',0,'',13),(147,NULL,'ASVS_3.0.1_16.2','Verify that untrusted file data submitted to the application is not used directly with file I/O commands, particularly to protect against path traversal, local file include, file mime type, and OS command injection vulnerabilities.',10,'',13),(148,NULL,'ASVS_3.0.1_16.3','Verify that files obtained from untrusted sources are validated to be of expected type and scanned by antivirus scanners to prevent upload of known malicious content.',20,'',13),(149,NULL,'ASVS_3.0.1_16.4','Verify that untrusted data is not used within inclusion, class loader, or reflection capabilities to prevent remote/local file inclusion vulnerabilities.',30,'',13),(150,NULL,'ASVS_3.0.1_16.5','Verify that untrusted data is not used within cross-domain resource sharing (CORS) to protect against arbitrary remote content.',40,'',13),(151,NULL,'ASVS_3.0.1_16.6','Verify that files obtained from untrusted sources are stored outside the webroot, with limited permissions, preferably with strong validation.',50,'',13),(152,NULL,'ASVS_3.0.1_16.7','Verify that the web or application server is configured by default to deny access to remote resources or systems outside the web or application server.',60,'',13),(153,NULL,'ASVS_3.0.1_16.8','Verify the application code does not execute uploaded data obtained from untrusted sources.',70,'',13),(154,NULL,'ASVS_3.0.1_16.9','Do not use Flash, Active-X, Silverlight, NACL, client-side Java or other client side technologies not supported natively via W3C browser standards.',80,'',13),(155,NULL,'ASVS_3.0.1_17.1','Verify that ID values stored on the device and retrievable by other applications, such as the UDID or IMEI number are not used as authentication tokens.',0,'',14),(156,NULL,'ASVS_3.0.1_17.2','Verify that the mobile app does not store sensitive data onto potentially unencrypted shared resources on the device (e.g. SD card or shared folders).',10,'',14),(157,NULL,'ASVS_3.0.1_17.3','Verify that sensitive data is not stored unprotected on the device, even in system protected areas such as key chains.',20,'',14),(158,NULL,'ASVS_3.0.1_17.4','Verify that secret keys, API tokens, or passwords are dynamically generated in mobile applications.',30,'',14),(159,NULL,'ASVS_3.0.1_17.5','Verify that the mobile app prevents leaking of sensitive information (for example, screenshots are saved of the current application as the application is backgrounded or writing sensitive information in console).',40,'',14),(160,NULL,'ASVS_3.0.1_17.6','Verify that the application is requesting minimal permissions for required functionality and resources.',50,'',14),(161,NULL,'ASVS_3.0.1_17.7','Verify that the application sensitive code is laid out unpredictably in memory (For example ASLR).',60,'',14),(162,NULL,'ASVS_3.0.1_17.8','Verify that there are anti-debugging techniques present that are sufficient enough to deter or delay likely attackers from injecting debuggers into the mobile app (For example GDB).',70,'',14),(163,NULL,'ASVS_3.0.1_17.9','Verify that the app does not export sensitive activities, intents, or content providers for other mobile apps on the same device to exploit.',80,'',14),(164,NULL,'ASVS_3.0.1_17.10','Verify that sensitive information maintained in memory is overwritten with zeros as soon as it no longer required, to mitigate memory dumping attacks.',90,'',14),(165,NULL,'ASVS_3.0.1_17.11','Verify that the app validates input to exported activities, intents, or content providers..',100,'',14),(166,NULL,'ASVS_3.0.1_18.1','Verify that the same encoding style is used between the client and the server.',0,'',15),(167,NULL,'ASVS_3.0.1_18.2','Verify that access to administration and management functions within the Web Service Application is limited to web service administrators.',10,'',15),(168,NULL,'ASVS_3.0.1_18.3','Verify that XML or JSON schema is in place and verified before accepting input.',20,'',15),(169,NULL,'ASVS_3.0.1_18.4','Verify that all input is limited to an appropriate size limit.',30,'',15),(170,NULL,'ASVS_3.0.1_18.5','Verify that SOAP based web services are compliant with Web Services-Interoperability (WS-I) Basic Profile at minimum. This essentially means TLS encryption.',40,'',15),(171,NULL,'ASVS_3.0.1_18.6','Verify the use of session-based authentication and authorization. Please refer to sections 2, 3 and 4 for further guidance. Avoid the use of static \'API keys\' and similar.',50,'',15),(172,NULL,'ASVS_3.0.1_18.7','Verify that the REST service is protected from Cross-Site Request Forgery via the use of at least one or more of the following: ORIGIN checks, double submit cookie pattern, CSRF nonces, and referrer checks.',60,'',15),(173,NULL,'ASVS_3.0.1_18.8','Verify the REST service explicitly check the incoming Content-Type to be the expected one, such as application/xml or application/json.',70,'',15),(174,NULL,'ASVS_3.0.1_18.9','Verify that the message payload is signed to ensure reliable transport between client and service, using JSON Web Signing or WS-Security for SOAP requests.',80,'',15),(175,NULL,'ASVS_3.0.1_18.10','Verify that alternative and less secure access paths do not exist.',90,'',15),(176,NULL,'ASVS_3.0.1_19.1','All components should be up to date with proper security configuration(s) and version(s). This should include removal of unneeded configurations and folders such as sample applications, platform documentation, and default or example users.',0,'',16),(177,NULL,'ASVS_3.0.1_19.2','Communications between components, such as between the application server and the database server, should be encrypted, particularly when the components are in different containers or on different systems.',10,'',16),(178,NULL,'ASVS_3.0.1_19.3','Communications between components, such as between the application server and the database server should be authenticated using an account with the least necessary privileges.',20,'',16),(179,NULL,'ASVS_3.0.1_19.4','Verify application deployments are adequately sandboxed, containerized or isolated to delay and deter attackers from attacking other applications.',30,'',16),(180,NULL,'ASVS_3.0.1_19.5','Verify that the application build and deployment processes are performed in a secure fashion.',40,'',16),(181,NULL,'ASVS_3.0.1_19.6','Verify that authorised administrators have the capability to verify the integrity of all security-relevant configurations to ensure that they have not been tampered with.',50,'',16),(182,NULL,'ASVS_3.0.1_19.7','Verify that all application components are signed.',60,'',16),(183,NULL,'ASVS_3.0.1_19.8','Verify that third party components come from trusted repositories.',70,'',16),(184,NULL,'ASVS_3.0.1_19.9','Verify that build processes for system level languages have all security flags enabled, such as ASLR, DEP, and security checks.',80,'',16),(185,NULL,'ASVS_3.0.1_19.10','Verify that all application assets are hosted by the application, such as JavaScript libraries, CSS stylesheets and web fonts are hosted by the application rather than rely on a CDN or external provider.',90,'',16);
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
INSERT INTO `REQUIREMENTSKELETON_COLLECTIONINSTANCE` VALUES (1,1),(1,12),(1,13),(1,16),(1,17),(1,18),(1,20),(1,21),(1,24),(1,25),(1,26),(1,27),(1,28),(1,30),(1,32),(1,35),(1,39),(1,40),(1,41),(1,42),(1,43),(1,45),(1,46),(1,47),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,62),(1,65),(1,66),(1,67),(1,68),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,82),(1,87),(1,89),(1,97),(1,106),(1,109),(1,110),(1,112),(1,113),(1,118),(1,121),(1,122),(1,128),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,138),(1,139),(1,140),(1,141),(1,146),(1,147),(1,148),(1,149),(1,150),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,161),(1,163),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,176),(2,1),(2,2),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,16),(2,17),(2,18),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,61),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,70),(2,71),(2,72),(2,73),(2,74),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(2,86),(2,87),(2,88),(2,89),(2,91),(2,93),(2,94),(2,95),(2,97),(2,98),(2,99),(2,100),(2,101),(2,102),(2,103),(2,106),(2,109),(2,110),(2,112),(2,113),(2,114),(2,116),(2,118),(2,119),(2,120),(2,121),(2,122),(2,125),(2,127),(2,128),(2,130),(2,131),(2,132),(2,133),(2,134),(2,135),(2,136),(2,137),(2,138),(2,139),(2,140),(2,141),(2,144),(2,145),(2,146),(2,147),(2,148),(2,149),(2,150),(2,151),(2,152),(2,153),(2,154),(2,155),(2,156),(2,157),(2,158),(2,159),(2,160),(2,161),(2,163),(2,164),(2,165),(2,166),(2,167),(2,168),(2,169),(2,170),(2,171),(2,172),(2,173),(2,174),(2,175),(2,176),(2,177),(2,178),(2,179),(2,180),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,16),(3,17),(3,18),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90),(3,91),(3,92),(3,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110),(3,111),(3,112),(3,113),(3,114),(3,115),(3,116),(3,117),(3,118),(3,119),(3,120),(3,121),(3,122),(3,123),(3,124),(3,125),(3,126),(3,127),(3,128),(3,129),(3,130),(3,131),(3,132),(3,133),(3,134),(3,135),(3,136),(3,137),(3,138),(3,139),(3,140),(3,141),(3,142),(3,143),(3,144),(3,145),(3,146),(3,147),(3,148),(3,149),(3,150),(3,151),(3,152),(3,153),(3,154),(3,155),(3,156),(3,157),(3,158),(3,159),(3,160),(3,161),(3,162),(3,163),(3,164),(3,165),(3,166),(3,167),(3,168),(3,169),(3,170),(3,171),(3,172),(3,173),(3,174),(3,175),(3,176),(3,177),(3,178),(3,179),(3,180),(3,181),(3,182),(3,183),(3,184),(3,185),(4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,12),(4,13),(4,16),(4,17),(4,18),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,59),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,69),(4,70),(4,71),(4,72),(4,73),(4,74),(4,75),(4,76),(4,77),(4,78),(4,79),(4,80),(4,81),(4,82),(4,83),(4,84),(4,85),(4,86),(4,87),(4,88),(4,89),(4,90),(4,91),(4,92),(4,93),(4,94),(4,95),(4,96),(4,97),(4,98),(4,99),(4,100),(4,101),(4,102),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,109),(4,110),(4,111),(4,112),(4,113),(4,114),(4,115),(4,116),(4,117),(4,118),(4,119),(4,120),(4,121),(4,122),(4,123),(4,124),(4,125),(4,126),(4,127),(4,128),(4,129),(4,130),(4,131),(4,132),(4,133),(4,134),(4,135),(4,136),(4,137),(4,138),(4,139),(4,140),(4,141),(4,142),(4,143),(4,144),(4,145),(4,146),(4,147),(4,148),(4,149),(4,150),(4,151),(4,152),(4,153),(4,154),(4,176),(4,177),(4,178),(4,179),(4,180),(4,181),(4,182),(4,183),(4,184),(4,185),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,11),(5,12),(5,13),(5,16),(5,17),(5,18),(5,20),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,27),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,54),(5,55),(5,56),(5,57),(5,58),(5,59),(5,60),(5,61),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(5,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,76),(5,77),(5,78),(5,79),(5,80),(5,81),(5,82),(5,83),(5,84),(5,85),(5,86),(5,87),(5,88),(5,89),(5,90),(5,91),(5,92),(5,93),(5,94),(5,95),(5,96),(5,97),(5,98),(5,99),(5,100),(5,101),(5,102),(5,103),(5,104),(5,105),(5,106),(5,107),(5,108),(5,109),(5,110),(5,111),(5,112),(5,113),(5,114),(5,115),(5,116),(5,117),(5,118),(5,119),(5,120),(5,121),(5,122),(5,123),(5,124),(5,125),(5,126),(5,127),(5,128),(5,129),(5,130),(5,131),(5,132),(5,133),(5,134),(5,135),(5,136),(5,137),(5,138),(5,139),(5,140),(5,141),(5,142),(5,143),(5,144),(5,145),(5,146),(5,147),(5,148),(5,149),(5,150),(5,151),(5,152),(5,153),(5,154),(5,166),(5,167),(5,168),(5,169),(5,170),(5,171),(5,172),(5,173),(5,174),(5,175),(5,176),(5,177),(5,178),(5,179),(5,180),(5,181),(5,182),(5,183),(5,184),(5,185),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,9),(6,10),(6,11),(6,12),(6,13),(6,16),(6,17),(6,18),(6,20),(6,21),(6,22),(6,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(6,30),(6,31),(6,32),(6,33),(6,34),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(6,48),(6,49),(6,50),(6,51),(6,52),(6,53),(6,54),(6,55),(6,56),(6,57),(6,58),(6,59),(6,60),(6,61),(6,62),(6,63),(6,64),(6,65),(6,66),(6,69),(6,70),(6,71),(6,72),(6,73),(6,74),(6,76),(6,77),(6,78),(6,79),(6,80),(6,81),(6,86),(6,87),(6,88),(6,89),(6,90),(6,91),(6,92),(6,93),(6,94),(6,95),(6,96),(6,97),(6,98),(6,99),(6,100),(6,101),(6,102),(6,103),(6,104),(6,105),(6,106),(6,107),(6,108),(6,109),(6,110),(6,111),(6,112),(6,114),(6,115),(6,116),(6,117),(6,118),(6,119),(6,120),(6,121),(6,122),(6,123),(6,124),(6,125),(6,126),(6,127),(6,129),(6,130),(6,131),(6,132),(6,133),(6,134),(6,135),(6,136),(6,138),(6,139),(6,142),(6,143),(6,144),(6,145),(6,147),(6,148),(6,149),(6,151),(6,153),(6,155),(6,156),(6,157),(6,158),(6,159),(6,160),(6,161),(6,162),(6,163),(6,164),(6,165),(6,176),(6,177),(6,178),(6,179),(6,180),(6,181),(6,182),(6,183),(6,184),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),(7,8),(7,9),(7,10),(7,11),(7,30),(7,31),(7,34),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(7,42),(7,43),(7,44),(7,45),(7,46),(7,47),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,54),(7,55),(7,56),(7,57),(7,58),(7,59),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68),(7,69),(7,70),(7,71),(7,72),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,80),(7,81),(7,82),(7,83),(7,84),(7,85),(7,86),(7,87),(7,88),(7,89),(7,90),(7,91),(7,92),(7,93),(7,94),(7,95),(7,96),(7,97),(7,98),(7,99),(7,100),(7,101),(7,102),(7,103),(7,104),(7,105),(7,106),(7,107),(7,108),(7,109),(7,110),(7,111),(7,112),(7,113),(7,114),(7,115),(7,116),(7,117),(7,118),(7,119),(7,120),(7,121),(7,122),(7,123),(7,124),(7,125),(7,126),(7,127),(7,128),(7,129),(7,130),(7,131),(7,132),(7,133),(7,134),(7,135),(7,136),(7,137),(7,138),(7,139),(7,140),(7,141),(7,142),(7,143),(7,144),(7,145),(7,146),(7,147),(7,148),(7,149),(7,150),(7,151),(7,152),(7,153),(7,154),(7,155),(7,156),(7,157),(7,158),(7,159),(7,160),(7,161),(7,162),(7,163),(7,164),(7,165),(7,166),(7,167),(7,168),(7,169),(7,170),(7,171),(7,172),(7,173),(7,174),(7,175),(7,176),(7,177),(7,178),(7,179),(7,180),(7,181),(7,182),(7,183),(7,184),(7,185),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,30),(8,31),(8,34),(8,36),(8,37),(8,38),(8,39),(8,40),(8,41),(8,42),(8,43),(8,44),(8,45),(8,46),(8,47),(8,48),(8,49),(8,50),(8,51),(8,52),(8,53),(8,54),(8,55),(8,56),(8,57),(8,58),(8,59),(8,60),(8,61),(8,62),(8,63),(8,64),(8,65),(8,66),(8,67),(8,68),(8,69),(8,70),(8,71),(8,72),(8,73),(8,74),(8,75),(8,76),(8,77),(8,78),(8,79),(8,80),(8,81),(8,82),(8,83),(8,84),(8,85),(8,86),(8,87),(8,88),(8,89),(8,90),(8,91),(8,92),(8,93),(8,94),(8,95),(8,96),(8,97),(8,98),(8,99),(8,100),(8,101),(8,102),(8,103),(8,104),(8,105),(8,106),(8,107),(8,108),(8,109),(8,110),(8,111),(8,112),(8,113),(8,114),(8,115),(8,116),(8,117),(8,118),(8,119),(8,120),(8,121),(8,122),(8,123),(8,124),(8,125),(8,126),(8,127),(8,128),(8,129),(8,130),(8,131),(8,132),(8,133),(8,134),(8,135),(8,136),(8,137),(8,138),(8,139),(8,140),(8,141),(8,142),(8,143),(8,144),(8,145),(8,146),(8,147),(8,148),(8,149),(8,150),(8,151),(8,152),(8,153),(8,154),(8,155),(8,156),(8,157),(8,158),(8,159),(8,160),(8,161),(8,162),(8,163),(8,164),(8,165),(8,166),(8,167),(8,168),(8,169),(8,170),(8,171),(8,172),(8,173),(8,174),(8,175),(8,176),(8,177),(8,178),(8,179),(8,180),(8,181),(8,182),(8,183),(8,184),(8,185),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,12),(9,13),(9,16),(9,17),(9,18),(9,20),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,31),(9,32),(9,33),(9,34),(9,35),(9,36),(9,37),(9,38),(9,39),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(9,47),(9,48),(9,49),(9,50),(9,51),(9,52),(9,53),(9,54),(9,55),(9,56),(9,57),(9,58),(9,59),(9,60),(9,61),(9,62),(9,63),(9,64),(9,65),(9,66),(9,67),(9,68),(9,69),(9,70),(9,71),(9,72),(9,73),(9,74),(9,75),(9,76),(9,77),(9,78),(9,79),(9,80),(9,81),(9,82),(9,83),(9,84),(9,85),(9,86),(9,87),(9,88),(9,89),(9,90),(9,91),(9,92),(9,93),(9,94),(9,95),(9,96),(9,97),(9,98),(9,99),(9,100),(9,101),(9,102),(9,103),(9,104),(9,105),(9,106),(9,107),(9,108),(9,109),(9,110),(9,111),(9,112),(9,113),(9,114),(9,115),(9,116),(9,117),(9,118),(9,119),(9,120),(9,121),(9,122),(9,123),(9,124),(9,125),(9,126),(9,127),(9,128),(9,129),(9,130),(9,131),(9,132),(9,133),(9,134),(9,135),(9,136),(9,137),(9,138),(9,139),(9,140),(9,141),(9,142),(9,143),(9,144),(9,145),(9,146),(9,147),(9,148),(9,149),(9,150),(9,151),(9,152),(9,153),(9,154),(9,155),(9,156),(9,157),(9,158),(9,159),(9,160),(9,161),(9,162),(9,163),(9,164),(9,165),(9,166),(9,167),(9,168),(9,169),(9,170),(9,171),(9,172),(9,173),(9,174),(9,175),(9,176),(9,177),(9,178),(9,179),(9,180),(9,181),(9,182),(9,183),(9,184),(9,185),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,11),(10,12),(10,13),(10,16),(10,17),(10,18),(10,20),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(10,36),(10,37),(10,38),(10,39),(10,40),(10,41),(10,42),(10,43),(10,44),(10,45),(10,46),(10,47),(10,48),(10,49),(10,50),(10,51),(10,52),(10,53),(10,54),(10,55),(10,56),(10,57),(10,58),(10,59),(10,60),(10,61),(10,62),(10,63),(10,64),(10,65),(10,66),(10,67),(10,68),(10,69),(10,70),(10,71),(10,72),(10,73),(10,74),(10,75),(10,76),(10,77),(10,78),(10,79),(10,80),(10,81),(10,82),(10,83),(10,84),(10,85),(10,86),(10,87),(10,88),(10,89),(10,90),(10,91),(10,92),(10,93),(10,94),(10,95),(10,96),(10,97),(10,98),(10,99),(10,100),(10,101),(10,102),(10,103),(10,104),(10,105),(10,106),(10,107),(10,108),(10,109),(10,110),(10,111),(10,112),(10,113),(10,114),(10,115),(10,116),(10,117),(10,118),(10,119),(10,120),(10,121),(10,122),(10,123),(10,124),(10,125),(10,126),(10,127),(10,128),(10,129),(10,130),(10,131),(10,132),(10,133),(10,134),(10,135),(10,136),(10,137),(10,138),(10,139),(10,140),(10,141),(10,142),(10,143),(10,144),(10,145),(10,146),(10,147),(10,148),(10,149),(10,150),(10,151),(10,152),(10,153),(10,154),(10,155),(10,156),(10,157),(10,158),(10,159),(10,160),(10,161),(10,162),(10,163),(10,164),(10,165),(10,166),(10,167),(10,168),(10,169),(10,170),(10,171),(10,172),(10,173),(10,174),(10,175),(10,176),(10,177),(10,178),(10,179),(10,180),(10,181),(10,182),(10,183),(10,184),(10,185),(11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(11,12),(11,13),(11,16),(11,17),(11,18),(11,20),(11,21),(11,22),(11,23),(11,24),(11,25),(11,26),(11,27),(11,28),(11,29),(11,30),(11,31),(11,32),(11,33),(11,34),(11,35),(11,36),(11,37),(11,38),(11,39),(11,40),(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(11,47),(11,48),(11,49),(11,50),(11,51),(11,52),(11,53),(11,54),(11,55),(11,56),(11,57),(11,58),(11,59),(11,60),(11,61),(11,62),(11,63),(11,64),(11,65),(11,66),(11,67),(11,68),(11,69),(11,70),(11,71),(11,72),(11,73),(11,74),(11,75),(11,76),(11,77),(11,78),(11,79),(11,80),(11,81),(11,82),(11,83),(11,84),(11,85),(11,86),(11,87),(11,88),(11,89),(11,90),(11,91),(11,92),(11,93),(11,94),(11,95),(11,96),(11,97),(11,98),(11,99),(11,100),(11,101),(11,102),(11,103),(11,104),(11,105),(11,106),(11,107),(11,108),(11,109),(11,110),(11,111),(11,112),(11,113),(11,114),(11,115),(11,116),(11,117),(11,118),(11,119),(11,120),(11,121),(11,122),(11,123),(11,124),(11,125),(11,126),(11,127),(11,128),(11,129),(11,130),(11,131),(11,132),(11,133),(11,134),(11,135),(11,136),(11,137),(11,138),(11,139),(11,140),(11,141),(11,142),(11,143),(11,144),(11,145),(11,146),(11,147),(11,148),(11,149),(11,150),(11,151),(11,152),(11,153),(11,154),(11,155),(11,156),(11,157),(11,158),(11,159),(11,160),(11,161),(11,162),(11,163),(11,164),(11,165),(11,166),(11,167),(11,168),(11,169),(11,170),(11,171),(11,172),(11,173),(11,174),(11,175),(11,176),(11,177),(11,178),(11,179),(11,180),(11,181),(11,182),(11,183),(11,184),(11,185),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(12,12),(12,13),(12,16),(12,17),(12,18),(12,20),(12,21),(12,22),(12,23),(12,24),(12,25),(12,26),(12,27),(12,28),(12,29),(12,30),(12,31),(12,32),(12,33),(12,34),(12,35),(12,36),(12,37),(12,38),(12,39),(12,40),(12,41),(12,54),(12,55),(12,56),(12,57),(12,58),(12,59),(12,60),(12,61),(12,62),(12,63),(12,64),(12,65),(12,66),(12,67),(12,68),(12,69),(12,70),(12,71),(12,72),(12,73),(12,74),(12,75),(12,76),(12,77),(12,78),(12,79),(12,80),(12,81),(12,82),(12,83),(12,84),(12,85),(12,86),(12,87),(12,88),(12,89),(12,90),(12,91),(12,92),(12,93),(12,94),(12,95),(12,96),(12,97),(12,98),(12,99),(12,100),(12,101),(12,102),(12,103),(12,104),(12,105),(12,106),(12,107),(12,108),(12,109),(12,110),(12,111),(12,112),(12,113),(12,114),(12,115),(12,116),(12,117),(12,118),(12,119),(12,120),(12,121),(12,122),(12,123),(12,124),(12,125),(12,126),(12,127),(12,128),(12,129),(12,130),(12,131),(12,132),(12,133),(12,134),(12,135),(12,136),(12,137),(12,138),(12,139),(12,140),(12,141),(12,142),(12,143),(12,144),(12,145),(12,146),(12,147),(12,148),(12,149),(12,150),(12,151),(12,152),(12,153),(12,154),(12,155),(12,156),(12,157),(12,158),(12,159),(12,160),(12,161),(12,162),(12,163),(12,164),(12,165),(12,166),(12,167),(12,168),(12,169),(12,170),(12,171),(12,172),(12,173),(12,174),(12,175),(12,176),(12,177),(12,178),(12,179),(12,180),(12,181),(12,182),(12,183),(12,184),(12,185),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,30),(13,31),(13,34),(13,36),(13,37),(13,38),(13,39),(13,40),(13,42),(13,43),(13,44),(13,45),(13,46),(13,47),(13,48),(13,49),(13,50),(13,51),(13,52),(13,53),(13,54),(13,55),(13,56),(13,57),(13,58),(13,59),(13,60),(13,61),(13,62),(13,63),(13,64),(13,65),(13,66),(13,67),(13,68),(13,69),(13,70),(13,71),(13,72),(13,73),(13,74),(13,75),(13,76),(13,77),(13,78),(13,79),(13,80),(13,81),(13,82),(13,83),(13,84),(13,85),(13,86),(13,87),(13,88),(13,89),(13,90),(13,91),(13,92),(13,93),(13,94),(13,95),(13,96),(13,97),(13,98),(13,99),(13,100),(13,101),(13,102),(13,103),(13,104),(13,105),(13,106),(13,107),(13,108),(13,109),(13,110),(13,111),(13,112),(13,113),(13,114),(13,115),(13,116),(13,117),(13,118),(13,119),(13,120),(13,121),(13,122),(13,123),(13,124),(13,125),(13,126),(13,127),(13,128),(13,129),(13,130),(13,131),(13,132),(13,133),(13,134),(13,135),(13,136),(13,137),(13,138),(13,139),(13,140),(13,141),(13,142),(13,143),(13,144),(13,145),(13,146),(13,147),(13,148),(13,149),(13,150),(13,151),(13,152),(13,153),(13,154),(13,155),(13,156),(13,157),(13,158),(13,159),(13,160),(13,161),(13,162),(13,163),(13,164),(13,165),(13,166),(13,167),(13,168),(13,169),(13,170),(13,171),(13,172),(13,173),(13,174),(13,175),(13,176),(13,177),(13,178),(13,179),(13,180),(13,181),(13,182),(13,183),(13,184),(13,185),(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),(14,8),(14,9),(14,10),(14,11),(14,12),(14,13),(14,16),(14,17),(14,18),(14,20),(14,21),(14,22),(14,23),(14,24),(14,25),(14,26),(14,27),(14,28),(14,29),(14,30),(14,31),(14,32),(14,33),(14,34),(14,35),(14,36),(14,37),(14,38),(14,39),(14,40),(14,41),(14,42),(14,43),(14,44),(14,45),(14,46),(14,47),(14,48),(14,49),(14,50),(14,51),(14,52),(14,53),(14,54),(14,55),(14,56),(14,57),(14,58),(14,59),(14,60),(14,61),(14,62),(14,63),(14,64),(14,65),(14,66),(14,67),(14,68),(14,69),(14,70),(14,71),(14,72),(14,73),(14,74),(14,75),(14,76),(14,77),(14,78),(14,79),(14,80),(14,81),(14,82),(14,83),(14,84),(14,85),(14,86),(14,87),(14,88),(14,89),(14,90),(14,91),(14,92),(14,93),(14,94),(14,95),(14,96),(14,97),(14,98),(14,99),(14,100),(14,101),(14,102),(14,103),(14,104),(14,105),(14,106),(14,107),(14,108),(14,109),(14,110),(14,111),(14,112),(14,113),(14,114),(14,115),(14,116),(14,117),(14,118),(14,119),(14,120),(14,121),(14,122),(14,123),(14,124),(14,125),(14,126),(14,127),(14,128),(14,129),(14,130),(14,131),(14,132),(14,133),(14,134),(14,135),(14,136),(14,137),(14,138),(14,139),(14,140),(14,141),(14,142),(14,143),(14,144),(14,145),(14,146),(14,147),(14,148),(14,149),(14,150),(14,151),(14,152),(14,153),(14,154),(14,155),(14,156),(14,157),(14,158),(14,159),(14,160),(14,161),(14,162),(14,163),(14,164),(14,165),(14,166),(14,167),(14,168),(14,169),(14,170),(14,171),(14,172),(14,173),(14,174),(14,175),(14,176),(14,177),(14,178),(14,179),(14,180),(14,181),(14,182),(14,183),(14,184),(14,185),(15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,8),(15,9),(15,10),(15,11),(15,12),(15,13),(15,16),(15,17),(15,18),(15,20),(15,21),(15,22),(15,23),(15,24),(15,25),(15,26),(15,27),(15,28),(15,29),(15,30),(15,31),(15,32),(15,33),(15,34),(15,35),(15,36),(15,37),(15,38),(15,39),(15,40),(15,41),(15,42),(15,43),(15,44),(15,45),(15,46),(15,47),(15,48),(15,49),(15,50),(15,51),(15,52),(15,53),(15,54),(15,55),(15,56),(15,57),(15,58),(15,59),(15,60),(15,61),(15,62),(15,63),(15,64),(15,65),(15,66),(15,67),(15,68),(15,69),(15,70),(15,71),(15,72),(15,73),(15,74),(15,75),(15,76),(15,77),(15,78),(15,79),(15,80),(15,81),(15,82),(15,83),(15,84),(15,85),(15,86),(15,87),(15,88),(15,89),(15,90),(15,91),(15,92),(15,93),(15,94),(15,95),(15,96),(15,97),(15,98),(15,99),(15,100),(15,101),(15,102),(15,103),(15,104),(15,105),(15,106),(15,107),(15,108),(15,109),(15,110),(15,111),(15,112),(15,113),(15,114),(15,115),(15,116),(15,117),(15,118),(15,119),(15,120),(15,121),(15,122),(15,123),(15,124),(15,125),(15,126),(15,127),(15,128),(15,129),(15,130),(15,131),(15,132),(15,133),(15,134),(15,135),(15,136),(15,137),(15,138),(15,139),(15,140),(15,141),(15,142),(15,143),(15,144),(15,145),(15,146),(15,147),(15,148),(15,149),(15,150),(15,151),(15,152),(15,153),(15,154),(15,155),(15,156),(15,157),(15,158),(15,159),(15,160),(15,161),(15,162),(15,163),(15,164),(15,165),(15,166),(15,167),(15,168),(15,169),(15,170),(15,171),(15,172),(15,173),(15,174),(15,175),(15,176),(15,177),(15,178),(15,179),(15,180),(15,181),(15,182),(15,183),(15,184),(15,185);
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
INSERT INTO `REQUIREMENTSKELETON_PROJECTTYPE` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,16),(1,17),(1,18),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,56),(1,57),(1,58),(1,59),(1,60),(1,61),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,99),(1,100),(1,101),(1,102),(1,103),(1,104),(1,105),(1,106),(1,107),(1,108),(1,109),(1,110),(1,111),(1,112),(1,113),(1,114),(1,115),(1,116),(1,117),(1,118),(1,119),(1,120),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,134),(1,135),(1,136),(1,137),(1,138),(1,139),(1,140),(1,141),(1,142),(1,143),(1,144),(1,145),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185);
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
INSERT INTO `REQUIREMENTSKELETON_TAGINSTANCE` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,11),(1,121),(1,122),(1,123),(1,124),(1,125),(1,126),(1,127),(1,128),(1,129),(1,130),(1,131),(1,132),(1,133),(1,146),(1,147),(1,148),(1,149),(1,150),(1,151),(1,152),(1,153),(1,154),(1,155),(1,156),(1,157),(1,158),(1,159),(1,160),(1,161),(1,162),(1,163),(1,164),(1,165),(1,166),(1,167),(1,168),(1,169),(1,170),(1,171),(1,172),(1,173),(1,174),(1,175),(1,176),(1,177),(1,178),(1,179),(1,180),(1,181),(1,182),(1,183),(1,184),(1,185),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,87),(2,88),(2,89),(2,90),(2,91),(2,92),(2,93),(2,94),(2,95),(2,96),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,11),(3,12),(3,13),(3,16),(3,17),(3,18),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,56),(3,57),(3,58),(3,59),(3,60),(3,61),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90),(3,91),(3,92),(3,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,99),(3,100),(3,101),(3,102),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110),(3,111),(3,112),(3,113),(3,114),(3,115),(3,116),(3,117),(3,118),(3,119),(3,120),(3,121),(3,122),(3,123),(3,124),(3,125),(3,126),(3,127),(3,128),(3,129),(3,130),(3,131),(3,132),(3,133),(3,134),(3,135),(3,136),(3,137),(3,138),(3,139),(3,140),(3,141),(3,142),(3,143),(3,144),(3,145),(3,146),(3,147),(3,148),(3,149),(3,150),(3,151),(3,152),(3,153),(3,154),(3,155),(3,156),(3,157),(3,158),(3,159),(3,160),(3,161),(3,162),(3,163),(3,164),(3,165),(3,166),(3,167),(3,168),(3,169),(3,170),(3,171),(3,172),(3,173),(3,174),(3,175),(3,176),(3,177),(3,178),(3,179),(3,180),(3,181),(3,182),(3,183),(3,184),(3,185),(4,10),(4,12),(4,13),(4,16),(4,17),(4,18),(4,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,56),(4,57),(4,58),(4,59),(4,60),(4,61),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(4,69),(4,70),(4,71),(4,72),(4,73),(4,74),(4,75),(4,76),(4,77),(4,78),(4,79),(4,80),(4,81),(4,82),(4,83),(4,84),(4,85),(4,86),(4,87),(4,88),(4,89),(4,90),(4,91),(4,92),(4,93),(4,94),(4,95),(4,96),(4,97),(4,98),(4,99),(4,100),(4,101),(4,102),(4,103),(4,104),(4,105),(4,106),(4,107),(4,108),(4,109),(4,110),(4,111),(4,112),(4,113),(4,114),(4,115),(4,116),(4,117),(4,118),(4,119),(4,120),(4,121),(4,122),(4,123),(4,124),(4,125),(4,126),(4,127),(4,128),(4,129),(4,130),(4,131),(4,132),(4,133),(4,134),(4,135),(4,136),(4,137),(4,138),(4,139),(4,140),(4,141),(4,142),(4,143),(4,144),(4,145),(4,146),(4,147),(4,148),(4,149),(4,150),(4,151),(4,152),(4,153),(4,154),(4,155),(4,156),(4,157),(4,158),(4,159),(4,160),(4,161),(4,162),(4,163),(4,164),(4,165),(4,166),(4,167),(4,168),(4,169),(4,170),(4,171),(4,172),(4,173),(4,174),(4,175),(4,176),(4,177),(4,178),(4,179),(4,180),(4,181),(4,182),(4,183),(4,184),(4,185),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,87),(5,88),(5,89),(5,90),(5,91),(5,92),(5,93),(5,94),(5,95),(5,96),(5,155),(5,156),(5,157),(5,158),(5,159),(5,160),(5,161),(5,162),(5,163),(5,164),(5,165),(5,166),(5,167),(5,168),(5,169),(5,170),(5,171),(5,172),(5,173),(5,174),(5,175),(5,176),(5,177),(5,178),(5,179),(5,180),(5,181),(5,182),(5,183),(5,184),(5,185),(6,12),(6,13),(6,16),(6,17),(6,18),(6,20),(6,21),(6,22),(6,23),(6,24),(6,25),(6,26),(6,27),(6,28),(6,29),(6,30),(6,31),(6,32),(6,33),(6,34),(6,35),(6,36),(6,37),(6,38),(6,39),(6,40),(6,41),(6,42),(6,43),(6,44),(6,45),(6,46),(6,47),(6,48),(6,49),(6,50),(6,51),(6,52),(6,53),(6,54),(6,55),(6,56),(6,57),(6,58),(6,59),(6,60),(6,61),(6,62),(6,63),(6,64),(6,65),(6,66),(6,67),(6,68),(6,69),(6,70),(6,71),(6,72),(6,73),(6,74),(6,75),(6,76),(6,77),(6,78),(6,79),(6,80),(6,81),(6,82),(6,83),(6,84),(6,85),(6,86),(6,121),(6,122),(6,123),(6,124),(6,125),(6,126),(6,127),(6,128),(6,129),(6,130),(6,131),(6,132),(6,133),(6,134),(6,135),(6,136),(6,137),(6,138),(6,139),(6,140),(6,141),(6,142),(6,143),(6,144),(6,145),(6,146),(6,147),(6,148),(6,149),(6,150),(6,151),(6,152),(6,153),(6,154),(6,155),(6,156),(6,157),(6,158),(6,159),(6,160),(6,161),(6,162),(6,163),(6,164),(6,165),(6,166),(6,167),(6,168),(6,169),(6,170),(6,171),(6,172),(6,173),(6,174),(6,175),(6,176),(6,177),(6,178),(6,179),(6,180),(6,181),(6,182),(6,183),(6,184),(6,185),(7,54),(7,55),(7,56),(7,57),(7,58),(7,59),(7,60),(7,61),(7,62),(7,63),(7,64),(7,65),(7,66),(7,67),(7,68),(7,69),(7,70),(7,71),(7,72),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,80),(7,81),(7,82),(7,83),(7,84),(7,85),(7,86),(7,87),(7,88),(7,89),(7,90),(7,91),(7,92),(7,93),(7,94),(7,95),(7,96),(7,97),(7,98),(7,99),(7,100),(7,101),(7,102),(7,103),(7,104),(7,105),(7,106),(7,107),(7,108),(7,109),(7,110),(7,111),(7,112),(7,113),(7,114),(7,115),(7,116),(7,117),(7,118),(7,119),(7,120),(7,121),(7,122),(7,123),(7,124),(7,125),(7,126),(7,127),(7,128),(7,129),(7,130),(7,131),(7,132),(7,133),(7,134),(7,135),(7,136),(7,137),(7,138),(7,139),(7,140),(7,141),(7,142),(7,143),(7,144),(7,145),(7,146),(7,147),(7,148),(7,149),(7,150),(7,151),(7,152),(7,153),(7,154),(7,155),(7,156),(7,157),(7,158),(7,159),(7,160),(7,161),(7,162),(7,163),(7,164),(7,165),(7,166),(7,167),(7,168),(7,169),(7,170),(7,171),(7,172),(7,173),(7,174),(7,175),(7,176),(7,177),(7,178),(7,179),(7,180),(7,181),(7,182),(7,183),(7,184),(7,185),(8,10),(8,97),(8,98),(8,99),(8,100),(8,101),(8,102),(8,103),(8,104),(8,105),(8,106),(8,107),(8,108),(8,109),(9,54),(9,55),(9,56),(9,57),(9,58),(9,59),(9,60),(9,61),(9,62),(9,63),(9,64),(9,65),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),(10,11),(10,12),(10,13),(10,16),(10,17),(10,18),(10,20),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,29),(10,30),(10,31),(10,32),(10,33),(10,34),(10,35),(10,36),(10,37),(10,38),(10,39),(10,40),(10,41),(10,42),(10,43),(10,44),(10,45),(10,46),(10,47),(10,48),(10,49),(10,50),(10,51),(10,52),(10,53),(10,54),(10,55),(10,56),(10,57),(10,58),(10,59),(10,60),(10,61),(10,62),(10,63),(10,64),(10,65),(10,66),(10,67),(10,68),(10,69),(10,70),(10,71),(10,72),(10,73),(10,74),(10,75),(10,76),(10,77),(10,78),(10,79),(10,80),(10,81),(10,82),(10,83),(10,84),(10,85),(10,86),(10,97),(10,98),(10,99),(10,100),(10,101),(10,102),(10,103),(10,104),(10,105),(10,106),(10,107),(10,108),(10,109),(10,110),(10,111),(10,112),(10,113),(10,114),(10,115),(10,116),(10,117),(10,118),(10,119),(10,120),(10,121),(10,122),(10,123),(10,124),(10,125),(10,126),(10,127),(10,128),(10,129),(10,130),(10,131),(10,132),(10,133),(10,134),(10,135),(10,136),(10,137),(10,138),(10,139),(10,140),(10,141),(10,144),(10,145),(10,155),(10,156),(10,157),(10,158),(10,159),(10,160),(10,161),(10,162),(10,163),(10,164),(10,165),(10,166),(10,167),(10,168),(10,169),(10,170),(10,171),(10,172),(10,173),(10,174),(10,175),(10,176),(10,177),(10,178),(10,179),(10,180),(10,181),(10,182),(10,183),(10,184),(10,185),(11,66),(11,67),(11,68),(11,69),(11,70),(11,71),(11,72),(11,73),(11,74),(11,75),(11,76),(11,77),(11,78),(11,79),(11,80),(11,81),(11,82),(11,83),(11,84),(11,85),(11,86),(11,110),(11,111),(11,112),(11,113),(11,114),(11,115),(11,116),(11,117),(11,118),(11,119),(11,120),(11,121),(11,122),(11,123),(11,124),(11,125),(11,126),(11,127),(11,128),(11,129),(11,130),(11,131),(11,132),(11,133),(11,134),(11,135),(11,136),(11,137),(11,138),(11,139),(11,140),(11,141),(11,144),(11,145),(11,155),(11,156),(11,157),(11,158),(11,159),(11,160),(11,161),(11,162),(11,163),(11,164),(11,165),(11,166),(11,167),(11,168),(11,169),(11,170),(11,171),(11,172),(11,173),(11,174),(11,175),(11,176),(11,177),(11,178),(11,179),(11,180),(11,181),(11,182),(11,183),(11,184),(11,185),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(12,12),(12,13),(12,16),(12,17),(12,18),(12,20),(12,21),(12,22),(12,23),(12,24),(12,25),(12,26),(12,27),(12,28),(12,29),(12,30),(12,31),(12,32),(12,33),(12,34),(12,35),(12,36),(12,37),(12,38),(12,39),(12,40),(12,41),(12,42),(12,43),(12,44),(12,45),(12,46),(12,47),(12,48),(12,49),(12,50),(12,51),(12,52),(12,53),(12,66),(12,67),(12,68),(12,69),(12,70),(12,71),(12,72),(12,73),(12,74),(12,75),(12,76),(12,77),(12,78),(12,79),(12,80),(12,81),(12,82),(12,83),(12,84),(12,85),(12,86),(12,87),(12,88),(12,89),(12,90),(12,91),(12,92),(12,93),(12,94),(12,95),(12,96),(12,97),(12,98),(12,99),(12,100),(12,101),(12,102),(12,103),(12,104),(12,105),(12,106),(12,107),(12,108),(12,109),(12,110),(12,111),(12,112),(12,113),(12,114),(12,115),(12,116),(12,117),(12,118),(12,119),(12,120),(12,121),(12,122),(12,123),(12,124),(12,125),(12,126),(12,127),(12,128),(12,129),(12,130),(12,131),(12,132),(12,133),(12,134),(12,135),(12,136),(12,137),(12,138),(12,139),(12,140),(12,141),(12,142),(12,143),(12,144),(12,145),(12,155),(12,156),(12,157),(12,158),(12,159),(12,160),(12,161),(12,162),(12,163),(12,164),(12,165),(12,166),(12,167),(12,168),(12,169),(12,170),(12,171),(12,172),(12,173),(12,174),(12,175),(12,176),(12,177),(12,178),(12,179),(12,180),(12,181),(12,182),(12,183),(12,184),(12,185),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,54),(13,55),(13,56),(13,57),(13,58),(13,59),(13,60),(13,61),(13,62),(13,63),(13,64),(13,65),(13,66),(13,67),(13,68),(13,69),(13,70),(13,71),(13,72),(13,73),(13,74),(13,75),(13,76),(13,77),(13,78),(13,79),(13,80),(13,81),(13,82),(13,83),(13,84),(13,85),(13,86),(13,121),(13,122),(13,123),(13,124),(13,125),(13,126),(13,127),(13,128),(13,129),(13,130),(13,131),(13,132),(13,133),(13,146),(13,147),(13,148),(13,149),(13,150),(13,151),(13,152),(13,153),(13,154),(13,155),(13,156),(13,157),(13,158),(13,159),(13,160),(13,161),(13,162),(13,163),(13,164),(13,165),(13,166),(13,167),(13,168),(13,169),(13,170),(13,171),(13,172),(13,173),(13,174),(13,175),(13,176),(13,177),(13,178),(13,179),(13,180),(13,181),(13,182),(13,183),(13,184),(13,185),(14,10),(15,12),(15,13),(15,16),(15,17),(15,18),(15,20),(15,21),(15,22),(15,23),(15,24),(15,25),(15,26),(15,27),(15,28),(15,29),(15,30),(15,31),(15,32),(15,33),(15,34),(15,35),(15,36),(15,37),(15,38),(15,39),(15,40),(15,41),(15,42),(15,43),(15,44),(15,45),(15,46),(15,47),(15,48),(15,49),(15,50),(15,51),(15,52),(15,53),(15,54),(15,55),(15,56),(15,57),(15,58),(15,59),(15,60),(15,61),(15,62),(15,63),(15,64),(15,65),(15,66),(15,67),(15,68),(15,69),(15,70),(15,71),(15,72),(15,73),(15,74),(15,75),(15,76),(15,77),(15,78),(15,79),(15,80),(15,81),(15,82),(15,83),(15,84),(15,85),(15,86),(15,87),(15,88),(15,89),(15,90),(15,91),(15,92),(15,93),(15,94),(15,95),(15,96),(15,97),(15,98),(15,99),(15,100),(15,101),(15,102),(15,103),(15,104),(15,105),(15,106),(15,107),(15,108),(15,109),(15,110),(15,111),(15,112),(15,113),(15,114),(15,115),(15,116),(15,117),(15,118),(15,119),(15,120),(15,121),(15,122),(15,123),(15,124),(15,125),(15,126),(15,127),(15,128),(15,129),(15,130),(15,131),(15,132),(15,133),(15,134),(15,135),(15,136),(15,137),(15,138),(15,139),(15,140),(15,141),(15,142),(15,143),(15,144),(15,145),(15,146),(15,147),(15,148),(15,149),(15,150),(15,151),(15,152),(15,153),(15,154),(15,155),(15,156),(15,157),(15,158),(15,159),(15,160),(15,161),(15,162),(15,163),(15,164),(15,165),(15,166),(15,167),(15,168),(15,169),(15,170),(15,171),(15,172),(15,173),(15,174),(15,175),(15,176),(15,177),(15,178),(15,179),(15,180),(15,181),(15,182),(15,183),(15,184),(15,185),(16,127),(16,128),(16,129);
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
INSERT INTO `SLIDETEMPLATE` VALUES (27,'Picture','Slide with a picture','![Alt](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWoMcCPRKxHJvcwe8_kzTUbOWTbVrWbSvhMjMykteKtm7d7Sc- )','admin','2017-09-20 03:32:17','admin','2017-09-20 03:32:17'),(28,'Code block','Vulnerable code','```\npublic class DoStuff {\npublic string executeCommand(String userName)\n{	try {\n		String myUid = userName;\n		Runtime rt = Runtime.getRuntime();\n		rt.exec(\"cmd.exe /C doStuff.exe \" +”-“ +myUid);\n	}catch(Exception e)\n		{\ne.printStackTrace();\n		}\n	}\n}\n```','admin','2017-09-20 03:35:48','admin','2017-09-20 03:35:48'),(29,'Youtube video','Slide with an iframe containing youtube video','<iframe width=\"420\" height=\"315\"\nsrc=\"https://www.youtube.com/embed/6N__PgMSfYU\">\n</iframe>','admin','2017-09-20 03:39:40','admin','2017-09-20 03:39:40'),(30,'Python shell','Iframe with python','<iframe src=\"https://www.pythonanywhere.com/try-ipython/console_frame/\" width= 100% height=100%></iframe>','admin','2017-09-20 03:52:52','admin','2017-09-20 03:52:52');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUSCOLUMN`
--

LOCK TABLES `STATUSCOLUMN` WRITE;
/*!40000 ALTER TABLE `STATUSCOLUMN` DISABLE KEYS */;
INSERT INTO `STATUSCOLUMN` VALUES (1,'Fulfilled','Indicates whether the particular requirement is fulfilled.','',0,''),(2,'Comment','Precision / further specification for the given artifact','\0',10,'');
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
INSERT INTO `STATUSCOLUMNVALUE` VALUES (1,'Unknown','This requirement is currently unknown.',0,'',1),(2,'Yes','This requirement is fulfilled.',10,'',1),(3,'No','This requirement is not fulfilled.',20,'',1),(4,'Partly','This requirement is partly fulfilled (please explain).',30,'',1),(5,'Clarify','To be clarified.',40,'',1);
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
INSERT INTO `TAGCATEGORY` VALUES (1,'Requirement Owner','Suggested role which should take care of the requirement',0,''),(2,'Gates','Requirements supposed to be defined before particular gates in case of waterfall-like projects',10,''),(3,'QA','Security QA relevant tags',20,''),(4,'Requirement Type','Defines the type of the requirement (lifecycle vs. technical).',30,''),(6,'SecurityCAT','Requirements testable by SecurityCAT',40,'');
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
INSERT INTO `TAGINSTANCE` VALUES (1,'Product Manager','Person who can make business relevant decisions',0,'',1),(2,'Security Mentor','Security expert. Sometimes coming from information security, sometimes from department',10,'',1),(3,'Project Manager','Role planning project activities.',20,'',1),(4,'SCRUM Master','Because agility matters....',30,'',1),(5,'G0','Project idea',0,'',2),(6,'G1','High-level design',10,'',2),(7,'G2','End of the design phase',20,'',2),(8,'G3','Rollout',30,'',2),(9,'G4','Closing',40,'',2),(10,'Blackbox','We can verify this with a pentest',0,'',3),(11,'Functional Test','This should be handled during regular QA',10,'',3),(12,'White box','Someone has to look into the source code',20,'',3),(13,'Design','Requirements supposed to be documented before the development starts',0,'',4),(14,'Lifecycle','Security related activities which are supposed to be carried out during the development process',10,'',4),(15,'Technical','Security properties of the target artifact',20,'',4),(16,'Testable','Testable security requirements',10,'',6);
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
INSERT INTO `TRAINING` VALUES (1,'New Training','Example training','admin','2017-09-20 03:43:19','admin','2017-09-22 14:52:42','\0');
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
INSERT INTO `TRAININGBRANCHNODE` VALUES (7,'Introduction',-2,872),(8,'Outro',-2,1157);
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
INSERT INTO `TRAININGCATEGORYNODE` VALUES (40,NULL,878,1),(41,NULL,887,2),(42,NULL,940,3),(43,NULL,975,4),(44,NULL,998,5),(45,NULL,1030,6),(46,NULL,1038,7),(47,NULL,1049,8),(48,NULL,1063,9),(49,NULL,1086,10),(50,NULL,1106,13),(51,NULL,1129,15),(52,NULL,1152,16);
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
INSERT INTO `TRAININGCUSTOMSLIDENODE` VALUES (72,'Title','<h1>{{ training.name }}</h1>',-2,871),(73,'Title','<h2>{{ parent.name }}</h2>',-2,873),(74,'Welcome','<h2>Welcome to {{ training.name }}</h2>',-2,874),(75,'Who am I','<h2>Who am I?</h2>\nJohn Doe, Security Analyst',-2,875),(76,'Portfolio','<h2>John Doe</h2>\n<ul><li>Security Trainer</li>\n<li>Expert in Security</li>\n<li>Elite programmer</li></ul>',-2,876),(77,'Title','<h2>{{ parent.name }}</h2>',-2,879),(78,'Picture','![Alt](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWoMcCPRKxHJvcwe8_kzTUbOWTbVrWbSvhMjMykteKtm7d7Sc- )',-2,880),(79,'Code block','```\npublic class DoStuff {\npublic string executeCommand(String userName)\n{try {\n		String myUid = userName;\n		Runtime rt = Runtime.getRuntime();\n		rt.exec(\"cmd.exe /C doStuff.exe \" +”-“ +myUid);\n	}catch(Exception e)\n		{\ne.printStackTrace();\n		}\n	}\n}\n```',-2,881),(80,'Youtube video','<iframe width=\"420\" height=\"315\"\nsrc=\"https://www.youtube.com/embed/6N__PgMSfYU\">\n</iframe>',-2,882),(81,'Python shell','<iframe src=\"https://www.pythonanywhere.com/try-ipython/console_frame/\" width= 100% height=500></iframe>',-2,883),(82,'Title','<h2>{{ parent.name }}</h2>',-2,888),(83,'Title','<h2>{{ parent.name }}</h2>',-2,941),(84,'Title','<h2>{{ parent.name }}</h2>',-2,976),(85,'Title','<h2>{{ parent.name }}</h2>',-2,999),(86,'Title','<h2>{{ parent.name }}</h2>',-2,1031),(87,'Title','<h2>{{ parent.name }}</h2>',-2,1039),(88,'Title','<h2>{{ parent.name }}</h2>',-2,1050),(89,'Title','<h2>{{ parent.name }}</h2>',-2,1064),(90,'Title','<h2>{{ parent.name }}</h2>',-2,1087),(91,'Title','<h2>{{ parent.name }}</h2>',-2,1107),(92,'Title','<h2>{{ parent.name }}</h2>',-2,1130),(93,'Title','<h2>{{ parent.name }}</h2>',-2,1153),(94,'Title','<h2>{{ parent.name }}</h2>',-2,1158),(95,'Questions','<h2>End of {{ training.name }}</h2>Please feel free to ask questions',-2,1159);
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
INSERT INTO `TRAININGGENERATEDSLIDENODE` VALUES (499,885,NULL),(500,886,1),(501,890,NULL),(502,891,1),(503,893,NULL),(504,894,1),(505,896,NULL),(506,897,1),(507,899,NULL),(508,900,1),(509,902,NULL),(510,903,1),(511,905,NULL),(512,906,1),(513,908,NULL),(514,909,1),(515,911,NULL),(516,912,1),(517,914,NULL),(518,915,1),(519,917,NULL),(520,918,1),(521,920,NULL),(522,921,1),(523,923,NULL),(524,924,1),(525,926,NULL),(526,927,1),(527,929,NULL),(528,930,1),(529,932,NULL),(530,933,1),(531,935,NULL),(532,936,1),(533,938,NULL),(534,939,1),(535,943,NULL),(536,944,1),(537,946,NULL),(538,947,1),(539,949,NULL),(540,950,1),(541,952,NULL),(542,953,1),(543,955,NULL),(544,956,1),(545,958,NULL),(546,959,1),(547,961,NULL),(548,962,1),(549,964,NULL),(550,965,1),(551,967,NULL),(552,968,1),(553,970,NULL),(554,971,1),(555,973,NULL),(556,974,1),(557,978,NULL),(558,979,1),(559,981,NULL),(560,982,1),(561,984,NULL),(562,985,1),(563,987,NULL),(564,988,1),(565,990,NULL),(566,991,1),(567,993,NULL),(568,994,1),(569,996,NULL),(570,997,1),(571,1001,NULL),(572,1002,1),(573,1004,NULL),(574,1005,1),(575,1007,NULL),(576,1008,1),(577,1010,NULL),(578,1011,1),(579,1013,NULL),(580,1014,1),(581,1016,NULL),(582,1017,1),(583,1019,NULL),(584,1020,1),(585,1022,NULL),(586,1023,1),(587,1025,NULL),(588,1026,1),(589,1028,NULL),(590,1029,1),(591,1033,NULL),(592,1034,1),(593,1036,NULL),(594,1037,1),(595,1041,NULL),(596,1042,1),(597,1044,NULL),(598,1045,1),(599,1047,NULL),(600,1048,1),(601,1052,NULL),(602,1053,1),(603,1055,NULL),(604,1056,1),(605,1058,NULL),(606,1059,1),(607,1061,NULL),(608,1062,1),(609,1066,NULL),(610,1067,1),(611,1069,NULL),(612,1070,1),(613,1072,NULL),(614,1073,1),(615,1075,NULL),(616,1076,1),(617,1078,NULL),(618,1079,1),(619,1081,NULL),(620,1082,1),(621,1084,NULL),(622,1085,1),(623,1089,NULL),(624,1090,1),(625,1092,NULL),(626,1093,1),(627,1095,NULL),(628,1096,1),(629,1098,NULL),(630,1099,1),(631,1101,NULL),(632,1102,1),(633,1104,NULL),(634,1105,1),(635,1109,NULL),(636,1110,1),(637,1112,NULL),(638,1113,1),(639,1115,NULL),(640,1116,1),(641,1118,NULL),(642,1119,1),(643,1121,NULL),(644,1122,1),(645,1124,NULL),(646,1125,1),(647,1127,NULL),(648,1128,1),(649,1132,NULL),(650,1133,1),(651,1135,NULL),(652,1136,1),(653,1138,NULL),(654,1139,1),(655,1141,NULL),(656,1142,1),(657,1144,NULL),(658,1145,1),(659,1147,NULL),(660,1148,1),(661,1150,NULL),(662,1151,1),(663,1155,NULL),(664,1156,1);
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
INSERT INTO `TRAININGREQUIREMENTNODE` VALUES (250,884,1),(251,889,12),(252,892,13),(253,895,16),(254,898,17),(255,901,20),(256,904,18),(257,907,21),(258,910,24),(259,913,25),(260,916,26),(261,919,27),(262,922,28),(263,925,30),(264,928,32),(265,931,35),(266,934,39),(267,937,40),(268,942,41),(269,945,42),(270,948,43),(271,951,45),(272,954,46),(273,957,47),(274,960,49),(275,963,50),(276,966,51),(277,969,52),(278,972,53),(279,977,54),(280,980,55),(281,983,56),(282,986,57),(283,989,58),(284,992,62),(285,995,65),(286,1000,66),(287,1003,67),(288,1006,68),(289,1009,70),(290,1012,71),(291,1015,72),(292,1018,73),(293,1021,74),(294,1024,75),(295,1027,82),(296,1032,87),(297,1035,89),(298,1040,97),(299,1043,106),(300,1046,109),(301,1051,110),(302,1054,112),(303,1057,113),(304,1060,118),(305,1065,121),(306,1068,122),(307,1071,128),(308,1074,130),(309,1077,131),(310,1080,132),(311,1083,133),(312,1088,134),(313,1091,135),(314,1094,138),(315,1097,139),(316,1100,140),(317,1103,141),(318,1108,146),(319,1111,147),(320,1114,148),(321,1117,149),(322,1120,150),(323,1123,153),(324,1126,154),(325,1131,166),(326,1134,167),(327,1137,168),(328,1140,169),(329,1143,170),(330,1146,171),(331,1149,172),(332,1154,176);
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
INSERT INTO `TRAININGTREENODE` VALUES (870,'RootNode',0,'',NULL,1),(871,'CustomSlideNode',0,'',870,1),(872,'BranchNode',1,'',870,1),(873,'CustomSlideNode',0,'',872,1),(874,'CustomSlideNode',1,'',872,1),(875,'CustomSlideNode',2,'',872,1),(876,'CustomSlideNode',3,'',872,1),(877,'ContentNode',2,'',870,1),(878,'CategoryNode',0,'',877,1),(879,'CustomSlideNode',0,'',878,1),(880,'CustomSlideNode',1,'',878,1),(881,'CustomSlideNode',2,'',878,1),(882,'CustomSlideNode',3,'',878,1),(883,'CustomSlideNode',4,'',878,1),(884,'RequirementNode',5,'',878,1),(885,'GeneratedSlideNode',0,'',884,1),(886,'GeneratedSlideNode',1,'',884,1),(887,'CategoryNode',1,'',877,1),(888,'CustomSlideNode',0,'',887,1),(889,'RequirementNode',1,'',887,1),(890,'GeneratedSlideNode',0,'',889,1),(891,'GeneratedSlideNode',1,'',889,1),(892,'RequirementNode',2,'',887,1),(893,'GeneratedSlideNode',0,'',892,1),(894,'GeneratedSlideNode',1,'',892,1),(895,'RequirementNode',3,'',887,1),(896,'GeneratedSlideNode',0,'',895,1),(897,'GeneratedSlideNode',1,'',895,1),(898,'RequirementNode',4,'',887,1),(899,'GeneratedSlideNode',0,'',898,1),(900,'GeneratedSlideNode',1,'',898,1),(901,'RequirementNode',5,'',887,1),(902,'GeneratedSlideNode',0,'',901,1),(903,'GeneratedSlideNode',1,'',901,1),(904,'RequirementNode',6,'',887,1),(905,'GeneratedSlideNode',0,'',904,1),(906,'GeneratedSlideNode',1,'',904,1),(907,'RequirementNode',7,'',887,1),(908,'GeneratedSlideNode',0,'',907,1),(909,'GeneratedSlideNode',1,'',907,1),(910,'RequirementNode',8,'',887,1),(911,'GeneratedSlideNode',0,'',910,1),(912,'GeneratedSlideNode',1,'',910,1),(913,'RequirementNode',9,'',887,1),(914,'GeneratedSlideNode',0,'',913,1),(915,'GeneratedSlideNode',1,'',913,1),(916,'RequirementNode',10,'',887,1),(917,'GeneratedSlideNode',0,'',916,1),(918,'GeneratedSlideNode',1,'',916,1),(919,'RequirementNode',11,'',887,1),(920,'GeneratedSlideNode',0,'',919,1),(921,'GeneratedSlideNode',1,'',919,1),(922,'RequirementNode',12,'',887,1),(923,'GeneratedSlideNode',0,'',922,1),(924,'GeneratedSlideNode',1,'',922,1),(925,'RequirementNode',13,'',887,1),(926,'GeneratedSlideNode',0,'',925,1),(927,'GeneratedSlideNode',1,'',925,1),(928,'RequirementNode',14,'',887,1),(929,'GeneratedSlideNode',0,'',928,1),(930,'GeneratedSlideNode',1,'',928,1),(931,'RequirementNode',15,'',887,1),(932,'GeneratedSlideNode',0,'',931,1),(933,'GeneratedSlideNode',1,'',931,1),(934,'RequirementNode',16,'',887,1),(935,'GeneratedSlideNode',0,'',934,1),(936,'GeneratedSlideNode',1,'',934,1),(937,'RequirementNode',17,'',887,1),(938,'GeneratedSlideNode',0,'',937,1),(939,'GeneratedSlideNode',1,'',937,1),(940,'CategoryNode',2,'',877,1),(941,'CustomSlideNode',0,'',940,1),(942,'RequirementNode',1,'',940,1),(943,'GeneratedSlideNode',0,'',942,1),(944,'GeneratedSlideNode',1,'',942,1),(945,'RequirementNode',2,'',940,1),(946,'GeneratedSlideNode',0,'',945,1),(947,'GeneratedSlideNode',1,'',945,1),(948,'RequirementNode',3,'',940,1),(949,'GeneratedSlideNode',0,'',948,1),(950,'GeneratedSlideNode',1,'',948,1),(951,'RequirementNode',4,'',940,1),(952,'GeneratedSlideNode',0,'',951,1),(953,'GeneratedSlideNode',1,'',951,1),(954,'RequirementNode',5,'',940,1),(955,'GeneratedSlideNode',0,'',954,1),(956,'GeneratedSlideNode',1,'',954,1),(957,'RequirementNode',6,'',940,1),(958,'GeneratedSlideNode',0,'',957,1),(959,'GeneratedSlideNode',1,'',957,1),(960,'RequirementNode',7,'',940,1),(961,'GeneratedSlideNode',0,'',960,1),(962,'GeneratedSlideNode',1,'',960,1),(963,'RequirementNode',8,'',940,1),(964,'GeneratedSlideNode',0,'',963,1),(965,'GeneratedSlideNode',1,'',963,1),(966,'RequirementNode',9,'',940,1),(967,'GeneratedSlideNode',0,'',966,1),(968,'GeneratedSlideNode',1,'',966,1),(969,'RequirementNode',10,'',940,1),(970,'GeneratedSlideNode',0,'',969,1),(971,'GeneratedSlideNode',1,'',969,1),(972,'RequirementNode',11,'',940,1),(973,'GeneratedSlideNode',0,'',972,1),(974,'GeneratedSlideNode',1,'',972,1),(975,'CategoryNode',3,'',877,1),(976,'CustomSlideNode',0,'',975,1),(977,'RequirementNode',1,'',975,1),(978,'GeneratedSlideNode',0,'',977,1),(979,'GeneratedSlideNode',1,'',977,1),(980,'RequirementNode',2,'',975,1),(981,'GeneratedSlideNode',0,'',980,1),(982,'GeneratedSlideNode',1,'',980,1),(983,'RequirementNode',3,'',975,1),(984,'GeneratedSlideNode',0,'',983,1),(985,'GeneratedSlideNode',1,'',983,1),(986,'RequirementNode',4,'',975,1),(987,'GeneratedSlideNode',0,'',986,1),(988,'GeneratedSlideNode',1,'',986,1),(989,'RequirementNode',5,'',975,1),(990,'GeneratedSlideNode',0,'',989,1),(991,'GeneratedSlideNode',1,'',989,1),(992,'RequirementNode',6,'',975,1),(993,'GeneratedSlideNode',0,'',992,1),(994,'GeneratedSlideNode',1,'',992,1),(995,'RequirementNode',7,'',975,1),(996,'GeneratedSlideNode',0,'',995,1),(997,'GeneratedSlideNode',1,'',995,1),(998,'CategoryNode',4,'',877,1),(999,'CustomSlideNode',0,'',998,1),(1000,'RequirementNode',1,'',998,1),(1001,'GeneratedSlideNode',0,'',1000,1),(1002,'GeneratedSlideNode',1,'',1000,1),(1003,'RequirementNode',2,'',998,1),(1004,'GeneratedSlideNode',0,'',1003,1),(1005,'GeneratedSlideNode',1,'',1003,1),(1006,'RequirementNode',3,'',998,1),(1007,'GeneratedSlideNode',0,'',1006,1),(1008,'GeneratedSlideNode',1,'',1006,1),(1009,'RequirementNode',4,'',998,1),(1010,'GeneratedSlideNode',0,'',1009,1),(1011,'GeneratedSlideNode',1,'',1009,1),(1012,'RequirementNode',5,'',998,1),(1013,'GeneratedSlideNode',0,'',1012,1),(1014,'GeneratedSlideNode',1,'',1012,1),(1015,'RequirementNode',6,'',998,1),(1016,'GeneratedSlideNode',0,'',1015,1),(1017,'GeneratedSlideNode',1,'',1015,1),(1018,'RequirementNode',7,'',998,1),(1019,'GeneratedSlideNode',0,'',1018,1),(1020,'GeneratedSlideNode',1,'',1018,1),(1021,'RequirementNode',8,'',998,1),(1022,'GeneratedSlideNode',0,'',1021,1),(1023,'GeneratedSlideNode',1,'',1021,1),(1024,'RequirementNode',9,'',998,1),(1025,'GeneratedSlideNode',0,'',1024,1),(1026,'GeneratedSlideNode',1,'',1024,1),(1027,'RequirementNode',10,'',998,1),(1028,'GeneratedSlideNode',0,'',1027,1),(1029,'GeneratedSlideNode',1,'',1027,1),(1030,'CategoryNode',5,'',877,1),(1031,'CustomSlideNode',0,'',1030,1),(1032,'RequirementNode',1,'',1030,1),(1033,'GeneratedSlideNode',0,'',1032,1),(1034,'GeneratedSlideNode',1,'',1032,1),(1035,'RequirementNode',2,'',1030,1),(1036,'GeneratedSlideNode',0,'',1035,1),(1037,'GeneratedSlideNode',1,'',1035,1),(1038,'CategoryNode',6,'',877,1),(1039,'CustomSlideNode',0,'',1038,1),(1040,'RequirementNode',1,'',1038,1),(1041,'GeneratedSlideNode',0,'',1040,1),(1042,'GeneratedSlideNode',1,'',1040,1),(1043,'RequirementNode',2,'',1038,1),(1044,'GeneratedSlideNode',0,'',1043,1),(1045,'GeneratedSlideNode',1,'',1043,1),(1046,'RequirementNode',3,'',1038,1),(1047,'GeneratedSlideNode',0,'',1046,1),(1048,'GeneratedSlideNode',1,'',1046,1),(1049,'CategoryNode',7,'',877,1),(1050,'CustomSlideNode',0,'',1049,1),(1051,'RequirementNode',1,'',1049,1),(1052,'GeneratedSlideNode',0,'',1051,1),(1053,'GeneratedSlideNode',1,'',1051,1),(1054,'RequirementNode',2,'',1049,1),(1055,'GeneratedSlideNode',0,'',1054,1),(1056,'GeneratedSlideNode',1,'',1054,1),(1057,'RequirementNode',3,'',1049,1),(1058,'GeneratedSlideNode',0,'',1057,1),(1059,'GeneratedSlideNode',1,'',1057,1),(1060,'RequirementNode',4,'',1049,1),(1061,'GeneratedSlideNode',0,'',1060,1),(1062,'GeneratedSlideNode',1,'',1060,1),(1063,'CategoryNode',8,'',877,1),(1064,'CustomSlideNode',0,'',1063,1),(1065,'RequirementNode',1,'',1063,1),(1066,'GeneratedSlideNode',0,'',1065,1),(1067,'GeneratedSlideNode',1,'',1065,1),(1068,'RequirementNode',2,'',1063,1),(1069,'GeneratedSlideNode',0,'',1068,1),(1070,'GeneratedSlideNode',1,'',1068,1),(1071,'RequirementNode',3,'',1063,1),(1072,'GeneratedSlideNode',0,'',1071,1),(1073,'GeneratedSlideNode',1,'',1071,1),(1074,'RequirementNode',4,'',1063,1),(1075,'GeneratedSlideNode',0,'',1074,1),(1076,'GeneratedSlideNode',1,'',1074,1),(1077,'RequirementNode',5,'',1063,1),(1078,'GeneratedSlideNode',0,'',1077,1),(1079,'GeneratedSlideNode',1,'',1077,1),(1080,'RequirementNode',6,'',1063,1),(1081,'GeneratedSlideNode',0,'',1080,1),(1082,'GeneratedSlideNode',1,'',1080,1),(1083,'RequirementNode',7,'',1063,1),(1084,'GeneratedSlideNode',0,'',1083,1),(1085,'GeneratedSlideNode',1,'',1083,1),(1086,'CategoryNode',9,'',877,1),(1087,'CustomSlideNode',0,'',1086,1),(1088,'RequirementNode',1,'',1086,1),(1089,'GeneratedSlideNode',0,'',1088,1),(1090,'GeneratedSlideNode',1,'',1088,1),(1091,'RequirementNode',2,'',1086,1),(1092,'GeneratedSlideNode',0,'',1091,1),(1093,'GeneratedSlideNode',1,'',1091,1),(1094,'RequirementNode',3,'',1086,1),(1095,'GeneratedSlideNode',0,'',1094,1),(1096,'GeneratedSlideNode',1,'',1094,1),(1097,'RequirementNode',4,'',1086,1),(1098,'GeneratedSlideNode',0,'',1097,1),(1099,'GeneratedSlideNode',1,'',1097,1),(1100,'RequirementNode',5,'',1086,1),(1101,'GeneratedSlideNode',0,'',1100,1),(1102,'GeneratedSlideNode',1,'',1100,1),(1103,'RequirementNode',6,'',1086,1),(1104,'GeneratedSlideNode',0,'',1103,1),(1105,'GeneratedSlideNode',1,'',1103,1),(1106,'CategoryNode',10,'',877,1),(1107,'CustomSlideNode',0,'',1106,1),(1108,'RequirementNode',1,'',1106,1),(1109,'GeneratedSlideNode',0,'',1108,1),(1110,'GeneratedSlideNode',1,'',1108,1),(1111,'RequirementNode',2,'',1106,1),(1112,'GeneratedSlideNode',0,'',1111,1),(1113,'GeneratedSlideNode',1,'',1111,1),(1114,'RequirementNode',3,'',1106,1),(1115,'GeneratedSlideNode',0,'',1114,1),(1116,'GeneratedSlideNode',1,'',1114,1),(1117,'RequirementNode',4,'',1106,1),(1118,'GeneratedSlideNode',0,'',1117,1),(1119,'GeneratedSlideNode',1,'',1117,1),(1120,'RequirementNode',5,'',1106,1),(1121,'GeneratedSlideNode',0,'',1120,1),(1122,'GeneratedSlideNode',1,'',1120,1),(1123,'RequirementNode',6,'',1106,1),(1124,'GeneratedSlideNode',0,'',1123,1),(1125,'GeneratedSlideNode',1,'',1123,1),(1126,'RequirementNode',7,'',1106,1),(1127,'GeneratedSlideNode',0,'',1126,1),(1128,'GeneratedSlideNode',1,'',1126,1),(1129,'CategoryNode',11,'',877,1),(1130,'CustomSlideNode',0,'',1129,1),(1131,'RequirementNode',1,'',1129,1),(1132,'GeneratedSlideNode',0,'',1131,1),(1133,'GeneratedSlideNode',1,'',1131,1),(1134,'RequirementNode',2,'',1129,1),(1135,'GeneratedSlideNode',0,'',1134,1),(1136,'GeneratedSlideNode',1,'',1134,1),(1137,'RequirementNode',3,'',1129,1),(1138,'GeneratedSlideNode',0,'',1137,1),(1139,'GeneratedSlideNode',1,'',1137,1),(1140,'RequirementNode',4,'',1129,1),(1141,'GeneratedSlideNode',0,'',1140,1),(1142,'GeneratedSlideNode',1,'',1140,1),(1143,'RequirementNode',5,'',1129,1),(1144,'GeneratedSlideNode',0,'',1143,1),(1145,'GeneratedSlideNode',1,'',1143,1),(1146,'RequirementNode',6,'',1129,1),(1147,'GeneratedSlideNode',0,'',1146,1),(1148,'GeneratedSlideNode',1,'',1146,1),(1149,'RequirementNode',7,'',1129,1),(1150,'GeneratedSlideNode',0,'',1149,1),(1151,'GeneratedSlideNode',1,'',1149,1),(1152,'CategoryNode',12,'',877,1),(1153,'CustomSlideNode',0,'',1152,1),(1154,'RequirementNode',1,'',1152,1),(1155,'GeneratedSlideNode',0,'',1154,1),(1156,'GeneratedSlideNode',1,'',1154,1),(1157,'BranchNode',3,'',870,1),(1158,'CustomSlideNode',0,'',1157,1),(1159,'CustomSlideNode',1,'',1157,1);
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
INSERT INTO `TRAINING_COLLECTION` VALUES (1,1),(5,1);
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
INSERT INTO `TRAINING_OPTCOLUMN` VALUES (1,1);
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

-- Dump completed on 2018-11-19  9:39:05
