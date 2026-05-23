-- DDl.sql: schema (CREATE TABLE) extracted from mysqldump
-- Source: /Users/anandmohan/Data/Activity/DBBackUp/dump-activity_prod-202605101424
-- Database: activity_prod | Server: MySQL 8.0.44

-- MySQL dump 10.13  Distrib 9.6.0, for macos15.7 (arm64)
--
-- Host: 127.0.0.1    Database: activity_prod
-- ------------------------------------------------------
-- Server version	8.0.44

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

--

-- Table structure for table `activity`

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `a_user_id` int NOT NULL,
  `a_start_date_time` datetime NOT NULL,
  `a_start_latitude` decimal(10,8) NOT NULL,
  `a_start_longitude` decimal(11,8) NOT NULL,
  `a_end_date_time` datetime NOT NULL,
  `a_end_latitude` decimal(10,8) DEFAULT NULL,
  `a_end_longitude` decimal(11,8) DEFAULT NULL,
  `a_total_steps` int DEFAULT NULL,
  `a_calories_burned` float DEFAULT NULL,
  `a_amount` int DEFAULT NULL,
  `a_total_duration` int DEFAULT NULL,
  `a_distance_covered` float DEFAULT NULL,
  `a_cause_id` int DEFAULT NULL,
  `a_type` enum('Walking','Running','Cycling','Passive') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `a_metric_type` enum('KM','MI') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `a_event_id` int DEFAULT '0',
  `a_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `a_map_image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `a_user_id` (`a_user_id`),
  CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`a_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `activity_configuration`

DROP TABLE IF EXISTS `activity_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_configuration` (
  `id` int NOT NULL,
  `value` text NOT NULL,
  `type` enum('donation','general') DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `is_deleted` tinyint DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  UNIQUE KEY `unique_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `activity_images`

DROP TABLE IF EXISTS `activity_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ai_activity_id` int DEFAULT NULL,
  `ai_photo_url` varchar(255) NOT NULL,
  `ai_latitude` decimal(10,8) DEFAULT NULL,
  `ai_longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ai_activity_id` (`ai_activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `ad_video_url`

DROP TABLE IF EXISTS `ad_video_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_video_url` (
  `id` int NOT NULL,
  `video_url` varchar(200) NOT NULL,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `admin_users`

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `au_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `au_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `au_email_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `au_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `au_role_id` int NOT NULL,
  `au_is_administrator` tinyint NOT NULL,
  `au_profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `au_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `app_versions`

DROP TABLE IF EXISTS `app_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `av_platform` enum('Android','iOS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `av_version_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `av_release_date` date NOT NULL,
  `av_is_mandatory_update` tinyint(1) DEFAULT '0',
  `av_release_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `av_update_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `badge_mst`

DROP TABLE IF EXISTS `badge_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('streak','cause_donation') DEFAULT NULL,
  `required_value` int DEFAULT NULL,
  `image` text,
  `status` enum('active','inactive') DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `bulk_notification`

DROP TABLE IF EXISTS `bulk_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulk_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bn_title` varchar(255) NOT NULL,
  `bn_type` varchar(255) NOT NULL,
  `bn_message` text NOT NULL,
  `bn_success_count` int DEFAULT '0',
  `bn_failed_count` int DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `cause_mst`

DROP TABLE IF EXISTS `cause_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cause_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cm_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cm_sponsor_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cm_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cm_about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cm_goal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `cm_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cm_total_amount` bigint DEFAULT '0',
  `cm_donated_amount` bigint DEFAULT '0',
  `cm_badge_id` int DEFAULT NULL,
  `cm_change_makers` bigint DEFAULT '0',
  `cm_status` enum('active','inactive','completed') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_email_send` tinyint(1) DEFAULT '0',
  `is_deleted` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `challenges`

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_price` decimal(10,2) NOT NULL,
  `c_start_date` date NOT NULL,
  `c_end_date` date NOT NULL,
  `c_benefits` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `c_distance` int DEFAULT NULL,
  `c_type` enum('day','distance') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_privacy_type` enum('public','private','team') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `c_last_date_to_register` date DEFAULT NULL,
  `c_activity_max_km` float NOT NULL DEFAULT '0',
  `c_passive_max_km` float NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `city`

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `coins_mst`

DROP TABLE IF EXISTS `coins_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coins_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cm_name` varchar(255) NOT NULL,
  `cm_type` enum('goal_achieved','level','badge_achieved') NOT NULL,
  `cm_coin_value` int NOT NULL,
  `cm_image` varchar(255) DEFAULT NULL,
  `cm_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `cron_settings`

DROP TABLE IF EXISTS `cron_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cron_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) NOT NULL,
  `cron_expression` varchar(50) NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `event`

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `e_category_id` int DEFAULT NULL,
  `e_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_date` date NOT NULL,
  `e_distance` float DEFAULT NULL,
  `e_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `e_created_by` int NOT NULL,
  `e_status` enum('Active','Inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Inactive',
  `e_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_benefits` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_state` int DEFAULT NULL,
  `e_city` int DEFAULT NULL,
  `e_register_close_date` date DEFAULT NULL,
  `e_register_event_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_price` int NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `e_category_id` (`e_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `event_category`

DROP TABLE IF EXISTS `event_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ec_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ec_status` tinyint NOT NULL DEFAULT '1',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `exclusive_team_challenges_enquiry`

DROP TABLE IF EXISTS `exclusive_team_challenges_enquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exclusive_team_challenges_enquiry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etce_user_id` int NOT NULL,
  `etce_full_name` varchar(255) NOT NULL,
  `etce_organization_name` varchar(255) NOT NULL,
  `etce_company_email` varchar(255) NOT NULL,
  `etce_phone_number` varchar(15) NOT NULL,
  `etce_status` enum('open','closed','pending') NOT NULL DEFAULT 'open',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `faq_content`

DROP TABLE IF EXISTS `faq_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fc_menu_id` int NOT NULL,
  `fc_content` longtext,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `faq_mst`

DROP TABLE IF EXISTS `faq_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fm_parent_id` int DEFAULT NULL,
  `fm_title` varchar(255) DEFAULT NULL,
  `fm_short_description` varchar(255) DEFAULT NULL,
  `fm_status` enum('active','inactive') NOT NULL,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `menu_mst`

DROP TABLE IF EXISTS `menu_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mm_menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mm_parent_menu_id` int DEFAULT NULL,
  `mm_order` int DEFAULT '0',
  `mm_icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `mm_parent_menu_id` (`mm_parent_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `notification_mst`

DROP TABLE IF EXISTS `notification_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_mst` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nm_user_id` int NOT NULL,
  `nm_title` varchar(255) NOT NULL,
  `nm_message` text NOT NULL,
  `nm_type` enum('request','accepted','rejected','achieved','claps','comments','admin','challenges_registered_upcoming','challenges_registered_ongoing','challenges_registered_completed','challenges_not_registered','team_yesterday_winner','team_monthly_winner') DEFAULT NULL,
  `nm_target_type` enum('all_users','free_users','pro_users','users') DEFAULT 'users',
  `nm_ref_id` int DEFAULT NULL,
  `nm_ref_user_id` int DEFAULT NULL,
  `nm_notification_status` enum('sent','scheduled') NOT NULL DEFAULT 'sent',
  `nm_schedule_date_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `offer_mst`

DROP TABLE IF EXISTS `offer_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `om_title` varchar(100) NOT NULL,
  `om_description` text,
  `om_short_description` varchar(250) DEFAULT NULL,
  `om_code` varchar(55) NOT NULL,
  `om_offer_value` int NOT NULL,
  `om_coins` int DEFAULT '0',
  `om_end_date` datetime NOT NULL,
  `om_image_url` varchar(250) DEFAULT NULL,
  `om_web_url` varchar(255) DEFAULT NULL,
  `om_status` enum('active','inactive') DEFAULT 'active',
  `is_deleted` tinyint DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `om_code` (`om_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `role_access_mst`

DROP TABLE IF EXISTS `role_access_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_access_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rm_role_id` int NOT NULL,
  `rm_menu_id` int NOT NULL,
  `rm_add` int NOT NULL DEFAULT '0',
  `rm_edit` int NOT NULL DEFAULT '0',
  `rm_view` int NOT NULL DEFAULT '0',
  `rm_delete` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rm_role_id` (`rm_role_id`),
  KEY `rm_menu_id` (`rm_menu_id`),
  CONSTRAINT `role_access_mst_ibfk_1` FOREIGN KEY (`rm_role_id`) REFERENCES `role_mst` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `role_mst`

DROP TABLE IF EXISTS `role_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rm_role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `schedule_notification`

DROP TABLE IF EXISTS `schedule_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sn_title` varchar(255) NOT NULL,
  `sn_message` text,
  `sn_target_type` varchar(255) DEFAULT NULL,
  `sn_ref_id` int DEFAULT NULL,
  `sn_register_type` varchar(255) DEFAULT NULL,
  `is_save` tinyint NOT NULL DEFAULT '0',
  `sn_date_time` datetime DEFAULT NULL,
  `sn_status` enum('sent','scheduled') NOT NULL DEFAULT 'scheduled',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `state`

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `subscription_plan_mst`

DROP TABLE IF EXISTS `subscription_plan_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_plan_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spm_name` varchar(255) NOT NULL,
  `spm_validity_days` int NOT NULL,
  `spm_discount_percentage` float DEFAULT '0',
  `spm_amount` int NOT NULL,
  `spm_renewal_type` enum('onetime','recurring') NOT NULL,
  `spm_plan_id` varchar(255) DEFAULT NULL,
  `spm_status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `team_post`

DROP TABLE IF EXISTS `team_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tp_team_id` int NOT NULL,
  `tp_user_post_id` int NOT NULL,
  `tp_comments_count` int NOT NULL DEFAULT '0',
  `tp_claps_count` int NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_post_ibfk_1` (`tp_user_post_id`),
  CONSTRAINT `team_post_ibfk_1` FOREIGN KEY (`tp_user_post_id`) REFERENCES `user_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `team_post_claps`

DROP TABLE IF EXISTS `team_post_claps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_post_claps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tpcl_post_id` int NOT NULL,
  `tpcl_user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1833 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `team_post_comments`

DROP TABLE IF EXISTS `team_post_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_post_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tpc_post_id` int NOT NULL,
  `tpc_user_id` int NOT NULL,
  `tpc_comments` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `team_type_mst`

DROP TABLE IF EXISTS `team_type_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_type_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uttm_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `teams`

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `t_cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `t_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `t_team_type` enum('Family','Friends','Work','Running group','Corporate','Public') COLLATE utf8mb4_general_ci NOT NULL,
  `t_approval_required` tinyint(1) NOT NULL DEFAULT '1',
  `t_status` enum('active','inactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'active',
  `t_created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `t_created_by` (`t_created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `training_videos`

DROP TABLE IF EXISTS `training_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tv_video_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tv_video_type` enum('free','pro') COLLATE utf8mb4_general_ci NOT NULL,
  `tv_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_deleted` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_badges`

DROP TABLE IF EXISTS `user_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_badges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ub_user_id` int NOT NULL,
  `ub_badge_id` int NOT NULL,
  `ub_progress` float DEFAULT NULL,
  `earned_status` enum('earned','not_earned') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'not_earned',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ub_user_id` (`ub_user_id`),
  KEY `ub_badge_id` (`ub_badge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2281 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_challenges`

DROP TABLE IF EXISTS `user_challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_challenges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uc_user_id` int NOT NULL,
  `uc_challenge_id` int DEFAULT NULL,
  `uc_team_id` int DEFAULT NULL,
  `uc_user_transaction_id` int DEFAULT NULL,
  `uc_kilometers` float DEFAULT NULL,
  `uc_donated_amount` int DEFAULT NULL,
  `uc_streak_count` int DEFAULT NULL,
  `uc_total_activity_km` float NOT NULL DEFAULT '0',
  `uc_total_passive_km` float NOT NULL DEFAULT '0',
  `uc_gift_voucher` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_challenge` (`uc_user_id`,`uc_challenge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_challenges_history`

DROP TABLE IF EXISTS `user_challenges_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_challenges_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uch_user_id` int NOT NULL,
  `uch_challenge_id` int NOT NULL,
  `uch_activity_type` enum('Active','Passive') NOT NULL,
  `uch_distance` float NOT NULL DEFAULT '0',
  `uch_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `uch_date` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4583 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_coins`

DROP TABLE IF EXISTS `user_coins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_coins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uc_user_id` int NOT NULL,
  `uc_coin_id` int NOT NULL,
  `uc_description` varchar(255) NOT NULL,
  `uc_coins` int NOT NULL,
  `uc_claimed_status` tinyint DEFAULT '0',
  `uc_goal_achieved_date` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uc_user_id` (`uc_user_id`),
  CONSTRAINT `user_coins_ibfk_1` FOREIGN KEY (`uc_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10862 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_donations`

DROP TABLE IF EXISTS `user_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ud_user_id` int NOT NULL,
  `ud_cause_id` int NOT NULL,
  `ud_kms` float NOT NULL,
  `ud_donated_steps` bigint NOT NULL,
  `ud_donated_amount` int NOT NULL,
  `ud_activity_type` enum('Walking','Running','Cycling','Passive') NOT NULL,
  `ud_donated_date` date NOT NULL,
  `ud_donation_key` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30373 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_events`

DROP TABLE IF EXISTS `user_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ue_user_id` int NOT NULL,
  `ue_event_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ue_user_id` (`ue_user_id`),
  KEY `ue_event_id` (`ue_event_id`),
  CONSTRAINT `user_events_ibfk_1` FOREIGN KEY (`ue_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_events_ibfk_2` FOREIGN KEY (`ue_event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_goal_achieved_history`

DROP TABLE IF EXISTS `user_goal_achieved_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_goal_achieved_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ugah_user_id` int NOT NULL,
  `ugah_date` date NOT NULL,
  `ugah_kms` float NOT NULL,
  `ugah_completed_percentage` float NOT NULL,
  `ugah_is_streak` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18892 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_offer`

DROP TABLE IF EXISTS `user_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_offer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uo_user_id` int NOT NULL,
  `uo_offer_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uo_offer_id` (`uo_offer_id`),
  CONSTRAINT `user_offer_ibfk_1` FOREIGN KEY (`uo_offer_id`) REFERENCES `offer_mst` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_post`

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `up_user_id` int NOT NULL,
  `up_post_type` enum('passive','activity','goal','badge','yesterday_winner_post','monthly_winner_post') NOT NULL,
  `up_activity_type` enum('Walking','Running','Cycling','Passive') DEFAULT NULL,
  `up_cause_id` int DEFAULT NULL,
  `up_badge_id` int DEFAULT NULL,
  `up_steps` int DEFAULT '0',
  `up_km` float DEFAULT '0',
  `up_donated_amount` float DEFAULT '0',
  `up_day_streak_count` int DEFAULT '0',
  `up_max_streak_count` int DEFAULT '0',
  `up_donation_date` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_post_ibfk_1` (`up_user_id`),
  KEY `user_post_ibfk_2` (`up_cause_id`),
  KEY `user_post_ibfk_3` (`up_badge_id`),
  CONSTRAINT `user_post_ibfk_1` FOREIGN KEY (`up_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_post_ibfk_2` FOREIGN KEY (`up_cause_id`) REFERENCES `cause_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_post_ibfk_3` FOREIGN KEY (`up_badge_id`) REFERENCES `badge_mst` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=40881 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_reward_history`

DROP TABLE IF EXISTS `user_reward_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reward_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `urh_user_id` int NOT NULL,
  `urh_title` varchar(255) NOT NULL,
  `urh_image_url` varchar(255) DEFAULT NULL,
  `urh_value` int NOT NULL,
  `urh_type` enum('earned','spend') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_steps`

DROP TABLE IF EXISTS `user_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_steps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `us_user_id` int NOT NULL,
  `us_km` float NOT NULL,
  `us_kcal` float NOT NULL,
  `us_liters` float NOT NULL,
  `us_steps` bigint NOT NULL,
  `us_amount` int DEFAULT '0',
  `us_date` date NOT NULL,
  `us_is_donated` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23717 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_steps_details`

DROP TABLE IF EXISTS `user_steps_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_steps_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usd_user_steps_id` int NOT NULL,
  `usd_start_time` datetime NOT NULL,
  `usd_end_time` datetime NOT NULL,
  `usd_steps` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usd_user_steps_id` (`usd_user_steps_id`),
  CONSTRAINT `user_steps_details_ibfk_1` FOREIGN KEY (`usd_user_steps_id`) REFERENCES `user_steps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=302878 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_subscription_history`

DROP TABLE IF EXISTS `user_subscription_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subscription_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `us_user_id` int NOT NULL,
  `us_subscription_id` int NOT NULL,
  `us_transaction_id` int NOT NULL,
  `us_start_date` date NOT NULL,
  `us_end_date` date NOT NULL,
  `us_subscription_plan_name` varchar(255) NOT NULL,
  `us_subscription_duration` int NOT NULL,
  `us_renewal_type` enum('onetime','recurring') DEFAULT NULL,
  `us_subscription_status` enum('active','cancelled') DEFAULT NULL,
  `us_cancellation_reason` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_teams`

DROP TABLE IF EXISTS `user_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ut_user_id` int NOT NULL,
  `ut_team_id` int NOT NULL,
  `ut_member_status` enum('requested','member','admin','super_admin','removed','rejected','left') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ut_user_team` (`ut_user_id`,`ut_team_id`),
  KEY `ut_user_id` (`ut_user_id`),
  KEY `ut_team_id` (`ut_team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=864 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `user_transaction`

DROP TABLE IF EXISTS `user_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ut_user_id` int NOT NULL,
  `ut_order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ut_order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ut_payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ut_amount` int NOT NULL,
  `ut_payment_status` enum('pending','success','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `ut_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ut_receipt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ut_user_id` (`ut_user_id`),
  CONSTRAINT `user_transaction_ibfk_1` FOREIGN KEY (`ut_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `users`

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_phone_number` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_gender` enum('M','F','O') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_date_of_birth` date DEFAULT NULL,
  `u_weight` float DEFAULT NULL,
  `u_weight_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_height` float DEFAULT NULL,
  `u_height_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_user_active_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_user_exercise_pattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_expereince_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_goal` int DEFAULT NULL,
  `u_metric_type` enum('KM','MI') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_reminder_time` time DEFAULT NULL,
  `u_bmi` float DEFAULT NULL,
  `u_bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_user_type` int DEFAULT NULL,
  `u_social_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_otp` int DEFAULT NULL,
  `u_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `u_is_onboarding_completed` tinyint DEFAULT '0',
  `u_on_boarding_notification_reminder_count` int DEFAULT '0',
  `u_subscription_status` enum('free','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'free',
  `u_total_kms` float DEFAULT '0',
  `u_total_donated_steps` int unsigned DEFAULT '0',
  `u_total_donated_amount` int unsigned DEFAULT '0',
  `u_current_streak` int DEFAULT '0',
  `u_max_streak` int DEFAULT '0',
  `u_level` int DEFAULT '0',
  `u_level_progress` float DEFAULT '0',
  `u_coins` int DEFAULT '0',
  `u_run_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_currect_streak_verified_dt` date DEFAULT NULL,
  `u_platform` enum('Android','iOS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_app_version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_device_model` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_os_version` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_time_zone` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_locale` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `u_user_status` tinyint DEFAULT '1',
  `is_deleted` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`u_email`)
) ENGINE=InnoDB AUTO_INCREMENT=12248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



-- Table structure for table `water_consumed`

DROP TABLE IF EXISTS `water_consumed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `water_consumed` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wc_user_id` int NOT NULL,
  `wc_liters_consumed` float NOT NULL,
  `wc_date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_user_id` (`wc_user_id`),
  CONSTRAINT `water_consumed_ibfk_1` FOREIGN KEY (`wc_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=952 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;





-- =============================================================================
-- TABLE TO SEQUELIZE MODEL MAPPINGS (see src/models/index.js)
-- =============================================================================
-- activity                      -> src/models/activity.model.js                    (Activity)
-- activity_configuration        -> src/models/activityconfiguration.model.js       (ActivityConfiguration)
-- activity_images               -> src/models/activityimage.model.js               (ActivityImage)
-- ad_video_url                  -> src/models/advideourl.model.js                  (AdVideoUrl)
-- admin_users                   -> src/models/admin/adminuser.model.js             (AdminUser)
-- app_versions                  -> src/models/appconfig.model.js                   (AppConfig)
-- badge_mst                     -> src/models/badge.model.js                       (BadgeMst)
-- bulk_notification             -> src/models/bulknotification.model.js            (BulkNotification)
-- cause_mst                     -> src/models/cause.model.js                       (CauseMst)
-- challenges                    -> src/models/challenges.model.js                  (Challenges)
-- city                          -> src/models/admin/city.model.js                  (City)
-- coins_mst                     -> src/models/coin.model.js                        (Coin)
-- cron_settings                 -> src/models/cronsettings.model.js                (CronSetting)
-- event                         -> src/models/event.model.js                       (Event)
-- event_category                -> src/models/eventcategory.model.js               (EventCategory)
-- exclusive_team_challenges_enquiry -> src/models/challengesenquery.model.js     (ExclusiveTeamChallengesEnquiry)
-- faq_content                   -> src/models/faqcontent.model.js                  (FaqContent)
-- faq_mst                       -> src/models/helpcenter.model.js                  (HelpCenter)
-- menu_mst                      -> src/models/admin/menu.model.js                  (Menu)
-- notification_mst              -> src/models/notification.model.js                (Notification)
-- offer_mst                     -> src/models/offer.model.js                       (Offer)
-- role_access_mst               -> src/models/admin/rolepermission.model.js          (RolePermission)
-- role_mst                      -> src/models/admin/rolemaster.model.js              (RoleMaster)
-- schedule_notification         -> src/models/schedulenotification.model.js          (ScheduleNotification)
-- state                         -> src/models/admin/state.model.js                   (State)
-- subscription_plan_mst         -> src/models/subscriptionplan.model.js              (SubscriptionPlan)
-- team_post                     -> src/models/teampost.model.js                      (TeamPost)
-- team_post_claps               -> src/models/teampostclaps.model.js                 (TeamPostClap)
-- team_post_comments            -> src/models/teampostcomments.model.js              (TeamPostComment)
-- team_type_mst                 -> src/models/teamtypemaster.model.js                (TeamTypeMaster)
-- teams                         -> src/models/teams.model.js                         (Teams)
-- training_videos               -> src/models/trainingvideos.model.js                (TrainingVideo)
-- user_badges                   -> src/models/userbadge.model.js                     (UserBadges)
-- user_challenges               -> src/models/userchallenges.model.js                (UserChallenge)
-- user_challenges_history       -> src/models/userchallengeshistory.model.js         (UserChallengesHistory)
-- user_coins                    -> src/models/usercoins.model.js                     (UserCoins)
-- user_donations                -> src/models/userdonations.model.js                 (UserDonation)
-- user_events                   -> src/models/userevents.model.js                    (UserEvents)
-- user_goal_achieved_history    -> src/models/usergoalachievedhistory.model.js       (UserGoalAchievedHistory)
-- user_offer                    -> src/models/useroffer.model.js                     (UserOffer)
-- user_post                     -> src/models/userpost.model.js                      (UserPost)
-- user_reward_history           -> src/models/userrewardhistory.model.js             (UserRewardHistory)
-- user_steps                    -> src/models/usersteps.model.js                     (UserSteps)
-- user_steps_details            -> src/models/userstepsdetails.model.js              (UserStepsDetails)
-- user_subscription_history     -> src/models/usersubscriptionhistory.model.js       (UserSubscriptionHistory)
-- user_teams                    -> src/models/userteams.model.js                     (UserTeams)
-- user_transaction              -> src/models/usertransaction.model.js               (UserTransaction)
-- users                         -> src/models/user.model.js                          (User)
-- water_consumed                -> src/models/waterconsumed.model.js                 (WaterConsumed)

-- =============================================================================
-- FOREIGN KEY MAPPINGS (constraint name, column -> referenced table.column)
-- =============================================================================
-- activity_ibfk_1:              `activity`.`a_user_id`              -> `users`.`id`              ON DELETE CASCADE ON UPDATE CASCADE
-- city_ibfk_1:                  `city`.`state_id`                   -> `state`.`id`              ON DELETE CASCADE
-- role_access_mst_ibfk_1:       `role_access_mst`.`rm_role_id`      -> `role_mst`.`id`
-- team_post_ibfk_1:             `team_post`.`tp_user_post_id`         -> `user_post`.`id`          ON DELETE CASCADE ON UPDATE CASCADE
-- user_steps_details_ibfk_1:    `user_steps_details`.`usd_user_steps_id` -> `user_steps`.`id`     ON DELETE CASCADE ON UPDATE CASCADE
-- user_coins_ibfk_1:            `user_coins`.`uc_user_id`           -> `users`.`id`              ON DELETE CASCADE
-- user_events_ibfk_1:           `user_events`.`ue_user_id`          -> `users`.`id`              ON DELETE CASCADE
-- user_events_ibfk_2:           `user_events`.`ue_event_id`         -> `event`.`id`              ON DELETE CASCADE
-- user_offer_ibfk_1:            `user_offer`.`uo_offer_id`          -> `offer_mst`.`id`            ON DELETE CASCADE ON UPDATE CASCADE
-- user_post_ibfk_1:             `user_post`.`up_user_id`            -> `users`.`id`              ON DELETE RESTRICT ON UPDATE RESTRICT
-- user_post_ibfk_2:             `user_post`.`up_cause_id`           -> `cause_mst`.`id`            ON DELETE RESTRICT ON UPDATE RESTRICT
-- user_post_ibfk_3:             `user_post`.`up_badge_id`           -> `badge_mst`.`id`            ON DELETE RESTRICT ON UPDATE RESTRICT
-- user_transaction_ibfk_1:      `user_transaction`.`ut_user_id`     -> `users`.`id`              ON DELETE CASCADE
-- water_consumed_ibfk_1:        `water_consumed`.`wc_user_id`       -> `users`.`id`              ON DELETE CASCADE ON UPDATE CASCADE

-- =============================================================================
-- INDEX MAPPINGS (logical relationships, no formal FK constraint in schema)
-- =============================================================================
-- activity_images.ai_activity_id     -> activity.id
-- event.e_category_id                  -> event_category.id
-- menu_mst.mm_parent_menu_id           -> menu_mst.id (self-reference)
-- role_access_mst.rm_menu_id           -> menu_mst.id
-- teams.t_created_by                   -> users.id
-- user_badges.ub_user_id               -> users.id
-- user_badges.ub_badge_id              -> badge_mst.id
-- user_teams.ut_user_id                -> users.id
-- user_teams.ut_team_id                -> teams.id
-- faq_content.fc_menu_id               -> menu_mst.id
-- cause_mst.cm_badge_id                -> badge_mst.id
-- user_coins.uc_coin_id                -> coins_mst.id
-- admin_users.au_role_id                 -> role_mst.id
