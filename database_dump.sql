-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: hostel
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add tag',7,'add_tag'),(26,'Can change tag',7,'change_tag'),(27,'Can delete tag',7,'delete_tag'),(28,'Can view tag',7,'view_tag'),(29,'Can add tagged item',8,'add_taggeditem'),(30,'Can change tagged item',8,'change_taggeditem'),(31,'Can delete tagged item',8,'delete_taggeditem'),(32,'Can view tagged item',8,'view_taggeditem'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add hostel',11,'add_hostel'),(42,'Can change hostel',11,'change_hostel'),(43,'Can delete hostel',11,'delete_hostel'),(44,'Can view hostel',11,'view_hostel'),(45,'Can add booking',12,'add_booking'),(46,'Can change booking',12,'change_booking'),(47,'Can delete booking',12,'delete_booking'),(48,'Can view booking',12,'view_booking'),(49,'Can add staff on duty',13,'add_staffonduty'),(50,'Can change staff on duty',13,'change_staffonduty'),(51,'Can delete staff on duty',13,'delete_staffonduty'),(52,'Can view staff on duty',13,'view_staffonduty'),(53,'Can add room type',14,'add_roomtype'),(54,'Can change room type',14,'change_roomtype'),(55,'Can delete room type',14,'delete_roomtype'),(56,'Can view room type',14,'view_roomtype'),(57,'Can add room',15,'add_room'),(58,'Can change room',15,'change_room'),(59,'Can delete room',15,'delete_room'),(60,'Can view room',15,'view_room'),(61,'Can add hostel gallery',16,'add_hostelgallery'),(62,'Can change hostel gallery',16,'change_hostelgallery'),(63,'Can delete hostel gallery',16,'delete_hostelgallery'),(64,'Can view hostel gallery',16,'view_hostelgallery'),(65,'Can add hostel feature',17,'add_hostelfeature'),(66,'Can change hostel feature',17,'change_hostelfeature'),(67,'Can delete hostel feature',17,'delete_hostelfeature'),(68,'Can view hostel feature',17,'view_hostelfeature'),(69,'Can add hostel faqs',18,'add_hostelfaqs'),(70,'Can change hostel faqs',18,'change_hostelfaqs'),(71,'Can delete hostel faqs',18,'delete_hostelfaqs'),(72,'Can view hostel faqs',18,'view_hostelfaqs'),(73,'Can add activity log',19,'add_activitylog'),(74,'Can change activity log',19,'change_activitylog'),(75,'Can delete activity log',19,'delete_activitylog'),(76,'Can view activity log',19,'view_activitylog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$o7AaDybkwgdpc7qvqFXmum$8gNQ/40ysqP4pch1AJFI9xOFqHgaIW/yCvf9IB12zz4=','2024-09-13 06:11:45.328360',1,'tanisha','','','afrintanisha184@gmail.com',1,1,'2024-09-13 06:10:35.877564');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-09-16 07:02:38.696802','1','tan',1,'[{\"added\": {}}]',11,1),(2,'2024-09-18 17:11:15.447926','2','shahely',1,'[{\"added\": {}}]',11,1),(3,'2024-09-19 05:46:33.682050','1','premium - tan - 8000',1,'[{\"added\": {}}]',14,1),(4,'2024-09-19 05:47:21.259051','1','premium - tan',1,'[{\"added\": {}}]',15,1),(5,'2024-09-19 05:49:26.101096','2','premium - tan',1,'[{\"added\": {}}]',15,1),(6,'2024-09-19 05:49:36.577358','3','premium - tan',1,'[{\"added\": {}}]',15,1),(7,'2024-09-19 11:24:10.085693','2','Normal - tan - 6000',1,'[{\"added\": {}}]',14,1),(8,'2024-09-19 11:24:27.983418','4','Normal - tan',1,'[{\"added\": {}}]',15,1),(9,'2024-09-19 11:24:35.628833','5','Normal - tan',1,'[{\"added\": {}}]',15,1),(10,'2024-09-19 11:24:45.912711','6','Normal - tan',1,'[{\"added\": {}}]',15,1),(11,'2024-09-19 11:26:34.516611','7','Normal - tan',1,'[{\"added\": {}}]',15,1),(12,'2024-09-20 06:07:52.331666','1','selxqattbh',1,'[{\"added\": {}}]',12,1),(13,'2024-09-21 07:28:03.356112','1','tanisha',2,'[{\"changed\": {\"fields\": [\"Last login\", \"Gender\", \"Otp\"]}}]',10,1),(14,'2024-09-21 10:12:48.784605','2','bbpkrcavet',1,'[{\"added\": {}}]',12,1),(15,'2024-09-21 13:39:33.170351','1','selxqattbh',2,'[{\"changed\": {\"fields\": [\"Checked out\"]}}]',12,1),(16,'2024-09-21 17:16:25.320177','2','shahely',3,'',11,1),(17,'2024-09-21 17:23:04.444843','3','Maloncho',1,'[{\"added\": {}}]',11,1),(18,'2024-09-21 17:25:46.142468','1','Nikunjo',2,'[{\"changed\": {\"fields\": [\"Name\", \"Description\", \"Image\", \"Address\"]}}]',11,1),(19,'2024-09-22 04:01:21.326346','7','bajvtkmtbg',3,'',12,1),(20,'2024-09-22 04:01:45.532093','10','oxhicwmnhy',3,'',12,1),(21,'2024-09-22 04:02:02.874932','14','jtytiboced',3,'',12,1),(22,'2024-09-22 04:02:20.073103','13','urzgixszsp',3,'',12,1),(23,'2024-09-22 04:02:34.450353','3','xoqnsimrqf',3,'',12,1),(24,'2024-09-22 04:02:47.978803','12','rlpbevijdb',3,'',12,1),(25,'2024-09-22 04:02:57.697756','11','ftpyvzdlln',3,'',12,1),(26,'2024-09-22 04:03:13.483774','9','ljcyvzurta',3,'',12,1),(27,'2024-09-22 04:03:28.117470','8','trjpygvgbd',3,'',12,1),(28,'2024-09-22 10:24:36.460884','1','premium - Nikunjo - 250',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,1),(29,'2024-09-22 10:24:49.952900','8','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(30,'2024-09-22 10:25:05.583077','9','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(31,'2024-09-22 10:25:17.622055','10','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(32,'2024-09-22 10:25:39.976771','2','Normal - Nikunjo - 200',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',14,1),(33,'2024-09-22 10:25:46.776689','11','Normal - Maloncho',1,'[{\"added\": {}}]',15,1),(34,'2024-09-22 10:26:15.550926','2','Normal - Maloncho - 200.00',2,'[{\"changed\": {\"fields\": [\"Hostel\"]}}]',14,1),(35,'2024-09-22 10:26:22.563878','12','Normal - Maloncho',1,'[{\"added\": {}}]',15,1),(36,'2024-09-22 10:26:38.388902','13','Normal - Maloncho',1,'[{\"added\": {}}]',15,1),(37,'2024-09-22 10:27:14.217299','1','premium - Maloncho - 250.00',2,'[{\"changed\": {\"fields\": [\"Hostel\"]}}]',14,1),(38,'2024-09-22 10:27:19.021049','14','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(39,'2024-09-22 10:27:33.013617','15','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(40,'2024-09-22 10:27:43.248486','16','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(41,'2024-09-22 10:27:55.371048','17','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(42,'2024-09-22 10:48:50.659868','1','tanisha',2,'[]',10,1),(43,'2024-09-22 13:24:49.693629','2','Normal - Maloncho - 200.00',2,'[]',14,1),(44,'2024-09-22 13:25:53.270389','1','premium - Nikunjo - 250.00',2,'[{\"changed\": {\"fields\": [\"Hostel\"]}}]',14,1),(45,'2024-09-22 13:26:09.080225','1','premium - Maloncho - 250.00',2,'[{\"changed\": {\"fields\": [\"Hostel\"]}}]',14,1),(46,'2024-09-22 14:45:06.990153','3','premium - Nikunjo - 250',1,'[{\"added\": {}}]',14,1),(47,'2024-09-22 14:55:20.616931','18','premium - Nikunjo',1,'[{\"added\": {}}]',15,1),(48,'2024-09-22 14:55:23.998685','24','pdvzsmsqqy',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Room\", \"Check in date\", \"Check out date\", \"Total days\"]}}]',12,1),(49,'2024-09-22 15:32:39.347310','19','premium - Nikunjo',1,'[{\"added\": {}}]',15,1),(50,'2024-09-22 15:33:03.431139','27','ndxjwlbwgm',2,'[{\"changed\": {\"fields\": [\"Payment status\", \"Room\", \"Total days\"]}}]',12,1),(51,'2024-09-22 16:15:08.931836','3','Normal - Nikunjo - 200.00',2,'[{\"changed\": {\"fields\": [\"Type\", \"Price\"]}}]',14,1),(52,'2024-09-22 16:15:17.114263','20','Normal - Nikunjo',1,'[{\"added\": {}}]',15,1),(53,'2024-09-22 16:16:44.806263','4','premium - Nikunjo - 250',1,'[{\"added\": {}}]',14,1),(54,'2024-09-22 16:16:53.079149','21','premium - Nikunjo',1,'[{\"added\": {}}]',15,1),(55,'2024-09-22 16:22:40.534561','20','Normal - Nikunjo',3,'',15,1),(56,'2024-09-22 16:23:22.157258','22','Normal - Nikunjo',1,'[{\"added\": {}}]',15,1),(57,'2024-09-22 16:36:03.157033','23','Normal - Nikunjo',1,'[{\"added\": {}}]',15,1),(58,'2024-09-22 16:36:21.194160','24','Normal - Nikunjo',1,'[{\"added\": {}}]',15,1),(59,'2024-09-22 16:36:47.622554','25','premium - Nikunjo',1,'[{\"added\": {}}]',15,1),(60,'2024-09-22 16:36:57.687954','26','premium - Nikunjo',1,'[{\"added\": {}}]',15,1),(61,'2024-09-22 18:41:39.063821','28','ojduiledel',1,'[{\"added\": {}}]',12,1),(62,'2024-09-22 19:33:05.880405','29','xxtblxhldo',1,'[{\"added\": {}}]',12,1),(63,'2024-09-23 02:04:44.432426','27','premium - Maloncho',1,'[{\"added\": {}}]',15,1),(64,'2024-09-23 02:05:09.080540','28','premium - Nikunjo',1,'[{\"added\": {}}]',15,1),(65,'2024-09-23 02:05:49.881893','29','Normal - Maloncho',1,'[{\"added\": {}}]',15,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(19,'hostel','activitylog'),(12,'hostel','booking'),(11,'hostel','hostel'),(18,'hostel','hostelfaqs'),(17,'hostel','hostelfeature'),(16,'hostel','hostelgallery'),(15,'hostel','room'),(14,'hostel','roomtype'),(13,'hostel','staffonduty'),(6,'sessions','session'),(7,'taggit','tag'),(8,'taggit','taggeditem'),(9,'userauths','profile'),(10,'userauths','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-13 06:08:07.303564'),(2,'contenttypes','0002_remove_content_type_name','2024-09-13 06:08:07.369162'),(3,'auth','0001_initial','2024-09-13 06:08:07.905054'),(4,'admin','0001_initial','2024-09-13 06:08:08.051679'),(5,'auth','0002_alter_permission_name_max_length','2024-09-13 06:08:08.119345'),(6,'auth','0003_alter_user_email_max_length','2024-09-13 06:08:08.142383'),(7,'auth','0004_alter_user_username_opts','2024-09-13 06:08:08.160842'),(8,'auth','0005_alter_user_last_login_null','2024-09-13 06:08:08.204496'),(9,'auth','0006_require_contenttypes_0002','2024-09-13 06:08:08.204496'),(10,'auth','0007_alter_validators_add_error_messages','2024-09-13 06:08:08.220327'),(11,'auth','0008_alter_user_username_max_length','2024-09-13 06:08:08.303717'),(12,'auth','0009_alter_user_last_name_max_length','2024-09-13 06:08:08.372317'),(13,'auth','0010_alter_group_name_max_length','2024-09-13 06:08:08.389260'),(14,'auth','0011_update_proxy_permissions','2024-09-13 06:08:08.399907'),(15,'auth','0012_alter_user_first_name_max_length','2024-09-13 06:08:08.462083'),(16,'sessions','0001_initial','2024-09-13 06:08:08.496791'),(17,'taggit','0001_initial','2024-09-13 06:08:08.664776'),(18,'taggit','0002_auto_20150616_2121','2024-09-13 06:08:08.686744'),(19,'taggit','0003_taggeditem_add_unique_index','2024-09-13 06:08:08.711981'),(20,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2024-09-13 06:08:08.740348'),(21,'taggit','0005_auto_20220424_2025','2024-09-13 06:08:08.754863'),(22,'userauths','0001_initial','2024-09-13 06:54:44.190443'),(23,'admin','0002_logentry_remove_auto_add','2024-09-14 09:09:52.862400'),(24,'admin','0003_logentry_add_action_flag_choices','2024-09-14 09:09:52.875920'),(25,'hostel','0001_initial','2024-09-16 06:54:22.072095'),(26,'hostel','0002_booking_alter_hostel_description_staffonduty_and_more','2024-09-18 06:30:17.188640'),(27,'hostel','0003_remove_hostel_tags_hostel_tags','2024-09-19 05:12:05.070404');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('04iuid0awpma1q2ty980xpf98h1d5xem','e30:1spjyV:QOvR17oaw7IBM84014h5Du9WpkMrhSHYj_EiNaICK3o','2024-09-29 07:47:15.397860'),('0yyasdf1l2v5ekugrqsoxu73611s10zc','.eJy9jsEKwyAMQP_FcxmZp9GfEWsDdWuM2HgYxX-flll26nGXwHuE5O1qwxWdeA5mtmINT0817urexsKb4Gr8rMYqhs7BElYjNlSXmKmbmJB8pm5j8q7pBwDcAM7lTBOm78nDyDviL58P3YLuxVkqdvKhQRmU_kOhvizUl4WlfABZiG37:1srKzj:wpyfKc1KwI-4JUQKdxYeJvg3JiDK-JgNN54Nvo_clxk','2024-10-03 17:31:07.413553'),('896qw26htofmb4uziettc20w961lllli','.eJxVzTEOgzAMBdC7eGYoVF04BFeIQrCEIbFRSIYK5e5NKjywWPpP-v4XnOjRJRI2i03WyLzBeMEwtLvKmdAbWmCEHjrNbANWmWjPvEn1KBJu5ez9DUck9xTOYcZYq59Xr7X0Pdqzt-b_WJ3vwK3odsmpTQmjCrFCKeUHmPc_6w:1t7dV1:aconxCra8nHJ7X-n4ci_Uf3YmzbDAS-27yUVe6YFwvs','2024-11-17 16:30:47.388108'),('vnhgpxbpmffge6ap3jtzekudeo6nvhw9','e30:1spk1o:7q0KdQJaddRX-oNUEMLFmrIscFI7-XU2_WN142Y2tcc','2024-09-29 07:50:40.784711'),('y5hudsz4s5mit6zgyhjpr11tze0ges29','e30:1spjOa:4MjFnwEwjVAlIrYpjFsAWQil7XwfpcRagy3Toh50mR4','2024-09-29 07:10:08.172466');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_activitylog`
--

DROP TABLE IF EXISTS `hostel_activitylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_activitylog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `guest_out` datetime(6) NOT NULL,
  `guest_in` datetime(6) NOT NULL,
  `description` longtext,
  `date` datetime(6) NOT NULL,
  `booking_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hostel_activitylog_booking_id_d527705a_fk_hostel_booking_id` (`booking_id`),
  CONSTRAINT `hostel_activitylog_booking_id_d527705a_fk_hostel_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `hostel_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_activitylog`
--

LOCK TABLES `hostel_activitylog` WRITE;
/*!40000 ALTER TABLE `hostel_activitylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostel_activitylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_booking`
--

DROP TABLE IF EXISTS `hostel_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(100) NOT NULL,
  `full_name` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `phone` varchar(1000) NOT NULL,
  `before_discount` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `saved` decimal(12,2) NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `total_days` int unsigned NOT NULL,
  `checked_in` tinyint(1) NOT NULL,
  `checked_out` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `checked_in_tracker` tinyint(1) NOT NULL,
  `checked_out_tracker` tinyint(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `stripe_payment_intent` varchar(1000) DEFAULT NULL,
  `success_id` varchar(1000) DEFAULT NULL,
  `booking_id` varchar(30) NOT NULL,
  `hostel_id` bigint DEFAULT NULL,
  `room_type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  KEY `hostel_booking_hostel_id_b5e4bdae_fk_hostel_hostel_id` (`hostel_id`),
  KEY `hostel_booking_room_type_id_e17cf79d_fk_hostel_roomtype_id` (`room_type_id`),
  KEY `hostel_booking_user_id_61de8d0a_fk_userauths_user_id` (`user_id`),
  CONSTRAINT `hostel_booking_hostel_id_b5e4bdae_fk_hostel_hostel_id` FOREIGN KEY (`hostel_id`) REFERENCES `hostel_hostel` (`id`),
  CONSTRAINT `hostel_booking_room_type_id_e17cf79d_fk_hostel_roomtype_id` FOREIGN KEY (`room_type_id`) REFERENCES `hostel_roomtype` (`id`),
  CONSTRAINT `hostel_booking_user_id_61de8d0a_fk_userauths_user_id` FOREIGN KEY (`user_id`) REFERENCES `userauths_user` (`id`),
  CONSTRAINT `hostel_booking_chk_1` CHECK ((`total_days` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_booking`
--

LOCK TABLES `hostel_booking` WRITE;
/*!40000 ALTER TABLE `hostel_booking` DISABLE KEYS */;
INSERT INTO `hostel_booking` VALUES (1,'paid','Afrin Tanisha','afrintanisha184@gmail.com','01717235222',8000.00,8000.00,0.00,'2024-09-20','2024-09-24',4,1,0,0,0,0,'2024-09-20 06:07:52.327066',NULL,NULL,'selxqattbh',1,1,1),(2,'pending','Ratul Hoque','ratul@gmail.com','0171723568',5000.00,5000.00,0.00,'2024-09-20','2024-09-22',2,0,0,0,0,0,'2024-09-21 10:12:48.780593',NULL,NULL,'bbpkrcavet',1,1,4),(4,'','Afrin Tanisha','afrintanisha184@gmail.com','0171723565',252000.00,252000.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-21 10:44:02.787867',NULL,NULL,'vcpkapgdpd',1,2,1),(5,'','Afrin Tanisha','afrintanisha184@gmail.com','0171723565',252000.00,252000.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-21 10:45:10.911291',NULL,NULL,'zlkzfhvwrs',1,2,1),(6,'','Afrin Tanisha','afrintanisha184@gmail.com','0171723568',252000.00,252000.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-21 10:45:32.781331',NULL,NULL,'kbaxhhhljn',1,2,1),(15,'','Afrin Tanisha','afrintanisha184@gmail.com','0171723567',252000.00,252000.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 04:05:28.635439',NULL,NULL,'qjpjdcbatd',1,2,1),(16,'','john doe','noshina.afrin.tanisha@g.bracu.ac.bd','01717235222',42000.00,42000.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 09:55:55.883585',NULL,NULL,'rrtsndrbox',1,2,1),(17,'','john doe','jmina@gmail.com','0171506986',42000.00,42000.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 09:58:39.021128',NULL,NULL,'khinexaeuj',1,2,1),(18,'','john doe','ratul@gmail.com','01717235222',1400.00,1400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 10:39:23.445890',NULL,NULL,'zqveevurtv',1,2,1),(19,'','john doe','ratul@gmail.com','01717235222',1400.00,1400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 11:47:10.700448',NULL,NULL,'wapobncsmi',1,2,1),(20,'','john doe','ratul@gmail.com','01717235222',8400.00,8400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 12:01:07.851151',NULL,NULL,'vkqzsrqhuo',1,2,1),(21,'','john doe','ratul@gmail.com','01717235222',8400.00,8400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 13:27:23.665204',NULL,NULL,'uieizfysfx',1,2,1),(22,'','john doe','test2@gmail.com','0171723565',8400.00,8400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 13:58:12.246924',NULL,NULL,'vgpoodptji',1,2,1),(23,'','john doe','ratul@gmail.com','0171723578',8400.00,8400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 14:04:53.264385',NULL,NULL,'negpnggdyt',1,2,1),(24,'cancelled','john doe','afrintanisha184@gmail.com','0171723578',8400.00,8400.00,0.00,'2024-09-02','2024-09-27',37,0,0,0,0,0,'2024-09-22 14:44:02.721698',NULL,NULL,'pdvzsmsqqy',1,2,1),(25,'','Afrin Tanisha','afrintanisha184@gmail.com','0171506986',8400.00,8400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 14:46:27.865587',NULL,NULL,'tchoxuvxuy',1,2,1),(26,'','john doe','test2@gmail.com','0171723565',8400.00,8400.00,0.00,'2024-09-16','2024-09-23',7,0,0,0,0,0,'2024-09-22 14:51:33.651858',NULL,NULL,'nkaducsbty',1,2,1),(27,'initiated','john doe','test2@gmail.com','0171723565',8400.00,8400.00,0.00,'2024-09-01','2024-09-25',8,0,0,0,0,0,'2024-09-22 15:19:27.752358',NULL,NULL,'ndxjwlbwgm',1,2,1),(28,'processing','Afrin Tanisha','afrintanisha184@gmail.com','0171723578',0.00,6000.00,0.00,'2024-09-01','2024-09-02',1,0,0,0,0,0,'2024-09-22 18:41:39.059793',NULL,NULL,'ojduiledel',3,1,1),(29,'paid','mina','n@gmail.com','0171506986',0.00,0.00,0.00,'2024-09-01','2024-09-17',0,0,0,0,0,0,'2024-09-22 19:33:05.878166',NULL,NULL,'xxtblxhldo',3,1,3),(30,'','john doe','afrintanisha184@gmail.com','01717235222',26400.00,26400.00,0.00,'2024-09-02','2024-09-04',22,0,0,0,0,0,'2024-09-23 01:47:33.436797',NULL,NULL,'trmlzomlzz',3,2,1),(31,'','Afrin Tanisha','afrintanisha184@gmail.com','01717235222',5750.00,5750.00,0.00,'2024-09-01','2024-09-25',23,0,0,0,0,0,'2024-09-23 05:44:05.098803',NULL,NULL,'dhqkbfzubp',3,1,1),(32,'','Afrin Tanisha','afrintanisha184@gmail.com','0171723567',4200.00,4200.00,0.00,'2024-09-23','2024-09-30',7,0,0,0,0,0,'2024-09-23 05:49:38.953845',NULL,NULL,'vvywgxswwg',3,2,1),(33,'','Afrin Tanisha','afrintanisha184@gmail.com','01797024317',1750.00,1750.00,0.00,'2024-09-23','2024-10-23',7,0,0,0,0,0,'2024-09-23 06:30:06.858509',NULL,NULL,'zutrbhbgga',3,1,13);
/*!40000 ALTER TABLE `hostel_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_booking_room`
--

DROP TABLE IF EXISTS `hostel_booking_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_booking_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostel_booking_room_booking_id_room_id_342f41c0_uniq` (`booking_id`,`room_id`),
  KEY `hostel_booking_room_room_id_d019634d_fk_hostel_room_id` (`room_id`),
  CONSTRAINT `hostel_booking_room_booking_id_104a2bb1_fk_hostel_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `hostel_booking` (`id`),
  CONSTRAINT `hostel_booking_room_room_id_d019634d_fk_hostel_room_id` FOREIGN KEY (`room_id`) REFERENCES `hostel_room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_booking_room`
--

LOCK TABLES `hostel_booking_room` WRITE;
/*!40000 ALTER TABLE `hostel_booking_room` DISABLE KEYS */;
INSERT INTO `hostel_booking_room` VALUES (1,1,2),(2,2,2),(9,4,1),(10,4,2),(12,4,3),(13,4,4),(14,4,5),(11,4,6),(15,5,1),(16,5,2),(18,5,3),(19,5,4),(20,5,5),(17,5,6),(21,6,1),(22,6,2),(24,6,3),(25,6,4),(26,6,5),(23,6,6),(75,15,1),(76,15,2),(78,15,3),(79,15,4),(80,15,5),(77,15,6),(81,16,5),(82,17,5),(83,18,5),(84,19,5),(85,20,1),(86,20,2),(88,20,3),(89,20,4),(90,20,5),(87,20,6),(91,21,1),(92,21,2),(94,21,3),(95,21,4),(96,21,5),(93,21,6),(97,22,1),(98,22,2),(100,22,3),(101,22,4),(102,22,5),(99,22,6),(103,23,1),(104,23,2),(106,23,3),(107,23,4),(108,23,5),(105,23,6),(127,24,18),(115,25,1),(116,25,2),(118,25,3),(119,25,4),(120,25,5),(117,25,6),(121,26,1),(122,26,2),(124,26,3),(125,26,4),(126,26,5),(123,26,6),(134,27,19),(135,28,1),(136,29,8),(137,30,4),(138,30,5),(139,30,6),(140,31,1),(141,32,1),(142,32,4),(143,33,15);
/*!40000 ALTER TABLE `hostel_booking_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_hostel`
--

DROP TABLE IF EXISTS `hostel_hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_hostel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `image` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `views` int NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `hid` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hid` (`hid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `hostel_hostel_user_id_d1dc56b6_fk_userauths_user_id` (`user_id`),
  CONSTRAINT `hostel_hostel_user_id_d1dc56b6_fk_userauths_user_id` FOREIGN KEY (`user_id`) REFERENCES `userauths_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_hostel`
--

LOCK TABLES `hostel_hostel` WRITE;
/*!40000 ALTER TABLE `hostel_hostel` DISABLE KEYS */;
INSERT INTO `hostel_hostel` VALUES (1,'Nikunjo','<p>tanishaaa</p>','hostel_gallery/nikunjo.jpg','Savar','01797024317','afrintanisha184@gmail.com','Live',1,0,'gdrdndcxjy','rf','2024-09-16 07:02:38.696802',1),(3,'Maloncho','','hostel_gallery/maloncho.jpg','savar','0178569425','test2@gmail.com','Live',1,0,'bikrewdfgd','maloncho','2024-09-21 17:23:04.426316',1);
/*!40000 ALTER TABLE `hostel_hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_hostelfaqs`
--

DROP TABLE IF EXISTS `hostel_hostelfaqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_hostelfaqs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `hostel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hostel_hostelfaqs_hostel_id_83d71a44_fk_hostel_hostel_id` (`hostel_id`),
  CONSTRAINT `hostel_hostelfaqs_hostel_id_83d71a44_fk_hostel_hostel_id` FOREIGN KEY (`hostel_id`) REFERENCES `hostel_hostel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_hostelfaqs`
--

LOCK TABLES `hostel_hostelfaqs` WRITE;
/*!40000 ALTER TABLE `hostel_hostelfaqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostel_hostelfaqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_hostelfeature`
--

DROP TABLE IF EXISTS `hostel_hostelfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_hostelfeature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `icon_type` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `hostel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hostel_hostelfeature_hostel_id_189ab68e_fk_hostel_hostel_id` (`hostel_id`),
  CONSTRAINT `hostel_hostelfeature_hostel_id_189ab68e_fk_hostel_hostel_id` FOREIGN KEY (`hostel_id`) REFERENCES `hostel_hostel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_hostelfeature`
--

LOCK TABLES `hostel_hostelfeature` WRITE;
/*!40000 ALTER TABLE `hostel_hostelfeature` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostel_hostelfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_hostelgallery`
--

DROP TABLE IF EXISTS `hostel_hostelgallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_hostelgallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `hgid` varchar(20) NOT NULL,
  `hostel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hgid` (`hgid`),
  KEY `hostel_hostelgallery_hostel_id_d50f2b86_fk_hostel_hostel_id` (`hostel_id`),
  CONSTRAINT `hostel_hostelgallery_hostel_id_d50f2b86_fk_hostel_hostel_id` FOREIGN KEY (`hostel_id`) REFERENCES `hostel_hostel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_hostelgallery`
--

LOCK TABLES `hostel_hostelgallery` WRITE;
/*!40000 ALTER TABLE `hostel_hostelgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostel_hostelgallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_room`
--

DROP TABLE IF EXISTS `hostel_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_number` varchar(1000) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `rtid` varchar(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `hostel_id` bigint NOT NULL,
  `room_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rtid` (`rtid`),
  KEY `hostel_room_hostel_id_eb7bac2d_fk_hostel_hostel_id` (`hostel_id`),
  KEY `hostel_room_room_type_id_ba6dae69_fk_hostel_roomtype_id` (`room_type_id`),
  CONSTRAINT `hostel_room_hostel_id_eb7bac2d_fk_hostel_hostel_id` FOREIGN KEY (`hostel_id`) REFERENCES `hostel_hostel` (`id`),
  CONSTRAINT `hostel_room_room_type_id_ba6dae69_fk_hostel_roomtype_id` FOREIGN KEY (`room_type_id`) REFERENCES `hostel_roomtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_room`
--

LOCK TABLES `hostel_room` WRITE;
/*!40000 ALTER TABLE `hostel_room` DISABLE KEYS */;
INSERT INTO `hostel_room` VALUES (1,'1',1,'fkvvkmpjwn','2024-09-19 05:47:21.258093',1,1),(2,'2',1,'jojtdtvevi','2024-09-19 05:49:26.101096',1,1),(3,'3',1,'gpcdtdjolq','2024-09-19 05:49:36.577358',1,1),(4,'1',1,'bsfvgyaxwy','2024-09-19 11:24:27.982323',1,2),(5,'2',1,'bvattrofyl','2024-09-19 11:24:35.627834',1,2),(6,'3',1,'bkthbvldrr','2024-09-19 11:24:45.911710',1,2),(7,'4',1,'bmbrmnhoyp','2024-09-19 11:26:34.514611',1,2),(8,'101',1,'takhwiyueq','2024-09-22 10:24:49.951916',3,1),(9,'102',1,'bjvwwqfaln','2024-09-22 10:25:05.582073',3,1),(10,'103',1,'bhssmyvyft','2024-09-22 10:25:17.621309',3,1),(11,'201',1,'jrspdjpela','2024-09-22 10:25:46.775723',3,2),(12,'102',1,'ehqxbqpuds','2024-09-22 10:26:22.562838',3,2),(13,'203',1,'bsqbpsvpcy','2024-09-22 10:26:38.387936',3,2),(14,'301',1,'caeutwwrvb','2024-09-22 10:27:19.020047',3,1),(15,'302',1,'bmkohueewg','2024-09-22 10:27:33.012092',3,1),(16,'303',1,'btshoplapb','2024-09-22 10:27:43.247486',3,1),(17,'304',1,'catlndqyps','2024-09-22 10:27:55.371048',3,1),(18,'101',1,'buejsklcwx','2024-09-22 14:55:20.616931',1,1),(19,'1',1,'icrpgypkpp','2024-09-22 15:32:39.346312',1,1),(21,'601',1,'bkujfclhah','2024-09-22 16:16:53.078186',1,4),(22,'501',1,'biusdblwdf','2024-09-22 16:23:22.156257',1,3),(23,'502',1,'bdohprckpd','2024-09-22 16:36:03.156057',1,3),(24,'503',1,'gilmmxjnrs','2024-09-22 16:36:21.193110',1,3),(25,'602',1,'bnfmwtxaxm','2024-09-22 16:36:47.621573',1,4),(26,'603',1,'beyxjustpi','2024-09-22 16:36:57.686954',1,4),(27,'105',1,'baawrthtlr','2024-09-23 02:04:44.431462',3,1),(28,'106',1,'otmdyhltwy','2024-09-23 02:05:09.079558',1,1),(29,'204',1,'bnnyttaqby','2024-09-23 02:05:49.881893',3,2);
/*!40000 ALTER TABLE `hostel_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_roomtype`
--

DROP TABLE IF EXISTS `hostel_roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_roomtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `room_capacity` int unsigned NOT NULL,
  `rtid` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `hostel_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rtid` (`rtid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `hostel_roomtype_hostel_id_d9479d29_fk_hostel_hostel_id` (`hostel_id`),
  CONSTRAINT `hostel_roomtype_hostel_id_d9479d29_fk_hostel_hostel_id` FOREIGN KEY (`hostel_id`) REFERENCES `hostel_hostel` (`id`),
  CONSTRAINT `hostel_roomtype_chk_1` CHECK ((`room_capacity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_roomtype`
--

LOCK TABLES `hostel_roomtype` WRITE;
/*!40000 ALTER TABLE `hostel_roomtype` DISABLE KEYS */;
INSERT INTO `hostel_roomtype` VALUES (1,'premium',250.00,1,'bcdyuqwhfn','premium','2024-09-19 05:46:33.681077',3),(2,'Normal',200.00,1,'kgkklstwkh','Normal','2024-09-19 11:24:10.084687',3),(3,'Normal',200.00,1,'ymnqvmdmxb','p','2024-09-22 14:45:06.989151',1),(4,'premium',250.00,1,'bbytxjnalo','np','2024-09-22 16:16:44.805260',1);
/*!40000 ALTER TABLE `hostel_roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_staffonduty`
--

DROP TABLE IF EXISTS `hostel_staffonduty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_staffonduty` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `staff_id` varchar(100) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `booking_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hostel_staffonduty_booking_id_cdeb0e72_fk_hostel_booking_id` (`booking_id`),
  CONSTRAINT `hostel_staffonduty_booking_id_cdeb0e72_fk_hostel_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `hostel_booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_staffonduty`
--

LOCK TABLES `hostel_staffonduty` WRITE;
/*!40000 ALTER TABLE `hostel_staffonduty` DISABLE KEYS */;
/*!40000 ALTER TABLE `hostel_staffonduty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_tag`
--

DROP TABLE IF EXISTS `taggit_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_tag`
--

LOCK TABLES `taggit_tag` WRITE;
/*!40000 ALTER TABLE `taggit_tag` DISABLE KEYS */;
INSERT INTO `taggit_tag` VALUES (1,'tarc','tarc');
/*!40000 ALTER TABLE `taggit_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggit_taggeditem`
--

DROP TABLE IF EXISTS `taggit_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggit_taggeditem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggit_taggeditem`
--

LOCK TABLES `taggit_taggeditem` WRITE;
/*!40000 ALTER TABLE `taggit_taggeditem` DISABLE KEYS */;
INSERT INTO `taggit_taggeditem` VALUES (1,3,11,1);
/*!40000 ALTER TABLE `taggit_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauths_profile`
--

DROP TABLE IF EXISTS `userauths_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauths_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pid` varchar(25) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `full_name` varchar(500) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `identity_type` varchar(300) DEFAULT NULL,
  `identity_image` varchar(100) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `wallet` decimal(12,2) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `userauths_profile_user_id_bdea9f7e_fk_userauths_user_id` FOREIGN KEY (`user_id`) REFERENCES `userauths_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauths_profile`
--

LOCK TABLES `userauths_profile` WRITE;
/*!40000 ALTER TABLE `userauths_profile` DISABLE KEYS */;
INSERT INTO `userauths_profile` VALUES (1,'221yljj','default.jpg',NULL,NULL,'',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-13 07:05:02.163751',1),(2,'agyse21','default.jpg',NULL,NULL,'',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-13 10:54:52.481678',2),(3,'yjma2xm','default.jpg',NULL,NULL,'',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-13 11:16:43.456415',3),(4,'3knwrjp','default.jpg','Ratul Hoque','0171723567','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-14 06:24:41.532610',4),(5,'2tgebxp','default.jpg',NULL,NULL,'',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-14 09:21:29.436389',5),(6,'3sweifa','default.jpg',NULL,NULL,'',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-15 05:56:01.929789',6),(7,'acksadd','default.jpg','Test2','0171723578','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-15 07:10:07.848733',7),(8,'3jw2nbf','default.jpg','john doe','0171723578','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-15 07:47:15.070481',8),(9,'kaywkqy','default.jpg','mina','0171723578','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-15 07:50:40.467497',9),(10,'b3puwlx','default.jpg','mina fr','0171723578','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-15 07:57:07.040826',10),(11,'2gpnj3d','default.jpg','shahely','017415695','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-18 16:39:29.759061',11),(12,'csz1cuz','default.jpg','Database','01797024317','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-23 05:05:22.216318',12),(13,'z1bpeye','default.jpg','xyz','01717235222','',NULL,NULL,NULL,'id.jpg',NULL,0.00,0,'2024-09-23 06:26:44.123564',13);
/*!40000 ALTER TABLE `userauths_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauths_user`
--

DROP TABLE IF EXISTS `userauths_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauths_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `full_name` varchar(500) DEFAULT NULL,
  `username` varchar(500) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `otp` varchar(100) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauths_user`
--

LOCK TABLES `userauths_user` WRITE;
/*!40000 ALTER TABLE `userauths_user` DISABLE KEYS */;
INSERT INTO `userauths_user` VALUES (1,'pbkdf2_sha256$600000$S8qZZj4guHKx36CWkULSMc$dofDy6mQPeYzDwn65KF8zRzyCXZ8g5kIUkIPTpKtFbk=','2024-09-23 05:42:50.103839',1,'','',1,1,'2024-09-26 07:05:01.000000',NULL,'tanisha',NULL,'Female','546','afrintanisha184@gmail.com'),(2,'pbkdf2_sha256$600000$uXFHJJCJPp9ekzt0Gb3xnE$rqiCdrBJWgw2X6xBYdzwgHJpNJVrA+Bacs3l4nfNH/s=',NULL,0,'','',0,1,'2024-09-13 10:54:52.154452','sansa stark','sansa',NULL,'',NULL,'sansa@gmail.com'),(3,'pbkdf2_sha256$600000$RcVn2c34CMfVY7I9J7QQrg$O+fzUDCC2wCr3XdSlCWpJj8WJh1OLChNAtfln6vX3YU=',NULL,0,'','',0,1,'2024-09-13 11:16:43.139219','Arya Stark','Arya','0171723568','',NULL,'arya@gmail.com'),(4,'pbkdf2_sha256$600000$Q9yahEC7dFnmuLf3FbeRhn$2jJ9geNSYyKHdRkNAHrNmAocgp2oUnTVYKGh4BM8tpA=','2024-09-14 06:24:41.860551',0,'','',0,1,'2024-09-14 06:24:41.194283','Ratul Hoque','Ratul','0171723567','',NULL,'ratul@gmail.com'),(5,'pbkdf2_sha256$600000$G11m5T5j1bEHK0NALuVpbK$r2YBGHIhA7CQBj2hVhQfGt/FyBkVA/Uu1tqSfG9p3kA=',NULL,0,'','',0,1,'2024-09-14 09:21:29.111887','karl Drog','karl','0171723565','',NULL,'k@gmail.com'),(6,'pbkdf2_sha256$600000$p82u02sisytGYVJT4CQH2o$JWRV8wlNrtuszhuJFgNCtLQQ30QYZux3h1Lo7kzLeY0=',NULL,0,'','',0,1,'2024-09-15 05:56:01.595599','test1','t','0171506986','',NULL,'test1@gmail.com'),(7,'pbkdf2_sha256$600000$l6D5OhvJNg32HFgrPpkkXi$9MqjVsGHlULxbt9zfYOrroRoW2E1ZqVMU3z7qWiTKnU=','2024-09-15 07:10:08.178639',0,'','',0,1,'2024-09-15 07:10:07.514969','Test2','testy','0171723578','',NULL,'test2@gmail.com'),(8,'pbkdf2_sha256$600000$u5ZN4AGr8i9IjWPyyLtEOQ$S5tk2cy+bEyINNOBF1pPc9tA4o3CufYYmX19LLAEWNg=','2024-09-15 07:47:15.403753',0,'','',0,1,'2024-09-15 07:47:14.738229','john doe','john','0171723578','',NULL,'john@gmail.com'),(9,'pbkdf2_sha256$600000$yQKNoPxP436k02PXJLAJ3e$hnPuzhH+7fW1bMOChGhXSLqo4iQvQfhzK6x0d2YbKvg=','2024-09-15 07:50:40.787715',0,'','',0,1,'2024-09-15 07:50:40.139347','mina','jmina','0171723578','',NULL,'mina@gmail.com'),(10,'pbkdf2_sha256$600000$blsRtZKgJGX4rgdo6mSZzi$bsOoZox2A6kUMqKAdhJRv1eHYg3Tdm15ODxeslkibzE=','2024-09-15 07:57:07.381222',0,'','',0,1,'2024-09-15 07:57:06.700179','mina fr','jamina','0171723578','',NULL,'jmina@gmail.com'),(11,'pbkdf2_sha256$600000$pa9qqsZJns4BfBmy8Cp2GV$MnJeAKne2WtUq1WfXFNvI1zy3h6tzJtGyEMVxHgS95k=','2024-09-18 17:01:34.919954',0,'','',0,1,'2024-09-18 16:39:29.409320','shahely','sha','017415695','',NULL,'shahely@gmail.com'),(12,'pbkdf2_sha256$600000$uJtdmoMLyRm2k4O1xN5Voj$6FwYaVG7hODDvvL+EcBB9jVvUkY11pj2ZhsAwGS/iR0=','2024-09-23 05:51:42.286540',0,'','',0,1,'2024-09-23 05:05:21.877555','Database','Data','01797024317','',NULL,'data@gmail.com'),(13,'pbkdf2_sha256$600000$3klbd4ZKMGaSqYH6wqysoh$6gPLi9WuEZAR+5ZWkb2TZ2WC6w5MFPRi7iH7r07o0Mw=','2024-09-23 06:26:44.504042',0,'','',0,1,'2024-09-23 06:26:43.751567','xyz','x','01717235222','',NULL,'x@gmail.com');
/*!40000 ALTER TABLE `userauths_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauths_user_groups`
--

DROP TABLE IF EXISTS `userauths_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauths_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userauths_user_groups_user_id_group_id_e032b670_uniq` (`user_id`,`group_id`),
  KEY `userauths_user_groups_group_id_2bd3d457_fk_auth_group_id` (`group_id`),
  CONSTRAINT `userauths_user_groups_group_id_2bd3d457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `userauths_user_groups_user_id_70ad3415_fk_userauths_user_id` FOREIGN KEY (`user_id`) REFERENCES `userauths_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauths_user_groups`
--

LOCK TABLES `userauths_user_groups` WRITE;
/*!40000 ALTER TABLE `userauths_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userauths_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userauths_user_user_permissions`
--

DROP TABLE IF EXISTS `userauths_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userauths_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userauths_user_user_perm_user_id_permission_id_5423ee7a_uniq` (`user_id`,`permission_id`),
  KEY `userauths_user_user__permission_id_0e980ebe_fk_auth_perm` (`permission_id`),
  CONSTRAINT `userauths_user_user__permission_id_0e980ebe_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `userauths_user_user__user_id_7dc84ca3_fk_userauths` FOREIGN KEY (`user_id`) REFERENCES `userauths_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userauths_user_user_permissions`
--

LOCK TABLES `userauths_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `userauths_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userauths_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-16 13:10:35
