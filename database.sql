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
-- Table structure for table `accounts_emailconfirmationtoken`
--

DROP TABLE IF EXISTS `accounts_emailconfirmationtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_emailconfirmationtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_emailconfirmationtoken_user_id_00ada09a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_emailconfirmationtoken`
--

LOCK TABLES `accounts_emailconfirmationtoken` WRITE;
/*!40000 ALTER TABLE `accounts_emailconfirmationtoken` DISABLE KEYS */;
INSERT INTO `accounts_emailconfirmationtoken` VALUES (1,'3d46ff25553b483580511a7c9b8cdd71','2025-04-17 09:16:46.876439',4);
/*!40000 ALTER TABLE `accounts_emailconfirmationtoken` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'profile_photos/chris-ngang_1.jpg',1),(2,'default_photo.jpg',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_actor`
--

LOCK TABLES `actor_actor` WRITE;
/*!40000 ALTER TABLE `actor_actor` DISABLE KEYS */;
INSERT INTO `actor_actor` VALUES (2,'Chris Evans','1981-06-13','','Chris Evans','Khác với Chris Hemsworth vẫn đang loay hoay trong hình tượng vị thần sấm sét, đa số người hâm mộ vẫn nhìn nhận rõ ràng, Chris Evans và Captain America là hai con người hoàn toàn khác nhau.','Male','actor_images/chris-ngang_1_89Xb2Zr.jpg'),(3,'Margot Robbie','1990-07-02','','Margot Robbie','Dĩ nhiên, có nhan sắc chẳng bao giờ là đủ để đảm bảo cho chiếc vé thành công tại Hollywood, Margot còn phải cố gắng nhiều. Nhưng ta biết, hiện nay nàng xứng đáng được coi là minh tinh hạng A!','Female','actor_images/gallery-1436740108-elle-aug-15-margot-robbie-02.jpg'),(4,'Charlize Theron','1975-08-07','','Charlize Theron','Bắt đầu từ vai diễn không có lời thoại, chỉ xuất hiện 3 giây trong một bộ phim hạng B, Charlize Theron nay đã trở thành nữ thần của Hollywood.','Female','actor_images/theron-charlize-bannner_PAXBo6Q.jpg'),(5,'Hugh Jackman','1968-10-12','','Hugh Jackman','Ngoài gương mặt đẹp trai, thân hình rắn chắc và số tài lẻ không đếm nổi, Hugh Jackman còn có một niềm tự hào mà khó minh tinh Hollywood nào không ganh tị.','Male','actor_images/hu-ngang.jpg'),(6,'Robert Downey Jr','1965-04-04','','Robert Downey Jr','Thành công lớn ở giai đoạn đầu sự nghiệp nhưng nghiện ngập từ bé, có phim kiếm cả tỉ đôla lại từng lang thang không xu dính túi, 2 lần đề cử Oscar đi kèm với những lần vào tù ra khám… Nếu phải chọn cuộc đời một ngôi sao để viết kịch bản phim, thì “cuộc đời của Robert Downey Jr” sẽ là kịch bản nằm ở tốp kịch tính và ăn khách nhất.','Male','actor_images/robert-ngang.jpg'),(7,'Dwayne Johnson','1972-05-02','','Dwayne Johnson','Có nhiều biệt danh như The People\'s Champion, The Brahma Bull, The Great One… nhưng người ta thường nhớ đến Dwayne Johnson với cái tên The Rock.','Male','actor_images/3_204.jpg'),(8,'Anthony Mackie','1978-09-23','Anthony Dwane Mackie (sinh ngày 23 tháng 9 năm 1978) là một diễn viên người Mỹ. Anh được đông đảo khán giả biết đến qua vai Sam Wilson / Falcon / Captain America trong Vũ trụ Điện ảnh Marvel, bắt đầu từ bộ phim Captain America: The Winter Soldier (2014). Anh tiếp tục đảm nhận vai chính trong loạt phim ngắn The Falcon and the Winter Soldier (2021) trên Disney+, và phần phim tiếp theo Captain America: Brave New World (2025).\r\n\r\nMackie ra mắt lần đầu trên màn ảnh rộng với bộ phim 8 Mile (2002), và nhận được nhiều lời khen từ giới phê bình nhờ các vai diễn trong Brother to Brother (2004) — bộ phim giúp anh nhận đề cử Nam chính xuất sắc nhất tại Giải Independent Spirit — và The Hurt Locker (2008), bộ phim mang về cho anh đề cử Nam diễn viên phụ xuất sắc nhất tại Giải AAFCA. Anh cũng từng vào vai Tupac Shakur trong Notorious (2009) và Martin Luther King Jr. trong phim truyền hình All the Way (2016) của HBO.\r\n\r\nTrên truyền hình, Mackie đóng vai Takeshi Kovacs trong mùa 2 của loạt phim Altered Carbon (2020) của Netflix, và hiện là vai chính trong series Twisted Metal (2023–nay) của nền tảng Peacock. Ở lĩnh vực sân khấu, anh từng biểu diễn trên cả Broadway và Off-Broadway, bao gồm các vở Ma Rainey\'s Black Bottom, A Soldier\'s Play, và Talk của Carl Hancock Rux — vở diễn đã mang về cho anh Giải thưởng Obie vào năm 2002.','Anthony Mackie','','Male','actor_images/eZSIDrtTzhvabyjrmIITQLsjx8h.jpg'),(9,'Jason Statham','1967-07-26','Jason Statham (sinh ngày 26 tháng 7 năm 1967) là một diễn viên và nhà sản xuất người Anh. Anh nổi tiếng với những vai diễn mạnh mẽ, gai góc, hoặc có phần bạo lực trong nhiều bộ phim hành động – giật gân, và được ghi nhận là người góp phần hồi sinh thể loại phim hành động trong những năm 2000 và 2010. Tính đến năm 2017, các bộ phim có anh tham gia đã thu về hơn **1,1 tỷ bảng Anh (1,5 tỷ USD)**, đưa anh trở thành một trong những ngôi sao có sức hút phòng vé lớn nhất ngành điện ảnh.\r\n\r\nKhi còn trẻ, trong lúc làm việc tại các sạp hàng ngoài chợ, Statham đã bắt đầu tập luyện các môn võ như **võ thuật Trung Hoa, kickboxing và karate** như một sở thích cá nhân. Anh còn là một cầu thủ bóng đá đam mê thể thao và từng là thành viên đội tuyển lặn quốc gia của Anh, đại diện nước Anh thi đấu tại **Đại hội Thể thao Khối Thịnh vượng chung năm 1990**. Không lâu sau đó, anh được mời làm người mẫu cho các thương hiệu như **French Connection, Tommy Hilfiger** và **Levi’s** trong nhiều chiến dịch quảng cáo.','Jason Statham','','Male','actor_images/8FMhYekyLR4ibHQ9Kpuaqe4cVjL.jpg'),(10,'Andrew Garfield','1983-08-20','Andrew Russell Garfield (sinh ngày 20 tháng 8 năm 1983) là một nam diễn viên mang hai quốc tịch Anh và Mỹ. Anh bắt đầu được chú ý trên toàn thế giới vào năm 2010 với vai phụ Eduardo Saverin trong bộ phim chính kịch The Social Network. Garfield nổi tiếng hơn nữa khi vào vai Spider-Man trong loạt phim siêu anh hùng The Amazing Spider-Man (2012), The Amazing Spider-Man 2 (2014), và sau đó tiếp tục xuất hiện trong Spider-Man: No Way Home (2021).\r\nGarfield từng hai lần nhận đề cử Giải Oscar Nam chính xuất sắc nhất nhờ vai Desmond Doss trong phim chiến tranh Hacksaw Ridge (2016) và Jonathan Larson trong phim nhạc kịch Tick, Tick... Boom! (2021). Với vai diễn trong Tick, Tick... Boom!, anh cũng giành được Giải Quả Cầu Vàng cho Nam diễn viên chính xuất sắc. Ngoài ra, anh còn nhận Giải BAFTA Truyền hình cho Nam chính xuất sắc nhất với vai diễn trong phim truyền hình Boy A (2007).\r\nMột số bộ phim đáng chú ý khác mà Garfield tham gia gồm có: Never Let Me Go (2010), Silence (2016), The Eyes of Tammy Faye (2021), và We Live in Time (2024). Trên truyền hình, anh từng đóng vai một thám tử người Mormon trong loạt phim tội phạm Under the Banner of Heaven (2022), và nhận được đề cử Giải Emmy Nam chính xuất sắc trong phim truyền hình ngắn tập.','Andrew Garfield','','Male','actor_images/5ydZ6TluPtxlz5G8nlWMB7SGmow.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add genre',7,'add_genre'),(26,'Can change genre',7,'change_genre'),(27,'Can delete genre',7,'delete_genre'),(28,'Can view genre',7,'view_genre'),(29,'Can add movie',8,'add_movie'),(30,'Can change movie',8,'change_movie'),(31,'Can delete movie',8,'delete_movie'),(32,'Can view movie',8,'view_movie'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add like',10,'add_like'),(38,'Can change like',10,'change_like'),(39,'Can delete like',10,'delete_like'),(40,'Can view like',10,'view_like'),(41,'Can add rating',11,'add_rating'),(42,'Can change rating',11,'change_rating'),(43,'Can delete rating',11,'delete_rating'),(44,'Can view rating',11,'view_rating'),(45,'Can add user list',12,'add_userlist'),(46,'Can change user list',12,'change_userlist'),(47,'Can delete user list',12,'delete_userlist'),(48,'Can view user list',12,'view_userlist'),(49,'Can add profile',13,'add_profile'),(50,'Can change profile',13,'change_profile'),(51,'Can delete profile',13,'delete_profile'),(52,'Can view profile',13,'view_profile'),(53,'Can add movie',14,'add_movie'),(54,'Can change movie',14,'change_movie'),(55,'Can delete movie',14,'delete_movie'),(56,'Can view movie',14,'view_movie'),(57,'Can add actor',15,'add_actor'),(58,'Can change actor',15,'change_actor'),(59,'Can delete actor',15,'delete_actor'),(60,'Can view actor',15,'view_actor'),(61,'Can add actor',16,'add_actor'),(62,'Can change actor',16,'change_actor'),(63,'Can delete actor',16,'delete_actor'),(64,'Can view actor',16,'view_actor'),(65,'Can add email confirmation token',17,'add_emailconfirmationtoken'),(66,'Can change email confirmation token',17,'change_emailconfirmationtoken'),(67,'Can delete email confirmation token',17,'delete_emailconfirmationtoken'),(68,'Can view email confirmation token',17,'view_emailconfirmationtoken'),(69,'Can add subscription plan',18,'add_subscriptionplan'),(70,'Can change subscription plan',18,'change_subscriptionplan'),(71,'Can delete subscription plan',18,'delete_subscriptionplan'),(72,'Can view subscription plan',18,'view_subscriptionplan'),(73,'Can add subscription',19,'add_subscription'),(74,'Can change subscription',19,'change_subscription'),(75,'Can delete subscription',19,'delete_subscription'),(76,'Can view subscription',19,'view_subscription'),(77,'Can add payment',20,'add_payment'),(78,'Can change payment',20,'change_payment'),(79,'Can delete payment',20,'delete_payment'),(80,'Can view payment',20,'view_payment'),(81,'Can add episode',21,'add_episode'),(82,'Can change episode',21,'change_episode'),(83,'Can delete episode',21,'delete_episode'),(84,'Can view episode',21,'view_episode');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$DbWacX7bvMh5IT2JKjkXs0$fEOysm/S1fgSuinLPHEURnvz3rqO7UMsgidnY2om8zY=','2025-04-21 08:53:26.128685',1,'admin','Thân','Tâm','thantam311@gmail.com',1,1,'2025-04-08 15:07:16.099000'),(2,'pbkdf2_sha256$1000000$GrCV19WI91rAdbvUENz9W7$R2k7fw15yF19VopZNQe2Vm2I+C4fS8pCPlYXVqjl9Sk=','2025-04-10 11:57:26.429577',0,'tam','','','n22dcat047@student.ptithcm.edu.vn',0,1,'2025-04-10 11:08:10.000000'),(3,'pbkdf2_sha256$1000000$7TozFtwxQUQfDTTiWvQfXg$rPR+KYDt499eQYUoV0H3VD0ev54WJwqxW030cvyjpYM=','2025-04-17 03:17:53.068369',1,'duyle','','','',1,1,'2025-04-17 03:17:26.021578'),(4,'pbkdf2_sha256$1000000$GCWV7J5RoMUiNVtrpkyVCP$HmWC2cTL9rdGulhLrLAeOE0Wza9rTdCWMzEow/XM+EM=',NULL,0,'test1','dgsdfdsf','fdfs','tttkiller2004@gmail.com',0,0,'2025-04-17 09:16:46.052925');
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
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-08 15:08:48.922000','1','Male',1,'[{\"added\": {}}]',7,1),(2,'2025-04-08 15:11:27.781000','1','Naruto',1,'[{\"added\": {}}]',8,1),(3,'2025-04-08 15:12:21.215000','1','Naruto',2,'[{\"changed\": {\"fields\": [\"Video link\"]}}]',8,1),(4,'2025-04-08 15:19:56.840000','2','Female',1,'[{\"added\": {}}]',7,1),(5,'2025-04-08 15:20:26.702000','2','roAkgfsdkfnds',1,'[{\"added\": {}}]',8,1),(6,'2025-04-08 15:45:19.997000','1','Naruto',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(7,'2025-04-08 15:45:46.895000','1','Naruto',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(8,'2025-04-08 15:54:03.476000','2','roAkgfsdkfnds',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(9,'2025-04-09 01:24:49.152678','3','Hành động',1,'[{\"added\": {}}]',7,1),(10,'2025-04-09 01:24:58.114607','4','Drama',1,'[{\"added\": {}}]',7,1),(11,'2025-04-09 01:25:05.467163','5','Kiếm hiệp',1,'[{\"added\": {}}]',7,1),(12,'2025-04-09 01:28:15.697420','2','roAkgfsdkfnds',3,'',8,1),(13,'2025-04-09 01:30:12.124951','6','Anime',1,'[{\"added\": {}}]',7,1),(14,'2025-04-09 01:30:16.406263','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Thumbnail\", \"Video file\", \"Release date\", \"Genres\"]}}]',8,1),(15,'2025-04-09 02:00:13.242578','3','Chiến thần',1,'[{\"added\": {}}]',8,1),(16,'2025-04-09 02:12:37.676995','7','Phim tình cảm',1,'[{\"added\": {}}]',7,1),(17,'2025-04-09 02:12:40.930506','4','Quả quýt',1,'[{\"added\": {}}]',8,1),(18,'2025-04-09 02:13:08.165585','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(19,'2025-04-09 02:13:36.078812','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(20,'2025-04-09 02:14:37.644833','1','Male',3,'',7,1),(21,'2025-04-09 02:14:40.333213','2','Female',3,'',7,1),(22,'2025-04-09 02:14:45.993402','7','Tình cảm',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(23,'2025-04-09 03:23:39.208112','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(24,'2025-04-09 03:23:58.711215','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(25,'2025-04-09 03:24:22.998332','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(26,'2025-04-09 03:24:45.759805','1','Naruto tập 1',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(27,'2025-04-09 03:25:36.694442','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(28,'2025-04-09 03:25:51.671952','3','Chiến thần',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(29,'2025-04-09 03:29:28.567070','4','Quả quýt',2,'[{\"changed\": {\"fields\": [\"Trailer file\"]}}]',8,1),(30,'2025-04-09 04:39:36.747080','5','Phim api',1,'[{\"added\": {}}]',8,1),(31,'2025-04-09 04:44:47.731358','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Streaming link\", \"Trailer link\"]}}]',8,1),(32,'2025-04-09 04:51:06.677480','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Video file\", \"Streaming link\"]}}]',8,1),(33,'2025-04-09 04:52:25.933041','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(34,'2025-04-09 04:52:42.733622','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(35,'2025-04-09 04:53:42.708727','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Trailer file\"]}}]',8,1),(36,'2025-04-09 04:53:57.814469','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Trailer link\"]}}]',8,1),(37,'2025-04-09 04:54:14.250883','5','Phim api',2,'[{\"changed\": {\"fields\": [\"Trailer file\"]}}]',8,1),(38,'2025-04-09 05:51:47.323424','8','Kinh dị',1,'[{\"added\": {}}]',7,1),(39,'2025-04-09 05:52:35.219473','6','404 - Chạy Ngay Đi',1,'[{\"added\": {}}]',8,1),(40,'2025-04-09 05:58:17.796330','6','404 - Chạy Ngay Đi',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,1),(41,'2025-04-09 06:00:04.954614','6','404 - Chạy Ngay Đi',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,1),(42,'2025-04-09 06:02:27.051268','9','Chính kịch',1,'[{\"added\": {}}]',7,1),(43,'2025-04-09 06:04:19.111680','7','The Clubhouse: Một Năm Cùng Đội Red Sox Tập 1',1,'[{\"added\": {}}]',8,1),(44,'2025-04-10 11:08:11.188722','2','tam',1,'[{\"added\": {}}]',4,1),(45,'2025-04-10 11:08:15.983695','2','tam',2,'[{\"changed\": {\"fields\": [\"Email address\"]}}]',4,1),(46,'2025-04-13 06:22:47.855167','1','Thân Trung Tâm',1,'[{\"added\": {}}]',15,1),(47,'2025-04-13 07:00:20.233721','1','Than Trung Tam',1,'[{\"added\": {}}]',16,1),(48,'2025-04-13 07:08:48.622647','1','Than Trung Tam',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',16,1),(49,'2025-04-13 08:09:18.184549','1','Than Trung Tam',2,'[{\"changed\": {\"fields\": [\"Gi\\u1edbi t\\u00ednh\"]}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (1)\"}}]',16,1),(50,'2025-04-13 10:13:18.298292','8','Phim hay',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (2)\"}}]',8,1),(51,'2025-04-13 10:13:42.567859','8','Phim hay',2,'[{\"changed\": {\"fields\": [\"Video file\"]}}]',8,1),(52,'2025-04-15 13:14:10.887465','2','Chris Evans',1,'[{\"added\": {}}]',16,1),(53,'2025-04-15 13:16:33.503255','3','Margot Robbie',1,'[{\"added\": {}}]',16,1),(54,'2025-04-15 13:16:47.056762','1','Than Trung Tam',3,'',16,1),(55,'2025-04-15 13:17:45.351651','4','Charlize Theron',1,'[{\"added\": {}}]',16,1),(56,'2025-04-15 13:18:43.427707','2','Chris Evans',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(57,'2025-04-15 13:18:58.256335','4','Charlize Theron',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(58,'2025-04-15 13:19:15.732443','2','Chris Evans',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(59,'2025-04-15 13:19:26.251049','4','Charlize Theron',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(60,'2025-04-15 13:21:01.023816','4','Charlize Theron',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(61,'2025-04-15 13:22:30.208591','5','Hugh Jackman',1,'[{\"added\": {}}]',16,1),(62,'2025-04-15 13:24:07.433653','6','Robert Downey Jr',1,'[{\"added\": {}}]',16,1),(63,'2025-04-15 13:25:23.591512','7','Dwayne Johnson',1,'[{\"added\": {}}]',16,1),(64,'2025-04-15 13:34:21.154998','10','Lãng mạn',1,'[{\"added\": {}}]',7,1),(65,'2025-04-15 13:36:55.365449','9','Hậu Duệ Mặt Trời',1,'[{\"added\": {}}]',8,1),(66,'2025-04-15 13:41:13.623475','9','Hậu Duệ Mặt Trời',2,'[]',8,1),(67,'2025-04-15 13:45:42.609410','8','Phim hay',3,'',8,1),(68,'2025-04-15 13:45:42.609436','7','The Clubhouse: Một Năm Cùng Đội Red Sox Tập 1',3,'',8,1),(69,'2025-04-15 13:45:42.609445','6','404 - Chạy Ngay Đi',3,'',8,1),(70,'2025-04-15 13:45:42.609454','5','Phim api',3,'',8,1),(71,'2025-04-15 13:45:42.609462','4','Quả quýt',3,'',8,1),(72,'2025-04-15 13:45:42.609469','3','Chiến thần',3,'',8,1),(73,'2025-04-15 13:45:42.609477','1','Naruto tập 1',3,'',8,1),(74,'2025-04-15 13:49:28.144245','10','Bữa Tiệc Đẫm Máu',1,'[{\"added\": {}}]',8,1),(75,'2025-04-15 13:54:50.160441','9','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(76,'2025-04-15 13:57:17.095868','9','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(77,'2025-04-15 14:00:41.112838','9','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(78,'2025-04-15 14:02:50.577554','10','Bữa Tiệc Đẫm Máu',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(79,'2025-04-15 14:03:44.836562','11','Tâm lý',1,'[{\"added\": {}}]',7,1),(80,'2025-04-15 14:05:29.145230','11','Ăn, Chạy, Yêu',1,'[{\"added\": {}}]',8,1),(81,'2025-04-15 14:12:16.542103','12','Tee Yod: Quỷ Ăn Tạng',1,'[{\"added\": {}}]',8,1),(82,'2025-04-15 14:19:16.066699','13','The son',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (3)\"}}]',8,1),(83,'2025-04-15 14:22:09.013815','12','Hài hước',1,'[{\"added\": {}}]',7,1),(84,'2025-04-15 14:22:17.555977','13','Viễn tưởng',1,'[{\"added\": {}}]',7,1),(85,'2025-04-15 14:23:34.361820','14','Mật Mã Đỏ',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (4)\"}}]',8,1),(86,'2025-04-15 14:25:29.216110','14','Phiêu lưu',1,'[{\"added\": {}}]',7,1),(87,'2025-04-15 14:27:09.034146','15','Suicide Squad: Điệp Vụ Cảm Tử',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (5)\"}}]',8,1),(88,'2025-04-15 14:27:41.185413','15','Suicide Squad: Điệp Vụ Cảm Tử',2,'[{\"changed\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (5)\", \"fields\": [\"Actor\"]}}]',8,1),(89,'2025-04-15 14:39:03.635213','16','One Piece Tập 1125',1,'[{\"added\": {}}]',8,1),(90,'2025-04-15 14:44:44.664192','10','Bữa Tiệc Đẫm Máu',2,'[{\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (6)\"}}]',8,1),(91,'2025-04-15 14:45:38.841208','14','Mật Mã Đỏ',2,'[{\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (7)\"}}]',8,1),(92,'2025-04-15 14:50:18.782628','15','Hoạt hình',1,'[{\"added\": {}}]',7,1),(93,'2025-04-15 14:53:07.566063','17','Chiến binh lạc hồng',1,'[{\"added\": {}}]',8,1),(94,'2025-04-17 03:18:11.626604','10','Bữa Tiệc Đẫm Máu',3,'',8,3),(95,'2025-04-17 03:21:11.030609','18','Captain America: Brave New World',1,'[{\"added\": {}}]',8,3),(96,'2025-04-17 03:30:03.555606','8','Anthony Mackie',1,'[{\"added\": {}}]',16,3),(97,'2025-04-17 03:30:21.118807','18','Captain America: Brave New World',2,'[{\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (8)\"}}]',8,3),(98,'2025-04-17 03:42:20.159532','9','Jason Statham',1,'[{\"added\": {}}]',16,3),(99,'2025-04-17 03:42:41.891412','9','Jason Statham',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,3),(100,'2025-04-17 03:44:39.685763','19','A Working Man',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (9)\"}}]',8,3),(101,'2025-04-17 03:46:51.248118','16','Hình sự',1,'[{\"added\": {}}]',7,3),(102,'2025-04-17 03:47:03.777381','19','A Working Man',2,'[{\"changed\": {\"fields\": [\"Genres\"]}}]',8,3),(103,'2025-04-17 04:00:58.202242','20','Moana 2',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (10)\"}}]',8,3),(104,'2025-04-17 04:01:11.882424','17','Trẻ em',1,'[{\"added\": {}}]',7,3),(105,'2025-04-17 04:01:20.327041','18','Gia đình',1,'[{\"added\": {}}]',7,3),(106,'2025-04-17 04:01:42.410418','20','Moana 2',2,'[{\"changed\": {\"fields\": [\"Genres\"]}}]',8,3),(107,'2025-04-17 04:04:47.495772','21','Mufasa: The Lion King',1,'[{\"added\": {}}]',8,3),(108,'2025-04-17 04:24:47.764846','10','Andrew Garfield',1,'[{\"added\": {}}]',16,3),(109,'2025-04-17 04:26:17.299332','22','Hacksaw Ridge',1,'[{\"added\": {}}, {\"added\": {\"name\": \"movie-actor relationship\", \"object\": \"Movie_actors object (11)\"}}]',8,3),(110,'2025-04-17 04:27:29.989466','19','Chiến tranh',1,'[{\"added\": {}}]',7,3),(111,'2025-04-17 04:27:45.407874','20','Lịch sử',1,'[{\"added\": {}}]',7,3),(112,'2025-04-17 04:28:01.351077','22','Hacksaw Ridge',2,'[{\"changed\": {\"fields\": [\"Genres\"]}}]',8,3),(113,'2025-04-17 04:34:09.231954','23','Flow (2024)',1,'[{\"added\": {}}]',8,3),(114,'2025-04-17 04:34:50.860864','17','Chiến binh lạc hồng',3,'',8,3),(115,'2025-04-17 04:34:50.862079','16','One Piece Tập 1125',3,'',8,3),(116,'2025-04-17 04:34:50.862079','11','Ăn, Chạy, Yêu',3,'',8,3),(117,'2025-04-17 04:34:50.862079','9','Hậu Duệ Mặt Trời',3,'',8,3),(118,'2025-04-17 04:36:29.189118','20','Moana 2',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,3),(119,'2025-04-17 04:44:11.068618','24','Spider-Man: Across the Spider-Verse',1,'[{\"added\": {}}]',8,3),(120,'2025-04-17 04:46:15.952377','19','A Working Man',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,3),(121,'2025-04-17 04:47:26.317452','21','Mufasa: The Lion King',2,'[{\"changed\": {\"fields\": [\"Youtube embed url\"]}}]',8,3),(122,'2025-04-17 07:13:39.890026','8','Anthony Mackie',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(123,'2025-04-17 07:13:49.563304','10','Andrew Garfield',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(124,'2025-04-17 07:14:05.003897','9','Jason Statham',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(125,'2025-04-17 07:23:47.340423','14','Mật Mã Đỏ',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(126,'2025-04-17 07:24:58.616587','13','The son',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(127,'2025-04-17 07:25:17.372301','12','Tee Yod: Quỷ Ăn Tạng',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(128,'2025-04-17 07:25:56.173295','15','Suicide Squad: Điệp Vụ Cảm Tử',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(129,'2025-04-17 07:53:03.968485','23','Flow',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',8,1),(130,'2025-04-17 08:00:13.128468','16','Comment object (16)',3,'',9,1),(131,'2025-04-17 08:00:33.862907','17','Comment object (17)',3,'',9,1),(132,'2025-04-17 08:25:51.490165','10','Andrew Garfield',2,'[{\"changed\": {\"fields\": [\"Gi\\u1edbi t\\u00ednh\"]}}]',16,1),(133,'2025-04-17 08:26:09.735526','10','Andrew Garfield',2,'[{\"changed\": {\"fields\": [\"Gi\\u1edbi t\\u00ednh\"]}}]',16,1),(134,'2025-04-17 14:34:10.075735','18','Captain America: Brave New World',2,'[{\"changed\": {\"fields\": [\"Thumbnail\", \"Is premium\"]}}]',8,1),(135,'2025-04-17 14:36:07.029047','8','Anthony Mackie',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(136,'2025-04-17 14:36:28.363946','10','Andrew Garfield',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(137,'2025-04-17 21:38:52.025773','1','Gói Cơ Bản - 1 tháng',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',18,1),(138,'2025-04-17 21:39:07.497224','2','Gói Tiết Kiệm - 3 tháng',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',18,1),(139,'2025-04-17 21:39:16.987097','3','Gói Năm - 6 tháng',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',18,1),(140,'2025-04-17 21:39:22.621907','2','Gói Tiết Kiệm - 3 tháng',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',18,1),(141,'2025-04-17 21:39:35.946336','2','admin - Gói Tiết Kiệm (2025-04-17 to 2025-07-16)',3,'',19,1),(142,'2025-04-17 21:39:35.946367','1','admin - Gói Cơ Bản (2025-04-17 to 2025-05-17)',3,'',19,1),(143,'2025-04-17 21:40:24.621638','3','Payment 634a3bdc-5970-4a0a-a835-bc19fedefac3 - admin - Hoàn thành',3,'',20,1),(144,'2025-04-17 21:40:24.621669','2','Payment ea7a424c-21ef-49e1-839f-7bd83f43b344 - admin - Hoàn thành',3,'',20,1),(145,'2025-04-17 21:40:24.621685','1','Payment 0b65fb31-c0b1-4c7d-bc33-b6e1b60b6c20 - admin - Hoàn thành',3,'',20,1),(146,'2025-04-17 21:40:30.755948','3','admin - Gói Cơ Bản (2025-04-17 to 2025-05-17)',3,'',19,1),(147,'2025-04-17 21:46:37.317315','7','Payment 17449011613597 - admin - Đang chờ xử lý',3,'',20,1),(148,'2025-04-17 21:46:37.317350','6','Payment 17449011527617 - admin - Đang chờ xử lý',3,'',20,1),(149,'2025-04-17 21:46:37.317365','5','Payment 17449010867167 - admin - Đang chờ xử lý',3,'',20,1),(150,'2025-04-17 21:46:37.317377','4','Payment 17449010798130 - admin - Đang chờ xử lý',3,'',20,1),(151,'2025-04-17 21:47:40.047837','9','Jason Statham',2,'[{\"changed\": {\"fields\": [\"H\\u00ecnh \\u1ea3nh\"]}}]',16,1),(152,'2025-04-17 21:51:48.753344','23','Flow',2,'[{\"changed\": {\"fields\": [\"Thumbnail\", \"Is premium\"]}}]',8,1),(153,'2025-04-17 21:52:14.066115','22','Hacksaw Ridge',2,'[{\"changed\": {\"fields\": [\"Thumbnail\", \"Is premium\"]}}]',8,1),(154,'2025-04-17 22:45:06.987388','12','Payment 122946731332 - admin - Thất bại',3,'',20,1),(155,'2025-04-17 22:45:06.987430','11','Payment 578631572956 - admin - Đang chờ xử lý',3,'',20,1),(156,'2025-04-17 22:45:06.987447','10','Payment 873446031770 - admin - Đang chờ xử lý',3,'',20,1),(157,'2025-04-17 22:45:06.987461','9','Payment 17449016809178 - admin - Đang chờ xử lý',3,'',20,1),(158,'2025-04-17 22:45:06.987473','8','Payment 17449015532468 - admin - Đang chờ xử lý',3,'',20,1),(159,'2025-04-17 22:45:15.060979','14','Payment 228145282682 - admin - Đang chờ xử lý',3,'',20,1),(160,'2025-04-17 22:45:15.061008','13','Payment 256365607378 - admin - Đang chờ xử lý',3,'',20,1),(161,'2025-04-17 23:00:15.371831','18','Payment 330120246698 - admin - Hoàn thành',2,'[{\"changed\": {\"fields\": [\"Payment status\"]}}]',20,1),(162,'2025-04-18 07:27:54.679693','4','admin - Gói Cơ Bản (2025-04-18 to 2025-05-18)',3,'',19,1),(163,'2025-04-18 07:28:03.773043','40','Payment 324414700750 - admin - Hoàn thành',3,'',20,1),(164,'2025-04-18 07:28:03.773130','39','Payment 211676484858 - admin - Đang chờ xử lý',3,'',20,1),(165,'2025-04-18 07:28:03.773148','38','Payment 700429836300 - admin - Thất bại',3,'',20,1),(166,'2025-04-18 07:28:03.773163','37','Payment 272234025238 - admin - Đang chờ xử lý',3,'',20,1),(167,'2025-04-18 07:28:03.773181','36','Payment 121275938025 - admin - Đang chờ xử lý',3,'',20,1),(168,'2025-04-18 07:28:03.773192','35','Payment 249585191110 - admin - Đang chờ xử lý',3,'',20,1),(169,'2025-04-18 07:28:03.773205','34','Payment 147890169242 - admin - Đang chờ xử lý',3,'',20,1),(170,'2025-04-18 07:28:03.773250','33','Payment 266856618096 - admin - Đang chờ xử lý',3,'',20,1),(171,'2025-04-18 07:28:03.773265','32','Payment 322167647877 - admin - Thất bại',3,'',20,1),(172,'2025-04-18 07:28:03.773276','31','Payment 334313226370 - admin - Đang chờ xử lý',3,'',20,1),(173,'2025-04-18 07:28:03.773323','30','Payment 232246876896 - admin - Thất bại',3,'',20,1),(174,'2025-04-18 07:28:03.773338','29','Payment 194877986222 - admin - Đang chờ xử lý',3,'',20,1),(175,'2025-04-18 07:28:03.773350','28','Payment 240719469674 - admin - Đang chờ xử lý',3,'',20,1),(176,'2025-04-18 07:28:03.773364','27','Payment 222404288430 - admin - Thất bại',3,'',20,1),(177,'2025-04-18 07:28:03.773377','26','Payment 220011171658 - admin - Đang chờ xử lý',3,'',20,1),(178,'2025-04-18 07:28:03.773389','25','Payment 318652262902 - admin - Đang chờ xử lý',3,'',20,1),(179,'2025-04-18 07:28:03.773404','24','Payment 297717728130 - admin - Đang chờ xử lý',3,'',20,1),(180,'2025-04-18 07:28:03.773418','23','Payment 764421940252 - admin - Thất bại',3,'',20,1),(181,'2025-04-18 07:28:03.773432','22','Payment 309372454792 - admin - Đang chờ xử lý',3,'',20,1),(182,'2025-04-18 07:28:03.773445','21','Payment 296228971464 - admin - Đang chờ xử lý',3,'',20,1),(183,'2025-04-18 07:28:03.773456','20','Payment 124883988056 - admin - Đang chờ xử lý',3,'',20,1),(184,'2025-04-18 07:28:03.773469','19','Payment 109013129580 - admin - Đang chờ xử lý',3,'',20,1),(185,'2025-04-18 07:28:03.773483','18','Payment 330120246698 - admin - Thất bại',3,'',20,1),(186,'2025-04-18 07:28:03.773496','17','Payment 143722963341 - admin - Đang chờ xử lý',3,'',20,1),(187,'2025-04-18 07:28:03.773508','16','Payment 165484337953 - admin - Đang chờ xử lý',3,'',20,1),(188,'2025-04-18 07:28:03.773519','15','Payment 270991295283 - admin - Đang chờ xử lý',3,'',20,1),(189,'2025-04-18 07:32:16.379635','5','admin - Gói Tiết Kiệm (2025-04-18 to 2025-07-17)',3,'',19,1),(190,'2025-04-18 07:36:56.697815','19','A Working Man',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(191,'2025-04-18 07:37:20.150272','20','Moana 2',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(192,'2025-04-18 07:37:47.957931','21','Mufasa: The Lion King',2,'[{\"changed\": {\"fields\": [\"Thumbnail\"]}}]',8,1),(193,'2025-04-18 07:45:04.486867','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Thumbnail\", \"Is premium\"]}}]',8,1),(194,'2025-04-18 08:27:19.775625','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Screening schedule\"]}}]',8,1),(195,'2025-04-18 08:40:12.646528','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Movie type\"]}}]',8,1),(196,'2025-04-18 08:54:31.917952','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Movie type\"]}}]',8,1),(197,'2025-04-21 08:52:30.491200','6','admin - Gói Cơ Bản (2025-04-18 to 2025-05-18)',3,'',19,1),(198,'2025-04-21 11:43:12.313312','7','admin - Gói Cơ Bản (2025-04-21 to 2025-05-21)',3,'',19,1),(199,'2025-04-21 11:43:18.806354','46','Payment 592729209525 - admin - Đang chờ xử lý',3,'',20,1),(200,'2025-04-21 11:43:18.806439','45','Payment 150360611616 - admin - Hoàn thành',3,'',20,1),(201,'2025-04-21 11:43:18.806493','44','Payment 199851389262 - admin - Đang chờ xử lý',3,'',20,1),(202,'2025-04-21 11:43:18.806543','43','Payment 147962656584 - admin - Đang chờ xử lý',3,'',20,1),(203,'2025-04-21 11:43:18.806590','42','Payment 322358027791 - admin - Hoàn thành',3,'',20,1),(204,'2025-04-21 11:43:18.806636','41','Payment 274199155092 - admin - Hoàn thành',3,'',20,1),(205,'2025-04-21 11:43:58.984334','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Movie type\", \"Screening schedule\"]}}]',8,1),(206,'2025-04-21 13:44:48.618919','25','Hậu Duệ Mặt Trời',1,'[{\"added\": {}}]',8,1),(207,'2025-04-21 13:52:06.434276','8','admin - Gói Tiết Kiệm (2025-04-21 to 2025-07-20)',3,'',19,1),(208,'2025-04-21 14:08:44.992735','20','Moana 2',2,'[{\"changed\": {\"fields\": [\"Genres\", \"Screening schedule\"]}}]',8,1),(209,'2025-04-21 14:20:12.591631','25','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"fields\": [\"Genres\"]}}, {\"added\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 16: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi\"}}]',8,1),(210,'2025-04-21 14:21:09.585241','25','Hậu Duệ Mặt Trời',2,'[{\"added\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 2: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 2\"}}, {\"added\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 3: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 3\"}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 1: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 1\", \"fields\": [\"Episode number\", \"Title\"]}}]',8,1),(211,'2025-04-21 14:21:52.051597','25','Hậu Duệ Mặt Trời',2,'[]',8,1),(212,'2025-04-21 14:22:31.934080','25','Hậu Duệ Mặt Trời',2,'[{\"added\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 4: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 4\"}}, {\"added\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 5: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 5\"}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 1: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 1\", \"fields\": [\"Video file\"]}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 2: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 2\", \"fields\": [\"Video file\"]}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 3: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 3\", \"fields\": [\"Video file\"]}}]',8,1),(213,'2025-04-21 14:25:27.524789','25','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 1: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 1\", \"fields\": [\"Video file\", \"Streaming link\"]}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 2: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 2\", \"fields\": [\"Video file\", \"Streaming link\"]}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 3: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 3\", \"fields\": [\"Video file\", \"Streaming link\"]}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 4: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 4\", \"fields\": [\"Video file\", \"Streaming link\"]}}, {\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 5: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 5\", \"fields\": [\"Video file\", \"Streaming link\"]}}]',8,1),(214,'2025-04-21 14:26:40.493416','25','Hậu Duệ Mặt Trời',2,'[{\"changed\": {\"name\": \"episode\", \"object\": \"H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi - T\\u1eadp 1: H\\u1eadu Du\\u1ec7 M\\u1eb7t Tr\\u1eddi t\\u1eadp 1\", \"fields\": [\"Streaming link\"]}}]',8,1),(215,'2025-04-21 14:27:32.028485','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(216,'2025-04-21 14:30:10.207276','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Movie type\", \"Youtube embed url\"]}}]',8,1),(217,'2025-04-21 14:30:39.739842','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(218,'2025-04-21 18:29:16.305453','24','Spider-Man: Across the Spider-Verse',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(219,'2025-04-21 18:35:17.641188','13','The son',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(220,'2025-04-21 18:56:01.300113','23','Flow',2,'[{\"changed\": {\"fields\": [\"Genres\", \"Streaming link\"]}}]',8,1),(221,'2025-04-21 18:56:08.719964','22','Hacksaw Ridge',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(222,'2025-04-21 18:56:55.493179','21','Mufasa: The Lion King',2,'[{\"changed\": {\"fields\": [\"Genres\", \"Streaming link\"]}}]',8,1),(223,'2025-04-21 18:57:05.425739','20','Moana 2',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(224,'2025-04-21 18:57:13.258796','19','A Working Man',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(225,'2025-04-21 18:57:24.399469','18','Captain America: Brave New World',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(226,'2025-04-21 18:57:36.242306','15','Suicide Squad: Điệp Vụ Cảm Tử',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(227,'2025-04-21 18:57:46.236473','14','Mật Mã Đỏ',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1),(228,'2025-04-21 18:58:10.322146','12','Tee Yod: Quỷ Ăn Tạng',2,'[{\"changed\": {\"fields\": [\"Streaming link\"]}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (17,'accounts','emailconfirmationtoken'),(14,'accounts','movie'),(13,'accounts','profile'),(16,'actor','actor'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'movies','actor'),(21,'movies','episode'),(7,'movies','genre'),(8,'movies','movie'),(20,'payment','payment'),(19,'payment','subscription'),(18,'payment','subscriptionplan'),(6,'sessions','session'),(9,'user_interactions','comment'),(10,'user_interactions','like'),(11,'user_interactions','rating'),(12,'user_interactions','userlist');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-08 16:52:54.202828'),(2,'auth','0001_initial','2025-04-08 16:52:54.698523'),(3,'accounts','0001_initial','2025-04-08 16:52:54.770768'),(4,'accounts','0002_alter_profile_profile_photo','2025-04-08 16:52:54.776742'),(5,'admin','0001_initial','2025-04-08 16:52:54.883837'),(6,'admin','0002_logentry_remove_auto_add','2025-04-08 16:52:54.890044'),(7,'admin','0003_logentry_add_action_flag_choices','2025-04-08 16:52:54.896444'),(8,'contenttypes','0002_remove_content_type_name','2025-04-08 16:52:54.977733'),(9,'auth','0002_alter_permission_name_max_length','2025-04-08 16:52:55.026062'),(10,'auth','0003_alter_user_email_max_length','2025-04-08 16:52:55.043576'),(11,'auth','0004_alter_user_username_opts','2025-04-08 16:52:55.050974'),(12,'auth','0005_alter_user_last_login_null','2025-04-08 16:52:55.099479'),(13,'auth','0006_require_contenttypes_0002','2025-04-08 16:52:55.101506'),(14,'auth','0007_alter_validators_add_error_messages','2025-04-08 16:52:55.106842'),(15,'auth','0008_alter_user_username_max_length','2025-04-08 16:52:55.158957'),(16,'auth','0009_alter_user_last_name_max_length','2025-04-08 16:52:55.214168'),(17,'auth','0010_alter_group_name_max_length','2025-04-08 16:52:55.228824'),(18,'auth','0011_update_proxy_permissions','2025-04-08 16:52:55.235742'),(19,'auth','0012_alter_user_first_name_max_length','2025-04-08 16:52:55.286357'),(20,'movies','0001_initial','2025-04-08 16:52:55.434631'),(21,'movies','0002_movie_created_at_movie_likes_movie_views','2025-04-08 16:52:55.533147'),(22,'movies','0003_remove_movie_average_rating_remove_movie_likes_and_more','2025-04-08 16:52:55.619701'),(23,'movies','0004_movie_video_file','2025-04-08 16:52:55.649598'),(24,'sessions','0001_initial','2025-04-08 16:52:55.676217'),(25,'user_interactions','0001_initial','2025-04-08 16:52:56.009891'),(26,'user_interactions','0002_userlist','2025-04-08 16:52:56.166120'),(27,'user_interactions','0003_alter_userlist_user','2025-04-08 16:52:56.256084'),(28,'user_interactions','0004_alter_userlist_user','2025-04-08 16:52:56.342479'),(29,'movies','0005_remove_movie_trailer_movie_trailer_file_and_more','2025-04-09 03:17:49.416139'),(30,'movies','0006_movie_streaming_link_alter_movie_video_link','2025-04-09 04:38:50.009210'),(31,'movies','0007_movie_youtube_embed_url','2025-04-09 05:57:39.861722'),(32,'accounts','0003_movie','2025-04-10 12:57:10.851570'),(33,'movies','0008_actor','2025-04-13 06:19:06.087589'),(34,'movies','0009_actor_alternate_name_actor_gender_actor_introduction','2025-04-13 06:32:26.854161'),(35,'actor','0001_initial','2025-04-13 06:50:06.151423'),(36,'accounts','0004_delete_movie','2025-04-13 07:50:45.845924'),(37,'movies','0010_delete_actor_movie_actors','2025-04-13 07:50:46.030626'),(38,'actor','0002_alter_actor_options_alter_actor_alternate_name_and_more','2025-04-13 07:59:50.173187'),(39,'user_interactions','0005_userlist_actors_alter_userlist_movies','2025-04-13 08:10:26.750620'),(40,'movies','0011_remove_movie_views','2025-04-15 10:08:26.485831'),(41,'movies','add_views_column','2025-04-15 12:49:16.200740'),(42,'accounts','0005_emailconfirmationtoken','2025-04-16 03:22:57.256305'),(43,'user_interactions','0006_remove_actors_from_userlist','2025-04-16 03:22:57.275762'),(44,'user_interactions','0007_userlist_actors','2025-04-16 03:22:57.389095'),(45,'movies','0001_movie_is_premium','2025-04-17 14:30:41.857479'),(46,'payment','0001_initial','2025-04-17 14:30:42.223689'),(47,'movies','0002_movie_movie_type_movie_screening_schedule','2025-04-18 08:25:47.370143'),(48,'movies','0003_episode','2025-04-18 08:37:04.893628'),(49,'movies','0004_movie_episode_count','2025-04-21 13:38:33.910298'),(50,'movies','0004_movie_episode_count','2025-04-21 13:40:30.000000');
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
INSERT INTO `django_session` VALUES ('3rcm9upopkq9zacuqxsofs4u8iegxh3d','.eJxVjMsOwiAQRf-FtSEMdBBcuu83NDxmpGogKe3K-O_apAvd3nPOfYkpbGuZtk7LNGdxESBOv1sM6UF1B_ke6q3J1Oq6zFHuijxol2PL9Lwe7t9BCb18a58sWDgnCug1aiSGiEDaYwDFNlrDCgdGw8TGZQbrko4Ohqw8GMji_QHTwzdx:1u2M1O:bhDz6WfYtwC2m_8fmu5dsbY9Jjdl3G0Ut36A14Pcetg','2025-04-23 03:22:38.482949'),('46w0c14wqxl3kxjxfy4fcrvgazghm1ad','.eJxVjs0OgyAQhN-FsyGCKNhj730GsrtgpT9gBA9N03evGg_tcWa-mcybWVjKaJfsZxscOzHBql8Pge4-boG7QbwmTimWOSDfEH6kmV-S84_zwf4NjJDHtS0NSQOkSRvdwCCN8VgLhFaTlE6p2hgcFA3YdVIRKOc7JBRN7QFE3zfraF4w0xymElK00wPiflhUbILX08eyy1Z-vip0Rsc:1u6pim:qfowzXbt2tQBx1iy5F90xCwEsyObW_YpvUJ9XD2zwhQ','2025-05-05 18:53:56.470556'),('76uxu9uqju19a5jodiq74idyhew0ujc4','.eJxVjMsOwiAQRf-FtSEMdBBcuu83NDxmpGogKe3K-O_apAvd3nPOfYkpbGuZtk7LNGdxESBOv1sM6UF1B_ke6q3J1Oq6zFHuijxol2PL9Lwe7t9BCb18a58sWDgnCug1aiSGiEDaYwDFNlrDCgdGw8TGZQbrko4Ohqw8GMji_QHTwzdx:1u2KS9:fVng4Q1zYaqT-toZwBzTEsjwt4KfdDAlO-awX97Wouo','2025-04-23 01:42:09.330541'),('88c26mpeoj249gpckzbb8x22x6zzo173','.eJxVjEEOwiAQRe_C2hCgCFOX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIitDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl29tgA0ge_bgB8wGIJHShGfPxkRrFQBly5mcM5bRxuSISQ8qIepxHMT7A-0VOFY:1u3uEE:-y0NXjC01BD2Qb2c_pxcrc_tQAO8dqpLpTjeu1fRF34','2025-04-27 10:06:18.822982'),('c7rft7ni4xpbsqfatpkrwlmdx7pyg6wj','.eJxVjDsOwjAQBe_iGln-woaSnjNE610vDiBbipMKcXeIlALaNzPvpUZclzKuPc_jxOqsnDr8bgnpkesG-I711jS1usxT0puid9r1tXF-Xnb376BgL99aANniEEMiH0UGoGN2AUCMCZLAM1hADBglo3WOrZDFEzEY5MjRq_cHAUM4vg:1u2qX8:hZfzYHrR8Ekjf0zRtsoT-DnPQCn5lDTG72FVgGXjrBQ','2025-04-24 11:57:26.433311'),('i2uxzhlwwbafkbajopzb3enn1v1hakmg','.eJxVjEsOwjAMBe-SNYqaT2WbJXvOUNlOSgookfpZIe4OlbqA7ZuZ9zIDb2sZtiXPw5TM2QRz-t2E9ZHrDtKd661ZbXWdJ7G7Yg-62GtL-Xk53L-Dwkv51r53CcjFICwpSkQiEepQMqIAg_ca3NiTV4TYoYKCQxYZIygxJfP-ANllN-k:1u5FlB:ByhmMSNWo_RGiKQC259S3jxrtFLegGJHHO2LSkLv-tM','2025-05-01 03:17:53.071423'),('iy68i2knzkk7gtfrl8zfknzca6roa8si','.eJxVjEEOwiAQRe_C2hCgCFOX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIitDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl29tgA0ge_bgB8wGIJHShGfPxkRrFQBly5mcM5bRxuSISQ8qIepxHMT7A-0VOFY:1u3uEE:-y0NXjC01BD2Qb2c_pxcrc_tQAO8dqpLpTjeu1fRF34','2025-04-27 10:06:18.825283'),('lj03j1u8zd4vh1pc4rirwx9kpmzxny5v','.eJxVjEEOwiAQRe_C2hCgCFOX7nsGMjOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hjuIitDj9boT8SHUH8Y711iS3ui4zyV2RB-1yajE9r4f7d1Cwl29tgA0ge_bgB8wGIJHShGfPxkRrFQBly5mcM5bRxuSISQ8qIepxHMT7A-0VOFY:1u3Odb:JtJwcV_UsiNLBloPoL5ZMcmpoiywyf3n6rK6LfM79F4','2025-04-26 00:22:23.479170'),('zupy7xyp4nevdva4wgjlwsb5n0thpxcj','.eJxVjs0OgjAQhN-lZ9LQH2nx6N1naHa3RarYEgoHY3x3gXDQ48x8M5k3c7DMvVtKmFz07MwEq349BHqEtAX-DumWOeU0TxH5hvAjLfyafRguB_s30EPp17a0JC2QIWONgk5aG7AWCCdDUnqta2ux09Rh00hNoH1okFCoOgCItlXraFmw0BTHOebkxgHSflhWbITXM6R5l0p9viqCRsc:1u5S8I:mI-G2vaRRzR_QsGWEedEKcG98tkwxwRtpIzKWF8jLDc','2025-05-01 23:30:34.719420');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_episode`
--

DROP TABLE IF EXISTS `movies_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_episode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `episode_number` int NOT NULL,
  `description` longtext,
  `video_file` varchar(100) DEFAULT NULL,
  `video_link` varchar(200) DEFAULT NULL,
  `streaming_link` varchar(200) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movies_episode_movie_id_episode_number_f6d7b1ca_uniq` (`movie_id`,`episode_number`),
  CONSTRAINT `movies_episode_movie_id_ed3d3435_fk_movies_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies_movie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_episode`
--

LOCK TABLES `movies_episode` WRITE;
/*!40000 ALTER TABLE `movies_episode` DISABLE KEYS */;
INSERT INTO `movies_episode` VALUES (1,'Hậu Duệ Mặt Trời tập 1',1,NULL,'',NULL,'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240814/gutX40EI/index.m3u8','',NULL,'2025-04-21 14:20:12.590977',25),(2,'Hậu Duệ Mặt Trời tập 2',2,NULL,'',NULL,'https://s3.phim1280.tv/20240814/hweB8tUy/index.m3u8','',NULL,'2025-04-21 14:21:09.584400',25),(3,'Hậu Duệ Mặt Trời tập 3',3,NULL,'',NULL,'https://s3.phim1280.tv/20240814/QS2JRKzE/index.m3u8','',NULL,'2025-04-21 14:21:09.584696',25),(4,'Hậu Duệ Mặt Trời tập 4',4,NULL,'',NULL,'https://s3.phim1280.tv/20240814/ekC4QO2c/index.m3u8','',NULL,'2025-04-21 14:22:31.931787',25),(5,'Hậu Duệ Mặt Trời tập 5',5,NULL,'',NULL,'https://s3.phim1280.tv/20240814/hiM6E7D7/index.m3u8','',NULL,'2025-04-21 14:22:31.933498',25);
/*!40000 ALTER TABLE `movies_episode` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genre`
--

LOCK TABLES `movies_genre` WRITE;
/*!40000 ALTER TABLE `movies_genre` DISABLE KEYS */;
INSERT INTO `movies_genre` VALUES (6,'Anime'),(19,'Chiến tranh'),(9,'Chính kịch'),(4,'Drama'),(18,'Gia đình'),(12,'Hài hước'),(3,'Hành động'),(16,'Hình sự'),(15,'Hoạt hình'),(5,'Kiếm hiệp'),(8,'Kinh dị'),(10,'Lãng mạn'),(20,'Lịch sử'),(14,'Phiêu lưu'),(11,'Tâm lý'),(7,'Tình cảm'),(17,'Trẻ em'),(13,'Viễn tưởng');
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
  `is_premium` tinyint(1) NOT NULL,
  `movie_type` varchar(10) NOT NULL,
  `screening_schedule` datetime(6) DEFAULT NULL,
  `episode_count` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `movies_movie_chk_1` CHECK ((`episode_count` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie`
--

LOCK TABLES `movies_movie` WRITE;
/*!40000 ALTER TABLE `movies_movie` DISABLE KEYS */;
INSERT INTO `movies_movie` VALUES (12,'Tee Yod: Quỷ Ăn Tạng','Khi linh hồn khát máu nọ nhập vào một cô gái trẻ ở ngôi làng hẻo lánh, anh trai cô đi đầu trong nỗ lực trục xuất linh hồn đó trước khi cô bị cái ác lấn át.','2023-01-01',NULL,'movie_thumbnails/phim-tee-yod-quy-an-tang-8_84xBuXk.jpeg','2025-04-15 14:12:16.538720','','',NULL,'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240411/VjV5ECNY/index.m3u8','https://www.youtube.com/embed/xVVZvSybaEc?si=HECozJhdx7R11XXL',1,0,'single',NULL,NULL),(13,'The son','Bộ phim xoay quanh Peter, người đang bận rộn với cuộc sống bên cạnh người vợ mới và đứa con mới sinh của họ. Tuy nhiên, mọi chuyện đảo lộn khi Kate xuất hiện và nhờ anh chăm sóc cho cậu con trai Nicholas đang tuổi vị thành niên của cả hai.','2022-01-21',NULL,'movie_thumbnails/2.jpg','2025-04-15 14:19:16.062360','','',NULL,'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230923/tKRms9Ew/index.m3u8','https://www.youtube.com/embed/SJWRY4DzoAQ?si=BluLoqkvyGc9jzgv',7,0,'single',NULL,NULL),(14,'Mật Mã Đỏ','Sau khi Ông già Noel bị bắt cóc, Trưởng An ninh Bắc Cực (Dwayne Johnson) phải hợp tác với thợ săn tiền thưởng khét tiếng nhất thế giới (Chris Evans) trong một nhiệm vụ kịch tính xuyên lục địa để giải cứu Giáng Sinh.','2024-06-06',NULL,'movie_thumbnails/phim-red-one-mat-ma-do-thumbnail.jpg','2025-04-15 14:23:34.357842','','',NULL,'https://player.phimapi.com/player/?url=https://s4.phim1280.tv/20241213/k8WwowG2/index.m3u8','https://www.youtube.com/embed/2T_mKyH17mY?si=AWY7t9ZCRMRQmcsN',3,0,'single',NULL,NULL),(15,'Suicide Squad: Điệp Vụ Cảm Tử','Chính phủ gửi những siêu tội phạm nguy hiểm nhất trên thế giới - Bloodsport, Peacemaker, King Shark, Harley Quinn và những người khác - đến hòn đảo Corto Maltese xa xôi, đầy kẻ thù. Được trang bị vũ khí công nghệ cao, họ băng qua khu rừng rậm nguy hiểm trong một nhiệm vụ tìm kiếm và tiêu diệt, chỉ có Đại tá Rick Flag trên mặt đất để bắt họ hành xử.','2021-09-09',NULL,'movie_thumbnails/maxresdefault.jpg','2025-04-15 14:27:09.030941','','',NULL,'https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240802/6QTgaAAW/index.m3u8','https://www.youtube.com/embed/QTg5K0XDiaE?si=IOlZSimw_q4mPcOE',0,0,'single',NULL,NULL),(18,'Captain America: Brave New World','Sau khi gặp Tổng thống Hoa Kỳ mới đắc cử Thaddeus Ross, Sam Wilson thấy mình bị cuốn vào một sự cố . Anh phải khám phá lý do đằng sau một âm mưu cực kì xấu xa trước khi kẻ chủ mưu thật sự khiến cả thế giới phải hoảng sợ','2025-04-09',NULL,'movie_thumbnails/3ff8eee9f7443ddc826546772c9b6e4e.jpg','2025-04-17 03:21:11.027376','','',NULL,'https://player.phimapi.com/player/?url=https://s5.phim1280.tv/20250415/GSrQWePH/index.m3u8','https://www.youtube.com/embed/1pHDWnXmK7Y?si=LvNJqF6IPFGO-d7E',2,1,'single',NULL,NULL),(19,'A Working Man','Levon Cade - cựu biệt kích tinh nhuệ thuộc lực lượng Thủy quân Lục chiến Hoàng gia Anh. Sau khi nghỉ hưu, anh sống cuộc đời yên bình là một công nhân xây dựng tại Chicago (Mỹ). Levon có mối quan hệ rất tốt với gia đình ông chủ Joe Garcia (Michael Peña). Một ngày nọ, cô con gái tuổi teen Jenny (Arianna Rivas) của Joe bị bắt cóc khiến chàng cựu quân nhân phải sử dụng lại các kỹ năng giết chóc của mình để giúp đỡ.','2025-04-04',NULL,'movie_thumbnails/6FRFIogh3zFnVWn7Z6zcYnIbRcX.jpg','2025-04-17 03:44:39.682782','','',NULL,'https://player.phimapi.com/player/?url=https://s5.phim1280.tv/20250407/Gi7NrZiw/index.m3u8','https://www.youtube.com/embed/zTbgNC42Ops?si=0mb8m3goBT60n8_4',1,0,'single',NULL,NULL),(20,'Moana 2','“Hành Trình của Moana 2” là màn tái hợp của Moana và Maui sau 3 năm, trở lại trong chuyến phiêu lưu cùng với những thành viên mới. Theo tiếng gọi của tổ tiên, Moana sẽ tham gia cuộc hành trình đến những vùng biển xa xôi của Châu Đại Dương và sẽ đi tới vùng biển nguy hiểm, đã mất tích từ lâu. Cùng chờ đón cuộc phiêu lưu của Moana đầy chông gai sắp tới nhé.','2024-11-29',NULL,'movie_thumbnails/aLVkiINlIeCkcZIzb7XHzPYgO6L.jpg','2025-04-17 04:00:58.197976','','',NULL,'https://player.phimapi.com/player/?url=https://s5.phim1280.tv/20250102/9CPD50vZ/index.m3u8','https://www.youtube.com/embed/hDZ7y8RP5HE?si=HjFn3aBWMjxdzwTX',0,0,'single','2025-04-22 14:08:42.000000',NULL),(21,'Mufasa: The Lion King','Mufasa: Vua Sư Tử là phần tiền truyện của bộ phim hoạt hình Vua Sư Tử trứ danh, kể về cuộc đời của Mufasa - cha của Simba. Phim là hành trình Mufasa từ một chú sư tử mồ côi lạc đàn trở thành vị vua sư tử huyền thoại của Xứ Vua (Pride Land). Ngoài ra, quá khứ về tên phản diện Scar và hành trình hắc hóa của hắn cũng sẽ được phơi bày trong phần phim này.','2024-12-20',NULL,'movie_thumbnails/lurEK87kukWNaHd0zYnsi3yzJrs.jpg','2025-04-17 04:04:47.493647','','',NULL,'https://player.phimapi.com/player/?url=https://s4.phim1280.tv/20250105/EDLpgU3M/index.m3u8','https://www.youtube.com/embed/o17MF9vnabg?si=rugb8N4ag0SDpvrT',1,0,'single',NULL,NULL),(22,'Hacksaw Ridge','Phim kể lại cuộc đời của nhân vật có thật Desmond T. Doss - người lính từ chối cầm súng vì lý do tôn giáo. Nhưng ông vẫn trở thành anh hùng khi là một quân y, cứu sống 75 đồng đội trong cuộc chiến đẫm máu tại xứ sở hoa anh đào trong thời kỳ Thế chiến thứ II - Một trong những anh hùng vĩ đại nhất trong lịch sử nước Mỹ chưa bao giờ bắn một viên đạn.','2016-07-10',NULL,'movie_thumbnails/jhWbYeUNOA5zAb6ufK6pXQFXqTX.jpg','2025-04-17 04:26:17.295672','','',NULL,'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20231019/FVGNjgkQ/index.m3u8','https://www.youtube.com/embed/s2-1hz1juBI?si=m-1dg1D3ykPmVOcZ',1,1,'single',NULL,NULL),(23,'Flow','Bộ phim kể một câu chuyện ấm áp và đầy cảm hứng về một chú mèo có ngôi nhà bị nhấn chìm trong nước. Chú mèo phải bắt đầu hành trình tìm nơi ở mới lênh đênh trên một chiếc thuyền. Trong suốt hành trình, chú mèo hợp tác với những người bạn đồng hành khác, bao gồm một chú chó labrador, vượn cáo, chuột lang nước và một chú chim khổng lồ, cùng nhau vượt qua thử thách bằng lòng dũng cảm và trí tuệ.','2025-03-07',NULL,'movie_thumbnails/imKSymKBK7o73sajciEmndJoVkR.jpg','2025-04-17 04:34:09.230703','','',NULL,'https://player.phimapi.com/player/?url=https://s4.phim1280.tv/20250125/jI8qZLuH/index.m3u8','https://www.youtube.com/embed/82WW9dVbglI?si=q-uPuf-DBUJqPrAY',0,1,'single',NULL,NULL),(24,'Spider-Man: Across the Spider-Verse','Miles Morales tái xuất trong phần tiếp theo của bom tấn hoạt hình từng đoạt giải Oscar - Spider-Man: Across the Spider-Verse. Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các thế giới song song. Nhưng khi nhóm siêu anh hùng xung đột về cách xử lý một mối đe dọa mới, Miles buộc phải đọ sức với các Người Nhện khác và phải xác định lại ý nghĩa của việc trở thành một người hùng để có thể cứu những người cậu yêu thương nhất.','2023-06-01',NULL,'movie_thumbnails/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg','2025-04-17 04:44:11.067453','','',NULL,'https://player.phimapi.com/player/?url=https://s2.phim1280.tv/20230913/Q2Cln2U8/index.m3u8','https://player.phimapi.com/player/?url=https://s3.phim1280.tv/20240814/gutX40EI/index.m3u8',15,1,'single','2025-04-21 11:45:53.000000',NULL),(25,'Hậu Duệ Mặt Trời','Phim xoay quanh hai nhân vật Yoo Shi Jin và Kang Mo Yeon. Yoo Shi Jin là đội trưởng lực lượng gìn giữ hòa bình của Liên Hợp Quốc. Trong khi đó, Kang Mo Yeon là thành viên của tổ chức Bác sĩ không biên giới. Thời gian đầu gặp gỡ và hợp tác, Shi Jin và Mo Yeon thường xuyên xảy ra xung đột. Tuy nhiên về sau, mối quan hệ giữa họ dần được cải thiện. Trải qua nhiều lần xông pha vào chốn hiểm nguy, cả hai đã nhận ra tình cảm dành cho nhau','2016-04-21',NULL,'movie_thumbnails/hau-due-mat-troi-phunutoday_4.jpg','2025-04-21 13:44:48.613504','','',NULL,'https://s3.phim1280.tv/20240814/gutX40EI/index.m3u8','https://www.youtube.com/embed/nMljjobALnc?si=SmVUI68dTfwE89P8',26,0,'series',NULL,16);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_actors`
--

LOCK TABLES `movies_movie_actors` WRITE;
/*!40000 ALTER TABLE `movies_movie_actors` DISABLE KEYS */;
INSERT INTO `movies_movie_actors` VALUES (3,13,5),(7,14,2),(4,14,7),(5,15,3),(8,18,8),(9,19,9),(10,20,7),(11,22,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_movie_genres`
--

LOCK TABLES `movies_movie_genres` WRITE;
/*!40000 ALTER TABLE `movies_movie_genres` DISABLE KEYS */;
INSERT INTO `movies_movie_genres` VALUES (16,12,8),(17,12,11),(18,13,9),(19,14,3),(20,14,12),(21,14,13),(22,15,3),(23,15,12),(24,15,14),(30,18,3),(29,18,11),(31,18,13),(33,19,3),(32,19,11),(34,19,16),(54,20,3),(55,20,4),(56,20,5),(57,20,6),(58,20,7),(59,20,8),(60,20,9),(61,20,10),(62,20,11),(35,20,12),(63,20,13),(36,20,14),(64,20,15),(65,20,16),(37,20,17),(38,20,18),(66,20,19),(67,20,20),(99,21,3),(100,21,4),(101,21,5),(102,21,6),(103,21,7),(104,21,8),(105,21,9),(106,21,10),(107,21,11),(108,21,12),(109,21,13),(41,21,14),(110,21,15),(111,21,16),(39,21,17),(40,21,18),(112,21,19),(113,21,20),(42,22,9),(43,22,11),(44,22,19),(45,22,20),(83,23,3),(84,23,4),(85,23,5),(86,23,6),(87,23,7),(88,23,8),(89,23,9),(90,23,10),(91,23,11),(92,23,12),(46,23,13),(47,23,14),(93,23,15),(94,23,16),(95,23,17),(96,23,18),(97,23,19),(98,23,20),(48,24,3),(49,24,14),(50,24,15),(52,25,3),(68,25,4),(69,25,5),(70,25,6),(71,25,7),(72,25,8),(51,25,9),(73,25,10),(74,25,11),(75,25,12),(76,25,13),(53,25,14),(77,25,15),(78,25,16),(79,25,17),(80,25,18),(81,25,19),(82,25,20);
/*!40000 ALTER TABLE `movies_movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_payment`
--

DROP TABLE IF EXISTS `payment_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `subscription_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_payment_user_id_f428ca02_fk_auth_user_id` (`user_id`),
  KEY `payment_payment_subscription_id_46d79ee2_fk_payment_s` (`subscription_id`),
  CONSTRAINT `payment_payment_subscription_id_46d79ee2_fk_payment_s` FOREIGN KEY (`subscription_id`) REFERENCES `payment_subscription` (`id`),
  CONSTRAINT `payment_payment_user_id_f428ca02_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_payment`
--

LOCK TABLES `payment_payment` WRITE;
/*!40000 ALTER TABLE `payment_payment` DISABLE KEYS */;
INSERT INTO `payment_payment` VALUES (47,'170004236390',200000,'completed','2025-04-21 11:46:09.124580',1,NULL),(48,'163972365617',70000,'pending','2025-04-21 11:47:04.190904',1,NULL),(49,'400759060115',70000,'pending','2025-04-21 14:27:45.468424',1,NULL),(50,'152996620567',70000,'failed','2025-04-21 14:28:09.550691',1,NULL),(51,'227146399317',200000,'completed','2025-04-21 14:28:26.901558',1,9),(52,'115477594467',70000,'pending','2025-04-21 18:53:56.463269',1,NULL);
/*!40000 ALTER TABLE `payment_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_subscription`
--

DROP TABLE IF EXISTS `payment_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_subscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `plan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_subscription_user_id_35d2e9ed_fk_auth_user_id` (`user_id`),
  KEY `payment_subscription_plan_id_24075be7_fk_payment_s` (`plan_id`),
  CONSTRAINT `payment_subscription_plan_id_24075be7_fk_payment_s` FOREIGN KEY (`plan_id`) REFERENCES `payment_subscriptionplan` (`id`),
  CONSTRAINT `payment_subscription_user_id_35d2e9ed_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_subscription`
--

LOCK TABLES `payment_subscription` WRITE;
/*!40000 ALTER TABLE `payment_subscription` DISABLE KEYS */;
INSERT INTO `payment_subscription` VALUES (9,'2025-04-21 14:28:53.510383','2025-07-20 14:28:53.510383',1,1,2);
/*!40000 ALTER TABLE `payment_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_subscriptionplan`
--

DROP TABLE IF EXISTS `payment_subscriptionplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_subscriptionplan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `duration_months` int NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_subscriptionplan`
--

LOCK TABLES `payment_subscriptionplan` WRITE;
/*!40000 ALTER TABLE `payment_subscriptionplan` DISABLE KEYS */;
INSERT INTO `payment_subscriptionplan` VALUES (1,'Gói Cơ Bản',1,70000),(2,'Gói Tiết Kiệm',3,200000),(3,'Gói Năm',6,400000);
/*!40000 ALTER TABLE `payment_subscriptionplan` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_comment`
--

LOCK TABLES `user_interactions_comment` WRITE;
/*!40000 ALTER TABLE `user_interactions_comment` DISABLE KEYS */;
INSERT INTO `user_interactions_comment` VALUES (18,'admi','2025-04-17 09:18:04.959603',12,1),(19,'hay','2025-04-18 08:11:18.542462',14,1),(20,'fda','2025-04-21 18:59:23.998620',19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_like`
--

LOCK TABLES `user_interactions_like` WRITE;
/*!40000 ALTER TABLE `user_interactions_like` DISABLE KEYS */;
INSERT INTO `user_interactions_like` VALUES (31,'2025-04-21 18:36:04.263743',15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_rating`
--

LOCK TABLES `user_interactions_rating` WRITE;
/*!40000 ALTER TABLE `user_interactions_rating` DISABLE KEYS */;
INSERT INTO `user_interactions_rating` VALUES (6,4,'2025-04-17 06:38:16.894664',21,3),(7,3,'2025-04-17 07:35:52.454833',12,1),(8,3,'2025-04-17 07:57:27.139407',13,1),(9,2,'2025-04-18 08:11:12.389681',14,1),(10,3,'2025-04-21 14:08:17.440598',24,1),(11,4,'2025-04-21 14:17:41.093855',25,1),(12,3,'2025-04-21 18:59:27.290707',19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_userlist`
--

LOCK TABLES `user_interactions_userlist` WRITE;
/*!40000 ALTER TABLE `user_interactions_userlist` DISABLE KEYS */;
INSERT INTO `user_interactions_userlist` VALUES (1,'2025-04-08 15:11:40.550000',1),(2,'2025-04-10 11:56:18.853971',2),(3,'2025-04-17 04:45:13.352762',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_userlist_actors`
--

LOCK TABLES `user_interactions_userlist_actors` WRITE;
/*!40000 ALTER TABLE `user_interactions_userlist_actors` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interactions_userlist_movies`
--

LOCK TABLES `user_interactions_userlist_movies` WRITE;
/*!40000 ALTER TABLE `user_interactions_userlist_movies` DISABLE KEYS */;
INSERT INTO `user_interactions_userlist_movies` VALUES (35,1,13),(34,1,14),(30,1,19),(19,3,18),(15,3,24);
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

-- Dump completed on 2025-04-21 19:00:42
