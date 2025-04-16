-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: film_database
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_photo` varchar(100) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'profile_photos/chris-ngang_1.jpg',1);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_actor`
--

DROP TABLE IF EXISTS `actor_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor_actor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `biography` longtext NOT NULL,
  `alternate_name` varchar(100) NOT NULL,
  `introduction` longtext NOT NULL,
  `gender` varchar(10) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_actor`
--

LOCK TABLES `actor_actor` WRITE;
/*!40000 ALTER TABLE `actor_actor` DISABLE KEYS */;
INSERT INTO `actor_actor` VALUES (2,'Chris Evans','1981-06-13','','Chris Evans','Khác với Chris Hemsworth vẫn đang loay hoay trong hình tượng vị thần sấm sét, đa số người hâm mộ vẫn nhìn nhận rõ ràng, Chris Evans và Captain America là hai con người hoàn toàn khác nhau.','Male','actor_images/chris-ngang_1_89Xb2Zr.jpg'),(3,'Margot Robbie','1990-07-02','','Margot Robbie','Dĩ nhiên, có nhan sắc chẳng bao giờ là đủ để đảm bảo cho chiếc vé thành công tại Hollywood, Margot còn phải cố gắng nhiều. Nhưng ta biết, hiện nay nàng xứng đáng được coi là minh tinh hạng A!','Female','actor_images/gallery-1436740108-elle-aug-15-margot-robbie-02.jpg'),(4,'Charlize Theron','1975-08-07','','Charlize Theron','Bắt đầu từ vai diễn không có lời thoại, chỉ xuất hiện 3 giây trong một bộ phim hạng B, Charlize Theron nay đã trở thành nữ thần của Hollywood.','Female','actor_images/theron-charlize-bannner_PAXBo6Q.jpg'),(5,'Hugh Jackman','1968-10-12','','Hugh Jackman','Ngoài gương mặt đẹp trai, thân hình rắn chắc và số tài lẻ không đếm nổi, Hugh Jackman còn có một niềm tự hào mà khó minh tinh Hollywood nào không ganh tị.','Male','actor_images/hu-ngang.jpg'),(6,'Robert Downey Jr','1965-04-04','','Robert Downey Jr','Thành công lớn ở giai đoạn đầu sự nghiệp nhưng nghiện ngập từ bé, có phim kiếm cả tỉ đôla lại từng lang thang không xu dính túi, 2 lần đề cử Oscar đi kèm với những lần vào tù ra khám… Nếu phải chọn cuộc đời một ngôi sao để viết kịch bản phim, thì “cuộc đời của Robert Downey Jr” sẽ là kịch bản nằm ở tốp kịch tính và ăn khách nhất.','Male','actor_images/robert-ngang.jpg'),(7,'Dwayne Johnson','1972-05-02','','Dwayne Johnson','Có nhiều biệt danh như The People\'s Champion, The Brahma Bull, The Great One… nhưng người ta thường nhớ đến Dwayne Johnson với cái tên The Rock.','Male','actor_images/3_204.jpg');
/*!40000 ALTER TABLE `actor_actor` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add genre',7,'add_genre'),(26,'Can change genre',7,'change_genre'),(27,'Can delete genre',7,'delete_genre'),(28,'Can view genre',7,'view_genre'),(29,'Can add movie',8,'add_movie'),(30,'Can change movie',8,'change_movie'),(31,'Can delete movie',8,'delete_movie'),(32,'Can view movie',8,'view_movie'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add like',10,'add_like'),(38,'Can change like',10,'change_like'),(39,'Can delete like',10,'delete_like'),(40,'Can view like',10,'view_like'),(41,'Can add rating',11,'add_rating'),(42,'Can change rating',11,'change_rating'),(43,'Can delete rating',11,'delete_rating'),(44,'Can view rating',11,'view_rating'),(45,'Can add user list',12,'add_userlist'),(46,'Can change user list',12,'change_userlist'),(47,'Can delete user list',12,'delete_userlist'),(48,'Can view user list',12,'view_userlist'),(49,'Can add profile',13,'add_profile'),(50,'Can change profile',13,'change_profile'),(51,'Can delete profile',13,'delete_profile'),(52,'Can view profile',13,'view_profile'),(53,'Can add movie',14,'add_movie'),(54,'Can change movie',14,'change_movie'),(55,'Can delete movie',14,'delete_movie'),(56,'Can view movie',14,'view_movie'),(57,'Can add actor',15,'add_actor'),(58,'Can change actor',15,'change_actor'),(59,'Can delete actor',15,'delete_actor'),(60,'Can view actor',15,'view_actor'),(61,'Can add actor',16,'add_actor'),(62,'Can change actor',16,'change_actor'),(63,'Can delete actor',16,'delete_actor'),(64,'Can view actor',16,'view_actor');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$DbWacX7bvMh5IT2JKjkXs0$fEOysm/S1fgSuinLPHEURnvz3rqO7UMsgidnY2om8zY=','2025-04-15 09:21:13.102819',1,'admin','Thân','Tâm','thantam311@gmail.com',1,1,'2025-04-08 15:07:16.099000'),(2,'pbkdf2_sha256$1000000$GrCV19WI91rAdbvUENz9W7$R2k7fw15yF19VopZNQe2Vm2I+C4fS8pCPlYXVqjl9Sk=','2025-04-10 11:57:26.429577',0,'tam','','','n22dcat047@student.ptithcm.edu.vn',0,1,'2025-04-10 11:08:10.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-08 15:08:48.922000','1','Male',1,'[{\"added\": {}}]',7,1),(2,'2025-04-08 15:11:27.781000','1','Naruto',1,'[{\"added\": {}}]',8,1),(3,'2025-04-08 15:12:21.215000','1','Naruto',2,'[{\"changed\": {\"fields\": [\"Video link\"]}}]',8,1),(4,'2025-04-08 15:19:56.840000','2','Female',1,'[{\"added\": {}}]',7,1),(5,'2025-04-08 15:20:26.702000','2','roAkgfsdkfnds',1,'[{\"added\": {}}]',8,1),(6,'2025-04-08 15:45:19.997000','1','Naruto',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(7,'2025-04-08 15:45:46.895000','1','Naruto',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(8,'2025-04-08 15:54:03.476000','2','roAkgfsdkfnds',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(9,'2025-04-09 01:24:49.152678','3','Hành động',1,'[{\"added\": {}}]',7,1),(10,'2025-04-09 01:24:58.114607','4','Drama',1,'[{\"added\": {}}]',7,1),(11,'2025-04-09 01:25:05.467163','5','Kiếm hiệp',1,'[{\"added\": {}}]',7,1),(12,'2025-04-09 01:28:15.697420','2','roAkgfsdkfnds',3,'',8,1),(13,'2025-04-09 01:30:12.124951','6','Anime',1,'[{\"added\": {}}]',7,1),(14,'2025-04-09 01:30:16.406263','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Thumbnail\", \"Video file\", \"Release date\", \"Genres\"]}}]',8,1),(15,'2025-04-09 02:00:13.242578','3','Chiến thần',1,'[{\"added\": {}}]',8,1),(16,'2025-04-09 02:12:37.676995','7','Phim tình cảm',1,'[{\"added\": {}}]',7,1),(17,'2025-04-09 02:12:40.930506','4','Quả quýt',1,'[{\"added\": {}}]',8,1),(18,'2025-04-09 02:13:08.165585','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(19,'2025-04-09 02:13:36.078812','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(20,'2025-04-09 02:14:37.644833','1','Male',3,'',7,1),(21,'2025-04-09 02:14:40.333213','2','Female',3,'',7,1),(22,'2025-04-09 02:14:45.993402','7','Tình cảm',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(23,'2025-04-09 03:23:39.208112','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(24,'2025-04-09 03:23:58.711215','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(25,'2025-04-09 03:24:22.998332','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(26,'2025-04-09 03:24:45.759805','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(27,'2025-04-09 03:25:36.694442','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(28,'2025-04-09 03:25:51.671952','3','Chiến thần',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(29,'2025-04-09 03:29:28.567070','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Trailer file\"]}}]',8,1),(30,'2025-04-09 04:39:36.747080','5','Phim api',1,'[{\"added\": {}}]',8,1),(31,'2025-04-09 04:44:47.731358','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Streaming link\", \"Trailer link\"]}}]',8,1),(32,'2025-04-09 04:51:06.677480','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Video file\", \"Streaming link\"]}}]',8,1),(33,'2025-04-09 04:52:25.933041','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(34,'2025-04-09 04:52:42.733622','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(35,'2025-04-09 04:53:42.708727','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Trailer file\"]}}]',8,1),(36,'2025-04-09 04:53:57.814469','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Trailer link\"]}}]',8,1),(37,'2025-04-09 04:54:14.250883','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Trailer file\"]}}]',8,1),(38,'2025-04-09 05:51:47.323424','8','Kinh dị',1,'[{\"added\": {}}]',7,1),(39,'2025-04-09 05:52:35.219473','6','404 - Chạy Ngay Đi',1,'[{\"added\": {}}]',8,1),(40,'2025-04-09 05:58:17.796330','6','404 - Chạy Ngay Đi',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,1),(41,'2025-04-09 06:00:04.954614','6','404 - Chạy Ngay Đi',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,1),(42,'2025-04-09 06:02:27.051268','9','Chính kịch',1,'[{\"added\": {}}]',7,1),(43,'2025-04-09 06:04:19.111680','7','The Clubhouse: Một Năm Cùng Đội Red Sox Tập 1',1,'[{\"added\": {}}]',8,1),(44,'2025-04-10 11:08:11.188722','2','tam',1,'[{\"added\": {}}]',4,1),(45,'2025-04-10 11:08:15.983695','2','tam',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(46,'2025-04-13 06:22:47.855167','1','Thân Trung Tâm',1,'[{\"added\": {}}]',15,1),(47,'2025-04-13 07:00:20.233721','1','Than Trung Tam',1,'[{\"added\": {}}]',16,1),(48,'2025-04-13 07:08:48.622647','1','Than Trung Tam',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(49,'2025-04-13 08:09:18.184549','1','Than Trung Tam',2,'[{\"changed\": {\"fields\": [\"Gi\\u1edbi t\\u00ednh\"]}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (1)\"}}]',16,1),(50,'2025-04-13 10:13:18.298292','8','Phim hay',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (2)\"}}]',8,1),(51,'2025-04-13 10:13:42.567859','8','Phim hay',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(52,'2025-04-15 13:14:10.887465','2','Chris Evans',1,'[{\"added\": {}}]',16,1),(53,'2025-04-15 13:16:33.503255','3','Margot Robbie',1,'[{\"added\": {}}]',16,1),(54,'2025-04-15 13:16:47.056762','1','Than Trung Tam',3,'',16,1),(55,'2025-04-15 13:17:45.351651','4','Charlize Theron',1,'[{\"added\": {}}]',16,1),(56,'2025-04-15 13:18:43.427707','2','Chris Evans',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(57,'2025-04-15 13:18:58.256335','4','Charlize Theron',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(58,'2025-04-15 13:19:15.732443','2','Chris Evans',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(59,'2025-04-15 13:19:26.251049','4','Charlize Theron',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(60,'2025-04-15 13:21:01.023816','4','Charlize Theron',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(61,'2025-04-15 13:22:30.208591','5','Hugh Jackman',1,'[{\"added\": {}}]',16,1),(62,'2025-04-15 13:24:07.433653','6','Robert Downey Jr',1,'[{\"added\": {}}]',16,1),(63,'2025-04-15 13:25:23.591512','7','Dwayne Johnson',1,'[{\"added\": {}}]',16,1),(64,'2025-04-15 13:34:21.154998','10','Lãng mạn',1,'[{\"added\": {}}]',7,1),(65,'2025-04-15 13:36:55.365449','9','Hậu Duệ Mặt Trời',1,'[{\"added\": {}}]',8,1),(66,'2025-04-15 13:41:13.623475','9','Hậu Duệ Mặt Trời',2,'[]',8,1),(67,'2025-04-15 13:45:42.609410','8','Phim hay',3,'',8,1),(68,'2025-04-15 13:45:42.609436','7','The Clubhouse: Một Năm Cùng Đội Red Sox Tập 1',3,'',8,1),(69,'2025-04-15 13:45:42.609445','6','404 - Chạy Ngay Đi',3,'',8,1),(70,'2025-04-15 13:45:42.609454','5','Phim api',3,'',8,1),(71,'2025-04-15 13:45:42.609462','4','Quả quýt',3,'',8,1),(72,'2025-04-15 13:45:42.609469','3','Chiến thần',3,'',8,1),(73,'2025-04-15 13:45:42.609477','1','Naruto tập 1',3,'',8,1),(74,'2025-04-15 13:49:28.144245','10','Bữa Tiệc Đẫm Máu',1,'[{\"added\": {}}]',8,1),(75,'2025-04-15 13:54:50.160441','9','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(76,'2025-04-15 13:57:17.095868','9','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(77,'2025-04-15 14:00:41.112838','9','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(78,'2025-04-15 14:02:50.577554','10','Bữa Tiệc Đẫm Máu',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(79,'2025-04-15 14:03:44.836562','11','Tâm lý',1,'[{\"added\": {}}]',7,1),(80,'2025-04-15 14:05:29.145230','11','Ăn, Chạy, Yêu',1,'[{\"added\": {}}]',8,1),(81,'2025-04-15 14:12:16.542103','12','Tee Yod: Quỷ Ăn Tạng',1,'[{\"added\": {}}]',8,1),(82,'2025-04-15 14:19:16.066699','13','The son',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (3)\"}}]',8,1),(83,'2025-04-15 14:22:09.013815','12','Hài hước',1,'[{\"added\": {}}]',7,1),(84,'2025-04-15 14:22:17.555977','13','Viễn tưởng',1,'[{\"added\": {}}]',7,1),(85,'2025-04-15 14:23:34.361820','14','Mật Mã Đỏ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (4)\"}}]',8,1),(86,'2025-04-15 14:25:29.216110','14','Phiêu lưu',1,'[{\"added\": {}}]',7,1),(87,'2025-04-15 14:27:09.034146','15','Suicide Squad: Điệp Vụ Cảm Tử',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (5)\"}}]',8,1),(88,'2025-04-15 14:27:41.185413','15','Suicide Squad: Điệp Vụ Cảm Tử',2,'[{\"changed\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (5)\", \"fields\": [\"Actor\"]}}]',8,1),(89,'2025-04-15 14:39:03.635213','16','One Piece Tập 1125',1,'[{\"added\": {}}]',8,1),(90,'2025-04-15 14:44:44.664192','10','Bữa Tiệc Đẫm Máu',2,'[{\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (6)\"}}]',8,1),(91,'2025-04-15 14:45:38.841208','14','Mật Mã Đỏ',2,'[{\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (7)\"}}]',8,1),(92,'2025-04-15 14:50:18.782628','15','Hoạt hình',1,'[{\"added\": {}}]',7,1),(93,'2025-04-15 14:53:07.566063','17','Chiến binh lạc hồng',1,'[{\"added\": {}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'accounts','movie'),(13,'accounts','profile'),(16,'actor','actor'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'movies','actor'),(7,'movies','genre'),(8,'movies','movie'),(6,'sessions','session'),(9,'user_interactions','comment'),(10,'user_interactions','like'),(11,'user_interactions','rating'),(12,'user_interactions','userlist');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-08 16:52:54.202828'),(2,'auth','0001_initial','2025-04-08 16:52:54.698523'),(3,'accounts','0001_initial','2025-04-08 16:52:54.770768'),(4,'accounts','0002_alter_profile_profile_photo','2025-04-08 16:52:54.776742'),(5,'admin','0001_initial','2025-04-08 16:52:54.883837'),(6,'admin','0002_logentry_remove_auto_add','2025-04-08 16:52:54.890044'),(7,'admin','0003_logentry_add_action_flag_choices','2025-04-08 16:52:54.896444'),(8,'contenttypes','0002_remove_content_type_name','2025-04-08 16:52:54.977733'),(9,'auth','0002_alter_permission_name_max_length','2025-04-08 16:52:55.026062'),(10,'auth','0003_alter_user_email_max_length','2025-04-08 16:52:55.043576'),(11,'auth','0004_alter_user_username_opts','2025-04-08 16:52:55.050974'),(12,'auth','0005_alter_user_last_login_null','2025-04-08 16:52:55.099479'),(13,'auth','0006_require_contenttypes_0002','2025-04-08 16:52:55.101506'),(14,'auth','0007_alter_validators_add_error_messages','2025-04-08 16:52:55.106842'),(15,'auth','0008_alter_user_username_max_length','2025-04-08 16:52:55.158957'),(16,'auth','0009_alter_user_last_name_max_length','2025-04-08 16:52:55.214168'),(17,'auth','0010_alter_group_name_max_length','2025-04-08 16:52:55.228824'),(18,'auth','0011_update_proxy_permissions','2025-04-08 16:52:55.235742'),(19,'auth','0012_alter_user_first_name_max_length','2025-04-08 16:52:55.286357'),(20,'movies','0001_initial','2025-04-08 16:52:55.434631'),(21,'movies','0002_movie_created_at_movie_likes_movie_views','2025-04-08 16:52:55.533147'),(22,'movies','0003_remove_movie_average_rating_remove_movie_likes_and_more','2025-04-08 16:52:55.619701'),(23,'movies','0004_movie_video_file','2025-04-08 16:52:55.649598'),(24,'sessions','0001_initial','2025-04-08 16:52:55.676217'),(25,'user_interactions','0001_initial','2025-04-08 16:52:56.009891'),(26,'user_interactions','0002_userlist','2025-04-08 16:52:56.166120'),(27,'user_interactions','0003_alter_userlist_user','2025-04-08 16:52:56.256084'),(28,'user_interactions','0004_alter_userlist_user','2025-04-08 16:52:56.342479'),(29,'movies','0005_remove_movie_trailer_movie_trailer_file_and_more','2025-04-09 03:17:49.416139'),(30,'movies','0006_movie_streaming_link_alter_movie_video_link','2025-04-09 04:38:50.009210'),(31,'movies','0007_movie_youtube_embed_url','2025-04-09 05:57:39.861722'),(32,'accounts','0003_movie','2025-04-10 12:57:10.851570'),(33,'movies','0008_actor','2025-04-13 06:19:06.087589'),(34,'movies','0009_actor_alternate_name_actor_gender_actor_introduction','2025-04-13 06:32:26.854161'),(35,'actor','0001_initial','2025-04-13 06:50:06.151423'),(36,'accounts','0004_delete_movie','2025-04-13 07:50:45.845924'),(37,'movies','0010_delete_actor_movie_actors','2025-04-13 07:50:46.030626'),(38,'actor','0002_alter_actor_options_alter_actor_alternate_name_and_more','2025-04-13 07:59:50.173187'),(39,'user_interactions','0005_userlist_actors_alter_userlist_movies','2025-04-13 08:10:26.750620'),(40,'movies','0011_remove_movie_views','2025-04-15 10:08:26.485831'),(41,'movies','add_views_column','2025-04-15 12:49:16.200740');
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
INSERT INTO `django_session` VALUES ('3rcm9upopkq9zacuqxsofs4u8iegxh3d','.eJxVjMsOwiAQRf-FtSEMdBBcuu83NDxmpGogKe3K-O_apAvd3nPOfYkpbGuZtk7LNGdxESBOv1sM6UF1B_ke6q3J1Oq6zFHuijxol2PL9Lwe7t9BCb18a58sWDgnCug1aiSGiEDaYwDFNlrDCgdGw8TGZQbrko4Ohqw8GMji_QHTwzdx:1u2M1O:bhDz6WfYtwC2m_8fmu5dsbY9Jjdl3G0Ut36A14Pcetg','2025-04-23 03:22:38.482949'),('76uxu9uqju19a5jodiq74idyhew0ujc4','.eJxVjMsOwiAQRf-FtSEMdBBcuu83NDxmpGogKe3K-O_apAvd3nPOfYkpbGuZtk7LNGdxESBOv1sM6UF1B_ke6q3J1Oq6zFHuijxol2PL9Lwe7t9BCb18a58sWDgnCug1aiSGiEDaYwDFNlrDCgdGw8TGZQbrko4Ohqw8GMji_QHTwzdx:1u2KS9:fVng4Q1zYaqT-toZwBzTEsjwt4KfdDAlO-awX97Wouo','2025-04-23 01:42:09.330541'),('88c26mpeoj249gpckzbb8x22x6zzo173','.eJxVjEEOwiAQRe_C2hCgCFOX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIitDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl29tgA0ge_bgB8wGIJHShGfPxkRrFQBly5mcM5bRxuSISQ8qIepxHMT7A-0VOFY:1u3uEE:-y0NXjC01BD2Qb2c_pxcrc_tQAO8dqpLpTjeu1fRF34','2025-04-27 10:06:18.822982'),('c7rft7ni4xpbsqfatpkrwlmdx7pyg6wj','.eJxVjDsOwjAQBe_iGln-woaSnjNE610vDiBbipMKcXeIlALaNzPvpUZclzKuPc_jxOqsnDr8bgnpkesG-I711jS1usxT0puid9r1tXF-Xnb376BgL99aANniEEMiH0UGoGN2AUCMCZLAM1hADBglo3WOrZDFEzEY5MjRq_cHAUM4vg:1u2qX8:hZfzYHrR8Ekjf0zRtsoT-DnPQCn5lDTG72FVgGXjrBQ','2025-04-24 11:57:26.433311'),('iy68i2knzkk7gtfrl8zfknzca6roa8si','.eJxVjEEOwiAQRe_C2hCgCFOX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIitDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl29tgA0ge_bgB8wGIJHShGfPxkRrFQBly5mcM5bRxuSISQ8qIepxHMT7A-0VOFY:1u3uEE:-y0NXjC01BD2Qb2c_pxcrc_tQAO8dqpLpTjeu1fRF34','2025-04-27 10:06:18.825283'),('lj03j1u8zd4vh1pc4rirwx9kpmzxny5v','.eJxVjEEOwiAQRe_C2hCgCFOX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIitDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl29tgA0ge_bgB8wGIJHShGfPxkRrFQBly5mcM5bRxuSISQ8qIepxHMT7A-0VOFY:1u3Odb:JtJwcV_UsiNLBloPoL5ZMcmpoiywyf3n6rK6LfM79F4','2025-04-26 00:22:23.479170');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_genre`
--

DROP TABLE IF EXISTS `movies_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_genre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genre`
--

LOCK TABLES `movies_genre` WRITE;
/*!40000 ALTER TABLE `movies_genre` DISABLE KEYS */;
INSERT INTO `movies_genre` VALUES (6,'Anime'),(9,'Chính kịch'),(4,'Drama'),(12,'Hài hước'),(3,'Hành động'),(15,'Hoạt hình'),(5,'Kiếm hiệp'),(8,'Kinh dị'),(10,'Lãng mạn'),(14,'Phiêu lưu'),(11,'Tâm lý'),(7,'Tình cảm'),(13,'Viễn tưởng');
/*!40000 ALTER TABLE `movies_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie`
--

DROP TABLE IF EXISTS `movies_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `release_date` date NOT NULL,
  `video_link` varchar(200) DEFAULT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `video_file` varchar(100) DEFAULT NULL,
  `trailer_file` varchar(100) DEFAULT NULL,
  `trailer_link` varchar(200) DEFAULT NULL,
  `streaming_link` varchar(200) DEFAULT NULL,
  `youtube_embed_url` varchar(200) DEFAULT NULL,
  `views` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie`
--

LOCK TABLES `movies_movie` WRITE;
/*!40000 ALTER TABLE `movies_movie` DISABLE KEYS */;
INSERT INTO `movies_movie` VALUES (9,'Hậu Duệ Mặt Trời','Hậu duệ Mặt Trời là một bộ phim truyền hình Hàn Quốc năm 2016 có sự tham gia của Song Joong-ki, Song Hye-kyo, Jin Goo và Kim Ji-won. Phim được phát sóng trên kênh KBS2 từ ngày 24 tháng 2 đến ngày 14 tháng 4 năm 2016 cho 16 tập.','2016-04-22',NULL,'movie_thumbnails/hau_due_mat_troi_VJVC.jpg','2025-04-15 13:36:55.361716','','',NULL,'https://s3.phim1280.tv/20240814/gutX40EI/index.m3u8','https://www.youtube.com/embed/3vEEWW3Ac8I?si=bJyicc3NixndfNyN',0),(10,'Bữa Tiệc Đẫm Máu','Món quà tốt nghiệp của Audra là ngôi nhà mơ ước của cô, nhưng nó nhanh chóng trở thành cơn ác mộng sống khi một số vị khách không mời mà đến dự bữa tiệc trở về quê hương của cô, những người không mấy tinh tế về việc họ không chấp thuận chủ nhân mới của ngôi nhà.','2023-01-01',NULL,'movie_thumbnails/p24449636_v_h8_aa.jpg','2025-04-15 13:49:28.141123','','',NULL,'https://s4.phim1280.tv/20250411/C3xru2HH/index.m3u8','https://www.youtube.com/embed/NYSaLyCyQDo?si=kcL1bLrQXXnBSIpV',0),(11,'Ăn, Chạy, Yêu','Chàng trai Cam Dương siêu nổi trong trường đã trúng tiếng sét ái tình với Đinh Chi Đồng, cô gái luôn tất bật vội vã. Gánh nặng nợ nần khiến Đinh Chi Đồng không bao giờ dám lãng phí thời gian cho chuyện yêu đương, nhưng sự lạc quan và vui tươi của Cam Dương đã lay động cô. Đinh Chi Đồng nhận ra dù hoàn cảnh gia đình khác biệt nhưng họ lại cực kỳ ăn ý, và cô đã đồng ý hẹn hò với anh. Nhưng sự cách biệt kinh tế và hàng loạt vấn đề thực tế khi bước vào đời đã trở thành mâu thuẫn không thể lu mờ trong tình yêu ngọt ngào của hai người. Khi gia đình Cam Dương sa sút, anh che giấu sự thật và chia tay với Đinh Chi Đồng. Đinh Chi Đồng lầm tưởng mình bị ruồng bỏ, cô sốc nặng rồi lại bất ngờ gặp thêm biến cố, từ đó trở nên căm hận Cam Dương. Sáu năm sau, hai người gặp lại trong một vụ làm ăn, Đinh Chi Đồng được giao nhiệm vụ thuyết phục công ty của Cam Dương góp vốn đầu tư. Yên hận đan xen, hiểu lầm chồng chất, họ thật sự có thể vượt qua tất cả để đến với nhau ư?','2025-01-02',NULL,'movie_thumbnails/zjg6yiSpcxthKcoYfFdlPUdJZ7Y.webp','2025-04-15 14:05:29.142449','','',NULL,'https://s5.phim1280.tv/20250408/gYStXMzH/index.m3u8','https://www.youtube.com/embed/Tw4Gzzez7Fg?si=Sk-77uccM4zEZ-7a',0),(12,'Tee Yod: Quỷ Ăn Tạng','Khi linh hồn khát máu nọ nhập vào một cô gái trẻ ở ngôi làng hẻo lánh, anh trai cô đi đầu trong nỗ lực trục xuất linh hồn đó trước khi cô bị cái ác lấn át.','2023-01-01',NULL,'movie_thumbnails/phim-tee-yod-quy-an-tang-8_84xBuXk.jpeg','2025-04-15 14:12:16.538720','','',NULL,'https://s3.phim1280.tv/20240411/VjV5ECNY/index.m3u8','https://www.youtube.com/embed/xVVZvSybaEc?si=HECozJhdx7R11XXL',0),(13,'The son','Bộ phim xoay quanh Peter, người đang bận rộn với cuộc sống bên cạnh người vợ mới và đứa con mới sinh của họ. Tuy nhiên, mọi chuyện đảo lộn khi Kate xuất hiện và nhờ anh chăm sóc cho cậu con trai Nicholas đang tuổi vị thành niên của cả hai.','2022-01-21',NULL,'movie_thumbnails/2.jpg','2025-04-15 14:19:16.062360','','',NULL,'https://s2.phim1280.tv/20230923/tKRms9Ew/index.m3u8','https://www.youtube.com/embed/SJWRY4DzoAQ?si=BluLoqkvyGc9jzgv',0),(14,'Mật Mã Đỏ','Sau khi Ông già Noel bị bắt cóc, Trưởng An ninh Bắc Cực (Dwayne Johnson) phải hợp tác với thợ săn tiền thưởng khét tiếng nhất thế giới (Chris Evans) trong một nhiệm vụ kịch tính xuyên lục địa để giải cứu Giáng Sinh.','2024-06-06',NULL,'movie_thumbnails/phim-red-one-mat-ma-do-thumbnail.jpg','2025-04-15 14:23:34.357842','','',NULL,'https://s4.phim1280.tv/20241213/k8WwowG2/index.m3u8','https://www.youtube.com/embed/2T_mKyH17mY?si=AWY7t9ZCRMRQmcsN',0),(15,'Suicide Squad: Điệp Vụ Cảm Tử','Chính phủ gửi những siêu tội phạm nguy hiểm nhất trên thế giới - Bloodsport, Peacemaker, King Shark, Harley Quinn và những người khác - đến hòn đảo Corto Maltese xa xôi, đầy kẻ thù. Được trang bị vũ khí công nghệ cao, họ băng qua khu rừng rậm nguy hiểm trong một nhiệm vụ tìm kiếm và tiêu diệt, chỉ có Đại tá Rick Flag trên mặt đất để bắt họ hành xử.','2021-09-09',NULL,'movie_thumbnails/maxresdefault.jpg','2025-04-15 14:27:09.030941','','',NULL,'https://s3.phim1280.tv/20240802/6QTgaAAW/index.m3u8','https://www.youtube.com/embed/QTg5K0XDiaE?si=IOlZSimw_q4mPcOE',0),(16,'One Piece Tập 1125','Luffy Vs Kizaru - Zoro Vs Lucci','2025-04-10',NULL,'movie_thumbnails/hq720.jpg','2025-04-15 14:39:03.632779','videos/Lù_Rì_Viu_One_Piece_Tập_1125_-_1126_Luffy_Vs_Kizaru_-_Zoro_Vs_Lucci____Review_anime.mp4','',NULL,NULL,'https://www.youtube.com/embed/-uiPQrjFFq0?si=xMHvlyqIhoQvTAEc',0),(17,'Chiến binh lạc hồng','Là bộ phim siêu nhân đầu tiên của Việt Nam.','2025-04-04',NULL,'movie_thumbnails/chien-than-lac-hong-lich-chieu-va-noi-dung-250412120959.webp','2025-04-15 14:53:07.562967','videos/CHIẾN_THẦN_LẠC_HỒNG___SEASON_1___TẬP_2__SỰ_THẬT.mp4','',NULL,NULL,'https://www.youtube.com/embed/Hp39zKDHHgk?si=sVPZZPAhNZWJL3xk',0);
/*!40000 ALTER TABLE `movies_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_actors`
--

DROP TABLE IF EXISTS `movies_movie_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_movie_actors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `actor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_actors_movie_id_actor_id_73463e17_uniq` (`movie_id`,`actor_id`),
  KEY `movies_movie_actors_actor_id_44828aa1_fk_actor_actor_id` (`actor_id`),
  CONSTRAINT `movies_movie_actors_actor_id_44828aa1_fk_actor_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actor_actor` (`id`),
  CONSTRAINT `movies_movie_actors_movie_id_baed65f3_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_actors`
--

LOCK TABLES `movies_movie_actors` WRITE;
/*!40000 ALTER TABLE `movies_movie_actors` DISABLE KEYS */;
INSERT INTO `movies_movie_actors` VALUES (6,10,4),(3,13,5),(7,14,2),(4,14,7),(5,15,3);
/*!40000 ALTER TABLE `movies_movie_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_movie_genres`
--

DROP TABLE IF EXISTS `movies_movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_movie_genres` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `genre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_movie_genres_movie_id_genre_id_5ff3c723_uniq` (`movie_id`,`genre_id`),
  KEY `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` (`genre_id`),
  CONSTRAINT `movies_movie_genres_genre_id_c3609db2_fk_movies_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `movies_genre` (`id`),
  CONSTRAINT `movies_movie_genres_movie_id_ff5e55a1_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_genres`
--

LOCK TABLES `movies_movie_genres` WRITE;
/*!40000 ALTER TABLE `movies_movie_genres` DISABLE KEYS */;
INSERT INTO `movies_movie_genres` VALUES (10,9,9),(11,9,10),(12,10,8),(15,11,7),(13,11,9),(14,11,11),(16,12,8),(17,12,11),(18,13,9),(19,14,3),(20,14,12),(21,14,13),(22,15,3),(23,15,12),(24,15,14),(25,16,6),(26,17,3),(27,17,13),(28,17,15);
/*!40000 ALTER TABLE `movies_movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interactions_comment`
--

DROP TABLE IF EXISTS `user_interactions_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interactions_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_interactions_comment_movie_id_ffe70dbb_fk_movies_movie_id` (`movie_id`),
  KEY `user_interactions_comment_user_id_482328c0_fk_auth_user_id` (`user_id`),
  CONSTRAINT `user_interactions_comment_movie_id_ffe70dbb_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`),
  CONSTRAINT `user_interactions_comment_user_id_482328c0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_comment`
--

LOCK TABLES `user_interactions_comment` WRITE;
/*!40000 ALTER TABLE `user_interactions_comment` DISABLE KEYS */;
INSERT INTO `user_interactions_comment` VALUES (15,'Khóc sướt mướt ?','2025-04-15 14:20:10.640146',9,1);
/*!40000 ALTER TABLE `user_interactions_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interactions_like`
--

DROP TABLE IF EXISTS `user_interactions_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interactions_like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_interactions_like_user_id_movie_id_23ab0568_uniq` (`user_id`,`movie_id`),
  KEY `user_interactions_like_movie_id_0e41e061_fk_movies_movie_id` (`movie_id`),
  CONSTRAINT `user_interactions_like_movie_id_0e41e061_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`),
  CONSTRAINT `user_interactions_like_user_id_100efecd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_like`
--

LOCK TABLES `user_interactions_like` WRITE;
/*!40000 ALTER TABLE `user_interactions_like` DISABLE KEYS */;
INSERT INTO `user_interactions_like` VALUES (21,'2025-04-15 14:08:23.457893',11,1),(23,'2025-04-15 14:20:38.835759',13,1);
/*!40000 ALTER TABLE `user_interactions_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interactions_rating`
--

DROP TABLE IF EXISTS `user_interactions_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interactions_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_interactions_rating_user_id_movie_id_5ca3bdf0_uniq` (`user_id`,`movie_id`),
  KEY `user_interactions_rating_movie_id_5ced0657_fk_movies_movie_id` (`movie_id`),
  CONSTRAINT `user_interactions_rating_movie_id_5ced0657_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`),
  CONSTRAINT `user_interactions_rating_user_id_76e09004_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_rating`
--

LOCK TABLES `user_interactions_rating` WRITE;
/*!40000 ALTER TABLE `user_interactions_rating` DISABLE KEYS */;
INSERT INTO `user_interactions_rating` VALUES (5,5,'2025-04-15 14:20:16.619416',9,1);
/*!40000 ALTER TABLE `user_interactions_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interactions_userlist`
--

DROP TABLE IF EXISTS `user_interactions_userlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interactions_userlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_interactions_userlist_user_id_c00b492f` (`user_id`),
  CONSTRAINT `user_interactions_userlist_user_id_c00b492f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_userlist`
--

LOCK TABLES `user_interactions_userlist` WRITE;
/*!40000 ALTER TABLE `user_interactions_userlist` DISABLE KEYS */;
INSERT INTO `user_interactions_userlist` VALUES (1,'2025-04-08 15:11:40.550000',1),(2,'2025-04-10 11:56:18.853971',2);
/*!40000 ALTER TABLE `user_interactions_userlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interactions_userlist_actors`
--

DROP TABLE IF EXISTS `user_interactions_userlist_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interactions_userlist_actors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userlist_id` bigint NOT NULL,
  `actor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_interactions_userli_userlist_id_actor_id_775ea86b_uniq` (`userlist_id`,`actor_id`),
  KEY `user_interactions_us_actor_id_18f111af_fk_actor_act` (`actor_id`),
  CONSTRAINT `user_interactions_us_actor_id_18f111af_fk_actor_act` FOREIGN KEY (`actor_id`) REFERENCES `actor_actor` (`id`),
  CONSTRAINT `user_interactions_us_userlist_id_a611060c_fk_user_inte` FOREIGN KEY (`userlist_id`) REFERENCES `user_interactions_userlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_userlist_actors`
--

LOCK TABLES `user_interactions_userlist_actors` WRITE;
/*!40000 ALTER TABLE `user_interactions_userlist_actors` DISABLE KEYS */;
INSERT INTO `user_interactions_userlist_actors` VALUES (1,1,7);
/*!40000 ALTER TABLE `user_interactions_userlist_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interactions_userlist_movies`
--

DROP TABLE IF EXISTS `user_interactions_userlist_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interactions_userlist_movies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userlist_id` bigint NOT NULL,
  `movie_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_interactions_userli_userlist_id_movie_id_2bb083b9_uniq` (`userlist_id`,`movie_id`),
  KEY `user_interactions_us_movie_id_e118fa72_fk_movies_mo` (`movie_id`),
  CONSTRAINT `user_interactions_us_movie_id_e118fa72_fk_movies_mo` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`),
  CONSTRAINT `user_interactions_us_userlist_id_8eb163fb_fk_user_inte` FOREIGN KEY (`userlist_id`) REFERENCES `user_interactions_userlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_userlist_movies`
--

LOCK TABLES `user_interactions_userlist_movies` WRITE;
/*!40000 ALTER TABLE `user_interactions_userlist_movies` DISABLE KEYS */;
INSERT INTO `user_interactions_userlist_movies` VALUES (13,1,12);
/*!40000 ALTER TABLE `user_interactions_userlist_movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-15 21:57:32
