-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 17 nov. 2025 à 13:31
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omekas`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('dURgA6sfAT3VGheTS97xwZj983Cr33fv', 1, 'rAIsume', '$2y$10$EZ8EFVjVnauTw3RTrNoCC.FhhD8yewUvbEpXwCM7Gmf5ievk/wsIe', 0x7f000001, '2025-11-17 13:26:12', '2025-11-04 10:05:26');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

DROP TABLE IF EXISTS `csvimport_entity`;
CREATE TABLE IF NOT EXISTS `csvimport_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `entity_id` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_84D382F4BE04EA9` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(1, 8, 1, 'items'),
(2, 8, 2, 'items'),
(3, 8, 3, 'items'),
(4, 8, 4, 'items'),
(5, 8, 5, 'items'),
(6, 9, 6, 'items'),
(7, 9, 7, 'items'),
(8, 10, 8, 'items'),
(9, 10, 9, 'items'),
(10, 11, 10, 'items'),
(11, 11, 11, 'items'),
(12, 11, 12, 'items'),
(13, 12, 13, 'items'),
(14, 12, 14, 'items'),
(15, 12, 15, 'items'),
(16, 12, 16, 'items'),
(17, 12, 17, 'items'),
(18, 12, 18, 'items'),
(19, 12, 19, 'items'),
(20, 12, 20, 'items'),
(21, 12, 21, 'items'),
(22, 12, 22, 'items'),
(23, 12, 23, 'items'),
(24, 12, 24, 'items'),
(25, 12, 25, 'items'),
(26, 12, 26, 'items'),
(27, 12, 27, 'items'),
(28, 13, 40, 'items'),
(29, 13, 41, 'items'),
(30, 13, 42, 'items'),
(31, 13, 43, 'items'),
(32, 13, 44, 'items'),
(33, 13, 45, 'items'),
(34, 13, 46, 'items'),
(35, 13, 47, 'items'),
(36, 13, 48, 'items'),
(37, 13, 49, 'items'),
(38, 13, 50, 'items'),
(39, 13, 51, 'items'),
(40, 13, 52, 'items'),
(41, 13, 53, 'items'),
(42, 13, 54, 'items'),
(43, 15, 55, 'items'),
(44, 15, 56, 'items'),
(45, 15, 57, 'items'),
(46, 15, 58, 'items'),
(47, 15, 59, 'items'),
(48, 15, 60, 'items'),
(49, 15, 61, 'items'),
(50, 15, 62, 'items'),
(51, 15, 63, 'items'),
(52, 15, 64, 'items'),
(53, 15, 65, 'items'),
(54, 15, 66, 'items'),
(55, 15, 67, 'items'),
(56, 15, 68, 'items'),
(57, 15, 69, 'items');

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

DROP TABLE IF EXISTS `csvimport_import`;
CREATE TABLE IF NOT EXISTS `csvimport_import` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `undo_job_id` int DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 8, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(2, 9, NULL, '', 'items', 0, '{\"added\":{\"items\":2}}'),
(3, 10, NULL, '', 'items', 0, '{\"added\":{\"items\":2}}'),
(4, 11, NULL, '', 'items', 0, '{\"added\":{\"items\":3}}'),
(5, 12, NULL, '', 'items', 0, '{\"added\":{\"items\":15}}'),
(6, 13, NULL, '', 'items', 0, '{\"added\":{\"items\":15}}'),
(7, 15, NULL, '', 'items', 0, '{\"added\":{\"items\":15}}');

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(55, 'items', 1, 1, 'Texte 1', 'Texte 1\nCeci est le contenu du premier texte.\nCeci est le résumé du premier texte.'),
(56, 'items', 1, 1, 'Texte 2', 'Texte 2\nCeci est le contenu du second texte.\nCeci est le résumé du second texte.'),
(57, 'items', 1, 1, 'Texte 3', 'Texte 3\nCeci est le contenu du troisième texte.\nCeci est le résumé du troisième texte.'),
(58, 'items', 1, 1, 'Texte 4', 'Texte 4\nCeci est le contenu du quatrième texte.\nCeci est le résumé du quatrième texte.'),
(59, 'items', 1, 1, 'Texte 5', 'Texte 5\nCeci est le contenu du cinquième texte.\nCeci est le résumé du cinquième texte.'),
(60, 'items', 1, 1, 'Texte 6', 'Texte 6\nCeci est le contenu du sixième texte.\nCeci est le résumé du sixième texte.'),
(61, 'items', 1, 1, 'Texte 7', 'Texte 7\nCeci est le contenu du septième texte.\nCeci est le résumé du septième texte.'),
(62, 'items', 1, 1, 'Texte 8', 'Texte 8\nCeci est le contenu du huitième texte.\nCeci est le résumé du huitième texte.'),
(63, 'items', 1, 1, 'Texte 9', 'Texte 9\nCeci est le contenu du neuvième texte.\nCeci est le résumé du neuvième texte.'),
(64, 'items', 1, 1, 'Texte 10', 'Texte 10\nCeci est le contenu du dixième texte.\nCeci est le résumé du dixième texte.'),
(65, 'items', 1, 1, 'Texte 11', 'Texte 11\nCeci est le contenu du onzième texte.\nCeci est le résumé du onzième texte.'),
(66, 'items', 1, 1, 'Texte 12', 'Texte 12\nCeci est le contenu du douzième texte.\nCeci est le résumé du douzième texte.'),
(67, 'items', 1, 1, 'Texte 13', 'Texte 13\nCeci est le contenu du treizième texte.\nCeci est le résumé du treizième texte.'),
(68, 'items', 1, 1, 'Texte 14', 'Texte 14\nCeci est le contenu du quatorzième texte.\nCeci est le résumé du quatorzième texte.'),
(69, 'items', 1, 1, 'Texte 15', 'Texte 15\nCeci est le contenu du quinzième texte.\nCeci est le résumé du quinzième texte.'),
(70, 'items', 1, 1, NULL, ''),
(81, 'items', 1, 1, NULL, ''),
(82, 'items', 1, 1, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(55, NULL),
(56, NULL),
(57, NULL),
(58, NULL),
(59, NULL),
(60, NULL),
(61, NULL),
(62, NULL),
(63, NULL),
(64, NULL),
(65, NULL),
(66, NULL),
(67, NULL),
(68, NULL),
(69, NULL),
(70, NULL),
(81, NULL),
(82, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"texte.csv\",\"filesize\":\"246\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeB6DE.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"Teste d\'import de donn\\u00e9es via CSV.\",\"automap_check_names_alone\":true,\"column-property\":{\"0\":{\"dcterms:title\":1},\"3\":{\"ex:texte\":186},\"4\":{\"ex:aPourResume\":185}},\"column-resource_template\":{\"1\":\"1\"},\"column-resource_class\":{\"2\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-04T22:10:11+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-04 22:10:11', '2025-11-04 22:10:11'),
(2, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"texte.csv\",\"filesize\":\"252\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome2EDD.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"Teste d\'import de donn\\u00e9es via CSV.\",\"automap_check_names_alone\":true,\"column-property\":{\"0\":{\"dcterms:title\":1},\"3\":{\"ex:texte\":186},\"4\":{\"ex:aPourResume\":185}},\"column-resource_template\":{\"1\":\"1\"},\"column-resource_class\":{\"2\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-04T22:18:31+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-04 22:18:31', '2025-11-04 22:18:31'),
(3, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"resume.csv\",\"filesize\":\"109\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeC983.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:resume\":190}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-04T23:13:40+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-04 23:13:40', '2025-11-04 23:13:40'),
(4, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"resume.csv\",\"filesize\":\"109\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome63A9.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:resume\":190}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":5},\"o:resource_class\":{\"o:id\":109},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-04T23:16:24+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-04 23:16:24', '2025-11-04 23:16:24'),
(5, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeA56C.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:nomArtiste\":191}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-05T17:36:06+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-05 17:36:06', '2025-11-05 17:36:06'),
(6, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome2EB4.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:nomArtiste\":191}],\"column-resource-identifier-property\":[\"ex:nomArtiste\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-05T17:40:26+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-05 17:40:26', '2025-11-05 17:40:26'),
(7, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeBBD4.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":[{\"ex:nomArtiste\":191}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2025-11-05T17:45:41+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex', '2025-11-05 17:45:41', '2025-11-05 17:45:41'),
(8, 1, '9800', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Artiste.csv\",\"filesize\":\"58\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome504F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:nomArtiste\":191}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-05 18:17:22', '2025-11-05 18:17:25'),
(9, 1, '11532', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"texte_gpt.csv\",\"filesize\":\"189\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeFBC4.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:texte\":193},{\"ex:aPourResume\":192}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":7},\"o:resource_class\":{\"o:id\":111},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-05 19:28:38', '2025-11-05 19:28:58'),
(10, 1, '19724', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"resume_gpt.csv\",\"filesize\":\"152\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome75BA.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:resume\":194}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":8},\"o:resource_class\":{\"o:id\":112},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-05 19:32:29', '2025-11-05 19:32:30'),
(11, 1, '1048', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"texte_resume.csv\",\"filesize\":\"294\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeA919.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:texte\":195},{\"ex:resume\":196}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":9},\"o:resource_class\":{\"o:id\":113},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-16 14:05:39', '2025-11-16 14:05:40'),
(12, 1, '9556', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"texte_resume.csv\",\"filesize\":\"1388\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome4ACF.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:texte\":195},{\"ex:resume\":196}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":9},\"o:resource_class\":{\"o:id\":113},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-16 14:07:34', '2025-11-16 14:07:35'),
(13, 1, '8568', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"texte_resume.csv\",\"filesize\":\"1388\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeB762.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:texte\":195},{\"ex:resume\":196}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":12},\"o:resource_class\":{\"o:id\":113},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-17 10:15:21', '2025-11-17 10:16:00'),
(14, 1, '20996', 'completed', 'Omeka\\Job\\BatchDelete', '{\"resource\":\"items\",\"query\":{\"sort_by_default\":null,\"sort_order_default\":null}}', NULL, '2025-11-17 10:16:48', '2025-11-17 10:16:50'),
(15, 1, '13244', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"texte_resume.csv\",\"filesize\":\"1388\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeE9F4.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"dcterms:title\":1},{\"ex:texte\":195},{\"ex:resume\":196}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":12},\"o:resource_class\":{\"o:id\":113},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-17 10:17:19', '2025-11-17 10:17:20');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('YruzAgcuvSWPNt3uRw20AlHMePdYZisN', 2, '2025-11-04 09:54:44', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(195, 1, 9, 'texte', 'texte', 'Contenu textuel.'),
(196, 1, 9, 'resume', 'resume', 'Contenu du résumé.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190)),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(55, 1, 113, NULL, NULL, 'Texte 1', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(56, 1, 113, NULL, NULL, 'Texte 2', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(57, 1, 113, NULL, NULL, 'Texte 3', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(58, 1, 113, NULL, NULL, 'Texte 4', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(59, 1, 113, NULL, NULL, 'Texte 5', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(60, 1, 113, NULL, NULL, 'Texte 6', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(61, 1, 113, NULL, NULL, 'Texte 7', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(62, 1, 113, NULL, NULL, 'Texte 8', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(63, 1, 113, NULL, NULL, 'Texte 9', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(64, 1, 113, NULL, NULL, 'Texte 10', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(65, 1, 113, NULL, NULL, 'Texte 11', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(66, 1, 113, NULL, NULL, 'Texte 12', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(67, 1, 113, NULL, NULL, 'Texte 13', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(68, 1, 113, NULL, NULL, 'Texte 14', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(69, 1, 113, NULL, NULL, 'Texte 15', 1, '2025-11-17 10:17:20', '2025-11-17 10:17:20', 'Omeka\\Entity\\Item'),
(70, 1, 113, 14, NULL, NULL, 1, '2025-11-17 10:23:23', '2025-11-17 10:23:23', 'Omeka\\Entity\\Item'),
(81, 1, 113, 14, NULL, NULL, 1, '2025-11-17 13:24:18', '2025-11-17 13:24:18', 'Omeka\\Entity\\Item'),
(82, 1, 113, 14, NULL, NULL, 1, '2025-11-17 13:24:44', '2025-11-17 13:24:44', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(113, 1, 9, 'Texte_resume', 'texte_resume', 'Un texte et son résumé que l\'on souhaite stocker.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(14, 1, 113, 1, NULL, 'Texte_resume');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(49, 14, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(50, 14, 195, NULL, NULL, 2, NULL, 0, 0, NULL),
(51, 14, 196, NULL, NULL, 3, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('36ikdimq49n9g6imucuepruvl2', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235363638312e3030363937323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22687531666364653032336a396f703674766a3533717038687267223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239333135363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239393832373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239373637313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239393832373b7d7d72656469726563745f75726c7c733a35313a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223935303864623531363938303832336661323831393535346665306230626434223b733a33323a223734393863313934616165623739353264616435343931616561656430663033223b7d733a343a2268617368223b733a36353a2237343938633139346161656237393532646164353439316165616564306630332d3935303864623531363938303832336661323831393535346665306230626434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223566363632353139356430343737333536393730343636373132343961386536223b733a33323a226330363732333439393134393361316531626433313862376633303966386231223b733a33323a223032633065336634633365623635336532333461303737336466633564313064223b733a33323a223433356633663062663963343236633033386365653734643732653530626534223b733a33323a226533656236313466333731616633383838333162323236323864386430613761223b733a33323a223032396431376338326337396330646330623963353261623233303664623164223b733a33323a226435643535306561306439393535663237373562386332336636666536646661223b733a33323a223537373432623136343461303635306566313938303133626261383261616563223b733a33323a226164363361326462313565333338346436353935356533313863623436336338223b733a33323a223665336531643230326230626436643337316132643639326333373031353836223b733a33323a223234373166626533343665646539313534643238393234356535376661343336223b733a33323a223834646533393966343235626662613863373964336536363734303030633938223b733a33323a223762396164313932323737623032353231393162653235396666316262636136223b733a33323a223362613435326564646265633462326436613865663661333530366534383332223b733a33323a226135616465356137333137353935386136303832346532376431613736313035223b733a33323a223066373633303237623935636265353437623839326239633962336233663236223b733a33323a223933663938393962383432356235613434316139643630326638363931623466223b733a33323a223734616262643636373062303336633361373733363661333963653661626464223b733a33323a226333363632336633633732623835623066386434343631336264396234613039223b733a33323a223638653733653362343734363634373264393463363132663963383063313934223b7d733a343a2268617368223b733a36353a2236386537336533623437343636343732643934633631326639633830633139342d6333363632336633633732623835623066386434343631336264396234613039223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223134653833396631613134633565323163616162323864623536643864643365223b733a33323a226335666130393730656135366335393138326565373135623933656561616130223b733a33323a223439393831343635356533316662663465643634633536303964373366396663223b733a33323a223438306333653838616234336436396136333661613966326137306632363935223b733a33323a223033386537346462366234363862356535613133353934336264346661653835223b733a33323a223231303161353335643232363265623532613832353966616230643531363139223b733a33323a223439383235623538643736613936326136386138616130636630343266656432223b733a33323a226664656236633666633431616635346530323539393861383062623365353939223b733a33323a223733363162636531616431313636666331633166366264623331343731643761223b733a33323a223261663639613661383966643030616338643365396631386265616164323661223b733a33323a223663336238363261373337313363323964393034633235643633356337646136223b733a33323a223961393861306337313830343633363937633061326162316530613966336339223b733a33323a223866363764353038623533613634363737363932396434333765326361646535223b733a33323a226637393936636363656333373465343633663664666638623333623364396437223b733a33323a223832303434313335363964656563663264396138323536336334343562383265223b733a33323a223861613861663432396362626335346362373065346663633263323637326436223b7d733a343a2268617368223b733a36353a2238616138616634323963626263353463623730653466636332633236373264362d3832303434313335363964656563663264396138323536336334343562383265223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223961336563383165366636313364316435343138306137376435303935383661223b733a33323a226233336435306564396639633063666263333131353335306437653831616232223b733a33323a223966666535653666633865613664666538656365363364666233626436393835223b733a33323a223863343061333638336137656433636235386137633731313064316235646365223b733a33323a223336323061303964346335313732383462376635373161336261306237303866223b733a33323a223163336361656165346633353930626332623730623561313436626163326239223b733a33323a226336386662633932636135623533333838386135336439613535313164366337223b733a33323a223364656163366430376637626364383566306134636635343964363938393933223b733a33323a223965356532313438623933313835336233623466366465343234376333323632223b733a33323a223634383034623938353138653662353332623535633562323163633037643463223b733a33323a226661363964356537636665316634633061383539633963653838363430306363223b733a33323a226539653533633933353439333732616534316332383462353966313637383532223b7d733a343a2268617368223b733a36353a2265396535336339333534393337326165343163323834623539663136373835322d6661363964356537636665316634633061383539633963653838363430306363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762256681),
('4pr3mdgl4hidcjr23fap8dbqes', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323337313239372e3232383435343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234657234663936346f6a6b766d6a357231323536316a76637667223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323430363539323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323431343237323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323431343439373b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323431333731383b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323431333732363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226361346261346139353865356664313566633634306238363135393731353966223b733a33323a223765643862356438376565376531323931336538323037613739323263633365223b7d733a343a2268617368223b733a36353a2237656438623564383765653765313239313365383230376137393232636333652d6361346261346139353865356664313566633634306238363135393731353966223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a226233363931613039303665323831616563343638376234656530643361373634223b733a33323a226337643236636637663034336636656331343963376138396465646634393833223b733a33323a226563363737316235336165393231636563336135663561376432323834653339223b733a33323a223236323037346432326130376439653435646564303035646238366165646163223b733a33323a226234396130643732663165303533646131336361653463313938346333663035223b733a33323a226438333830363738313537343636613139653934306137646361333233336634223b733a33323a226665393864663366346661373132303362356438343433386337386235643432223b733a33323a223935656263323565393462333666383563316665383362626265346666663562223b733a33323a226261353635363234373735313931663238646331353462643361633465323730223b733a33323a226339373139653661633632666461666533623134356261323739303437343631223b733a33323a223964663266663963613263653934343232656132333165616233306235653431223b733a33323a226363646331663361643165326530386439353863313238326530623736653761223b733a33323a223063396233383739376461626262646638343463633334653139303436383930223b733a33323a223033353263383331633236316233313130653738663338323265386337363038223b733a33323a223830373035646164363030363335653337326534336133346463306432383661223b733a33323a226530386661333430333130646339303036626138343139323766626661623538223b733a33323a223832643763353030623962666330303630383130303563373730336639356265223b733a33323a223466373034333366303235393661653834666330326332626637613666363632223b733a33323a223034633461376461373231356330346132303832613930353139363335326636223b733a33323a226531646466303232613062363661323565353833626365656466643236333766223b733a33323a223331393061613532316335613664383763316637393130626231323063346639223b733a33323a223836363965343737303332346637353862396464623133346661356538643439223b733a33323a223966353561336361366366313232303961333432643239396238393466626364223b733a33323a223638376364343633653730353362663765306331346434643136343361333163223b733a33323a226339633538323738303938666631333037313035326633333335616135396462223b733a33323a223132386162656333616634386433613239396339363234633330346466366635223b733a33323a223831383533653063643364333039643939663762646537353133633138306431223b733a33323a223633306662376466313837303037623963363538373733333933653739356637223b733a33323a223965323162313866666638316231646630303532386464396534613930613130223b733a33323a223132373133646632303166386338373964623634316330333130373634656631223b733a33323a223436343361333964343765313733366665353764303636363539636139613565223b733a33323a223763646331356637356233333037663265346335623236363066626130623364223b733a33323a226434323539316464336364303433313733646565306431336632343064303531223b733a33323a223534326638356362643834666337316366663363316332326630336233343535223b733a33323a223538613332656139663430306664636334383635303366323163396539326538223b733a33323a223365633931386431353266666465393361336433636535383533376130343339223b733a33323a223261306433623965356564346230333363393630636338633838333535316232223b733a33323a226432626436343261373839643937373064633166626362663464373837633137223b733a33323a226265623538666135353033316238333536363561303635346139356632653839223b733a33323a223530613466626161356332323562646333613130316230306662346330313833223b733a33323a226364623463306138646338316536356537383039313034306631633434643533223b733a33323a223537623437303139616537396563313261366261663830623439323430386232223b733a33323a223431316661323439666435373033303035656336383231626166613361633539223b733a33323a223063643439613535323030393161393836303537653433626161326635313361223b733a33323a226538306262373338613439316361313230366166623737656333386365313933223b733a33323a226539333135326533366632663438393430363961626238323866376337313538223b733a33323a223332353530333266373736646336316237373831623932383962666136666263223b733a33323a226465396436323266656435396334646465663066356461646462623135393036223b733a33323a223763383537616637323135396463633835626539666537643534353462323037223b733a33323a223630323664663437623938306530613766303838333135363238613065366361223b733a33323a223933383233633336383064656565633961386237396230306133666536393336223b733a33323a223735343735643533356535646563356437383431636562656133623738366330223b733a33323a226361303063643032366535366438666530373530383730363065336263616464223b733a33323a223438616139346338366461313535666137313266316363643438343134643765223b7d733a343a2268617368223b733a36353a2234386161393463383664613135356661373132663163636434383431346437652d6361303063643032366535366438666530373530383730363065336263616464223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33363a7b733a33323a223866646563626563323261663338613033373233633862663338643738616566223b733a33323a226364616236623662643335363463363062343038383765653464346162633832223b733a33323a223062663961343638663762336439316439346436636237393133366136343633223b733a33323a223563316165636364343461346462613034343439373966393965363763363130223b733a33323a223738643661353930393734303034616263303531633031613161323561363730223b733a33323a226530363832326439316464306165343831393639393230316231626638323863223b733a33323a223434303766376561323465306330386265313536653539313935313530316163223b733a33323a226138616339383464363532613965393965653139613438663162326364353935223b733a33323a223637656139646365636266343133393834373133383264396138363435383532223b733a33323a223432663333373763306337393335313934333766646563303330643662366563223b733a33323a223639663437333265383735333062333234636666333832323264383062613330223b733a33323a223064626364353638396132633035363733393161326164323337323263623933223b733a33323a223365613136323463326631326539353336323362616261346635653533333465223b733a33323a223461306134323462306562666331666365333130356665636432656366316661223b733a33323a226433623464656262643937383732393237646139333134396237643565346137223b733a33323a223337626666623436353438393464643431366264326435326638323764313564223b733a33323a223361313435633761643030666264613038353064383432613834343232636563223b733a33323a226136326137383932306533336237653561313837346561376461666236633738223b733a33323a223739356136323331663865303662373032326165346563393931353461373363223b733a33323a223165353765643465363433323966323262383861376464633335383238646438223b733a33323a226336373264623639663731363864376461343137613735666439616164326165223b733a33323a226537643762313362363934326433323132616536346466613131373366626662223b733a33323a223735346164656337623532626438386138366333613134383864646339383235223b733a33323a223035636232383638656664353239363338303266333037346465643061653438223b733a33323a223064656463623161653735626235373436636139366461383435353762623834223b733a33323a223830343432616633393335646133336330393731613565323061393239323261223b733a33323a226438323437653165396363626166623230316338383161326162656536306633223b733a33323a223030333532623661643264346564323335303036303132383935316337366530223b733a33323a226137373133653034316432346235373463653537393038623233623335663064223b733a33323a223231366635326561323664373562333730626331643138343135333132356563223b733a33323a223066626165363330376339643265353066653331623036366134646332323131223b733a33323a223936356631646431663861313238363838633238363439386234623161303235223b733a33323a226133656237346534633237653366313762653130376365633364373264666231223b733a33323a226232333061663235353235363762346463303864323230653264646665366139223b733a33323a223534366136633939666161646661356539363732366234373066393063653762223b733a33323a223465333366663165343530353261353161663261323230363134373337343734223b733a33323a223733663335356332396336656134313662616262313563353937343661313534223b733a33323a223833626538616339386265383130643966306233363063613666643763626262223b733a33323a223364316562343065643531663130663630383066313062663565373335656133223b733a33323a226362323865333531616531613262646330363936616462383638613065663038223b733a33323a223730383461396534663639616664393935363932326563633361336465666661223b733a33323a226230633930383765396538663664653332376333656664633166313930633163223b733a33323a226463643434333638373833393235306431346532396263613231373835656637223b733a33323a223863353533666234643933346638366134616631646261353261373538383331223b733a33323a223463306665313831633930646330376566323236313031613136323430313035223b733a33323a226139666239386562393465376636633961663766376435373961653237616332223b733a33323a223765663437633063313061396262343432616566356361636464666562323731223b733a33323a226530313330323832656331633965653764316232643534636562643564323530223b733a33323a223761386631306234663439303965666636356238336566623333613633663361223b733a33323a226664333366323461316531373962353230323034653035326461363363373261223b733a33323a223034653434653034363930303334386664376339646639356332663065383764223b733a33323a223636643537656165356531643732643763363765346534616230303333333535223b733a33323a226339316638643834316632363063383162616138313263353633393135623937223b733a33323a226131626633326531346163643531393136623331633933393133366562303431223b733a33323a223433303233343265376336663463613035303336326534353964306366633031223b733a33323a223735373234366635646638623666336265303438356162646566336138633838223b733a33323a223831343237643434643263643465336235343262386234333934363537636531223b733a33323a223936313230333665393537646663643232633361666231393566326439356262223b733a33323a223633313633643165646631656238633531313437313864393962373761393235223b733a33323a223233333736356235373739643666613861363634313264323761313361656337223b733a33323a223066353039623664336463383737626632643662333538633730613566623634223b733a33323a226531393838663939666431643032393832363062313033623938333966303934223b733a33323a226561623366643630386466306131316237373831333637373730323438313263223b733a33323a226162646430316134373937643139313866633037613130383964316563336339223b733a33323a223439623966663439643031646135373165396631393833353037393736313865223b733a33323a226534316536626364393736363665383661633235336138343732363533393162223b733a33323a223265663437633063623037663137653331376437336661383434636365396330223b733a33323a223663396163353962633831393336343066616266643838366165333639656661223b733a33323a223634313562636662316661313338613931666430656364323665623966636664223b733a33323a223063323065663534303765613761663338323631343162623239313663613062223b733a33323a223164343539613336666362643039393631656137636533393735323362356364223b733a33323a223638336465323164623465343463386639646265616131653436396137376137223b7d733a343a2268617368223b733a36353a2236383364653231646234653434633866396462656161316534363961373761372d3164343539613336666362643039393631656137636533393735323362356364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226538363161373864396437613962316464656337366639616362613963363664223b733a33323a223139653762306631643461353361333036343933626463666332373139306666223b733a33323a223432343965393131353538623662643738653563326138666531386533633435223b733a33323a223665643865343531383762316436303934323639346337313435363465383632223b733a33323a223963646666333238363563663130386539646666323662633765333932633761223b733a33323a223961323434383935653565333138376537343030626434333234633261656365223b733a33323a223065623866613362333266626261363265306534626466353564383962373737223b733a33323a226636353437393036323438366130363061396233346539653635653463313231223b733a33323a226530613435353662633538383265373937373036373335393266623366303935223b733a33323a226233636432643537356566323562633234393937396464316461626264363362223b733a33323a226664376661333162386337303234303964616562343163323562396333613035223b733a33323a226236316164333366613665316639306665353137346661343030653538383630223b733a33323a223236336664643538363261656563306235396530633463643239663166363966223b733a33323a223837363833356337386662386539643162303266393464643736636233343565223b733a33323a226663613166643935663562306263633839666331346266333366336232636236223b733a33323a223036366234303537303966666339356232306563353663653231643937346534223b7d733a343a2268617368223b733a36353a2230363662343035373039666663393562323065633536636532316439373465342d6663613166643935663562306263633839666331346266333366336232636236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226531623861613461363866306231343564313238386666613261656238376263223b733a33323a223932313163326632316461323266343637393963623631363934343230646533223b733a33323a223263383339336231366339663365326163663836393730386330633431626262223b733a33323a223733333462376366656535366563363765343662316666663136623331626136223b733a33323a223061636466396261626536323234626135356636663535653764323831366139223b733a33323a223065346339356338646363653263376661313361636665303332366663643539223b733a33323a223864373362343964643336656238333736346661633864646137313837666133223b733a33323a223966333034306434393332313738663331663038363962306162656164343162223b7d733a343a2268617368223b733a36353a2239663330343064343933323137386633316630383639623061626561643431622d3864373362343964643336656238333736346661633864646137313837666133223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762371297);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('7s0h20jgjfbcm9kdgcgho6fos8', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333333313233362e33303733373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22656d33633076303868326e71613276766f666164373965616964223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333334313338323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333337343433363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333336353432343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333337313833303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226131363761616536383539316461623036303062333461333637653939376434223b733a33323a223538646632373938333732393532663734613830653065336266373934383962223b7d733a343a2268617368223b733a36353a2235386466323739383337323935326637346138306530653362663739343839622d6131363761616536383539316461623036303062333461333637653939376434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3133363a7b733a33323a226664383931343866303564366536336666653033656463343366653065313561223b733a33323a223063643035323934373635303462366336326630366161316438303530666230223b733a33323a223261666538643961383966306161663461666130346562646136643230333932223b733a33323a223537393337656638306137616165643037386331393239373237653230653735223b733a33323a226666336265653162383338323435623761336266396462626561326437383731223b733a33323a223830646335623965616661623038666661626530613634653565623965653138223b733a33323a223139623230356531613663353630656162363962643161623135313765343537223b733a33323a226132383162333539643233323364316230396666653033663836616338656231223b733a33323a226335653233663361306631333530333335646665373665393865396263373639223b733a33323a226338663265333530353861366239386439336434616139303866646433363762223b733a33323a226664666663366364623233313837333332393466376462343064323062313233223b733a33323a226134636132313966656238663465323663356138386465303033613761366662223b733a33323a223666633734383237643638653437343364653233373633613234613033653233223b733a33323a226665666363393539643430373862663635363534393533313165363561346363223b733a33323a226339326135383032316430356433353736316636643135393964393962336530223b733a33323a223966343164633730356265336134383565613732356636643134623337323839223b733a33323a223064363830356132323063383032306439633132363939623535656366633863223b733a33323a226561303464316162616262613062356137363938623965383035306261386435223b733a33323a223431306336356163616330626365373261333430643733633036376461393932223b733a33323a226534663666633365376335343636643230353535356364353734333731633037223b733a33323a223437313030616430316631616264343661366662366435356364643935393936223b733a33323a226636326430616465363131633665653461396234343833613937326132613032223b733a33323a223531666466326638393066333637646532623533356434663136336635363963223b733a33323a226165663365336638303661393039336635303366393161656430643238663861223b733a33323a223237666138666330666635353665363539303461343362373761396334643134223b733a33323a223438376533643239346436313031363633333331313036626436613562663661223b733a33323a226133636431373866303363643661373931303638393133643730336538613230223b733a33323a226338326263646361613035346333353764616337613331633964613733323134223b733a33323a226266613534303435303437383638323438383239343465653236626437316461223b733a33323a226431346235376530383765303536396135623737346139303639356662343262223b733a33323a226163616636343331386237386333383034633237373531343333646665623335223b733a33323a223538613963666435366635336231613662613838396334316462323966386566223b733a33323a223130366165623239633639353366393061373736656534613462396436616461223b733a33323a223830343161363936626461633036313834333331313531376366616363323561223b733a33323a223538656637313764613232646461303061323432666139353732633663636561223b733a33323a223032616665363532613663396131326231633137346336326665343536306236223b733a33323a226339656135323162646162383731616437653163313937656161316535356665223b733a33323a223934623664623964663232663261626530313833363266386134376334653734223b733a33323a226537303835623435663831313363663032336166356630633464333338613433223b733a33323a223437393833663430316134626633386661346136663866303932383061343963223b733a33323a223130623134636364663732303061383962666565383835623938313736383161223b733a33323a223761666561656337346163653333303336626633323864376533393962333134223b733a33323a223636366462366161383464363835346266343165633366653630326462366134223b733a33323a226363396633653333393661623163663334373837623439343034643366636566223b733a33323a226433653335306462633265386634396365363435666632323065386438663061223b733a33323a223666633732633531663035323333663763366565616430623336643532336566223b733a33323a223438333635343362376232386133633266396330643135363735323865353036223b733a33323a223863386330643439636662353738643366343561393361656264383663633034223b733a33323a223264393265646439666234633638616435633662346665336336613263646632223b733a33323a226432303535383263393737623863346331393366313033656538333439316136223b733a33323a223634303936663737353866616565303037613931373961316132396437346164223b733a33323a223863363364343739653465393037653166343036393631626431353138643437223b733a33323a223862633533333633373361386265653731666530623339346136623063613435223b733a33323a226161376163313535623839373738643131363931386365623038373262343935223b733a33323a223435386439316566663232323263363435366461356534363232383035336235223b733a33323a223762633336313437396233656235376239333461653036343037333762636230223b733a33323a226663393732333966343434313639346334306663393037643631306665363134223b733a33323a223136343963643465336131353534616165376636356462333837386463623735223b733a33323a226434306165393330366664313637323037366637633862613465666338663765223b733a33323a226162386363356533313030303437663330373335313461643031383533626232223b733a33323a223336373237333530363731646333626130656565376466393061353432363937223b733a33323a226266666164643439373765333062313466623536333764323331633664336135223b733a33323a223537643062626332663665303135356533323639396639363965653531626463223b733a33323a226332333331323730306162383534653530383530313764303464326339636564223b733a33323a223838366264613035313564346132303935323336303966656566373135666230223b733a33323a226138386463626264623665636165396361396239336235363661376337316333223b733a33323a223336316635663331313461623261623863656332306663623263393065646630223b733a33323a223465366133336566373161613566373237643961373561646630323862333765223b733a33323a223635623034346161633666653833326465313330383630376639626130646565223b733a33323a226530616230366134616664343662663361316566336234626434636132646136223b733a33323a223164323664326130343830353635643862323936383934656461386266646236223b733a33323a223961323963303063326164353336653939316538643362316432343734383933223b733a33323a223464363462626637373833363230306232356438326430393233383662653033223b733a33323a226535346137333031623339393364383366356563393265326263313435306438223b733a33323a223832363532363262633237653030616339386662356664666138343961353865223b733a33323a223865653933346561633637326234386137303235393038613633383135323339223b733a33323a226661313734656136626134393336336339613332323265363336303636323064223b733a33323a223639306335386564363033313862633535303536306436396134613835333230223b733a33323a223661383739393761653330353435636365646234353832346432343166343765223b733a33323a223630343963363337613036666136626261656430323233376162336561303666223b733a33323a223136663366343861636366386337623633366262336663616162363836396563223b733a33323a223464313163626531313363363233303939306463336565373031353239323735223b733a33323a223935656165303537336230393138303437393262323232636238393763333733223b733a33323a223633333630666435303437386564663038326334653932616631666461363732223b733a33323a223836613364353330623761656365336537346331663730336436383365323139223b733a33323a223164323062363539616238616332356337363837323064313533366566383931223b733a33323a226262313163656234666135396365633064626332373336666337643264376464223b733a33323a226435346638646333323666336335373666373132666437313030346235306531223b733a33323a223230343965396238333036623665303230613231396366383339643866633864223b733a33323a223166643035343839626464663731343664306139643962363537343565326330223b733a33323a223061613562373837323761366132363036376432366131363332396132646633223b733a33323a223033646433656630393737383862356630333961386439653439656362353566223b733a33323a223730313238323332326338383962636432323533666631333334343261386331223b733a33323a226337393864353031356535396334653636326431313437393334333235613130223b733a33323a223230616534343732353737356666666634626561383036383566616164316435223b733a33323a223833313037643638623035663635306639363836326661613663353865353630223b733a33323a223665336235303362383234636464353934306232643665666665663732633132223b733a33323a223366623761666531383965353633623037643463663061333365333266393735223b733a33323a226438353137613730376435376262303765363832356333663731353563323930223b733a33323a226262396438306566323464383630643230326166656630623434346163306634223b733a33323a223664343765383064303930326338613165666631316165326531613262646138223b733a33323a226134313564343265373033636537326263346430356133363636303231623736223b733a33323a226165363966383131616265313930643464383463326166623764363934643533223b733a33323a223634393834343736663432376632353930316566633231383163633362376332223b733a33323a223639396432353166303735333032303034396235646665623430366239626331223b733a33323a223364613462333336663865306465646638306239336638653137376430663439223b733a33323a226561653533343435343533333338653262663163623463633961343038653936223b733a33323a226663613766373233623464623839323139643937616334643132653939616163223b733a33323a223464346462373938306630613263353036373764616239323063616666663236223b733a33323a223834656537333364393464343133333335353131376630353861633131343735223b733a33323a226137353236316536633332306232613137343737326533383365353937623231223b733a33323a223636333766643935316365316261353134333862643338363361386462313733223b733a33323a223139613265373365383362363663366139643836646563393065323135336239223b733a33323a226630343565313366343035346566633636646534333433646262393033653636223b733a33323a223936613930346665393038383530663365633038326564323437613763393863223b733a33323a223061656232613165666663346435353564663738633764363366613865346433223b733a33323a223863343763666261353561613439333633643364323339396538326162396161223b733a33323a223736326634366666633839303831663265663662393137663730623062323866223b733a33323a223537323039663766393833616339363862653134326464383438666262326130223b733a33323a223237646334666562623862393664323465636332313737383231316661353238223b733a33323a223831653836356132396135386632323366636264653361323434353631346231223b733a33323a226631663535333865623738623231653063616435386366373261303137616636223b733a33323a226538636461653632303433343462616161356134356437353962616435316432223b733a33323a223566363431323165353665393838366636333161623261326330373239316237223b733a33323a223132316631613333393866653430373830333764623833646530343538353138223b733a33323a223239646437396138616236343834633633613466363535646137643862626331223b733a33323a226164393765323032356165383230623663613835373738656338393138376130223b733a33323a226538666235646537626331656537356665313236353462613638303839343564223b733a33323a226239613161363766393165656365383735323435356661656331666462343536223b733a33323a223632373836356134313664316562663630336236613634643066323632306434223b733a33323a223665366236633363376663366363633937343761376561333432393966623435223b733a33323a226164363563316635383336356539326332633834626234633262323739343634223b733a33323a226230386163626130313331373730343939356564646464303430396539333763223b733a33323a223932373364613962623631326232323362323965373832643532393830313762223b733a33323a226538633639303630366232653733396165326332333937633330626235653530223b733a33323a223536363733393939656362373366336539613866383333333132653038626530223b733a33323a223161316262363636393637373464333631653237363835316638653338383136223b733a33323a226564656237316331323139376361323936366362616162323962333564633339223b733a33323a223834313033396135613163346137333964363136663131613439393830316265223b733a33323a226636326165376337306435363333623532326439613466376439303637633031223b733a33323a226166363730383061643461363537663431326163346433656538336139633935223b733a33323a226463323132643662633266333632346133376138646534616664316534393738223b733a33323a226562663462323832336232343530353666356266653166303337346565616364223b733a33323a226337656636383435373862653236303361616165613866666230613836396435223b733a33323a226332333863666236306137613035343232343366376231316437633637353064223b733a33323a223131623866303735323632363661303638623138653262396662623135666436223b733a33323a223239303030366538303063343733313238656439393264653230333763343430223b733a33323a223865366537356630396631653332316161373161313733356136343864383336223b733a33323a226262626334336233326265633561623362353638383435333966373532363162223b733a33323a226463303930346462313139373161383532623231656532646462316530666432223b733a33323a226230303562396162343361326531343462363332303638313735656639333362223b733a33323a223233356634656630636538323338616438393337393365626332643534373838223b733a33323a226362393831313234666662323233613136386665653562643031366630363762223b733a33323a226665396162356139666233383731383666323536363334366139633363346438223b733a33323a223664613265373862353936653639303665633865636164393664653235383039223b733a33323a223463616462613331643264616662643038333536343266376639666539356536223b733a33323a223735373365393364326439633830363131396431373433613063653766656430223b733a33323a223166393230646264396238313664663137636136376234303761363038613065223b733a33323a226664333231623034633332623438383732613635316635623439633931326433223b733a33323a223136653934323032653461393864643366303835613538303765666663313462223b733a33323a223466636333373539616464316533393436306335333633666165623364333735223b733a33323a223433393530323938633563396161333062373933623562336131343634313664223b733a33323a226363656433323336326237313631373139663466633866656632383861623466223b733a33323a223666333032643463383133363733333431393263396463306239613138343261223b733a33323a223132653739393132343830303266393935663461346463373639636438646635223b733a33323a223061313033343538656635343032623661323637373031656338653936333435223b733a33323a223765663436396466626433383332373365626135313462633663353938383763223b733a33323a226238386463636138333235356433343732613862306362396334333933636331223b733a33323a223664326130383664356432306438346336643635653362386538633634306161223b733a33323a226463363066656234306232333539303831663138376665633564623438356462223b733a33323a223733633630393965343938343638313832336638643361313031386666326238223b733a33323a223337373037316336666434623864636134646162663130626531393166376632223b733a33323a226430623761316530383461633966663962626335623664663738386333653066223b733a33323a223663636138303937306435653563376630633663616335343062303063383137223b733a33323a226435386261346364323432653766646337313136363632653765316332303938223b733a33323a223734623137303633623132313232633539663830313964383238633364326661223b733a33323a223134323030306633313538383831623162373966373937383333333038303961223b733a33323a226164626437306339613638613535643836306536386262653136616136656466223b733a33323a226237636330353034353135393834613063326232643032383230313966643631223b733a33323a226637636333393832373062656264643132363237646535333930663262373366223b733a33323a226139623265303266666461636564336166313261376663323537666132326630223b733a33323a223638326631666233333332366662383464363333303461623337396561623864223b733a33323a226362353264303735653731646636666637653833333732313465343166616165223b733a33323a223165653336313430323234313039633037643237353631613931393361623338223b733a33323a223338663039633536663932636132613563643765333537323636393338623563223b733a33323a223330653931343463376335666537666634336561326534376461663361666366223b733a33323a223864633461666536323830386365376365393534363339313834623566313236223b733a33323a223166613866333464613764663461363135383161663235343835643861386537223b733a33323a226161353534613837333962653566306166623965326365353231636436323232223b733a33323a223032623330383863333935326662323866613566396365323261383335646163223b733a33323a226531616565653733366139333066343632353662373232303663643237656439223b733a33323a226565396333343861613465646133623331313533633538316636623136653062223b733a33323a226135346233373631626135636665623237393137366132636361396537393531223b733a33323a223832343163356636386565313030366232386630306530376361343565613266223b733a33323a223363383430393531346433393866376563373634336639393163386536633463223b733a33323a223266393133633038303838636631396438343861373263643938346161393465223b733a33323a223239343365626162643730373335313235306332353831363937643431393635223b733a33323a223231643932633863643435363765323961373234613937356139323661663962223b733a33323a226139363339326435393831386665336635646530363662663734316665633864223b733a33323a226230356262303963366236663761333033303864386533393161383236303134223b733a33323a226537343362616135336462346131653333353363386339643666663862646565223b733a33323a223831383362366136313430623239313333656363386562616362366462303765223b733a33323a223965386638366366376165343434623266616438393831306536373261373635223b733a33323a226135376539653763623631643234316337323738316236653239643666366665223b733a33323a223062373235383162616262373864306638613561333232653531313430376164223b733a33323a223564653939346565623135653931303731613935313236366334323362313038223b733a33323a223530383934616130313230653361613865353232343137643438346462343533223b733a33323a223931636263313761623963333461316136363531613131303832376462623336223b733a33323a226635376161396132386132636139373938656533303638343038336466626638223b733a33323a223766623039316365636232643461386133393832633133613261646436373037223b733a33323a223362356564616337356462613131633433663735633130663564343937366332223b733a33323a226532376330663335663965636630653230396234623539663932653865633935223b733a33323a223336383439333234306533306662373935383262313337376164303535643865223b733a33323a223563316333303833663631646635353463656537343633326462366162613633223b733a33323a226330623834306336363066323132633665356632633738303363626561653266223b733a33323a223833613535656165396339613763303533636132663566396466393733613636223b733a33323a223664643337323366313935343764616162643035323738613132356666643436223b733a33323a223330316532383031363463326436633434626334316235336234623635333530223b733a33323a226465636466353566653737353732326331313835653666376638613263616330223b733a33323a223231653365613235313536663166356662353532333230636263346365313733223b733a33323a226661346530373561396231646562613534383136353663376162616562646638223b733a33323a223536323133633664636438386362626432663932363866656161646638623366223b733a33323a223737636364323732663436323430306365653230383032323666323339623065223b733a33323a223461393835616634613162646639633934643432303431343932336135346231223b733a33323a223462393062643561376131366365356130613936343963663365303062623465223b733a33323a223930303164306562343365323961643330373164663262666438386363616333223b733a33323a223433623938333166376430336264383532663933646263643262306432313932223b733a33323a223761636137653833656561626663616338643234323634646539656361356366223b733a33323a223230303862303361336662663630663166666261633030663438346666626431223b733a33323a223333363639366639336432333666656639363866333932353433663438633731223b733a33323a226135303664366332336132366539346439346464646361666336613830383036223b733a33323a226232646630383264323934656662396464623262383366616234386161363739223b733a33323a223536636137316437316238666536373636643630643535633166363335333736223b733a33323a223730396434326561646638623334623062303432363966653631396364653633223b733a33323a223063376566376533656436636332343037613237626566346665303261386430223b733a33323a223439663930663539316631333030643134623566613665623835666364633732223b733a33323a223563363363373961663934383736626536303338376336346263653836333935223b733a33323a223361393238373735313665393733353135623439323538623530333039616262223b733a33323a223064316335616465353466373736643963303261336232353233373537323730223b733a33323a223165306535633639383430386238663334373436666664656663653363333234223b733a33323a223835353133313561656361373538633238326332656435656331363033663135223b733a33323a223766326132393065333336303164646132383063316234643565326661333961223b733a33323a223131303530666164313766343664663539626531373863366439656564613364223b733a33323a223666623363623936353732623333636663306137643738626438623331623133223b733a33323a223632343133623164333732626264386465396634323231383633663138663166223b733a33323a226234396533666461613262653035373231326530373961336130393131663038223b733a33323a226335333732303834313431356162303663303031646139386634613533393263223b733a33323a226262383436373266393864663636303766383664376135383236363266383265223b733a33323a223837353461653739343463663039653864653532636464393664356466633232223b733a33323a223236373066343935656637653031623965323161623064663366363266646338223b733a33323a223666613030306166666331623134386531303231303266623834343737383732223b733a33323a223138333030653839336464393338313934363135316633333839646539633932223b733a33323a223138353333383233626332396462373734323634636465623830386233376630223b733a33323a226566653535633165333231313432643162643432383330306433626438376539223b733a33323a223934383562656265356439383330393237343239343230656530373531353030223b733a33323a223961663139373733636236663531383062326435323838616436316434363730223b733a33323a223739656165356434343766623839373539396362383431393936396163353166223b733a33323a223934346538383030363035306434653361333430383839643536306234373835223b733a33323a226665383364356638386661653266323561393137643937376130303735343032223b733a33323a223565646531653337613733316130323965393461646465323632306439663933223b733a33323a226263616163303833383335653063656233623138383363623030633935353664223b733a33323a223538323830363539643535343339616334373332333231633161356561326630223b733a33323a223631346537313162646233303633353366393634643533386165363562366334223b733a33323a223531363737643132623563623130316238626237393035303432633362323237223b733a33323a223934333635653165346461613539373332316436376239666666613135343235223b733a33323a226638306263376635386431303833396538643365663635306534363135353839223b733a33323a226538663734313738653338383565306561626633396638323532396131333030223b733a33323a223462376662663632643331323737623038313532303238313430306531316463223b733a33323a223736353035393466386265363931376236353166323331613139313834336236223b733a33323a226333656633316533616461383662656439376137303732333133313436356433223b733a33323a226437393930383263383638333430386430326230313835626666326539363733223b733a33323a223232316634396162373733346437303933333737373034386332616233626239223b7d733a343a2268617368223b733a36353a2232323166343961623737333464373039333337373730343863326162336262392d6437393930383263383638333430386430326230313835626666326539363733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223963666330343961323636393162323735666634636331366439633433353566223b733a33323a223033636130303330623164613566373237613730616239306164656665346533223b733a33323a223362643534313837333337376338366134383563613361316330376565353764223b733a33323a223331666430626130326562393965396431623731346466356538326430363663223b733a33323a223366353837383463376464613031666135323931353335396161356130366638223b733a33323a223236383530333638313232643661643330343061326534326233303866613265223b733a33323a223438346564396239393161386239613561663066376638393663366565636532223b733a33323a223133636637323637623136633131383264643631316462333631666332666461223b733a33323a226561623161333035646262653435386631333834373161653864623261356562223b733a33323a223961633765656164663236623234633130313239653665643265316362393136223b733a33323a226164646566356236356630313335626232303534396539643038343665623466223b733a33323a226631633838373461616466353261306130363135663335666130353032653238223b733a33323a226636633939353466346137373739633730343638373662313732643833336133223b733a33323a226438613766326633636339636539366638633632393361393837343163666362223b733a33323a223562393538656661333138613331383232333138633466383538623166613630223b733a33323a223738326538333362323361666161663233616533616161623531326134646638223b733a33323a223831356133336335316433633537623463643265623364666632323939326532223b733a33323a226338653230306565663830643736383232306662653239396366396636323034223b733a33323a226431353033633432353763663935626233346262366332636130653433333861223b733a33323a226461633230616665666633333934626230366438613935653065653537646430223b7d733a343a2268617368223b733a36353a2264616332306166656666333339346262303664386139356530656535376464302d6431353033633432353763663935626233346262366332636130653433333861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223862636137366236623165653064666339313565626361303130343465356630223b733a33323a226139383763313731623437353434316237383537656333306130656364653332223b733a33323a223131663731383133393662306339666135373935636339323636626634353739223b733a33323a226230343462396332386339313161663930333964356263313366333339343162223b733a33323a223531346662363736663036656638303831323434353435613833316462616636223b733a33323a223638386565323539623662323137303965343338616365393937343963626236223b733a33323a223733613566343665646139323264323266323363366166663338663437356136223b733a33323a226539613033303965376663646433393332666139323461363763313936323665223b7d733a343a2268617368223b733a36353a2265396130333039653766636464333933326661393234613637633139363236652d3733613566343665646139323264323266323363366166663338663437356136223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763331236),
('89cgu08mhi38e6mo51md95gb0b', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323533353831362e3536333539363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22616a62336f6761676e37367170716f386d71343565347074736a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323537373131373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323537393031363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226134303736383739653764356331623662303731306333303531393233663332223b733a33323a223837653636613566343137353133343163306538666239393733386632666266223b7d733a343a2268617368223b733a36353a2238376536366135663431373531333431633065386662393937333866326662662d6134303736383739653764356331623662303731306333303531393233663332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223065616436316337306262663535326133323237653462623162646635356538223b733a33323a223163636133633539326637323235316234646463663262663866356230306238223b733a33323a223862643762346166633435383263666231643462336235326537323736656633223b733a33323a226135653531306531643430353735383161313231616262353730383265613236223b7d733a343a2268617368223b733a36353a2261356535313065316434303537353831613132316162623537303832656132362d3862643762346166633435383263666231643462336235326537323736656633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762535816);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('cdu2av018aht9t0ruhu34l6tku', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333338363030392e3438333035313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223930643972753761327272726f36366c6b326568697239703674223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333431323333363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333432393231303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333431383131383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333432303735373b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223034343937386133653533313966383630666631643237313938663565313365223b733a33323a223134346432663564323639376136333333363061383262373837343164316139223b7d733a343a2268617368223b733a36353a2231343464326635643236393761363333333630613832623738373431643161392d3034343937386133653533313966383630666631643237313938663565313365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3130313a7b733a33323a226365363364643063383037336237376434383464323766383135343465373038223b733a33323a226434643962376435353639303663656632316363336461666365616130333362223b733a33323a226139376632636433383266613339623137333665326166393533663961653633223b733a33323a223730373030373064636566343865626464396337356532333635363930363139223b733a33323a226439626238326330623937313461633163356239333933623065666633633536223b733a33323a223333623063376636633335646365623063666639313463386364323336366236223b733a33323a223630373236316637383266376333333632396663333261336563356230353166223b733a33323a223830396266336635363231303836333162363332656133333337386137623262223b733a33323a223665366662363161636661643230353037336631663365396634363233326363223b733a33323a223831333864653365613766626431363932653730616237373966343966363463223b733a33323a226362316162643234396231653934313233626631366666393832396637336263223b733a33323a223432323233316335623631323566383637313635393130363966613230383939223b733a33323a223730643730343531303439383439653065653365313265633233316137303132223b733a33323a223433383231643635313161623930376365616662393064633431336335653435223b733a33323a223338393839373536383263336438303565366133643665623161303032656266223b733a33323a223464373531396437346637343162323266653864313264613435633136613738223b733a33323a226662616533323331656530616464396239656134363134386134383031623063223b733a33323a223731336664343633373665303261643961613337306235306332323632313330223b733a33323a223265396236306638353362373835303965343036323034616330313765383162223b733a33323a226538353663643135303533386362643938633739373333353737396365346531223b733a33323a223263343837356363616666636237646234343532363334343065346333613331223b733a33323a223634366439383635303834663037663336376634323037383438383938363863223b733a33323a226635633565396137633966666132666365633132636130323937363038333761223b733a33323a223866313432373961623538366634343536633062333335383539323537373965223b733a33323a223863623432366666363533373963656464663265306233386538333536333761223b733a33323a223934333435303365653136386364333264326336616236326264613934353166223b733a33323a223638343331646634633732643431353331366666373634666364656438393433223b733a33323a223663376163623838356565306139306136316430373630396266663461643764223b733a33323a223866633865653536363330373462316338356464376532643364383463626664223b733a33323a223135636465366263303933376366383965396134613638623831643532646535223b733a33323a223936623262663938326266663863626130303933396636333638323832636635223b733a33323a223263356333663065343064323936633635663462376264623039303932636239223b733a33323a226437633833613535323033666666666237643038343233643161313364366636223b733a33323a223632313238393861363332333235346366643637356665636235306433323635223b733a33323a226538346562623633326434623062623936346637333364653262633462316366223b733a33323a226137636266363361653535663463623130373364346663343834343364383666223b733a33323a226261303838376362666637373537323737623962333535343234383862663462223b733a33323a226265623663316439303161633235393066376631643930336665343562306236223b733a33323a223834623536303161376531393966393361356231663533323536353664666631223b733a33323a223533396335353438653035616363366534626238336466343464336330626437223b733a33323a226438343366353635616663323231666133343431373537323430646631613838223b733a33323a226263363662616661336362626239623565373565346635356435343334663230223b733a33323a223365613665353036386364663966303839393439346265323039376436623166223b733a33323a223330643034616138396430653937306533393063356232373939353561323036223b733a33323a223461636666373838326632613361623266303032306333306436633766613465223b733a33323a226236616463386464336232363739353338643033363562326365383334323930223b733a33323a223637613233303762303934613836646136663437623230303739343932626264223b733a33323a223934333463646539643530666566383864313165373962663235633435666238223b733a33323a226332346432333136383762373836636337346639323962353231633462306161223b733a33323a226263626364633965636330363134363262383961396233666331376565323766223b733a33323a226439653434303236396234313664373235656663343764313163383734666266223b733a33323a223265333134316665653637353463386531326363356365643236336532636333223b733a33323a226566306137333938323633393830613366666131356665346461313966313834223b733a33323a223834653339643837383432323239316362356261623935343033393231343664223b733a33323a223366633434336136633664386565336362353133383337623738663865343837223b733a33323a223839313731613163386536383036363736323235633063353431656637373131223b733a33323a226330343564666161343932613536323730663536356335316164616238636235223b733a33323a226161626439333234306566396334303962363431306463316536363034663863223b733a33323a226130633864383666383838616536356634646562616662386237386365653266223b733a33323a223661666633643265396366353934386234313561616465356133353163656233223b733a33323a223237336534316163656437353837323564633662393130323939656264613338223b733a33323a223932393138333031353931316564373563306564313734396464363033656666223b733a33323a226566386139386361376363663563376631316633373463616436383536393137223b733a33323a226665303337626633313462363532323136633838633133316365333565626439223b733a33323a223537613662383562616334663431353763393232376261653033653034353236223b733a33323a223833333639633437376331616461633037643436393230313634383338663633223b733a33323a223364646338376438386661386435326338313536646536313566623437306334223b733a33323a223630623230663839623331636338383561666435346537323639623834313164223b733a33323a223062323639393665643233373666316335306337336665333539636364316230223b733a33323a223462313561613139313233306633373032393631623632343961386661393938223b733a33323a223634646638643938343736653930343035336165303433316232383130343361223b733a33323a223263376265326239303132636662373966633636313465326634346130626430223b733a33323a226531616532613731333766626565346663303636346435316231663637613030223b733a33323a226238636565616166313039616137616533306633353032346435373239346432223b733a33323a223264666539386530623065383962663666653764343166396265636462313664223b733a33323a223034643336366630313133353038343234383537316234653065363163623638223b733a33323a223339363264633132386366376530623332623535373430393336306134633530223b733a33323a223264326438663065383832316263396466653031376434643837326565633336223b733a33323a223433353632376565336664353330353062393031623762333335616636333131223b733a33323a223633646666653232303437666638653639386531653639643937356163643135223b733a33323a226633313534343862376363376436303735326131643432353836336539326538223b733a33323a226164626438656436323666303362313636666438663361373738336265626666223b733a33323a223965616231316263353133656463396366663834633934323965383935383134223b733a33323a223364393739303864613237333139323030653136333933386666663031393764223b733a33323a223662343863373761336238323331333437353631346136356330393933303036223b733a33323a223833656662363164613962323161323537323935326666343665363437633462223b733a33323a223066376434653063376135633831623232663731383561623062653366306538223b733a33323a223932386136313062633536656233333437613935383962633436666537656365223b733a33323a223739373431663563383334666338326163396138626439343838383333373332223b733a33323a223762356663303735303762353732303766333132316435396334386438626164223b733a33323a223535636532363863313761346166666362626465303361633235386238646135223b733a33323a226531646135383666653038333135643038303538376565323234616561383731223b733a33323a226531656361356334383962386161663933326666666366666132643562303132223b733a33323a226165316634666433623130386465343532313561393436333364386638663830223b733a33323a223766653536336439343630336234643666313233316633343636363734613437223b733a33323a223833356639343765633962353865393635386638323138336233303236643833223b733a33323a223163353061343238616331373363353937366563633436613064363534623031223b733a33323a223036336331663931343233383437643838356338386432383839323563343663223b733a33323a226535626231636464336335323430613236646337366263366633623766373137223b733a33323a223561636666366430613632613231363730326533326531373037343235646232223b733a33323a226562366435663430343666363132356633666634333262353437326661656438223b733a33323a226162623765633132346164386637656431346335323463386432386165366230223b733a33323a226338643565366462313938323362646564396463393339343734303033666165223b733a33323a226439396338363964313734326431306436663739353664393433636166356461223b733a33323a226131386365383931333137613838643530356134333861303666653130376634223b733a33323a223162363466333464306162373832336437346265626565643239323235343863223b733a33323a223334616637343466666464363036653161386465386262373133653030633135223b733a33323a223439363732313936343537666533613563386339326465613937383037663638223b733a33323a226266393362343261353234363132666564336437336166333434666334656338223b733a33323a223961623066373535393665393535646639313631396330336638623665616536223b733a33323a226332333634303539623165643230343465313335643061326234336539336566223b733a33323a223638313764383563373639613633343765393862323435343661303466386163223b733a33323a223762303365656535373663623730343563343531353566646237366334386263223b733a33323a223838323638316435316238303631663133643035653236306635333939633135223b733a33323a223962646361626565353036643363303834326262663631336161623762366138223b733a33323a223531326433663634343432366462636164366237333536316235386238353432223b733a33323a223864623962343765336362363939363033623664616132653434386638653930223b733a33323a226566316131333262643631396133643765343539653638316433613664356239223b733a33323a223266616231656230393938306539333265383937646335616334363566333361223b733a33323a226130376436636436613262343330633433363938666633616138666535323135223b733a33323a226438643166653632616633353237313264356432373466626237626161333637223b733a33323a223161646132373631653332306362393739356363373032363736366163346235223b733a33323a226238643639336338316136316238633630366632323066333336363166663434223b733a33323a226430303866343933306431396663326134313833363635656661653964363838223b733a33323a226361616234363461333364316632306636313131333931366139383364373737223b733a33323a226264336330383835663262663930636237346332326435353036356661306563223b733a33323a223535303939353530643932323035343432393966623464376361396436326265223b733a33323a223163653933343636646531353939353963666432353738363530383830663666223b733a33323a223836313430663030316431663936663961626263653564316639663361623631223b733a33323a223761376162393035303261386332376532356230366639356531366561373931223b733a33323a223237333466396632643236306432396130666163623933326235376639626339223b733a33323a223262333539376661666435656633613634313733303934356539653837653564223b733a33323a226662646135643630663833393035623333353339353332356632383037626332223b733a33323a223561306231383531313637306462613636373865613135353534616637383631223b733a33323a223963656230306632663765303930653033386531356466313035326539393466223b733a33323a223962313863343136323666623262333933653163383866626161333439643463223b733a33323a226436343837303135353966633866396665613932666535333338376636373761223b733a33323a223638626336613461383035653134343664623130313639306635653231663737223b733a33323a223738336362383363353663366538636366343061643338353734343336393539223b733a33323a226331316239353761343736633361653136613732663164346134633034633438223b733a33323a226532383462633664366566303863336530643066353464663964646435363862223b733a33323a223265663635333266616131656133346336376636393738303937306265393535223b733a33323a223036623466363364663364633464666662386439303663643835363838366439223b733a33323a223733383037383639653534343732393831376236396135633664636538323930223b733a33323a223732336465393031343436383361666430333963323964623165313265653161223b733a33323a226436393439343431653737333130383564373964623262636534313335326131223b733a33323a226239663436303233353665393931363436636163303935353635373831613161223b733a33323a223033646261306535343965393939313162303535643230306530356333323832223b733a33323a226630316338626165353361306231363732666437663033326666643236393732223b733a33323a223661666661633437386663313735356365363636653062383638333566303631223b733a33323a226662323934343832373465303364623565623638636661383964646366653561223b733a33323a223839616434376333653430643838393439393633663434383739326266373965223b733a33323a226165643862636562616465393539663739666234666433633539306661316630223b733a33323a223763653133343635653439323264393234363639356161363238313964303063223b733a33323a223963663939633430306132386339353334333634663166353134323432636330223b733a33323a226132383163386533306364323865626632626639323532633966616161353430223b733a33323a223063633935363364383436366662636534613331373230386336616266636636223b733a33323a226266386363376632613038323038363263383136623633393231633565643564223b733a33323a223765666431393137323037363161393339326564383130363631333338643735223b733a33323a223465333763336463646236343665323933613965353638616165613333656134223b733a33323a226332626563383739373933383266313464346330303935393463393466303231223b733a33323a223564653539376561363337356462643431313062396635653136623964386663223b733a33323a223539343933393131333266323965666166663133663431663661303132383130223b733a33323a223963663762343037396364616264303365346334353938386236323962303437223b733a33323a223135633537353232323866383161383361316461333633383661383832646232223b733a33323a223365633734313563636437323132633464383139333561373237633733323863223b733a33323a226132623034343139363739666536393936636438313937376335323739363562223b733a33323a223562373431373835373836363066383039326638333966653462313464326631223b733a33323a223362323732366532366665623637613535663431353730396162303164313463223b733a33323a226339393362633339373937333565363763313438363665356565663163353734223b733a33323a226663356536306266633464376465393863663032336563666439306463656136223b733a33323a226366393731636438653834636136666664393535356566363130633764343963223b733a33323a223635323732373839333165633231643036376561643037306135396566343962223b733a33323a223334616462643539306462626363326533366332623735383533313134303830223b733a33323a223931623335656531643934633763613539396263376339656161636265306134223b733a33323a223139313935653131333064626630383633633061633061303563643033646335223b733a33323a223265323163393734363864653538613862386130643035313831666338643534223b733a33323a226466376132636531636431663664643435313039646635356262616537313439223b733a33323a223334353631363331306163616665316638656530633163393035386466396633223b733a33323a223938323030383731313830663366643031323635663939343931323936366636223b733a33323a223862333765346462633566646365656463303563666330386531636263326365223b733a33323a223161363065396231313533663834336339373130346565393733363933653034223b733a33323a223265633665326366623036353965316362376262626330616339666439346634223b733a33323a223461393765353635613639646533626336653237383437353433626536616230223b733a33323a223261303165346464316264633662656234613336333066663034636530663636223b733a33323a223463653630336537396139383139346533376636383465376465386638306530223b733a33323a223861383836383937316430333432396163393139366662626361646666303031223b733a33323a226565333434343735306631383966633262336330356332306632666331356338223b733a33323a226632366665376264306238363163613966393031373536356632663561346539223b733a33323a223833346539316632633665376566623230306164343966653137373364346133223b733a33323a223835316633353866616133363766336564333362623937363865333565303062223b733a33323a223832633065626466643635363164313830383062376338323133353864356539223b733a33323a223136623363633335316366666137353166366462316233313462663137396662223b733a33323a223131383939613037323835616432396330336163313562623866356134333230223b733a33323a226666653865636463653163386466663264343263663130373763653866353333223b733a33323a223837633334313337316235653261653638623466633139653739636161663638223b733a33323a223964646564656666333365613135383839363232663538663538396363343435223b733a33323a223335643538326237376666373666323532623366613062316537343933623736223b733a33323a223837636434383362363534623735346338633531303737373039666361373639223b733a33323a223936343339613533666366623939346564366661393663356662656232623830223b733a33323a223138336161633262353265323634366138303435626237343832353565346137223b733a33323a226131663737663737336332323639303263363538633365386236393930353465223b7d733a343a2268617368223b733a36353a2261316637376637373363323236393032633635386333653862363939303534652d3138336161633262353265323634366138303435626237343832353565346137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223231336338376233653332616363373061623536363135346534396465643066223b733a33323a223237323135623165353261343331653232313331386639313462366232333262223b733a33323a223634333939373862303962633339626431393263613061616334366133353862223b733a33323a226130323132663866383632646235373031343037633436666338303561383038223b733a33323a223330356466653930653535633930333131613334313038353061396333313731223b733a33323a223166393162613538353234306162643665356465323262656161373039663534223b7d733a343a2268617368223b733a36353a2231663931626135383532343061626436653564653232626561613730396635342d3330356466653930653535633930333131613334313038353061396333313731223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226231623637326230363965313633623235636363656165643061306230353032223b733a33323a223037343231313838616139346433386532316137613837396231653562623434223b733a33323a223066346563353635333063323031303163636533613231623763326463333238223b733a33323a223338636563616265343666383232653564376632636132326564383637316166223b733a33323a226137643636323364313030653863613737623739323536326234643666366636223b733a33323a223033616236393463663364303461303265353830316162323636633437613438223b733a33323a223565653038313639326531343839376637306461356131626139306565623036223b733a33323a223231306230366233396230396463613937366364333162396263393432306231223b733a33323a226261616463323334313564343264613262306463303162666232316436333737223b733a33323a223032393534393561653062623966303061343932306261363364343262353339223b7d733a343a2268617368223b733a36353a2230323935343935616530626239663030613439323062613633643432623533392d6261616463323334313564343264613262306463303162666232316436333737223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763386010),
('eh50omannen4s269uig1l77osp', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234383839332e3933373532383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22386d356131737268706f6d75646b7469333534636b6a34397136223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239313831333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239323039333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239323038333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226535643666633630376262323337616131643639636336666539393835653139223b733a33323a223936323032623262343866373730303362366532613134353838653834653736223b7d733a343a2268617368223b733a36353a2239363230326232623438663737303033623665326131343538386538346537362d6535643666633630376262323337616131643639636336666539393835653139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223839646138643066353432343830353733346337363063326433323031363636223b733a33323a226132343566373566323161353365386165643664656130633833306664336266223b733a33323a223332363630613465306464326238633734353435333730393636616130623933223b733a33323a223036333434336335613366343435653034386535326364333739646336633266223b7d733a343a2268617368223b733a36353a2230363334343363356133663434356530343865353263643337396463366332662d3332363630613465306464326238633734353435333730393636616130623933223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226561666637396338383265383964613431343738633963626335613263323231223b733a33323a226565346538666338356639663933346239356237313137643731616465343232223b733a33323a223638626531666162303338333032373762646465626262653131633161653237223b733a33323a226633656133646438343939633534313636356365376535626666666331616362223b7d733a343a2268617368223b733a36353a2266336561336464383439396335343136363563653765356266666663316163622d3638626531666162303338333032373762646465626262653131633161653237223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762248894),
('n0lvihauq8587ajgmbrpp12t0p', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323239383336342e3939343738343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22356f35746375376331676f327433323567716933746737736e6c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323331393436323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323334313332393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323334303732363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323334303135333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226565383463636238656435313866616464383932316633353333333037626636223b733a33323a226534346234383736663630643063393865623865633764376462613033333039223b7d733a343a2268617368223b733a36353a2265343462343837366636306430633938656238656337643764626130333330392d6565383463636238656435313866616464383932316633353333333037626636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31383a7b733a33323a223232383065313630316438353331396261303333643062323463323164383865223b733a33323a226232303335386465356232393965383661323062343466663034303764643332223b733a33323a226364363663663438383136346633366462346439396335666632633863376162223b733a33323a226437643262326566643261356531613731623266396663656137373563633064223b733a33323a223134646534393534663463303930666436333766366138623865663334346133223b733a33323a223335316332643639356564353635373861353839656435333331626135643231223b733a33323a223530383030363434666231393062663061323865666562636338363664336333223b733a33323a226433333038306566383637313031373535313737663836633931336462633934223b733a33323a223761653536393337373338323330313230363537303438316236333762333062223b733a33323a223737633264353231333536613530393265316161663134623064353161383739223b733a33323a223462646132393565356534616161353766336562303134376664373566346431223b733a33323a226433373233333238633131363636363535316636326665656563623734653936223b733a33323a226435333333396162323639366333303037626661663662303333343966356637223b733a33323a223061363364643862333930666236396265343932613037626235623465363764223b733a33323a223161373565343762333766346463363637316164363831386666653064636263223b733a33323a223562393330663665356232323532373434366235393463363266363561653761223b733a33323a223263353464356430336166393362306531653162373262373762396333636364223b733a33323a226566343366333032393733373431356538383665393963623134356632356133223b733a33323a223866646161303362376139663937663133653136333066386362396262623764223b733a33323a226635633430323364626537353139303239666633363332613732343937663539223b733a33323a226365316363306538613637386332393765356630626339666538303966383966223b733a33323a226633663939643537393665666134343061653165303165633730633834623039223b733a33323a223163316162333037623466316466386137333263396235346266373761646532223b733a33323a223536393661633230383330376635333765393161636365363331353935613963223b733a33323a226135393032333639353232613264336162636535323731663237316563353433223b733a33323a226365356635613633363866623631663361336465323334666430323130653035223b733a33323a223133353033326536646135396562623361343332303831353863316365343134223b733a33323a226638313764666434383837663165393333626261383437646332366331356132223b733a33323a226331353762336537346266333165643337376538333330643437353833663831223b733a33323a223765333432393266313438316435323335376565373234633165346331306133223b733a33323a223332653836353737336331666262616631356565626237346334323561666165223b733a33323a226461653737303166653631653339643961623734623232336636373336346638223b733a33323a223330323362366163353133636666396262626361346339653563613635646639223b733a33323a226233353139343763643738343464623463326462356265613732303562343539223b733a33323a226435316465363037663536346464663831656233333935386133653230646233223b733a33323a223038623965333461346232363635326438316538643632336633323830313133223b7d733a343a2268617368223b733a36353a2230386239653334613462323636353264383165386436323366333238303131332d6435316465363037663536346464663831656233333935386133653230646233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223662356335653832366539643730373733373330346639373161626337636437223b733a33323a223437643234623937396662393938653034353064396265346435383932323832223b733a33323a226566316563323736363037343535353333613365393063316264623931333262223b733a33323a223731383535366165363864353632386161313336613164303766393131323332223b733a33323a223033323165346434353339336666383734303036663539396136396436616132223b733a33323a226261623930643264396564383965333564373638333139646436393464303431223b733a33323a223466333530336162613461626662366234613961323333626465376136313131223b733a33323a226331326561303639326464313866613966623166653737616136316465646666223b733a33323a223963616330346163663637643164396430323534383163303135623963383635223b733a33323a223934633636366265303436613734306562313639623037646164663032626336223b733a33323a226330613032613431653166373036346461393662383832316438623261653535223b733a33323a226463376634313835303061316234663331613634393038316666306134383232223b733a33323a223937303766376338623238616662326434383938363863633938633661343862223b733a33323a226465396366653934303936626161363238656530373637623132663732306262223b733a33323a226265336364343232356135316237313436343135616163623337353730613337223b733a33323a226236663038613333623530663763626266343931643036656437303137303261223b7d733a343a2268617368223b733a36353a2262366630386133336235306637636262663439316430366564373031373032612d6265336364343232356135316237313436343135616163623337353730613337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223537626434306363376637346532663239636239316466663464373939373638223b733a33323a223664616265396235636132646364363334626638353566353166656436363432223b733a33323a223865323134316266376435383565626634333737633364396632393564616362223b733a33323a223261323863373766343761363863616364366135353764376365616632373863223b733a33323a223933666534633731386438363962363164626233346532363764623436386437223b733a33323a223836623137386663356337393766393739646233623936636333663530613631223b733a33323a226261616665393032383739613332383062353466636461343539346131353234223b733a33323a223031356237356337393434306161383534376462346137313133363762613530223b733a33323a223563376538333737303564393365626631363935353766313438646233323133223b733a33323a223436366638343365366531353336393534333439356432643336333238616336223b733a33323a223830656233316137333430396636363933363936333565363763383039383865223b733a33323a226537633838336532323231323130356434636432666534313166643633346235223b733a33323a223337303137353131656233326135666162653934656364326338633030373833223b733a33323a223266393037636236383034643331326332366536306339336161336132666633223b733a33323a226438646261353362363831376561366132306130323133636665326336623537223b733a33323a226438393163656635373364623565356639353862363830623534313739626535223b733a33323a226432363964636633376463316631316361643337336263333262366130643364223b733a33323a223262373339653434353031653830656531363334343434316632343064343136223b7d733a343a2268617368223b733a36353a2232623733396534343530316538306565313633343434343166323430643431362d6432363964636633376463316631316361643337336263333262366130643364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762298365);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"tom.95060101@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"omekas\"'),
('locale', '\"en_US\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `is_public` (`is_public`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'tom.95060101@gmail.com', 'Thomas', '2025-11-04 09:30:12', '2025-11-04 09:30:12', '$2y$10$VW/0srjTOQdPweH.9EbS0OuIXuvS60wlIroQOcvirMnXqOH4FY0um', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel', '2025-11-04 09:54:44', '2025-11-04 09:55:41', '$2y$10$0sIxoewksCJ9ZBv0vD/Lj.LSbXVPM28sqc3yfrBNhpvtDRLcn71.i', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"9\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"en_US\"'),
('locale', 2, '\"en_US\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190)),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(115, 55, 1, NULL, NULL, 'literal', NULL, 'Texte 1', NULL, 1),
(116, 55, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du premier texte.', NULL, 1),
(117, 55, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du premier texte.', NULL, 1),
(118, 56, 1, NULL, NULL, 'literal', NULL, 'Texte 2', NULL, 1),
(119, 56, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du second texte.', NULL, 1),
(120, 56, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du second texte.', NULL, 1),
(121, 57, 1, NULL, NULL, 'literal', NULL, 'Texte 3', NULL, 1),
(122, 57, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du troisième texte.', NULL, 1),
(123, 57, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du troisième texte.', NULL, 1),
(124, 58, 1, NULL, NULL, 'literal', NULL, 'Texte 4', NULL, 1),
(125, 58, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du quatrième texte.', NULL, 1),
(126, 58, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du quatrième texte.', NULL, 1),
(127, 59, 1, NULL, NULL, 'literal', NULL, 'Texte 5', NULL, 1),
(128, 59, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du cinquième texte.', NULL, 1),
(129, 59, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du cinquième texte.', NULL, 1),
(130, 60, 1, NULL, NULL, 'literal', NULL, 'Texte 6', NULL, 1),
(131, 60, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du sixième texte.', NULL, 1),
(132, 60, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du sixième texte.', NULL, 1),
(133, 61, 1, NULL, NULL, 'literal', NULL, 'Texte 7', NULL, 1),
(134, 61, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du septième texte.', NULL, 1),
(135, 61, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du septième texte.', NULL, 1),
(136, 62, 1, NULL, NULL, 'literal', NULL, 'Texte 8', NULL, 1),
(137, 62, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du huitième texte.', NULL, 1),
(138, 62, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du huitième texte.', NULL, 1),
(139, 63, 1, NULL, NULL, 'literal', NULL, 'Texte 9', NULL, 1),
(140, 63, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du neuvième texte.', NULL, 1),
(141, 63, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du neuvième texte.', NULL, 1),
(142, 64, 1, NULL, NULL, 'literal', NULL, 'Texte 10', NULL, 1),
(143, 64, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du dixième texte.', NULL, 1),
(144, 64, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du dixième texte.', NULL, 1),
(145, 65, 1, NULL, NULL, 'literal', NULL, 'Texte 11', NULL, 1),
(146, 65, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du onzième texte.', NULL, 1),
(147, 65, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du onzième texte.', NULL, 1),
(148, 66, 1, NULL, NULL, 'literal', NULL, 'Texte 12', NULL, 1),
(149, 66, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du douzième texte.', NULL, 1),
(150, 66, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du douzième texte.', NULL, 1),
(151, 67, 1, NULL, NULL, 'literal', NULL, 'Texte 13', NULL, 1),
(152, 67, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du treizième texte.', NULL, 1),
(153, 67, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du treizième texte.', NULL, 1),
(154, 68, 1, NULL, NULL, 'literal', NULL, 'Texte 14', NULL, 1),
(155, 68, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du quatorzième texte.', NULL, 1),
(156, 68, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du quatorzième texte.', NULL, 1),
(157, 69, 1, NULL, NULL, 'literal', NULL, 'Texte 15', NULL, 1),
(158, 69, 195, NULL, NULL, 'literal', NULL, 'Ceci est le contenu du quinzième texte.', NULL, 1),
(159, 69, 196, NULL, NULL, 'literal', NULL, 'Ceci est le résumé du quinzième texte.', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(9, 1, 'http://example.org/vocab#', 'ex', 'rAIsume', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
