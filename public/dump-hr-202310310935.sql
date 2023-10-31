-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hr
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `idregion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_countries_regions_idx` (`idregion`),
  CONSTRAINT `fk_countries_regions` FOREIGN KEY (`idregion`) REFERENCES `regions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AR','Argentina','2'),('AU','Australia','3'),('BE','Belgium','1'),('BR','Brazil','2'),('CA','Canada','2'),('CH','Switzerland','1'),('CN','China','3'),('DE','Germany','1'),('DK','Denmark','1'),('EG','Egypt','4'),('FR','France','1'),('HK','HongKong','3'),('IL','Israel','4'),('IN','India','3'),('IT','Italy','1'),('JP','Japan','3'),('KW','Kuwait','4'),('MX','Mexico','2'),('NG','Nigeria','4'),('NL','Netherlands','1'),('SG','Singapore','3'),('TH','Thailand','3'),('UK','United Kingdom','1'),('US','United States of America','2'),('ZM','Zambia','4'),('ZW','Zimbabwe','4');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `idlocation` varchar(45) NOT NULL,
  `idmanager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_locations1_idx` (`idlocation`),
  KEY `fk_employees_employees1_idx` (`idmanager`),
  CONSTRAINT `fk_department_locations1` FOREIGN KEY (`idlocation`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_employees1` FOREIGN KEY (`idmanager`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'Administration','1700',200),(20,'Marketing','1800',201),(30,'Purchasing','1700',114),(40,'Human Resources','2400',203),(50,'Shipping','1500',121),(60,'IT','1400',103),(70,'Public Relations','2700',204),(80,'Sales','2500',145),(90,'Executive','1700',100),(100,'Finance','1700',108),(110,'Accounting','1700',205),(120,'Treasury','1700',NULL),(130,'Corporate Tax','1700',NULL),(140,'Control And Credit','1700',NULL),(150,'Shareholder Services','1700',NULL),(160,'Benefits','1700',NULL),(170,'Manufacturing','1700',NULL),(180,'Construction','1700',NULL),(190,'Contracting','1700',NULL),(200,'Operations','1700',NULL),(210,'IT Support','1700',NULL),(220,'NOC','1700',NULL),(230,'IT Helpdesk','1700',NULL),(240,'Government Sales','1700',NULL),(250,'Retail Sales','1700',NULL),(260,'Recruiting','1700',NULL),(270,'Payroll','1700',NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `commission_pct` decimal(4,2) DEFAULT NULL,
  `iddepartment` int(11) DEFAULT NULL,
  `idmanager` int(11) DEFAULT NULL,
  `idjob` varchar(45) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employees_department1_idx` (`iddepartment`),
  KEY `fk_employees_jobs1_idx` (`idjob`),
  CONSTRAINT `fk_employees_department1` FOREIGN KEY (`iddepartment`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steven','King','SKING','515.123.4567','1987-06-17',24000.00,NULL,90,NULL,'AD_PRES','user.png'),(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21',17000.00,NULL,90,100,'AD_VP','user.png'),(102,'Lex','De Haan','LDEHAAN','515.123.4569','1993-01-13',17000.00,NULL,90,100,'AD_VP','user.png'),(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03',9000.00,NULL,60,102,'IT_PROG','user.png'),(104,'Bruce','Ernst','BERNST','590.423.4568','1991-05-21',6000.00,NULL,60,103,'IT_PROG','user.png'),(105,'David','Austin','DAUSTIN','590.423.4569','1997-06-25',4800.00,NULL,60,103,'IT_PROG','user.png'),(106,'Valli','Pataballa','VPATABAL','590.423.4560','1998-02-05',4800.00,NULL,60,103,'IT_PROG','user.png'),(107,'Diana','Lorentz','DLORENTZ','590.423.5567','1999-02-07',4200.00,NULL,60,103,'IT_PROG','user.png'),(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1994-08-17',12000.00,NULL,100,101,'FI_MGR','user.png'),(109,'Daniel','Faviet','DFAVIET','515.124.4169','1994-08-16',9000.00,NULL,100,108,'FI_ACCOUNT','user.png'),(110,'John','Chen','JCHEN','515.124.4269','1997-09-28',8200.00,NULL,100,108,'FI_ACCOUNT','user.png'),(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','1997-09-30',7700.00,NULL,100,108,'FI_ACCOUNT','user.png'),(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','1998-03-07',7800.00,NULL,100,108,'FI_ACCOUNT','user.png'),(113,'Luis','Popp','LPOPP','515.124.4567','1999-12-07',6900.00,NULL,100,108,'FI_ACCOUNT','user.png'),(114,'Den','Raphaely','DRAPHEAL','515.127.4561','1994-12-07',11000.00,NULL,30,100,'PU_MAN','user.png'),(115,'Alexander','Khoo','AKHOO','515.127.4562','1995-05-18',3100.00,NULL,30,114,'PU_CLERK','user.png'),(116,'Shelli','Baida','SBAIDA','515.127.4563','1997-12-24',2900.00,NULL,30,114,'PU_CLERK','user.png'),(117,'Sigal','Tobias','STOBIAS','515.127.4564','1997-07-24',2800.00,NULL,30,114,'PU_CLERK','user.png'),(118,'Guy','Himuro','GHIMURO','515.127.4565','1998-11-15',2600.00,NULL,30,114,'PU_CLERK','user.png'),(119,'Karen','Colmenares','KCOLMENA','515.127.4566','1999-08-10',2500.00,NULL,30,114,'PU_CLERK','user.png'),(120,'Matthew','Weiss','MWEISS','650.123.1234','1996-07-18',8000.00,NULL,50,100,'ST_MAN','user.png'),(121,'Adam','Fripp','AFRIPP','650.123.2234','1997-04-10',8200.00,NULL,50,100,'ST_MAN','user.png'),(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','1995-05-01',7900.00,NULL,50,100,'ST_MAN','user.png'),(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','1997-10-10',6500.00,NULL,50,100,'ST_MAN','user.png'),(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','1999-11-16',5800.00,NULL,50,100,'ST_MAN','user.png'),(125,'Julia','Nayer','JNAYER','650.124.1214','1997-07-16',3200.00,NULL,50,120,'ST_CLERK','user.png'),(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','1998-09-28',2700.00,NULL,50,120,'ST_CLERK','user.png'),(127,'James','Landry','JLANDRY','650.124.1334','1999-01-14',2400.00,NULL,50,120,'ST_CLERK','user.png'),(128,'Steven','Markle','SMARKLE','650.124.1434','2000-03-08',2200.00,NULL,50,120,'ST_CLERK','user.png'),(129,'Laura','Bissot','LBISSOT','650.124.5234','1997-08-20',3300.00,NULL,50,121,'ST_CLERK','user.png'),(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','1997-10-30',2800.00,NULL,50,121,'ST_CLERK','user.png'),(131,'James','Marlow','JAMRLOW','650.124.7234','1997-02-16',2500.00,NULL,50,121,'ST_CLERK','user.png'),(132,'TJ','Olson','TJOLSON','650.124.8234','1999-04-10',2100.00,NULL,50,121,'ST_CLERK','user.png'),(133,'Jason','Mallin','JMALLIN','650.127.1934','1996-06-14',3300.00,NULL,50,122,'ST_CLERK','user.png'),(134,'Michael','Rogers','MROGERS','650.127.1834','1998-08-26',2900.00,NULL,50,122,'ST_CLERK','user.png'),(135,'Ki','Gee','KGEE','650.127.1734','1999-12-12',2400.00,NULL,50,122,'ST_CLERK','user.png'),(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','2000-02-06',2200.00,NULL,50,122,'ST_CLERK','user.png'),(137,'Renske','Ladwig','RLADWIG','650.121.1234','1995-07-14',3600.00,NULL,50,123,'ST_CLERK','user.png'),(138,'Stephen','Stiles','SSTILES','650.121.2034','1997-10-26',3200.00,NULL,50,123,'ST_CLERK','user.png'),(139,'John','Seo','JSEO','650.121.2019','1998-02-12',2700.00,NULL,50,123,'ST_CLERK','user.png'),(140,'Joshua','Patel','JPATEL','650.121.1834','1998-04-06',2500.00,NULL,50,123,'ST_CLERK','user.png'),(141,'Trenna','Rajs','TRAJS','650.121.8009','1995-10-17',3500.00,NULL,50,124,'ST_CLERK','user.png'),(142,'Curtis','Davies','CDAVIES','650.121.2994','1997-01-29',3100.00,NULL,50,124,'ST_CLERK','user.png'),(143,'Randall','Matos','RMATOS','650.121.2874','1998-03-15',2600.00,NULL,50,124,'ST_CLERK','user.png'),(144,'Peter','Vargas','PVARGAS','650.121.2004','1998-07-09',2500.00,NULL,50,124,'ST_CLERK','user.png'),(145,'John','Russell','JRUSSEL','011.44.1344.429268','1996-10-01',14000.00,0.40,80,100,'SA_MAN','user.png'),(146,'Karen','Partners','KPARTNER','011.44.1344.467268','1997-01-05',13500.00,0.30,80,100,'SA_MAN','user.png'),(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','1997-03-10',12000.00,0.30,80,100,'SA_MAN','user.png'),(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','1999-10-15',11000.00,0.30,80,100,'SA_MAN','user.png'),(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','2000-01-29',10500.00,0.20,80,100,'SA_MAN','user.png'),(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','1997-01-30',10000.00,0.30,80,145,'SA_REP','user.png'),(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','1997-03-24',9500.00,0.25,80,145,'SA_REP','user.png'),(152,'Peter','Hall','PHALL','011.44.1344.478968','1997-08-20',9000.00,0.25,80,145,'SA_REP','user.png'),(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','1998-03-30',8000.00,0.20,80,145,'SA_REP','user.png'),(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','1998-12-09',7500.00,0.20,80,145,'SA_REP','user.png'),(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','1999-11-23',7000.00,0.15,80,145,'SA_REP','user.png'),(156,'Janette','King','JKING','011.44.1345.429268','1996-01-30',10000.00,0.35,80,146,'SA_REP','user.png'),(157,'Patrick','Sully','PSULLY','011.44.1345.929268','1996-03-04',9500.00,0.35,80,146,'SA_REP','user.png'),(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','1996-08-01',9000.00,0.35,80,146,'SA_REP','user.png'),(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','1997-03-10',8000.00,0.30,80,146,'SA_REP','user.png'),(160,'Louise','Doran','LDORAN','011.44.1345.629268','1997-12-15',7500.00,0.30,80,146,'SA_REP','user.png'),(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','1998-11-03',7000.00,0.25,80,146,'SA_REP','user.png'),(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','1997-11-11',10500.00,0.25,80,147,'SA_REP','user.png'),(163,'Danielle','Greene','DGREENE','011.44.1346.229268','1999-03-19',9500.00,0.15,80,147,'SA_REP','user.png'),(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','2000-01-24',7200.00,0.10,80,147,'SA_REP','user.png'),(165,'David','Lee','DLEE','011.44.1346.529268','2000-02-23',6800.00,0.10,80,147,'SA_REP','user.png'),(166,'Sundar','Ande','SANDE','011.44.1346.629268','2000-03-24',6400.00,0.10,80,147,'SA_REP','user.png'),(167,'Amit','Banda','ABANDA','011.44.1346.729268','2000-04-21',6200.00,0.10,80,147,'SA_REP','user.png'),(168,'Lisa','Ozer','LOZER','011.44.1343.929268','1997-03-11',11500.00,0.25,80,148,'SA_REP','user.png'),(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','1998-03-23',10000.00,0.20,80,148,'SA_REP','user.png'),(170,'Tayler','Fox','TFOX','011.44.1343.729268','1998-01-24',9600.00,0.20,80,148,'SA_REP','user.png'),(171,'William','Smith','WSMITH','011.44.1343.629268','1999-02-23',7400.00,0.15,80,148,'SA_REP','user.png'),(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','1999-03-24',7300.00,0.15,80,148,'SA_REP','user.png'),(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','2000-04-21',6100.00,0.10,80,148,'SA_REP','user.png'),(174,'Ellen','Abel','EABEL','011.44.1644.429267','1996-05-11',11000.00,0.30,80,149,'SA_REP','user.png'),(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','1997-03-19',8800.00,0.25,80,149,'SA_REP','user.png'),(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','1998-03-24',8600.00,0.20,80,149,'SA_REP','user.png'),(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','1998-04-23',8400.00,0.20,80,149,'SA_REP','user.png'),(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','1999-05-24',7000.00,0.15,NULL,149,'SA_REP','user.png'),(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','2000-01-04',6200.00,0.10,80,149,'SA_REP','user.png'),(180,'Winston','Taylor','WTAYLOR','650.507.9876','1998-01-24',3200.00,NULL,50,120,'SH_CLERK','user.png'),(181,'Jean','Fleaur','JFLEAUR','650.507.9877','1998-02-23',3100.00,NULL,50,120,'SH_CLERK','user.png'),(182,'Martha','Sullivan','MSULLIVA','650.507.9878','1999-06-21',2500.00,NULL,50,120,'SH_CLERK','user.png'),(183,'Girard','Geoni','GGEONI','650.507.9879','2000-02-03',2800.00,NULL,50,120,'SH_CLERK','user.png'),(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','1996-01-27',4200.00,NULL,50,121,'SH_CLERK','user.png'),(185,'Alexis','Bull','ABULL','650.509.2876','1997-02-20',4100.00,NULL,50,121,'SH_CLERK','user.png'),(186,'Julia','Dellinger','JDELLING','650.509.3876','1998-06-24',3400.00,NULL,50,121,'SH_CLERK','user.png'),(187,'Anthony','Cabrio','ACABRIO','650.509.4876','1999-02-07',3000.00,NULL,50,121,'SH_CLERK','user.png'),(188,'Kelly','Chung','KCHUNG','650.505.1876','1997-06-14',3800.00,NULL,50,122,'SH_CLERK','user.png'),(189,'Jennifer','Dilly','JDILLY','650.505.2876','1997-08-13',3600.00,NULL,50,122,'SH_CLERK','user.png'),(190,'Timothy','Gates','TGATES','650.505.3876','1998-07-11',2900.00,NULL,50,122,'SH_CLERK','user.png'),(191,'Randall','Perkins','RPERKINS','650.505.4876','1999-12-19',2500.00,NULL,50,122,'SH_CLERK','user.png'),(192,'Sarah','Bell','SBELL','650.501.1876','1996-02-04',4000.00,NULL,50,123,'SH_CLERK','user.png'),(193,'Britney','Everett','BEVERETT','650.501.2876','1997-03-03',3900.00,NULL,50,123,'SH_CLERK','user.png'),(194,'Samuel','McCain','SMCCAIN','650.501.3876','1998-07-01',3200.00,NULL,50,123,'SH_CLERK','user.png'),(195,'Vance','Jones','VJONES','650.501.4876','1999-03-17',2800.00,NULL,50,123,'SH_CLERK','user.png'),(196,'Alana','Walsh','AWALSH','650.507.9811','1998-04-24',3100.00,NULL,50,124,'SH_CLERK','user.png'),(197,'Kevin','Feeney','KFEENEY','650.507.9822','1998-05-23',3000.00,NULL,50,124,'SH_CLERK','user.png'),(198,'Donald','OConnell','DOCONNEL','650.507.9833','1999-06-21',2600.00,NULL,50,124,'SH_CLERK','user.png'),(199,'Douglas','Grant','DGRANT','650.507.9844','2000-01-13',2600.00,NULL,50,124,'SH_CLERK','user.png'),(200,'Jennifer','Whalen','JWHALEN','515.123.4444','1987-09-17',4400.00,NULL,10,101,'AD_ASST','user.png'),(201,'Michael','Hartstein','MHARTSTE','515.123.5555','1996-02-17',13000.00,NULL,20,100,'MK_MAN','user.png'),(202,'Pat','Fay','PFAY','603.123.6666','1997-08-17',6000.00,NULL,20,201,'MK_REP','user.png'),(203,'Susan','Mavris','SMAVRIS','515.123.7777','1994-06-07',6500.00,NULL,40,101,'HR_REP','user.png'),(204,'Hermann','Baer','HBAER','515.123.8888','1994-06-07',10000.00,NULL,70,101,'PR_REP','user.png'),(205,'Shelley','Higgins','SHIGGINS','515.123.8080','1994-06-07',12000.00,NULL,110,101,'AC_MGR','user.png'),(206,'William','Gietz','WGIETZ','515.123.8181','1994-06-07',8300.00,NULL,110,205,'AC_ACCOUNT','user.png');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_history` (
  `start_date` varchar(45) DEFAULT NULL,
  `end_date` varchar(45) DEFAULT NULL,
  `idjob` varchar(45) NOT NULL,
  `idemployee` int(11) NOT NULL,
  `iddepartment` int(11) NOT NULL,
  KEY `fk_job_history_jobs1_idx` (`idjob`),
  KEY `fk_job_history_employees1_idx` (`idemployee`),
  KEY `fk_job_history_department1_idx` (`iddepartment`),
  CONSTRAINT `fk_job_history_department1` FOREIGN KEY (`iddepartment`) REFERENCES `departments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_history_jobs1` FOREIGN KEY (`idjob`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES ('1993-01-13','1998-07-24','IT_PROG',102,60),('1989-09-21','1993-10-27','AC_ACCOUNT',101,110),('1993-10-28','1997-03-15','AC_MGR',101,110),('1996-02-17','1999-12-19','MK_REP',201,20),('1998-03-24','1999-12-31','ST_CLERK',114,50),('1999-01-01','1999-12-31','ST_CLERK',122,50),('1987-09-17','1993-06-17','AD_ASST',200,90),('1998-03-24','1998-12-31','SA_REP',176,80),('1999-01-01','1999-12-31','SA_MAN',176,80),('1994-07-01','1998-12-31','AC_ACCOUNT',200,90);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `min_salary` decimal(10,2) DEFAULT NULL,
  `max_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AC_ACCOUNT','Public Accountant',4200.00,9000.00),('AC_MGR','Accounting Manager',8200.00,16000.00),('AD_ASST','Administration Assistant',3000.00,6000.00),('AD_PRES','President',20000.00,40000.00),('AD_VP','Administration Vice President',15000.00,30000.00),('FI_ACCOUNT','Accountant',4200.00,9000.00),('FI_MGR','Finance Manager',8200.00,16000.00),('HR_REP','Human Resources Representative',4000.00,9000.00),('IT_PROG','Programmer',4000.00,10000.00),('MK_MAN','Marketing Manager',9000.00,15000.00),('MK_REP','Marketing Representative',4000.00,9000.00),('PR_REP','Public Relations Representative',4500.00,10500.00),('PU_CLERK','Purchasing Clerk',2500.00,5500.00),('PU_MAN','Purchasing Manager',8000.00,15000.00),('SA_MAN','Sales Manager',10000.00,20000.00),('SA_REP','Sales Representative',6000.00,12000.00),('SH_CLERK','Shipping Clerk',2500.00,5500.00),('ST_CLERK','Stock Clerk',2000.00,5000.00),('ST_MAN','Stock Manager',5500.00,8500.00);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` varchar(45) NOT NULL,
  `street_address` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state_province` varchar(45) DEFAULT NULL,
  `idcountry` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locations_countries1_idx` (`idcountry`),
  CONSTRAINT `fk_locations_countries1` FOREIGN KEY (`idcountry`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES ('1000','1297 Via Cola di Rie','00989','Roma',NULL,'IT'),('1100','93091 Calle della Testa','10934','Venice',NULL,'IT'),('1200','2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),('1300','9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),('1400','2014 Jabberwocky Rd','26192','Southlake','Texas','US'),('1500','2011 Interiors Blvd','99236','South San Francisco','California','US'),('1600','2007 Zagora St','50090','South Brunswick','New Jersey','US'),('1700','2004 Charade Rd','98199','Seattle','Washington','US'),('1800','147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),('1900','6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),('2000','40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),('2100','1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),('2200','12-98 Victoria Street','2901','Sydney','New South Wales','AU'),('2300','198 Clementi North','540198','Singapore',NULL,'SG'),('2400','8204 Arthur St',NULL,'London',NULL,'UK'),('2500','Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK'),('2600','9702 Chester Road','09629850293','Stretford','Manchester','UK'),('2700','Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),('2800','Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR'),('2900','20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),('3000','Murtenstrasse 921','3095','Bern','BE','CH'),('3100','Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),('3200','Mariano Escobedo 9991','11932','Mexico City','Distrito Federal,','MX');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES ('1','Europe'),('2','Americas'),('3','Asia'),('4','Middle East and Africa');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-31  9:35:23
