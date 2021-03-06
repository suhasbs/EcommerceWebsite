-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `accessory`
--

DROP TABLE IF EXISTS `accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessory` (
  `acc_id` varchar(20) NOT NULL,
  `model_no` varchar(20) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `spec` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`acc_id`),
  CONSTRAINT `acc_id` FOREIGN KEY (`acc_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessory`
--

LOCK TABLES `accessory` WRITE;
/*!40000 ALTER TABLE `accessory` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$sKa9kt8THODw$VWsD16UtQntb8l4VsriqeZ7T3ggpl4P2TqypR0w66iE=','2017-10-20 12:10:36.432649',1,'admin','','','admin@admin.com',1,1,'2017-10-19 08:35:31.219145');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `book_id` varchar(20) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  PRIMARY KEY (`book_id`,`author_name`),
  CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `books` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `billing_price` decimal(10,2) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `bill_replaces` int(11) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `bill_replaces_idx` (`bill_replaces`),
  CONSTRAINT `bill_replaces` FOREIGN KEY (`bill_replaces`) REFERENCES `bill` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `pdt_id` varchar(20) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `summary` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pdt_id`),
  CONSTRAINT `pdt_id` FOREIGN KEY (`pdt_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `no_of_products` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cart_id`,`cust_email`),
  KEY `cust_email_idx` (`cust_email`),
  CONSTRAINT `cust_email` FOREIGN KEY (`cust_email`) REFERENCES `customer` (`email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes`
--

DROP TABLE IF EXISTS `clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothes` (
  `cloth_id` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `material` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `size` varchar(10) NOT NULL,
  PRIMARY KEY (`cloth_id`),
  CONSTRAINT `cloth_id` FOREIGN KEY (`cloth_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes`
--

LOCK TABLES `clothes` WRITE;
/*!40000 ALTER TABLE `clothes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email_id` varchar(100) NOT NULL,
  `contact_no` varchar(15) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `cart_id_idx` (`cart_id`),
  CONSTRAINT `cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-10-19 08:32:00.418757'),(2,'auth','0001_initial','2017-10-19 08:32:11.033245'),(3,'admin','0001_initial','2017-10-19 08:32:13.437824'),(4,'admin','0002_logentry_remove_auto_add','2017-10-19 08:32:13.604131'),(5,'contenttypes','0002_remove_content_type_name','2017-10-19 08:32:15.023288'),(6,'auth','0002_alter_permission_name_max_length','2017-10-19 08:32:15.281893'),(7,'auth','0003_alter_user_email_max_length','2017-10-19 08:32:15.437614'),(8,'auth','0004_alter_user_username_opts','2017-10-19 08:32:15.517436'),(9,'auth','0005_alter_user_last_login_null','2017-10-19 08:32:16.263130'),(10,'auth','0006_require_contenttypes_0002','2017-10-19 08:32:16.297608'),(11,'auth','0007_alter_validators_add_error_messages','2017-10-19 08:32:16.349029'),(12,'auth','0008_alter_user_username_max_length','2017-10-19 08:32:16.756934'),(13,'sessions','0001_initial','2017-10-19 08:32:17.458710');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('sngglzyogvwhykmff1k5lkbf0z21h022','MTI3OWE3YTg1Zjc5YWQ4Y2RmMjZhZDUxZjU1ZGM1ZjU3OTkyYzk0ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRkMzU1ZTkzODI2ZjdiZmM3Mzg2NTg2ZmQxOTI5NjE0NDgwNTEwZDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-11-03 12:10:36.511043');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `furniture` (
  `furniture_id` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `dimensions` varchar(20) DEFAULT NULL,
  `material` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`furniture_id`),
  CONSTRAINT `furniture_id` FOREIGN KEY (`furniture_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `furniture`
--

LOCK TABLES `furniture` WRITE;
/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generate_bill`
--

DROP TABLE IF EXISTS `generate_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generate_bill` (
  `order_id_fk` int(11) NOT NULL,
  `bill_id_fk` int(11) NOT NULL,
  `customer_id_fk` varchar(100) NOT NULL,
  PRIMARY KEY (`bill_id_fk`),
  KEY `fk2_idx` (`customer_id_fk`),
  KEY `fk3_idx` (`bill_id_fk`),
  KEY `fk1` (`order_id_fk`),
  CONSTRAINT `fk1` FOREIGN KEY (`order_id_fk`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2` FOREIGN KEY (`customer_id_fk`) REFERENCES `customer` (`email_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3` FOREIGN KEY (`bill_id_fk`) REFERENCES `bill` (`bill_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generate_bill`
--

LOCK TABLES `generate_bill` WRITE;
/*!40000 ALTER TABLE `generate_bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `generate_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop`
--

DROP TABLE IF EXISTS `laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laptop` (
  `laptop_id` varchar(20) NOT NULL,
  `model_no` varchar(20) DEFAULT NULL,
  `display_size` varchar(10) DEFAULT NULL,
  `harddisk_capacity` varchar(10) DEFAULT NULL,
  `ram` varchar(5) DEFAULT NULL,
  `processor` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`laptop_id`),
  CONSTRAINT `laptop_id` FOREIGN KEY (`laptop_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop`
--

LOCK TABLES `laptop` WRITE;
/*!40000 ALTER TABLE `laptop` DISABLE KEYS */;
/*!40000 ALTER TABLE `laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_data`
--

DROP TABLE IF EXISTS `mobile_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_data` (
  `Index` int(11) DEFAULT NULL,
  `Display_Size` text,
  `Internal_Storage` text,
  `Model_Name` text,
  `Model_Number` text,
  `Primary_Camera` text,
  `Processor_Type` text,
  `RAM` text,
  `Secondary_Camera` text,
  `Weight` text,
  `image_urls` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_data`
--

LOCK TABLES `mobile_data` WRITE;
/*!40000 ALTER TABLE `mobile_data` DISABLE KEYS */;
INSERT INTO `mobile_data` VALUES (0,'5.5 inch','64 GB','Redmi Note 4','MZB5252IN / MZB5279IN / MZB5543IN','13MP','Qualcomm Snapdragon 625 64-bit Octa Core 2GHz','itional Content4GB RAM','5MP','165 g','rukminim1.flixcart.com/image/128/128/mobile/y/u/a/mi-redmi-note-4-na-original-imaeqdxgrdhxgkcx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/y/u/a/mi-redmi-note-4-na-original-imaeqdxgrdhxgkcx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/g/z/mi-redmi-note-4-mzb5298in-original-imaery4rn5pwdmxn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/y/u/a/mi-redmi-note-4-na-original-imaeqdxhsxb3uvty.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/g/z/mi-redmi-note-4-na-original-imaeqdxzsw54nyuf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/r/u/9/mi-redmi-note-4-na-original-imaeqdxgu8dbew2z.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/y/u/a/mi-redmi-note-4-na-original-imaeqdxcax7vpuve.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/y/u/a/mi-redmi-note-4-na-original-imaeqdxmzr5mm3my.jpeg?q=70\n'),(1,'6 inch','64 GB','F3 Plus','CPH1613','16MP','Qualcomm MSM8976 Pro Snapdragon 653','4 GB','16MP + 8MP','185 g','rukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gczhk4zjyz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcgkxbfhhp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcygamrsnr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcdzecnhbj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcutuvcgbn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcyh67hgrv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcqbgjfurw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gca4pbzwb8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gchpaw9uwg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gceqvqdcbv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/q/x/oppo-f3-plus-cph1613-original-imaes9gcqywgcuek.jpeg?q=70\n'),(2,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(3,'5.5 inch','64 GB','Redmi Note 4','MZB5254IN / MZB5545IN','13MP','Qualcomm Snapdragon 625 64-bit Octa Core 2GHz','itional Content4GB RAM','5MP','165 g','rukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxqcrfshtqu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxqcrfshtqu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxgtcgbgvfh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/t/d/mi-redmi-note-4-na-original-imaeqdxd3mv2zpwt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/t/d/mi-redmi-note-4-na-original-imaeqdxgx3z8fhdr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxhqks7qrnw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/t/d/mi-redmi-note-4-na-original-imaeqdxhgnerzpeg.jpeg?q=70\n'),(4,'5.2 inch','32 GB','K8 Plus','PA8C0020IN/PA8C0003IN','13MP + 5MP','MediaTek MTK Helio P25 Octa Core 2.5 GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rupxj9w5f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rzf3ctv5z.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rzxzszmxk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rvbhh3d4j.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rpkyyqrmy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rm6grrvej.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2r2qwmnmqn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rh88uyhvh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rjtfsf73r.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2rg8rdxzpm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/p/t/d/lenovo-k8-plus-pa8c0003in-original-imaexp2r8jaua2f6.jpeg?q=70\n'),(5,'5.9 inch','64 GB','9i','RNE-L22','16MP + 2MP','Huawei Kirin 659 Octa Core Clocked up to 2.36 GHz','4 GB','13MP + 2MP','164 g','rukminim1.flixcart.com/image/128/128/j8rnpu80/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqcgbhzdfvu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqc2drusgpq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8rnpu80/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqcamjs57br.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8rnpu80/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqct2rzjvg2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqcssgvgeve.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqcvrtnk7pg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqczz29g7xj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/k/5/3/honor-9i-rne-l22-original-imaeyhqcjzmwzdqt.jpeg?q=70\n'),(6,'5.5 inch','64 GB','Mi A1','MZB5645IN/MZB5717IN','12MP + 12MP','Qualcomm Snapdragon 625 64 bit Octa Core 2GHz','4 GB','5MP','165 g','rukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9njdddfphr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9njdddfphr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9zkqbgzbk4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9zhehx8yfm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9zndvygh8y.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9zgxrxekgp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexcvyzg9yjubn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/h/e/t/mi-mi-a1-na-original-imaexg9ppespasmh.jpeg?q=70\n'),(7,'5.5 inch','64 GB','Redmi Note 4','MZB5280IN/MZB5253IN/MZB5544IN','13MP','Qualcomm Snapdragon 625 64-bit Octa Core 2GHz','itional Content4GB RAM','5MP','165 g','rukminim1.flixcart.com/image/128/128/mobile/9/8/z/mi-redmi-note-4-na-original-imaeqdxjuadhagfc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/8/z/mi-redmi-note-4-na-original-imaeqdxjuadhagfc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/8/z/mi-redmi-note-4-na-original-imaeqdxnmcfcqyq9.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/g/h/mi-redmi-note-4-na-original-imaeqdxknsfydkdh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/g/h/mi-redmi-note-4-original-imaeqdxgchmppaxh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/g/h/mi-redmi-note-4-na-original-imaeqdxh864eewmj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/g/h/mi-redmi-note-4-na-original-imaeqdxjzqhnwsge.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/9/8/z/mi-redmi-note-4-na-original-imaeqdxkgwnzrdax.jpeg?q=70\n'),(8,'5 inch','8 GB','Galaxy On5','SM-G550FZKDINS/SM-G550FZDDINS','8MP','Exynos 3475 Quad Core 1.3GHz','1.5 GB','5MP','149 g','rukminim1.flixcart.com/image/128/128/mobile/r/3/q/samsung-galaxy-on7-sm-g600f-original-imaecqkgzeuz9ebn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/3/k/a/samsung-galaxy-on5-sm-g550fzddins-original-imaecjy9jkpzuxvn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/3/k/a/samsung-galaxy-on5-sm-g550fzddins-original-imaecjy9gazuhfkv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/3/k/a/samsung-galaxy-on5-sm-g550fzddins-original-imaecjy9bxtexfhz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/3/k/a/samsung-galaxy-on5-sm-g550fzddins-original-imaecjy92yrm4mfr.jpeg?q=70\n'),(9,'5.2 inch','32 GB','K8 Plus','PA8C0019IN/PA8C0023IN','13MP + 5MP','MediaTek MTK Helio P25 Octa Core 2.5 GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j81xsi80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-pa8c0023in-original-imaey5hzkryjswmu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rtqdyqgw5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rybgznnwy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rwzjgtx8r.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rrdfp4p45.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2revcnehxe.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2refbzq6yq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rgueedzbk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rtajmud3g.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rjdwr8gyz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7gi6q80/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexp2rerpxuhgv.jpeg?q=70\n'),(10,'5 inch','16 GB','Moto C Plus','XT1721','8MP','Mediatek MTK6737 Quad Core 1.3Ghz','2 GB','2MP','151 g','rukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4wxss4aaua.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4xzy7vtsbt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4wwbgzxtka.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4wpuggtk3f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4w3yj7uznx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4wy2wh3uw6.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/a/x/j/motorola-moto-c-plus-xt1721-original-imaeup4yzkm53hyh.jpeg?q=70\n'),(12,'4.7 inch','32 GB','iPhone 7','MN8X2HN/A','12MP','Apple A10 Fusion 64-bit processor and Embedded M10 Motion Co-processor',' ','7MP','138 g',''),(13,'5 inch','16 GB','Moto C Plus','XT1721','8MP','Mediatek MTK6737 Quad Core 1.3Ghz','2 GB','2MP','151 g','rukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4wfjdqpwsb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4xrh4bhn69.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4w39yx4wfy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4xqgn9bq7y.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4xgnhhtxky.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4ycwwwuvjb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3lwh3k0/mobile/x/t/k/motorola-moto-c-plus-xt1721-original-imaeup4x9thgzsbh.jpeg?q=70\n'),(14,'5.5 inch','64 GB','Mi A1','MZB5653IN','12MP + 12MP','Qualcomm Snapdragon 625 64 bit Octa Core 2GHz','4 GB','5MP','165 g','rukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9z4fmxk8ns.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9z4fmxk8ns.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9zwpp7dbae.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9zqdn6keuc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9zsdruqchz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexcvygmguxrng.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9pjmhftzrr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/x/u/z/mi-mi-a1-na-original-imaexg9pbx2erqyz.jpeg?q=70\n'),(15,'4.7 inch','32 GB','iPhone 6','MQ3E2HN/A','8MP','A8 Chip with 64-bit Architecture and M8 Motion Co-processor',' ','1.2MP','129 g','rukminim1.flixcart.com/image/128/128/j6mhxu80/mobile/7/n/z/apple-iphone-6-mq3e2hn-a-original-imaexfzbdzgctzrv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6mhxu80/mobile/7/n/z/apple-iphone-6-mq3e2hn-a-original-imaexfzbznue67sy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6mhxu80/mobile/7/n/z/apple-iphone-6-mq3e2hn-a-original-imaexfzbkykctwjf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6mhxu80/mobile/7/n/z/apple-iphone-6-mq3e2hn-a-original-imaexfzg6qmyjqrf.jpeg?q=70\n'),(16,'4.7 inch','32 GB','iPhone 6s','MN0W2HN/A','12MP','Apple A9 64-bit processor and Embedded M9 Motion Co-processor',' ','5MP','143 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/6/t/q/apple-iphone-6s-mn0w2hn-a-original-imaexw6smfzjgqsz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/6/t/q/apple-iphone-6s-mn0w2hn-a-original-imaexw6shyqbz5ub.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/6/t/q/apple-iphone-6s-mn0w2hn-a-original-imaexw6svn7pgfg9.jpeg?q=70\n'),(17,'5.5 inch','16 GB','Galaxy J7 Nxt','SM-J701FZKDINS','13MP','Exynos Octa-Core 1.6GHz','2 GB','5MP','170 g','rukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emjzhahhcp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emrgr2xfnm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em6fv7yufz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emdfryzvef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emnxt8rkw7.jpeg?q=70\n'),(18,'4.7 inch','32 GB','iPhone 6s','MN112HN/A','12MP','Apple A9 64-bit processor and Embedded M9 Motion Co-processor',' ','5MP','143 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/y/x/g/apple-iphone-6s-mn112hn-a-original-imaexw6szu6xhzgr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/y/x/g/apple-iphone-6s-mn112hn-a-original-imaexw6sys4upnvh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/y/x/g/apple-iphone-6s-mn112hn-a-original-imaexw6snnuzpz8y.jpeg?q=70\n'),(19,'4.7 inch','32 GB','iPhone 6s','MN122HN/A','12MP','Apple A9 64-bit processor and M9 Motion Co-processor',' ','5MP','143 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/g/m/8/apple-iphone-6s-mn122hn-a-original-imaexwzqve7rd7cg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/g/m/8/apple-iphone-6s-mn122hn-a-original-imaexwzqbf694rph.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/g/m/8/apple-iphone-6s-mn122hn-a-original-imaexwzqf2hmmedf.jpeg?q=70\n'),(20,'5.7 inch','32 GB','Le Max2','le x821','21MP','Qualcomm Snapdragon 820 Quad Core 2.15GHz','4 GB','8MP','185 g','rukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgug5vytpjbh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgugnuyz5kfx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejguggkqmb7mt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgugs8g3bvh8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgugb43ur92f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgugbhg5e9ys.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejguggjjekqwc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejguge3h48bme.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgug6gtgf6r5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/y/a/leeco-le-max2-na-original-imaejgugpumrbys7.jpeg?q=70\n'),(21,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkqsn8yqrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkejyame8c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkzcafgvhh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkaz6qhy2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkayadzexx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkyygn7eg5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkygqkztv8.jpeg?q=70\n'),(22,'5.7 inch','32 GB','Galaxy On Max','SM-G615FZKUINS','13MP','MediaTek MTK6757V/WL 2.39GHz, 1.69GHz, Octa Core','4 GB','13MP','179 g','rukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfxesgjatny.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfxesgjatny.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfxhehnbkhj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfx7shehshy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfxn9jfyqhg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfxcswdy6zp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4sronk0/mobile/e/n/w/samsung-on-max-sm-g615fzkuins-original-imaevmfxhwd4yjgz.jpeg?q=70\n'),(23,'6.44 inch','64 GB','Mi Max 2','MDI4O','12MP','Qualcomm Snapdragon 625 Octa Core 2 Ghz','4 GB','5MP','211 g','rukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/f/e/7/mi-max-2-d4-original-imaew6jfzdxmg3d6.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew6xeytdsuv6d.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew6xe6gvgptde.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew6xftbp38egc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew6xetj3jaym5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew6xeugxtpjya.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5jx1u80/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew6xhf35mm9xe.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5jx1u80/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew7ubfv5ajhzq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5jx1u80/mobile/f/e/7/mi-mi-max-2-mdi4o-original-imaew7ubvjezvvcw.jpeg?q=70\n'),(24,'5.5 inch','16 GB','Galaxy J7 - 6 (New 2016 Edition)','SM-J710FZKUINS/ SM-J710FZWUINS/ SM- J710FZDUINS','13MP','Exynos 7870 Octa Core 1.6GHz','2 GB','5MP','169 g','rukminim1.flixcart.com/image/128/128/mobile/v/e/x/samsung-galaxy-j7-2016-sm-j710fzkuins-original-imaeg8cyrp7hscz4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/v/e/x/samsung-galaxy-j7-2016-sm-j710fzkuins-original-imaeg8cyrp7hscz4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/f/samsung-galaxy-j5-6-new-2016-edition-sm-j510fzkuins-original-imaegjdkhj7sbqjg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/f/samsung-galaxy-j5-6-new-2016-edition-sm-j510fzkuins-original-imaegjdkwuyna6ag.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/f/samsung-galaxy-j5-6-new-2016-edition-sm-j510fzkuins-original-imaegjdkkeeuchh4.jpeg?q=70\n'),(25,'4.7 inch','32 GB','iPhone 6','MQ3D2HN/A','8MP','Apple A8 64-bit processor and M8 Motion Co-processor',' ','1.2MP','129 g','rukminim1.flixcart.com/image/128/128/j2c6du80/mobile/f/2/j/apple-iphone-6-a1586-original-imaetnf2h6gck78p.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/f/2/j/apple-iphone-6-a1586-original-imaetnf2aznrj6jh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/f/2/j/apple-iphone-6-a1586-original-imaetnf2ru75g3zz.jpeg?q=70\n'),(26,'5 inch','16 GB','Galaxy J3 Pro','SM-J320FZDGINS','8MP','Spreadtrum Quad Core 1.5GHz','2 GB','5MP','138 g','rukminim1.flixcart.com/image/128/128/j3orcsw0/mobile/r/p/v/samsung-galaxy-j3-pro-sm-j320fzdgins-original-imaeurqgnaz4puyt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3vwk280/mobile/r/p/v/samsung-galaxy-j3-pro-sm-j320fzdgins-original-imaeux6pgm9yxhht.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3orcsw0/mobile/r/p/v/samsung-galaxy-j3-pro-sm-j320fzdgins-original-imaeurqghzbh7kme.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j3orcsw0/mobile/r/p/v/samsung-galaxy-j3-pro-sm-j320fzdgins-original-imaeurqgzkxqamqd.jpeg?q=70\n'),(27,'5 inch','32 GB','K6 Power','K33A42','13MP','Qualcomm Snapdragon 430 Octa Core 1.4GHz','itional Content3 GB RAM','8MP','145 g','rukminim1.flixcart.com/image/128/128/j44h7680/mobile/g/b/q/lenovo-k6-power-k33a42-original-imaev3qatph78mge.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j44h7680/mobile/g/b/q/lenovo-k6-power-k33a42-original-imaev3qatph78mge.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/w/f/lenovo-k6-power-k33a42-original-imaezt6jrtvqh5yj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/b/q/lenovo-k6-power-k33a42-original-imaezt44xfecyaf8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/w/f/lenovo-k6-power-k33a42-original-imaezt6h5ugwpxeh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/w/f/lenovo-k6-power-k33a42-original-imaezt6hmsdm6pf6.jpeg?q=70\n'),(28,'5 inch','16 GB','Moto E3 Power','PA4C0020IN/PA4C0009IN','8MP','Mediatek MT6735p 64-bit Quad Core 1GHz','2 GB','5MP','153.5 g','rukminim1.flixcart.com/image/128/128/mobile/d/f/w/motorola-moto-e3-power-pa4c0009in-original-imaemj7xpcfhnu8r.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/w/motorola-moto-e3-power-pa4c0009in-original-imaemj7xysxuamzg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/w/motorola-moto-e3-power-pa4c0009in-original-imaemj7x8zqcgnfk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/w/motorola-moto-e3-power-pa4c0009in-original-imaemj7xhpjycjss.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/w/motorola-moto-e3-power-pa4c0009in-original-imaemj7xkxgrnrpa.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/w/motorola-moto-e3-power-pa4c0009in-original-imaemj7x33ekegnu.jpeg?q=70\n'),(29,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(30,'6.4 inch','32 GB','Phab 2','PB2-650M','13MP','MTK8735','itional Content3GB RAM','5MP','225 g','rukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab2-pb2-650m-original-imaezxkcvqg6mcyf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab2-pb2-650m-original-imaezxkcvqg6mcyf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab-2-pb2-650m-original-imaezxnffada2wrx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j30gvbk0/mobile/m/h/t/lenovo-phab-2-pb2-650m-original-imaeu8gggjgcuvrn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab2-pb2-650m-original-imaezxkckkwgxgjq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab2-pb2-650m-original-imaezxkawyhyk8mg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab2-pb2-650m-original-imaezxkcfzdrz2hr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/h/t/lenovo-phab2-pb2-650m-original-imaezxkc5nec7pdw.jpeg?q=70\n'),(31,'4.7 inch','32 GB','iPhone 7','MN912HN/A','12MP','Apple A10 Fusion 64-bit processor and Embedded M10 Motion Co-processor',' ','7MP','138 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/8/5/t/apple-iphone-7-mn912hn-a-original-imaexwzngmvhunxr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/8/5/t/apple-iphone-7-mn912hn-a-original-imaexwznhavrzrzh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/y/t/k/apple-iphone-7-mn9a2hn-a-original-imaexwznhgrnaat8.jpeg?q=70\n'),(32,'6.4 inch','32 GB','Phab 2','PB2-650M','13MP','MTK8735','itional Content3GB RAM','5MP','225 g','rukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkcub7yax7x.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkcub7yax7x.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkce7syzbsf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j30gvbk0/mobile/m/h/t/lenovo-phab-2-pb2-650m-original-imaeu8gggjgcuvrn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkcvg3jjvmc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkcyajgv7ff.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkcubu2ag7q.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/d/z/lenovo-phab2-pb2-650m-original-imaezxkcatynfyck.jpeg?q=70\n'),(34,'5.2 inch','32 GB','Zenfone 3s Max','ZC521TL-4G014IN/ZC521TL-4G006IN','13MP','Octa Core Processor MediaTek MT6750, 1.5GHz','3 GB','8MP','175 g','rukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvh4fpuepx9d.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvh4fqtb3p4z.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvh6ag9vmnkg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvh42erzjzjg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvhbuaeu23mh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvhbt3tssyac.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/z/z/asus-zenfone-3s-max-zc521tl-4g006in-original-imaeqvh5zbr3b6y4.jpeg?q=70\n'),(35,'5.5 inch','32 GB','Eluga Ray 700','EB-90S55ER7B','13MP','Mediatek MTK6753 Octa Core 1.3GHz','3 GB','13MP','182 g','rukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyrs3ngg4x.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyhey6rkpk6us.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyxcx5t8nr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyecyck6ff.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyygkzwgu3.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyptphhnkh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyureyr3ca.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyhvwaxapq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheydcghkcss.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyfakd8j4p.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j8lxyfk0/mobile/u/z/c/panasonic-eluga-ray-700-eb-90s55er7b-original-imaeyheyjtzrvayn.jpeg?q=70\n'),(36,'4 inch','32 GB','iPhone SE','MP842HN/A','12MP','Apple A9 64-bit processor and Embedded M9 Motion Co-processor',' ','1.2MP','113 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/q/k/h/apple-iphone-se-mp842hn-a-original-imaexw6frwpducnb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/q/k/h/apple-iphone-se-mp842hn-a-original-imaexw6h2b5hfgyh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/q/k/h/apple-iphone-se-mp842hn-a-original-imaexw6kfyhtbvht.jpeg?q=70\n'),(37,'5 inch','8 GB','Galaxy On5','SM-G550FZKDINS','8MP','Exynos 3475 Quad Core 1.3GHz','1.5 GB','5MP','149 g','rukminim1.flixcart.com/image/128/128/mobile/c/n/y/samsung-galaxy-on7-sm-g600f-original-imaecqkgfgtmaw2y.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/n/p/samsung-galaxy-on5-sm-g550f-original-imaecqg9thg7n4em.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/n/p/samsung-galaxy-on5-sm-g550f-original-imaecqg97erwmgcv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/n/p/samsung-galaxy-on5-sm-g550fzkdins-sm-g550fzddins-original-imaefthswb9uxhhm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/n/p/samsung-galaxy-on5-sm-g550f-original-imaecqg9wnfxhhzu.jpeg?q=70\n'),(38,'5.7 inch','32 GB','Note 4','X 572','13MP','Mediatek MT6753 Octa Core 1.3 Ghz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/x/g/infinix-note-4-x-572-original-imaeweh3xpuebgmg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/x/g/infinix-note-4-x-572-original-imaewe86a3qhhezs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/x/g/infinix-note-4-x-572-original-imaewe86tqgz4gzh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/x/g/infinix-note-4-x-572-original-imaewe86ydnsummj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/x/g/infinix-note-4-x-572-original-imaewe86u5bd4zux.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/x/g/infinix-note-4-x-572-original-imaewe86pyyzhpfc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pz2gbr62zp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pz3czjjtuy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pz7zgfzast.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pz3ahdcvtn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pzxaxzpssg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pznfs5bj35.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pznzfdvgsh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/x/g/infinix-note-4-x-572-original-imaew6pzz4w2qpfs.jpeg?q=70\n'),(39,'5.5 inch','16 GB','Galaxy J7 Nxt','SM-J701FZKDINS','13MP','Exynos Octa-Core 1.6GHz','2 GB','5MP','170 g','rukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emjzhahhcp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emrgr2xfnm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em6fv7yufz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emdfryzvef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emnxt8rkw7.jpeg?q=70\n'),(40,'5.7 inch','32 GB','Note 4','X 572','13MP','Mediatek MT6753 Octa Core 1.3 Ghz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaeweh3qrhqejjr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaewe86kmrs8nbu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaewe86xfdhuqhs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaewe86muztrzzc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaewe86d5zuetpn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaeweh3yxfjhbht.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/j/r/a/infinix-note-4-x-572-original-imaewe86bax9hkfn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qytg6pbkmg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyej2aksd2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qygzefez8y.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qydzgabqhs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyzmpksjav.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyhyqkkhar.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyfkyv5qem.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyaevahunn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyyr3bkvjd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qyuzdvvze2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qydaxyhwgz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/j/r/a/infinix-note-4-x-572-original-imaew6qybng3xpzz.jpeg?q=70\n'),(41,'4.7 inch','32 GB','iPhone 7','MN902HN/A','12MP','Apple A10 Fusion 64-bit processor and Embedded M10 Motion Co-processor',' ','7MP','138 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/t/f/u/apple-iphone-7-mn902hn-a-original-imaexwzmmgkzft4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/q/h/p/apple-iphone-7-mn992hn-a-original-imaexwzmfzhgqyvc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/q/h/p/apple-iphone-7-mn992hn-a-original-imaexwzmheragyag.jpeg?q=70\n'),(42,'5.7 inch','32 GB','Note 4','X 572','13MP','Mediatek MT6753 Octa Core 1.3 Ghz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaeweh3exshztbq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaewe86btbuy3sf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaewe86hbkbsgsc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaewe86f22vgnmz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaewe863pmkbwsh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaeweh3pggh6jwp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5shoy80/mobile/m/6/g/infinix-note-4-x-572-original-imaewe86ywhuufrm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5mrxjk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew9z3hngwshgw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6pz5z6zufrg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6pzygsx7sbq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6qyxwtq2dbh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6qytsgfrzmx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6qyey6tjsmh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6qyhhyxmfhv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6qy6nmzzyuv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6qyghzwvmpp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5ihlzk0/mobile/m/6/g/infinix-note-4-x-572-original-imaew6pzrvw8rxxe.jpeg?q=70\n'),(43,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkqsn8yqrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkejyame8c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkzcafgvhh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkaz6qhy2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkayadzexx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkyygn7eg5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkygqkztv8.jpeg?q=70\n'),(44,'5.2 inch','32 GB','K8 Plus','PA8C0008IN','13MP + 5MP','MediaTek MTK Helio P25 Octa Core 2.5 GHz','4 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j752nww0/mobile/9/x/k/lenovo-k8-plus-pa8c0020in-original-imaexgyv94adazze.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/j/g/u/lenovo-k8-plus-pa8c0008in-original-imaexgyvzvfs9uqk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/j/g/u/lenovo-k8-plus-pa8c0008in-original-imaexgyvycbk8gnu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/j/g/u/lenovo-k8-plus-pa8c0008in-original-imaexgyvjzmhtcgt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/j/g/u/lenovo-k8-plus-pa8c0008in-original-imaexgyvh89r7vtx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/j/g/u/lenovo-k8-plus-pa8c0008in-original-imaexgyvhgn3shgs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/j/g/u/lenovo-k8-plus-pa8c0008in-original-imaexgyvuzcuzzhc.jpeg?q=70\n'),(45,'5.2 inch','32 GB','Moto G5 Plus','XT 1686','12MP','Qualcomm Snapdragon 625 Octa Core 2GHz','itional Content4 GB RAM','5MP','155 g','rukminim1.flixcart.com/image/128/128/mobile/x/b/z/motorola-moto-g5-plus-xt-1686-original-imaes3bg4tfyfc2v.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/x/b/z/motorola-moto-g5-plus-xt-1686-original-imaes3bg4tfyfc2v.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/x/b/z/motorola-moto-g5-plus-xt-1686-original-imaes3c5a5tgyckm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/c/z/2/motorola-moto-g5-plus-xt-1686-original-imaes3axv7uzgz7k.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/c/z/2/motorola-moto-g5-plus-xt-1686-original-imaes3b9zatfzpqf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/x/b/z/motorola-moto-g5-plus-xt-1686-original-imaes3c22rf4payz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/x/b/z/motorola-moto-g5-plus-xt-1686-original-imaes3bhygguazjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/x/b/z/motorola-moto-g5-plus-xt-1686-original-imaes3ccghfpnkzy.jpeg?q=70\n'),(46,'5.2 inch','32 GB','Moto G5 Plus','XT 1686','12MP','Qualcomm Snapdragon 625 Octa Core 2GHz','itional Content4 GB RAM','5MP','155 g','rukminim1.flixcart.com/image/128/128/mobile/5/b/f/motorola-moto-g5-plus-xt-1686-original-imaes3bzhs4thksp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/b/f/motorola-moto-g5-plus-xt-1686-original-imaes3bzhs4thksp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/c/q/motorola-g5-plus-xt-1686-original-imaeru6nhut8vzm5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/c/q/motorola-moto-g5-plus-xt-1686-original-imaes3cfhefbf2pp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/b/f/motorola-moto-g5-plus-xt-1686-original-imaes3brasneahzh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/5/b/f/motorola-moto-g5-plus-xt-1686-original-imaes3cw4rahr6md.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/c/q/motorola-moto-g5-plus-xt-1686-original-imaes3czkc7wa8gy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/c/q/motorola-moto-g5-plus-xt-1686-original-imaes3cyhhbqfe2f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/h/c/q/motorola-moto-g5-plus-xt-1686-original-imaes3c9z92xqxhw.jpeg?q=70\n'),(47,'4.7 inch','32 GB','iPhone 7','MN8Y2HN/A','12MP','Apple A10 Fusion 64-bit processor and Embedded M10 Motion Co-processor',' ','7MP','138 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/g/g/f/apple-iphone-7-mn8y2hn-a-original-imaexwzn8ynwbhtj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/g/g/f/apple-iphone-7-mn8y2hn-a-original-imaexwznnge2zawh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/g/g/f/apple-iphone-7-mn8y2hn-a-original-imaexwznfzht3kyg.jpeg?q=70\n'),(48,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(49,'5 inch','16 GB','Horizon 2S','S504730','8MP','Mediatek MT6735M','2 GB','2MP',' ','rukminim1.flixcart.com/image/128/128/j7xngy80/mobile/r/h/8/sansui-horizon-2s-s504730-original-imaeyfqxxzwpqhpr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7xngy80/mobile/r/h/8/sansui-horizon-2s-s504730-original-imaeyfqxxzwpqhpr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7xngy80/mobile/r/h/8/sansui-horizon-2s-s504730-original-imaeyfqywuhysd9t.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/r/h/8/sansui-horizon-2s-na-original-imaexhgdufuhhn2r.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/r/h/8/sansui-horizon-2s-na-original-imaexhgdcxzq5u8b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/r/h/8/sansui-horizon-2s-na-original-imaexhgd7gxubnyz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/r/h/8/sansui-horizon-2s-na-original-imaexhgdxynt4afd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/r/h/8/sansui-horizon-2s-na-original-imaexhgdrmdmgfxe.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/r/h/8/sansui-horizon-2s-na-original-imaexhgdxfm4nevg.jpeg?q=70\n'),(50,'5.1 inch','32 GB','Galaxy S7','SM-G930FZKUINS/SM-G930FZSUINS/SM-G930FZDUINS','12MP','Exynos 8890 Octa Core 2.3GHz','4 GB','5MP','152 g','rukminim1.flixcart.com/image/128/128/mobile/j/f/a/samsung-galaxy-s7-na-original-imaegmjsn8z7qqaf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/f/a/samsung-galaxy-s7-na-original-imaegmjsn8z7qqaf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/f/a/samsung-galaxy-s7-na-original-imaegmjsfjgfezcv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/f/a/samsung-galaxy-s7-na-original-imaegmjsqz8dufbv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/f/a/samsung-galaxy-s7-na-original-imaegmjsqkssdkmw.jpeg?q=70\n'),(51,'5.1 inch','32 GB','Galaxy S7','SM-G930FZKUINS/SM-G930FZSUINS/SM-G930FZDUINS','12MP','Exynos 8890','4 GB','5MP','152 g','rukminim1.flixcart.com/image/128/128/mobile/b/j/2/samsung-galaxy-s7-na-original-imaegmjse2xpg7y4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/b/j/2/samsung-galaxy-s7-na-original-imaegmjse2xpg7y4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/b/j/2/samsung-galaxy-s7-na-original-imaegmjspyerudhj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/b/j/2/samsung-galaxy-s7-na-original-imaegmjszm8yujbp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/b/j/2/samsung-galaxy-s7-na-original-imaegmjs3gpryaye.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/b/j/2/samsung-galaxy-s7-na-original-imaegmjscqq4z2ph.jpeg?q=70\n'),(53,'5 inch','8 GB','ERA 1X -4G with VoLTE',' ','8MP','Spreadtrum SC9832A Quad Core 1.3GHz','1 GB','5MP','144 g','rukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmfvzw95fmg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmfzjj8avyu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmfgafzutga.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmfry8xgkhk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmf3mguq5xw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmfr7caz98p.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmf53zqhuhc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/m/b/8/xolo-era-1x-na-original-imaemhmf8mjcd6hb.jpeg?q=70\n'),(54,'5.1 inch','32 GB','Galaxy S7','SM-G930FZKUINS/SM-G930FZSUINS/SM-G930FZDUINS','12MP','Exynos 8890 Octa Core 2.3GHz','4 GB','5MP','152 g','rukminim1.flixcart.com/image/128/128/mobile/7/n/x/samsung-galaxy-s7-na-original-imaegmjszvhghyzc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/n/x/samsung-galaxy-s7-na-original-imaegmjszvhghyzc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/n/x/samsung-galaxy-s7-na-original-imaegmjsvbtg8qry.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/n/x/samsung-galaxy-s7-na-original-imaegmjsrq83fh8g.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/n/x/samsung-galaxy-s7-na-original-imaegmjsfwjemzt9.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/n/x/samsung-galaxy-s7-na-original-imaegmjszvekcgwg.jpeg?q=70\n'),(55,'5 inch','8 GB','ERA 1X -4G with VoLTE',' ','8MP','Spreadtrum SC9832A Quad Core 1.3GHz','1 GB','5MP','144 g','rukminim1.flixcart.com/image/128/128/mobile/t/y/9/xolo-era-1x-4g-with-volte-na-original-imaereaynvgbugpg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/y/9/xolo-era-1x-4g-with-volte-na-original-imaereay3frtrhuv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/y/9/xolo-era-1x-4g-with-volte-na-original-imaereay3jzq49av.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/y/9/xolo-era-1x-4g-with-volte-na-original-imaenq3hm5qejkzk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/y/9/xolo-era-1x-4g-with-volte-na-original-imaenq3hh4x7xczd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/y/9/xolo-era-1x-4g-with-volte-na-original-imaereaypvwmcnzb.jpeg?q=70\n'),(56,'5.5 inch','32 GB','6X','BLN-L22','12MP + 2MP','Kirin 655','3 GB','8MP','162 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy3wz6adfvh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy3zengzncn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy33eed83eh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy342yf6rsz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy36gx5bw2p.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy3n6h3tzzp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy3akwmugfa.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/9/s/honor-6x-bln-l22-original-imaexdy3jezdxjgv.jpeg?q=70\n'),(57,'5.5 inch','32 GB','6X','BLN-L22','12MP + 2MP','Kirin 655','3 GB','8MP','162 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy37nzqxzja.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3nvzw4eef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3sc6e4akg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3bnnnyypv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3k26egerg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3fa8zsv9c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3zywg5x2q.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy359rhjdfu.jpeg?q=70\n'),(58,'5.5 inch','16 GB','Galaxy J7 Nxt','SM-J701FZKDINS','13MP','Exynos Octa-Core 1.6GHz','2 GB','5MP','170 g','rukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emjzhahhcp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emrgr2xfnm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em6fv7yufz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emdfryzvef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emnxt8rkw7.jpeg?q=70\n'),(59,'5.5 inch','64 GB','6X','BLN-L22','12MP + 2MP','Kirin 655','4 GB','8MP','162 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3dhagsmhj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3ghvcyzfs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3vwgbjmve.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/h/z/honor-6x-bln-l22-original-imaexdy3gurgteyb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3vxzhqhjf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3wbee99e2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3sknaxyaa.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3kcfv3hcy.jpeg?q=70\n'),(60,'5.5 inch','64 GB','6X','BLN-L22','12MP + 2MP','Kirin 655','4 GB','8MP','162 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy37nzqxzja.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3nvzw4eef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3sc6e4akg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3bnnnyypv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3k26egerg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3fa8zsv9c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy3zywg5x2q.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/4/y/7/honor-6x-bln-l22-original-imaexdy359rhjdfu.jpeg?q=70\n'),(61,'5.5 inch','32 GB','6X','BLN-L22','12MP + 2MP','Kirin 655','3 GB','8MP','162 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3dhagsmhj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3ghvcyzfs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3vwgbjmve.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/p/h/z/honor-6x-bln-l22-original-imaexdy3gurgteyb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3vxzhqhjf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3wbee99e2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3sknaxyaa.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/s/t/j/honor-6x-bln-l22-original-imaexdy3kcfv3hcy.jpeg?q=70\n'),(62,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkqsn8yqrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkejyame8c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkzcafgvhh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkaz6qhy2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkayadzexx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkyygn7eg5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkygqkztv8.jpeg?q=70\n'),(63,'5.2 inch','32 GB','Honor 8','FRD-L02','12MP + 12MP','ARM Hisilicon Kirin 950 - ARM Cortex A72 + ARM Cortex A53 Octa Core 2.3GHz','4 GB','8MP','153 g','rukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yt8yhm3aa.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/huawei-honor-8-frd-l02-original-imaema5yzcmhdqkf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5ymrsf2cjb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yzkdgkfx8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yfkqmg3dj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yb8chucnx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yhg5hsmtr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yhffgyzxz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5y7z86yat2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yjdevqgap.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5yyghjugzy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/n/h/r/honor-8-frd-l02-original-imaema5y8uhyzu4x.jpeg?q=70\n'),(64,'5.2 inch','32 GB','K8 Plus','PA8C0006IN / PA8C0023IN','13MP + 5MP','MediaTek MTK Helio P25 Octa Core 2.5 GHz','4 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j81xsi80/mobile/w/g/a/lenovo-k8-plus-pa8c0006in-original-imaey5mh6tw7zm8z.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexgyvzbtwfppn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexgywy9jjtmtx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexgyws53qsx8g.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexgywcywpgfyp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexgyw6esqjkqy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j752nww0/mobile/v/p/g/lenovo-k8-plus-pa8c0019in-original-imaexgywqy6yjj9u.jpeg?q=70\n'),(65,'5.2 inch','32 GB','Honor 8','FRD-L02','12MP + 12MP','ARM Hisilicon Kirin 950 - ARM Cortex A72 + ARM Cortex A53 Octa Core 2.3GHz','4 GB','8MP','153 g','rukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zqyw5q2mv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/huawei-honor-8-frd-l02-original-imaema4zbkxguxkt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zus6zkthr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4znjskpdzp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zgmgay2zw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zn8dyfgas.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zffrtwdxp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zhrhp2zxa.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4zbsscuthx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4z4hjvv3rs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/d/f/f/honor-8-frd-l02-original-imaema4znvuzfz4z.jpeg?q=70\n'),(66,'5.5 inch','16 GB','P55 Max','EB-90S55PMXN','13MP','MediaTek MTK6737 Quad Core 1.25 GHz','3 GB','5MP','180 g','rukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4beryceusy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bzhjacqkj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bhvy2zh48.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bkypparfy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bpyyqdk7u.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bw5k892fr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4brst5re2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bbagw999d.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bmsamuqk7.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bb8grjjyg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4btfykxwkw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bzqdb83xu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bxefqfrbv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4bknn7hwxu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/e/q/g/panasonic-p55-max-eb-90s55pmxn-original-imaevq4b6hzmzkmv.jpeg?q=70\n'),(67,'5.5 inch','32 GB','Zenfone 4 Selfie','ZB553KL-5G099IN/ZB553KL-5G033IN','13MP','Octa Core Qualcomm Snapdragon 430','3 GB','13MP','144 g','rukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtdd4rcyjk5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtefbgggjqf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtertymfrnw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvte9yfaykrz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtexq4yudds.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtevkx4cugw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtet5ghrhfh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtefk56j2ye.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtegdgafbkd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtdeyrwebhp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtdygvk6b2r.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtdhwh5xwhs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7p2tu80/mobile/u/w/7/asus-zenfone-4-selfie-zb553kl-5g099in-zb553kl-5g033in-original-imaexvtekyt3hnvn.jpeg?q=70\n'),(68,'5.2 inch','16 GB','Me3','iV 501','8MP','MediaTek 6737 64-bit 1.3GHz','2 GB','8MP','158 g','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(69,'5.5 inch','32 GB','Redmi Note 4','MZB5459IN/MZB5542IN','13MP','Qualcomm Snapdragon 625 64-bit Octa Core 2GHz','itional Content3GB RAM','5MP','165 g','rukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxqcrfshtqu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxqcrfshtqu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxgtcgbgvfh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/t/d/mi-redmi-note-4-na-original-imaeqdxd3mv2zpwt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/t/d/mi-redmi-note-4-na-original-imaeqdxgx3z8fhdr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/d/5/mi-redmi-note-4-na-original-imaeqdxhqks7qrnw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/t/d/mi-redmi-note-4-na-original-imaeqdxhgnerzpeg.jpeg?q=70\n'),(70,'5.5 inch','32 GB','Vibe K5 Note','PA330113IN/PA330117IN','13MP','Mediatek Helio P10 64-bit Octa Core 1.8GHz','4 GB','8MP','165 g','rukminim1.flixcart.com/image/128/128/mobile/q/3/j/lenovo-k5-note-pa330117in-original-imaekyapfagcmsdg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaekyap3yryuynj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaekyapnqehzzkg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaekyapgwndjptk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaejuewfyhydg5p.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaejuew3bf9jyyu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaejuewamnr26dc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaejuewkm4g3fyg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaejuew5wrrbfba.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-k5-note-pa330037in-original-imaejuewbphhffbg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/j/p/a/lenovo-vibe-k5-note-pa330037in-original-imaehxk8aep2gbvb.jpeg?q=70\n'),(71,'5.5 inch','64 GB','Moto M','XT1663','16MP','MediaTek Helio P15 64-bit Octa Core 2.2GHz','4 GB','8MP','163 g','rukminim1.flixcart.com/image/128/128/mobile/p/x/x/motorola-moto-m-xt1663-original-imaep562bebk6hhg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/p/x/x/motorola-moto-m-xt1663-original-imaep563txjstxzp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/z/6/motorola-moto-m-xt1663-original-imaep55wjkgfye6h.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/z/6/motorola-moto-m-xt1663-original-imaep56fjnjtuf82.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/p/x/x/motorola-moto-m-xt1663-original-imaep563vcf8phs9.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/p/x/x/motorola-moto-m-xt1663-original-imaep565kfsfbsrz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/t/z/6/motorola-moto-m-xt1663-original-imaep55xnzgqz7tf.jpeg?q=70\n'),(72,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(73,'4.7 inch','128 GB','iPhone 7','MN922HN/A','12MP','Apple A10 Fusion 64-bit processor and Embedded M10 Motion Co-processor',' ','7MP','138 g','rukminim1.flixcart.com/image/128/128/mobile/7/e/e/apple-iphone-7-na-original-imaemzee435f9gpu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/e/e/apple-iphone-7-na-original-imaemzee6nzyvupn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/e/e/apple-iphone-7-na-original-imaemzedzsgdfgut.jpeg?q=70\n'),(74,'5.5 inch','64 GB','Zenfone 4 Selfie Dual Camera','ZD553KL-5G096IN/ZD553KL-5G037IN/ZD553KL-5G037INASUS_X00LD','16MP','Octa Core Qualcomm Snapdragon 430','4 GB','20MP + 8MP','144 g','rukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/n/a/m/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgd9ttkdqw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fghf797dxf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/n/a/m/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgfkkghpqg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgfhzbakyz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/n/a/m/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fhwsbencty.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/n/a/m/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fhv5w27hp9.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/n/a/m/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgg6qy4vtg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/n/a/m/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgxh3m7frz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgvehwwgsg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgzmqk6yr3.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fghvhqwt5m.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgc2vp3zhg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6wi0sw0/mobile/u/w/7/asus-zenfone-4-selfie-zd553kl-5g037in-original-imaex9fgdmck7ykj.jpeg?q=70\n'),(75,'5 inch','16 GB','P77','EB-90S50P77H','8MP','MediaTek MTK6735P Quad Core 1 GHz','1 GB','2MP','126 g','rukminim1.flixcart.com/image/128/128/j6v2ky80/mobile/z/9/r/panasonic-p77-eb-90s50p77h-original-imaex8c7d7jw8wje.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6v2ky80/mobile/z/9/r/panasonic-p77-eb-90s50p77h-original-imaex8ceucuqshyq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6v2ky80/mobile/z/9/r/panasonic-p77-eb-90s50p77h-original-imaex8c7spkquzn2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6v2ky80/mobile/z/9/r/panasonic-p77-eb-90s50p77h-original-imaex8c7mugfzfqp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6v2ky80/mobile/z/9/r/panasonic-p77-eb-90s50p77h-original-imaex8c8vzkruhve.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6v2ky80/mobile/z/9/r/panasonic-p77-eb-90s50p77h-original-imaex8c8khzcw856.jpeg?q=70\n'),(76,'5.5 inch','8 GB','Aqua 5.5 VR',' ','5MP','Mediatek MT6737V /W 64-bit Quad Core 1.3GHz','1 GB','5MP','176.8 g','rukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjf87dhe3ush.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfkvg8gnjdx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfh2ezy6nqw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfh6qvukpyh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfkff2vvzeh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfnspb8jyyg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfhzrgzdnpu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfcx5dc8xv8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/q/g/y/intex-aqua-5-5-vr-original-imaenjfksmzkkmpg.jpeg?q=70\n'),(77,'5.5 inch','64 GB','V5 Plus',' ','16MP','Qualcomm Snapdragon 625 64-bit Octa Core 2 GHz','4 GB','20MP + 8MP',' ','rukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vrqzcysgfb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/p/y/q/vivo-v5-plus-na-original-imaeqvhb7fda2mze.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vrgnfzzgnw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vraq9gafpw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vrgjkk2tb4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vrbz7cb9t9.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vrqgzbgr9w.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j48riq80-1/mobile/p/y/q/vivo-v5-plus-na-original-imaev4vrrqzptsgz.jpeg?q=70\n'),(79,'4.5 inch','8 GB','Horizon 1','S455120','5MP','Spreadtrum SC9832 Quad Core 1.3GHz','1 GB','3.2MP','126.1 g','rukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7ezjqwtjr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7ezjqwtjr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7zapxzynv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7embwbtuy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7hjg8ckgu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7ymj9hhr3.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j0sg7m80/mobile/q/b/f/sansui-horizon-1-na-original-imaesgj7cxyk7cwt.jpeg?q=70\n'),(80,'4.5 inch','8 GB','Horizon 1','S455120','5MP','Spreadtrum SC9832','1 GB','3.2MP','126.1 g','rukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnu7yfh8bbz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnu7yfh8bbz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnuhwshyyzc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnuxgjpgjy3.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnu3gn2sqye.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnunfwuthkb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnucgcggucf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnuveuywqft.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6dxaq80/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnu4hygehms.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6b2f0w0/mobile/z/t/b/sansui-horizon-1-s455120-original-imaewsnuevpmzfsq.jpeg?q=70\n'),(81,'4.5 inch','8 GB','Horizon 1','S455120','5MP','Spreadtrum SC9832 Quad Core 1.3GHz','1 GB','3.2MP','126.1 g','rukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4gghkq3baw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4gghkq3baw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4gh9jwes9x.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4gqzhgrxzx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4gz5ehvgwk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4g9fvcz3u6.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4ghkvrrwhz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j110uq80/mobile/7/d/s/sansui-horizon-1-na-original-imaesp4gmg9kmy3e.jpeg?q=70\n'),(82,'5.5 inch','16 GB','Galaxy J7 Nxt','SM-J701FZKDINS','13MP','Exynos Octa-Core 1.6GHz','2 GB','5MP','170 g','rukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emjzhahhcp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emrgr2xfnm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em6fv7yufz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emdfryzvef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emnxt8rkw7.jpeg?q=70\n'),(83,'5.5 inch','64 GB','F3','CPH1609','13MP','Mediatek MT6750T Octa Core 1.5GHz','4 GB','16MP + 8MP','153 g','rukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmfgaqnjrbe.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmfv2dzpkdn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmfp6phdycm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmfthqnbbfy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmft2gbyuhg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmfehzjzghh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j2c6du80/mobile/6/y/c/oppo-f3-cph1609-original-imaetmmfszuftyhc.jpeg?q=70\n'),(84,'5.7 inch','128 GB','8 Pro','DUKE-L09 / DUK-L09','12MP + 12MP','Kirin 960','6 GB','8MP','184 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3pcegz3df.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3n5hfpnfx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3pp77zeqb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3bpuduuca.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3dzsgccyj.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3qgurza7t.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3rhuskzgr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy34ucztafb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3fwkadvas.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3k2vwgyfy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy36g9bz6zx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/z/g/j/honor-8-pro-duke-l09-v100r001-original-imaexdy3jwahf2gk.jpeg?q=70\n'),(85,'5.7 inch','128 GB','8 Pro','Duke-L09 / Duk-L09','12MP + 12MP','Kirin 960','6 GB','8MP','184 g','rukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3zvps52qf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3wf7nqj97.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3bzaqhzsr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy35bv99ujr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3hkjyxcn4.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3ghhat33f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3qmkyjygq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3hjngssdm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3h9vydw9h.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy38utjegm2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3bk6dzcgt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j70sccw0/mobile/t/a/9/honor-8-pro-duke-l09-v100r001-original-imaexdy3ce7fjxhx.jpeg?q=70\n'),(86,'5 inch','16 GB','Me5 - 4G VoLTE','Me5','8MP','SC 9832','2 GB','5MP','130 g','rukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkv2g3aeds.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkv2g3aeds.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkbmcqzxpd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkvhvfqf9n.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkcycjejk7.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkzwgeuyqf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzk5m5phqx5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkzxnyhypy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j58hj0w0/mobile/f/s/8/ivoomi-me5-me5-original-imaevyzkwgugcbrq.jpeg?q=70\n'),(87,'5.5 inch','32 GB','Zenfone Max','ZC550KL-6A126IN','13MP','Qualcomm Snapdragon 410 MSM8916','2 GB','5MP','202 g','rukminim1.flixcart.com/image/128/128/j1fb98w0/mobile/n/j/6/asus-zenfone-max-zc550kl-6a126in-original-imaetyyexckzpebr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j1fb98w0/mobile/n/j/6/asus-zenfone-max-zc550kl-6a126in-original-imaetyyfgz3dgp3d.jpeg?q=70\n'),(88,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkqsn8yqrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkejyame8c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkzcafgvhh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkaz6qhy2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkayadzexx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkyygn7eg5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkygqkztv8.jpeg?q=70\n'),(89,'5.5 inch','16 GB','5X',' ','13MP','Qualcomm Snapdragon 616 MSM8939V2','2 GB','5MP','158 g','rukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaeeyh9c2524vft.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6yhrzzbmz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6ygpcfxvg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6brgzdban.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6fjg7gcrs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k7zub63zt6.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k7hg5b3cgf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6fftd2zfc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6v9hjbqws.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6hpbjjhny.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/s/e/m/honor-5x-na-original-imaef6k6pwjgqzrs.jpeg?q=70\n'),(90,'5.99 inch','64 GB','V7+','1716','16MP','Qualcomm Snapdragon 450 Octa Core 1.8 GHz','4 GB','24MP','160 g','rukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3ptbgzyust.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3pnb6rheag.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3pepzebwj5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3pxru29ggz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3pzhvggevh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3pt83c3j5f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/9/k/a/vivo-v7-plus-1716-original-imaexh3psbpbkrwm.jpeg?q=70\n'),(91,'5.99 inch','64 GB','V7+','1716','16MP','Qualcomm Snapdragon 450 Octa Core 1.8 GHz','4 GB','24MP','160 g','rukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3p9xjhhcjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3p8jxqt7vz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3psewsphhy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3pnbk9vfnh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3pavrruyvw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3pjywyjgrx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j76i3rk0/mobile/z/n/6/vivo-v7-plus-1716-original-imaexh3pmn64qzy8.jpeg?q=70\n'),(92,'5.2 inch','16 GB','Me3','iV 501','8MP','MediaTek 6737 64-bit 1.3GHz','2 GB','8MP','158 g','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(93,'5 inch','8 GB','Me1','iV505','5MP','Spreadtrum SC 98 1.2 GHz Processor','1 GB','5MP','130 g','rukminim1.flixcart.com/image/128/128/j77xjm80/mobile/e/3/c/ivoomi-me1-iv505-original-imaexg7qtg3gz3z6.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/e/3/c/ivoomi-me1-iv505-original-imaexg7qhzdhmt2y.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/e/3/c/ivoomi-me1-iv505-original-imaexg7qsgxtkhur.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/e/3/c/ivoomi-me1-iv505-original-imaexg7qguxargcz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/e/3/c/ivoomi-me1-iv505-original-imaexg7qheadwvgt.jpeg?q=70\n'),(94,'5.5 inch','16 GB','P55 Max','EB-90S55PMXK','13MP','MediaTek MTK6737 Quad Core 1.25 GHz','3 GB','5MP','180 g','rukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4atrjtwhj3.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4a9rvxhjmb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4ah75h3z24.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4a8agf2wqd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4at2xyypve.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4awzrhuu3c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4bn2hc8uuz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4bz4fyvcdf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4augcbkmnt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4bgbfj4dzr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4bmmptayjh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j4x207k0/mobile/v/h/9/panasonic-p55-max-eb-90s55pmxk-original-imaevq4bmwhexmf8.jpeg?q=70\n'),(95,'5.5 inch','32 GB','Moto M','XT1663','16MP','MediaTek Helio P15 64-bit Octa Core 2.2GHz','3 GB','8MP','163 g','rukminim1.flixcart.com/image/128/128/mobile/z/e/j/motorola-moto-m-xt1663-original-imaep55utc7u4sg8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/z/e/j/motorola-moto-m-xt1663-original-imaep55utc7u4sg8.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/z/e/j/motorola-moto-m-xt1663-original-imaep55v6fkwg2nu.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/z/e/j/motorola-moto-m-xt1663-original-imaep55vhgxcf26q.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/z/e/j/motorola-moto-m-xt1663-original-imaep55vkp9yn86h.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/z/e/j/motorola-moto-m-xt1663-original-imaep56a8ahh7hg5.jpeg?q=70\n'),(96,'5 inch','8 GB','Elite 4G',' ','8MP','ARM Cortex A7 Quad Core 1.3 GHz','1 GB','5MP','147 g','rukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkeefjghtsx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkeukqswhvm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkevqmg87rp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkesemwjxb5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkefrvg7pwx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkerhsypnt3.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzkehmhy2yrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/9/n/swipe-elite-4g-na-original-imaewzked4ettfxr.jpeg?q=70\n'),(97,'5 inch','8 GB','Elite 4G',' ','8MP','ARM Cortex A7 Quad Core 1.3 GHz','1 GB','5MP','147 g','rukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgbzauzevya.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgba3gmf8ra.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgbfnxdzbpk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgbm8eqmgfx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgbqqxzhtbr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgbpwmnntqx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgb4rzrfycc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/y/h/c/swipe-elite-4g-na-original-imaewzgbghaggvga.jpeg?q=70\n'),(98,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(99,'5 inch','8 GB','Elite 4G',' ','8MP','ARM Cortex A7 Quad Core 1.3 GHz','1 GB','5MP','147 g','rukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkddvgphrvt.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkdxheg7pjz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkddr9t9rm9.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkdxhsbwwhn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkduzh7gprf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkd4tx4zp7s.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkdghrcmsyk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j65cnm80/mobile/b/u/s/swipe-elite-4g-na-original-imaewzkdh8yqzwq4.jpeg?q=70\n'),(100,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP','150 g','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkghhcgfxh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkghhcgfxh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbksqqmwgc2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbk3ta5rndc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkgtzkhcjb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkfkgqfryq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkwk8msztg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbknbjb2zfh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkjwhdqkm9.jpeg?q=70\n'),(101,'5.2 inch','32 GB','Me3S','iV 501','13MP','MediaTek 6737 64-bit 1.3GHz','3 GB','8MP',' ','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkqsn8yqrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkejyame8c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkzcafgvhh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkaz6qhy2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkayadzexx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkyygn7eg5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkygqkztv8.jpeg?q=70\n'),(103,'5.2 inch','16 GB','Me3','iV 501','8MP','MediaTek 6737 64-bit 1.3GHz','2 GB','8MP','158 g','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkg4ega5hn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkggm3pteh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkwavyhsfd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkzwausgtm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkuk5vseax.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkaksj4h88.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkksyhqfjp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/g/h/x/ivoomi-me3-iv-501-original-imaexhbkjhfr48yt.jpeg?q=70\n'),(104,'5.2 inch','16 GB','Me3','iV 501','8MP','MediaTek 6737 64-bit 1.3GHz','2 GB','8MP','158 g','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkghhcgfxh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkghhcgfxh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbksqqmwgc2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbk3ta5rndc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkgtzkhcjb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkfkgqfryq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkwk8msztg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbknbjb2zfh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/s/7/y/ivoomi-me3-iv-501-original-imaexhbkjwhdqkm9.jpeg?q=70\n'),(105,'1.8 inch','10 MB','W7',' ','0.3MP','0 0 0 0 Processor','10 MB',' ',' ','rukminim1.flixcart.com/image/128/128/j7usl8w0/mobile/g/r/x/rocktel-w7-na-original-imaeyy7nqvzkxncn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/g/r/x/rocktel-w7-na-original-imaehg4nrsyug7jc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j81xsi80/mobile/g/r/x/rocktel-w7-na-original-imaeyy7kg5rqafx8.jpeg?q=70\n'),(106,'5.5 inch','32 GB','Zenfone 3 Laser','ZC551KL-4G037INASUS_Z01BDB','13MP','Qualcomm Snapdragon 430 64-bit Octa Core 1.4GHz','4 GB','8MP','150 g','rukminim1.flixcart.com/image/128/128/mobile/7/h/p/asus-zenfone-3-laser-zc551kl-4g037in-original-imaehfztafhgthma.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/h/p/asus-zenfone-3-laser-zc551kl-4g037in-original-imaehg3cbyjhwtug.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/h/p/asus-zenfone-3-laser-zc551kl-4g037in-original-imaehg3cggqkxbq2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/h/p/asus-zenfone-3-laser-zc551kl-4g037in-original-imaehg3cyfkzpudr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/7/h/p/asus-zenfone-3-laser-zc551kl-4g037in-original-imaehg3c9jatgh8d.jpeg?q=70\n'),(107,'5.2 inch','16 GB','Me3','iV 501','8MP','MediaTek 6737 64-bit 1.3GHz','2 GB','8MP','158 g','rukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkk5bp4y4b.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkqsn8yqrc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkejyame8c.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkzcafgvhh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkaz6qhy2e.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkayadzexx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkyygn7eg5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7f2qvk0/mobile/p/v/c/ivoomi-me3-iv-501-original-imaexhbkygqkztv8.jpeg?q=70\n'),(108,'5.5 inch','16 GB','Galaxy J7 Nxt','SM-J701FZKDINS','13MP','Exynos Octa-Core 1.6GHz','2 GB','5MP','170 g','rukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em68ktztyv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emjzhahhcp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emrgr2xfnm.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2em6fv7yufz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emdfryzvef.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5crukw0/mobile/j/k/7/samsung-j7-nxt-sm-j701fzkdins-original-imaew2emnxt8rkw7.jpeg?q=70\n'),(109,'5 inch','8 GB','Me1','iV 505','5MP','Spreadtrum SC 98 1.2 GHz Processor','1 GB','5MP','130 g','rukminim1.flixcart.com/image/128/128/j77xjm80/mobile/y/g/e/ivoomi-me1-iv-505-original-imaexg7qhq58hwuy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/y/g/e/ivoomi-me1-iv-505-original-imaexg7qzxrkabhw.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/y/g/e/ivoomi-me1-iv-505-original-imaexg7qdkb9dkb5.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/y/g/e/ivoomi-me1-iv-505-original-imaexg7qz9hzascz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j77xjm80/mobile/y/g/e/ivoomi-me1-iv-505-original-imaexg7qaenfhavr.jpeg?q=70\n'),(110,'5.5 inch','64 GB','Moto Z with Style Mod','XT 1650-03','13MP','Qualcomm Snapdragon 820 Quad Core 1.8GHz','4 GB','5MP','136 g','rukminim1.flixcart.com/image/128/128/mobile/k/s/3/motorola-moto-z-xt-1650-original-imaene32ywjffcmy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/k/s/3/motorola-moto-z-xt-1650-original-imaene32t4p3shkz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/k/s/3/motorola-moto-z-xt-1650-original-imaene32mewqm2uv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/k/s/3/motorola-moto-z-xt-1650-original-imaene32qch5epzn.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/k/s/3/motorola-moto-z-xt-1650-original-imaene32ywcgptmv.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/k/s/3/motorola-moto-z-xt-1650-original-imaene32nmnk8fte.jpeg?q=70\n'),(111,'5.2 inch','32 GB','Honor 8','FRD-L02','12MP + 12MP','ARM Hisilicon Kirin 950 - ARM Cortex A72 + ARM Cortex A53 Octa Core 2.3GHz','4 GB','8MP','153 g','rukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4zfp56qnbc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/huawei-honor-8-frd-l02-original-imaema4zzng3zvhy.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4zeg2mywbb.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4zczjmjkgh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4z6s9bvuqg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4zaeypvwgk.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4z2hzhh2rf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4z4pahguvd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4zggrthtkg.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4yxfzkj7xx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4ys4qpb5tc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/y/5/honor-8-frd-l02-original-imaema4zqxxwnhpz.jpeg?q=70\n'),(112,'5 inch','16 GB','ERA 1X Pro',' ','8MP','Spreadtrum','2 GB','5MP',' ','rukminim1.flixcart.com/image/128/128/j6nxdow0/mobile/c/9/h/xolo-era-1x-pro-era-1x-pro-original-imaewhutwuyuvqzd.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6nxdow0/mobile/c/9/h/xolo-era-1x-pro-era-1x-pro-original-imaewhutt2rhbafs.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6nxdow0/mobile/c/9/h/xolo-era-1x-pro-era-1x-pro-original-imaewwyrzuvpezqp.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6nxdow0/mobile/c/9/h/xolo-era-1x-pro-era-1x-pro-original-imaewhutajhcykja.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6tn53k0/mobile/c/9/h/xolo-era-1x-pro-era-1x-pro-original-imaewhuuayu7tuwf.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j6nxdow0/mobile/c/9/h/xolo-era-1x-pro-era-1x-pro-original-imaewhuuqkezkhgd.jpeg?q=70\n'),(113,'5 inch','16 GB','ERA 1X Pro',' ','8MP','Spreadtrum','2 GB','5MP',' ','rukminim1.flixcart.com/image/128/128/j5h264w0/mobile/p/j/6/xolo-era-1x-pro-era-1x-pro-original-imaevyvsyncjng2x.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5h264w0/mobile/p/j/6/xolo-era-1x-pro-era-1x-pro-original-imaevyvsbwr6eugr.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5h264w0/mobile/p/j/6/xolo-era-1x-pro-era-1x-pro-original-imaevyvszmrphyhc.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5h264w0/mobile/p/j/6/xolo-era-1x-pro-era-1x-pro-original-imaevyvsekrwzbrq.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j5h264w0/mobile/p/j/6/xolo-era-1x-pro-era-1x-pro-original-imaevyvs4gyfkfm5.jpeg?q=70\n'),(114,'4 inch','32 GB','iPhone SE','MP832HN/A','12MP','Apple A9 64-bit processor and Embedded M9 Motion Co-processor',' ','1.2MP','113 g','rukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/k/a/v/apple-iphone-se-mp832hn-a-original-imaexw6fws9h87cx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/k/a/v/apple-iphone-se-mp832hn-a-original-imaexw6f29cdhcny.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/j7qi9ow0/mobile/k/a/v/apple-iphone-se-mp832hn-a-original-imaexw6fcahhxv5c.jpeg?q=70\n'),(115,'5.2 inch','16 GB','Moto X (2nd Generation)','XT1092','13MP','Qualcomm Snapdragon 801 MSM8974-AC','2 GB','2MP','144 g','rukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzua6ts7an39g.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzqtcfwgar8hx.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzynzdhjz59e2.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzua6ecquhaqz.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzqtctghggcyh.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzqtcjm3wzh3f.jpeg?q=70\nrukminim1.flixcart.com/image/128/128/mobile/f/e/8/motorola-xt1092-original-imadzqtmdhdvhanc.jpeg?q=70\n'),(200,'10.5 inch','50 GB','hi','yo','test','test','test','test','test','test'),(200,'10.5 inch','50 GB','just testing','just testing','test','test','test','test','test','test');
/*!40000 ALTER TABLE `mobile_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobiles`
--

DROP TABLE IF EXISTS `mobiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobiles` (
  `mobile_id` varchar(20) NOT NULL,
  `model_no` varchar(20) NOT NULL,
  `ram` varchar(5) NOT NULL,
  `screen_size` varchar(10) NOT NULL,
  `internal_memory` varchar(10) NOT NULL,
  `processor` varchar(50) NOT NULL,
  `primary_camera` varchar(5) DEFAULT NULL,
  `secondary_camera` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`mobile_id`),
  CONSTRAINT `mobile_id` FOREIGN KEY (`mobile_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobiles`
--

LOCK TABLES `mobiles` WRITE;
/*!40000 ALTER TABLE `mobiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_datetime` datetime DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `cart_id_fk` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cart_id_idx` (`cart_id_fk`),
  CONSTRAINT `cart_id_fk` FOREIGN KEY (`cart_id_fk`) REFERENCES `cart` (`cart_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pdt_id` varchar(20) NOT NULL,
  `brand_name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_weight` decimal(10,2) DEFAULT NULL,
  `units_in_stock` int(11) NOT NULL,
  PRIMARY KEY (`pdt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `product_id` varchar(20) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  PRIMARY KEY (`product_id`,`image_url`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supply`
--

DROP TABLE IF EXISTS `product_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_supply` (
  `supplier_id` int(11) NOT NULL,
  `prod_id` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`,`prod_id`),
  KEY `prod_id_idx` (`prod_id`),
  CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`sup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supply`
--

LOCK TABLES `product_supply` WRITE;
/*!40000 ALTER TABLE `product_supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_in_cart`
--

DROP TABLE IF EXISTS `products_in_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_in_cart` (
  `cart_id_fk` int(11) NOT NULL,
  `prd_id` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cart_id_fk`,`prd_id`),
  KEY `prd_id` (`prd_id`),
  CONSTRAINT `products_in_cart_ibfk_1` FOREIGN KEY (`cart_id_fk`) REFERENCES `cart` (`cart_id`),
  CONSTRAINT `products_in_cart_ibfk_2` FOREIGN KEY (`prd_id`) REFERENCES `product` (`pdt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_in_cart`
--

LOCK TABLES `products_in_cart` WRITE;
/*!40000 ALTER TABLE `products_in_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_in_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(100) DEFAULT NULL,
  `contact` int(15) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `television`
--

DROP TABLE IF EXISTS `television`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `television` (
  `tv_id` varchar(20) NOT NULL,
  `model_no` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `display_size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tv_id`),
  CONSTRAINT `tv_id` FOREIGN KEY (`tv_id`) REFERENCES `product` (`pdt_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `television`
--

LOCK TABLES `television` WRITE;
/*!40000 ALTER TABLE `television` DISABLE KEYS */;
/*!40000 ALTER TABLE `television` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-21 22:22:10
