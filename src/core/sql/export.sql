-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 28, 2026 at 12:37 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rc_strata`
--

-- --------------------------------------------------------

--
-- Table structure for table `core_ai_page`
--

DROP TABLE IF EXISTS `core_ai_page`;
CREATE TABLE IF NOT EXISTS `core_ai_page` (
  `id_ai_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `prompt` text NOT NULL,
  PRIMARY KEY (`id_ai_page`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_ai_page`
--

INSERT INTO `core_ai_page` (`id_ai_page`, `id_page`, `prompt`) VALUES
(1, 14, 'Generate modern contact page for Small Software Agency, use only static elements, do not add contact us form');

-- --------------------------------------------------------

--
-- Table structure for table `core_domain`
--

DROP TABLE IF EXISTS `core_domain`;
CREATE TABLE IF NOT EXISTS `core_domain` (
  `id_domain` int NOT NULL AUTO_INCREMENT,
  `protocol` varchar(8) NOT NULL DEFAULT 'http',
  `host` varchar(255) NOT NULL,
  `port` int NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `cost` int NOT NULL DEFAULT '1',
  `is_enabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_external_page`
--

DROP TABLE IF EXISTS `core_external_page`;
CREATE TABLE IF NOT EXISTS `core_external_page` (
  `id_external_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `url` varchar(1024) NOT NULL,
  PRIMARY KEY (`id_external_page`),
  KEY `id_page` (`id_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_directory`
--

DROP TABLE IF EXISTS `core_fs_directory`;
CREATE TABLE IF NOT EXISTS `core_fs_directory` (
  `id_fs_directory` int NOT NULL AUTO_INCREMENT,
  `id_fs_parent` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fs_directory`),
  KEY `id_fs_parent` (`id_fs_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_file`
--

DROP TABLE IF EXISTS `core_fs_file`;
CREATE TABLE IF NOT EXISTS `core_fs_file` (
  `id_fs_file` int NOT NULL AUTO_INCREMENT,
  `id_fs_parent` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `extension` varchar(16) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `type` varchar(128) NOT NULL,
  `size` mediumtext NOT NULL,
  PRIMARY KEY (`id_fs_file`),
  KEY `id_fs_parent` (`id_fs_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_image_variant`
--

DROP TABLE IF EXISTS `core_fs_image_variant`;
CREATE TABLE IF NOT EXISTS `core_fs_image_variant` (
  `id_fs_image_variant` int NOT NULL AUTO_INCREMENT,
  `transformer` varchar(255) NOT NULL,
  `version` int DEFAULT '1',
  `quality` float DEFAULT '1',
  `function` varchar(255) NOT NULL,
  `width` int DEFAULT '-1',
  `height` int DEFAULT '-1',
  PRIMARY KEY (`id_fs_image_variant`),
  UNIQUE KEY `transformer` (`transformer`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_fs_image_variant`
--

INSERT INTO `core_fs_image_variant` (`id_fs_image_variant`, `transformer`, `version`, `quality`, `function`, `width`, `height`) VALUES
(1, 'full-hd', 1, 1, 'fit', 1920, 1080),
(2, 'hd', 1, 1, 'fit', 1280, 720);

-- --------------------------------------------------------

--
-- Table structure for table `core_fs_shortcut`
--

DROP TABLE IF EXISTS `core_fs_shortcut`;
CREATE TABLE IF NOT EXISTS `core_fs_shortcut` (
  `id_fs_shortcut` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `id_fs_file` int NOT NULL,
  PRIMARY KEY (`id_fs_shortcut`),
  UNIQUE KEY `name` (`name`),
  KEY `id_fs_file` (`id_fs_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_group`
--

DROP TABLE IF EXISTS `core_group`;
CREATE TABLE IF NOT EXISTS `core_group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_group`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_group`
--

INSERT INTO `core_group` (`id_group`, `name`, `is_editable`) VALUES
(1, 'Default', 0),
(2, 'Root', 0),
(3, 'Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_groups_x_resources`
--

DROP TABLE IF EXISTS `core_groups_x_resources`;
CREATE TABLE IF NOT EXISTS `core_groups_x_resources` (
  `id_group` int NOT NULL,
  `id_resource` int NOT NULL,
  `id_privilege` int NOT NULL,
  UNIQUE KEY `id_group` (`id_group`,`id_resource`,`id_privilege`),
  KEY `id_resource` (`id_resource`),
  KEY `id_privilege` (`id_privilege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_language`
--

DROP TABLE IF EXISTS `core_language`;
CREATE TABLE IF NOT EXISTS `core_language` (
  `id_language` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_language`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_language`
--

INSERT INTO `core_language` (`id_language`, `code`, `is_default`) VALUES
(1, 'en-US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon`
--

DROP TABLE IF EXISTS `core_lexicon`;
CREATE TABLE IF NOT EXISTS `core_lexicon` (
  `id_phrase` int NOT NULL AUTO_INCREMENT,
  `id_lexicon_group` int NOT NULL,
  `default` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_dynamic` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_phrase`),
  KEY `id_lexicon_group` (`id_lexicon_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_group`
--

DROP TABLE IF EXISTS `core_lexicon_group`;
CREATE TABLE IF NOT EXISTS `core_lexicon_group` (
  `id_lexicon_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_lexicon_group`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_rule`
--

DROP TABLE IF EXISTS `core_lexicon_rule`;
CREATE TABLE IF NOT EXISTS `core_lexicon_rule` (
  `id_rule` int NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_rule`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_lexicon_rule`
--

INSERT INTO `core_lexicon_rule` (`id_rule`, `rule`, `label`) VALUES
(1, '/.*/', '*'),
(2, '/^1$/', '1'),
(3, '/^[2-4]$/', '2-4'),
(4, '/^0|[2-9]|\\d{2,}$/', '0, 2+'),
(5, '/^0|[5-9]|\\d{2,}$/', '0, 5+');

-- --------------------------------------------------------

--
-- Table structure for table `core_lexicon_translation`
--

DROP TABLE IF EXISTS `core_lexicon_translation`;
CREATE TABLE IF NOT EXISTS `core_lexicon_translation` (
  `id_translation` int NOT NULL AUTO_INCREMENT,
  `id_phrase` int NOT NULL,
  `id_language` int NOT NULL,
  `translation` text NOT NULL,
  `id_rule` int DEFAULT NULL,
  PRIMARY KEY (`id_translation`),
  KEY `id_phrase` (`id_phrase`),
  KEY `id_language` (`id_language`),
  KEY `id_rule` (`id_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_menu`
--

DROP TABLE IF EXISTS `core_menu`;
CREATE TABLE IF NOT EXISTS `core_menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_menu`
--

INSERT INTO `core_menu` (`id_menu`, `name`) VALUES
(1, 'Header'),
(2, 'Footer'),
(3, 'Legal');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu_x_pages`
--

DROP TABLE IF EXISTS `core_menu_x_pages`;
CREATE TABLE IF NOT EXISTS `core_menu_x_pages` (
  `id_menu` int NOT NULL,
  `id_page` int NOT NULL,
  UNIQUE KEY `id_menu` (`id_menu`,`id_page`),
  KEY `id_page` (`id_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_menu_x_pages`
--

INSERT INTO `core_menu_x_pages` (`id_menu`, `id_page`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 12),
(1, 14),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 12),
(2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `core_module`
--

DROP TABLE IF EXISTS `core_module`;
CREATE TABLE IF NOT EXISTS `core_module` (
  `identifier` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation`
--

DROP TABLE IF EXISTS `core_navigation`;
CREATE TABLE IF NOT EXISTS `core_navigation` (
  `id_slug` int NOT NULL AUTO_INCREMENT,
  `id_navigation_context` int NOT NULL,
  `id_parent` int DEFAULT NULL,
  `id_language` int NOT NULL,
  `slug` varchar(255) NOT NULL,
  `id_navigation_factory` int DEFAULT NULL,
  `data` varchar(255) DEFAULT '',
  PRIMARY KEY (`id_slug`),
  UNIQUE KEY `id_navigation_context` (`id_navigation_context`,`id_parent`,`id_language`,`slug`),
  KEY `id_parent` (`id_parent`),
  KEY `id_language` (`id_language`),
  KEY `id_navigation_factory` (`id_navigation_factory`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation`
--

INSERT INTO `core_navigation` (`id_slug`, `id_navigation_context`, `id_parent`, `id_language`, `slug`, `id_navigation_factory`, `data`) VALUES
(2, 1, NULL, 1, 'services', 1, '2'),
(3, 1, 2, 1, 'web-development', 1, '3'),
(4, 1, 2, 1, 'backend-systems', 1, '4'),
(5, 1, 2, 1, 'api-development', 1, '5'),
(6, 1, 2, 1, 'devops-infrastructure', 1, '6'),
(7, 1, NULL, 1, 'projects', 1, '7'),
(8, 1, 7, 1, 'project-detail', 1, '8'),
(9, 1, NULL, 1, 'about', 1, '9'),
(10, 1, 9, 1, 'team', 1, '10'),
(11, 1, 9, 1, 'mission', 1, '11'),
(12, 1, NULL, 1, 'blog', 1, '12'),
(13, 1, 12, 1, 'designing-effective-restful-apis-best-practices-and-considerations', 1, '13'),
(14, 1, NULL, 1, 'contact', 1, '14');

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation_context`
--

DROP TABLE IF EXISTS `core_navigation_context`;
CREATE TABLE IF NOT EXISTS `core_navigation_context` (
  `id_navigation_context` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_navigation_context`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation_context`
--

INSERT INTO `core_navigation_context` (`id_navigation_context`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `core_navigation_factory`
--

DROP TABLE IF EXISTS `core_navigation_factory`;
CREATE TABLE IF NOT EXISTS `core_navigation_factory` (
  `id_navigation_factory` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_navigation_factory`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_navigation_factory`
--

INSERT INTO `core_navigation_factory` (`id_navigation_factory`, `name`) VALUES
(1, 'page');

-- --------------------------------------------------------

--
-- Table structure for table `core_page`
--

DROP TABLE IF EXISTS `core_page`;
CREATE TABLE IF NOT EXISTS `core_page` (
  `id_page` int NOT NULL AUTO_INCREMENT,
  `id_page_parent` int DEFAULT NULL,
  `id_page_template` int NOT NULL,
  `id_page_status` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `publish` datetime DEFAULT NULL,
  `remove` datetime DEFAULT NULL,
  `priority` int DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `id_page_template` (`id_page_template`),
  KEY `id_page_status` (`id_page_status`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page`
--

INSERT INTO `core_page` (`id_page`, `id_page_parent`, `id_page_template`, `id_page_status`, `created`, `updated`, `publish`, `remove`, `priority`) VALUES
(2, NULL, 4, 2, '2026-04-25 15:18:42', '2026-04-25 13:49:54', NULL, NULL, 1),
(3, 2, 3, 2, '2026-04-25 15:18:42', '2026-04-25 13:50:44', NULL, NULL, 0),
(4, 2, 3, 2, '2026-04-25 15:18:42', '2026-04-25 13:52:18', NULL, NULL, 1),
(5, 2, 3, 2, '2026-04-25 15:18:42', '2026-04-25 13:53:53', NULL, NULL, 2),
(6, 2, 3, 2, '2026-04-25 15:18:42', '2026-04-25 13:57:26', NULL, NULL, 3),
(7, NULL, 4, 2, '2026-04-25 15:18:42', '2026-04-25 13:50:06', NULL, NULL, 2),
(8, 7, 3, 2, '2026-04-25 15:18:42', '2026-04-25 14:00:10', NULL, NULL, 0),
(9, NULL, 3, 2, '2026-04-25 15:18:42', '2026-04-25 13:46:39', NULL, NULL, 3),
(10, 9, 1, 1, '2026-04-25 15:18:42', '2026-04-25 15:18:42', NULL, NULL, 0),
(11, 9, 1, 1, '2026-04-25 15:18:42', '2026-04-25 15:18:42', NULL, NULL, 1),
(12, NULL, 4, 2, '2026-04-25 15:18:42', '2026-04-25 13:46:17', NULL, NULL, 4),
(13, 12, 3, 2, '2026-04-25 15:18:42', '2026-04-25 14:13:44', NULL, NULL, 0),
(14, NULL, 2, 2, '2026-04-25 15:18:42', '2026-04-25 13:41:18', NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_localization`
--

DROP TABLE IF EXISTS `core_page_localization`;
CREATE TABLE IF NOT EXISTS `core_page_localization` (
  `id_localized_page` int NOT NULL AUTO_INCREMENT,
  `id_page` int NOT NULL,
  `id_language` int NOT NULL,
  `id_slug` int NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id_localized_page`),
  KEY `id_page` (`id_page`),
  KEY `id_language` (`id_language`),
  KEY `id_slug` (`id_slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_localization`
--

INSERT INTO `core_page_localization` (`id_localized_page`, `id_page`, `id_language`, `id_slug`, `title`) VALUES
(2, 2, 1, 2, 'Services'),
(3, 3, 1, 3, 'Web Development'),
(4, 4, 1, 4, 'Backend Systems'),
(5, 5, 1, 5, 'API Development'),
(6, 6, 1, 6, 'DevOps / Infrastructure'),
(7, 7, 1, 7, 'Projects'),
(8, 8, 1, 8, 'Project Detail'),
(9, 9, 1, 9, 'About'),
(10, 10, 1, 10, 'Team'),
(11, 11, 1, 11, 'Mission'),
(12, 12, 1, 12, 'Blog'),
(13, 13, 1, 13, 'Designing Effective RESTful APIs: Best Practices and Considerations'),
(14, 14, 1, 14, 'Contact');

-- --------------------------------------------------------

--
-- Table structure for table `core_page_status`
--

DROP TABLE IF EXISTS `core_page_status`;
CREATE TABLE IF NOT EXISTS `core_page_status` (
  `id_page_status` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page_status`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_status`
--

INSERT INTO `core_page_status` (`id_page_status`, `name`, `is_editable`) VALUES
(1, 'Draft', 0),
(2, 'Public', 0),
(3, 'Archived', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_page_template`
--

DROP TABLE IF EXISTS `core_page_template`;
CREATE TABLE IF NOT EXISTS `core_page_template` (
  `id_page_template` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_page_template`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_page_template`
--

INSERT INTO `core_page_template` (`id_page_template`, `name`) VALUES
(2, 'AI Generated'),
(3, 'Article'),
(5, 'External'),
(4, 'Page Listing'),
(1, 'Text');

-- --------------------------------------------------------

--
-- Table structure for table `core_privilege`
--

DROP TABLE IF EXISTS `core_privilege`;
CREATE TABLE IF NOT EXISTS `core_privilege` (
  `id_privilege` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_privilege`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_privilege`
--

INSERT INTO `core_privilege` (`id_privilege`, `name`, `is_editable`) VALUES
(1, 'Read', 0),
(2, 'Create', 0),
(3, 'Update', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_related_pages`
--

DROP TABLE IF EXISTS `core_related_pages`;
CREATE TABLE IF NOT EXISTS `core_related_pages` (
  `id_source` int NOT NULL,
  `id_target` int NOT NULL,
  UNIQUE KEY `id_source` (`id_source`,`id_target`),
  KEY `id_target` (`id_target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_resource`
--

DROP TABLE IF EXISTS `core_resource`;
CREATE TABLE IF NOT EXISTS `core_resource` (
  `id_resource` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`id_resource`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_resource`
--

INSERT INTO `core_resource` (`id_resource`, `name`, `type`) VALUES
(1, 'Docs', 1),
(2, 'Pages', 1),
(3, 'File System', 1),
(4, 'Docs (Administration)', 1),
(5, 'Domains', 1),
(6, 'Localization', 1),
(7, 'System', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_setting`
--

DROP TABLE IF EXISTS `core_setting`;
CREATE TABLE IF NOT EXISTS `core_setting` (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_editable` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_setting`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_setting`
--

INSERT INTO `core_setting` (`id_setting`, `name`, `value`, `is_editable`) VALUES
(1, 'route-chasm-core:side-loader_hash-length', '4', 0),
(2, 'route-chasm-core:side-loader_max-retries', '128', 1),
(3, 'route-chasm-core:number_of_model_rows_in_grid', '20', 1),
(4, 'route-chasm-core:search_minimum_query_length', '3', 1),
(5, 'route-chasm-core:show_admin_login_in_footer', '1', 1),
(6, 'route-chasm-core:use_env_password_method', 'yes', 1),
(7, 'route-chasm-core:number_of_articles_per_listing_page', '21', 1),
(8, 'route-chasm-docs:search_dropdown_max_entries', '5', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_sideloader`
--

DROP TABLE IF EXISTS `core_sideloader`;
CREATE TABLE IF NOT EXISTS `core_sideloader` (
  `id_cache` int NOT NULL AUTO_INCREMENT,
  `hash` varchar(127) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cache`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_sideloader`
--

INSERT INTO `core_sideloader` (`id_cache`, `hash`, `path`) VALUES
(1, '6si9', 'C:\\programming\\php\\strata\\public\\js\\Binding.js'),
(2, 'TNof', 'C:\\programming\\php\\strata\\public\\js\\Components.js'),
(3, 'RxdD', 'C:\\programming\\php\\strata\\public\\js\\Impulse.js'),
(4, '-FHK', 'C:\\programming\\php\\strata\\public\\js\\NumberRange.js'),
(5, 'u32K', 'C:\\programming\\php\\strata\\public\\js\\Resizeable.js'),
(6, 'fmt9', 'C:\\programming\\php\\strata\\public\\js\\api.js'),
(7, 'x7w7', 'C:\\programming\\php\\strata\\public\\js\\dropdown.js'),
(8, 'Flpn', 'C:\\programming\\php\\strata\\public\\js\\main.js'),
(9, 'cW9C', 'C:\\programming\\php\\strata\\public\\js\\shortcut.js'),
(10, 'jpgT', 'C:\\programming\\php\\strata\\public\\js\\std.js'),
(11, 'C27f', 'C:\\programming\\php\\strata\\public\\js\\terminal.js'),
(12, 'FfOw', 'C:\\programming\\php\\strata\\public\\js\\window.js'),
(13, 'BpAw', 'C:\\programming\\php\\strata\\public\\css\\main.css'),
(14, 'AFUn', 'C:\\programming\\php\\strata\\public\\css\\resizeable.css'),
(15, 'kOJj', 'C:\\programming\\php\\strata\\public\\css\\window.css'),
(16, 'A_pp', 'C:\\programming\\php\\strata\\src\\components\\core\\jsml\\jsml.js'),
(17, 'qwS8', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\Nexus\\nexus.js'),
(18, 'x1P1', 'C:\\programming\\php\\strata\\src\\core\\fs\\fs.js'),
(19, 'X45_', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\User\\admin-user.js'),
(20, 'GCFO', 'C:\\programming\\php\\strata\\src\\components\\core\\Search\\search.js'),
(21, 'T9zn', 'C:\\programming\\php\\strata\\src\\components\\windows\\LanguageSelect\\language-select.js'),
(22, 'Bosl', 'C:\\programming\\php\\strata\\src\\core\\fs\\fs.css'),
(23, 'Z9Dq', 'C:\\programming\\php\\strata\\src\\components\\Home\\home.css'),
(24, 'Gfin', 'C:\\programming\\php\\strata\\src\\components\\core\\PageMenu\\header.css'),
(25, 'fBuQ', 'C:\\programming\\php\\strata\\src\\components\\core\\Search\\header-search.css'),
(26, 'bQPC', 'C:\\programming\\php\\strata\\src\\components\\core\\PageMenu\\footer.css'),
(27, 'ueB4', 'C:\\programming\\php\\strata\\src\\components\\layout\\Spotlight\\spotlight.js'),
(28, '8-8x', 'C:\\programming\\php\\strata\\src\\core\\forms\\form.js'),
(29, 's62c', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\Login\\admin-login.css'),
(30, 'e2zG', 'C:\\programming\\php\\strata\\src\\components\\layout\\Spotlight\\spotlight.css'),
(31, 'D8Gj', 'C:\\programming\\php\\strata\\src\\core\\forms\\form.css'),
(32, 'PYNx', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\Page\\page-editor.js'),
(33, 'dtkd', 'C:\\programming\\php\\strata\\src\\components\\core\\RoutedMenu\\menu.js'),
(34, 'ZWp9', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\Page\\page-editor.css'),
(35, '92Mw', 'C:\\programming\\php\\strata\\src\\components\\core\\WebPage\\admin-page.css'),
(36, 'FLIA', 'C:\\programming\\php\\strata\\src\\components\\core\\RoutedMenu\\menu.css'),
(37, 'a_sS', 'C:\\programming\\php\\strata\\src\\components\\layout\\Accordion\\accordion.js'),
(38, '1UZ7', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\Nexus\\nexus.css'),
(39, 'acap', 'C:\\programming\\php\\strata\\src\\components\\core\\BreadCrumbs\\bread-crumbs.css'),
(40, 'B1bp', 'C:\\programming\\php\\strata\\src\\components\\layout\\Grid\\grid.css'),
(41, 'vDfr', 'C:\\programming\\php\\strata\\src\\components\\core\\Pagination\\pagination-control.css'),
(42, 'EElp', 'C:\\programming\\php\\strata\\src\\components\\layout\\Accordion\\accordion.css'),
(43, 'BqKx', 'C:\\programming\\php\\strata\\src\\components\\core\\fs\\file-control.js'),
(44, '4t8n', 'C:\\programming\\php\\strata\\src\\components\\layout\\Tabs\\tabs.js'),
(45, 'wqSK', 'C:\\programming\\php\\strata\\src\\components\\core\\fs\\file-control.css'),
(46, 'k35n', 'C:\\programming\\php\\strata\\src\\components\\layout\\Tabs\\tabs.css'),
(47, 'WmWt', 'C:\\programming\\php\\strata\\src\\models\\extensions\\IsDefault\\is-default.js'),
(48, 'W4iO', 'C:\\programming\\php\\strata\\src\\components\\docs\\docs.js'),
(49, 'aCn1', 'C:\\programming\\php\\strata\\src\\models\\extensions\\Priority\\priority.js'),
(50, 'oMhS', 'C:\\programming\\php\\strata\\src\\models\\extensions\\Priority\\priority.css'),
(51, 'TcQ4', 'C:\\programming\\php\\strata\\src\\components\\pages\\AiGeneratedPage\\ai-page-generator.js'),
(52, 'Ww1b', 'C:\\programming\\php\\strata\\src\\components\\pages\\AiGeneratedPage\\ai-generated-page.js'),
(53, 'Qbyv', 'C:\\programming\\php\\strata\\src\\components\\pages\\AiGeneratedPage\\ai-generated-page.css'),
(54, '8PZp', 'C:\\programming\\php\\strata\\src\\components\\pages\\Article\\article-editor.js'),
(55, 'zeIN', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\markdown.js'),
(56, 'lpS5', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\md-tokenizer.js'),
(57, 'TblD', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\md-parser.js'),
(58, 'DtYt', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\md-gallery.js'),
(59, 'iOhw', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\Editor\\md-editor.js'),
(60, 'Y73M', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\markdown.css'),
(61, 'i_uQ', 'C:\\programming\\php\\strata\\src\\components\\core\\Markdown\\Editor\\md-editor.css'),
(62, 'T4n8', 'C:\\programming\\php\\strata\\src\\components\\pages\\Article\\article.js'),
(63, 'KjBF', 'C:\\programming\\php\\strata\\src\\components\\pages\\Article\\article.css'),
(64, 'b3yp', 'C:\\programming\\php\\strata\\src\\components\\core\\Admin\\FileSystem\\fs-mkdir.js'),
(65, 'i4ll', 'C:\\programming\\php\\strata\\src\\components\\core\\FileSystem\\fs-drop-area.js'),
(66, 'f5D0', 'C:\\programming\\php\\strata\\src\\components\\core\\FileSystem\\fs-drop-area.css'),
(67, '7PU8', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\lumora.js'),
(68, '-49d', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\Editor\\editor.js'),
(69, '63Xm', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\Editor\\inspector.js'),
(70, 'Qh4_', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\Editor\\widget-core.js'),
(71, '7oxO', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Code\\code.js'),
(72, 'GBz7', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\TextEditor\\text-editor.js'),
(73, 'DyKS', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Decoration\\decoration.js'),
(74, 'uBTX', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Link\\link.js'),
(75, '3uXN', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Command\\command.js'),
(76, 'nR_w', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\CommentSection\\comment-section.js'),
(77, 'Ocna', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Divider\\divider.js'),
(78, 'MGiS', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\FileDownload\\file-download.js'),
(79, 'Qdxh', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Header\\header.js'),
(80, 'YrQD', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Heading\\heading.js'),
(81, 'Weiu', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Image\\image.js'),
(82, 'tSkU', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\List\\list.js'),
(83, 'IIkN', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\ListItem\\list-item.js'),
(84, 'SSpX', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Page\\page.js'),
(85, 'RAiT', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Quote\\quote.js'),
(86, 'wxEA', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Root\\root.js'),
(87, 'Ax3G', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Text\\text.js'),
(88, 'NALq', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Ai\\ai.js'),
(89, 'uAzf', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Html\\html.js'),
(90, '9MNW', 'C:\\programming\\php\\strata\\src\\components\\core\\ToolBar\\tool-bar.js'),
(91, 'T2cD', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\Editor\\editor.css'),
(92, 'nCS9', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Code\\code.css'),
(93, '_Pbn', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\TextEditor\\text-editor.css'),
(94, 'DDi3', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Decoration\\decoration.css'),
(95, 'gZWi', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Link\\link.css'),
(96, 'wQIj', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Command\\command.css'),
(97, 'pAUK', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\CommentSection\\comment-section.css'),
(98, 'ogFg', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Divider\\divider.css'),
(99, 'A6U5', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\FileDownload\\file-download.css'),
(100, 'HiXI', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Header\\header.css'),
(101, 'eCyt', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Heading\\heading.css'),
(102, 'Saup', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Image\\image.css'),
(103, '7mB5', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\List\\list.css'),
(104, '1-_P', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\ListItem\\list-item.css'),
(105, 'WMPl', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Page\\page.css'),
(106, '3yVs', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Quote\\quote.css'),
(107, 'abpU', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Root\\root.css'),
(108, 'Pa9g', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Text\\text.css'),
(109, '0sxp', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Ai\\ai.css'),
(110, 'rzaF', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\widgets\\Html\\html.css'),
(111, 'A-Vo', 'C:\\programming\\php\\strata\\src\\components\\core\\ToolBar\\tool-bar.css'),
(112, 'nHOH', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\Display\\display.js'),
(113, 'ChDI', 'C:\\programming\\php\\strata\\src\\components\\Lumora\\Display\\display.css'),
(114, 'y_5N', 'C:\\programming\\php\\strata\\src\\components\\pages\\Listing\\listing-card.js'),
(115, 'W0_v', 'C:\\programming\\php\\strata\\src\\components\\pages\\Listing\\listing.css'),
(116, 'o5xL', 'C:\\programming\\php\\strata\\src\\components\\pages\\Listing\\listing-card.css'),
(117, 'Pdu9', 'C:\\programming\\php\\strata\\src\\components\\Home\\home.js'),
(118, 'iBe0', 'C:\\programming\\php\\strata\\data\\page\\0014_js'),
(119, 'jtCk', 'C:\\programming\\php\\strata\\data\\page\\0014_css'),
(120, 'msxf', 'C:\\programming\\php\\strata\\src\\core\\forms\\controls\\Select\\select.js'),
(121, 'MhvI', 'C:\\programming\\php\\strata\\src\\core\\forms\\controls\\MultiSelect\\multiselect.js');

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

DROP TABLE IF EXISTS `core_user`;
CREATE TABLE IF NOT EXISTS `core_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `tag` (`tag`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`id_user`, `username`, `password`, `tag`) VALUES
(1, 'Root', '', 'root'),
(2, 'Anonymous', '', 'anonymous');

-- --------------------------------------------------------

--
-- Table structure for table `core_users_x_groups`
--

DROP TABLE IF EXISTS `core_users_x_groups`;
CREATE TABLE IF NOT EXISTS `core_users_x_groups` (
  `id_user` int NOT NULL,
  `id_group` int NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_group` (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `core_users_x_groups`
--

INSERT INTO `core_users_x_groups` (`id_user`, `id_group`) VALUES
(1, 2),
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `docs_content`
--

DROP TABLE IF EXISTS `docs_content`;
CREATE TABLE IF NOT EXISTS `docs_content` (
  `id_content` int NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL,
  `file_size` int NOT NULL,
  `last_updated` int NOT NULL,
  `hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id_content`),
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs_contents_x_fragments`
--

DROP TABLE IF EXISTS `docs_contents_x_fragments`;
CREATE TABLE IF NOT EXISTS `docs_contents_x_fragments` (
  `id_content` int NOT NULL,
  `id_fragment` int NOT NULL,
  UNIQUE KEY `id_content` (`id_content`,`id_fragment`),
  KEY `id_fragment` (`id_fragment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs_fragment`
--

DROP TABLE IF EXISTS `docs_fragment`;
CREATE TABLE IF NOT EXISTS `docs_fragment` (
  `id_fragment` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`id_fragment`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ext_page_meta`
--

DROP TABLE IF EXISTS `ext_page_meta`;
CREATE TABLE IF NOT EXISTS `ext_page_meta` (
  `id_page_meta` int NOT NULL AUTO_INCREMENT,
  `id_localized_page` int NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `og_title` text NOT NULL,
  `og_description` text NOT NULL,
  PRIMARY KEY (`id_page_meta`),
  KEY `id_localized_page` (`id_localized_page`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ext_page_meta`
--

INSERT INTO `ext_page_meta` (`id_page_meta`, `id_localized_page`, `description`, `keywords`, `og_title`, `og_description`) VALUES
(2, 2, '', '', '', ''),
(3, 3, '', '', '', ''),
(4, 4, '', '', '', ''),
(5, 5, '', '', '', ''),
(6, 6, '', '', '', ''),
(7, 7, '', '', '', ''),
(8, 8, '', '', '', ''),
(9, 9, '', '', '', ''),
(10, 10, '', '', '', ''),
(11, 11, '', '', '', ''),
(12, 12, '', '', '', ''),
(13, 13, '', '', '', ''),
(14, 14, '', '', '', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `core_ai_page`
--
ALTER TABLE `core_ai_page`
  ADD CONSTRAINT `core_ai_page_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`);

--
-- Constraints for table `core_external_page`
--
ALTER TABLE `core_external_page`
  ADD CONSTRAINT `core_external_page_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`);

--
-- Constraints for table `core_fs_directory`
--
ALTER TABLE `core_fs_directory`
  ADD CONSTRAINT `core_fs_directory_ibfk_1` FOREIGN KEY (`id_fs_parent`) REFERENCES `core_fs_directory` (`id_fs_directory`);

--
-- Constraints for table `core_fs_file`
--
ALTER TABLE `core_fs_file`
  ADD CONSTRAINT `core_fs_file_ibfk_1` FOREIGN KEY (`id_fs_parent`) REFERENCES `core_fs_directory` (`id_fs_directory`);

--
-- Constraints for table `core_fs_shortcut`
--
ALTER TABLE `core_fs_shortcut`
  ADD CONSTRAINT `core_fs_shortcut_ibfk_1` FOREIGN KEY (`id_fs_file`) REFERENCES `core_fs_file` (`id_fs_file`);

--
-- Constraints for table `core_groups_x_resources`
--
ALTER TABLE `core_groups_x_resources`
  ADD CONSTRAINT `core_groups_x_resources_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `core_group` (`id_group`),
  ADD CONSTRAINT `core_groups_x_resources_ibfk_2` FOREIGN KEY (`id_resource`) REFERENCES `core_resource` (`id_resource`),
  ADD CONSTRAINT `core_groups_x_resources_ibfk_3` FOREIGN KEY (`id_privilege`) REFERENCES `core_privilege` (`id_privilege`);

--
-- Constraints for table `core_lexicon`
--
ALTER TABLE `core_lexicon`
  ADD CONSTRAINT `core_lexicon_ibfk_1` FOREIGN KEY (`id_lexicon_group`) REFERENCES `core_lexicon_group` (`id_lexicon_group`);

--
-- Constraints for table `core_lexicon_translation`
--
ALTER TABLE `core_lexicon_translation`
  ADD CONSTRAINT `core_lexicon_translation_ibfk_1` FOREIGN KEY (`id_phrase`) REFERENCES `core_lexicon` (`id_phrase`),
  ADD CONSTRAINT `core_lexicon_translation_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_lexicon_translation_ibfk_3` FOREIGN KEY (`id_rule`) REFERENCES `core_lexicon_rule` (`id_rule`);

--
-- Constraints for table `core_navigation`
--
ALTER TABLE `core_navigation`
  ADD CONSTRAINT `core_navigation_ibfk_1` FOREIGN KEY (`id_navigation_context`) REFERENCES `core_navigation_context` (`id_navigation_context`),
  ADD CONSTRAINT `core_navigation_ibfk_2` FOREIGN KEY (`id_parent`) REFERENCES `core_navigation` (`id_slug`),
  ADD CONSTRAINT `core_navigation_ibfk_3` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_navigation_ibfk_4` FOREIGN KEY (`id_navigation_factory`) REFERENCES `core_navigation_factory` (`id_navigation_factory`);

--
-- Constraints for table `core_page`
--
ALTER TABLE `core_page`
  ADD CONSTRAINT `core_page_ibfk_1` FOREIGN KEY (`id_page_template`) REFERENCES `core_page_template` (`id_page_template`),
  ADD CONSTRAINT `core_page_ibfk_2` FOREIGN KEY (`id_page_status`) REFERENCES `core_page_status` (`id_page_status`);

--
-- Constraints for table `core_page_localization`
--
ALTER TABLE `core_page_localization`
  ADD CONSTRAINT `core_page_localization_ibfk_1` FOREIGN KEY (`id_page`) REFERENCES `core_page` (`id_page`),
  ADD CONSTRAINT `core_page_localization_ibfk_2` FOREIGN KEY (`id_language`) REFERENCES `core_language` (`id_language`),
  ADD CONSTRAINT `core_page_localization_ibfk_3` FOREIGN KEY (`id_slug`) REFERENCES `core_navigation` (`id_slug`);

--
-- Constraints for table `core_users_x_groups`
--
ALTER TABLE `core_users_x_groups`
  ADD CONSTRAINT `core_users_x_groups_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `core_user` (`id_user`),
  ADD CONSTRAINT `core_users_x_groups_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `core_group` (`id_group`);

--
-- Constraints for table `docs_contents_x_fragments`
--
ALTER TABLE `docs_contents_x_fragments`
  ADD CONSTRAINT `docs_contents_x_fragments_ibfk_1` FOREIGN KEY (`id_content`) REFERENCES `docs_content` (`id_content`),
  ADD CONSTRAINT `docs_contents_x_fragments_ibfk_2` FOREIGN KEY (`id_fragment`) REFERENCES `docs_fragment` (`id_fragment`);

--
-- Constraints for table `ext_page_meta`
--
ALTER TABLE `ext_page_meta`
  ADD CONSTRAINT `ext_page_meta_ibfk_1` FOREIGN KEY (`id_localized_page`) REFERENCES `core_page_localization` (`id_localized_page`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
