/* MySQL dump of default security requirements for SecurityRAT */

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTIONCATEGORY`
--

LOCK TABLES `COLLECTIONCATEGORY` WRITE;
/*!40000 ALTER TABLE `COLLECTIONCATEGORY` DISABLE KEYS */;
INSERT INTO `COLLECTIONCATEGORY` VALUES (1,'Criticality','Criticality of the artifact defined by the Security Mentor together with the project team',10,''),(2,'Artifact Type','Characteristics of the developed artifact',20,''),(5,'Authentication','How are the artifact clients/consumers authenticated?',30,''),(6,'Session Management','Does the artifact implement session management?',40,''),(7,'Reachability','From where is the artifact reachable?',50,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLLECTIONINSTANCE`
--

LOCK TABLES `COLLECTIONINSTANCE` WRITE;
/*!40000 ALTER TABLE `COLLECTIONINSTANCE` DISABLE KEYS */;
INSERT INTO `COLLECTIONINSTANCE` VALUES (1,'Low','The impact of a potential hack is low, e.g. no sensitive data can\'t be leaked or modified.',10,'',1),(2,'Medium','Significant impact in case of a hack.',20,'',1),(3,'High','Usually artifacts, which are mission- or security-critical. Hack will probably lead to a big financial damage.',30,'',1),(4,'Frontend Application','Server application intended to communicate with human users via a browser.',10,'',2),(5,'Web Service','E.g. REST or SOAP',20,'',2),(6,'Mobile App','Apps running on mobile devices (IOS, Android, Windows Phone...)',30,'',2),(7,'Single Sign-On Client','The system utilizes a central SSO service for authenticating its clients/consumers = client passwords are never transmitted through the artifact.',5,'',5),(8,'Centralized','The artifact authenticates the users/consumers, but doesn\'t store passwords or authentication tokens itself. These are stored in a central service (e.g. LDAP).',15,'',5),(9,'Local','The artifact authenticates the consumers itself and also stores the passwords',25,'',5),(10,'Client certificate authentication','The artifact utilizes a TLS certifcate authentication',35,'',5),(11,'No Authentication','The artifact doesn\'t authenticate it\'s consumers',45,'',5),(12,'No Session Management','The artifact doesn\'t have any session state',10,'',6),(13,'Session IDs','The artifact empoys sessions and uses session IDs',20,'',6),(14,'Externally','The artifact is reachable from the Internet',10,'',7),(15,'Internally','The artifact is reachable only from the internal company network',20,'',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMN`
--

LOCK TABLES `OPTCOLUMN` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMN` DISABLE KEYS */;
INSERT INTO `OPTCOLUMN` VALUES (1,'More Information','This makes it clear to techs how to achieve the control',10,'',2, b'1'),(2,'Motivation','This explains why we wannt to implement the requirement',20,'',1, b'1'),(3,'Test Case','This describes how we can test the requirement',30,'\0',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMNCONTENT`
--

LOCK TABLES `OPTCOLUMNCONTENT` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMNCONTENT` DISABLE KEYS */;
INSERT INTO `OPTCOLUMNCONTENT` VALUES (13,'In case your Security Mentor is not known, please refer to ...',1,2),(14,'Security Mentor is supposed to coordinate all security tasks.',2,2),(15,'There is no common criticality scheme. The criticality is usually a result of discussion between the Security Mentor and one of the responsibles. The common hints:\n\n- **Low:** Personal or other sensitive data not extensively used, no big damage for the company if the application gets hacked.\n- **Medium:** Personal or other sensitive data extensively processed, significant damage for the company if the application gets hacked.\n- **High:** Systems essential for company\'s business.',1,4),(17,'Classification of our assets enables us to address security efficiently and appropriately.',2,4),(19,'Verify whether the team members have attended the relevant security trainings.',1,11),(21,'Ensure that project members have an appropriate security know-how helping to protect our systems against attacks.',2,11),(22,'Security test can be carried out by:\n\n- project- or department-internal resources (e.g. QA)\n- by the information security department\nThe following information is needed before the test:\n\n- testing accounts\n- stable environment to test\n- Queue where the findings shall be reported',1,21),(23,'Penetration test can be carried out by:\n\n- project- or department-internal resources (e.g. QA)\n- external company (appropriate budget needed)\n- by the information security department\n\nThe following information is needed before the test:\n\n- testing accounts\n- stable environment to test\n- Queue where the findings shall be reported',1,22),(24,'More information to the topic threat modelling: \n\n- https://www.owasp.org/index.php/Application_Threat_Modeling\n\nOnce the threat model is carried out, comment/add specification to the current requirements or create new custom requirements.',1,19),(25,'Hardening guides and checklists can be found at:\n\n- vendor sites\n- http://www.cisecurity.org/',1,23),(26,'This action should take place in the beginning of the design phase. \n\n1. Security Mentor usually together with the system architect sets the status of all relevant security requirements. \n1. The requirement sheet is persisted in a defined location (e.g. in a selected JIRA Queue using the export function)\n1. All project members should have access to this sheet\n1. Particular requirements can be directly exported as JIRA issues as well',1,12),(27,'The Security Mentor prepares a workshop for the project team where the identifed requirements are introduced to the whole team.',1,13),(28,'Recommended actions:\n\n- evaluate the design document based on you security expertize (esp. architecture diagram)\n- filter the requirements for design documentation relevant ones and check whether these requirements are described accordingly',1,14),(30,'Suggested procedure:\n\n- organize a workshop with a suitable person from the project team in order to define relevant code parts\n- perform the code review and issue the findings as JIRA Tickets in the relevant queue\n- verify also the requirements tagged as relevant for code review during this activity',1,24),(31,'Example:\n\n- internal employees and external customers should work on completely separated systems so that the privilege escalation probability and impact in case of a DoS attack are mitigated.',1,51),(32,'Implementation of automated tooling can support this task:\n\n- https://www.owasp.org/index.php/OWASP_Dependency_Check (mapping of dependencies to CVEs)\n- https://nodesecurity.io/tools (evaluation of vulnerable packages for npm)\n- http://retirejs.github.io/retire.js/ (JavaScript libraries with known vulnerabilites)',1,26),(33,'Further information: \n\n- https://www.owasp.org/index.php/Blocking_Brute_Force_Attacks',1,29),(34,'To the security critical actions usually belongs:\n\n- changing of password\n- changing of other personal data (e.g. e-mail address, contact data...)\n- usage of particular enhanced rights if these are defined\n\nReauthentication can happen e.g. by input of password, second factor or both.',1,81),(35,'Trusted SSO providers are typically only company-internal ones',1,30),(36,'Unusual circumstances can include:\n\n- previously unused browser\n- previously unused IP address/geolocation/country',1,80),(37,'- Any one time tokens shall be sent to preregistered e-mail address / phone number. \n- All used security questions shall imply large number of possible answers (have a look at http://goodsecurityquestions.com/)\n- All user input shall be protected against brute-force attack as the primary authentication\n- more information:\n   - https://www.owasp.org/index.php/Forgot_Password_Cheat_Sheet\n   - http://www.troyhunt.com/2012/05/everything-you-ever-wanted-to-know.html',1,33),(38,'Security relevant session cookie parameters are:\n\n- `HttpOnly`: Prevents access to the session id from HTTP body\n- `Secure`: Ensures that session id will be sent via SSL/TLS only\n- `Domain`: Scopes the domain which the session id will be sent to\n- `Path`: Scopes the path which the session id will be sent to\n- `Expires`: Sets the time until when the session id will be remembered (if not set, the session id will be forgotten by the browser once closed)',1,9),(39,'On big screens, there should always be a dedicated logout button on the screen. On small screens, the button should be at least easily and intuitively locatable.',1,79),(40,'Providing the user with a screen displaying the details (user agent, geolocation, device type) about all active sessions is recommended.',1,78),(41,'Access control matrix (https://en.wikipedia.org/wiki/Access_Control_Matrix) should be defined and documented.',1,50),(42,'The following aspects should be considered:\n\n- is anybody else besides the data owner supposed to access the data?\n- should the system support multiple tenants?',1,3),(43,'Examples:\n\n- access to sensitive data should be limited to a certain number per hour/day/...\n- performing actions with impact on other systems (e.g. sending a mail...)',1,53),(44,'Sensitive or personal data should never be transmitted/accepted as GET parameter.',1,41),(45,'More information to CSRF and its prevention:\n\n- https://www.owasp.org/index.php/Cross-Site_Request_Forgery_%28CSRF%29\n\nDo not forget to consider unauthenticated CSRF attacks if relevant!',1,36),(46,'Explanation of clickjacking and prevention possibilities:\n\n- https://www.owasp.org/index.php/Clickjacking\n- https://www.owasp.org/index.php/Clickjacking_Defense_Cheat_Sheet\n\nUsage of appropriately configured `X-Frame-Options` HTTP Header is recommended. The most secure settings (disallowing rendering of the site in an iframe completely:\n```HTTP\nX-Frame-Options: DENY\n```',1,7),(47,'More information:\n\n- https://www.owasp.org/index.php/Unvalidated_Redirects_and_Forwards_Cheat_Sheet',1,40),(48,'More information:\n\n- https://www.owasp.org/index.php/Buffer_Overflows',1,38),(49,'More information:\n\n- https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet',1,43),(50,'More information:\n\n- https://www.owasp.org/index.php/Transport_Layer_Protection_Cheat_Sheet',1,46),(51,'More information:\n\n- https://en.wikipedia.org/wiki/Content_Security_Policy\n- http://content-security-policy.com/\n- http://www.html5rocks.com/en/tutorials/security/content-security-policy/',1,44),(52,'All content residing outside of the company\'s infrastructure should be considered as untrusted. If there is the need to include 3rd party JavaScript (e.g. advertisement), this should be isolated in iframes using sandbox attributes (http://www.w3schools.com/tags/att_iframe_sandbox.asp).',1,45),(53,'Other connection parameters can be:\n\n- user agent / device type\n- IP address / geolocation data',1,76),(54,'These interfaces can include (but are not limited to):\n\n- SQL\n- NoSQL\n- Web Services\n- LDAP\n- ...\n\nParametrized queries should be used in all cases.',1,62),(55,'Appropriate framework functionality or dedicated trustworthy library should be used for HTML escaping. More information:\n\n- https://www.owasp.org/index.php/XSS_%28Cross_Site_Scripting%29_Prevention_Cheat_Sheet',1,54),(56,'One of the following algorithms should be used:\n\n- bcrypt: https://en.wikipedia.org/wiki/Bcrypt\n- scrypt: https://en.wikipedia.org/wiki/Scrypt\n- PBKDF2: https://en.wikipedia.org/wiki/PBKDF2',1,65),(57,'Reauthentication means verifiying user\'s identity, e.g. by reentering password when setting a new password or changing contact details.\n\nChanging security level can include e.g.:\n\n- elevation of privileges\n- changing into a different security context, e.g. when working with more sensitive data',1,75),(59,'Use strong random number generators. \n\n- E.g. with JAVA, use `java.security.SecureRandom` instead of `java.util.random`.\n- For PHP 7+, use `random_bytes`, for PHP 5.3+ use `openssl_random_pseudo_bytes()` instead of `rand()` or `mt_rand`.',1,35),(60,'The following checks should be performed if appropriate:\n\n- file size, name, extension, content type and structure\n- presence of malware signatures',1,37),(61,'More information on robots.txt files: http://www.robotstxt.org/',1,70),(62,'Combination of the following headers is recommended:\n```HTTP\nCache-control: no-cache\nCache-control: no-store\nPragma: no-cache\nExpires: 0\n```',1,74),(63,'All storages (DBs, config files...) should be documented including their protection mechanisms. Do not store passwords in source code, use the configuration files on the server side or keychain with mobile apps to store (optionally encrypted)  tokens',1,72),(64,'If needed, OAuth (https://en.wikipedia.org/wiki/OAuth) or better OpenID Connect (https://en.wikipedia.org/wiki/OpenID_Connect) tokens can be stored, especially in mobile apps.',1,73),(65,'Inactivity timeout means the time since last user\'s action. Make sure that potential \"hearbeat\" requests do not impact this timeout.',1,5),(66,'Absolute session timeout defines the time how long a session can be valid since the login event. \n\nPossible implementation (JAVA): http://stackoverflow.com/questions/12963174/absolute-session-expiration-after-n-minutes-even-if-user-is-using-the-system',1,48),(67,'User can be informed using his preregistered e-mail address, or other channel (e.g. SMS, push message) should be considered especially with applications of higher criticality.',1,82),(68,'New system should be documented in an asset management system.',1,25),(69,'The following options should be combined appropriately:\n\n- automatic source code scans:\n   - Fortify: Security Mentor can find out or will know wheather the company license is available for you\n   - FindSecurityBugs: open source, available via http://find-sec-bugs.github.io/\n- blackbox texts, using e.g.:\n   - Qualys: Contact Information Security Department for more information\n   - Zed Attack Proxy: open source, available via https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project\n   - appropriate open source security tool',1,27),(70,'Output of this meeting should be meeting minutes documented in the particular JIRA ticket. At least the following two topics should be discussed:\n\n- what were the findings from security QA and how they can be prevented in the future\n- how the SSDLC process can be optimized in the future, in regards to both technical and lifecycle requirements',1,28),(71,'E.g. no personal-related data like address, name, e-mail address or phone numbers should be logged.\n\nIf session context is necessary for debugging reasons, consider logging hashed session id instead of plain text session id.',1,69),(72,'Such data should include:\n\n- timestamp from a reliable source\n- event severity level \n- event type identifier \n- identity of the user \n- source IP address \n- event result',1,68),(73,'In scope of the policy should be at least key generation, distribution, revokation and expiration.',1,64),(74,'Beware that security sensitive actions can include also read-only access to sensitive data.',1,67),(75,'Consider especially CRLF and non-ASCII characters or better use appropriate functions if available.',1,55),(76,'Depending on the structure of the log files, consider characters which could lead to log forging (e.g. CRLF).',1,60),(77,'Executing system commands is highly discouraged.',1,83),(78,'Do not perform any authentication decisions on the client side (browser, mobile app, ...)',1,31),(79,'Prevention of cross-site scripting (XSS) attack: https://en.wikipedia.org/wiki/Cross-site_scripting',2,54),(80,'If a SSO server is used, the system doesn\'t have to take care of any other requirements regarding authentication and password persistences.',2,30),(81,'Attacker can easily script login attempts iterating different passwords till the right one is found. Usually password lists (gathered during company hacks) are used, see e.g. http://www.passwordrandom.com/most-popular-passwords.',2,29),(82,'Select appropriate HTTP Headers:\n\n- `Strict Transport Security` - https://www.owasp.org/index.php/HTTP_Strict_Transport_Security\n- `X-XSS-Protection` - http://blogs.msdn.com/b/ieinternals/archive/2011/01/31/controlling-the-internet-explorer-xss-filter-with-the-x-xss-protection-http-header.aspx\n- `X-Content-Type-Options`- https://kb.sucuri.net/warnings/hardening/headers-x-content-type\n- `Public-Key-Pins` - https://developer.mozilla.org/en-US/docs/Web/Security/Public_Key_Pinning\n- if CORS requests are used, the `Access-Control-Allow-Origin` and related headers have to be set according to minimal privileges: https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS',1,84),(83,'Clearing out the security aspects early in the design phase decreases the costs and enables to impact the solution design in a positive way.',2,12),(84,'The goal of the security workshop is to present previously agreed security requirements and their way of implementation to all stakeholders.',2,13),(85,'Final security verification gate before the development starts.',2,14),(86,'Get a deep understanding of the system architecture and use methodical approach to identify design mistakes.',2,19),(88,'Identify major security vulnerabilities and get an idea if security requirements have been followed as expected.',2,21),(89,'Simulate the attacks which the system will probably face after deployment and identify implemented security vulnerabilities.',2,22),(90,'Find out whether defense-in-depth measures have been implemented.',2,23),(91,'Identify possible backdoors and other security vulnerabilities which are difficult to find during a penetration test.',2,24),(92,'Helps to identify contact persons quickly in cases of security incidents.',2,25),(93,'Identify vulnerabilities introduced during continuous development.',2,27),(94,'Ensure the continuous development of requirements according to gathered experience, share the security know throughout the company.',2,28),(95,'Decrease the security risk being introduced by using vulnerable libraries. Be able to find out quickly if we\'re affected when new vulnerabilities are published.',2,26),(96,'Mitigates the risk of privilege escalation attacks.',2,51),(97,'Mitigates the impact on backend systems if the system gets hacked itself.',2,49),(98,'External (3rd party) server can get compromised or unavailable with direct impact on the developed system',2,45),(99,'An attacker can circumvent authentication if the decision is made on a compromised system or on the client side.',2,31),(100,'Mitigates the risk of identity theft done if the victim\'s password gets compromised.',2,1),(101,'Prevents attacker from complete account takeover if only session token gets stolen.',2,81),(102,'Enables us to set appropriate password policy for system clients according to current needs.',2,32),(103,'Limits the impact if attacker manages to steal the password.',2,47),(104,'Helps the client to identify identity theft.',2,80),(105,'Helps the user to identify a possibly fraudulent account takeover.',2,82),(106,'In case the backup authentication process is less strong than the primary one, the attacker will attack the backup authentication process directly.',2,33),(107,'Mitigates the risk of a successful fraudulent session takeover.',2,63),(108,'Mitigates the session fixation attack: https://www.owasp.org/index.php/Session_fixation',2,75),(109,'Clients will not logout properly if they don\'t find a logout link.',2,79),(110,'The user will be logged out automatically if he forgets to this himself.',2,5),(111,'Once an attacker takes over an authenticated session, he could keep misusing it forever (using a heartbeat script).',2,48),(112,'Mitigates the risk of session ID abuse if it gets stolen.',2,76),(113,'Mitigates a successful DoS attack.',2,77),(114,'Enables a user to identify and terminate fraudulent sessions himself.',2,78),(115,'Mitigates the risk of privilege escalation.',2,52),(116,'Prevents forging of logs.',2,60),(117,'Mitigates the risk of remote command execution: https://www.owasp.org/index.php/Command_Injection',2,83),(118,'Mitigates the risk of an HTTP Header Injection: https://en.wikipedia.org/wiki/HTTP_header_injection',2,55),(119,'Mitigates the risk of injections of the queries sent to the backend system (e.g. SQL Injection).',2,62),(120,'Mitigates the impact of database content leakage, e.g. via a successful SQL Injection or insider attack. The goal is to make cracking of password reasonably difficult.',2,65),(121,'Prevents Man in the middle attacks: https://en.wikipedia.org/wiki/Man-in-the-middle_attack',2,43),(122,'Prevents the clickjacking attack (attacker can social engineer a user into carrying out undesired actions): https://en.wikipedia.org/wiki/Clickjacking',2,7),(123,'This a quick-win hardening measure making use of browser security features.\n\nIt also helps the site to get better reputation. E.g. with the site https://securityheaders.io anyone can quickly check and share the results.',2,84),(124,'Content Security policy mitigates the impact of different vulnerabilities which might be present in the applicaition, especially Cross-Site Scripting.',2,44),(125,'Mitigates the risk of:\n- internal attacks\n- swapping of data sets due to weak TCP-Checksum',2,46),(126,'If random values are not \"random enough\", an attacker can guess them and thus circumvent security measures based on randomness.',2,35),(127,'Cryptography is a discipline which evolves very quickly because of steadily increasing HW power and vulnerabilities found in algorithms. As best practises change constantly, there is a high risk of adopting legacy best practises.',2,34),(128,'Examples can include:\n- database account doesn\'t have privileges to create/delete tables if not needed\n- account for a backend web service has only read rights if write rights are not needed\n- the artefact has only access to data sets which it\'s explicitely allowed access to, e.g based on organizational unit (tenant)',1,49),(129,'More information to multi-factor authentication: \n- https://en.wikipedia.org/wiki/Multi-factor_authentication',1,1),(130,'Complexity rules include:\n- number/combination of mandatory character sets used (Letters, capitals, numbers, special characters)\n- minimal length of the used password\n- potentially blacklist of known weak passwords',1,32),(131,'The password expiration period can be set as inactive by configuration, nevertheless shall be possible to enforce if needed.',1,47),(132,'Example:\n- Tomcat Sessions\n\nSession Management Cheat Sheet:\n- https://www.owasp.org/index.php/Session_Management_Cheat_Sheet',1,63),(133,'Recommended authorization frameworks include:\n- Spring Security: http://projects.spring.io/spring-security/\n- Apache Shiro: http://shiro.apache.org/\n- OACC: http://oaccframework.org/',1,52),(134,'Input validation rules include:\n- input data type (String, Integer, Boolean...)\n- input length\n- input value (e.g. allowed characters or numeric values)',1,39),(135,'These include:\n- stack overflow\n- technical exception details',1,66),(136,'The unauthenticated access should be allowed only under the following circumstances:\n- only public data are involved\n- only read access is possible',1,85);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPTCOLUMNTYPE`
--

LOCK TABLES `OPTCOLUMNTYPE` WRITE;
/*!40000 ALTER TABLE `OPTCOLUMNTYPE` DISABLE KEYS */;
INSERT INTO `OPTCOLUMNTYPE` VALUES (1,'ShortText','To be specified'),(2,'FancyText','To be specified.'),(3,'OnDemandText','To be specified');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROJECTTYPE`
--

LOCK TABLES `PROJECTTYPE` WRITE;
/*!40000 ALTER TABLE `PROJECTTYPE` DISABLE KEYS */;
INSERT INTO `PROJECTTYPE` VALUES (1,'Internal','Internally developed application',10,''),(2,'External','Extenally developed applications, internally operated',20,''),(3,'Cloud','Externally developed, externally operated',30,'');
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
INSERT INTO `PROJECTTYPE_OPTCOLUMN` VALUES (1,1),(1,2),(1,3),(2,1),(3,1);
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
INSERT INTO `PROJECTTYPE_STATUSCOLUMN` VALUES (1,1),(3,1),(3,2),(3,3),(4,2),(4,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQCATEGORY`
--

LOCK TABLES `REQCATEGORY` WRITE;
/*!40000 ALTER TABLE `REQCATEGORY` DISABLE KEYS */;
INSERT INTO `REQCATEGORY` VALUES (1,'Lifecycle','LC','Activities to be done',10,''),(2,'Authentication','AU','Requirements for authentication of clients/consumers',20,''),(3,'Session Management','SM','Session management requirements',30,''),(4,'Access Control','AC','Access control rules for artifact clients/consumers.',40,''),(5,'Input Validation','IV','Validation of inputs',50,''),(6,'Output Encoding','OE','Output encoding requirements',60,''),(7,'Cryptography','CR','Cryptography and generation of random numbers',70,''),(8,'Error Handling and Logging','EHL','Error Handling and Logging',80,''),(9,'Data Protection','DP','Data Protection',90,''),(10,'Communication Security','CS','Communication Security',100,''),(11,'Secure Architecture','SA','Design decisions with impact on security',15,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIREMENTSKELETON`
--

LOCK TABLES `REQUIREMENTSKELETON` WRITE;
/*!40000 ALTER TABLE `REQUIREMENTSKELETON` DISABLE KEYS */;
INSERT INTO `REQUIREMENTSKELETON` VALUES (1,'','AU-03','Use multifactor authentication for clients.',30,'',2),(2,'','LC-01','Appoint the Security Mentor role.',10,'',1),(3,'','AC-03','Consumers are only allowed to access data based on least privilege principle.',30,'',4),(4,'','LC-02','Define/verify the security criticality of all relevant artifacts.',20,'',1),(5,'','SM-05','Inactivity session timeout is easily configurable',50,'',3),(7,'','IV-05','Clickjacking is prevented.',50,'',5),(9,'','SM-02','Session IDs are transfered in cookies only, protected with all appropriate security parameters',20,'',3),(11,'','LC-03','Plan relevant security trainings for the project team.',30,'',1),(12,'','LC-04','Specify and communicate relevant security requirements.',40,'',1),(13,'','LC-05','Hold a security workshop with the project team.',50,'',1),(14,'','LC-06','Perform a security review of technical documentation.',60,'',1),(19,'','LC-07','Carry out and a threat model and address the findings.',70,'',1),(21,'','LC-09','Perform and document a lightweight security test.',90,'',1),(22,'','LC-10','Perform and document a penetration test.',100,'',1),(23,'','LC-11','Perform and document security review of relevant infrastructure.',110,'',1),(24,'','LC-12','Perform and document security review of relevant source code.',120,'',1),(25,'','LC-13','Document newly implemented artifacts and relevant changes on modified systems in the central asset management system.',130,'',1),(26,'','SA-01','3rd party code is identified, checked for security vulnerabilities and its update process is defined.',10,'',11),(27,'','LC-15','Setup regular application security checks.',150,'',1),(28,'','LC-16','Hold a lessons learned workshop as soon as the project is closed.',160,'',1),(29,'','AU-04','Prevent account bruteforce attacks',40,'',2),(30,'','AU-01','Use a trusted Single Sign-On provider',10,'',2),(31,'','AU-02','Operate all authentication controls on a trusted system',20,'',2),(32,'','AU-06','Passwords for system consumers have easily configurable complexity.',60,'',2),(33,'','AU-10','Password forgotten process is at least as strong as the primary authentication.',100,'',2),(34,'','CR-01','Evaluate all used cryptography libraries and their settings for their security',10,'',7),(35,'','CR-04','Generate random values securely',40,'',7),(36,'','IV-04','Cross-Site Request Forgery attacks are mitigated.',40,'',5),(37,'','IV-07','File upload functionality uses appropriate input validation controls.',70,'',5),(38,'','IV-08','Buffer overflow attacks are mitigated.',80,'',5),(39,'','IV-03','Appropriate positive validation pattern is defined and applied to all input. Invalid input is rejected.',30,'',5),(40,'','IV-06','Redirects do not include untrusted data. In case this is needed, dereferrer is used.',60,'',5),(41,'','IV-02','For every accepted parameter, appropriate HTTP method is defined and enforced.',20,'',5),(42,'','IV-01','Common and approved data validation libraries are used for input validation.',10,'',5),(43,'','CS-01','All sensitive/authenticated communication between the system and its consumers happens via TLS.',10,'',10),(44,'','CS-03','Content Security Policy is implemented',30,'',10),(45,'','SA-04','All content is delivered securely, reliably and from trusted sources. If there is the need to include external sources, they are properly isolated.',40,'',11),(46,'','CS-02','All sensitive/authenticated communication between the system and all backend systems is secured via TLS.',20,'',10),(47,'','AU-07','Password expiration period is easily configurable.',70,'',2),(48,'','SM-06','Absolute session timeout is easily configurable',60,'',3),(49,'','SA-03','All connections to other artefacts/systems use an account with the minimum privileges necessary for the artefact to function properly.',30,'',11),(50,'','AC-02','Consumers are only allowed to access methods/functions based on least privilege principle.',20,'',4),(51,'','SA-02','No fundamentally different roles are present in the same application.',20,'',11),(52,'','AC-01','All access controls are enforced on the server side and use centralized libraries.',10,'',4),(53,'','AC-04','Limitations on input and access imposed by the business on the system cannot be bypassed.',40,'',4),(54,'','OE-02','All untrusted data that are output to HTML are properly escaped for the applicable context using a common and standardized approach.',20,'',6),(55,'','OE-03','No untrusted unescaped data are output to HTTP Headers.',30,'',6),(60,'','OE-04','No untrusted unescaped data are written into log files.',40,'',6),(62,'','OE-01','All untrusted data outputted to any interface are properly escaped for the particular context using a common and standardized approach.',10,'',6),(63,'','SM-01','Robust and properly configured session management solution operated on a trusted system is used.',10,'',3),(64,'','CR-02','There is an explicit policy for how cryptographic keys are managed.',20,'',7),(65,'','CR-03','Consumer passwords/PINs are stored using crypthographically strong salted hashes.',30,'',7),(66,'','EHL-01','The system does not output error messages data that could assist an attacker.',10,'',8),(67,'','EHL-02','Security relevant events are identified and logged.',20,'',8),(68,'','EHL-03','Each log event includes all data used to evaluate security relevant events.',30,'',8),(69,'','EHL-04','The system does not log application-specific sensitive data that could assist an attacker, including clients\' session ids and personal or sensitive information.',40,'',8),(70,'','EHL-05','Robots.txt file is deployed, revealing no sensitive data.',50,'',8),(71,'','DP-01','Sensitive data cached by the system are protected from unauthorized access and purged  once not needed anymore.',10,'',9),(72,'','DP-02','Credentials for backend systems are stored in a secure manner.',20,'',9),(73,'','DP-03','Passwords are never stored on the client side.',30,'',9),(74,'','DP-04','Sensitive data sent to the client side are protected from being cached by the browser using appropriate HTTP headers.',40,'',9),(75,'','SM-03','Session ID must be changed on login, reauthentication or change of the security level.',30,'',3),(76,'','SM-07','Session is bound to other connection parameters.',70,'',3),(77,'','SM-08','Number of possible concurrent sessions for one user is easily configurable on the server side.',80,'',3),(78,'','SM-09','User has the possibility to discard all active sessions.',90,'',3),(79,'','SM-04','Logout functionality is easily accessible throughout the whole authenticated session.',40,'',3),(80,'','AU-08','Users are notified when logging in under unusual circumstances.',80,'',2),(81,'','AU-05','Users must re-authenticate prior to performing security critical operations.',50,'',2),(82,'','AU-09','Users are notified when a password reset occurs on their account.',90,'',2),(83,'','OE-05','No untrusted unescaped data are output as local system commands.',50,'',6),(84,NULL,'CS-04','Security-relevant HTTP Headers are implemented and correctly set.',40,'',10),(85,NULL,'AU-00','If there are any interfaces allowing unauthenticated access, there is an explicit and approved reason to do so.',0,'',2);
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
INSERT INTO `REQUIREMENTSKELETON_COLLECTIONINSTANCE` VALUES (1,2),(1,3),(1,4),(1,5),(1,9),(1,11),(1,12),(1,21),(1,25),(1,29),(1,30),(1,31),(1,32),(1,33),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,43),(1,45),(1,47),(1,50),(1,52),(1,54),(1,55),(1,60),(1,62),(1,63),(1,65),(1,66),(1,69),(1,70),(1,72),(1,73),(1,75),(1,79),(1,81),(1,83),(1,84),(1,85),(2,2),(2,3),(2,4),(2,5),(2,7),(2,9),(2,11),(2,12),(2,13),(2,14),(2,22),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,45),(2,46),(2,47),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,60),(2,62),(2,63),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70),(2,71),(2,72),(2,73),(2,74),(2,75),(2,79),(2,81),(2,83),(2,84),(2,85),(3,1),(3,2),(3,3),(3,4),(3,5),(3,7),(3,9),(3,11),(3,12),(3,13),(3,14),(3,19),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(3,28),(3,29),(3,30),(3,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,42),(3,43),(3,44),(3,45),(3,46),(3,47),(3,48),(3,49),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,60),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(4,1),(4,2),(4,3),(4,4),(4,5),(4,7),(4,9),(4,11),(4,12),(4,13),(4,14),(4,19),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(4,32),(4,33),(4,34),(4,35),(4,36),(4,37),(4,38),(4,39),(4,40),(4,41),(4,42),(4,43),(4,44),(4,45),(4,46),(4,47),(4,48),(4,49),(4,50),(4,51),(4,52),(4,53),(4,54),(4,55),(4,60),(4,62),(4,63),(4,64),(4,65),(4,66),(4,67),(4,68),(4,69),(4,70),(4,71),(4,72),(4,73),(4,74),(4,75),(4,76),(4,77),(4,78),(4,79),(4,80),(4,81),(4,82),(4,83),(4,84),(4,85),(5,2),(5,3),(5,4),(5,5),(5,9),(5,11),(5,12),(5,13),(5,14),(5,19),(5,21),(5,22),(5,23),(5,24),(5,25),(5,26),(5,28),(5,29),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,53),(5,55),(5,60),(5,62),(5,63),(5,64),(5,65),(5,66),(5,67),(5,68),(5,69),(5,70),(5,71),(5,72),(5,74),(5,75),(5,76),(5,77),(5,78),(5,80),(5,83),(5,84),(5,85),(6,1),(6,2),(6,4),(6,11),(6,12),(6,13),(6,14),(6,19),(6,21),(6,22),(6,24),(6,25),(6,26),(6,28),(6,34),(6,35),(6,38),(6,39),(6,40),(6,41),(6,42),(6,45),(6,49),(6,60),(6,62),(6,64),(6,65),(6,66),(6,67),(6,69),(6,71),(6,73),(6,79),(6,83),(6,85),(7,2),(7,3),(7,4),(7,5),(7,7),(7,9),(7,11),(7,12),(7,13),(7,14),(7,19),(7,21),(7,22),(7,23),(7,24),(7,25),(7,26),(7,27),(7,28),(7,30),(7,34),(7,35),(7,36),(7,37),(7,38),(7,39),(7,40),(7,41),(7,42),(7,43),(7,44),(7,45),(7,46),(7,48),(7,49),(7,50),(7,51),(7,52),(7,53),(7,54),(7,55),(7,60),(7,62),(7,63),(7,64),(7,66),(7,67),(7,68),(7,69),(7,70),(7,71),(7,72),(7,73),(7,74),(7,75),(7,76),(7,77),(7,78),(7,79),(7,83),(7,84),(8,1),(8,2),(8,3),(8,4),(8,5),(8,7),(8,9),(8,11),(8,12),(8,13),(8,14),(8,19),(8,21),(8,22),(8,23),(8,24),(8,25),(8,26),(8,27),(8,28),(8,29),(8,31),(8,32),(8,33),(8,34),(8,35),(8,36),(8,37),(8,38),(8,39),(8,40),(8,41),(8,42),(8,43),(8,44),(8,45),(8,46),(8,48),(8,49),(8,50),(8,51),(8,52),(8,53),(8,54),(8,55),(8,60),(8,62),(8,63),(8,64),(8,66),(8,67),(8,68),(8,69),(8,70),(8,71),(8,72),(8,73),(8,74),(8,75),(8,76),(8,77),(8,78),(8,79),(8,80),(8,81),(8,82),(8,83),(8,84),(9,1),(9,2),(9,3),(9,4),(9,5),(9,7),(9,9),(9,11),(9,12),(9,13),(9,14),(9,19),(9,21),(9,22),(9,23),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,31),(9,32),(9,33),(9,34),(9,35),(9,36),(9,37),(9,38),(9,39),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(9,47),(9,48),(9,49),(9,50),(9,51),(9,52),(9,53),(9,54),(9,55),(9,60),(9,62),(9,63),(9,64),(9,65),(9,66),(9,67),(9,68),(9,69),(9,70),(9,71),(9,72),(9,73),(9,74),(9,75),(9,76),(9,77),(9,78),(9,79),(9,80),(9,81),(9,82),(9,83),(9,84),(10,2),(10,3),(10,4),(10,5),(10,7),(10,9),(10,11),(10,12),(10,13),(10,14),(10,19),(10,21),(10,22),(10,23),(10,24),(10,25),(10,26),(10,27),(10,28),(10,31),(10,34),(10,35),(10,36),(10,37),(10,38),(10,39),(10,40),(10,41),(10,42),(10,43),(10,44),(10,45),(10,46),(10,48),(10,49),(10,50),(10,51),(10,52),(10,53),(10,54),(10,55),(10,60),(10,62),(10,63),(10,64),(10,66),(10,67),(10,68),(10,69),(10,70),(10,71),(10,72),(10,73),(10,74),(10,75),(10,76),(10,77),(10,78),(10,79),(10,80),(10,83),(10,84),(11,2),(11,4),(11,5),(11,7),(11,9),(11,11),(11,12),(11,13),(11,14),(11,19),(11,21),(11,22),(11,23),(11,24),(11,25),(11,26),(11,27),(11,28),(11,34),(11,35),(11,36),(11,37),(11,38),(11,39),(11,40),(11,41),(11,42),(11,43),(11,44),(11,45),(11,46),(11,48),(11,49),(11,51),(11,53),(11,54),(11,55),(11,60),(11,62),(11,63),(11,64),(11,66),(11,67),(11,68),(11,69),(11,70),(11,71),(11,72),(11,73),(11,74),(11,75),(11,76),(11,77),(11,78),(11,83),(11,84),(11,85),(12,1),(12,2),(12,3),(12,4),(12,7),(12,11),(12,12),(12,13),(12,14),(12,19),(12,21),(12,22),(12,23),(12,24),(12,25),(12,26),(12,27),(12,28),(12,29),(12,30),(12,31),(12,32),(12,33),(12,34),(12,35),(12,36),(12,37),(12,38),(12,39),(12,40),(12,41),(12,42),(12,43),(12,44),(12,45),(12,46),(12,49),(12,50),(12,51),(12,52),(12,53),(12,54),(12,55),(12,60),(12,62),(12,64),(12,65),(12,66),(12,67),(12,68),(12,69),(12,70),(12,71),(12,72),(12,73),(12,74),(12,80),(12,83),(12,84),(12,85),(13,1),(13,2),(13,3),(13,4),(13,5),(13,7),(13,9),(13,11),(13,12),(13,13),(13,14),(13,19),(13,21),(13,22),(13,23),(13,24),(13,25),(13,26),(13,27),(13,28),(13,29),(13,30),(13,31),(13,32),(13,33),(13,34),(13,35),(13,36),(13,37),(13,38),(13,39),(13,40),(13,41),(13,42),(13,43),(13,44),(13,45),(13,46),(13,47),(13,48),(13,49),(13,50),(13,51),(13,52),(13,53),(13,54),(13,55),(13,60),(13,62),(13,63),(13,64),(13,65),(13,66),(13,67),(13,68),(13,69),(13,70),(13,71),(13,72),(13,73),(13,74),(13,75),(13,76),(13,77),(13,78),(13,79),(13,80),(13,81),(13,83),(13,84),(13,85),(14,1),(14,2),(14,3),(14,4),(14,5),(14,7),(14,9),(14,11),(14,12),(14,13),(14,14),(14,19),(14,21),(14,22),(14,23),(14,24),(14,25),(14,26),(14,27),(14,28),(14,29),(14,30),(14,31),(14,32),(14,33),(14,34),(14,35),(14,36),(14,37),(14,38),(14,39),(14,40),(14,41),(14,42),(14,43),(14,44),(14,45),(14,46),(14,48),(14,49),(14,50),(14,51),(14,52),(14,53),(14,54),(14,55),(14,60),(14,62),(14,63),(14,64),(14,65),(14,66),(14,67),(14,68),(14,69),(14,70),(14,71),(14,72),(14,73),(14,74),(14,75),(14,76),(14,77),(14,78),(14,79),(14,80),(14,81),(14,82),(14,83),(14,84),(14,85),(15,1),(15,2),(15,3),(15,4),(15,5),(15,7),(15,9),(15,11),(15,12),(15,13),(15,14),(15,19),(15,21),(15,22),(15,23),(15,24),(15,25),(15,26),(15,27),(15,28),(15,29),(15,30),(15,31),(15,32),(15,33),(15,34),(15,35),(15,36),(15,37),(15,38),(15,39),(15,40),(15,41),(15,42),(15,43),(15,44),(15,45),(15,46),(15,47),(15,48),(15,49),(15,50),(15,51),(15,52),(15,53),(15,54),(15,55),(15,60),(15,62),(15,63),(15,64),(15,65),(15,66),(15,67),(15,68),(15,69),(15,71),(15,72),(15,73),(15,74),(15,75),(15,76),(15,77),(15,78),(15,79),(15,81),(15,82),(15,83),(15,84),(15,85);
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
INSERT INTO `REQUIREMENTSKELETON_PROJECTTYPE` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,7),(1,9),(1,11),(1,12),(1,13),(1,14),(1,19),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38),(1,39),(1,40),(1,41),(1,42),(1,43),(1,44),(1,45),(1,46),(1,47),(1,48),(1,49),(1,50),(1,51),(1,52),(1,53),(1,54),(1,55),(1,60),(1,62),(1,63),(1,64),(1,65),(1,66),(1,67),(1,68),(1,69),(1,70),(1,71),(1,72),(1,73),(1,74),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(2,1),(2,2),(2,3),(2,4),(2,5),(2,7),(2,9),(2,12),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,60),(2,62),(2,63),(2,64),(2,65),(2,66),(2,67),(2,68),(2,69),(2,70),(2,71),(2,72),(2,73),(2,74),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(3,1),(3,2),(3,3),(3,4),(3,5),(3,7),(3,9),(3,12),(3,29),(3,30),(3,31),(3,32),(3,33),(3,36),(3,37),(3,38),(3,39),(3,40),(3,41),(3,43),(3,44),(3,45),(3,46),(3,48),(3,50),(3,51),(3,52),(3,53),(3,54),(3,55),(3,60),(3,62),(3,63),(3,64),(3,65),(3,66),(3,67),(3,68),(3,69),(3,70),(3,71),(3,72),(3,73),(3,74),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85);
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
INSERT INTO `REQUIREMENTSKELETON_TAGINSTANCE` VALUES (5,2),(6,4),(6,11),(7,12),(7,13),(7,14),(7,19),(8,21),(8,22),(8,23),(8,24),(8,25),(9,27),(9,28),(13,1),(13,4),(13,12),(13,29),(13,30),(13,43),(13,46),(13,50),(13,53),(13,65),(13,67),(13,85),(17,2),(17,4),(17,11),(17,12),(17,13),(17,14),(17,19),(17,21),(17,22),(17,23),(17,24),(17,25),(17,27),(17,28),(18,1),(18,3),(18,5),(18,7),(18,9),(18,26),(18,29),(18,30),(18,31),(18,32),(18,33),(18,34),(18,35),(18,36),(18,37),(18,38),(18,39),(18,40),(18,41),(18,42),(18,43),(18,44),(18,45),(18,46),(18,47),(18,48),(18,49),(18,50),(18,51),(18,52),(18,53),(18,54),(18,55),(18,60),(18,62),(18,63),(18,64),(18,65),(18,66),(18,67),(18,68),(18,69),(18,70),(18,71),(18,72),(18,73),(18,74),(18,75),(18,76),(18,77),(18,78),(18,79),(18,80),(18,81),(18,82),(18,83),(18,84),(18,85);
/*!40000 ALTER TABLE `REQUIREMENTSKELETON_TAGINSTANCE` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUSCOLUMN`
--

LOCK TABLES `STATUSCOLUMN` WRITE;
/*!40000 ALTER TABLE `STATUSCOLUMN` DISABLE KEYS */;
INSERT INTO `STATUSCOLUMN` VALUES (1,'Strategy','How will the requirement be handled?','',10,''),(3,'Comment','Precision / further specification for the given artifact','\0',30,''),(4,'Fulfilled','Indicates whether the particular requirement is fulfilled.','',20,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUSCOLUMNVALUE`
--

LOCK TABLES `STATUSCOLUMNVALUE` WRITE;
/*!40000 ALTER TABLE `STATUSCOLUMNVALUE` DISABLE KEYS */;
INSERT INTO `STATUSCOLUMNVALUE` VALUES (1,'Task','The team is supposed to take care of this',10,'',1),(2,'Implicit','No action needed, e.g. because the used technology stack handles the requirement automatically.',20,'',1),(3,'Refused','The requirement won\'t be intentionally implemented.',30,'',1),(7,'Yes','This requirement is fulfilled.',10,'',4),(8,'Partly','This requirement is partly fulfilled (please explain).',20,'',4),(9,'No','This requirement is not fullfilled.',30,'',4),(10,'Unclear','This requirement was not understood.',40,'',4),(12,'Clarify','To be clarified.',40,'',1),(13,'Irrelevant','This requirement is not relevant because of the current scope/functionality',50,'',1),(14,'Irrelevant','This requirement is not relevant.',50,'',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAGCATEGORY`
--

LOCK TABLES `TAGCATEGORY` WRITE;
/*!40000 ALTER TABLE `TAGCATEGORY` DISABLE KEYS */;
INSERT INTO `TAGCATEGORY` VALUES (1,'Requirement Owner','Suggested role which should take care of the requirement',10,'\0'),(2,'Gates','Requirements supposed to be defined before particular gates in case of waterfall-like projects',100,''),(3,'QA','Security QA relevant tags',30,'\0'),(4,'Requirement Type','Defines the type of the requirement (lifecycle vs. technical).',10,''),(5,'Documentation','Requirements which should be documented in different deliverables',20,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAGINSTANCE`
--

LOCK TABLES `TAGINSTANCE` WRITE;
/*!40000 ALTER TABLE `TAGINSTANCE` DISABLE KEYS */;
INSERT INTO `TAGINSTANCE` VALUES (1,'Product Manager','Person who can make business relevant decisions',10,'',1),(2,'Security Mentor','Security expert. Sometimes coming from information security, sometimes from department.',20,'',1),(3,'Project Manager','Role planning project activities.',30,'',1),(4,'SCRUM Master','Because agility matters....',40,'',1),(5,'G0','Project idea',10,'',2),(6,'G1','High-level design',20,'',2),(7,'G2','End of the design phase',30,'',2),(8,'G3','Rollout',40,'',2),(9,'G4','Closing',50,'',2),(10,'BlackBox','We can verify this with a pentest',10,'',3),(11,'Functional Test','This should be handled during regular QA',20,'',3),(12,'White box','Someone has to look into the source code',30,'',3),(13,'Design','Requirements supposed to be documented before the development starts',10,'',5),(17,'Lifecycle','Security related activities which are supposed to be carried out during the development process.',10,'',4),(18,'Technical','Security properties of the target artifact',20,'',4);
/*!40000 ALTER TABLE `TAGINSTANCE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-05 17:33:52