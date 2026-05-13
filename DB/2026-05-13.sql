-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `addressLine3` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ormddxrcumphquwdvfxiglhefevvbriwxcup` (`primaryOwnerId`),
  CONSTRAINT `fk_burcfhwwsqnemxpdimiyzbchbbfviryibngp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ormddxrcumphquwdvfxiglhefevvbriwxcup` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsjesalrhwdrsyivkfblzrttjuocgbnjlumx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_cmowmlyonzmkgkhrezbmptfgwcdwdtigifnj` (`dateRead`),
  KEY `fk_jyttsscppltohcopfvyiagmfmfyiwlsnxtrk` (`pluginId`),
  CONSTRAINT `fk_jyttsscppltohcopfvyiagmfmfyiwlsnxtrk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nahvpoyvzndmrdydumhdatnmdtlsnaaspjwh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8mb4_unicode_520_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yjjouaqfenkohbskcpcqrsxfgpzywtyauljv` (`sessionId`,`volumeId`),
  KEY `idx_ftuwtenqvbowmlbddbistchvlgroatisxpwh` (`volumeId`),
  CONSTRAINT `fk_lixnqpevpxljisdvptstizxvwzzcccpazdon` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnhybhlzcdrqjuerbnhpapeamvxndlgcfxnn` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8mb4_unicode_520_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mimeType` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `kind` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8mb4_unicode_520_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xyviehsriedchjeltzabrvsjbqrjqrtehind` (`filename`,`folderId`),
  KEY `idx_smwfyzwzwqeqnursynxnkhxaaobchyrfsayn` (`folderId`),
  KEY `idx_lmdmhojyparedwxeejbybrkvjndsyujshgjw` (`volumeId`),
  KEY `fk_kghoossulzwpnkanqcorhpthislcdepdvhma` (`uploaderId`),
  CONSTRAINT `fk_jmmhpsqbizdsitbtzjelogioasgtjzdwbrsw` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kghoossulzwpnkanqcorhpthislcdepdvhma` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lixjlwadxajmltbsgopyxnxbqesafshzatxc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oxmumcxykmxzkxuyhammxwnyagbecwxxxsph` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_shtajetermqxrtjhzylblhmtlfqyiwslyexv` (`siteId`),
  CONSTRAINT `fk_dmawudaduiiiufivtrbpnjdesmwfvruwvgfv` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shtajetermqxrtjhzylblhmtlfqyiwslyexv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_oauth_tokens`
--

DROP TABLE IF EXISTS `auth_oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_oauth_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerHandle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `providerType` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tokenType` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `accessToken` text COLLATE utf8mb4_unicode_520_ci,
  `secret` text COLLATE utf8mb4_unicode_520_ci,
  `expires` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `refreshToken` text COLLATE utf8mb4_unicode_520_ci,
  `resourceOwnerId` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `values` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qpzbwngwsdscdimwoodeiclaktcyzjrxmnjt` (`userId`),
  CONSTRAINT `fk_qpzbwngwsdscdimwoodeiclaktcyzjrxmnjt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `senderClass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `eventName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_ybrvauzdxfjfhmelfgxogdaclegvtmngxenv` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_knqbfcaxvmcrnnmlynkyaxhymalsvjdkfabx` (`groupId`),
  KEY `fk_ewbyeedkzpyhnedelgcihajnyxzyzvbldzkk` (`parentId`),
  CONSTRAINT `fk_ewbyeedkzpyhnedelgcihajnyxzyzvbldzkk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vxqojlfxsbgtkevetfncqnkuspgpulnprzit` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymcxzmmkskgbwflhbasqpzvrclqdfowvfitz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rcuxbllhofgqmcgekolgaulglkxihpsytoxb` (`name`),
  KEY `idx_ozcrrhgowgehnqfkblrfuftujtdxiygetfcb` (`handle`),
  KEY `idx_iqbwxlyviknnpwjbiochrmqbskgwesrofees` (`structureId`),
  KEY `idx_coowqhvacymkhoaxduckqsmalxyogqgvimyg` (`fieldLayoutId`),
  KEY `idx_keqbpmayesvsitftfxfsclsklfcwossiwxwm` (`dateDeleted`),
  CONSTRAINT `fk_bslonockcwopimnhtuddvundvpikomaqxssl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tuojxzewdvuhmzdisyvqtuijstvelkbbxtqa` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb4_unicode_520_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szqsgukcotxyanalbueyytmhrtezxefzxern` (`groupId`,`siteId`),
  KEY `idx_zheymmmoxzvbgruznjmgpykxxxtiekknkelz` (`siteId`),
  CONSTRAINT `fk_oefnbgtxaagjdpcatrkxfjtlubtpwhmtuqdb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yothusamekrysyijbsokhsautgafnihzgznl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_uemaekfbwghlvxdxqopmtxbyzlujthtmbyvz` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_tqqocqfideqnfsqgjhggreupbdsqvttnneem` (`siteId`),
  KEY `fk_mzorgcqnakxtwacthysepalrcxookvscjnkd` (`userId`),
  CONSTRAINT `fk_mzorgcqnakxtwacthysepalrcxookvscjnkd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ojijrrudwqegxdsphwpmoeovupnncnujoblz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tqqocqfideqnfsqgjhggreupbdsqvttnneem` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_ukpccehyhlvqayhqzkhrnjjjckysguwtqwrv` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qxxfjkbzxuthvgqtswhqpnvjqwduyhlqdzdl` (`siteId`),
  KEY `fk_solvtmaabgaygtizlihglliiuxqkbmltvbwz` (`fieldId`),
  KEY `fk_puzncocuynnpfmrecdsrlnkkzyqtbjwtkrzq` (`userId`),
  CONSTRAINT `fk_cyiwupdvnduhraqyyubbpkobvbqumzeubfnz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_puzncocuynnpfmrecdsrlnkkzyqtbjwtkrzq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qxxfjkbzxuthvgqtswhqpnvjqwduyhlqdzdl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_solvtmaabgaygtizlihglliiuxqkbmltvbwz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_catalogpricing`
--

DROP TABLE IF EXISTS `commerce_catalogpricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_catalogpricing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(14,4) DEFAULT NULL,
  `purchasableId` int NOT NULL,
  `storeId` int DEFAULT NULL,
  `catalogPricingRuleId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `isPromotionalPrice` tinyint(1) DEFAULT '0',
  `hasUpdatePending` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jrsyeqbhnakhytjeqcggfojolorryekkukez` (`catalogPricingRuleId`),
  KEY `idx_imgyvlpoxenjgttngnsiwnvugwulsffzffnb` (`isPromotionalPrice`),
  KEY `idx_sqdqlfufaaqsyckfrktuokoppdciejolnmur` (`purchasableId`),
  KEY `idx_zrovowaljqlbkybhqvjevpajbsrwdpvwxwnb` (`storeId`),
  KEY `idx_vztyfhvolyapqxevthbynpbpnxswgazppraa` (`userId`),
  KEY `idx_lwzhzpeeiezblldnzixyzibdcttsxxniwiub` (`purchasableId`,`storeId`,`isPromotionalPrice`,`price`,`catalogPricingRuleId`,`dateFrom`,`dateTo`),
  KEY `idx_wnqkhyoubrtrnshwztjnqoxcbscwbbovwjnc` (`purchasableId`,`storeId`,`isPromotionalPrice`,`price`),
  KEY `idx_dbaqyqpnsxkesxexliakeyxzkajbfkoiceuo` (`purchasableId`,`storeId`),
  CONSTRAINT `fk_dcnpehfevnbkskjdrmyilybvgbvhwhhsqbkx` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_trxjeytaygaaeacwmcdqsejysxtqsyybzsrg` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vyaatnmsambipcqhexkhyovhfrbzkpawfcnm` FOREIGN KEY (`catalogPricingRuleId`) REFERENCES `commerce_catalogpricingrules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtpvpdwgpibslbggggudntmazmgjokcuqetr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_catalogpricingrules`
--

DROP TABLE IF EXISTS `commerce_catalogpricingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_catalogpricingrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `storeId` int NOT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `applyPriceType` enum('price','promotionalPrice') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `productCondition` text COLLATE utf8mb4_unicode_520_ci,
  `variantCondition` text COLLATE utf8mb4_unicode_520_ci,
  `purchasableCondition` text COLLATE utf8mb4_unicode_520_ci,
  `customerCondition` text COLLATE utf8mb4_unicode_520_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isPromotionalPrice` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rqcxjvikxuwdsaolnadiwcoebgeicpmdxawl` (`storeId`),
  CONSTRAINT `fk_tdewoovkbfvcwfjbvskglbrikixkmecmtcpa` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_catalogpricingrules_users`
--

DROP TABLE IF EXISTS `commerce_catalogpricingrules_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_catalogpricingrules_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `catalogPricingRuleId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfcoggyjznqjcmpxeivnacsdjasozmvufvis` (`catalogPricingRuleId`),
  KEY `idx_yknayqrbvunfcgyjmsabpwrmpjfnrdahlyju` (`userId`),
  CONSTRAINT `fk_ikagpqlsqyiiiazjugmmlyvslzrqztlnoniy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qbedobqcdegblqbqqvdwpvxrxambcnbpzqps` FOREIGN KEY (`catalogPricingRuleId`) REFERENCES `commerce_catalogpricingrules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_coupons`
--

DROP TABLE IF EXISTS `commerce_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `discountId` int NOT NULL,
  `uses` int NOT NULL DEFAULT '0',
  `maxUses` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fpqnyirucmfgreuuqsqnzzcahkansloelrek` (`code`),
  KEY `idx_hxainigtrohbslzmbuejjlthictxwgtgxxlu` (`discountId`),
  CONSTRAINT `fk_hfdxogsrntmeaekcbglvpxsgwcqjpkygzwqh` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customer_discountuses`
--

DROP TABLE IF EXISTS `commerce_customer_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_customer_discountuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `customerId` int NOT NULL,
  `uses` int unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ghyfoyjrrwdevwwxmpdgiqybjmqavkecqiim` (`customerId`,`discountId`),
  KEY `idx_nscdsrpowfblcoxsjrsmkbqvvwcnzcflbtfy` (`discountId`),
  CONSTRAINT `fk_furtkcabplhmuhykyletlpdsfzbucqyhsuwq` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subrqsgfxtuhrckmcwdjyfbvbdnfzyohzjdl` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_customers`
--

DROP TABLE IF EXISTS `commerce_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `primaryBillingAddressId` int DEFAULT NULL,
  `primaryShippingAddressId` int DEFAULT NULL,
  `primaryPaymentSourceId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_royiwiqpgblcwqaxvbywgdipchkkxhgkvcco` (`customerId`),
  KEY `idx_mlxdqvqooazmlxkuooqlchrktekbknyyfsys` (`primaryBillingAddressId`),
  KEY `idx_ntcgqxmgyyqhvyguwcylrtmnebhynamquhnn` (`primaryPaymentSourceId`),
  KEY `idx_jywukepimsunmziwqotufgvhtpgccnwuyppi` (`primaryShippingAddressId`),
  CONSTRAINT `fk_afyevzcspaorllfndisfzuijenauhmojijuj` FOREIGN KEY (`primaryShippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cqfehukdepbpvjmiohdovfbfnsizcumwjdvk` FOREIGN KEY (`primaryPaymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qrqijmtdgmfeittznfqbuohflmzqhirqjaug` FOREIGN KEY (`primaryBillingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_trjfhugklqpuyoohiqirlwnizbxcmbdkgdhp` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_categories`
--

DROP TABLE IF EXISTS `commerce_discount_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_discount_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `categoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ygcceyqplpevdkrevwlfwctdgzsuaoctjwjy` (`discountId`,`categoryId`),
  KEY `idx_aptsxzfvgdsjaolctovumpxrkwbswsuynkkj` (`categoryId`),
  CONSTRAINT `fk_kblbdtnjtzrqmhpdlmastovkmzxxevbgxmke` FOREIGN KEY (`categoryId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_onckwqrfkjqsnyvxhqpulyjqadonzpnbzyqo` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discount_purchasables`
--

DROP TABLE IF EXISTS `commerce_discount_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_discount_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `purchasableId` int NOT NULL,
  `purchasableType` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gaahbrynvsvkiqzamsenkqslbdvawtmrfnou` (`discountId`,`purchasableId`),
  KEY `idx_qxxoezgttbtaiwbbbepvnpvzqfwinfmeegus` (`purchasableId`),
  CONSTRAINT `fk_agkwhivykiqyrovxrfgrqkwlwylfowoydezo` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_olnozghownxeytgpggautbfgewbyhuemzael` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_discounts`
--

DROP TABLE IF EXISTS `commerce_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `couponFormat` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '######',
  `orderCondition` text COLLATE utf8mb4_unicode_520_ci,
  `customerCondition` text COLLATE utf8mb4_unicode_520_ci,
  `shippingAddressCondition` text COLLATE utf8mb4_unicode_520_ci,
  `billingAddressCondition` text COLLATE utf8mb4_unicode_520_ci,
  `requireCouponCode` tinyint(1) NOT NULL DEFAULT '0',
  `perUserLimit` int unsigned NOT NULL DEFAULT '0',
  `perEmailLimit` int unsigned NOT NULL DEFAULT '0',
  `totalDiscountUses` int unsigned NOT NULL DEFAULT '0',
  `totalDiscountUseLimit` int unsigned NOT NULL DEFAULT '0',
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `purchaseQty` int NOT NULL DEFAULT '0',
  `purchaseTotal` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `maxPurchaseQty` int NOT NULL DEFAULT '0',
  `baseDiscount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `perItemDiscount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentDiscount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentageOffSubject` enum('original','discounted') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `excludeOnPromotion` tinyint(1) NOT NULL DEFAULT '0',
  `hasFreeShippingForMatchingItems` tinyint(1) NOT NULL DEFAULT '0',
  `hasFreeShippingForOrder` tinyint(1) NOT NULL DEFAULT '0',
  `allPurchasables` tinyint(1) NOT NULL DEFAULT '0',
  `purchasableIds` text COLLATE utf8mb4_unicode_520_ci,
  `allCategories` tinyint(1) NOT NULL DEFAULT '0',
  `categoryIds` text COLLATE utf8mb4_unicode_520_ci,
  `appliedTo` enum('matchingLineItems','allLineItems') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'matchingLineItems',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'element',
  `orderConditionFormula` text COLLATE utf8mb4_unicode_520_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `stopProcessing` tinyint(1) NOT NULL DEFAULT '0',
  `ignorePromotions` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vwnftiotcbmfigpthcdkvgyzobsoktzsdbtt` (`dateFrom`),
  KEY `idx_xziehntvjpmeruxkeiqbnpnzcyyuejzpqsbl` (`dateTo`),
  KEY `fk_tythgkcttsondaosgspfqflklaorhftfcboc` (`storeId`),
  CONSTRAINT `fk_tythgkcttsondaosgspfqflklaorhftfcboc` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_donations`
--

DROP TABLE IF EXISTS `commerce_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vkfelzdpmfmdhmfazcqwgflzjhhsuachflur` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_email_discountuses`
--

DROP TABLE IF EXISTS `commerce_email_discountuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_email_discountuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discountId` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `uses` int unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yqmsvlaccxqxkbwtrlwilzollftahnzofdqx` (`email`,`discountId`),
  KEY `idx_lmmlqgyekchvrsnvjrdrvihhboghezqxkewe` (`discountId`),
  CONSTRAINT `fk_tlsabvoviaavtqwnjnzhwtszjnnmypoqvbhf` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_emails`
--

DROP TABLE IF EXISTS `commerce_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `senderAddress` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `senderName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `recipientType` enum('customer','custom') COLLATE utf8mb4_unicode_520_ci DEFAULT 'custom',
  `to` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `replyTo` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `templatePath` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `plainTextTemplatePath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `pdfId` int DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `renderSiteId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_supnroxwffyehrikaglcwmymdlpfuovolzcf` (`storeId`),
  KEY `fk_peavpfbozxsijgkhjpqswutsqlqtehrwwvnx` (`pdfId`),
  KEY `fk_okrjragxjldjiuzpiiyiqpyxuyriycupwurc` (`renderSiteId`),
  CONSTRAINT `fk_cegqclyumlopjrrxdqkdspufgjxdmknziika` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_okrjragxjldjiuzpiiyiqpyxuyriycupwurc` FOREIGN KEY (`renderSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_peavpfbozxsijgkhjpqswutsqlqtehrwwvnx` FOREIGN KEY (`pdfId`) REFERENCES `commerce_pdfs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_gateways`
--

DROP TABLE IF EXISTS `commerce_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_gateways` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_520_ci,
  `paymentType` enum('authorize','purchase') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'purchase',
  `isFrontendEnabled` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `orderCondition` text COLLATE utf8mb4_unicode_520_ci,
  `shippingAddressCondition` text COLLATE utf8mb4_unicode_520_ci,
  `billingAddressCondition` text COLLATE utf8mb4_unicode_520_ci,
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_amrevuxwecafinwyqscgyaslaathhonvoxno` (`handle`),
  KEY `idx_jyxarqidrvqnhdcffohuaoriwykbbqdfnevw` (`isArchived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_inventoryitems`
--

DROP TABLE IF EXISTS `commerce_inventoryitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_inventoryitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchasableId` int NOT NULL,
  `countryCodeOfOrigin` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `administrativeAreaCodeOfOrigin` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `harmonizedSystemCode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_krxxbgskggrgvlxznumcjdfwxxcbnneicwsb` (`purchasableId`),
  CONSTRAINT `fk_djsjwlythrajuxaunympkfovatsnkuhkljie` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_inventorylocations`
--

DROP TABLE IF EXISTS `commerce_inventorylocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_inventorylocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `addressId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_psbdwnerjjksitefpiylcsrplnsivdnwzgdf` (`addressId`),
  CONSTRAINT `fk_psbdwnerjjksitefpiylcsrplnsivdnwzgdf` FOREIGN KEY (`addressId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_inventorylocations_stores`
--

DROP TABLE IF EXISTS `commerce_inventorylocations_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_inventorylocations_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventoryLocationId` int NOT NULL,
  `storeId` int NOT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ycdmtedwwosasppzkyjlpskhvvcotbakdnwp` (`inventoryLocationId`),
  KEY `fk_gwtapynmvqbdyujzfcrmmsvihlqoosnxmkej` (`storeId`),
  CONSTRAINT `fk_gwtapynmvqbdyujzfcrmmsvihlqoosnxmkej` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ycdmtedwwosasppzkyjlpskhvvcotbakdnwp` FOREIGN KEY (`inventoryLocationId`) REFERENCES `commerce_inventorylocations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_inventorytransactions`
--

DROP TABLE IF EXISTS `commerce_inventorytransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_inventorytransactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventoryLocationId` int NOT NULL,
  `inventoryItemId` int NOT NULL,
  `movementHash` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `quantity` int NOT NULL,
  `type` enum('incoming','available','committed','reserved','damaged','safety','fulfilled','qualityControl') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transferId` int DEFAULT NULL,
  `lineItemId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hlcurqslqvmplzsmuwzfhpzqmbksxeemwwsb` (`inventoryItemId`),
  KEY `idx_nqeotratvpacbqvwxyiuwxripmfppbsnjhvo` (`lineItemId`),
  KEY `idx_smgjsndptipcemynjylxiuxtkkqkiazrphna` (`transferId`),
  KEY `idx_ciszejtaevmcufzfujqcdxcyvkbeyswkojwo` (`userId`),
  KEY `fk_wiriihovcqlvnjsilttsysmthwyjstyowvwh` (`inventoryLocationId`),
  CONSTRAINT `fk_ipjpwwdvqvgqywhsnqyxxpmscwwirdrvuanz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mrpefcjlbaezgrmjgtauxpruzwipvaijmwnk` FOREIGN KEY (`transferId`) REFERENCES `commerce_transfers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ntoayhbvygjirulkfxbntksezovaqrmkittt` FOREIGN KEY (`inventoryItemId`) REFERENCES `commerce_inventoryitems` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ozyuntdsvzvnlowtkfwfxkbsmlkuzdlvjapu` FOREIGN KEY (`transferId`) REFERENCES `commerce_transfers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wiriihovcqlvnjsilttsysmthwyjstyowvwh` FOREIGN KEY (`inventoryLocationId`) REFERENCES `commerce_inventorylocations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zykfrbfpayddbwiwmkefubzddkawzxqvimiw` FOREIGN KEY (`lineItemId`) REFERENCES `commerce_lineitems` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitems`
--

DROP TABLE IF EXISTS `commerce_lineitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_lineitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `type` enum('purchasable','custom') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'purchasable',
  `purchasableId` int DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `options` text COLLATE utf8mb4_unicode_520_ci,
  `optionsSignature` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `price` decimal(14,4) unsigned NOT NULL,
  `promotionalPrice` decimal(14,4) unsigned DEFAULT NULL,
  `promotionalAmount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `salePrice` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `sku` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `weight` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `height` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `length` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `width` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `total` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `qty` int unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_520_ci,
  `privateNote` text COLLATE utf8mb4_unicode_520_ci,
  `hasFreeShipping` tinyint(1) DEFAULT NULL,
  `isPromotable` tinyint(1) DEFAULT NULL,
  `isShippable` tinyint(1) DEFAULT NULL,
  `isTaxable` tinyint(1) DEFAULT NULL,
  `snapshot` longtext COLLATE utf8mb4_unicode_520_ci,
  `lineItemStatusId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vkyshywzalgrwnisclhvajytjbwaooddxzdk` (`orderId`,`purchasableId`,`optionsSignature`),
  KEY `idx_lzquctldqjoeksamwsybupllztjzcyhhvmia` (`purchasableId`),
  KEY `idx_mtskrtkkskndpofihavdcqqzazoaosideiie` (`shippingCategoryId`),
  KEY `idx_fdwzutwyfpnjixdcwgpmaolcuoasqnehodvx` (`taxCategoryId`),
  CONSTRAINT `fk_jzobynnqkfhvydpithyglaacrxxgkmbfivvr` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_oprchqofghgaaqrqasynzqcuvihajcpamjeq` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_soranhkttibvpiazlzdcvcodlpnynoultznv` FOREIGN KEY (`purchasableId`) REFERENCES `elements` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_zzpiffzzddtounkggxbiubrxbfveuwlfzlgl` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_lineitemstatuses`
--

DROP TABLE IF EXISTS `commerce_lineitemstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_lineitemstatuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'green',
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdrqhlvtcetauxxaycizjplmvivgxqbayjwv` (`storeId`),
  CONSTRAINT `fk_whujpxvuyuwcbuxjnumynneooryeohvnxwub` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderadjustments`
--

DROP TABLE IF EXISTS `commerce_orderadjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_orderadjustments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `lineItemId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `amount` decimal(14,4) NOT NULL,
  `included` tinyint(1) NOT NULL DEFAULT '0',
  `isEstimated` tinyint(1) NOT NULL DEFAULT '0',
  `sourceSnapshot` longtext COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tnhdcxucgqsbqwyntfawfasqpkbnlkxfxres` (`orderId`),
  CONSTRAINT `fk_djtnuvfwwucbgtthwspaftdolzxtrsjvfijd` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderhistories`
--

DROP TABLE IF EXISTS `commerce_orderhistories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_orderhistories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `userId` int DEFAULT NULL,
  `userName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `prevStatusId` int DEFAULT NULL,
  `newStatusId` int DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmguuqhcnryndvqdsqzfvbwqiuwrmamwcejv` (`newStatusId`),
  KEY `idx_dkopbltxsfmftvxxeyewaddpjjfspuvbzclc` (`orderId`),
  KEY `idx_dbkpexpiekynxtldkfaezagcepsksxmoyucv` (`prevStatusId`),
  KEY `idx_pcgrpckzeryauervtsgtzfghqzrnuouidnxd` (`userId`),
  CONSTRAINT `fk_cxrvrfhhadorgqwattslimtufzftdnblfnop` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diwrgnrcmzfuiqawbpmgihvohyfygboupwye` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gszvnuhkihfqkqbgeblpvfcjdnawqapdlslz` FOREIGN KEY (`prevStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_xoijjzitnvpijprlgryspadltlyhhjcllpyn` FOREIGN KEY (`newStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_ordernotices`
--

DROP TABLE IF EXISTS `commerce_ordernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_ordernotices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attribute` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eenvririziravirszoujxilrnzeaxawognvp` (`orderId`),
  CONSTRAINT `fk_mehokvttkfxhchgrfpyfqyshlhgxbaphcmkt` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orders`
--

DROP TABLE IF EXISTS `commerce_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_orders` (
  `id` int NOT NULL,
  `storeId` int NOT NULL,
  `billingAddressId` int DEFAULT NULL,
  `shippingAddressId` int DEFAULT NULL,
  `estimatedBillingAddressId` int DEFAULT NULL,
  `estimatedShippingAddressId` int DEFAULT NULL,
  `sourceShippingAddressId` int DEFAULT NULL,
  `sourceBillingAddressId` int DEFAULT NULL,
  `gatewayId` int DEFAULT NULL,
  `paymentSourceId` int DEFAULT NULL,
  `customerId` int DEFAULT NULL,
  `orderStatusId` int DEFAULT NULL,
  `number` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `couponCode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `itemTotal` decimal(14,4) DEFAULT '0.0000',
  `itemSubtotal` decimal(14,4) DEFAULT '0.0000',
  `totalQty` int unsigned DEFAULT NULL,
  `totalWeight` decimal(14,4) unsigned DEFAULT '0.0000',
  `total` decimal(14,4) DEFAULT '0.0000',
  `totalPrice` decimal(14,4) DEFAULT '0.0000',
  `totalPaid` decimal(14,4) DEFAULT '0.0000',
  `totalDiscount` decimal(14,4) DEFAULT '0.0000',
  `totalTax` decimal(14,4) DEFAULT '0.0000',
  `totalTaxIncluded` decimal(14,4) DEFAULT '0.0000',
  `totalShippingCost` decimal(14,4) DEFAULT '0.0000',
  `paidStatus` enum('paid','partial','unpaid','overPaid') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `orderCompletedEmail` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `dateOrdered` datetime DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `dateFirstPaid` datetime DEFAULT NULL,
  `dateAuthorized` datetime DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `paymentCurrency` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lastIp` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `orderLanguage` varchar(12) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `origin` enum('web','cp','remote') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'web',
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `registerUserOnOrderComplete` tinyint(1) NOT NULL DEFAULT '0',
  `saveBillingAddressOnOrderComplete` tinyint(1) NOT NULL DEFAULT '0',
  `makePrimaryBillingAddress` tinyint(1) NOT NULL DEFAULT '0',
  `saveShippingAddressOnOrderComplete` tinyint(1) NOT NULL DEFAULT '0',
  `makePrimaryShippingAddress` tinyint(1) NOT NULL DEFAULT '0',
  `recalculationMode` enum('all','none','adjustmentsOnly') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'all',
  `returnUrl` text COLLATE utf8mb4_unicode_520_ci,
  `cancelUrl` text COLLATE utf8mb4_unicode_520_ci,
  `shippingMethodHandle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `shippingMethodName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `orderSiteId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_atbgxetdztktcdfgitwozkauhbkanfzzvyvs` (`number`),
  KEY `idx_muhhkmloskbsqgueicbnxodyizqchynjqese` (`billingAddressId`),
  KEY `idx_eqxcaroxqdrqdtbzuufifwvorwevlpcopfqy` (`customerId`),
  KEY `idx_ljgswrdjsircqltflkcoqbkrdzfeqpfzkfvy` (`email`),
  KEY `idx_lercindttpwjqdhxhwvcohkqchvckhptvhrc` (`estimatedBillingAddressId`),
  KEY `idx_hnwredljtjzaxwpsaemqcyygsxfeeseajcev` (`estimatedShippingAddressId`),
  KEY `idx_grktrdjjuvudvyrlossccfcjvmfslepgcaya` (`gatewayId`),
  KEY `idx_fyaojhxadrcvjjmqcakwqzihffgwyqkrwoin` (`orderStatusId`),
  KEY `idx_huolxegzjabyohimzizndjkaunqqasglovvn` (`reference`),
  KEY `idx_qowrtfymijztkjwjsvucslnfciraqlvouwfq` (`shippingAddressId`),
  KEY `idx_yxturiaedvvpxiyyyidhuvcfslmpvubdtvpw` (`sourceBillingAddressId`),
  KEY `idx_mrsbzvgimlulmguigrfltsgdmvrsreyhogmq` (`sourceShippingAddressId`),
  KEY `idx_wttumtmfgzkfvmwahsmspewqsbidignqjstf` (`storeId`),
  KEY `fk_vnubxgjptczlxpdnzdapdlbqaragbadctpsh` (`paymentSourceId`),
  CONSTRAINT `fk_fgeireqtwaeatheoputmrcibbjqixjlolxya` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_igzpkxlnsxhtpgmwyqwmakuheesmzvlmsgnp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jhleceppzebrvdvutadfkkkpdewlmjpyecve` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vmogyncxigpwmvknxhsfnbrjkzmfpyhznqma` FOREIGN KEY (`shippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vnubxgjptczlxpdnzdapdlbqaragbadctpsh` FOREIGN KEY (`paymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wydvfgnxsiuhkqnwlznhokouxbehxvtdikcg` FOREIGN KEY (`billingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xnmlkjvmhkgqcergmpimfiejllpcngfikmhs` FOREIGN KEY (`estimatedShippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xqomsxhfezwlwfiwsiahqvittjwxgklhbabx` FOREIGN KEY (`estimatedBillingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zcgteqqxsevtiinnoulfhafidavcbpgyjyvz` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zyzjschegfuibonepatbgnpscqiarcqnkibm` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatus_emails`
--

DROP TABLE IF EXISTS `commerce_orderstatus_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_orderstatus_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderStatusId` int NOT NULL,
  `emailId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vweorcfxjtkcvegzjphosdceqbtbassrjxit` (`emailId`),
  KEY `idx_izacumvffvfogtyxvebwpiuxmseubruuqngu` (`orderStatusId`),
  CONSTRAINT `fk_ukqaciofxyfapbvpsgaimbhkejpuombcairs` FOREIGN KEY (`emailId`) REFERENCES `commerce_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_unvkyumtptprqbuanassqafyucntzulxqhlu` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_orderstatuses`
--

DROP TABLE IF EXISTS `commerce_orderstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_orderstatuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'green',
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_myoweetnkealwcavrgdukrsikalrokowrcrw` (`storeId`),
  CONSTRAINT `fk_kcwbumdllvpkqufoahlbeehvxcbkfyvyngjw` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentcurrencies`
--

DROP TABLE IF EXISTS `commerce_paymentcurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_paymentcurrencies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int NOT NULL,
  `iso` varchar(3) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `rate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rbnvtykhbhccmjcxldorfnoycieymkjntgvk` (`iso`),
  KEY `fk_qvutjbjvffmfozspeycqszloyerqcwtwxmcr` (`storeId`),
  CONSTRAINT `fk_qvutjbjvffmfozspeycqszloyerqcwtwxmcr` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_paymentsources`
--

DROP TABLE IF EXISTS `commerce_paymentsources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_paymentsources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `gatewayId` int NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `response` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gdzracsroxkywkieagernoofkhigzthvlxam` (`customerId`),
  KEY `fk_gpraxecvgjbkzkzawaorwmbdtmyswbugsrnd` (`gatewayId`),
  CONSTRAINT `fk_gdzracsroxkywkieagernoofkhigzthvlxam` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gpraxecvgjbkzkzawaorwmbdtmyswbugsrnd` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_pdfs`
--

DROP TABLE IF EXISTS `commerce_pdfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_pdfs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `templatePath` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fileNameFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `paperOrientation` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'portrait',
  `paperSize` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'letter',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `linkExpiry` int NOT NULL DEFAULT '86400',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tiimipsydtxddieofrsaggcgqtohviswetdj` (`handle`),
  KEY `idx_uwlmdmtomlffdejefhcsuznysqjehclnbjbi` (`storeId`),
  CONSTRAINT `fk_dheextmiuwyhdyjoqczkxirojswdklvoyvpc` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_plans`
--

DROP TABLE IF EXISTS `commerce_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gatewayId` int DEFAULT NULL,
  `planInformationId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `planData` text COLLATE utf8mb4_unicode_520_ci,
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `sortOrder` int DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iqhryyfsfdxrgncboowdocmhonkwvyynzyyi` (`handle`),
  KEY `idx_tlbmpxgutfjvqzymcuaozphusqjszxmengik` (`gatewayId`),
  KEY `idx_hdkyyidgepoyrajbnuhxqggjdoqpzfofxqig` (`reference`),
  KEY `fk_sfgyzslcnawctcdjjzpheveltmurgzhptxvd` (`planInformationId`),
  CONSTRAINT `fk_nicfjzgsnsnykonkkhvjfxmastxixufwlzfo` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfgyzslcnawctcdjjzpheveltmurgzhptxvd` FOREIGN KEY (`planInformationId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_products`
--

DROP TABLE IF EXISTS `commerce_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_products` (
  `id` int NOT NULL,
  `typeId` int DEFAULT NULL,
  `defaultVariantId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `defaultSku` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `defaultPrice` decimal(14,4) DEFAULT NULL,
  `defaultHeight` decimal(14,4) DEFAULT NULL,
  `defaultLength` decimal(14,4) DEFAULT NULL,
  `defaultWidth` decimal(14,4) DEFAULT NULL,
  `defaultWeight` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lajeooodvzsyuvaemetlgqsuisfkcwnmupqb` (`expiryDate`),
  KEY `idx_xsweobnafrkmbiecubtxgfdekfspyebriubb` (`postDate`),
  KEY `idx_urbjhassxstmvqacmcngbklcelepivjorwqj` (`typeId`),
  KEY `fk_hslqycmoufwkvoyapysqjkgivgorghiafqab` (`defaultVariantId`),
  CONSTRAINT `fk_akrmazhufqnqmojsnvcowbjlrglzobfxhreb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dwlhttxsxovjjkfzzchhsgyshnocqwqmlkmd` FOREIGN KEY (`typeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hslqycmoufwkvoyapysqjkgivgorghiafqab` FOREIGN KEY (`defaultVariantId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes`
--

DROP TABLE IF EXISTS `commerce_producttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_producttypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isStructure` tinyint(1) NOT NULL DEFAULT '0',
  `maxLevels` smallint unsigned DEFAULT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'end',
  `structureId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `variantFieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxVariants` int DEFAULT NULL,
  `hasDimensions` tinyint(1) NOT NULL DEFAULT '0',
  `hasVariantTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `variantTitleFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `variantTitleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `variantTitleTranslationKeyFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `variantUiLabelFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '{title}',
  `hasProductTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `productTitleFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `productTitleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `productTitleTranslationKeyFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `productUiLabelFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '{title}',
  `showSlugField` tinyint(1) NOT NULL DEFAULT '1',
  `slugTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `propagationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'all',
  `previewTargets` json DEFAULT NULL,
  `skuFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `descriptionFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lovyrjmwmtsivbujjycsbxyyfzhxxtutwosm` (`handle`),
  KEY `idx_befzzkxsdgtdtagcocnmyohacojuiuzfawri` (`structureId`),
  KEY `idx_lpbjzzfhtkbsvstnnquzsybetxoldmfqbamu` (`fieldLayoutId`),
  KEY `idx_zceyowezgnxzklsnyidipaqougzyujhbufds` (`variantFieldLayoutId`),
  CONSTRAINT `fk_hyvqpmkghwvxvmxtqawsruowdqomqdxykhfc` FOREIGN KEY (`variantFieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sechjdhmdnpjtcooczjoxwrhjpeqgmdgthmi` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vfbovbinujywpoklkqlmpsollvwdtwztfqej` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_producttypes_shippingcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productTypeId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_emfpjnxbvchpaoqemvdhdrekxppbpgphwvwy` (`productTypeId`,`shippingCategoryId`),
  KEY `idx_wtupolvhnbhqajykrutymtqhbfjwtemhmhts` (`shippingCategoryId`),
  CONSTRAINT `fk_qfsepbivzzkozkqwugcgnisoxiruyohpeqrm` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tapyqeswoxjllegjfhkohggoeeojzmwebcfp` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_sites`
--

DROP TABLE IF EXISTS `commerce_producttypes_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_producttypes_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productTypeId` int NOT NULL,
  `siteId` int NOT NULL,
  `uriFormat` text COLLATE utf8mb4_unicode_520_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ellqktejbmrycxqimnmxhvysscackpusvujd` (`productTypeId`,`siteId`),
  KEY `idx_gjoweofjazfchqmvwakpliychafyprjoxrng` (`siteId`),
  CONSTRAINT `fk_fofwygrozkxxxkmrbgovjhutyidemqpsazlh` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ipnchrntbcabzgeojwnnftdhjvmyzndsqnqh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_producttypes_taxcategories`
--

DROP TABLE IF EXISTS `commerce_producttypes_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_producttypes_taxcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productTypeId` int NOT NULL,
  `taxCategoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xudpiwvalqsxcfjanvyhqrpdmigbpntaswrt` (`productTypeId`,`taxCategoryId`),
  KEY `idx_irvlboihqcdgppquwvpbzrthbsdowpglxkti` (`taxCategoryId`),
  CONSTRAINT `fk_ayldxnrpivlvabowhfsbducpglinlqsriefv` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkzkfbqkvznjnakfbodrrasnbjbiimwcmmrj` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_purchasables`
--

DROP TABLE IF EXISTS `commerce_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `width` decimal(14,4) DEFAULT NULL,
  `height` decimal(14,4) DEFAULT NULL,
  `length` decimal(14,4) DEFAULT NULL,
  `weight` decimal(14,4) DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_glcsuellnjalrfjhkkhzunelfpstedxhqvkz` (`sku`),
  KEY `fk_yaansxfwbpuuocjzrswdgofrnnnjybmvqtwz` (`taxCategoryId`),
  CONSTRAINT `fk_kjkqctxyyhaljrlwesgcybghuhvehhjklqcx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yaansxfwbpuuocjzrswdgofrnnnjybmvqtwz` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_purchasables_stores`
--

DROP TABLE IF EXISTS `commerce_purchasables_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_purchasables_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `purchasableId` int NOT NULL,
  `storeId` int NOT NULL,
  `basePrice` decimal(14,4) DEFAULT NULL,
  `basePromotionalPrice` decimal(14,4) DEFAULT NULL,
  `promotable` tinyint(1) NOT NULL DEFAULT '0',
  `availableForPurchase` tinyint(1) NOT NULL DEFAULT '1',
  `freeShipping` tinyint(1) NOT NULL DEFAULT '1',
  `inventoryTracked` tinyint(1) NOT NULL DEFAULT '1',
  `allowOutOfStockPurchases` tinyint(1) NOT NULL DEFAULT '0',
  `stock` int DEFAULT NULL,
  `tracked` tinyint(1) NOT NULL DEFAULT '0',
  `minQty` int DEFAULT NULL,
  `maxQty` int DEFAULT NULL,
  `shippingCategoryId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ecsmfdzvrumzywtxwoisxlwagwhrdvvpxaxm` (`purchasableId`),
  KEY `idx_uccjgagxdhyzthuewzxdjohudmugmcbjstvs` (`storeId`),
  KEY `fk_hexaesdpbpjxdedecolkhmcwtudpwnfrvfba` (`shippingCategoryId`),
  CONSTRAINT `fk_amjuopsutqlmxmjenntxjpronuitidbsvfrx` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hexaesdpbpjxdedecolkhmcwtudpwnfrvfba` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kxpqqojlhvxnesamfndauubfscflydavmkcn` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_riwovdpnqmhhysduyjloehfzjowwjnqzdwnz` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_categories`
--

DROP TABLE IF EXISTS `commerce_sale_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_sale_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleId` int NOT NULL,
  `categoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cxfnojixeprxzwrlsfjphmluwjrdjmkhluhg` (`saleId`,`categoryId`),
  KEY `idx_qkpnmiojowyycwrqhugeorhsyscutayrvzwl` (`categoryId`),
  CONSTRAINT `fk_ugnlepwogqytmievqsrlwzdddemydfidwvvn` FOREIGN KEY (`categoryId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wxctiwlkbghpmqrbuzmzjrshzghqfrydhgdd` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_purchasables`
--

DROP TABLE IF EXISTS `commerce_sale_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_sale_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleId` int NOT NULL,
  `purchasableId` int NOT NULL,
  `purchasableType` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uedketjpfmfhtakyvjhqovrduzvmrakclcvl` (`saleId`,`purchasableId`),
  KEY `idx_lrbzejbtdsniutadxvbtnrwoxmysxdghonoe` (`purchasableId`),
  CONSTRAINT `fk_dfzlcwztncerpouiivschancgfeoqipqzeuh` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wtrjowttfcfiapplisnqtsvojdffaivdcbgz` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sale_usergroups`
--

DROP TABLE IF EXISTS `commerce_sale_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_sale_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleId` int NOT NULL,
  `userGroupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tmrlygzfpafeaolkkndhoutcfyhxlpbguizw` (`saleId`,`userGroupId`),
  KEY `idx_broopqplhovoiyrnwssvlfahskeioeoavjmx` (`userGroupId`),
  CONSTRAINT `fk_blgfsjckphofvwwkujhnqtxdfaclfexumllk` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dmevqotpyuggsfwdudzawuybgagqiwrxxgwy` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sales`
--

DROP TABLE IF EXISTS `commerce_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `allGroups` tinyint(1) NOT NULL DEFAULT '0',
  `allPurchasables` tinyint(1) NOT NULL DEFAULT '0',
  `allCategories` tinyint(1) NOT NULL DEFAULT '0',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'element',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `ignorePrevious` tinyint(1) NOT NULL DEFAULT '0',
  `stopProcessing` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingcategories`
--

DROP TABLE IF EXISTS `commerce_shippingcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_shippingcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hahbkvnoeqwkkjonqwdpikoczmxrqtsfselq` (`storeId`),
  CONSTRAINT `fk_xdzcetqdmzhtuevkablmvosthyimtfkblxhd` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingmethods`
--

DROP TABLE IF EXISTS `commerce_shippingmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_shippingmethods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `orderCondition` text COLLATE utf8mb4_unicode_520_ci,
  `customerCondition` text COLLATE utf8mb4_unicode_520_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmvzslshkhpmlyahaqsimoisibdjddwbdqef` (`name`),
  KEY `idx_gqwktmbexcofozfiuixtyvxwcembmmtgvgsp` (`storeId`),
  CONSTRAINT `fk_ceahsstjgwfttjkpvhmndrrkiytmtadiqhud` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrule_categories`
--

DROP TABLE IF EXISTS `commerce_shippingrule_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_shippingrule_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shippingRuleId` int DEFAULT NULL,
  `shippingCategoryId` int DEFAULT NULL,
  `condition` enum('allow','disallow','require') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `perItemRate` decimal(14,4) DEFAULT NULL,
  `weightRate` decimal(14,4) DEFAULT NULL,
  `percentageRate` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gwzpjexrsczbijqkdxjofpbxloujrmajjems` (`shippingCategoryId`),
  KEY `idx_lwjbjmlijzecwwfnpldknxsojhwbwzyrhlzv` (`shippingRuleId`),
  CONSTRAINT `fk_pcwgddjeglbncziwwbzmsghqijkyshdthhcm` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tbnugguzghaajcqpkdsmnqciryslkmmllsjx` FOREIGN KEY (`shippingRuleId`) REFERENCES `commerce_shippingrules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingrules`
--

DROP TABLE IF EXISTS `commerce_shippingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_shippingrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `methodId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `orderConditionFormula` text COLLATE utf8mb4_unicode_520_ci,
  `orderCondition` text COLLATE utf8mb4_unicode_520_ci,
  `customerCondition` text COLLATE utf8mb4_unicode_520_ci,
  `baseRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `perItemRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `weightRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentageRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `minRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `maxRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zwbthzjpbjrrzlkearmhztpenuwacdprirys` (`methodId`),
  KEY `idx_dojdwqzybhiczckavzwisefwfxvlijhzsobi` (`name`),
  CONSTRAINT `fk_naapmagqqiahxipzxnrmxbigsmrfdgqqwohj` FOREIGN KEY (`methodId`) REFERENCES `commerce_shippingmethods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_shippingzones`
--

DROP TABLE IF EXISTS `commerce_shippingzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_shippingzones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_520_ci,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ylkvyfltlnltnydosgsadylcaopvpxadvoly` (`name`),
  KEY `idx_mqtjmsosgjigkgwxnbnaiwuplaeglxkopahf` (`storeId`),
  CONSTRAINT `fk_cnfehjfezqwirlhpbftzgbpqezbekqrrfdjn` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_site_stores`
--

DROP TABLE IF EXISTS `commerce_site_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_site_stores` (
  `siteId` int NOT NULL,
  `storeId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_stores`
--

DROP TABLE IF EXISTS `commerce_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'USD',
  `autoSetCartShippingMethodOption` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `autoSetNewCartAddresses` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `autoSetPaymentSource` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `allowEmptyCartOnCheckout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `allowCheckoutWithoutPayment` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `allowPartialPaymentOnCheckout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `requireShippingAddressAtCheckout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `requireBillingAddressAtCheckout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `requireShippingMethodSelectionAtCheckout` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `useBillingAddressForTax` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `validateOrganizationTaxIdAsVatId` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'false',
  `orderReferenceFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `freeOrderPaymentStrategy` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'complete',
  `minimumTotalPriceStrategy` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'default',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_storesettings`
--

DROP TABLE IF EXISTS `commerce_storesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_storesettings` (
  `id` int NOT NULL,
  `locationAddressId` int DEFAULT NULL,
  `countries` text COLLATE utf8mb4_unicode_520_ci,
  `marketAddressCondition` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_mydaptinhcojxpmdaelrhhahaqwukcewfvpf` (`locationAddressId`),
  CONSTRAINT `fk_mydaptinhcojxpmdaelrhhahaqwukcewfvpf` FOREIGN KEY (`locationAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zqjiawklakqzpjwvwubdleypycavkmwnciyq` FOREIGN KEY (`id`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_subscriptions`
--

DROP TABLE IF EXISTS `commerce_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `planId` int DEFAULT NULL,
  `gatewayId` int DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subscriptionData` text COLLATE utf8mb4_unicode_520_ci,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL DEFAULT '0',
  `returnUrl` text COLLATE utf8mb4_unicode_520_ci,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oewwxhwgxrfshhlvquzbkptgwyoanfxqoous` (`reference`),
  KEY `idx_jqpwppaqzytwadqmxzitttgjgffnkrctvgoz` (`dateCreated`),
  KEY `idx_mrcxscowjasuklraqhukbixaflqztvtwizga` (`dateExpired`),
  KEY `idx_svagfivqubbovlushklvhiaepogenpbkuzys` (`gatewayId`),
  KEY `idx_qebosrufjdggrkcqbcgpihwoquvtjnfhqukw` (`nextPaymentDate`),
  KEY `idx_ewcxmloicefkikeyfveeujwjesrkutxrvmli` (`planId`),
  KEY `idx_hfnanekwwkewtahuyvqfxrcacmjfsvirkxis` (`userId`),
  KEY `fk_tlokljgguteiokgswagkgpbeazsdsnxyjsmy` (`orderId`),
  CONSTRAINT `fk_attgeqbumbiygebiemakdavxotqkdtvyblvn` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_khmnmrbzwrgzogekthditzyreiwjzlvhuckx` FOREIGN KEY (`planId`) REFERENCES `commerce_plans` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_tlokljgguteiokgswagkgpbeazsdsnxyjsmy` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wuvfkhdiavtfzidllsypebjtkticifnijvdj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xybziwusimiimtqfnqbivkhitqyctjgbucpu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxcategories`
--

DROP TABLE IF EXISTS `commerce_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_taxcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxrates`
--

DROP TABLE IF EXISTS `commerce_taxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_taxrates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int NOT NULL,
  `taxZoneId` int DEFAULT NULL,
  `isEverywhere` tinyint(1) NOT NULL DEFAULT '1',
  `taxCategoryId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `rate` decimal(14,10) NOT NULL,
  `include` tinyint(1) NOT NULL DEFAULT '0',
  `isVat` tinyint(1) NOT NULL DEFAULT '0',
  `taxIdValidators` text COLLATE utf8mb4_unicode_520_ci,
  `removeIncluded` tinyint(1) NOT NULL DEFAULT '0',
  `removeVatIncluded` tinyint(1) NOT NULL DEFAULT '0',
  `taxable` enum('purchasable','price','shipping','price_shipping','order_total_shipping','order_total_price') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ejpncatgiybwgihionlnpanfqqkrsksytexu` (`storeId`),
  KEY `idx_zihdknjzibkjcbspsgupdditnpbniivngmpf` (`taxCategoryId`),
  KEY `idx_mkntsenkqktwdwfllbfiwekopuhmgujinwxt` (`taxZoneId`),
  CONSTRAINT `fk_dowcofwvyephujrhlyhceuugedvrjuulakli` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pekqzvnsarydlbvaugyzgifxnvfumfkkqhsm` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_vhvbptnprqismvhpuxzrfwvkphnocijgcrox` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxzones`
--

DROP TABLE IF EXISTS `commerce_taxzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_taxzones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `storeId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_520_ci,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzhbkhhldbzhbvxywkszddkseziwyfoxkgdl` (`name`),
  KEY `idx_sgrlnmevnegpejtyhconzwjphbvfvglcmwpq` (`storeId`),
  CONSTRAINT `fk_zjvurtztibxlukituyutjwzwrhmctqjwblmp` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transactions`
--

DROP TABLE IF EXISTS `commerce_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `gatewayId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `type` enum('authorize','capture','purchase','refund') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `paymentAmount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `paymentCurrency` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `paymentRate` decimal(14,4) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `note` mediumtext COLLATE utf8mb4_unicode_520_ci,
  `response` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_snmkfvzhshojczakrupmunhckckgjrrctyxz` (`gatewayId`),
  KEY `idx_lrnmjdgksdhczoslqinkgzgoovxfrzjmacso` (`orderId`),
  KEY `idx_dqvvmjwbkwlwkgwxfiidodnjndtbwxvtgyxl` (`parentId`),
  KEY `idx_cjpqadffbcwuwkctmqcpdjrrmwbnjtlucsiz` (`userId`),
  KEY `idx_ujixhrisrvdpkvwnxmmtdpnfaokfftkftmsk` (`hash`),
  CONSTRAINT `fk_axhnsyhjwkyvieklskmagilptnumqanezare` FOREIGN KEY (`parentId`) REFERENCES `commerce_transactions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bydfcanffvxafngjxnsgzgsjedcgtplsstye` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mmtsbxtiybyhbfuqxytnkouchpjkkusykapy` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_xeqhibpmobumyubxglcvbeojupmvozjxohca` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transferdetails`
--

DROP TABLE IF EXISTS `commerce_transferdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_transferdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transferId` int NOT NULL,
  `inventoryItemId` int DEFAULT NULL,
  `inventoryItemDescription` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `quantity` int NOT NULL,
  `quantityAccepted` int NOT NULL,
  `quantityRejected` int NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jstutsryhqghswvqowsfibpfkydqgeqiqlfg` (`transferId`),
  KEY `idx_rdvovpguwrkffsobkfawqvrythobzcphjxyi` (`inventoryItemId`),
  CONSTRAINT `fk_lcdomhfhezxkexdqffwmptrvowlrtbzugwrt` FOREIGN KEY (`transferId`) REFERENCES `commerce_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mkfrvrwoeiicfjkybdnrrzngvmhlueogwlmh` FOREIGN KEY (`inventoryItemId`) REFERENCES `commerce_inventoryitems` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transfers`
--

DROP TABLE IF EXISTS `commerce_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_transfers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transferStatus` enum('draft','pending','partial','received') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `originLocationId` int DEFAULT NULL,
  `destinationLocationId` int DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hacrfztncdjnkzpyjkdknlxsqznxfjvodfnv` (`destinationLocationId`),
  KEY `idx_upicggbfjxvpzqtfkwpvfnnloqxchttlssta` (`originLocationId`),
  CONSTRAINT `fk_lfnwcgsfabnfjxnjpeyszlzztwuqbjmunjfc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_variants`
--

DROP TABLE IF EXISTS `commerce_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_variants` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `deletedWithProduct` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qsukhhctuydmtvyanhhucxyuceiegxyyypjl` (`primaryOwnerId`),
  CONSTRAINT `fk_nkjfwwkifvtdfyujlqflhoeydbrnnjtubtqf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rycofvndqkzuwknexmgsupdjqislwyzdiodp` FOREIGN KEY (`primaryOwnerId`) REFERENCES `commerce_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gaowystpdojbzbixyatqatnaxmykcuxwsssc` (`primaryOwnerId`),
  KEY `idx_zvyaycsjgtapqcafehbmwcodtxmuopvqixno` (`fieldId`),
  CONSTRAINT `fk_rmbqvqdlrakrfultjjchnnkvmfybwjfiyuhe` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdmrfhnbjmlkpgaenhxprlrlpsqsatahcbqu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpdnutbgxlerkhhbwnvrktopmojpfznhkkxy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tjfllkquxfnnenmfdcwftryshozetcmodeoc` (`userId`),
  CONSTRAINT `fk_tjfllkquxfnnenmfdcwftryshozetcmodeoc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zpimwtubjoxmbjslxirlwccqnouprmlpblqq` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_dpyfbaaqmpwyoadwlotbxqprhmosodguqzdp` (`creatorId`,`provisional`),
  KEY `idx_prphrcvfijvozmmrdykzhgudxgltwauatbia` (`saved`),
  KEY `fk_ayvxjzufrejhzntmcfhbitwrvohqtksagpzb` (`canonicalId`),
  CONSTRAINT `fk_ayvxjzufrejhzntmcfhbitwrvohqtksagpzb` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xobgohuzxhtczunzticevktrgsltebhkudbe` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_oxyfotodpvfwnmwjphooargtsufkzdlogpcv` (`elementId`,`timestamp`,`userId`),
  KEY `fk_srwkqzaqzdufxtoqsqypdcqkkukoylnjactw` (`userId`),
  KEY `fk_hgyvreeisnxhuvmepwyqrlugiqvoklwfhfjd` (`siteId`),
  KEY `fk_hpcefxriwfbxrtpwbealdnhptvcdqwlefdol` (`draftId`),
  CONSTRAINT `fk_dxvpvfoddooseazbbaerqmqxidfzirwippfv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hgyvreeisnxhuvmepwyqrlugiqvoklwfhfjd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hpcefxriwfbxrtpwbealdnhptvcdqwlefdol` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_srwkqzaqzdufxtoqsqypdcqkkukoylnjactw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tgufjmdzgdeiuwqtcclolkrtvsaybzuhapzw` (`dateDeleted`),
  KEY `idx_shgmygttuwtjwhncketkelkvccuhbupzewel` (`fieldLayoutId`),
  KEY `idx_rqceqrhqesjfvnujaljgeutflszdecotlmdb` (`type`),
  KEY `idx_ozbzftlzaknnjpmdohmipfycxvggfixbxobt` (`enabled`),
  KEY `idx_ibazycbvxdaecwzxfcacqscvgqdscshbuiku` (`canonicalId`),
  KEY `idx_imbancvctggjknsapuihvpkkoitlggkrnhvy` (`archived`,`dateCreated`),
  KEY `idx_sgmpxagolbofgxvseqkgolkcufqcygwtrhpm` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_ocpyjfizdmyixwqgsijcampopycbbctbniso` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_irnoxduggzlilobbnnrkbbobpblxektynuxy` (`draftId`),
  KEY `fk_cmnkanargybbdsmgvuitafsbllhwpjfzalvq` (`revisionId`),
  CONSTRAINT `fk_cmnkanargybbdsmgvuitafsbllhwpjfzalvq` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hwidnqdvibdwwffgnkjgiomkpcchmghzipat` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_irnoxduggzlilobbnnrkbbobpblxektynuxy` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_onhirwndwjqmycbkoslurfobwuzqhljxnykv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_geizkylfvrwdrzrzznllsohqngijechcrciq` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `idx_yabdgzituphpigqpblaptmxtwhgfojyemyls` (`sortOrder`),
  KEY `fk_nshlobaupvcggekxmslmxqhkwrkskivjfibs` (`ownerId`),
  CONSTRAINT `fk_cxwrlihewgmtffpbmkiduvugkcvaipnibwov` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nshlobaupvcggekxmslmxqhkwrkskivjfibs` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uiyocbqjwtlzbjhhfbgcvzsnbexjbydzqesl` (`elementId`,`siteId`),
  KEY `idx_uyvbzkuhauktgcnndykbpwjkgimihqqfnsfm` (`siteId`),
  KEY `idx_eunatrjsudxpwblsckoplsfgmqjxktgesfvt` (`title`,`siteId`),
  KEY `idx_oezgsauajkykigadlwzsjfprxvbddepwtisi` (`slug`,`siteId`),
  KEY `idx_ybwtrthuxitmpkkftsagjftcxzadxyvhoosy` (`enabled`),
  KEY `idx_srkfxeginhfjxufmsohflxeagzggnpjqhrbw` (`uri`,`siteId`),
  CONSTRAINT `fk_ilwvmakckovcaqaiozbbytanlsgyvtkazxrq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rthtlkucnowoovbwmsitlkxpegzntithprbz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kqttjdrlzfcxivjvttkxninsafijzygboyqx` (`postDate`),
  KEY `idx_hetpccaxenasjesyjhvzwicwkvqpxylgaepf` (`expiryDate`),
  KEY `idx_wgekienubpkgherkszpllgvfjkkkflpissku` (`status`),
  KEY `idx_osbqxbdnykzlqctlhjxloojsxpuugfmjighu` (`sectionId`),
  KEY `idx_ribvbcnzqclozidtmwqbznrwozutdtbuxfen` (`typeId`),
  KEY `idx_hhldhdfjubkotyxifjknejuhmgsijuxywzyz` (`primaryOwnerId`),
  KEY `idx_hwdvbsssaprlrjwgnmysbgvmynmzqukpjmcp` (`fieldId`),
  KEY `fk_vheubdzodvrzzhnmarckhyrabklulembkahg` (`parentId`),
  CONSTRAINT `fk_biuewknuwfovanspjmytjhlvjlmabizghgdq` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fsabkmznacyilksxnocyqgdvscjnyrvvgdkd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jiucuehotvnpxppejvgbmifxkkduwvuhrizb` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_poesgdlmmxsphfbripiacndfvpmzexbbicrg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_szrkqlwugwmvtjzhowaxduqwrdgxsylkzwiu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vheubdzodvrzzhnmarckhyrabklulembkahg` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_lhfxtvmybnaykayqstkteivcpfmedzcbslsr` (`authorId`),
  KEY `idx_ybzaklwnsttflrqevwdmegvllaghdkxtxraj` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_kwkypmsgehoanheldrhdnwryeklgwlwwmswd` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qdttlezsxzhofjkchpvyesuenpuuoffccmvq` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `icon` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `uiLabelFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '{title}',
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_520_ci,
  `titleFormat` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `allowLineBreaksInTitles` tinyint(1) NOT NULL DEFAULT '0',
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text COLLATE utf8mb4_unicode_520_ci,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifiitucuhqqhuilguzyhjsecncmjxnkyxtju` (`fieldLayoutId`),
  KEY `idx_jtdqpdenrgpsgbocczqletggweymwcavzzrw` (`dateDeleted`),
  CONSTRAINT `fk_atqxuuxirvpoxnwarqiscgrranaofibfbxoc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wuykhwvpmpiquooycvkpwhpxiekphrrsldmy` (`dateDeleted`),
  KEY `idx_xkcgewsjgqyltshbivhisigfoblogfwehwhs` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_520_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb4_unicode_520_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_anrgurexdbhhoylrgzsypkfvkgecnmxnjwto` (`handle`,`context`),
  KEY `idx_aqmjuwmzlizuczcwioyxuxzractnxbzuchrh` (`context`),
  KEY `idx_cbvnqjvfcvyoodmvccksnmttkdjhkothjayr` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_emailtemplates`
--

DROP TABLE IF EXISTS `formie_emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_emailtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayout_pages`
--

DROP TABLE IF EXISTS `formie_fieldlayout_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_fieldlayout_pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `label` text NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wjlrxjsqsjjvfkzalxwrqmicdejxfmzaweee` (`layoutId`),
  CONSTRAINT `fk_wazrpojqcjzlerilogmislrhygxlrhhbvasa` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayout_rows`
--

DROP TABLE IF EXISTS `formie_fieldlayout_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_fieldlayout_rows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `pageId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gvqxnttswcumxofszgyteaedtptdhnqadwiv` (`layoutId`),
  KEY `idx_ikinrczgubwisvbiptpwvisrxykroldbflsv` (`pageId`),
  CONSTRAINT `fk_bkwkwofdgevupqkfkwyntoyxnkafbprggcac` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_znwklkzjsucimzknezmeytiowfszkdhrxiuq` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fieldlayouts`
--

DROP TABLE IF EXISTS `formie_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_fields`
--

DROP TABLE IF EXISTS `formie_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `pageId` int NOT NULL,
  `rowId` int NOT NULL,
  `syncId` int DEFAULT NULL,
  `label` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `settings` mediumtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mjvgxvxhcwuipjdalsltehbxndxqmgwzzpta` (`layoutId`),
  KEY `idx_rzqhqdxjideiazliduardqbvzpakbghcqozp` (`pageId`),
  KEY `idx_upjjrnyuleawbnostiyhhzflmoeinczcbkgu` (`rowId`),
  KEY `idx_bkmdtehrqfdindgkiizwpwqqwyvijycxkpeo` (`syncId`),
  KEY `idx_cgmdmvudjfeqjvbdibtnhhdnujuuublxiquw` (`handle`),
  CONSTRAINT `fk_bfghtcdvldacsxtseswpwdmahidntihprkgq` FOREIGN KEY (`rowId`) REFERENCES `formie_fieldlayout_rows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cjiwyafmnrhdvusuojnuttofcdiabnnqravr` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nuehuuwisfswergbwounqxmibnijprejzwev` FOREIGN KEY (`pageId`) REFERENCES `formie_fieldlayout_pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nzsbombrulxsnhpffnqkmystfqgpvhdyjuuh` FOREIGN KEY (`syncId`) REFERENCES `formie_fields` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_forms`
--

DROP TABLE IF EXISTS `formie_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) NOT NULL,
  `settings` mediumtext,
  `layoutId` int DEFAULT NULL,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdrykkclslbibmnuaynigsjxdigvjednpxnz` (`layoutId`),
  KEY `idx_fgcjbgyecvriumdwbljtzsjlsuwthqriqdoh` (`templateId`),
  KEY `idx_ubwforibitfrwzguqecqfbngsesbskxrsfog` (`defaultStatusId`),
  KEY `idx_xpmkodtnvqrszkvqbgzdyhawfyfcedcmmucl` (`submitActionEntryId`),
  KEY `idx_naiaqkfvmklxsrpacecrepdzvfcwvlerozxs` (`submitActionEntrySiteId`),
  CONSTRAINT `fk_dvqwulmowxhlysqhgxkvrfzugeiwuubguntp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jtnofoghlajnojgbbglzclywqtwrqydqwyqz` FOREIGN KEY (`layoutId`) REFERENCES `formie_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_krvzkmvpcpflrdwlddpupojrnkkkyuebdutt` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nxcpbzbfyjtwxcbibzibsgwzxrhbrfwtympe` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zqkytgztyricgsjlamkkmgzazceofuctopir` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_formtemplates`
--

DROP TABLE IF EXISTS `formie_formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_formtemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT '1',
  `outputCssLayout` tinyint(1) DEFAULT '1',
  `outputCssTheme` tinyint(1) DEFAULT '1',
  `outputJsBase` tinyint(1) DEFAULT '1',
  `outputJsTheme` tinyint(1) DEFAULT '1',
  `outputCssLocation` varchar(255) DEFAULT NULL,
  `outputJsLocation` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zbnauwwijvebqkqttqifuzmpnlblwrxgxpgo` (`fieldLayoutId`),
  CONSTRAINT `fk_rccftairsgcpcmgvivbrugjtzlvqypomndxv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_integrations`
--

DROP TABLE IF EXISTS `formie_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_integrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `settings` mediumtext,
  `cache` longtext,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_notifications`
--

DROP TABLE IF EXISTS `formie_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `templateId` int DEFAULT NULL,
  `pdfTemplateId` int DEFAULT NULL,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `subject` text,
  `recipients` enum('email','conditions') NOT NULL DEFAULT 'email',
  `to` text,
  `toConditions` text,
  `cc` text,
  `bcc` text,
  `replyTo` text,
  `replyToName` text,
  `from` text,
  `fromName` text,
  `sender` text,
  `content` text,
  `attachFiles` tinyint(1) DEFAULT '1',
  `attachPdf` tinyint(1) DEFAULT '0',
  `attachAssets` text,
  `enableConditions` tinyint(1) DEFAULT '0',
  `conditions` text,
  `customSettings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ipuzpnfmywhwlnivxyciimtbdgnzzczzbdbp` (`formId`),
  KEY `idx_iorxkuhgxcwdhcnudaugjibfohenteogmkic` (`templateId`),
  KEY `fk_gnhzrsicgfjgdtrfuecgbtpaobbapkkfhebd` (`pdfTemplateId`),
  CONSTRAINT `fk_gnhzrsicgfjgdtrfuecgbtpaobbapkkfhebd` FOREIGN KEY (`pdfTemplateId`) REFERENCES `formie_pdftemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lqudnyurhugcefbptfrivungdjcwgqadyzvd` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_oziwwtsknysokpaipabpaodoczemststrrru` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments`
--

DROP TABLE IF EXISTS `formie_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `submissionId` int NOT NULL,
  `fieldId` int NOT NULL,
  `subscriptionId` int DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text,
  `redirectUrl` text,
  `note` mediumtext,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uoxzlbvpwvvntmacravjjnegkugldbukbybl` (`integrationId`),
  KEY `idx_qxurkugltojokovzlgnrpmacwmvbuoowulih` (`fieldId`),
  KEY `idx_gqbpuaiytsmwdnsbwonkhtzikjqedaofwnjf` (`reference`),
  KEY `fk_tkgtzxaahkxfybyvtremkzxkjqvigxgfgbkf` (`submissionId`),
  KEY `fk_bulvhlcfyzhfpuwuxntppysfozznernactaq` (`subscriptionId`),
  CONSTRAINT `fk_bulvhlcfyzhfpuwuxntppysfozznernactaq` FOREIGN KEY (`subscriptionId`) REFERENCES `formie_payments_subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fkevxvkigsongjyvcsgdnwsjlegbkosqstpn` FOREIGN KEY (`fieldId`) REFERENCES `formie_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkdqhycyuakxgjerhltoprepoirqkjqwpnof` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkgtzxaahkxfybyvtremkzxkjqvigxgfgbkf` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments_plans`
--

DROP TABLE IF EXISTS `formie_payments_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_payments_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iitawemwhkcnqcrbpufrlbridwfjcxdxxchm` (`handle`),
  KEY `idx_lhvjzsfwihwjnnhglkbiiuljfhsaewdtsyad` (`integrationId`),
  KEY `idx_puzyrawhzcgunzawkhascdfbzwyoshwutbzd` (`reference`),
  CONSTRAINT `fk_giycjcecqflvcvrxtqvqhivyxnawthkbspls` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `formie_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_payments_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `integrationId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `planId` int DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ucwoojysebpuzyveaembylpggyjlzmqdnpzg` (`integrationId`),
  KEY `idx_tbqqkrkezppzvajzrhwsgcgzkeuphohzhbuq` (`submissionId`),
  KEY `idx_bmrlfpumgjdgmchoquotqoyrjhkqqiutqiik` (`fieldId`),
  KEY `idx_updonveaooqojavnpyjtsdykdkhgwxwxskrz` (`planId`),
  KEY `idx_swcsjssreozzjoiwegjkfgaxrhocnlxjwtzb` (`reference`),
  KEY `idx_scvgcwnfcxznzhvnhflmpyyuktpxptqmkbbj` (`nextPaymentDate`),
  KEY `idx_vlaxzjgimflvmlvzsdptlyoyrfwfzmjqhwdv` (`dateExpired`),
  KEY `idx_ixulaefdjznpmtrqyjclqsntzjxifrfdvsuv` (`dateExpired`),
  CONSTRAINT `fk_jzymmkzrolqoydnophdrxpfhjqlohtgonkad` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_oyejmqdwkorbflhmdlgojqkjxynfdefkyocr` FOREIGN KEY (`planId`) REFERENCES `formie_payments_plans` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_todfzjjkfrktbijhueucqlijralpgldtugga` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_zzgyxrsfvrakgysnomaovvjxbifyaovpqyqc` FOREIGN KEY (`fieldId`) REFERENCES `formie_fields` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_pdftemplates`
--

DROP TABLE IF EXISTS `formie_pdftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_pdftemplates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `filenameFormat` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_relations`
--

DROP TABLE IF EXISTS `formie_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dyfytwiqsppifozmiidnvfsclddlzljzkchi` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_vmusvdpoaallqwhobdxdhnghtzdklhpixurn` (`sourceId`),
  KEY `idx_shprtritufzbjxkffluawxbdernskhwglbgm` (`targetId`),
  KEY `idx_xvptzujlidgaxnbiypuhmpmuzlpvrxkgtrnm` (`sourceSiteId`),
  CONSTRAINT `fk_hxeqrsmzbgrwrhlolbiijgsbeswtsmrfzniw` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qenqiorbhnjuzrcfycradqwuwtbrfmckchgh` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qkqcujxdfgbsywhjxkymsjpfkkxjkjdffmtt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_sentnotifications`
--

DROP TABLE IF EXISTS `formie_sentnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_sentnotifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `formId` int DEFAULT NULL,
  `submissionId` int DEFAULT NULL,
  `notificationId` int DEFAULT NULL,
  `subject` text,
  `to` text,
  `cc` text,
  `bcc` text,
  `replyTo` text,
  `replyToName` text,
  `from` text,
  `fromName` text,
  `sender` text,
  `body` mediumtext,
  `htmlBody` mediumtext,
  `info` text,
  `success` tinyint(1) DEFAULT NULL,
  `message` text,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_awijpegeynhqgjokyafaqybrqpfyaezwnwkd` (`formId`),
  KEY `fk_onvwsjqetvcqjvjfsdkgguqeosuuamrtvbxa` (`submissionId`),
  KEY `fk_fmsafpcxrcibcwiojtrjjjnmjmadafuovmhc` (`notificationId`),
  CONSTRAINT `fk_aabwabzptfgqjqsqmldjxmrfhntwkhttrgdq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_awijpegeynhqgjokyafaqybrqpfyaezwnwkd` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fmsafpcxrcibcwiojtrjjjnmjmadafuovmhc` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_onvwsjqetvcqjvjfsdkgguqeosuuamrtvbxa` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_statuses`
--

DROP TABLE IF EXISTS `formie_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_stencils`
--

DROP TABLE IF EXISTS `formie_stencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_stencils` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `data` mediumtext,
  `templateId` int DEFAULT NULL,
  `submitActionEntryId` int DEFAULT NULL,
  `submitActionEntrySiteId` int DEFAULT NULL,
  `defaultStatusId` int DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fjhylmytemqsiygncteihaoezxjyysytijah` (`templateId`),
  KEY `idx_msjroqosagowwnsqsgnqqpamrkyuuzrvadys` (`defaultStatusId`),
  CONSTRAINT `fk_bqxomcequgyacnirfywgosbrvhrmhjrougbi` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kutpwvzaqaewhkbmktjtugbxmixzzjkcytfu` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formie_submissions`
--

DROP TABLE IF EXISTS `formie_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formie_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` json DEFAULT NULL,
  `formId` int NOT NULL,
  `statusId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT '0',
  `isSpam` tinyint(1) DEFAULT '0',
  `spamReason` text,
  `spamClass` varchar(255) DEFAULT NULL,
  `snapshot` text,
  `ipAddress` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yqujamyltqdlmppsucywaftduyzkcsdgtapn` (`formId`),
  KEY `idx_qxvudvvfabyxuoctrrczkjldtclwfqnqdzyo` (`statusId`),
  KEY `idx_xhfrkfbuxgeaahegjggrtypnbpdbvcgsjklf` (`userId`),
  CONSTRAINT `fk_ajugfczcfhpmowfdmnufoupjjappvpnmipzc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fkakhklpswnlybaxfwrwqwrplbwrxnhwauqo` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_iqyodtktfxbbxbvophzotvtmaevrojgpxzbh` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ptmtznmmezqwyraqcwtiqaqabgfdixpvfcpg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hhmzztgxgungmmuzfujimbhtixflrsbitvcw` (`name`),
  KEY `idx_lslywwvncpklvxifvknzsxqxkaaobxwhhfqa` (`handle`),
  KEY `idx_bhscngxyjetgznjwhyfsahofrmnfqhebcbxi` (`fieldLayoutId`),
  KEY `idx_qwbqzzfzwsqrxsnsnhdnaobehdaejklrqmcs` (`sortOrder`),
  CONSTRAINT `fk_thmzyngcysvlffzzicbpscujxidztbtstqta` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tnvipdaelijdxrgloqfsraaipjhxceftwphn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mrrkhfklrolmoteqjrpdqarnrmkmjwoajvlm` (`accessToken`),
  UNIQUE KEY `idx_fcplatzcemtmxhgxybbdcwhrfgkksqtbgpzc` (`name`),
  KEY `fk_wgbxagusaobvzdcmaabffryemawkhfxmdjhc` (`schemaId`),
  CONSTRAINT `fk_wgbxagusaobvzdcmaabffryemawkhfxmdjhc` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pqwjwhjhqregqddspskeqnhudtpxlerbrydv` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wajwmzghjpbwejrwtwnekpbfeplbfvzvvbtp` (`name`),
  KEY `idx_ttitqevrnrfzqpjspjcpyfyuawgpnomgtkzz` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hkcqlcoydofkmhrwydevcwgziffagdkwfmko` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qzewdqhrmzkxsnqkzrmthccwkdlqeriyaixk` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  KEY `idx_wbcdheloramfobmpvervazbopbaskzuerwat` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_jzdiuqgizxwvfhoglhmcdulkrpaeptevfyxr` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_elqygqiqtnsklfidtitxdjuzgjumiroklqef` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_egiudpjputqwhbolpagixocqmcufstkugowq` (`sourceId`),
  KEY `idx_capbdjasiyytnygzkttwpbpaxgsjxjspviiu` (`targetId`),
  KEY `idx_ncvgebfvmomtgtkgqrnyuytvhiibagnnzicj` (`sourceSiteId`),
  CONSTRAINT `fk_ecpmxfbztzdephfwnadksqatsjlxgwwiizar` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jcrvgopboucbjnifsfivpdmsjovrjkjhezdm` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uphwvpplewxlqhykqfhitmbiwjvsfyxskqcs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qmvbsdlaxvndyzchhxivxiooozhurreaqxip` (`canonicalId`,`num`),
  KEY `fk_xfiikacylgngbmgpbwrsyuwxmoxpizvzxxje` (`creatorId`),
  CONSTRAINT `fk_tojnxwdekiifhkehaygdspcwimjilbfybvvv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xfiikacylgngbmgpbwrsyuwxmoxpizvzxxje` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_htzqnlgjudkeiscbvynqgclsycyfeqxnxieb` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_frghfeurpssdkghtsdiferhdhsffvrlcousv` (`elementId`,`siteId`,`reserved`)
) ENGINE=InnoDB AUTO_INCREMENT=452 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_grnwijwfwdjzmwtkvrfiwnmvzjpezraoiryi` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_cmiwpscqrytgllwhquakvgacdbudjymaxmux` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xcdpyducmyriptaofhxdjrtosjkcdufpoxfx` (`handle`),
  KEY `idx_focexfkiupjyafxunfyzwzenkhuyguechudt` (`name`),
  KEY `idx_jwgskyhzvawsovekntlyyqzgwmsixiymdail` (`structureId`),
  KEY `idx_bocqglltvnoyewidjxsilhkjnnlpolrxnkbr` (`dateDeleted`),
  CONSTRAINT `fk_nlbwjbtwdofuobraawhnngtqruhjapostanh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_dchlgovthdztlaaeceyhlvakcovvbmtcovxt` (`typeId`),
  CONSTRAINT `fk_dchlgovthdztlaaeceyhlvakcovvbmtcovxt` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkyvilzndzdlqasodvweqpopwzclcqquimri` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb4_unicode_520_ci,
  `template` varchar(500) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ruktbganzgpkduqxhwqqvzdtpkqxbucszfec` (`sectionId`,`siteId`),
  KEY `idx_tikglbhkjxdiklqrzqljgirurzqypnqorfew` (`siteId`),
  CONSTRAINT `fk_lbowrzhjkoutswejgdvvqscpsqxvxvujkvzi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lbqjnzkydyoqevcawtkanwnltedgrmrhbpxd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fuwyzudlzscyiqxkwngwtnslmwhhoveknxjh` (`uid`),
  KEY `idx_oknthapuiroxrgtpqylhvcxqrkcvbuobeawu` (`token`),
  KEY `idx_dwcsfnihjegnheazdoymyoirpbqzucqpznjo` (`dateUpdated`),
  KEY `idx_ktnhosdkzqfkylxwwkwefvmyychrsqtrzmlr` (`userId`),
  CONSTRAINT `fk_ujwsqwmifplipfiufggiylswcjehyestsukz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlxhmqpfnkaoelyulxnrzwzkdlizteqeirqs` (`userId`,`message`),
  CONSTRAINT `fk_hwpioxgnywwxggikrubqjujlnivwiircfcfa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rmwrsromfnjsfmkpjlncxucepvseuusawaql` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wbgmixlqsvbfmjhqxusuadpsxhtfzbvlbwja` (`dateDeleted`),
  KEY `idx_whgivwnwkjrryhcepdekwkiwbqvihgjsfvnv` (`handle`),
  KEY `idx_zagcbqwobrkxuxwoymthzpevnndbavxkovnx` (`sortOrder`),
  KEY `fk_isnuxwmkmwhkcbywhnzlozgshskxfkoqqfmj` (`groupId`),
  CONSTRAINT `fk_isnuxwmkmwhkcbywhnzlozgshskxfkoqqfmj` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `identityId` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_ljgutpjgnvpplievbxqdkotfrnmeindqfrkh` (`userId`),
  CONSTRAINT `fk_ljgutpjgnvpplievbxqdkotfrnmeindqfrkh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_auqicuafgptczuolnxfotkjpcicnefxhxkfd` (`structureId`,`elementId`),
  KEY `idx_ctirhqzklgamuanvjlghnhcjwfjjsufrkiug` (`root`),
  KEY `idx_vyodqbxjmwmodnhawfrwzlijwjsrjkntajlw` (`lft`),
  KEY `idx_acwgxnwvefgcowjqmksjkpihjxriocieovri` (`rgt`),
  KEY `idx_puxhwnbjrknevyoivogtcbdlszbykgcajxtz` (`level`),
  KEY `idx_bsfabwiswsnyckgjzgmkdlejzuhpkbxxptch` (`elementId`),
  CONSTRAINT `fk_fbohyuxnufnxivjwnjzdyliuiwtefbszgtmt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdxmfcqmitjiysayyfnandaxjcwokhycxags` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_opajkwnjnxcbyvjouiemhkcdxmdkpzhtnsed` (`key`,`language`),
  KEY `idx_ivwylzbelpyvqlxqhyhgowajduyudbfejhju` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_basbisazwwgcncjxqzggkxebpvrhbowgoeqm` (`name`),
  KEY `idx_aqliuffhezffxvmesknjrgvazfouqpjhcxqo` (`handle`),
  KEY `idx_tzhuneefpitnnbkmkqbepspfgruwvrqebnrn` (`dateDeleted`),
  KEY `fk_dlfmvqxjtsiqibdxoahiyzjzempfgrrdarzl` (`fieldLayoutId`),
  CONSTRAINT `fk_dlfmvqxjtsiqibdxoahiyzjzempfgrrdarzl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mktodeoaefcvrdoyllzghbrrcpxyjmmtqhun` (`groupId`),
  CONSTRAINT `fk_mquumiwuaimndwcbiakfcovnlybmqhlanftb` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rkxvwtxfufdjnzgdildexfrstuyyxpqnuoje` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_520_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kgzlijlpqlzpaonrkqflrytrbxdxoyavtoga` (`token`),
  KEY `idx_vzqjmdwqvxlnklnlcvbmdnarcggsuyyjqaax` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_520_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dieumqitlfpgmkttghkuiulnaspvrjtmtjxl` (`handle`),
  KEY `idx_yxdaqrcagtqqmcjfgxrlehqltapvcoaifbhb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zvagyojffgzubhjleszxnyfrlrizmhvspdvw` (`groupId`,`userId`),
  KEY `idx_ayuyiuyuvgbrksbnhzrsxvnvpcilppxpzbys` (`userId`),
  CONSTRAINT `fk_bxaechuiqyoprlziqvsfwrtuligszuthcxoy` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpwsmzxpqmivwjealkuhnietcdpnvwtkhpaz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dnjogdzmchnajaxwbdwktkpsjwbuvepdksqv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mvfkactcoshdszsnrdggusebgbtsysuzkjjf` (`permissionId`,`groupId`),
  KEY `idx_lmqjhangshkqxlxryxczncmdljqemwdpjnem` (`groupId`),
  CONSTRAINT `fk_xkzoffyacykrmyihrxwvcuvdhfvldmcceigc` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yatxztuffoejljswackjnxaocvqodwmfeuxt` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hehhhdqgmdapmclpetetmmxwqtjuyqxvzmav` (`permissionId`,`userId`),
  KEY `idx_wxyqhnpnfnqznyaaiksghjecfadnjsreqmuw` (`userId`),
  CONSTRAINT `fk_oarcpbxftfrfumuoxpgqngpeavjeovtbizsw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfoeifmrgwlttyqghtsejnczaocjiazphdxh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_zmwtmqbpfebowbtacjejbkpawmdwliaosvct` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `affiliatedSiteId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wbtkxrervwyfieyvvonoikbgpthzolikzmwk` (`active`),
  KEY `idx_loypctrdqnfvyiughpiqsjdkezldvcywvwsg` (`locked`),
  KEY `idx_kacszhalraagdipsjlgpixvfgrcrueggozap` (`pending`),
  KEY `idx_vhrrvzrhgkixwspplofzyvgvmznxbmedizcv` (`suspended`),
  KEY `idx_wvswbfucsnslvavngttzjhtzqwmsuwbqrmoj` (`verificationCode`),
  KEY `idx_dhqfzbzxpxvzybzjtxanmnwtugypzuahtzlp` (`email`),
  KEY `idx_yetnibqfwaoqbscsjumstrhqjmmimrriphbm` (`username`),
  KEY `fk_mmviiyrztdcvsjddzfssfzvcfcvzrrjdvgyo` (`photoId`),
  KEY `fk_eaikzbfcffsuvaxamwxvilqvsvfyupahcjds` (`affiliatedSiteId`),
  CONSTRAINT `fk_eaikzbfcffsuvaxamwxvilqvsvfyupahcjds` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mmviiyrztdcvsjddzfssfzvcfcvzrrjdvgyo` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vlvtqingktegycxfhjkixvzrfeciogmsuraz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wpdbpqnxgegqzxcdwjgmknidizomyiewtmop` (`name`,`parentId`,`volumeId`),
  KEY `idx_mnvwqfzuhmbpgsgxkqxshazkscqgutvkvccq` (`parentId`),
  KEY `idx_nctozrfxxhmzbzqwpybgsdgnhrygnqwhpkri` (`volumeId`),
  CONSTRAINT `fk_ehkmlxfdjmxfzmevueqrqxwuivoytdoeoyds` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvuiljjwkigtesikpkyfrkzdstlzvzwfpeib` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `subpath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transformFs` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb4_unicode_520_ci,
  `altTranslationMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text COLLATE utf8mb4_unicode_520_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xmppumwgtvqgoxqnhnfkejesevxoxpnnpeaw` (`name`),
  KEY `idx_oahlofdbsdkdmwhhsblsimdyrmkfiizxvuve` (`handle`),
  KEY `idx_znzuwowjnfffaanxytrxznuxdhxuseijfoas` (`fieldLayoutId`),
  KEY `idx_dogtlwohdmixhvxurojyxkwgbhnwssjfvyrl` (`dateDeleted`),
  CONSTRAINT `fk_ffytungflajyzfmmfeyhargljwxewztokgbw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `credential` text COLLATE utf8mb4_unicode_520_ci,
  `credentialName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_yvvrazazirffdvvjgfayfzstnpvsptdvhsym` (`userId`),
  CONSTRAINT `fk_yvvrazazirffdvvjgfayfzstnpvsptdvhsym` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iqfuropdienitbvtaigrilkguertrlbdpwel` (`userId`),
  CONSTRAINT `fk_vsgsufrebmmdieeiaimsvsftbwvcoogeisde` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-13 13:00:26
-- MySQL dump 10.13  Distrib 8.0.40, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `addresses` VALUES (2,NULL,NULL,'US',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2026-03-19 20:00:10','2026-03-19 20:00:10');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (300,1,3,1,'box-open.svg','image/svg+xml','image',NULL,640,640,658,NULL,NULL,NULL,'2026-05-09 21:08:23','2026-05-09 21:08:23','2026-05-09 21:08:23'),(305,1,3,1,'palette.svg','image/svg+xml','image',NULL,640,640,975,NULL,NULL,NULL,'2026-05-09 21:12:08','2026-05-09 21:12:08','2026-05-09 21:12:08'),(306,1,3,1,'calendar.svg','image/svg+xml','image',NULL,640,640,626,NULL,NULL,NULL,'2026-05-09 21:12:13','2026-05-09 21:12:13','2026-05-09 21:12:13');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES (300,1,NULL),(305,1,NULL),(306,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `auth_oauth_tokens`
--

LOCK TABLES `auth_oauth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_oauth_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `auth_oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (3,1,'fieldLayoutId','2026-03-25 14:42:33',0,1),(3,1,'title','2026-03-25 14:45:23',0,1),(3,1,'typeId','2026-03-25 14:42:33',0,1),(28,1,'title','2026-03-25 15:36:14',0,1),(37,1,'primaryOwnerId','2026-05-13 17:39:04',0,1),(37,1,'title','2026-05-13 17:39:04',0,1),(44,1,'primaryOwnerId','2026-05-13 17:39:04',0,1),(44,1,'title','2026-05-13 17:39:04',0,1),(64,1,'title','2026-04-04 03:57:31',0,1),(139,1,'primaryOwnerId','2026-05-13 17:39:04',0,1),(139,1,'title','2026-05-13 17:39:04',0,1),(144,1,'title','2026-04-04 04:05:29',0,1),(229,1,'title','2026-04-04 04:42:31',0,1),(247,1,'title','2026-05-09 04:41:58',0,1),(249,1,'primaryOwnerId','2026-05-09 21:12:32',0,1),(286,1,'primaryOwnerId','2026-05-09 21:12:32',0,1),(295,1,'primaryOwnerId','2026-05-09 21:12:32',0,1),(328,1,'enabled','2026-05-12 00:31:51',0,1),(328,1,'fieldLayoutId','2026-05-12 00:44:49',0,1),(328,1,'postDate','2026-05-09 22:02:30',0,1),(328,1,'slug','2026-05-09 22:02:26',0,1),(328,1,'title','2026-05-09 22:02:30',0,1),(328,1,'typeId','2026-05-12 00:44:49',0,1),(328,1,'uri','2026-05-09 22:02:26',0,1),(330,1,'enabled','2026-05-09 22:10:25',0,1),(331,1,'enabled','2026-05-12 00:31:51',0,1),(333,1,'fieldLayoutId','2026-05-12 00:44:49',0,1),(333,1,'typeId','2026-05-12 00:44:49',0,1),(364,1,'title','2026-05-12 00:49:59',0,1),(366,1,'primaryOwnerId','2026-05-12 01:24:16',0,1),(403,1,'title','2026-05-12 01:25:47',0,1),(422,1,'title','2026-05-12 02:52:39',0,1),(503,1,'title','2026-05-12 03:41:19',0,1),(538,1,'title','2026-05-13 17:39:03',0,1),(544,1,'title','2026-05-13 14:58:09',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,1,'06046102-5b5b-459b-bfc9-b30d0fca0637','2026-03-25 14:11:43',0,1),(3,1,1,'155e57b8-c7fc-4b17-86a3-539f80f5ed0a','2026-03-25 14:11:43',0,1),(3,1,1,'5ce97453-9ece-40ca-ac1b-64149ca635d4','2026-03-25 14:11:29',0,1),(3,1,2,'82655099-51f2-45f3-b4e0-d7289fd79e60','2026-03-25 14:13:57',0,1),(3,1,2,'afd6c57d-6011-47c0-9ed8-510fa3b29b73','2026-03-25 14:13:10',0,1),(3,1,3,'ba5603f2-a7cb-4004-b88b-b781db84dd1f','2026-03-25 14:45:23',0,1),(3,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-13 17:39:03',0,1),(28,1,4,'67c0702d-602b-4460-a842-68b69569157a','2026-03-25 15:36:14',0,1),(29,1,2,'6d5ccc92-c8d6-422f-8931-38d5f2e409e3','2026-03-25 15:36:14',0,1),(29,1,2,'c53d75b5-67d6-47b2-b41a-327f91a1c146','2026-03-25 15:36:14',0,1),(64,1,7,'dbb8f982-78f2-48c4-8258-217588847319','2026-05-12 03:13:37',0,1),(67,1,1,'4d44aae0-e56d-4315-bfaa-83937eb0421d','2026-04-03 16:05:50',0,1),(67,1,1,'5fd7f09f-bfc0-43e2-a982-7242517a38df','2026-04-03 16:06:19',0,1),(67,1,1,'a9fd0a03-657f-4952-9c55-566045985717','2026-04-04 03:57:31',0,1),(67,1,1,'f075b188-d366-4033-b4ba-472195410663','2026-04-03 16:05:49',0,1),(67,1,16,'a65ee03d-5758-4410-8604-5324d9775b1e','2026-04-03 16:06:19',0,1),(67,1,16,'f531efbe-8694-4e7e-9973-ec72a83577b3','2026-04-03 16:05:50',0,1),(67,1,16,'fa3aa4f4-0531-4405-be51-1ae540e06fb0','2026-04-04 03:57:31',0,1),(67,1,18,'83858805-a6cd-43b6-9279-0edcf7240fb8','2026-04-03 18:44:29',0,1),(67,1,22,'b1fc4697-c4a0-457e-be69-38665a393900','2026-05-12 03:13:37',0,1),(144,1,7,'dbb8f982-78f2-48c4-8258-217588847319','2026-05-12 03:13:37',0,1),(145,1,1,'4d44aae0-e56d-4315-bfaa-83937eb0421d','2026-04-03 18:03:55',0,1),(145,1,1,'5fd7f09f-bfc0-43e2-a982-7242517a38df','2026-04-03 18:05:30',0,1),(145,1,1,'a9fd0a03-657f-4952-9c55-566045985717','2026-04-03 18:05:30',0,1),(145,1,1,'f075b188-d366-4033-b4ba-472195410663','2026-04-03 18:03:55',0,1),(145,1,16,'a65ee03d-5758-4410-8604-5324d9775b1e','2026-04-03 18:05:30',0,1),(145,1,16,'f531efbe-8694-4e7e-9973-ec72a83577b3','2026-04-04 04:12:57',0,1),(145,1,16,'fa3aa4f4-0531-4405-be51-1ae540e06fb0','2026-04-03 18:05:30',0,1),(145,1,18,'83858805-a6cd-43b6-9279-0edcf7240fb8','2026-04-04 04:05:29',0,1),(145,1,22,'b1fc4697-c4a0-457e-be69-38665a393900','2026-05-12 03:13:37',0,1),(152,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:03:55',0,1),(158,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:05:30',0,1),(164,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:36:41',0,1),(168,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:37:18',0,1),(174,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:37:45',0,1),(181,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:42:57',0,1),(187,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:44:08',0,1),(193,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:44:29',0,1),(199,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 03:57:31',0,1),(206,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:05:19',0,1),(209,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:05:29',0,1),(215,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:12:27',0,1),(221,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:12:57',0,1),(229,1,19,'2d498e12-8f05-456e-aed4-cde0a37e8217','2026-04-04 04:42:31',0,1),(230,1,1,'08cac8fc-1927-49e7-94b7-efa0d85ba5bd','2026-04-04 04:42:31',0,1),(230,1,1,'28b90100-b662-46d8-b047-acc05be249bd','2026-04-04 04:42:31',0,1),(230,1,1,'fb8347f5-df64-4639-8907-a7e8845b4e12','2026-04-04 04:42:31',0,1),(230,1,2,'d9cf0d28-62bf-4618-844e-ca96058c834a','2026-04-04 04:42:31',0,1),(231,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:35:26',0,1),(240,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:42:31',0,1),(247,1,20,'2a3bcb22-2710-4671-a485-593335ab29a9','2026-05-12 03:14:05',0,1),(248,1,1,'33406d90-7e53-4c8f-9975-2dde40f485bf','2026-05-09 04:41:58',0,1),(248,1,21,'512aa64b-20b2-4b34-8bf9-8d81ec78d167','2026-05-09 21:12:32',0,1),(248,1,22,'455dcd47-38c8-454c-8026-c041b84a2fec','2026-05-09 04:21:34',0,1),(248,1,22,'6b64b506-24d4-4971-88d7-d868e9d9714b','2026-05-12 03:14:05',0,1),(249,1,17,'30f3b05b-923f-4ac2-891c-c772b3aa5f34','2026-05-09 21:12:32',0,1),(250,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 04:12:10',0,1),(255,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 04:15:49',0,1),(260,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 04:21:34',0,1),(263,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 04:41:58',0,1),(273,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 20:53:01',0,1),(279,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 20:53:58',0,1),(286,1,17,'30f3b05b-923f-4ac2-891c-c772b3aa5f34','2026-05-09 21:12:32',0,1),(287,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 20:54:59',0,1),(295,1,17,'30f3b05b-923f-4ac2-891c-c772b3aa5f34','2026-05-09 21:12:32',0,1),(296,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 20:55:54',0,1),(309,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 21:12:32',0,1),(318,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 21:27:20',0,1),(324,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-09 21:27:28',0,1),(328,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:43:36',0,1),(364,1,20,'2a3bcb22-2710-4671-a485-593335ab29a9','2026-05-12 03:17:01',0,1),(365,1,1,'7158299d-b9a4-4991-84f0-b575c0883bf5','2026-05-12 00:49:59',0,1),(365,1,21,'512aa64b-20b2-4b34-8bf9-8d81ec78d167','2026-05-12 01:24:16',0,1),(365,1,22,'6b64b506-24d4-4971-88d7-d868e9d9714b','2026-05-12 03:17:01',0,1),(369,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 00:49:30',0,1),(378,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 00:49:33',0,1),(381,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 00:49:59',0,1),(388,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 00:50:07',0,1),(396,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 01:24:16',0,1),(403,1,7,'dbb8f982-78f2-48c4-8258-217588847319','2026-05-12 03:12:58',0,1),(404,1,18,'83858805-a6cd-43b6-9279-0edcf7240fb8','2026-05-12 02:51:38',0,1),(404,1,22,'b1fc4697-c4a0-457e-be69-38665a393900','2026-05-12 03:12:58',0,1),(405,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 01:25:13',0,1),(411,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 01:25:47',0,1),(416,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 01:26:21',0,1),(422,1,7,'dbb8f982-78f2-48c4-8258-217588847319','2026-05-12 03:12:58',0,1),(423,1,1,'4d44aae0-e56d-4315-bfaa-83937eb0421d','2026-05-12 02:52:06',0,1),(423,1,1,'f075b188-d366-4033-b4ba-472195410663','2026-05-12 02:52:06',0,1),(423,1,16,'f531efbe-8694-4e7e-9973-ec72a83577b3','2026-05-12 02:53:09',0,1),(423,1,18,'83858805-a6cd-43b6-9279-0edcf7240fb8','2026-05-12 02:52:39',0,1),(423,1,22,'b1fc4697-c4a0-457e-be69-38665a393900','2026-05-12 03:12:58',0,1),(424,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 02:51:37',0,1),(432,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 02:52:06',0,1),(438,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 02:52:39',0,1),(444,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 02:53:09',0,1),(454,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:12:58',0,1),(468,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:13:37',0,1),(490,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:14:05',0,1),(497,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:17:01',0,1),(503,1,23,'a550e24e-d987-47d6-a8c4-f48df23f7934','2026-05-12 03:43:36',0,1),(504,1,1,'09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c','2026-05-12 03:41:19',0,1),(504,1,1,'e802b542-1048-4c16-99ea-5e3da1e5c867','2026-05-12 03:41:19',0,1),(504,1,24,'4928ee04-f500-4b08-932f-69c52bfede2c','2026-05-12 03:43:36',0,1),(505,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:40:03',0,1),(511,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:41:19',0,1),(527,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-12 03:43:36',0,1),(538,1,25,'952bf88c-85d0-4bdc-9c9a-38247f374055','2026-05-13 17:39:03',0,1),(539,1,22,'7a8c674e-47d9-4d72-a516-b7816ccc6c4f','2026-05-13 17:39:03',0,1),(539,1,26,'57c13cd0-bf26-4bac-822b-aba5d9d274ef','2026-05-13 14:58:25',0,1),(540,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-13 14:44:30',0,1),(548,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-13 14:58:25',0,1),(552,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-13 15:18:35',0,1),(559,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-13 16:08:59',0,1),(566,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-05-13 17:39:03',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_catalogpricing`
--

LOCK TABLES `commerce_catalogpricing` WRITE;
/*!40000 ALTER TABLE `commerce_catalogpricing` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_catalogpricing` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_catalogpricingrules`
--

LOCK TABLES `commerce_catalogpricingrules` WRITE;
/*!40000 ALTER TABLE `commerce_catalogpricingrules` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_catalogpricingrules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_catalogpricingrules_users`
--

LOCK TABLES `commerce_catalogpricingrules_users` WRITE;
/*!40000 ALTER TABLE `commerce_catalogpricingrules_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_catalogpricingrules_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_coupons`
--

LOCK TABLES `commerce_coupons` WRITE;
/*!40000 ALTER TABLE `commerce_coupons` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_coupons` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customer_discountuses`
--

LOCK TABLES `commerce_customer_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_customer_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customer_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_customers`
--

LOCK TABLES `commerce_customers` WRITE;
/*!40000 ALTER TABLE `commerce_customers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_customers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_categories`
--

LOCK TABLES `commerce_discount_categories` WRITE;
/*!40000 ALTER TABLE `commerce_discount_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discount_purchasables`
--

LOCK TABLES `commerce_discount_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_discount_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discount_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_discounts`
--

LOCK TABLES `commerce_discounts` WRITE;
/*!40000 ALTER TABLE `commerce_discounts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_discounts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_donations`
--

LOCK TABLES `commerce_donations` WRITE;
/*!40000 ALTER TABLE `commerce_donations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_donations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_email_discountuses`
--

LOCK TABLES `commerce_email_discountuses` WRITE;
/*!40000 ALTER TABLE `commerce_email_discountuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_email_discountuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_emails`
--

LOCK TABLES `commerce_emails` WRITE;
/*!40000 ALTER TABLE `commerce_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_gateways`
--

LOCK TABLES `commerce_gateways` WRITE;
/*!40000 ALTER TABLE `commerce_gateways` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_gateways` VALUES (1,'craft\\commerce\\gateways\\Dummy','Dummy','dummy',NULL,'purchase','1','{\"class\":\"craft\\\\commerce\\\\elements\\\\conditions\\\\orders\\\\GatewayOrderCondition\",\"elementType\":\"craft\\\\commerce\\\\elements\\\\Order\",\"fieldContext\":\"global\"}','{\"class\":\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\",\"elementType\":null,\"fieldContext\":\"global\"}','{\"class\":\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\",\"elementType\":null,\"fieldContext\":\"global\"}',0,NULL,99,'2026-03-12 17:49:25','2026-03-12 17:49:25','8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f');
/*!40000 ALTER TABLE `commerce_gateways` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_inventoryitems`
--

LOCK TABLES `commerce_inventoryitems` WRITE;
/*!40000 ALTER TABLE `commerce_inventoryitems` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_inventoryitems` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_inventorylocations`
--

LOCK TABLES `commerce_inventorylocations` WRITE;
/*!40000 ALTER TABLE `commerce_inventorylocations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_inventorylocations` VALUES (1,'default','Default',NULL,'2026-03-12 17:49:25','2026-03-12 17:49:25',NULL,'e511afeb-ad89-4a36-9074-628e240fe308');
/*!40000 ALTER TABLE `commerce_inventorylocations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_inventorylocations_stores`
--

LOCK TABLES `commerce_inventorylocations_stores` WRITE;
/*!40000 ALTER TABLE `commerce_inventorylocations_stores` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_inventorylocations_stores` VALUES (1,1,1,1,'2026-03-12 17:49:25','2026-03-12 17:49:25','1895957a-80df-43f6-b2a3-3a1e346f1b20');
/*!40000 ALTER TABLE `commerce_inventorylocations_stores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_inventorytransactions`
--

LOCK TABLES `commerce_inventorytransactions` WRITE;
/*!40000 ALTER TABLE `commerce_inventorytransactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_inventorytransactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitems`
--

LOCK TABLES `commerce_lineitems` WRITE;
/*!40000 ALTER TABLE `commerce_lineitems` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitems` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_lineitemstatuses`
--

LOCK TABLES `commerce_lineitemstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_lineitemstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderadjustments`
--

LOCK TABLES `commerce_orderadjustments` WRITE;
/*!40000 ALTER TABLE `commerce_orderadjustments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderadjustments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderhistories`
--

LOCK TABLES `commerce_orderhistories` WRITE;
/*!40000 ALTER TABLE `commerce_orderhistories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderhistories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_ordernotices`
--

LOCK TABLES `commerce_ordernotices` WRITE;
/*!40000 ALTER TABLE `commerce_ordernotices` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_ordernotices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orders`
--

LOCK TABLES `commerce_orders` WRITE;
/*!40000 ALTER TABLE `commerce_orders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatus_emails`
--

LOCK TABLES `commerce_orderstatus_emails` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_orderstatus_emails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_orderstatuses`
--

LOCK TABLES `commerce_orderstatuses` WRITE;
/*!40000 ALTER TABLE `commerce_orderstatuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_orderstatuses` VALUES (1,1,'New','new','green',NULL,NULL,99,1,'2026-03-12 17:49:25','2026-03-12 17:49:25','69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2');
/*!40000 ALTER TABLE `commerce_orderstatuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentcurrencies`
--

LOCK TABLES `commerce_paymentcurrencies` WRITE;
/*!40000 ALTER TABLE `commerce_paymentcurrencies` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_paymentcurrencies` VALUES (1,1,'USD',0,1.0000,'2026-03-12 17:49:25','2026-03-12 17:49:25','bfda5d3c-a0ec-4a21-ab55-806ddce04d21');
/*!40000 ALTER TABLE `commerce_paymentcurrencies` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_paymentsources`
--

LOCK TABLES `commerce_paymentsources` WRITE;
/*!40000 ALTER TABLE `commerce_paymentsources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_paymentsources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_pdfs`
--

LOCK TABLES `commerce_pdfs` WRITE;
/*!40000 ALTER TABLE `commerce_pdfs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_pdfs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_plans`
--

LOCK TABLES `commerce_plans` WRITE;
/*!40000 ALTER TABLE `commerce_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_products`
--

LOCK TABLES `commerce_products` WRITE;
/*!40000 ALTER TABLE `commerce_products` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_products` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes`
--

LOCK TABLES `commerce_producttypes` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_shippingcategories`
--

LOCK TABLES `commerce_producttypes_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_sites`
--

LOCK TABLES `commerce_producttypes_sites` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_producttypes_taxcategories`
--

LOCK TABLES `commerce_producttypes_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_producttypes_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_purchasables`
--

LOCK TABLES `commerce_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_purchasables_stores`
--

LOCK TABLES `commerce_purchasables_stores` WRITE;
/*!40000 ALTER TABLE `commerce_purchasables_stores` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_purchasables_stores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_categories`
--

LOCK TABLES `commerce_sale_categories` WRITE;
/*!40000 ALTER TABLE `commerce_sale_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_purchasables`
--

LOCK TABLES `commerce_sale_purchasables` WRITE;
/*!40000 ALTER TABLE `commerce_sale_purchasables` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_purchasables` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sale_usergroups`
--

LOCK TABLES `commerce_sale_usergroups` WRITE;
/*!40000 ALTER TABLE `commerce_sale_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sale_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_sales`
--

LOCK TABLES `commerce_sales` WRITE;
/*!40000 ALTER TABLE `commerce_sales` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_sales` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingcategories`
--

LOCK TABLES `commerce_shippingcategories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_shippingcategories` VALUES (1,1,'General','general',NULL,NULL,NULL,1,NULL,'2026-03-12 17:49:25','2026-03-12 17:49:25','0e8ec3ba-3ccb-4eee-96be-37d1aa84342b');
/*!40000 ALTER TABLE `commerce_shippingcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingmethods`
--

LOCK TABLES `commerce_shippingmethods` WRITE;
/*!40000 ALTER TABLE `commerce_shippingmethods` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingmethods` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrule_categories`
--

LOCK TABLES `commerce_shippingrule_categories` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingrule_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingrules`
--

LOCK TABLES `commerce_shippingrules` WRITE;
/*!40000 ALTER TABLE `commerce_shippingrules` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingrules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_shippingzones`
--

LOCK TABLES `commerce_shippingzones` WRITE;
/*!40000 ALTER TABLE `commerce_shippingzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_shippingzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_site_stores`
--

LOCK TABLES `commerce_site_stores` WRITE;
/*!40000 ALTER TABLE `commerce_site_stores` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_site_stores` VALUES (1,1,'2026-03-12 17:49:25','2026-03-12 17:49:25','2589bc8f-a277-4da6-ae5f-f294f779bc87');
/*!40000 ALTER TABLE `commerce_site_stores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_stores`
--

LOCK TABLES `commerce_stores` WRITE;
/*!40000 ALTER TABLE `commerce_stores` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_stores` VALUES (1,'Primary','primary',1,'USD','','','','','','','','','','','','{{number[:7]}}','complete','default',99,'2026-03-12 17:49:25','2026-03-12 17:49:25','645bb423-5466-4a2c-a05f-ceeb31bac6e5');
/*!40000 ALTER TABLE `commerce_stores` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_storesettings`
--

LOCK TABLES `commerce_storesettings` WRITE;
/*!40000 ALTER TABLE `commerce_storesettings` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_storesettings` VALUES (1,2,NULL,NULL,'2026-03-19 20:00:10','2026-03-19 20:00:10','47c2657c-fbe5-4a3c-b72c-d53c2a1f681e');
/*!40000 ALTER TABLE `commerce_storesettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_subscriptions`
--

LOCK TABLES `commerce_subscriptions` WRITE;
/*!40000 ALTER TABLE `commerce_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxcategories`
--

LOCK TABLES `commerce_taxcategories` WRITE;
/*!40000 ALTER TABLE `commerce_taxcategories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `commerce_taxcategories` VALUES (1,'General','general',NULL,NULL,NULL,1,NULL,'2026-03-12 17:49:25','2026-03-12 17:49:25','3cb98928-edb4-4e72-8cf6-8041ce484062');
/*!40000 ALTER TABLE `commerce_taxcategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxrates`
--

LOCK TABLES `commerce_taxrates` WRITE;
/*!40000 ALTER TABLE `commerce_taxrates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxrates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_taxzones`
--

LOCK TABLES `commerce_taxzones` WRITE;
/*!40000 ALTER TABLE `commerce_taxzones` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_taxzones` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_transactions`
--

LOCK TABLES `commerce_transactions` WRITE;
/*!40000 ALTER TABLE `commerce_transactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_transferdetails`
--

LOCK TABLES `commerce_transferdetails` WRITE;
/*!40000 ALTER TABLE `commerce_transferdetails` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_transferdetails` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_transfers`
--

LOCK TABLES `commerce_transfers` WRITE;
/*!40000 ALTER TABLE `commerce_transfers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_transfers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `commerce_variants`
--

LOCK TABLES `commerce_variants` WRITE;
/*!40000 ALTER TABLE `commerce_variants` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `commerce_variants` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `contentblocks` VALUES (29,28,4),(38,37,4),(47,42,6),(67,64,7),(140,139,7),(145,144,7),(154,153,7),(160,159,7),(170,169,7),(176,175,7),(183,182,7),(189,188,7),(195,194,7),(201,200,7),(208,207,7),(211,210,7),(217,216,7),(223,222,7),(230,229,19),(233,232,19),(242,241,19),(248,247,20),(252,251,20),(262,261,20),(265,264,20),(275,274,20),(281,280,20),(289,288,20),(298,297,20),(311,310,20),(320,319,20),(326,325,20),(334,28,6),(335,28,7),(336,28,19),(337,28,20),(338,42,4),(339,42,7),(340,42,19),(341,42,20),(342,144,4),(343,144,6),(344,144,19),(345,144,20),(346,64,4),(347,64,6),(348,64,19),(349,64,20),(350,229,4),(351,229,6),(352,229,7),(353,229,20),(354,247,4),(355,247,6),(356,247,7),(357,247,19),(365,364,20),(371,370,20),(380,379,20),(383,382,20),(390,389,20),(398,397,20),(404,403,7),(407,406,7),(413,412,7),(423,422,7),(426,425,7),(428,427,7),(434,433,7),(440,439,7),(446,445,7),(456,455,7),(458,457,20),(460,459,7),(470,469,4),(471,469,6),(472,469,7),(473,469,19),(474,469,20),(476,475,4),(477,475,6),(478,475,7),(479,475,19),(480,475,20),(482,481,4),(483,481,6),(484,481,7),(485,481,19),(486,481,20),(492,491,20),(499,498,20),(504,503,23),(507,506,23),(513,512,23),(529,528,23),(539,538,25),(542,541,25),(550,549,25),(554,553,25),(561,560,25),(568,567,25);
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (3,1,1,NULL,'edit','2026-05-13 17:39:02'),(3,1,1,NULL,'save','2026-05-13 17:39:03'),(3,1,1,NULL,'view','2026-05-13 17:40:04'),(249,1,1,NULL,'edit','2026-05-09 21:08:28'),(249,1,1,NULL,'view','2026-05-09 21:12:25'),(286,1,1,NULL,'edit','2026-05-09 21:12:23'),(286,1,1,NULL,'view','2026-05-09 21:12:27'),(295,1,1,NULL,'edit','2026-05-09 21:12:31'),(295,1,1,NULL,'view','2026-05-09 21:12:25'),(328,1,1,NULL,'edit','2026-05-12 03:43:35'),(328,1,1,NULL,'save','2026-05-12 03:43:36'),(328,1,1,NULL,'view','2026-05-13 13:03:08'),(366,1,1,NULL,'edit','2026-05-12 01:24:14'),(366,1,1,NULL,'view','2026-05-12 01:24:10'),(522,1,1,NULL,'view','2026-05-13 13:03:08');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-03-12 17:35:45','2026-03-12 17:35:45',NULL,NULL,NULL,'e6a65f99-d8b8-4732-a2d0-8eab87664dfc'),(2,NULL,NULL,NULL,NULL,'craft\\elements\\Address',1,0,'2026-03-19 20:00:10','2026-03-19 20:00:10',NULL,NULL,NULL,'de78bd12-37b5-4b6a-9cf5-eca2759aff06'),(3,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2026-03-25 13:57:24','2026-05-13 17:39:03',NULL,NULL,NULL,'52117ec7-dc39-4708-b0bd-2c00fab12cbb'),(28,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:36:14',NULL,NULL,NULL,'5dc34ace-f4e6-4b49-9074-c14cd5fabaee'),(29,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:35:21','2026-03-25 15:36:14',NULL,NULL,NULL,'ac7a05e7-5c8b-4387-8884-4561cead9a27'),(37,28,NULL,21,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:36:14','2026-05-13 17:39:04',NULL,NULL,NULL,'c84aea3c-6b05-4a5e-8dfd-ec36cdb4748f'),(38,29,NULL,22,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'422f35ce-e410-4a6d-9405-2f5c15cad8df'),(42,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'07910d49-eb8a-4eff-bd25-79bd905b6079'),(44,42,NULL,25,5,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-05-13 17:39:04',NULL,NULL,NULL,'38472fdd-2ae0-4a05-b6a3-1ed95fe87252'),(47,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-28 22:15:26','2026-03-28 22:15:26',NULL,NULL,NULL,'87c8ba6f-c5dd-42e6-9dc8-3d2e8bbfc9bb'),(52,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 23:21:39',NULL,'2026-03-28 23:21:39',NULL,'250a255e-e419-43d2-8aa5-6a9f520d344a'),(57,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 23:21:39',NULL,'2026-03-28 23:21:39',NULL,'e2ca7a56-b5f0-453d-9d9f-302b34ebb8e7'),(64,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 23:21:47','2026-05-12 03:13:37',NULL,NULL,NULL,'be31753f-0b89-4653-897d-f5cd9f2d17de'),(67,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-28 23:22:37','2026-05-12 03:13:37',NULL,NULL,NULL,'f562049a-c26d-4efc-9fe4-bdbc4672540d'),(139,64,NULL,73,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:34','2026-05-13 17:39:04',NULL,NULL,NULL,'e059b609-66ac-4f5a-80b6-869323acfd75'),(140,67,NULL,74,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:02:34','2026-04-03 18:02:34',NULL,NULL,NULL,'fd9afb69-df30-4d6d-b086-e286f8587068'),(144,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:52','2026-05-12 03:13:37',NULL,NULL,NULL,'26738c79-c34d-4c43-a7ac-484fd43e3464'),(145,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:02:52','2026-05-12 03:13:37',NULL,NULL,NULL,'a58414f2-600b-487e-941a-837c0685d362'),(152,3,NULL,78,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:03:55','2026-04-03 18:03:55',NULL,NULL,NULL,'aea3333f-531d-43b4-9ca5-fe1cea3e57b9'),(153,144,NULL,79,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:03:55','2026-04-03 18:03:55',NULL,NULL,NULL,'f1679293-60c2-48af-8db9-2c4a770aa96c'),(154,145,NULL,80,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:03:55','2026-04-03 18:03:55',NULL,NULL,NULL,'119a34fc-41d0-4280-b1fa-05b633570c6c'),(158,3,NULL,81,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:05:30','2026-04-03 18:05:30',NULL,NULL,NULL,'d14e1e8e-a163-462c-a788-c43413d21279'),(159,144,NULL,82,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:05:30','2026-04-03 18:05:30',NULL,NULL,NULL,'d113ecd8-c11a-4c85-b5d8-cc13c7d729da'),(160,145,NULL,83,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:05:30','2026-04-03 18:05:30',NULL,NULL,NULL,'274ae81d-96b5-4e3e-9794-2ee21acea0fd'),(161,3,NULL,84,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:16:26','2026-04-03 18:16:26',NULL,NULL,NULL,'c6b6f33e-2ed3-49cc-b5b6-d01dbdbaf322'),(162,3,NULL,85,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:17:16','2026-04-03 18:17:16',NULL,NULL,NULL,'a9c65da4-8909-4039-b0d0-cfd8a0b01183'),(164,3,NULL,86,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:36:41','2026-04-03 18:36:41',NULL,NULL,NULL,'d7d21fe5-d3d8-4e53-a91e-00ab98a767a7'),(168,3,NULL,87,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:18','2026-04-03 18:37:18',NULL,NULL,NULL,'382e8d79-18ec-4af3-9e31-b2d19e07fcc3'),(169,144,NULL,88,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:18','2026-04-03 18:37:18',NULL,NULL,NULL,'e3cd796e-6433-4316-ad1c-e4d2a0c4a1ac'),(170,145,NULL,89,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:37:18','2026-04-03 18:37:18',NULL,NULL,NULL,'86be528e-a37b-468e-892a-21bc415acc74'),(174,3,NULL,90,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:45','2026-04-03 18:37:45',NULL,NULL,NULL,'ba64c289-96f9-403b-b249-bd80784359d8'),(175,144,NULL,91,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:45','2026-04-03 18:37:45',NULL,NULL,NULL,'ec3c0f81-530f-4cfe-972d-be42e8dab822'),(176,145,NULL,92,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:37:45','2026-04-03 18:37:45',NULL,NULL,NULL,'d3efdde9-623e-4283-9efa-689387450b82'),(177,3,NULL,93,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:38:57','2026-04-03 18:38:57',NULL,NULL,NULL,'173f64d7-bc3d-4778-b1ab-ddcb43f2c423'),(181,3,NULL,94,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:42:57','2026-04-03 18:42:57',NULL,NULL,NULL,'40a32896-a3cb-4b0f-848d-21efe665344e'),(182,64,NULL,95,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:42:57','2026-04-03 18:42:57',NULL,NULL,NULL,'8988832d-60fe-401f-9418-4e9b87d0eac4'),(183,67,NULL,96,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:42:57','2026-04-03 18:42:57',NULL,NULL,NULL,'e3b0f729-651e-411c-ab0a-b147a8f15711'),(187,3,NULL,97,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:08','2026-04-03 18:44:08',NULL,NULL,NULL,'5466e5ed-2405-4565-afe4-35aaef9a72b9'),(188,64,NULL,98,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:08','2026-04-03 18:44:08',NULL,NULL,NULL,'fea0faf0-2ede-4e0b-bdeb-842fff3cef5b'),(189,67,NULL,99,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:44:08','2026-04-03 18:44:08',NULL,NULL,NULL,'214791e1-33e3-4981-b365-485f777fc205'),(193,3,NULL,100,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:29','2026-04-03 18:44:29',NULL,NULL,NULL,'dc8087cc-a753-434d-8ab3-be409259612d'),(194,64,NULL,101,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:29','2026-04-03 18:44:29',NULL,NULL,NULL,'1424708b-1609-419a-9275-e6317f5490c2'),(195,67,NULL,102,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:44:29','2026-04-03 18:44:29',NULL,NULL,NULL,'f4d41948-ba43-49c7-8fd9-8a3f931b9e25'),(199,3,NULL,103,2,'craft\\elements\\Entry',1,0,'2026-04-04 03:57:31','2026-04-04 03:57:31',NULL,NULL,NULL,'946e6d5f-34e7-4132-a8ec-9f8278f46129'),(200,64,NULL,104,5,'craft\\elements\\Entry',1,0,'2026-04-04 03:57:31','2026-04-04 03:57:31',NULL,NULL,NULL,'7959ea49-d306-4eff-a76b-12a7ec8cdcc7'),(201,67,NULL,105,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 03:57:31','2026-04-04 03:57:31',NULL,NULL,NULL,'7ed0ece9-5050-4a7a-b028-4ab31e670c2c'),(202,3,NULL,106,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:05','2026-04-04 04:05:05',NULL,NULL,NULL,'67cf8f1d-ea02-43c4-b8aa-f2ed6b655ce4'),(206,3,NULL,107,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:19','2026-04-04 04:05:19',NULL,NULL,NULL,'20d4f118-0c5b-4d68-a220-508b120e59ee'),(207,144,NULL,108,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:19','2026-04-04 04:05:19',NULL,NULL,NULL,'56d02974-53d3-4e22-92ec-58ff9ff9a09c'),(208,145,NULL,109,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:05:19','2026-04-04 04:05:19',NULL,NULL,NULL,'2a1ca3bb-2efe-4ca9-8d24-e6a6c421e572'),(209,3,NULL,110,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:29','2026-04-04 04:05:29',NULL,NULL,NULL,'ebdf6a46-1f8f-4991-92af-95b3e388565b'),(210,144,NULL,111,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:29','2026-04-04 04:05:29',NULL,NULL,NULL,'153c286b-2767-4c47-876f-dabe11f848c3'),(211,145,NULL,112,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:05:29','2026-04-04 04:05:29',NULL,NULL,NULL,'640c22d2-a1b0-4177-8ce1-a0daea9913c7'),(215,3,NULL,113,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:27','2026-04-04 04:12:27',NULL,NULL,NULL,'3d622156-db9f-45a2-8917-b5e2d689164a'),(216,144,NULL,114,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:27','2026-04-04 04:12:27',NULL,NULL,NULL,'c9cd52e6-87ed-4e77-ad9f-9c219556d0e8'),(217,145,NULL,115,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:12:27','2026-04-04 04:12:27',NULL,NULL,NULL,'3be559d3-f77b-43e1-88bb-5cafc533066b'),(221,3,NULL,116,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:57','2026-04-04 04:12:57',NULL,NULL,NULL,'167c71b2-e27f-4507-b52a-c88c9e32a704'),(222,144,NULL,117,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:57','2026-04-04 04:12:57',NULL,NULL,NULL,'4cfc4482-69a4-4610-8d35-e7526b2f1588'),(223,145,NULL,118,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:12:57','2026-04-04 04:12:57',NULL,NULL,NULL,'02fd109e-9d7f-495f-b50e-bf05fe839881'),(229,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:35:26','2026-04-04 04:42:31',NULL,NULL,NULL,'0d0da1b3-2f34-4bab-b909-df4b1ab2d0f1'),(230,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:35:26','2026-04-04 04:42:31',NULL,NULL,NULL,'8ddf1964-6636-4a1c-b9d2-052c95554a28'),(231,3,NULL,119,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:35:26','2026-04-04 04:35:26',NULL,NULL,NULL,'af660260-c5d8-4e7f-9263-280c7fc08ef9'),(232,229,NULL,120,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:35:26','2026-04-04 04:35:26',NULL,NULL,NULL,'24deb15b-6d99-4a29-9496-2b86756c93a8'),(233,230,NULL,121,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:35:26','2026-04-04 04:35:26',NULL,NULL,NULL,'0f7c71c5-ac90-49da-b49d-22d935b12daf'),(234,3,NULL,122,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:37:28','2026-04-04 04:37:28',NULL,NULL,NULL,'abdd45a8-ea02-48a2-9061-ede472541308'),(235,3,NULL,123,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:38:46','2026-04-04 04:38:46',NULL,NULL,NULL,'f64efc04-ca28-4e45-88ef-e611f75ed096'),(236,3,NULL,124,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:38:57','2026-04-04 04:38:57',NULL,NULL,NULL,'3106cb20-1257-4e0b-bd8d-66e754c2963e'),(240,3,NULL,125,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:42:31','2026-04-04 04:42:31',NULL,NULL,NULL,'7bffc16c-ea8e-44ed-ad83-23c11ca34936'),(241,229,NULL,126,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:42:31','2026-04-04 04:42:31',NULL,NULL,NULL,'9c18f77e-42b4-4914-936d-e1925ad98671'),(242,230,NULL,127,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:42:31','2026-04-04 04:42:31',NULL,NULL,NULL,'d725ee28-2ca4-4bf6-b683-5c0170e526d7'),(247,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-05-09 04:12:10','2026-05-12 03:14:05',NULL,NULL,NULL,'4fe964d5-f80c-46ed-baab-c2321671902b'),(248,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 04:12:10','2026-05-12 03:14:05',NULL,NULL,NULL,'b9fa9f94-01f6-4a05-ae69-995bbdcc4623'),(249,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2026-05-09 04:12:10','2026-05-09 21:12:32',NULL,NULL,NULL,'321a8688-0025-4fab-9c7d-9bdc4c45af66'),(250,3,NULL,128,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:12:10','2026-05-09 04:12:10',NULL,NULL,NULL,'2726f0c2-fc1e-403f-8d60-320dfa33dcf7'),(251,247,NULL,129,5,'craft\\elements\\Entry',1,0,'2026-05-09 04:12:10','2026-05-09 04:12:10',NULL,NULL,NULL,'60024a84-597e-459c-a6b7-aaf36f884167'),(252,248,NULL,130,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 04:12:10','2026-05-09 04:12:10',NULL,NULL,NULL,'751156ba-f8b1-4cba-aa1f-e5bbb5884591'),(253,249,NULL,131,18,'craft\\elements\\Entry',1,0,'2026-05-09 04:12:10','2026-05-09 04:12:10',NULL,NULL,NULL,'b3e6019f-c857-49e9-911c-28a0237811c8'),(255,3,NULL,132,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:15:49','2026-05-09 04:15:49',NULL,NULL,NULL,'0bfece81-9d0c-4308-b221-89383a8c5239'),(256,3,NULL,133,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:21:29','2026-05-09 04:21:29',NULL,NULL,NULL,'2df5f944-8a8a-4ce4-a64a-ee4e95206da7'),(260,3,NULL,134,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:21:34','2026-05-09 04:21:34',NULL,NULL,NULL,'a3325612-7dbe-45f7-8469-faf15fed58b9'),(261,247,NULL,135,5,'craft\\elements\\Entry',1,0,'2026-05-09 04:21:34','2026-05-09 04:21:34',NULL,NULL,NULL,'90523e50-9ccb-4b18-8b6b-d9dcc292b8b5'),(262,248,NULL,136,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 04:21:34','2026-05-09 04:21:34',NULL,NULL,NULL,'359df21a-0b5e-4fd0-9afc-53641eaa5047'),(263,3,NULL,137,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:41:58','2026-05-09 04:41:58',NULL,NULL,NULL,'70b07280-f946-4058-883c-c853ab11fd1f'),(264,247,NULL,138,5,'craft\\elements\\Entry',1,0,'2026-05-09 04:41:58','2026-05-09 04:41:58',NULL,NULL,NULL,'6d7e87ec-9fda-4d0b-801a-524479a39e63'),(265,248,NULL,139,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 04:41:58','2026-05-09 04:41:58',NULL,NULL,NULL,'2a6ad356-e179-44b7-9509-daec5c65a0a0'),(266,3,NULL,140,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:43:15','2026-05-09 04:43:15',NULL,NULL,NULL,'dedf528d-8436-4fd3-b91a-67714872e7bf'),(267,3,NULL,141,2,'craft\\elements\\Entry',1,0,'2026-05-09 04:44:05','2026-05-09 04:44:05',NULL,NULL,NULL,'0fd46c8a-a231-4825-a0ed-2ec95ce05258'),(268,3,NULL,142,2,'craft\\elements\\Entry',1,0,'2026-05-09 05:00:56','2026-05-09 05:00:56',NULL,NULL,NULL,'2fc6dfbb-c899-4347-b39b-657c002b96a8'),(269,3,NULL,143,2,'craft\\elements\\Entry',1,0,'2026-05-09 05:01:00','2026-05-09 05:01:00',NULL,NULL,NULL,'2654ce4b-4523-4ad3-8cf3-90276f525501'),(273,3,NULL,144,2,'craft\\elements\\Entry',1,0,'2026-05-09 20:53:01','2026-05-09 20:53:01',NULL,NULL,NULL,'a0ad9195-3624-4fef-b114-f7f84f455e27'),(274,247,NULL,145,5,'craft\\elements\\Entry',1,0,'2026-05-09 20:53:01','2026-05-09 20:53:01',NULL,NULL,NULL,'02d6d6da-68d2-4147-a7f7-ae60ed48877e'),(275,248,NULL,146,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 20:53:01','2026-05-09 20:53:01',NULL,NULL,NULL,'6321d340-c64e-4e74-bb5c-de0a664a210f'),(279,3,NULL,147,2,'craft\\elements\\Entry',1,0,'2026-05-09 20:53:58','2026-05-09 20:53:58',NULL,NULL,NULL,'3fe658a4-2a08-4c38-a8ec-f34e94e30aa3'),(280,247,NULL,148,5,'craft\\elements\\Entry',1,0,'2026-05-09 20:53:58','2026-05-09 20:53:58',NULL,NULL,NULL,'c24f5b05-13ec-4436-949b-6972e089a52c'),(281,248,NULL,149,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 20:53:58','2026-05-09 20:53:58',NULL,NULL,NULL,'ad3be44f-f61d-4024-bf3d-8cd6cb6a3a13'),(286,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2026-05-09 20:54:59','2026-05-09 21:12:32',NULL,NULL,NULL,'afa9beca-a85f-4ca4-b38c-af526aa30413'),(287,3,NULL,150,2,'craft\\elements\\Entry',1,0,'2026-05-09 20:54:59','2026-05-09 20:54:59',NULL,NULL,NULL,'b93d1ef6-189b-460c-838f-be38f33321f3'),(288,247,NULL,151,5,'craft\\elements\\Entry',1,0,'2026-05-09 20:54:59','2026-05-09 20:54:59',NULL,NULL,NULL,'cdceb5de-e2c7-4ff0-a8e0-3dd8f1f9bc61'),(289,248,NULL,152,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 20:54:59','2026-05-09 20:54:59',NULL,NULL,NULL,'993d4c87-4764-4c54-bd71-84555f3e0dc2'),(290,286,NULL,153,18,'craft\\elements\\Entry',1,0,'2026-05-09 20:54:59','2026-05-09 20:54:59',NULL,NULL,NULL,'8afbd1bb-b0a3-4e9d-b257-3f1e9698f1ee'),(295,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2026-05-09 20:55:54','2026-05-09 21:12:32',NULL,NULL,NULL,'a48fca5e-1ae4-4e5b-9219-1b8e156d2b38'),(296,3,NULL,154,2,'craft\\elements\\Entry',1,0,'2026-05-09 20:55:54','2026-05-09 20:55:54',NULL,NULL,NULL,'a3fae168-3aab-4e0b-9202-e3f4a97ebeed'),(297,247,NULL,155,5,'craft\\elements\\Entry',1,0,'2026-05-09 20:55:54','2026-05-09 20:55:54',NULL,NULL,NULL,'e0fff2ce-8dac-413e-a43f-88f6a0c9e9fb'),(298,248,NULL,156,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 20:55:54','2026-05-09 20:55:54',NULL,NULL,NULL,'e31816f7-03ce-4793-ab97-6f8d09e02777'),(299,295,NULL,157,18,'craft\\elements\\Entry',1,0,'2026-05-09 20:55:54','2026-05-09 20:55:54',NULL,NULL,NULL,'226b15ba-0af4-4db2-8d82-0036becb88f9'),(300,NULL,NULL,NULL,14,'craft\\elements\\Asset',1,0,'2026-05-09 21:08:23','2026-05-09 21:08:23',NULL,NULL,NULL,'731b6b05-0818-4293-bf23-5c6f5856fdc5'),(305,NULL,NULL,NULL,14,'craft\\elements\\Asset',1,0,'2026-05-09 21:12:08','2026-05-09 21:12:08',NULL,NULL,NULL,'95b03396-61d3-49a4-a9d8-6dec0c37bddd'),(306,NULL,NULL,NULL,14,'craft\\elements\\Asset',1,0,'2026-05-09 21:12:13','2026-05-09 21:12:13',NULL,NULL,NULL,'9cba0bb1-45e1-4e68-a313-f51971f5a8d3'),(309,3,NULL,158,2,'craft\\elements\\Entry',1,0,'2026-05-09 21:12:32','2026-05-09 21:12:32',NULL,NULL,NULL,'352d704c-c093-466d-b1bf-0835d0d405fa'),(310,247,NULL,159,5,'craft\\elements\\Entry',1,0,'2026-05-09 21:12:32','2026-05-09 21:12:32',NULL,NULL,NULL,'57f41e0c-8129-435b-aa54-75aa35eb34d5'),(311,248,NULL,160,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 21:12:32','2026-05-09 21:12:32',NULL,NULL,NULL,'2fd75721-206c-418b-a194-f1358d73181c'),(312,249,NULL,161,18,'craft\\elements\\Entry',1,0,'2026-05-09 21:12:32','2026-05-09 21:12:32',NULL,NULL,NULL,'44a479bd-c58f-482d-9fa4-1227d5dc78e8'),(313,286,NULL,162,18,'craft\\elements\\Entry',1,0,'2026-05-09 21:12:32','2026-05-09 21:12:32',NULL,NULL,NULL,'660b9b70-5842-4c13-ae53-5ec7b296b438'),(314,295,NULL,163,18,'craft\\elements\\Entry',1,0,'2026-05-09 21:12:32','2026-05-09 21:12:32',NULL,NULL,NULL,'32ed04a7-7690-4fc3-a09e-89e4a16626a5'),(318,3,NULL,164,2,'craft\\elements\\Entry',1,0,'2026-05-09 21:27:20','2026-05-09 21:27:20',NULL,NULL,NULL,'35d04368-cfe8-47a8-815f-64c213b9b679'),(319,247,NULL,165,5,'craft\\elements\\Entry',1,0,'2026-05-09 21:27:20','2026-05-09 21:27:20',NULL,NULL,NULL,'8e6270a8-e28f-4a96-b208-d9aaab94e0fb'),(320,248,NULL,166,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 21:27:20','2026-05-09 21:27:20',NULL,NULL,NULL,'c9e833b8-c1c8-4231-9116-e5cdbe778631'),(324,3,NULL,167,2,'craft\\elements\\Entry',1,0,'2026-05-09 21:27:28','2026-05-09 21:27:28',NULL,NULL,NULL,'00c20e81-8d08-4ae5-9fd9-c85f911ad778'),(325,247,NULL,168,5,'craft\\elements\\Entry',1,0,'2026-05-09 21:27:28','2026-05-09 21:27:28',NULL,NULL,NULL,'1f5b04c4-3520-40ff-a1df-f82e810323a2'),(326,248,NULL,169,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-09 21:27:28','2026-05-09 21:27:28',NULL,NULL,NULL,'d048deb7-4acd-4a84-af70-201ef6aaf4c7'),(327,3,NULL,170,2,'craft\\elements\\Entry',1,0,'2026-05-09 21:46:39','2026-05-09 21:46:39',NULL,NULL,NULL,'b43b98f9-339e-43a0-915a-d6fd61757d1d'),(328,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2026-05-09 22:02:23','2026-05-12 03:43:36',NULL,NULL,NULL,'f56e80d6-1580-43b3-8f1e-2229449c91e2'),(329,328,NULL,171,19,'craft\\elements\\Entry',1,0,'2026-05-09 22:02:30','2026-05-09 22:02:30',NULL,NULL,NULL,'33317e87-eeec-4498-ab4c-62a62e67d7ef'),(330,328,NULL,172,19,'craft\\elements\\Entry',0,0,'2026-05-09 22:10:25','2026-05-09 22:10:25',NULL,NULL,NULL,'9e3b1bf5-89e7-42e7-b773-ce5fc7313a6a'),(331,328,NULL,173,19,'craft\\elements\\Entry',1,0,'2026-05-12 00:31:51','2026-05-12 00:31:51',NULL,NULL,NULL,'9d9372e4-524d-473f-ad9e-142254fa717c'),(333,328,NULL,174,2,'craft\\elements\\Entry',1,0,'2026-05-12 00:44:49','2026-05-12 00:44:49',NULL,NULL,NULL,'7b8a0acf-cf70-46a9-abb0-ec1793b78068'),(334,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'c3c4c61c-1512-4af4-8e68-1a820dc0d615'),(335,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'cb657956-81ec-4200-9b27-f9749c52c53d'),(336,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'6d82ec1e-0376-48ca-8abc-9f146c1dfc07'),(337,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'ceeda23e-4d88-4eee-b285-dfff49324911'),(338,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'a4cb1434-ffb7-437a-80e8-f5a01b133e4e'),(339,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'27ba1ade-c141-4713-909d-687d907dfd32'),(340,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'d3c95145-392b-4436-b74d-10968cf716c7'),(341,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'e5b1659c-6ed8-4657-9b08-6d33cef845d0'),(342,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'457737fd-04fc-4588-9507-9393c99956a3'),(343,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'36cc719c-a7fe-4ccc-b195-52b39bfd72c8'),(344,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'964101e8-6fd3-41dd-bee9-f844f6537408'),(345,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'4c37040f-5234-4fdf-81d3-c20e9a1f977b'),(346,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'d073bbdf-7951-4e1b-b929-5278c16543b8'),(347,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'4286e68f-1b94-4fdc-bfa6-923609c74689'),(348,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'50d2a112-577a-49c6-9b19-509fa60440f0'),(349,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'3e1f5abb-9df9-429a-8c46-5aebb7b9f7df'),(350,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'8379e33d-fbdf-496d-90f2-145b6a1a92fe'),(351,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'c06c4f26-df10-4fd1-a7bd-fb15e519cc3a'),(352,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'0e4cef1f-c036-42fc-ac85-344cdf09d640'),(353,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'4208713a-8c3d-4a0f-a221-62c56f58b138'),(354,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'cd0e3632-4dac-4df0-a637-f5106231c40e'),(355,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'ecdecf08-0816-46d0-9056-852bf00c47ad'),(356,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'7f0bc24f-27c2-4462-93b7-cc14aee0033a'),(357,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 00:45:28',NULL,NULL,NULL,'86ee2c6d-67c4-4e5d-b2f2-7e428eb564e2'),(364,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 03:17:01',NULL,NULL,NULL,'578de97b-a3d7-4c4e-82ba-f34b777b2391'),(365,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:49:30','2026-05-12 03:17:01',NULL,NULL,NULL,'004b1c6e-7061-4e35-a58b-5d690e19b3b9'),(366,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 01:24:16',NULL,NULL,NULL,'07b098b4-facb-4d53-8cc2-813600ea7226'),(367,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'001c060c-c20e-4768-9b95-f89bc1a2f683'),(368,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'61387ee7-2af1-4062-bb23-253a3c28cd05'),(369,328,NULL,175,2,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'7f68be96-32a7-4631-a1cc-e55f965074af'),(370,364,NULL,176,5,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'324dc0fb-a715-4e7d-8297-9c3eab197510'),(371,365,NULL,177,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'c634290e-9320-4a43-b377-16cd0a897cd0'),(372,366,NULL,178,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'49f8e587-7070-4bf8-9293-3b112627827a'),(373,367,NULL,179,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'549e9575-058f-48bf-85cc-a21a5aa3191c'),(374,368,NULL,180,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:30','2026-05-12 00:49:30',NULL,NULL,NULL,'16bbaad2-bf69-44cb-acfe-d4890734c1dd'),(378,328,NULL,181,2,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:33','2026-05-12 00:49:33',NULL,NULL,NULL,'13f226bc-163c-4341-a68e-beab92d8e1d5'),(379,364,NULL,182,5,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:33','2026-05-12 00:49:33',NULL,NULL,NULL,'608b59e2-4743-4e44-a91b-3e4c5f04eeee'),(380,365,NULL,183,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:49:33','2026-05-12 00:49:33',NULL,NULL,NULL,'dc847c39-227e-4ba7-a49d-849173bbbd87'),(381,328,NULL,184,2,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:59','2026-05-12 00:49:59',NULL,NULL,NULL,'372ac8ea-bb9a-421b-ae55-990f712debf9'),(382,364,NULL,185,5,'craft\\elements\\Entry',1,0,'2026-05-12 00:49:59','2026-05-12 00:49:59',NULL,NULL,NULL,'8bcca292-9db7-4419-b677-bb50f35935b3'),(383,365,NULL,186,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:49:59','2026-05-12 00:49:59',NULL,NULL,NULL,'0ff4168a-77fa-49a2-9cb0-6a080025d484'),(388,328,NULL,187,2,'craft\\elements\\Entry',1,0,'2026-05-12 00:50:07','2026-05-12 00:50:07',NULL,NULL,NULL,'38b0340a-6113-4d29-a941-3ef48b0fba41'),(389,364,NULL,188,5,'craft\\elements\\Entry',1,0,'2026-05-12 00:50:07','2026-05-12 00:50:07',NULL,NULL,NULL,'572c79ef-baaa-43e5-b73d-67e57e8f0228'),(390,365,NULL,189,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:50:07','2026-05-12 00:50:07',NULL,NULL,NULL,'00c6b945-20cf-4718-b3cd-04bea90554c6'),(391,366,NULL,190,18,'craft\\elements\\Entry',1,0,'2026-05-12 00:50:07','2026-05-12 00:50:07',NULL,NULL,NULL,'067817f6-6cac-4109-ad74-49cd98513aa7'),(396,328,NULL,191,2,'craft\\elements\\Entry',1,0,'2026-05-12 01:24:16','2026-05-12 01:24:16',NULL,NULL,NULL,'96793231-ae18-4298-b46f-676a11657e5b'),(397,364,NULL,192,5,'craft\\elements\\Entry',1,0,'2026-05-12 01:24:16','2026-05-12 01:24:16',NULL,NULL,NULL,'a6bed36d-a530-42c2-909a-569e7a115bfb'),(398,365,NULL,193,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 01:24:16','2026-05-12 01:24:16',NULL,NULL,NULL,'ecb75fc2-81eb-458b-afb4-22c3231761dc'),(399,366,NULL,194,18,'craft\\elements\\Entry',1,0,'2026-05-12 01:24:16','2026-05-12 01:24:16',NULL,NULL,NULL,'a155bc71-751f-47e4-a4d2-1a648c83ba5e'),(403,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-05-12 01:25:13','2026-05-12 03:12:58',NULL,NULL,NULL,'22423655-ae4f-404b-868d-b98c5295a44a'),(404,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 01:25:13','2026-05-12 03:12:58',NULL,NULL,NULL,'d89d4bfe-bfd9-4ab3-873e-133ec1686c45'),(405,328,NULL,195,2,'craft\\elements\\Entry',1,0,'2026-05-12 01:25:13','2026-05-12 01:25:13',NULL,NULL,NULL,'46f55c4f-1c60-41a6-81ff-0a05e3b1db9b'),(406,403,NULL,196,5,'craft\\elements\\Entry',1,0,'2026-05-12 01:25:13','2026-05-12 01:25:14',NULL,NULL,NULL,'3fc5687a-d77d-40f5-aa1c-61e57ddd6580'),(407,404,NULL,197,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 01:25:13','2026-05-12 01:25:14',NULL,NULL,NULL,'bbf539d8-a06d-4c9c-a996-c01c68637161'),(411,328,NULL,198,2,'craft\\elements\\Entry',1,0,'2026-05-12 01:25:47','2026-05-12 01:25:47',NULL,NULL,NULL,'40b7c262-48de-4fae-b4fa-b77c6adc75fe'),(412,403,NULL,199,5,'craft\\elements\\Entry',1,0,'2026-05-12 01:25:47','2026-05-12 01:25:48',NULL,NULL,NULL,'42edbad3-f894-4e93-92af-590f4892f33e'),(413,404,NULL,200,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 01:25:47','2026-05-12 01:25:48',NULL,NULL,NULL,'74a2e8da-6bd7-4a19-b1b4-1d72eeffffea'),(414,328,NULL,201,2,'craft\\elements\\Entry',1,0,'2026-05-12 01:25:56','2026-05-12 01:25:56',NULL,NULL,NULL,'1a113fa8-5c3f-4488-bac8-18ff7f47cf48'),(416,328,NULL,202,2,'craft\\elements\\Entry',1,0,'2026-05-12 01:26:21','2026-05-12 01:26:21',NULL,NULL,NULL,'6962d24b-7aaa-4f69-84fb-52f7b28ab17f'),(422,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-05-12 02:51:37','2026-05-12 03:12:58',NULL,NULL,NULL,'1016fd33-3275-441b-98e5-c908a26c6470'),(423,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 02:51:37','2026-05-12 03:12:58',NULL,NULL,NULL,'30afc83d-276f-4a02-b091-3a763c6eef57'),(424,328,NULL,203,2,'craft\\elements\\Entry',1,0,'2026-05-12 02:51:37','2026-05-12 02:51:37',NULL,NULL,NULL,'e4b29070-7997-48bb-8ea3-56bc1b01e9ec'),(425,403,NULL,204,5,'craft\\elements\\Entry',1,0,'2026-05-12 02:51:37','2026-05-12 02:51:37',NULL,NULL,NULL,'451a4e75-192c-4428-abda-6a0bb103158b'),(426,404,NULL,205,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 02:51:37','2026-05-12 02:51:37',NULL,NULL,NULL,'bd35cc9b-79bb-43cf-beb4-d53fc96ee193'),(427,422,NULL,206,5,'craft\\elements\\Entry',1,0,'2026-05-12 02:51:37','2026-05-12 02:51:38',NULL,NULL,NULL,'765cf771-50fd-4996-8336-a7be25dfc460'),(428,423,NULL,207,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 02:51:37','2026-05-12 02:51:38',NULL,NULL,NULL,'ce0a318c-402f-4d52-a804-b9fdfaa5d376'),(432,328,NULL,208,2,'craft\\elements\\Entry',1,0,'2026-05-12 02:52:06','2026-05-12 02:52:06',NULL,NULL,NULL,'556cc20e-9892-44b4-a9f9-7368ac69edcf'),(433,422,NULL,209,5,'craft\\elements\\Entry',1,0,'2026-05-12 02:52:06','2026-05-12 02:52:06',NULL,NULL,NULL,'c730e1c0-12e7-4ed4-8c88-34c0ebdbbefa'),(434,423,NULL,210,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 02:52:06','2026-05-12 02:52:06',NULL,NULL,NULL,'2e53bc31-6812-449b-98fb-981fbf9026bb'),(438,328,NULL,211,2,'craft\\elements\\Entry',1,0,'2026-05-12 02:52:39','2026-05-12 02:52:39',NULL,NULL,NULL,'af0c2bc7-acb9-4313-8347-1485c78a3b02'),(439,422,NULL,212,5,'craft\\elements\\Entry',1,0,'2026-05-12 02:52:39','2026-05-12 02:52:39',NULL,NULL,NULL,'22b2aab4-8e99-4632-a7a4-3653a5ae52e2'),(440,423,NULL,213,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 02:52:39','2026-05-12 02:52:39',NULL,NULL,NULL,'8f1451ee-b0c3-475e-a12b-1136b3fc648f'),(444,328,NULL,214,2,'craft\\elements\\Entry',1,0,'2026-05-12 02:53:09','2026-05-12 02:53:09',NULL,NULL,NULL,'673c8236-4404-428d-9348-db008d1a18e6'),(445,422,NULL,215,5,'craft\\elements\\Entry',1,0,'2026-05-12 02:53:09','2026-05-12 02:53:09',NULL,NULL,NULL,'9a17d6df-703d-4679-ad70-9a7c242fad2d'),(446,423,NULL,216,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 02:53:09','2026-05-12 02:53:09',NULL,NULL,NULL,'19919a1b-8122-44d2-a6fe-e142db441a8d'),(454,328,NULL,217,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'a629a929-b14a-42c6-b786-eb92410c2828'),(455,403,NULL,218,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'204ca9a3-de5d-4bab-b261-fa38b4572dfc'),(456,404,NULL,219,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'ea02b611-3430-4563-9a25-a0262e5aa953'),(457,364,NULL,220,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'e6229236-d0b2-474d-ab9b-021c313ce0be'),(458,365,NULL,221,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'9f1d868f-521d-4382-a527-29438f7c8520'),(459,422,NULL,222,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'0fee8f83-e02b-4cab-9e85-dd1d0df67063'),(460,423,NULL,223,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:12:58','2026-05-12 03:12:58',NULL,NULL,NULL,'67e7f269-f9a2-4379-a94a-a1e0591a7e26'),(468,3,NULL,224,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'ba21c7c5-4817-4bc9-b5ab-08cd0b95b3d5'),(469,144,NULL,225,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'eea346ed-4abe-49b8-8136-5491ec0ac2be'),(470,342,NULL,226,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'3a654fd4-9550-4c7b-86e5-bdf42c6bbdb5'),(471,343,NULL,227,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'dd4189bc-87f0-4735-a736-bd5d74bcf692'),(472,145,NULL,228,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'943e44c1-eaa1-47be-a3c6-3f301fd6042d'),(473,344,NULL,229,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'c72c2e32-6203-463c-97b0-e70c6a999bda'),(474,345,NULL,230,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'c4a29686-1331-4150-8d0c-48800c7cccdc'),(475,64,NULL,231,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'b704a628-91cd-4879-b3be-a0a02a71d87c'),(476,346,NULL,232,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'22f94b10-468a-47af-891d-8493ea2cf6ed'),(477,347,NULL,233,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'53de3b08-0230-40b4-9dd6-c212d624540f'),(478,67,NULL,234,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'9f8a6861-e8b5-4d59-90f8-995eb217cc44'),(479,348,NULL,235,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'56447bcf-d14e-43d4-a367-95135be82832'),(480,349,NULL,236,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'5a808844-c7f7-4c96-bb1b-0603bd1e5727'),(481,247,NULL,237,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'151453a6-b307-40ed-a735-824e55be9ce2'),(482,354,NULL,238,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'1f046283-543c-43e2-9fd8-70afa302d4c3'),(483,355,NULL,239,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'b36aa6be-2faf-44dd-9b6e-2451a7611434'),(484,356,NULL,240,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'c1f9707c-0f6c-4e39-9966-a3c948782789'),(485,357,NULL,241,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 00:45:28','2026-05-12 03:13:37',NULL,NULL,NULL,'3a0bee1d-1277-45c3-ab90-93187d686d53'),(486,248,NULL,242,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:13:37','2026-05-12 03:13:37',NULL,NULL,NULL,'8453bdc7-c386-4f5c-9957-c908516370de'),(490,3,NULL,243,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:14:05','2026-05-12 03:14:05',NULL,NULL,NULL,'22ffea11-dc87-4fc2-885f-266cfa67e43e'),(491,247,NULL,244,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:14:05','2026-05-12 03:14:05',NULL,NULL,NULL,'7e758a20-e8b4-4965-8256-694a5fe15f92'),(492,248,NULL,245,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:14:05','2026-05-12 03:14:05',NULL,NULL,NULL,'e9688e4c-95da-4f90-a8c7-1ba3d5f81868'),(493,328,NULL,246,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:14:32','2026-05-12 03:14:32',NULL,NULL,NULL,'c46e364b-73d7-46a5-9236-d65289f50d7f'),(497,328,NULL,247,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:17:00','2026-05-12 03:17:01',NULL,NULL,NULL,'9d23a24e-bc1c-4109-aaac-f68632ced847'),(498,364,NULL,248,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:17:01','2026-05-12 03:17:01',NULL,NULL,NULL,'e01ebd2f-7fe5-4ba5-8c9d-d0b4d7703963'),(499,365,NULL,249,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:17:01','2026-05-12 03:17:01',NULL,NULL,NULL,'e2b04f3b-141c-4b18-9ffe-1a98453996aa'),(503,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:40:03','2026-05-12 03:43:36',NULL,NULL,NULL,'3e4d7888-daa7-4e5c-8415-8c3ad5a7537b'),(504,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:40:03','2026-05-12 03:43:36',NULL,NULL,NULL,'288e1718-a325-4b6b-9646-42b89d1abae3'),(505,328,NULL,250,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:40:03','2026-05-12 03:40:03',NULL,NULL,NULL,'8e5f9f3d-cbb2-42e8-bd4a-b313577a8c4c'),(506,503,NULL,251,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:40:03','2026-05-12 03:40:03',NULL,NULL,NULL,'9d7f6791-57d9-459a-ab39-093c61eddfe0'),(507,504,NULL,252,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:40:03','2026-05-12 03:40:03',NULL,NULL,NULL,'6c877f65-4793-4e61-987d-76a333d99e72'),(511,328,NULL,253,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:41:19','2026-05-12 03:41:19',NULL,NULL,NULL,'074f086e-24a4-49cf-9ae8-f1cf408897a0'),(512,503,NULL,254,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:41:19','2026-05-12 03:41:19',NULL,NULL,NULL,'e03e3fcd-4b30-452e-80ce-0764b5bf4b8e'),(513,504,NULL,255,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:41:19','2026-05-12 03:41:19',NULL,NULL,NULL,'848e2802-a632-496a-98af-339780ba4109'),(522,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'31de30c2-d2b8-4488-916a-39c0bb673409'),(523,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'9e519c98-f17f-47dc-8a20-b8afac3f496a'),(524,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'aeeef081-6630-4169-b1ec-3b9768e853e7'),(525,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'3ddb5103-365c-45c9-8383-3eadc799d2b8'),(526,NULL,NULL,NULL,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'0f484a8a-a484-4d91-b7d1-01a319c8e429'),(527,328,NULL,256,2,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'bd657c6b-b820-4b9f-8910-c8f4cd56c469'),(528,503,NULL,257,5,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'cf99aa0c-6a3e-49f6-81be-166c110413d9'),(529,504,NULL,258,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'20d64a75-5fc0-4594-af08-40e5614d1bd3'),(530,522,NULL,259,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'f9da329d-93dd-4fb8-829b-e15ec497dbdf'),(531,523,NULL,260,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'eab66d1a-4da6-4c17-8534-48e7eeec3220'),(532,524,NULL,261,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'cb210768-1135-45d7-9c51-d0846534569f'),(533,525,NULL,262,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'5ffc618f-68da-4716-a774-67a929b54f43'),(534,526,NULL,263,24,'craft\\elements\\Entry',1,0,'2026-05-12 03:43:36','2026-05-12 03:43:36',NULL,NULL,NULL,'96268103-6586-4e3c-abb9-b06be4fa9e13'),(538,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-05-13 14:44:30','2026-05-13 17:39:03',NULL,NULL,NULL,'f21e3809-33d5-4e04-9199-4d834cc3f568'),(539,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-13 14:44:30','2026-05-13 17:39:03',NULL,NULL,NULL,'8daa3196-bbc4-4ad3-b55f-a29c854a863a'),(540,3,NULL,264,2,'craft\\elements\\Entry',1,0,'2026-05-13 14:44:30','2026-05-13 14:44:30',NULL,NULL,NULL,'d10d951f-5d0e-44d9-840a-c04366b72bf9'),(541,538,NULL,265,5,'craft\\elements\\Entry',1,0,'2026-05-13 14:44:30','2026-05-13 14:44:30',NULL,NULL,NULL,'7b0b779e-7385-4d00-8b23-0664ec4b3c72'),(542,539,NULL,266,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-13 14:44:30','2026-05-13 14:44:30',NULL,NULL,NULL,'caf341ac-ff26-499f-a5a1-7d461d0ffb1e'),(543,3,NULL,267,2,'craft\\elements\\Entry',1,0,'2026-05-13 14:45:02','2026-05-13 14:45:02',NULL,NULL,NULL,'90ad2c09-4b0a-4e59-aadc-3bbaf2425647'),(544,NULL,NULL,NULL,NULL,'verbb\\formie\\elements\\Form',1,0,'2026-05-13 14:45:16','2026-05-13 14:58:09',NULL,NULL,NULL,'c9d644eb-a303-4b51-86fa-555c0ec91a36'),(548,3,NULL,268,2,'craft\\elements\\Entry',1,0,'2026-05-13 14:58:25','2026-05-13 14:58:25',NULL,NULL,NULL,'e24d34e9-7fd9-4f5e-996a-7a1c7d5cc6a2'),(549,538,NULL,269,5,'craft\\elements\\Entry',1,0,'2026-05-13 14:58:25','2026-05-13 14:58:25',NULL,NULL,NULL,'54ee0ce4-960e-4c6c-9b25-fd778ab7e545'),(550,539,NULL,270,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-13 14:58:25','2026-05-13 14:58:25',NULL,NULL,NULL,'f7f1b2ab-e334-4141-bd3e-5fa254d7c5de'),(551,3,NULL,271,2,'craft\\elements\\Entry',1,0,'2026-05-13 15:05:25','2026-05-13 15:05:25',NULL,NULL,NULL,'5e9d71e3-0a5e-4ada-bb6d-3a1021bc9844'),(552,3,NULL,272,2,'craft\\elements\\Entry',1,0,'2026-05-13 15:18:34','2026-05-13 15:18:35',NULL,NULL,NULL,'b7d282b9-dd20-4902-8a7a-b8f5fc6bb7a9'),(553,538,NULL,273,5,'craft\\elements\\Entry',1,0,'2026-05-13 15:18:34','2026-05-13 15:18:35',NULL,NULL,NULL,'07d5db17-037f-4db9-895b-77fa5a7bc3e5'),(554,539,NULL,274,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-13 15:18:34','2026-05-13 15:18:35',NULL,NULL,NULL,'23360f45-2a38-4a25-a76a-b2c4f252f0a2'),(555,3,NULL,275,2,'craft\\elements\\Entry',1,0,'2026-05-13 15:21:56','2026-05-13 15:21:56',NULL,NULL,NULL,'4b4ca5dc-f2df-47f0-9896-31093c5bfd7a'),(559,3,NULL,276,2,'craft\\elements\\Entry',1,0,'2026-05-13 16:08:59','2026-05-13 16:08:59',NULL,NULL,NULL,'9b5e42c1-d4e3-4293-b15b-4bd00c4e7f80'),(560,538,NULL,277,5,'craft\\elements\\Entry',1,0,'2026-05-13 16:08:59','2026-05-13 16:08:59',NULL,NULL,NULL,'d526d0a8-3739-4836-b053-01456d2af2f8'),(561,539,NULL,278,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-13 16:08:59','2026-05-13 16:08:59',NULL,NULL,NULL,'890d9431-56d1-423a-9e0e-6642f3b820b2'),(562,3,NULL,279,2,'craft\\elements\\Entry',1,0,'2026-05-13 16:11:02','2026-05-13 16:11:02',NULL,NULL,NULL,'8e8c6fbd-9573-4a56-93a9-a91731af1496'),(566,3,NULL,280,2,'craft\\elements\\Entry',1,0,'2026-05-13 17:39:03','2026-05-13 17:39:03',NULL,NULL,NULL,'80b8ae67-c46f-4796-b3a7-f58d7d96d43f'),(567,538,NULL,281,5,'craft\\elements\\Entry',1,0,'2026-05-13 17:39:03','2026-05-13 17:39:03',NULL,NULL,NULL,'eaffcde0-3485-416c-9265-6dff31792823'),(568,539,NULL,282,NULL,'craft\\elements\\ContentBlock',1,0,'2026-05-13 17:39:03','2026-05-13 17:39:03',NULL,NULL,NULL,'04a4b7ea-5974-4c30-b61a-0ce63bf989ea');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES (28,3,1),(29,28,1),(37,152,1),(37,158,1),(37,161,1),(37,162,1),(37,164,1),(37,168,1),(37,174,1),(37,177,1),(37,181,1),(37,187,1),(37,193,1),(37,199,1),(37,202,1),(37,206,1),(37,209,1),(37,215,1),(37,221,1),(37,231,1),(37,234,1),(37,235,1),(37,236,1),(37,240,1),(37,250,1),(37,255,1),(37,256,1),(37,260,1),(37,263,1),(37,266,1),(37,267,1),(37,268,1),(37,269,1),(37,273,1),(37,279,1),(37,287,1),(37,296,1),(37,309,1),(37,318,1),(37,324,1),(37,327,1),(37,468,1),(37,490,1),(37,540,1),(37,543,1),(37,548,1),(37,551,1),(37,552,1),(37,555,1),(37,559,1),(37,562,1),(37,566,1),(38,37,1),(47,42,1),(67,64,1),(140,139,1),(145,144,1),(154,153,1),(160,159,1),(170,169,1),(176,175,1),(183,182,1),(189,188,1),(195,194,1),(201,200,1),(208,207,1),(211,210,1),(217,216,1),(223,222,1),(230,229,1),(233,232,1),(242,241,1),(248,247,1),(249,248,1),(252,251,1),(253,252,1),(253,262,1),(253,265,1),(253,275,1),(253,281,1),(253,289,1),(253,298,1),(262,261,1),(265,264,1),(275,274,1),(281,280,1),(289,288,1),(298,297,1),(311,310,1),(312,311,1),(312,320,1),(312,326,1),(312,486,1),(312,492,1),(320,319,1),(326,325,1),(334,28,1),(335,28,1),(336,28,1),(337,28,1),(338,42,1),(339,42,1),(340,42,1),(341,42,1),(342,144,1),(343,144,1),(344,144,1),(345,144,1),(346,64,1),(347,64,1),(348,64,1),(349,64,1),(350,229,1),(351,229,1),(352,229,1),(353,229,1),(354,247,1),(355,247,1),(356,247,1),(357,247,1),(365,364,1),(366,365,1),(370,369,1),(371,370,1),(372,371,1),(372,380,1),(372,383,1),(379,378,1),(380,379,1),(382,381,1),(383,382,1),(389,388,1),(390,389,1),(391,390,1),(397,396,1),(397,405,1),(397,411,1),(397,414,1),(398,397,1),(399,398,1),(399,458,1),(399,499,1),(403,328,1),(404,403,1),(407,406,1),(412,416,1),(413,412,1),(423,422,1),(425,424,1),(425,432,1),(425,438,1),(425,444,1),(426,425,1),(428,427,1),(434,433,1),(440,439,1),(446,445,1),(455,454,1),(455,493,1),(455,497,1),(455,505,1),(455,511,1),(455,527,1),(456,455,1),(458,457,1),(460,459,1),(470,469,1),(471,469,1),(472,469,1),(473,469,1),(474,469,1),(476,475,1),(477,475,1),(478,475,1),(479,475,1),(480,475,1),(482,481,1),(482,491,1),(483,481,1),(483,491,1),(484,481,1),(484,491,1),(485,481,1),(485,491,1),(486,481,1),(492,491,1),(499,498,1),(504,503,1),(507,506,1),(513,512,1),(522,504,1),(529,528,1),(530,529,1),(539,538,1),(542,541,1),(550,549,1),(554,553,1),(561,560,1),(568,567,1),(42,3,2),(44,152,2),(44,158,2),(44,161,2),(44,162,2),(44,164,2),(44,168,2),(44,174,2),(44,177,2),(44,181,2),(44,187,2),(44,193,2),(44,199,2),(44,202,2),(44,206,2),(44,209,2),(44,215,2),(44,221,2),(44,231,2),(44,234,2),(44,235,2),(44,236,2),(44,240,2),(44,250,2),(44,255,2),(44,256,2),(44,260,2),(44,263,2),(44,266,2),(44,267,2),(44,268,2),(44,269,2),(44,273,2),(44,279,2),(44,287,2),(44,296,2),(44,309,2),(44,318,2),(44,324,2),(44,327,2),(44,468,2),(44,490,2),(44,540,2),(44,543,2),(44,548,2),(44,551,2),(44,552,2),(44,555,2),(44,559,2),(44,562,2),(44,566,2),(286,248,2),(290,289,2),(290,298,2),(313,311,2),(313,320,2),(313,326,2),(313,486,2),(313,492,2),(364,328,2),(367,365,2),(373,371,2),(373,380,2),(373,383,2),(373,390,2),(373,398,2),(373,458,2),(373,499,2),(397,416,2),(397,424,2),(397,432,2),(397,438,2),(397,444,2),(406,405,2),(412,411,2),(412,414,2),(457,454,2),(457,493,2),(498,497,2),(498,505,2),(498,511,2),(498,527,2),(523,504,2),(531,529,2),(52,3,3),(139,152,3),(139,158,3),(139,161,3),(139,162,3),(144,3,3),(159,164,3),(169,168,3),(175,174,3),(175,177,3),(175,181,3),(175,187,3),(175,193,3),(175,199,3),(175,202,3),(207,206,3),(210,209,3),(216,215,3),(222,221,3),(222,231,3),(222,234,3),(222,235,3),(222,236,3),(222,240,3),(222,250,3),(222,255,3),(222,256,3),(222,260,3),(222,263,3),(222,266,3),(222,267,3),(222,268,3),(222,269,3),(222,273,3),(222,279,3),(222,287,3),(222,296,3),(222,309,3),(222,318,3),(222,324,3),(222,327,3),(295,248,3),(299,298,3),(314,311,3),(314,320,3),(314,326,3),(314,486,3),(314,492,3),(368,365,3),(374,371,3),(374,380,3),(374,383,3),(374,390,3),(374,398,3),(374,458,3),(374,499,3),(427,424,3),(433,432,3),(439,438,3),(445,444,3),(459,454,3),(459,493,3),(459,497,3),(459,505,3),(469,468,3),(469,490,3),(469,540,3),(469,543,3),(469,548,3),(469,551,3),(469,552,3),(469,555,3),(469,559,3),(469,562,3),(469,566,3),(503,328,3),(512,511,3),(524,504,3),(528,527,3),(532,529,3),(57,3,4),(64,3,4),(139,164,4),(139,168,4),(139,174,4),(139,177,4),(153,152,4),(159,158,4),(159,161,4),(159,162,4),(182,181,4),(188,187,4),(194,193,4),(200,199,4),(200,202,4),(200,206,4),(200,209,4),(200,215,4),(200,221,4),(200,231,4),(200,234,4),(200,235,4),(200,236,4),(200,240,4),(200,250,4),(200,255,4),(200,256,4),(200,260,4),(200,263,4),(200,266,4),(200,267,4),(200,268,4),(200,269,4),(200,273,4),(200,279,4),(200,287,4),(200,296,4),(200,309,4),(200,318,4),(200,324,4),(200,327,4),(422,328,4),(459,511,4),(459,527,4),(475,468,4),(475,490,4),(475,540,4),(475,543,4),(475,548,4),(475,551,4),(475,552,4),(475,555,4),(475,559,4),(475,562,4),(475,566,4),(506,505,4),(525,504,4),(533,529,4),(229,3,5),(232,231,5),(232,234,5),(232,235,5),(232,236,5),(241,240,5),(241,255,5),(241,256,5),(241,260,5),(241,263,5),(241,266,5),(241,267,5),(241,268,5),(241,269,5),(241,273,5),(241,279,5),(241,287,5),(241,296,5),(241,309,5),(241,318,5),(241,324,5),(241,327,5),(241,468,5),(241,490,5),(241,540,5),(241,543,5),(241,548,5),(241,551,5),(241,552,5),(241,555,5),(241,559,5),(241,562,5),(241,566,5),(251,250,5),(526,504,5),(534,529,5),(241,250,6),(247,3,6),(251,255,6),(251,256,6),(261,260,6),(264,263,6),(264,266,6),(264,267,6),(264,268,6),(264,269,6),(274,273,6),(280,279,6),(288,287,6),(297,296,6),(310,309,6),(319,318,6),(325,324,6),(325,327,6),(481,468,6),(491,490,6),(491,540,6),(491,543,6),(491,548,6),(491,551,6),(491,552,6),(491,555,6),(491,559,6),(491,562,6),(491,566,6),(538,3,7),(541,540,7),(541,543,7),(549,548,7),(549,551,7),(553,552,7),(553,555,7),(560,559,7),(560,562,7),(567,566,7);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-03-12 17:35:45','2026-03-12 17:35:45','bf2a1227-9b30-4d9b-a781-4eee0ab37d98'),(2,2,1,'Store',NULL,NULL,NULL,1,'2026-03-19 20:00:10','2026-03-19 20:00:10','f02022f3-a7db-48fe-b796-118b163421d0'),(3,3,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 13:57:24','2026-03-25 14:45:23','20668cf6-40b0-4041-8510-abb38cff89e9'),(28,28,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','8dc77f7c-f03f-4494-944f-abf198215ff1'),(29,29,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/KqPJGqHaUqELJ5Cs9\", \"target\": \"_blank\"}, \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"c53d75b5-67d6-47b2-b41a-327f91a1c146\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}}',1,'2026-03-25 15:35:21','2026-03-25 15:36:14','97ce8045-5d14-496d-bd48-77f52706d192'),(37,37,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:36:14','2026-03-25 15:36:14','dc7c5c1c-152c-489f-9e94-d56c995db96f'),(38,38,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/KqPJGqHaUqELJ5Cs9\", \"target\": \"_blank\"}, \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"c53d75b5-67d6-47b2-b41a-327f91a1c146\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}}',1,'2026-03-25 15:36:14','2026-03-25 15:36:14','a6b286c1-2e45-4b51-908a-11e629755388'),(42,42,1,NULL,'__temp_olptniqbrcvowkzmucejwynueaqayriksziw',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"productCarousel\"}',1,'2026-03-28 03:09:25','2026-03-28 03:09:25','15e69424-6ba3-4e3e-b189-159b3330539c'),(44,44,1,NULL,'__temp_olptniqbrcvowkzmucejwynueaqayriksziw',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"productCarousel\"}',1,'2026-03-28 03:09:25','2026-03-28 03:09:25','55cb802c-be83-46d2-8037-a202ebb544f8'),(47,47,1,NULL,NULL,NULL,NULL,1,'2026-03-28 22:15:26','2026-03-28 22:15:26','bfd41646-3bb1-4fb9-89c0-b9b8d2d64009'),(52,52,1,NULL,'__temp_rzbsvmxqlpvpseevknimnumdkivfzoibxmbb',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:17:28','2026-03-28 22:17:28','40513ccd-28c5-4c5a-959e-427113d42a47'),(57,57,1,NULL,'__temp_xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:19:12','2026-03-28 22:19:12','cdfd0ab0-69c3-4e9f-8f14-ec63a542f359'),(64,64,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 23:21:47','2026-03-28 23:21:47','031392cb-e033-475d-95a5-a973ab5b14f9'),(67,67,1,NULL,NULL,NULL,'{\"0b92e79b-252c-4fdd-9467-b23f1b66911f\": [], \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"b1fc4697-c4a0-457e-be69-38665a393900\": \"white\", \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-03-28 23:22:37','2026-05-12 03:13:37','76a6f393-3c93-40cc-9df3-9f99d2f564bf'),(139,139,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:02:34','2026-04-03 18:02:34','5c4e27c8-5e7b-4061-afcb-12b2cc2d8da9'),(140,140,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:02:34','2026-04-03 18:02:34','229211b2-6fc6-40bd-a534-a2fa578db3a8'),(144,144,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:02:52','2026-04-03 18:02:52','e2757675-f287-4ab7-98ac-42088132e98e'),(145,145,1,NULL,NULL,NULL,'{\"0b92e79b-252c-4fdd-9467-b23f1b66911f\": [], \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"b1fc4697-c4a0-457e-be69-38665a393900\": \"charcoal\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:02:52','2026-05-12 03:13:37','1d013ea1-9851-49fd-9d1c-f0022257363f'),(152,152,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:03:55','2026-04-03 18:03:55','9a1daf88-2f35-40e4-9586-9bc7094203c3'),(153,153,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:03:55','2026-04-03 18:03:55','a1fa9af4-fc32-4624-8cff-8f44bd747488'),(154,154,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:03:55','2026-04-03 18:03:55','c6024c25-4528-43e0-97c8-626d0a1c6c61'),(158,158,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:05:30','2026-04-03 18:05:30','1e25883a-52db-4700-b50a-aa55980a244c'),(159,159,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:05:30','2026-04-03 18:05:30','a6e3f7f3-3dcf-40e8-bfa1-0f502ca72f43'),(160,160,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p>100% dog-safe ingredients<br />Made to order — customizable message<br />Available for pickup or shipping</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:05:30','2026-04-03 18:05:30','bc9eac5d-f9df-4af8-baee-cd39e2f07f51'),(161,161,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:16:26','2026-04-03 18:16:26','95bad8af-ec9d-4bb4-b9dc-9e73a9b5f63f'),(162,162,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:17:16','2026-04-03 18:17:16','3b1ea346-a3ea-4060-8894-a04beb7ea0bd'),(164,164,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:36:41','2026-04-03 18:36:41','8d6287f9-ce30-4455-bca2-0569a51b8311'),(168,168,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:37:18','2026-04-03 18:37:18','aae87159-670b-441a-802f-b0cc7284e630'),(169,169,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:37:18','2026-04-03 18:37:18','89902265-0e20-476b-8e5a-f82f43242597'),(170,170,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p>100% dog-safe ingredients<br />Made to order — customizable message<br />Available for pickup or shipping</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:37:18','2026-04-03 18:37:18','80fd2a57-50b2-4a72-9395-8f207808c404'),(174,174,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:37:45','2026-04-03 18:37:45','f38dbb3e-0929-4ac0-a912-c8bac96cee5a'),(175,175,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:37:45','2026-04-03 18:37:45','9a6f1727-1116-4c67-9121-87f548b14bcf'),(176,176,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p>100% dog-safe ingredients<br />Made to order — customizable message<br />Available for pickup or shipping</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:37:45','2026-04-03 18:37:45','a5d36771-d03c-4413-8622-9a25f10dd2be'),(177,177,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:38:57','2026-04-03 18:38:57','da8657ea-4e30-4361-9d2d-ab14f152d452'),(181,181,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:42:57','2026-04-03 18:42:57','0f021a7d-d490-4a79-a046-6b53586b8a72'),(182,182,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:42:57','2026-04-03 18:42:57','23994f8c-956a-4253-87a1-cbbb33083efa'),(183,183,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:42:57','2026-04-03 18:42:57','06db4781-a4a4-45a5-90be-7565acb26840'),(187,187,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:44:08','2026-04-03 18:44:08','07c24b23-eb0a-40b4-ad5a-ea74568a39a5'),(188,188,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:44:08','2026-04-03 18:44:08','b09024d9-6cb8-43be-9220-dde00af9bb31'),(189,189,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.\\\",<br />\\\"Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:44:08','2026-04-03 18:44:08','c04d48ca-1a01-47bb-b4a5-e16a4a6b5c39'),(193,193,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:44:29','2026-04-03 18:44:29','3642bd9e-8f70-4c07-8274-61435b6c7552'),(194,194,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:44:29','2026-04-03 18:44:29','a488d6e2-a793-4073-b736-8f0a0eae9c70'),(195,195,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:44:29','2026-04-03 18:44:29','366b5459-3d27-4e92-ba0c-4b9d9281dc76'),(199,199,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 03:57:31','2026-04-04 03:57:31','096e6d38-4813-4a91-a843-3ecc6350a3a2'),(200,200,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 03:57:31','2026-04-04 03:57:31','0356a4c1-f316-4fc3-8596-f4b96a3a5a0b'),(201,201,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-04 03:57:31','2026-04-04 03:57:31','44c01222-d9a0-488c-a886-ae6db95e734c'),(202,202,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:05:05','2026-04-04 04:05:05','9e6932fe-6bab-43bb-8416-b43320a5f68d'),(206,206,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:05:19','2026-04-04 04:05:19','91ebb588-1731-4c0e-b700-c49eeb0f8b6a'),(207,207,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:05:19','2026-04-04 04:05:19','8921eee0-dece-4b0f-b4d7-c26465356761'),(208,208,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:05:19','2026-04-04 04:05:19','7b2f52ee-156a-4f74-9eb2-16f4a284cf9e'),(209,209,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:05:29','2026-04-04 04:05:29','d189f3ab-c6d0-4e55-bfcf-9d28be04abcc'),(210,210,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:05:29','2026-04-04 04:05:29','d29fdede-a0d8-44e2-a3ba-b815340c715e'),(211,211,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:05:29','2026-04-04 04:05:29','a99f0eb0-d116-48d5-bfc4-c8dd597ab0cd'),(215,215,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:12:27','2026-04-04 04:12:27','c9b061f3-19d0-44a1-ae87-e8afaea667c3'),(216,216,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:12:27','2026-04-04 04:12:27','237a11bb-4940-4d39-9049-2c77bf88920a'),(217,217,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:12:27','2026-04-04 04:12:27','b59bb288-0644-4788-a8a8-1247067fc6c7'),(221,221,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:12:57','2026-04-04 04:12:57','62c68844-8879-4244-a697-5d7ba3edcd2e'),(222,222,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:12:57','2026-04-04 04:12:57','f9270fc6-c181-4adc-81ee-7a496313b831'),(223,223,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:12:57','2026-04-04 04:12:57','165b60c2-8760-4e3f-8bf5-e8041f87ec36'),(229,229,1,NULL,'__temp_oatgqexjbwvdubaytzqxmvxsbnjbzlntisah',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"callToAction\"}',1,'2026-04-04 04:35:26','2026-04-04 04:35:26','29fb6955-9794-4b2d-82df-8f797585e180'),(230,230,1,NULL,NULL,NULL,'{\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\": \"Browse our full range of handmade treats, birthday cakes, and seasonal specials.\", \"28b90100-b662-46d8-b047-acc05be249bd\": \"Ready to Shop?\", \"d9cf0d28-62bf-4618-844e-ca96058c834a\": {\"type\": \"url\", \"label\": \"Shop All Treats\", \"value\": \"#\"}, \"fb8347f5-df64-4639-8907-a7e8845b4e12\": \"Treat your pup\"}',1,'2026-04-04 04:35:26','2026-04-04 04:42:31','be51f35d-c7e6-493a-be20-7489e20212a5'),(231,231,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:35:26','2026-04-04 04:35:26','32ffc013-cfc5-4e93-b9dc-78e607613e5e'),(232,232,1,NULL,'__temp_oatgqexjbwvdubaytzqxmvxsbnjbzlntisah',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"callToAction\"}',1,'2026-04-04 04:35:26','2026-04-04 04:35:26','e9f98852-6c54-47bc-b96c-50018691a925'),(233,233,1,NULL,NULL,NULL,NULL,1,'2026-04-04 04:35:26','2026-04-04 04:35:26','06f18f7d-0a4b-4737-bb13-868914b2149a'),(234,234,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:37:28','2026-04-04 04:37:28','c70027ae-a38e-4ff5-80c4-fa5589f4cd48'),(235,235,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:38:46','2026-04-04 04:38:46','74855b08-9bbf-4ef4-82cb-9fd30c0bbebb'),(236,236,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:38:57','2026-04-04 04:38:57','33281086-d23b-443d-9e5f-d158e0d704b2'),(240,240,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:42:31','2026-04-04 04:42:31','ba0bd132-fdfc-4ba8-aa43-14df0982dff2'),(241,241,1,NULL,'__temp_oatgqexjbwvdubaytzqxmvxsbnjbzlntisah',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"callToAction\"}',1,'2026-04-04 04:42:31','2026-04-04 04:42:31','e854e56a-cf58-43c9-9d45-8404b0950b1e'),(242,242,1,NULL,NULL,NULL,'{\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\": \"Browse our full range of handmade treats, birthday cakes, and seasonal specials.\", \"28b90100-b662-46d8-b047-acc05be249bd\": \"Ready to Shop?\", \"d9cf0d28-62bf-4618-844e-ca96058c834a\": {\"type\": \"url\", \"label\": \"Shop All Treats\", \"value\": \"#\"}, \"fb8347f5-df64-4639-8907-a7e8845b4e12\": \"Treat your pup\"}',1,'2026-04-04 04:42:31','2026-04-04 04:42:31','f142b1c7-f844-43aa-9046-e19fbe5b2688'),(247,247,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 04:12:10','2026-05-09 04:12:10','410bd6e0-55f8-447e-9848-a0288403e6af'),(248,248,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"bronze\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 04:12:10','2026-05-12 03:14:05','16c99b37-3cf5-4c4f-9b95-b3d979faec8e'),(249,249,1,'Bulk Orders','bulk-orders',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [300], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Stocking a shelf, gifting a team, or reselling in your shop? We offer wholesale pricing on bulk treat orders — minimum quantities apply.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Get a Quote\", \"value\": \"#\"}}',1,'2026-05-09 04:12:10','2026-05-09 21:12:32','31daa7f7-ea35-469d-80ae-436c9f6dd313'),(250,250,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:12:10','2026-05-09 04:12:10','ad5dc80f-3356-4c35-89e7-a29a799eb991'),(251,251,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 04:12:10','2026-05-09 04:12:10','9fce553d-907e-401a-a1f2-8df80ace530b'),(252,252,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\'\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 04:12:10','2026-05-09 04:12:10','e191ab73-3c11-4958-9333-9ba3a74b95e2'),(253,253,1,'Bulk Orders','bulk-orders',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Stocking a shelf, gifting a team, or reselling in your shop? We offer wholesale pricing on bulk treat orders — minimum quantities apply.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Get a Quote\", \"value\": \"#\"}}',1,'2026-05-09 04:12:10','2026-05-09 04:12:10','193b7200-20a7-430c-9ac5-21bf5493b564'),(255,255,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:15:49','2026-05-09 04:15:49','96ee5b66-1393-436e-82ea-c241a3f9067e'),(256,256,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:21:29','2026-05-09 04:21:29','451bcd81-6781-4784-8650-437b211414d1'),(260,260,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:21:34','2026-05-09 04:21:34','32d69fc8-ae5f-417a-8a68-719e5c76e705'),(261,261,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 04:21:34','2026-05-09 04:21:34','cd04a745-6108-40da-be6f-4cf723643571'),(262,262,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\'\", \"455dcd47-38c8-454c-8026-c041b84a2fec\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 04:21:34','2026-05-09 04:21:34','6181a317-fd75-47e4-b8a0-3f583f845a23'),(263,263,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:41:58','2026-05-09 04:41:58','637a9859-4c91-4917-a4eb-5459ee44edfb'),(264,264,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 04:41:58','2026-05-09 04:41:58','401e7fb9-80c5-4889-95fa-2860d562b26c'),(265,265,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"455dcd47-38c8-454c-8026-c041b84a2fec\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 04:41:58','2026-05-09 04:41:58','7325def0-5ce1-4736-91ff-c7ef63fb94d9'),(266,266,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:43:15','2026-05-09 04:43:15','0886d79e-c642-4649-9f11-27c0b71dfd9f'),(267,267,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 04:44:05','2026-05-09 04:44:05','fc5c0700-e24b-4a6c-976d-28cb72809da0'),(268,268,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 05:00:56','2026-05-09 05:00:56','378e2b8a-357d-453d-a5a3-91c50bde265c'),(269,269,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 05:01:00','2026-05-09 05:01:00','d0f13be1-52b1-4f44-8603-4049704bb943'),(273,273,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 20:53:01','2026-05-09 20:53:01','42284fe1-fff1-47a4-8d2d-102ae5c0c5e3'),(274,274,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 20:53:01','2026-05-09 20:53:01','8e3f64d9-7ef6-4ba6-9f4f-7a46548015c3'),(275,275,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#b67236\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 20:53:01','2026-05-09 20:53:01','a9d744f5-1b65-4aed-9de5-a5c62235033c'),(279,279,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 20:53:58','2026-05-09 20:53:58','45796f71-b5e1-4dd3-b4f7-7206b6012d5a'),(280,280,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 20:53:58','2026-05-09 20:53:58','87301739-8e77-4170-8fa5-ca52e56cd025'),(281,281,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 20:53:58','2026-05-09 20:53:58','70e4eda6-dde2-4ed8-8623-a8250313f3a6'),(286,286,1,'Custom Branding','custom-branding',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [305], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Your logo, your treat. We create custom-shaped and branded dog treats for businesses, swag bags, and corporate gifting that actually gets eaten.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Start a Project\", \"value\": \"#\"}}',1,'2026-05-09 20:54:59','2026-05-09 21:12:32','29c4098f-18ce-41a3-b5b7-2edf5cd07d66'),(287,287,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 20:54:59','2026-05-09 20:54:59','630fecd9-5a64-4a75-af5e-6d009556021e'),(288,288,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 20:54:59','2026-05-09 20:54:59','41e47764-b8fc-445d-8ea8-4b4989c9490b'),(289,289,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 20:54:59','2026-05-09 20:54:59','03e9444b-12ba-410a-b5fc-868e19e1ffa0'),(290,290,1,'Custom Branding','custom-branding',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Your logo, your treat. We create custom-shaped and branded dog treats for businesses, swag bags, and corporate gifting that actually gets eaten.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Start a Project\", \"value\": \"#\"}}',1,'2026-05-09 20:54:59','2026-05-09 20:54:59','419a0945-f611-420d-b586-1423403f4d90'),(295,295,1,'Events','events',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [306], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Dog-friendly festivals, adoption drives, pop-ups, and more. We bring the baked goods — you bring the dogs. Let\'s make it a party.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Book Us\", \"value\": \"#\"}}',1,'2026-05-09 20:55:54','2026-05-09 21:12:32','8c60425e-700e-4254-bcf6-789a070c2b0b'),(296,296,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 20:55:54','2026-05-09 20:55:54','6b0f0631-4aff-47f3-86b5-3fdd351dd86e'),(297,297,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 20:55:54','2026-05-09 20:55:54','2a3285dc-c320-485a-b5e7-fa054d4e0e52'),(298,298,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 20:55:54','2026-05-09 20:55:54','c07824f7-b8f0-43a2-8635-fbc391202936'),(299,299,1,'Events','events',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Dog-friendly festivals, adoption drives, pop-ups, and more. We bring the baked goods — you bring the dogs. Let\'s make it a party.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Book Us\", \"value\": \"#\"}}',1,'2026-05-09 20:55:54','2026-05-09 20:55:54','8a8c7d5b-b1e8-49ea-8412-8f8d3366486e'),(300,300,1,'Box open',NULL,NULL,NULL,1,'2026-05-09 21:08:23','2026-05-09 21:08:23','631f8514-5f76-4351-98d6-cf3b77e5cc0f'),(305,305,1,'Palette',NULL,NULL,NULL,1,'2026-05-09 21:12:08','2026-05-09 21:12:08','69ad7adb-969e-4911-8a97-a7684bf60543'),(306,306,1,'Calendar',NULL,NULL,NULL,1,'2026-05-09 21:12:13','2026-05-09 21:12:13','ef6dc1ab-8008-460a-9faa-d5666fbec2ee'),(309,309,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','7a27351b-fc8b-4e29-9edf-83f29d7b8c3c'),(310,310,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 21:12:32','2026-05-09 21:12:32','e2ffbfc4-034f-4685-9444-3c2efb612b13'),(311,311,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 21:12:32','2026-05-09 21:12:32','5d7d3f88-2ac2-4a96-9c47-4c311711e457'),(312,312,1,'Bulk Orders','bulk-orders',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [300], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Stocking a shelf, gifting a team, or reselling in your shop? We offer wholesale pricing on bulk treat orders — minimum quantities apply.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Get a Quote\", \"value\": \"#\"}}',1,'2026-05-09 21:12:32','2026-05-09 21:12:32','89e49b9b-37a5-47d8-9877-7e496ad18dd0'),(313,313,1,'Custom Branding','custom-branding',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [305], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Your logo, your treat. We create custom-shaped and branded dog treats for businesses, swag bags, and corporate gifting that actually gets eaten.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Start a Project\", \"value\": \"#\"}}',1,'2026-05-09 21:12:32','2026-05-09 21:12:32','bde4b51d-1d01-4215-bf23-01835c0470ae'),(314,314,1,'Events','events',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [306], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>Dog-friendly festivals, adoption drives, pop-ups, and more. We bring the baked goods — you bring the dogs. Let\'s make it a party.</p>\", \"d453f403-5d29-477c-9328-c1888e77bc6a\": {\"type\": \"url\", \"label\": \"Book Us\", \"value\": \"#\"}}',1,'2026-05-09 21:12:32','2026-05-09 21:12:32','120cbf75-72b7-46d6-bfd9-35b1722e4a0f'),(318,318,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 21:27:20','2026-05-09 21:27:20','22e6b229-d4d1-4522-8666-1d625d46c757'),(319,319,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 21:27:20','2026-05-09 21:27:20','5125cd31-8175-48eb-b0b3-56922fab0844'),(320,320,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#0ed3c8\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 21:27:20','2026-05-09 21:27:20','8cffe5ec-bd42-4a91-962d-918cc109af27'),(324,324,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 21:27:28','2026-05-09 21:27:28','98571d51-8969-4aff-a93d-21999e890b24'),(325,325,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-09 21:27:28','2026-05-09 21:27:28','af10cd89-d900-4de2-b0fe-d1a2f7bc363d'),(326,326,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#b67236\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-09 21:27:28','2026-05-09 21:27:28','1ddc67b3-544d-463b-b0af-9e03d89b7b2a'),(327,327,1,'Home Page','home-page','__home__',NULL,1,'2026-05-09 21:46:39','2026-05-09 21:46:39','7bd83ae5-6b89-4ff1-80e6-d60331732334'),(328,328,1,'About','about','about',NULL,1,'2026-05-09 22:02:23','2026-05-09 22:02:30','b48c994b-ba3d-4c8d-8489-2346406aa065'),(329,329,1,'About','about','about',NULL,1,'2026-05-09 22:02:30','2026-05-09 22:02:30','069bafbc-c293-447f-8bc7-76b7e9e74d44'),(330,330,1,'About','about','about',NULL,1,'2026-05-09 22:10:25','2026-05-09 22:10:25','c07cff78-d214-47f6-90c7-4d6de21a4f55'),(331,331,1,'About','about','about',NULL,1,'2026-05-12 00:31:51','2026-05-12 00:31:51','1b67a099-9cfe-4e01-9caf-45755730fcf4'),(333,333,1,'About','about','about',NULL,1,'2026-05-12 00:44:49','2026-05-12 00:44:49','44c31238-42ff-456a-95ba-2bf2e1e6c8d5'),(334,334,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','17309499-9c31-40ae-a617-e8e44fab44e8'),(335,335,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 00:45:28','2026-05-12 00:45:28','55ab7ad5-dc1b-45c6-b412-240e678a961d'),(336,336,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','cd4090de-4d8e-4e54-843c-c7fee95f14e9'),(337,337,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','5655449c-4043-485f-9d17-f1d653880055'),(338,338,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','e3c2eb29-a199-42e6-bfae-a148f3ab7d93'),(339,339,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 00:45:28','2026-05-12 00:45:28','356694ca-0e00-46de-81bb-c2224a38c603'),(340,340,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','879dc6af-2109-479f-9f78-8ac645183aa0'),(341,341,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','cdd763cd-9a2d-4188-9684-185110ffd1e5'),(342,342,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','80f2b348-7586-4a41-a9be-a0e168f45357'),(343,343,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','48d5e9ef-1cd9-4f77-af64-5be9b8507251'),(344,344,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','78f74641-0b3a-4465-8ae3-313a63a0a3c6'),(345,345,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','4ef55f0e-e78d-4248-a854-bcddba6a15d9'),(346,346,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','7ad72178-ca92-4e1c-8db7-2774a47eacee'),(347,347,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','5a06cc95-1b65-4a11-9322-2948ce31d282'),(348,348,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','6e2a31eb-c45e-44d2-8038-917494a985db'),(349,349,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','40e42c4d-ed05-4bde-863d-7fd1e1609cba'),(350,350,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','9707d304-91ed-4e96-b332-cfa3e18f2594'),(351,351,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','9202a6be-24fe-412f-a459-980a971ecafc'),(352,352,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 00:45:28','2026-05-12 00:45:28','39c93de7-df91-435e-8500-11efab6a276d'),(353,353,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','d4c9fe3a-18b7-4afc-9d2c-aa9739128249'),(354,354,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','cebb8445-f322-4444-9afa-e78d42597bbd'),(355,355,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','131942f0-dcd6-49d5-a7cd-7fb3d92a1bdc'),(356,356,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 00:45:28','2026-05-12 00:45:28','4d88b39e-b1af-4ef1-8767-b8a351840afb'),(357,357,1,NULL,NULL,NULL,NULL,1,'2026-05-12 00:45:28','2026-05-12 00:45:28','f35bf555-5f87-46b0-b016-b16d636533b1'),(364,364,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','bd551fff-ffc8-438b-919b-a294ac2fbcc1'),(365,365,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"charcoal\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promise\"}',1,'2026-05-12 00:49:30','2026-05-12 03:17:01','74a3bd41-4290-4eb5-8d97-9cfbc3856ed3'),(366,366,1,'Real Ingredients','real-ingredients',NULL,'{\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\": [], \"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>No Fillers, No artificial preservatives, no funny stuff. Every Ingredients is dog-safe and sourced with care.</p>\"}',1,'2026-05-12 00:49:30','2026-05-12 00:50:07','f187e750-bc56-4de7-a1e3-210d465ba507'),(367,367,1,'Small Batch Always','small-batch-always',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>We bake in small batches so every treat is fresh. We\'d rather sell out than compromise on quality.</p>\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','0d75e184-97fc-479b-8760-676c04d18b72'),(368,368,1,'made with love','made-with-love',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>we genuinely love dogs.Every treat is made like we\'re baking for Charlie himself — because, honestly, we still are.</p>\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','6f160210-3463-4005-bc19-387c2fb799ae'),(369,369,1,'About','about','about',NULL,1,'2026-05-12 00:49:30','2026-05-12 00:49:30','19d73f00-ba3c-4d03-824b-883e6c661e57'),(370,370,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','e195ff1a-acb1-4f23-acbc-51eaa5475517'),(371,371,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promis\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','741f040a-20a7-4644-8505-a56154422286'),(372,372,1,'Real Ingredients','real-ingredients',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>No Fillers, No artificial preservatives, no funny stuff. Every Ingredients is dog-safe and sourced with care.</p>\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','838ce9d5-87e7-4920-8d9f-8833a7b571a8'),(373,373,1,'Small Batch Always','small-batch-always',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>We bake in small batches so every treat is fresh. We\'d rather sell out than compromise on quality.</p>\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','810d6060-df7e-4a4a-b333-4730ef84db5b'),(374,374,1,'made with love','made-with-love',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>we genuinely love dogs.Every treat is made like we\'re baking for Charlie himself — because, honestly, we still are.</p>\"}',1,'2026-05-12 00:49:30','2026-05-12 00:49:30','8a72352e-703a-43d9-8832-ba14832e616a'),(378,378,1,'About','about','about',NULL,1,'2026-05-12 00:49:33','2026-05-12 00:49:33','1dadd79a-985c-4c32-8e29-538147bb4b5f'),(379,379,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 00:49:33','2026-05-12 00:49:33','6689083c-04ba-4d79-9b12-a1db1a7e368b'),(380,380,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promis\"}',1,'2026-05-12 00:49:33','2026-05-12 00:49:33','83b897e6-9065-4c80-86c8-6f108e93d5c9'),(381,381,1,'About','about','about',NULL,1,'2026-05-12 00:49:59','2026-05-12 00:49:59','e0c2e6a3-cda6-4e11-9a4b-55a6e24adb25'),(382,382,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 00:49:59','2026-05-12 00:49:59','53635f24-fefd-4a4a-b31c-383af46d1522'),(383,383,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promise\"}',1,'2026-05-12 00:49:59','2026-05-12 00:49:59','afc05fe2-a76f-411d-9766-c4d3d8feaeeb'),(388,388,1,'About','about','about',NULL,1,'2026-05-12 00:50:07','2026-05-12 00:50:07','5630c89d-b703-4f8b-9b1f-9cc1b5f79155'),(389,389,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 00:50:07','2026-05-12 00:50:07','ed5c385f-d99a-4574-b466-d0e19626740a'),(390,390,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promise\"}',1,'2026-05-12 00:50:07','2026-05-12 00:50:07','dd02d2c5-e754-4a11-ade7-83c3f5dfd2ce'),(391,391,1,'Real Ingredients','real-ingredients',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>No Fillers, No artificial preservatives, no funny stuff. Every Ingredients is dog-safe and sourced with care.</p>\"}',1,'2026-05-12 00:50:07','2026-05-12 00:50:07','f23d2e55-9004-42b4-b774-db9cbab79e42'),(396,396,1,'About','about','about',NULL,1,'2026-05-12 01:24:16','2026-05-12 01:24:16','17607b16-1d65-429d-92ff-203b4d93164e'),(397,397,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 01:24:16','2026-05-12 01:24:16','3ce71280-95fa-4f59-bc83-a367abeed825'),(398,398,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"#29323d\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promise\"}',1,'2026-05-12 01:24:16','2026-05-12 01:24:16','d1943a71-ad30-4537-99ba-56bd38e2ae0f'),(399,399,1,'Real Ingredients','real-ingredients',NULL,'{\"4a92b64a-46cf-4608-a131-af258f11ddf0\": \"<p>No Fillers, No artificial preservatives, no funny stuff. Every Ingredients is dog-safe and sourced with care.</p>\"}',1,'2026-05-12 01:24:16','2026-05-12 01:24:16','91671026-8eee-4d97-9ab7-bd2cc3235535'),(403,403,1,NULL,'__temp_sxmjrksscvasfrlhdtkuzuhukvpiiskixgxy',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 01:25:13','2026-05-12 01:25:13','d834808a-e570-4772-843c-5721c03caa31'),(404,404,1,NULL,NULL,NULL,'{\"0b92e79b-252c-4fdd-9467-b23f1b66911f\": [], \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Where it All began\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>It started the way most great things do — with a dog who deserved better. Charlie, our golden-hearted namesake, was the inspiration behind every recipe we\'ve ever made. We wanted to give him treats we could actually feel good about, made from ingredients we recognized.</p><p> </p><p>What began as weekend baking sessions turned into something bigger than we ever expected. Friends asked, neighbors asked, and eventually strangers at the farmers market asked. So we kept baking.<br /> </p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"b1fc4697-c4a0-457e-be69-38665a393900\": \"white\", \"f075b188-d366-4033-b4ba-472195410663\": \"One Dog. One Kitchen. A Whole Lot of Peanut Butter.\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 01:25:13','2026-05-12 03:12:58','d366016a-2aa4-4e3b-a33e-aef3092ad95e'),(405,405,1,'About','about','about',NULL,1,'2026-05-12 01:25:13','2026-05-12 01:25:13','f5b307fc-9cc4-4dab-80a8-4f4067d57590'),(406,406,1,NULL,'__temp_sxmjrksscvasfrlhdtkuzuhukvpiiskixgxy',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 01:25:14','2026-05-12 01:25:14','f0c0cb10-7e47-4f6a-bc93-23d2203a7d78'),(407,407,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Where it All began\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"One Dog. One Kitchen. A Whole Lot of Peanut Butter.\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 01:25:14','2026-05-12 01:25:14','20df4bc5-1213-423d-bddf-6a2ec1fcfdbe'),(411,411,1,'About','about','about',NULL,1,'2026-05-12 01:25:47','2026-05-12 01:25:47','7ee54812-6e17-49ea-a102-c4c003c21d31'),(412,412,1,NULL,'__temp_sxmjrksscvasfrlhdtkuzuhukvpiiskixgxy',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 01:25:48','2026-05-12 01:25:48','c9e06b91-0c7c-42a5-aae1-cececdfea36e'),(413,413,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Where it All began\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>It started the way most great things do — with a dog who deserved better. Charlie, our golden-hearted namesake, was the inspiration behind every recipe we\'ve ever made. We wanted to give him treats we could actually feel good about, made from ingredients we recognized.</p><p>What began as weekend baking sessions turned into something bigger than we ever expected. Friends asked, neighbors asked, and eventually strangers at the farmers market asked. So we kept baking.<br /> </p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"One Dog. One Kitchen. A Whole Lot of Peanut Butter.\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 01:25:48','2026-05-12 01:25:48','e97efe32-8462-4113-abd4-68c171ae9bcb'),(414,414,1,'About','about','about',NULL,1,'2026-05-12 01:25:56','2026-05-12 01:25:56','65ed1e54-c306-427e-825e-4086a1cc8c7a'),(416,416,1,'About','about','about',NULL,1,'2026-05-12 01:26:21','2026-05-12 01:26:21','3bde3bfc-4b0c-40ed-bffa-8ee81a27a86d'),(422,422,1,NULL,'__temp_nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 02:51:37','2026-05-12 02:51:37','a8d7a4d0-1e1b-4852-85c5-e33d43eac0b0'),(423,423,1,NULL,NULL,NULL,'{\"0b92e79b-252c-4fdd-9467-b23f1b66911f\": [], \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Rooted in the Community\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlotte\'s dog community is something special. From the greenways to the dog parks to the weekend markets — this city loves its pups, and we love this city right back.</p><p>You can find us at local farmers markets, dog-friendly events, and through consignment partners across the Charlotte Metro Area. We also still ship to our loyal friends up in Massachusetts.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"b1fc4697-c4a0-457e-be69-38665a393900\": \"bronze\", \"f075b188-d366-4033-b4ba-472195410663\": \"Proud to call Charlotte Home\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 02:51:37','2026-05-12 03:12:58','df1a25eb-efea-4d97-8ef5-dcd555071062'),(424,424,1,'About','about','about',NULL,1,'2026-05-12 02:51:37','2026-05-12 02:51:37','e8a7a8fd-bcf8-4de9-8283-abd19b0f057a'),(425,425,1,NULL,'__temp_sxmjrksscvasfrlhdtkuzuhukvpiiskixgxy',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 02:51:37','2026-05-12 02:51:37','606d4554-4809-4055-8c7a-a70c99b7182f'),(426,426,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Where it All began\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>It started the way most great things do — with a dog who deserved better. Charlie, our golden-hearted namesake, was the inspiration behind every recipe we\'ve ever made. We wanted to give him treats we could actually feel good about, made from ingredients we recognized.</p><p> </p><p>What began as weekend baking sessions turned into something bigger than we ever expected. Friends asked, neighbors asked, and eventually strangers at the farmers market asked. So we kept baking.<br /> </p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"One Dog. One Kitchen. A Whole Lot of Peanut Butter.\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 02:51:37','2026-05-12 02:51:37','3a111a88-804e-434d-9450-5458abb2334d'),(427,427,1,NULL,'__temp_nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 02:51:38','2026-05-12 02:51:38','da07c4d1-8797-4033-a93b-0bf3eb06ab9c'),(428,428,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 02:51:38','2026-05-12 02:51:38','828c2559-8d04-4741-ada8-3802a5686bb8'),(432,432,1,'About','about','about',NULL,1,'2026-05-12 02:52:06','2026-05-12 02:52:06','f7586d2d-d084-486e-8564-a36521da76f3'),(433,433,1,NULL,'__temp_nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 02:52:06','2026-05-12 02:52:06','fd246bda-347a-4d93-976c-9116c24866dd'),(434,434,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Rooted in the Community\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"Proud to call Charlotte Home\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 02:52:06','2026-05-12 02:52:06','5ba0c5dc-40d5-4678-be2f-4ecb63ee1793'),(438,438,1,'About','about','about',NULL,1,'2026-05-12 02:52:39','2026-05-12 02:52:39','70211f87-b1ec-4d76-9a6c-e4f3f304bbc3'),(439,439,1,NULL,'__temp_nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 02:52:39','2026-05-12 02:52:39','596a74e2-6419-4ef5-9f75-e2e9dfe08ab9'),(440,440,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Rooted in the Community\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlotte\'s dog community is something special. From the greenways to the dog parks to the weekend markets — this city loves its pups, and we love this city right back.</p><p>You can find us at local farmers markets, dog-friendly events, and through consignment partners across the Charlotte Metro Area. We also still ship to our loyal friends up in Massachusetts.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"Proud to call Charlotte Home\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 02:52:39','2026-05-12 02:52:39','67d86efc-99db-4918-9be8-3b45560a68b9'),(444,444,1,'About','about','about',NULL,1,'2026-05-12 02:53:09','2026-05-12 02:53:09','a5603f41-6fbf-4223-9537-0c22d3dda02e'),(445,445,1,NULL,'__temp_nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 02:53:09','2026-05-12 02:53:09','452fb29f-2ff5-426f-8a01-03e853badb2f'),(446,446,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Rooted in the Community\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlotte\'s dog community is something special. From the greenways to the dog parks to the weekend markets — this city loves its pups, and we love this city right back.</p><p>You can find us at local farmers markets, dog-friendly events, and through consignment partners across the Charlotte Metro Area. We also still ship to our loyal friends up in Massachusetts.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"Proud to call Charlotte Home\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 02:53:09','2026-05-12 02:53:09','57ea3d15-2bd5-4b6f-8433-0bf7560c6092'),(454,454,1,'About','about','about',NULL,1,'2026-05-12 03:12:58','2026-05-12 03:12:58','ff128803-76ff-4222-8e95-7bae0ee36e14'),(455,455,1,NULL,'__temp_sxmjrksscvasfrlhdtkuzuhukvpiiskixgxy',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 03:12:58','2026-05-12 03:12:58','4898e316-8594-46de-816f-73c98fa23ff0'),(456,456,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Where it All began\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>It started the way most great things do — with a dog who deserved better. Charlie, our golden-hearted namesake, was the inspiration behind every recipe we\'ve ever made. We wanted to give him treats we could actually feel good about, made from ingredients we recognized.</p><p> </p><p>What began as weekend baking sessions turned into something bigger than we ever expected. Friends asked, neighbors asked, and eventually strangers at the farmers market asked. So we kept baking.<br /> </p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"b1fc4697-c4a0-457e-be69-38665a393900\": \"white\", \"f075b188-d366-4033-b4ba-472195410663\": \"One Dog. One Kitchen. A Whole Lot of Peanut Butter.\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 03:12:58','2026-05-12 03:12:58','d8e90710-452e-4a98-9f08-0fb3dc34d60c'),(457,457,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 03:12:58','2026-05-12 03:12:58','dde0c7ff-f862-4f83-8db7-439659d9ac01'),(458,458,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"white\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promise\"}',1,'2026-05-12 03:12:58','2026-05-12 03:12:58','dea09c94-e481-4685-af5c-a3252d057b70'),(459,459,1,NULL,'__temp_nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 03:12:58','2026-05-12 03:12:58','c50cc95f-7a2b-4e81-977a-1e084de4af51'),(460,460,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Rooted in the Community\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlotte\'s dog community is something special. From the greenways to the dog parks to the weekend markets — this city loves its pups, and we love this city right back.</p><p>You can find us at local farmers markets, dog-friendly events, and through consignment partners across the Charlotte Metro Area. We also still ship to our loyal friends up in Massachusetts.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"b1fc4697-c4a0-457e-be69-38665a393900\": \"bronze\", \"f075b188-d366-4033-b4ba-472195410663\": \"Proud to call Charlotte Home\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 03:12:58','2026-05-12 03:12:58','d211a15b-491d-4d0a-9e96-4f89c08d9647'),(468,468,1,'Home Page','home-page','__home__',NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','97493759-ffc2-4caf-a2bb-aebd558cb05b'),(469,469,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','464bd117-cf32-4a8f-ae43-82266c3e28fd'),(470,470,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','41aa64af-9291-4895-93c3-d2ad275bf780'),(471,471,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','c0668d61-1d88-4dac-86eb-df22684f818c'),(472,472,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"b1fc4697-c4a0-457e-be69-38665a393900\": \"charcoal\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','0bec2dd1-d8ce-47f3-bbd9-38c062381d4b'),(473,473,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','0e4e0d0e-565a-4e63-b147-7e0994877065'),(474,474,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','9c38c1b3-46e8-482e-ac0e-4fbf5f4708f4'),(475,475,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','b3dac61b-37c8-4f3d-b11f-f6cdf80f643b'),(476,476,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','c640b32d-0d50-476b-9044-8b2c0564f618'),(477,477,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','7d72a5e3-54f5-4cb3-9e0f-1ce3d13fab88'),(478,478,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"b1fc4697-c4a0-457e-be69-38665a393900\": \"white\", \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','d9f479dd-692f-47fe-bd27-822a1fe2b311'),(479,479,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','4e92b61a-d6c7-456b-9e5e-2fe9c6e79cfb'),(480,480,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','928e81b0-9815-42d7-8068-f805115b59ac'),(481,481,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','4c77e5cf-a241-400b-b778-b54795aef0a0'),(482,482,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','1b312f09-6d59-45e8-b97b-595a6eb18592'),(483,483,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','48043302-5324-4ea5-8fe6-9bef77e756b0'),(484,484,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','c79d938d-1eec-4070-8b7b-57064624cc24'),(485,485,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:13:37','2026-05-12 03:13:37','d3f56038-71a2-45c5-be46-df9b2f845026'),(486,486,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"white\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-12 03:13:37','2026-05-12 03:13:37','b9671a4c-b221-4d08-af8a-d1975e170ba6'),(490,490,1,'Home Page','home-page','__home__',NULL,1,'2026-05-12 03:14:05','2026-05-12 03:14:05','15b18f84-f3d0-41c5-80eb-50bfc0ee3530'),(491,491,1,NULL,'__temp_elbvgitvquqfhaaxemlchtkqwkenfzvdioty',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 03:14:05','2026-05-12 03:14:05','9f11e91d-5128-4bd9-b883-6cdf54e4f0f7'),(492,492,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"For dog-friendly businesses\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"bronze\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"We Work with Businesses Too\", \"eabf45a4-573f-4a0d-97de-29c9efa0728e\": \"From pet boutiques to corporate gifting — if your brand loves dogs, we\'ve got you covered.\"}',1,'2026-05-12 03:14:05','2026-05-12 03:14:05','1eff27f3-170b-416f-8bcd-14f621ac9e17'),(493,493,1,'About','about','about',NULL,1,'2026-05-12 03:14:32','2026-05-12 03:14:32','34ca430c-619a-4688-9848-6aefc2c0e801'),(497,497,1,'About','about','about',NULL,1,'2026-05-12 03:17:01','2026-05-12 03:17:01','9645a702-b2f6-4443-87f4-3c229e0d1ec2'),(498,498,1,NULL,'__temp_bxahghshhxlymueuoxztjmsexptewuputdlr',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"cardGrid\"}',1,'2026-05-12 03:17:01','2026-05-12 03:17:01','9f62c868-d5d7-4106-9b75-007c52e67e65'),(499,499,1,NULL,NULL,NULL,'{\"33406d90-7e53-4c8f-9975-2dde40f485bf\": \"What we stand for\", \"6b64b506-24d4-4971-88d7-d868e9d9714b\": \"charcoal\", \"7158299d-b9a4-4991-84f0-b575c0883bf5\": \"The Charlie\'s Promise\"}',1,'2026-05-12 03:17:01','2026-05-12 03:17:01','fecc727b-68e7-4c96-8780-3368fddf6718'),(503,503,1,NULL,'__temp_pzhaqzcsvzfvwtjuuezxvpccfbviiitqtmmv',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"timeline\"}',1,'2026-05-12 03:40:03','2026-05-12 03:40:03','4001ac19-332d-420b-9b09-d6f8588eca23'),(504,504,1,NULL,NULL,NULL,'{\"09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c\": \"How we got here\", \"e802b542-1048-4c16-99ea-5e3da1e5c867\": \"The Journey\"}',1,'2026-05-12 03:40:03','2026-05-12 03:41:19','55af8b77-d693-4bb7-9eb7-e4b974e78300'),(505,505,1,'About','about','about',NULL,1,'2026-05-12 03:40:03','2026-05-12 03:40:03','3700d89f-ab81-4fc7-a07d-b16c9a87159c'),(506,506,1,NULL,'__temp_pzhaqzcsvzfvwtjuuezxvpccfbviiitqtmmv',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"timeline\"}',1,'2026-05-12 03:40:03','2026-05-12 03:40:03','d4f6f6b1-a6da-4bd2-b16c-cc674a8a235f'),(507,507,1,NULL,NULL,NULL,NULL,1,'2026-05-12 03:40:03','2026-05-12 03:40:03','12614ca9-d2e2-4236-888f-77803afc7d36'),(511,511,1,'About','about','about',NULL,1,'2026-05-12 03:41:19','2026-05-12 03:41:19','c1a4c349-4572-4b77-a0f9-c747574f056c'),(512,512,1,NULL,'__temp_pzhaqzcsvzfvwtjuuezxvpccfbviiitqtmmv',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"timeline\"}',1,'2026-05-12 03:41:19','2026-05-12 03:41:19','ac238768-fdab-4459-892a-d67e88728fb9'),(513,513,1,NULL,NULL,NULL,'{\"09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c\": \"How we got here\", \"e802b542-1048-4c16-99ea-5e3da1e5c867\": \"The Journey\"}',1,'2026-05-12 03:41:19','2026-05-12 03:41:19','ea29a7e6-e014-47f9-8247-4bcf43609a6a'),(522,522,1,'2019','2019',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Baked our first dog treats in a home kitchen in Boston, MA for Charlie and a few lucky neighbors.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"The First Batch\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','21b33f9e-0baf-4fe2-98d9-1e51607ade3f'),(523,523,1,'2021','2021',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Set up our first market table and sold out in two hours. The line was mostly dogs.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Farmers Market Debut\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','804df23e-cc29-4d30-b879-fe494a9ee16c'),(524,524,1,'2022','2022',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Opened a small storefront in Boston — a dream come true. The city welcomed us with open paws.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Brick & Mortar\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','0380ada0-aca9-4c73-93c2-752c0f35c9a3'),(525,525,1,'2024','2024',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"We relocated to the Charlotte Metro Area, NC, bringing our recipes with us and falling in love with a new city of dog lovers.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Charlotte Bound\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','f0bb2324-8cf2-4212-893f-1ad2f92daa53'),(526,526,1,'Now','now',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Online store, farmers markets, events, consignment partners — and we\'re just getting started.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Bigger Than Ever\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','17d2e7f6-9543-4798-befb-25ad127fbfba'),(527,527,1,'About','about','about',NULL,1,'2026-05-12 03:43:36','2026-05-12 03:43:36','73dd07e0-b5fd-4c9a-8e93-2906069cc24b'),(528,528,1,NULL,'__temp_pzhaqzcsvzfvwtjuuezxvpccfbviiitqtmmv',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"timeline\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','20add06d-4182-4de6-bd9a-b1e8f5229d95'),(529,529,1,NULL,NULL,NULL,'{\"09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c\": \"How we got here\", \"e802b542-1048-4c16-99ea-5e3da1e5c867\": \"The Journey\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','3f0bff44-33ad-4358-844a-543e4fcec87d'),(530,530,1,'2019','2019',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Baked our first dog treats in a home kitchen in Boston, MA for Charlie and a few lucky neighbors.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"The First Batch\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','445534e5-8e6c-4890-8ab0-73b622e9c8e1'),(531,531,1,'2021','2021',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Set up our first market table and sold out in two hours. The line was mostly dogs.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Farmers Market Debut\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','1baf6f97-175d-4ec1-99be-17b1c27efb43'),(532,532,1,'2022','2022',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Opened a small storefront in Boston — a dream come true. The city welcomed us with open paws.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Brick & Mortar\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','9a2c056f-13de-419f-a4eb-c0e1a518f9d6'),(533,533,1,'2024','2024',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"We relocated to the Charlotte Metro Area, NC, bringing our recipes with us and falling in love with a new city of dog lovers.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Charlotte Bound\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','c552ec98-ba47-4f27-ab95-2eaed92c5b05'),(534,534,1,'Now','now',NULL,'{\"0b783164-c4fd-4198-8743-2cc921953e69\": \"Online store, farmers markets, events, consignment partners — and we\'re just getting started.\", \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\": \"Bigger Than Ever\"}',1,'2026-05-12 03:43:36','2026-05-12 03:43:36','cfee56ab-6a45-4b1e-b95c-0e072f7c422a'),(538,538,1,NULL,'__temp_vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"subscribe\"}',1,'2026-05-13 14:44:30','2026-05-13 14:44:30','376d2849-ebbe-4eb0-ba72-d441ac5510a9'),(539,539,1,NULL,NULL,NULL,'{\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\": [544], \"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\": \"teal\", \"bf1ba574-e8c7-4fac-87ac-e22929847953\": \"New treats, market dates, seasonal specials, and the occasional photo of Charlie himself — straight to your inbox. No spam. Just good stuff.\", \"d1347db1-911d-4bca-a089-d27833338262\": \"Be the First to Know When the Oven\'s On\", \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\": \"Join the pack\"}',1,'2026-05-13 14:44:30','2026-05-13 17:39:03','90a4f3fa-60bf-41bd-b860-e4b8cfab4d9a'),(540,540,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 14:44:30','2026-05-13 14:44:30','3c5d9020-09e1-4913-b766-60f73c72a74a'),(541,541,1,NULL,'__temp_vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"subscribe\"}',1,'2026-05-13 14:44:30','2026-05-13 14:44:30','15ade7ab-5ee1-43c5-8b2c-a95f3c13d0e3'),(542,542,1,NULL,NULL,NULL,'{\"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\": \"white\", \"bf1ba574-e8c7-4fac-87ac-e22929847953\": \"New treats, market dates, seasonal specials, and the occasional photo of Charlie himself — straight to your inbox. No spam. Just good stuff.\", \"d1347db1-911d-4bca-a089-d27833338262\": \"Be the First to Know When the Oven\'s On\", \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\": \"Join the pack\"}',1,'2026-05-13 14:44:30','2026-05-13 14:44:30','fd42d981-a0ee-49fb-b46c-c4ec38060b7f'),(543,543,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 14:45:02','2026-05-13 14:45:02','e47f6dcd-4f49-41e6-994e-eda8c8f53b67'),(544,544,1,'Subscribe',NULL,NULL,NULL,1,'2026-05-13 14:45:16','2026-05-13 14:45:16','7efae95d-16cd-4bf3-bc26-b41561fc125d'),(548,548,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 14:58:25','2026-05-13 14:58:25','a6084db5-fea6-44bf-bfe6-fa0818811a5c'),(549,549,1,NULL,'__temp_vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"subscribe\"}',1,'2026-05-13 14:58:25','2026-05-13 14:58:25','971ef980-6251-479a-84fb-541fdd050f81'),(550,550,1,NULL,NULL,NULL,'{\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\": [544], \"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\": \"white\", \"bf1ba574-e8c7-4fac-87ac-e22929847953\": \"New treats, market dates, seasonal specials, and the occasional photo of Charlie himself — straight to your inbox. No spam. Just good stuff.\", \"d1347db1-911d-4bca-a089-d27833338262\": \"Be the First to Know When the Oven\'s On\", \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\": \"Join the pack\"}',1,'2026-05-13 14:58:25','2026-05-13 14:58:25','ee935032-1993-40bb-9870-93fe701687f9'),(551,551,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 15:05:25','2026-05-13 15:05:25','88db1e89-464e-423a-a245-a50a6bb4996e'),(552,552,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 15:18:35','2026-05-13 15:18:35','0f057ffc-a509-4208-b7b4-8beba4885979'),(553,553,1,NULL,'__temp_vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"subscribe\"}',1,'2026-05-13 15:18:35','2026-05-13 15:18:35','8f714273-ac0c-41c2-be80-4ae165e4a154'),(554,554,1,NULL,NULL,NULL,'{\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\": [544], \"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\": \"teal\", \"bf1ba574-e8c7-4fac-87ac-e22929847953\": \"New treats, market dates, seasonal specials, and the occasional photo of Charlie himself — straight to your inbox. No spam. Just good stuff.\", \"d1347db1-911d-4bca-a089-d27833338262\": \"Be the First to Know When the Oven\'s On\", \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\": \"Join the pack\"}',1,'2026-05-13 15:18:35','2026-05-13 15:18:35','1383fd54-670d-47f4-bf0d-df90fd6f6327'),(555,555,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 15:21:56','2026-05-13 15:21:56','c93a3355-b32c-4f57-8def-24f2d13200e0'),(559,559,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 16:08:59','2026-05-13 16:08:59','c464b8fc-0c4f-4dae-a7c8-c447f6a01016'),(560,560,1,NULL,'__temp_vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"subscribe\"}',1,'2026-05-13 16:08:59','2026-05-13 16:08:59','391fd202-d276-4d78-aecc-055890d98dc1'),(561,561,1,NULL,NULL,NULL,'{\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\": [544], \"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\": \"charcoal\", \"bf1ba574-e8c7-4fac-87ac-e22929847953\": \"New treats, market dates, seasonal specials, and the occasional photo of Charlie himself — straight to your inbox. No spam. Just good stuff.\", \"d1347db1-911d-4bca-a089-d27833338262\": \"Be the First to Know When the Oven\'s On\", \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\": \"Join the pack\"}',1,'2026-05-13 16:08:59','2026-05-13 16:08:59','e79e4825-1e54-4358-be51-e3327439edb5'),(562,562,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 16:11:02','2026-05-13 16:11:02','766870f0-27ce-44a7-8efb-3de8a95b8631'),(566,566,1,'Home Page','home-page','__home__',NULL,1,'2026-05-13 17:39:03','2026-05-13 17:39:03','9131d699-a346-4d3d-b923-6f6b7a56670a'),(567,567,1,NULL,'__temp_vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"subscribe\"}',1,'2026-05-13 17:39:03','2026-05-13 17:39:03','df6eba12-17a1-4f4c-820e-9e8fea3a8d3e'),(568,568,1,NULL,NULL,NULL,'{\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\": [544], \"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\": \"teal\", \"bf1ba574-e8c7-4fac-87ac-e22929847953\": \"New treats, market dates, seasonal specials, and the occasional photo of Charlie himself — straight to your inbox. No spam. Just good stuff.\", \"d1347db1-911d-4bca-a089-d27833338262\": \"Be the First to Know When the Oven\'s On\", \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\": \"Join the pack\"}',1,'2026-05-13 17:39:03','2026-05-13 17:39:03','d43b1507-a049-45ca-a63f-9305769fe406');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 13:57:24','2026-03-25 14:42:33'),(28,NULL,NULL,3,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(37,NULL,NULL,152,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:36:14','2026-05-13 17:39:04'),(42,NULL,NULL,3,5,3,'2026-03-28 03:09:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(44,NULL,NULL,152,5,3,'2026-03-28 03:09:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-05-13 17:39:04'),(52,NULL,NULL,3,5,3,'2026-03-28 22:17:00',NULL,'live',0,0,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(57,NULL,NULL,3,5,3,'2026-03-28 22:19:00',NULL,'live',0,0,'2026-03-28 22:19:12','2026-03-28 22:19:12'),(64,NULL,NULL,3,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-03-28 23:21:47','2026-03-28 23:21:47'),(139,NULL,NULL,152,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:34','2026-05-13 17:39:04'),(144,NULL,NULL,3,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:52','2026-04-03 18:02:52'),(152,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:03:55','2026-04-03 18:03:55'),(153,NULL,NULL,152,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:03:55','2026-04-03 18:03:55'),(158,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:05:30','2026-04-03 18:05:30'),(159,NULL,NULL,158,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:05:30','2026-04-03 18:05:30'),(161,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:16:26','2026-04-03 18:16:26'),(162,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:17:16','2026-04-03 18:17:16'),(164,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:36:41','2026-04-03 18:36:41'),(168,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:18','2026-04-03 18:37:18'),(169,NULL,NULL,168,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:18','2026-04-03 18:37:18'),(174,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:45','2026-04-03 18:37:45'),(175,NULL,NULL,174,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:45','2026-04-03 18:37:45'),(177,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:38:57','2026-04-03 18:38:57'),(181,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:42:57','2026-04-03 18:42:57'),(182,NULL,NULL,181,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:42:57','2026-04-03 18:42:57'),(187,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:08','2026-04-03 18:44:08'),(188,NULL,NULL,187,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:08','2026-04-03 18:44:08'),(193,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:29','2026-04-03 18:44:29'),(194,NULL,NULL,193,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:29','2026-04-03 18:44:29'),(199,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 03:57:31','2026-04-04 03:57:31'),(200,NULL,NULL,199,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-04 03:57:31','2026-04-04 03:57:31'),(202,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:05','2026-04-04 04:05:05'),(206,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:19','2026-04-04 04:05:19'),(207,NULL,NULL,206,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:19','2026-04-04 04:05:19'),(209,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:29','2026-04-04 04:05:29'),(210,NULL,NULL,209,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:29','2026-04-04 04:05:29'),(215,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:27','2026-04-04 04:12:27'),(216,NULL,NULL,215,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:27','2026-04-04 04:12:27'),(221,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:57','2026-04-04 04:12:57'),(222,NULL,NULL,221,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:57','2026-04-04 04:12:57'),(229,NULL,NULL,3,5,3,'2026-04-04 04:35:00',NULL,'live',NULL,NULL,'2026-04-04 04:35:26','2026-04-04 04:35:26'),(231,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:35:26','2026-04-04 04:35:26'),(232,NULL,NULL,231,5,3,'2026-04-04 04:35:00',NULL,'live',NULL,NULL,'2026-04-04 04:35:26','2026-04-04 04:35:26'),(234,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:37:28','2026-04-04 04:37:28'),(235,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:38:46','2026-04-04 04:38:46'),(236,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:38:57','2026-04-04 04:38:57'),(240,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:42:31','2026-04-04 04:42:31'),(241,NULL,NULL,240,5,3,'2026-04-04 04:35:00',NULL,'live',NULL,NULL,'2026-04-04 04:42:31','2026-04-04 04:42:31'),(247,NULL,NULL,3,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 04:12:10','2026-05-09 04:12:10'),(249,NULL,NULL,248,21,4,'2026-05-09 04:12:00',NULL,'live',NULL,NULL,'2026-05-09 04:12:10','2026-05-09 04:12:10'),(250,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:12:10','2026-05-09 04:12:10'),(251,NULL,NULL,250,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 04:12:10','2026-05-09 04:12:10'),(253,NULL,NULL,252,21,4,'2026-05-09 04:12:00',NULL,'live',NULL,NULL,'2026-05-09 04:12:10','2026-05-09 04:12:10'),(255,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:15:49','2026-05-09 04:15:49'),(256,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:21:29','2026-05-09 04:21:29'),(260,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:21:34','2026-05-09 04:21:34'),(261,NULL,NULL,260,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 04:21:34','2026-05-09 04:21:34'),(263,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:41:58','2026-05-09 04:41:58'),(264,NULL,NULL,263,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 04:41:58','2026-05-09 04:41:58'),(266,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:43:15','2026-05-09 04:43:15'),(267,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 04:44:05','2026-05-09 04:44:05'),(268,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 05:00:56','2026-05-09 05:00:56'),(269,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 05:01:00','2026-05-09 05:01:00'),(273,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 20:53:01','2026-05-09 20:53:01'),(274,NULL,NULL,273,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 20:53:01','2026-05-09 20:53:01'),(279,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 20:53:58','2026-05-09 20:53:58'),(280,NULL,NULL,279,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 20:53:58','2026-05-09 20:53:58'),(286,NULL,NULL,248,21,4,'2026-05-09 20:54:00',NULL,'live',NULL,NULL,'2026-05-09 20:54:59','2026-05-09 20:54:59'),(287,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 20:54:59','2026-05-09 20:54:59'),(288,NULL,NULL,287,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 20:54:59','2026-05-09 20:54:59'),(290,NULL,NULL,289,21,4,'2026-05-09 20:54:00',NULL,'live',NULL,NULL,'2026-05-09 20:54:59','2026-05-09 20:54:59'),(295,NULL,NULL,248,21,4,'2026-05-09 20:55:00',NULL,'live',NULL,NULL,'2026-05-09 20:55:54','2026-05-09 20:55:54'),(296,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 20:55:54','2026-05-09 20:55:54'),(297,NULL,NULL,296,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 20:55:54','2026-05-09 20:55:54'),(299,NULL,NULL,298,21,4,'2026-05-09 20:55:00',NULL,'live',NULL,NULL,'2026-05-09 20:55:54','2026-05-09 20:55:54'),(309,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 21:12:32','2026-05-09 21:12:32'),(310,NULL,NULL,309,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 21:12:32','2026-05-09 21:12:32'),(312,NULL,NULL,311,21,4,'2026-05-09 04:12:00',NULL,'live',NULL,NULL,'2026-05-09 21:12:32','2026-05-09 21:12:32'),(313,NULL,NULL,311,21,4,'2026-05-09 20:54:00',NULL,'live',NULL,NULL,'2026-05-09 21:12:32','2026-05-09 21:12:32'),(314,NULL,NULL,311,21,4,'2026-05-09 20:55:00',NULL,'live',NULL,NULL,'2026-05-09 21:12:32','2026-05-09 21:12:32'),(318,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 21:27:20','2026-05-09 21:27:20'),(319,NULL,NULL,318,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 21:27:20','2026-05-09 21:27:20'),(324,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 21:27:28','2026-05-09 21:27:28'),(325,NULL,NULL,324,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-09 21:27:28','2026-05-09 21:27:28'),(327,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-09 21:46:39','2026-05-09 21:46:39'),(328,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-09 22:02:23','2026-05-12 00:44:49'),(329,2,NULL,NULL,NULL,5,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-09 22:02:30','2026-05-09 22:02:30'),(330,2,NULL,NULL,NULL,5,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-09 22:10:25','2026-05-09 22:10:25'),(331,2,NULL,NULL,NULL,5,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 00:31:51','2026-05-12 00:31:51'),(333,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 00:44:49','2026-05-12 00:44:49'),(364,NULL,NULL,328,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(366,NULL,NULL,365,21,4,'2026-05-12 00:47:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(367,NULL,NULL,365,21,4,'2026-05-12 00:48:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(368,NULL,NULL,365,21,4,'2026-05-12 00:49:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(369,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(370,NULL,NULL,369,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(372,NULL,NULL,371,21,4,'2026-05-12 00:47:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(373,NULL,NULL,371,21,4,'2026-05-12 00:48:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(374,NULL,NULL,371,21,4,'2026-05-12 00:49:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:30','2026-05-12 00:49:30'),(378,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:33','2026-05-12 00:49:33'),(379,NULL,NULL,378,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:33','2026-05-12 00:49:33'),(381,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:59','2026-05-12 00:49:59'),(382,NULL,NULL,381,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 00:49:59','2026-05-12 00:49:59'),(388,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 00:50:07','2026-05-12 00:50:07'),(389,NULL,NULL,388,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 00:50:07','2026-05-12 00:50:07'),(391,NULL,NULL,390,21,4,'2026-05-12 00:47:00',NULL,'live',NULL,NULL,'2026-05-12 00:50:07','2026-05-12 00:50:07'),(396,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 01:24:16','2026-05-12 01:24:16'),(397,NULL,NULL,396,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 01:24:16','2026-05-12 01:24:16'),(399,NULL,NULL,398,21,4,'2026-05-12 00:47:00',NULL,'live',NULL,NULL,'2026-05-12 01:24:16','2026-05-12 01:24:16'),(403,NULL,NULL,328,5,3,'2026-05-12 01:24:00',NULL,'live',NULL,NULL,'2026-05-12 01:25:13','2026-05-12 01:25:13'),(405,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 01:25:13','2026-05-12 01:25:13'),(406,NULL,NULL,405,5,3,'2026-05-12 01:24:00',NULL,'live',NULL,NULL,'2026-05-12 01:25:14','2026-05-12 01:25:14'),(411,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 01:25:47','2026-05-12 01:25:47'),(412,NULL,NULL,411,5,3,'2026-05-12 01:24:00',NULL,'live',NULL,NULL,'2026-05-12 01:25:48','2026-05-12 01:25:48'),(414,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 01:25:56','2026-05-12 01:25:56'),(416,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 01:26:21','2026-05-12 01:26:21'),(422,NULL,NULL,328,5,3,'2026-05-12 02:51:00',NULL,'live',NULL,NULL,'2026-05-12 02:51:37','2026-05-12 02:51:37'),(424,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 02:51:37','2026-05-12 02:51:37'),(425,NULL,NULL,424,5,3,'2026-05-12 01:24:00',NULL,'live',NULL,NULL,'2026-05-12 02:51:37','2026-05-12 02:51:37'),(427,NULL,NULL,424,5,3,'2026-05-12 02:51:00',NULL,'live',NULL,NULL,'2026-05-12 02:51:38','2026-05-12 02:51:38'),(432,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 02:52:06','2026-05-12 02:52:06'),(433,NULL,NULL,432,5,3,'2026-05-12 02:51:00',NULL,'live',NULL,NULL,'2026-05-12 02:52:06','2026-05-12 02:52:06'),(438,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 02:52:39','2026-05-12 02:52:39'),(439,NULL,NULL,438,5,3,'2026-05-12 02:51:00',NULL,'live',NULL,NULL,'2026-05-12 02:52:39','2026-05-12 02:52:39'),(444,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 02:53:09','2026-05-12 02:53:09'),(445,NULL,NULL,444,5,3,'2026-05-12 02:51:00',NULL,'live',NULL,NULL,'2026-05-12 02:53:09','2026-05-12 02:53:09'),(454,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:12:58','2026-05-12 03:12:58'),(455,NULL,NULL,454,5,3,'2026-05-12 01:24:00',NULL,'live',NULL,NULL,'2026-05-12 03:12:58','2026-05-12 03:12:58'),(457,NULL,NULL,454,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 03:12:58','2026-05-12 03:12:58'),(459,NULL,NULL,454,5,3,'2026-05-12 02:51:00',NULL,'live',NULL,NULL,'2026-05-12 03:12:58','2026-05-12 03:12:58'),(468,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-12 03:13:37','2026-05-12 03:13:37'),(469,NULL,NULL,468,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:13:37','2026-05-12 03:13:37'),(475,NULL,NULL,468,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-05-12 03:13:37','2026-05-12 03:13:37'),(481,NULL,NULL,468,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-12 03:13:37','2026-05-12 03:13:37'),(490,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-12 03:14:05','2026-05-12 03:14:05'),(491,NULL,NULL,490,5,3,'2026-05-09 04:10:00',NULL,'live',NULL,NULL,'2026-05-12 03:14:05','2026-05-12 03:14:05'),(493,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:14:32','2026-05-12 03:14:32'),(497,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:17:01','2026-05-12 03:17:01'),(498,NULL,NULL,497,5,3,'2026-05-12 00:46:00',NULL,'live',NULL,NULL,'2026-05-12 03:17:01','2026-05-12 03:17:01'),(503,NULL,NULL,328,5,3,'2026-05-12 03:40:00',NULL,'live',NULL,NULL,'2026-05-12 03:40:03','2026-05-12 03:40:03'),(505,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:40:03','2026-05-12 03:40:03'),(506,NULL,NULL,505,5,3,'2026-05-12 03:40:00',NULL,'live',NULL,NULL,'2026-05-12 03:40:03','2026-05-12 03:40:03'),(511,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:41:19','2026-05-12 03:41:19'),(512,NULL,NULL,511,5,3,'2026-05-12 03:40:00',NULL,'live',NULL,NULL,'2026-05-12 03:41:19','2026-05-12 03:41:19'),(522,NULL,NULL,504,24,6,'2026-05-12 03:42:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(523,NULL,NULL,504,24,6,'2026-05-12 03:42:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(524,NULL,NULL,504,24,6,'2026-05-12 03:42:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(525,NULL,NULL,504,24,6,'2026-05-12 03:43:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(526,NULL,NULL,504,24,6,'2026-05-12 03:43:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(527,2,NULL,NULL,NULL,2,'2026-05-09 22:02:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(528,NULL,NULL,527,5,3,'2026-05-12 03:40:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(530,NULL,NULL,529,24,6,'2026-05-12 03:42:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(531,NULL,NULL,529,24,6,'2026-05-12 03:42:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(532,NULL,NULL,529,24,6,'2026-05-12 03:42:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(533,NULL,NULL,529,24,6,'2026-05-12 03:43:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(534,NULL,NULL,529,24,6,'2026-05-12 03:43:00',NULL,'live',NULL,NULL,'2026-05-12 03:43:36','2026-05-12 03:43:36'),(538,NULL,NULL,3,5,3,'2026-05-13 14:43:00',NULL,'live',NULL,NULL,'2026-05-13 14:44:30','2026-05-13 14:44:30'),(540,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 14:44:30','2026-05-13 14:44:30'),(541,NULL,NULL,540,5,3,'2026-05-13 14:43:00',NULL,'live',NULL,NULL,'2026-05-13 14:44:30','2026-05-13 14:44:30'),(543,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 14:45:02','2026-05-13 14:45:02'),(548,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 14:58:25','2026-05-13 14:58:25'),(549,NULL,NULL,548,5,3,'2026-05-13 14:43:00',NULL,'live',NULL,NULL,'2026-05-13 14:58:25','2026-05-13 14:58:25'),(551,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 15:05:25','2026-05-13 15:05:25'),(552,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 15:18:35','2026-05-13 15:18:35'),(553,NULL,NULL,552,5,3,'2026-05-13 14:43:00',NULL,'live',NULL,NULL,'2026-05-13 15:18:35','2026-05-13 15:18:35'),(555,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 15:21:56','2026-05-13 15:21:56'),(559,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 16:08:59','2026-05-13 16:08:59'),(560,NULL,NULL,559,5,3,'2026-05-13 14:43:00',NULL,'live',NULL,NULL,'2026-05-13 16:08:59','2026-05-13 16:08:59'),(562,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 16:11:02','2026-05-13 16:11:02'),(566,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-05-13 17:39:03','2026-05-13 17:39:03'),(567,NULL,NULL,566,5,3,'2026-05-13 14:43:00',NULL,'live',NULL,NULL,'2026-05-13 17:39:03','2026-05-13 17:39:03');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (328,1,1),(329,1,1),(330,1,1),(331,1,1),(333,1,1),(369,1,1),(378,1,1),(381,1,1),(388,1,1),(396,1,1),(405,1,1),(411,1,1),(414,1,1),(416,1,1),(424,1,1),(432,1,1),(438,1,1),(444,1,1),(454,1,1),(493,1,1),(497,1,1),(505,1,1),(511,1,1),(527,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Homepage','homepage',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-25 13:57:22','2026-03-25 13:57:22','2026-03-25 14:34:34','06aab01b-e069-4c88-8964-28f89b370076'),(2,2,'Entry — Page','pageEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-25 14:20:44','2026-05-12 00:45:27',NULL,'b7d4b92a-3550-4709-ba61-d7e4d3829f54'),(3,5,'Page Blocks Entry','pageBlocksEntry',NULL,NULL,NULL,'{title}',0,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-25 14:51:44','2026-03-25 14:51:56',NULL,'0c390a43-79fb-43af-89ea-7b8a7c41d3d7'),(4,18,'Entry — Card Matrix','cardMatrixEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-05-09 04:06:55','2026-05-09 04:07:07',NULL,'62025e7c-d31e-4ea1-a778-df0457c8317a'),(5,19,'Entry — Pages','pagesEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-05-09 22:02:03','2026-05-09 22:02:15','2026-05-12 00:45:04','7224478f-d487-4e1b-9800-089ea7e3f226'),(6,24,'Entry — Timeline Matrix','timelineMatrixEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-05-12 03:31:44','2026-05-12 03:32:58',NULL,'314fa8ad-a55f-4f35-9895-de1a13de0a96'),(7,27,'Contact Matrix Entry','contactMatrixEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-05-13 17:47:06','2026-05-13 17:47:06',NULL,'32df88de-3497-4bb2-8385-f85a301ab403');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"25d5974e-d00c-4ae1-b3c7-ca87427ddefd\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d4293c02-b206-4ab2-ad76-c544ee55e217\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-25T13:55:56+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"7e2ff94c-198a-4d2c-84c9-0d127a74020d\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Hero Section\", \"dateAdded\": \"2026-03-25T14:10:32+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5ce97453-9ece-40ca-ac1b-64149ca635d4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:04:52+00:00\", \"instructions\": \"Eyebrow Text Eyebrow / Kicker (small top text)\", \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"06046102-5b5b-459b-bfc9-b30d0fca0637\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:04:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subheadline\", \"width\": 100, \"handle\": \"subheadline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:06:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"82655099-51f2-45f3-b4e0-d7289fd79e60\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:09:51+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": \"linkField2\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:10:16+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 13:57:22','2026-03-25 14:11:07','2026-03-25 14:34:34','caeac63d-3450-4753-886c-81962cf78ae2'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"bee69b4e-5d3a-4aa2-aa9e-e0e3e517671d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"33eaf735-2da8-403c-8230-8505eabf00a4\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-25T14:44:46+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"fb60420e-7f69-437a-8dcb-a6054958208f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e91396d1-d7c4-4b1b-a3e9-55972a84ff9c\", \"required\": false, \"dateAdded\": \"2026-03-25T15:34:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:20:44','2026-03-25 15:34:31',NULL,'75d0994b-d90d-4008-bb5d-78000befd65e'),(3,'craft\\elements\\ContentBlock',NULL,'2026-03-25 14:31:44','2026-03-25 14:31:44',NULL,'276abbee-f882-42de-b9d4-031b096676bc'),(4,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"64586fe6-dda7-4d89-b978-a3e651f56501\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0cd78069-1878-4d0e-85cc-9a8d65311cdb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"86a9bff4-35a7-4748-8dce-ad0e3139a069\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subheadline\", \"width\": 100, \"handle\": \"Subheadline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"c53d75b5-67d6-47b2-b41a-327f91a1c146\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"button\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button Two\", \"width\": 100, \"handle\": \"buttonTwo\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:34:06','2026-03-25 14:34:15',NULL,'4a670768-d431-43e7-9622-21d72c90f053'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"2bda75ac-9d20-4c73-95d6-b9b86ee9722a\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"required\": false, \"dateAdded\": \"2026-03-25T14:51:44+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"2374da6a-41f3-45c7-a6f7-dd91cea4950b\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"contact\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"2d498e12-8f05-456e-aed4-cde0a37e8217\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc36f051-fd02-4e59-bf63-204e8eccf224\", \"required\": false, \"dateAdded\": \"2026-04-04T04:31:41+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"29202f5a-fbae-4c90-bec0-7f7518841fa3\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"callToAction\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"2a3bcb22-2710-4671-a485-593335ab29a9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"6671498f-b940-4c47-a8d5-1de96b0bd763\", \"required\": false, \"dateAdded\": \"2026-05-09T04:09:57+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"2ae683ea-ff99-4bb1-bf4c-e84e6f562847\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"cardGrid\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"48c1f09c-c1d6-446f-92fb-c44e9f515bc3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"564a4360-56ee-4b5a-ba0a-01f13d394fa5\", \"required\": false, \"dateAdded\": \"2026-05-13T17:58:42+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"67c0702d-602b-4460-a842-68b69569157a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d2dbcdc7-ca53-408a-8df4-99d795133201\", \"required\": false, \"dateAdded\": \"2026-03-25T14:51:44+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"13565fba-b2f9-432c-b4f9-ef1b99eb911c\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"hero\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"57c417d6-920f-49f6-a35f-d01401a86a3d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0119d5ec-bfd1-4692-a006-407e05e36d20\", \"required\": false, \"dateAdded\": \"2026-03-28T22:01:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"0ae1e2fd-df8a-4f54-86b8-b48ca05f67ff\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"productCarousel\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"dbb8f982-78f2-48c4-8258-217588847319\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46d1905d-56db-493d-90c0-5de9d9910388\", \"required\": false, \"dateAdded\": \"2026-03-28T23:22:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"33120c20-0409-43bd-9a82-e4e454039d9f\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"splitSection\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"952bf88c-85d0-4bdc-9c9a-38247f374055\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"231b19ec-9923-4689-ad97-450bdcd8ca3a\", \"required\": false, \"dateAdded\": \"2026-05-13T14:42:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"faa4e08d-b6ed-4d84-be81-2d983c7a77e4\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"subscribe\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"a550e24e-d987-47d6-a8c4-f48df23f7934\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e85b17b1-d20e-4121-a465-aa688b1ebfa5\", \"required\": false, \"dateAdded\": \"2026-05-12T03:22:49+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"dd64e939-9590-4119-8d13-bc890e040902\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"timeline\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:51:44','2026-05-13 17:58:42',NULL,'1f6fda9f-8346-4063-a50c-9ddafd204e07'),(6,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:01:03','2026-03-28 22:01:03',NULL,'2e18bd7b-7791-42d0-a644-39515e19122f'),(7,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:14:35','2026-03-28 22:14:35',NULL,'9e0f7050-8b3e-4182-a4da-a1160fff658c'),(8,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:16:08','2026-03-28 22:16:08',NULL,'60305552-5b6f-441b-afac-ab00f74184b2'),(9,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"08bb808c-0f00-414e-8630-4c6572e9c0b2\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"476c07cd-574a-447c-9c18-76a735aadf55\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"e22dce09-0d72-4df3-9bef-8775b4b87f12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Heading\", \"width\": 100, \"handle\": \"heading\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": true, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"9520f8fa-bad4-4a41-83dc-71074276a09a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Body Text\", \"width\": 100, \"handle\": \"body\", \"warning\": null, \"fieldUid\": \"1a574c61-2303-4a8b-86b7-7eb6d32f8310\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"cb5d09f4-db4a-4c57-9708-04ec94de83a9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Bullet Points\", \"width\": 100, \"handle\": \"bullets\", \"warning\": null, \"fieldUid\": \"9a981332-0b86-41c1-9403-d34ea88120a7\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"c99c2670-9403-4602-8815-8368eec327db\", \"name\": \"Image & Badge\", \"elements\": [{\"tip\": null, \"uid\": \"1cc59c78-7566-485b-b5d8-6b4469c1ecc0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image\", \"width\": 100, \"handle\": \"image\", \"warning\": null, \"fieldUid\": \"749757f2-2a14-490e-94f7-20c2e7ee83ec\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"8fa0d4ab-1d2a-41fb-9297-a97168329989\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image on Left\", \"width\": 50, \"handle\": \"imagePosition\", \"warning\": null, \"fieldUid\": \"5ffac5b3-782c-498e-a7d9-42ad705fdbd8\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"815fd70c-acf1-4826-bc98-bdc7fc69b0ec\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Background Color\", \"width\": 50, \"handle\": \"background\", \"warning\": null, \"fieldUid\": \"c2e12686-5149-4457-8555-3c624aed5cf8\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"5e86bf84-8204-49bd-bd48-82f86d93ab49\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Style\", \"width\": 100, \"handle\": \"badgeStyle\", \"warning\": null, \"fieldUid\": \"ca23eb84-fab3-4853-a946-1717643f6acc\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"4b90f090-c9bb-46ec-9806-9ccc9d5e0f8b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Text\", \"width\": 50, \"handle\": \"badgeText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"98444b6a-3b98-4cf4-abe6-4eb12890833d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Subtext\", \"width\": 50, \"handle\": \"badgeSubtext\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"7dde63eb-b11b-41c3-9b1e-6809b463df44\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Color\", \"width\": 100, \"handle\": \"badgeColor\", \"warning\": null, \"fieldUid\": \"542ec83a-995e-4897-ae72-7fda3f87a4dd\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"431ec017-19f8-403f-abb6-91fb01957eb5\", \"name\": \"CTAs\", \"elements\": [{\"tip\": null, \"uid\": \"a7e41a5e-e32e-455e-922b-558ca83fd5b0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Primary CTA\", \"width\": 100, \"handle\": \"primaryCta\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"2008fbe8-18c5-4142-b38a-f0fe5934c09f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Primary CTA Style\", \"width\": 100, \"handle\": \"primaryCtaStyle\", \"warning\": null, \"fieldUid\": \"d228dd99-209b-4700-9c49-e95c806c2308\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"8f31dc57-59e7-490d-b4df-6b299ed8e183\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Secondary CTA\", \"width\": 100, \"handle\": \"secondaryCta\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-28 22:36:49','2026-03-28 22:36:49',NULL,'a57984eb-3ebd-4d82-9816-ebb4a8985c0c'),(10,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:38:43','2026-03-28 22:38:43',NULL,'76d6d6d7-b34a-45ab-92f0-889faec44f64'),(11,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:38:43','2026-03-28 22:38:43',NULL,'9db20ff8-01b6-449c-b6b3-ecee7634b0d8'),(12,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"c9261752-57ce-419e-a60c-f5cbb1a1067e\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image Right\", \"width\": 25, \"handle\": \"imageRight\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:20:57+00:00\", \"instructions\": \"The image displays on the left by default. Enable this to move it to the right\", \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"b1fc4697-c4a0-457e-be69-38665a393900\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"7c4edaa8-604a-48d2-a947-3388823e3b2b\", \"required\": false, \"dateAdded\": \"2026-05-12T03:01:47+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0b92e79b-252c-4fdd-9467-b23f1b66911f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"c2d9c750-d7f6-412a-822c-7571172f15a5\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"4d44aae0-e56d-4315-bfaa-83937eb0421d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"eyebrow\", \"width\": 25, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"f075b188-d366-4033-b4ba-472195410663\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Heading\", \"width\": 75, \"handle\": \"heading\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"83858805-a6cd-43b6-9279-0edcf7240fb8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": \"enable a badge on the image.\", \"uid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge\", \"width\": 25, \"handle\": \"badge\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:15:12+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": \"When the Badge is enabled, it defaults to overlay mode. If this lightswitch is turned on, the badge will display in the corner instead.\", \"uid\": \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Overlay\", \"width\": 25, \"handle\": \"badgeOverlay\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:24:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"e68405db-0928-4c2f-b930-df879cc9bb47\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"5fd7f09f-bfc0-43e2-a982-7242517a38df\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Text\", \"width\": 25, \"handle\": \"badgeText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T23:25:42+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"b87c08e7-328c-4388-a980-57e694f7e449\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"a9fd0a03-657f-4952-9c55-566045985717\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Sub Text\", \"width\": 25, \"handle\": \"badgeSubText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-03T16:21:09+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"585f14d6-aaeb-4c32-baa7-1afa136721db\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\"}, {\"uid\": \"110eb17b-884e-4aca-bee4-16acd14b8bfb\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"}]}, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-28 23:07:07','2026-05-12 03:01:47',NULL,'d8e5ef18-5837-4a24-af05-b595b119f921'),(13,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"ccbd6b59-b565-46aa-88f6-6f32433c31c5\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"fb8347f5-df64-4639-8907-a7e8845b4e12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"28b90100-b662-46d8-b047-acc05be249bd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Heading\", \"width\": 100, \"handle\": \"heading\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Sub Header\", \"width\": 100, \"handle\": \"subHeader\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"d9cf0d28-62bf-4618-844e-ca96058c834a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-04-04 04:30:29','2026-04-04 04:38:45',NULL,'741d3f3d-ba77-49c2-8006-ce53f9a6df52'),(14,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"d6c87f38-6a85-4545-9ccc-f2552c0025b3\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"fd9c84b5-8600-49cf-9bd8-12445f0401a0\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2026-04-04T20:13:49+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"id\": null, \"tip\": null, \"uid\": \"698e5bcb-85af-4329-a717-310a7f8f39fa\", \"cols\": null, \"name\": null, \"rows\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": false, \"attribute\": \"alt\", \"dateAdded\": \"2026-04-04T20:17:23+00:00\", \"requirable\": true, \"orientation\": null, \"placeholder\": null, \"instructions\": null, \"userCondition\": null, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-06 12:36:07','2026-05-06 12:36:07',NULL,'00154f65-e361-46e7-b6f9-ce96873b6aa4'),(15,'craft\\elements\\ContentBlock',NULL,'2026-05-09 04:03:00','2026-05-09 04:03:00',NULL,'4b057a79-8d8c-4c3c-8888-01003c85e190'),(16,'craft\\elements\\ContentBlock',NULL,'2026-05-09 04:04:11','2026-05-09 04:04:11',NULL,'bdc87a8e-b0a3-4e96-8d30-aac32ac802bf'),(17,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"289e6079-4559-4bf1-a95e-5db2d9014e51\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"6b64b506-24d4-4971-88d7-d868e9d9714b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Section Background Color\", \"width\": 100, \"handle\": \"sectionBackgroundColor\", \"warning\": null, \"fieldUid\": \"7c4edaa8-604a-48d2-a947-3388823e3b2b\", \"required\": false, \"dateAdded\": \"2026-05-09T05:00:55+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"33406d90-7e53-4c8f-9975-2dde40f485bf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-09T04:05:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"7158299d-b9a4-4991-84f0-b575c0883bf5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Header\", \"width\": 100, \"handle\": \"header\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-09T04:05:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"eabf45a4-573f-4a0d-97de-29c9efa0728e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Sub Header\", \"width\": 100, \"handle\": \"subHeader\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-09T04:05:11+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"512aa64b-20b2-4b34-8bf9-8d81ec78d167\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"bb71e142-3e9f-4467-9d03-43e288eb4bc0\", \"required\": false, \"dateAdded\": \"2026-05-09T04:08:48+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-09 04:05:11','2026-05-09 05:00:55',NULL,'e9fe687e-4fbb-47a6-a1c3-4930c3c04600'),(18,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"3b7af4f8-0b49-4f69-8059-d48ed5bdadb1\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"30f3b05b-923f-4ac2-891c-c772b3aa5f34\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c2d9c750-d7f6-412a-822c-7571172f15a5\", \"required\": false, \"dateAdded\": \"2026-05-09T04:08:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"edd241c2-9d84-4da0-a459-69f878a7e21d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-05-09T04:05:37+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4a92b64a-46cf-4608-a131-af258f11ddf0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\", \"required\": false, \"dateAdded\": \"2026-05-09T04:08:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"d453f403-5d29-477c-9328-c1888e77bc6a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-05-09T04:08:27+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-09 04:06:55','2026-05-09 04:08:27',NULL,'6f926f6d-a1ea-4cd8-bc09-24233805c2ee'),(19,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"e83a2be6-40b9-4573-bd80-2adacb7c8aa4\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"ce7a5ae0-4d3f-43ef-a7d6-b439e3629438\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-05-09T22:00:55+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-09 22:02:03','2026-05-09 22:02:03','2026-05-12 00:45:04','b60843e7-f98e-4583-aa25-89392829eb63'),(20,'craft\\elements\\ContentBlock',NULL,'2026-05-12 03:21:13','2026-05-12 03:21:13',NULL,'dd423493-eda0-4c4b-8e5c-f9ee272232fa'),(21,'craft\\elements\\ContentBlock',NULL,'2026-05-12 03:21:23','2026-05-12 03:21:23',NULL,'61ae0a4e-1d55-4ba2-ac2a-17e0ce775f18'),(22,'craft\\elements\\ContentBlock',NULL,'2026-05-12 03:23:24','2026-05-12 03:23:24',NULL,'55cf5093-4d46-4a4c-8d81-53a44440ee31'),(23,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"afe39fe2-fd09-417a-8d3c-55664998c232\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-12T03:29:36+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"e802b542-1048-4c16-99ea-5e3da1e5c867\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Header\", \"width\": 100, \"handle\": \"header\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-12T03:29:36+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"4928ee04-f500-4b08-932f-69c52bfede2c\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"07b62ac5-22b7-42e6-8930-c48a79658ed1\", \"required\": false, \"dateAdded\": \"2026-05-12T03:31:57+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-12 03:29:36','2026-05-12 03:41:50',NULL,'9fed5cee-da60-4919-b0bb-dd3a82e2e158'),(24,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"289a9302-7801-434a-b2fd-6d9648f8ba97\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"420c9f98-83b7-43dd-ba50-d00baebcc402\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Year\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-05-12T03:30:32+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"915ddcc2-ca76-4f28-a64f-862b4b151d0d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Event\", \"width\": 100, \"handle\": \"event\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-12T03:35:24+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0b783164-c4fd-4198-8743-2cc921953e69\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Event Details\", \"width\": 100, \"handle\": \"eventDetails\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-12T03:35:24+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-12 03:31:44','2026-05-12 03:35:24',NULL,'c53f7454-c7e8-4ad7-93dd-b63f082d7af1'),(25,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"306fc606-f6c2-4ecc-95c5-7045beac8b99\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Section Theme Background\", \"width\": 100, \"handle\": \"sectionThemeBackground\", \"warning\": null, \"fieldUid\": \"7c4edaa8-604a-48d2-a947-3388823e3b2b\", \"required\": false, \"dateAdded\": \"2026-05-13T14:23:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T14:21:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"d1347db1-911d-4bca-a089-d27833338262\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Header\", \"width\": 100, \"handle\": \"header\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T14:21:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"bf1ba574-e8c7-4fac-87ac-e22929847953\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Content\", \"width\": 100, \"handle\": \"content\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T14:21:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"57c13cd0-bf26-4bac-822b-aba5d9d274ef\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ea57733c-b37f-4fd3-b7bf-ad80ce561f3f\", \"required\": false, \"dateAdded\": \"2026-05-13T14:23:14+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-13 14:21:46','2026-05-13 15:25:13',NULL,'7bde2698-f55f-4093-ae03-379a11ae9c7a'),(26,'craft\\elements\\ContentBlock',NULL,'2026-05-13 17:40:53','2026-05-13 17:40:53',NULL,'cc9a5fbf-d1b5-4f0c-a743-bedc8bb5f765'),(27,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"73d951d3-c34b-46d3-89c9-d42e25ae3417\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"972155eb-a924-4e7a-9c93-c9a86bb31231\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-05-13T17:44:17+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"fb1ef273-544d-4bb2-8327-37360e8b947f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c2d9c750-d7f6-412a-822c-7571172f15a5\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"76f2b622-3531-4351-88e6-da1a07d1f6da\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Sub Title\", \"width\": 100, \"handle\": \"subTitle\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"3fc2daa6-83ef-4973-bc45-ff738ac33d28\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Copy\", \"width\": 100, \"handle\": \"copy\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-13 17:47:06','2026-05-13 17:47:06',NULL,'6a69c341-021f-473e-a7a1-55fedef5d20d'),(28,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"1e1c8807-6ced-496e-a5ea-a687285ae464\", \"name\": null, \"elements\": [{\"tip\": null, \"uid\": \"407511f6-7e16-42bb-8a88-b6f671292763\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"927b451e-7c8e-4c0f-a938-6686349bfb94\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Header\", \"width\": 100, \"handle\": \"header\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"913d7fae-fcaf-45c7-a7eb-768408fea4f1\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Content\", \"width\": 100, \"handle\": \"content\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0891567b-3219-4f59-af92-594e0f0dfed0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ea57733c-b37f-4fd3-b7bf-ad80ce561f3f\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"3e52be7b-01a5-49fa-ac8f-66b9099a2124\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Form Call Out\", \"width\": 100, \"handle\": \"formCallOut\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"e6d1dd52-bf7e-4aff-ac40-3cc81ddc9cd6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"1686a50c-1e1c-41a1-a2be-68b75ae85cbd\", \"required\": false, \"dateAdded\": \"2026-05-13T17:47:35+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-05-13 17:47:35','2026-05-13 17:47:35',NULL,'2f050593-eacf-497a-9408-25c5de09b145');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Plain Text','plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-03-25 14:01:05','2026-03-25 14:01:05',NULL,'4d7ec46f-500b-47b6-8eba-f2f42e8066c1'),(2,'Link Field','linkField','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"advancedFields\":[\"target\",\"title\",\"id\",\"download\",\"class\"],\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"asset\":{\"allowedKinds\":[\"image\",\"pdf\",\"text\",\"video\",\"word\"],\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"1\",\"allowCustomSchemes\":\"\"}},\"types\":[\"entry\",\"url\",\"asset\",\"category\",\"email\",\"tel\",\"product\"]}','2026-03-25 14:09:49','2026-03-28 23:09:28',NULL,'5eec91ac-9cac-40d5-915a-f973014bad60'),(3,'Block Type','blockType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"Call To Action \",\"value\":\"callToAction\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Card Grid\",\"value\":\"cardGrid\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Contact\",\"value\":\"contact\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Hero\",\"value\":\"hero\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Product Carousel\",\"value\":\"productCarousel\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Split Section\",\"value\":\"splitSection\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Timeline\",\"value\":\"timeline\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Subscribe\",\"value\":\"subscribe\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2026-03-25 14:30:59','2026-05-13 17:58:31',NULL,'29323bbb-b103-4d28-aafb-f37b64ee4ae3'),(4,'Block — Hero','heroBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"4a670768-d431-43e7-9622-21d72c90f053\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"64586fe6-dda7-4d89-b978-a3e651f56501\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrowText\",\"label\":\"Eyebrow Text\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"3db4929f-d6dd-47ab-bb3b-1352061a74ac\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"headline\",\"label\":\"Headline\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"Subheadline\",\"label\":\"Subheadline\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"86a9bff4-35a7-4748-8dce-ad0e3139a069\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"button\",\"label\":\"Button\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"c53d75b5-67d6-47b2-b41a-327f91a1c146\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"buttonTwo\",\"label\":\"Button Two\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-03-25 14:31:44','2026-05-09 04:02:35',NULL,'d2dbcdc7-ca53-408a-8df4-99d795133201'),(5,'Block Picker','blockPicker','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":null,\"createButtonLabel\":\"New block\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"2589bc8f-a277-4da6-ae5f-f294f779bc87\":[]},\"entryTypes\":[{\"uid\":\"0c390a43-79fb-43af-89ea-7b8a7c41d3d7\",\"group\":\"General\"}]}','2026-03-25 14:41:24','2026-03-28 23:22:30',NULL,'e91396d1-d7c4-4b1b-a3e9-55972a84ff9c'),(6,'Block — Product Carousel','productCarouselBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"viewMode\":\"grouped\"}','2026-03-28 22:00:56','2026-05-09 04:03:00',NULL,'0119d5ec-bfd1-4692-a006-407e05e36d20'),(7,'Block — Split Section','splitSectionBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"viewMode\":\"grouped\",\"fieldLayouts\":{\"d8e5ef18-5837-4a24-af05-b595b119f921\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"c9261752-57ce-419e-a60c-f5cbb1a1067e\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"imageRight\",\"label\":\"Image Right\",\"instructions\":\"The image displays on the left by default. Enable this to move it to the right\",\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:20:57+00:00\",\"uid\":\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-12T03:01:47+00:00\",\"uid\":\"b1fc4697-c4a0-457e-be69-38665a393900\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7c4edaa8-604a-48d2-a947-3388823e3b2b\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"0b92e79b-252c-4fdd-9467-b23f1b66911f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c2d9c750-d7f6-412a-822c-7571172f15a5\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"eyebrow\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"4d44aae0-e56d-4315-bfaa-83937eb0421d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"heading\",\"label\":\"Heading\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":75,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"f075b188-d366-4033-b4ba-472195410663\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"83858805-a6cd-43b6-9279-0edcf7240fb8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badge\",\"label\":\"Badge\",\"instructions\":null,\"tip\":\"enable a badge on the image.\",\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:15:12+00:00\",\"uid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badgeOverlay\",\"label\":\"Badge Overlay\",\"instructions\":null,\"tip\":\"When the Badge is enabled, it defaults to overlay mode. If this lightswitch is turned on, the badge will display in the corner instead.\",\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:24:31+00:00\",\"uid\":\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"e68405db-0928-4c2f-b930-df879cc9bb47\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\"}]},\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badgeText\",\"label\":\"Badge Text\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:25:42+00:00\",\"uid\":\"5fd7f09f-bfc0-43e2-a982-7242517a38df\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"b87c08e7-328c-4388-a980-57e694f7e449\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\"}]},\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\",\"editCondition\":null,\"elementEditCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badgeSubText\",\"label\":\"Badge Sub Text\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"dateAdded\":\"2026-04-03T16:21:09+00:00\",\"uid\":\"a9fd0a03-657f-4952-9c55-566045985717\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"585f14d6-aaeb-4c32-baa7-1afa136721db\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\"},{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"110eb17b-884e-4aca-bee4-16acd14b8bfb\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"}]},\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\",\"editCondition\":null,\"elementEditCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"thumbFieldKey\":null,\"cardThumbAlignment\":\"end\"}}}','2026-03-28 22:14:35','2026-05-12 03:02:49',NULL,'46d1905d-56db-493d-90c0-5de9d9910388'),(8,'Background Color','backgroundDropdown','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"White\",\"value\":\"bg-white\",\"default\":true},{\"label\":\"Charcoal\",\"value\":\"bg-charcoal\",\"default\":false},{\"label\":\"Bronze\",\"value\":\"bg-bronze\",\"default\":false},{\"label\":\"Teal\",\"value\":\"bg-teal\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','c2e12686-5149-4457-8555-3c624aed5cf8'),(9,'Badge Style','badgeStyleDropdown','global',NULL,'Corner = floating badge outside the image. Overlay = frosted glass badge inside the image.',0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":true},{\"label\":\"Corner\",\"value\":\"corner\",\"default\":false},{\"label\":\"Overlay\",\"value\":\"overlay\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','ca23eb84-fab3-4853-a946-1717643f6acc'),(10,'Bullet Points','bulletsTable','global',NULL,'Optional checklist items shown beneath the body text.',0,'none',NULL,'craft\\fields\\Table','{\"columns\":{\"col1\":{\"heading\":\"Item\",\"handle\":\"item\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[],\"minRows\":null,\"maxRows\":null,\"staticRows\":false}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','9a981332-0b86-41c1-9403-d34ea88120a7'),(11,'Badge Color','badgeColorDropdown','global',NULL,'Only applies when Badge Style is set to Corner.',0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Bronze\",\"value\":\"bg-bronze\",\"default\":true},{\"label\":\"Teal\",\"value\":\"bg-teal\",\"default\":false},{\"label\":\"Charcoal\",\"value\":\"bg-charcoal\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','542ec83a-995e-4897-ae72-7fda3f87a4dd'),(12,'CTA Style','ctaStyleDropdown','global',NULL,'Solid = charcoal button. Teal = teal button. Ghost = outlined button.',0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Solid\",\"value\":\"solid\",\"default\":true},{\"label\":\"Teal\",\"value\":\"teal\",\"default\":false},{\"label\":\"Ghost\",\"value\":\"ghost\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','d228dd99-209b-4700-9c49-e95c806c2308'),(13,'Image','assetsImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":1,\"minRelations\":null,\"maxRelations\":1,\"restrictFiles\":true,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"viewMode\":\"list\"}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','749757f2-2a14-490e-94f7-20c2e7ee83ec'),(14,'Body Text','bodyPlainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":6,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','1a574c61-2303-4a8b-86b7-7eb6d32f8310'),(15,'Image on Left','imagePositionLightswitch','global',NULL,'Toggle on to place the image on the left. Off = image on the right.',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":\"Right\",\"onLabel\":\"Left\"}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','5ffac5b3-782c-498e-a7d9-42ad705fdbd8'),(16,'lighswitch','lighswitch','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null,\"showLabelsInCards\":false}','2026-03-28 22:43:17','2026-03-28 22:43:17',NULL,'c3351fca-dd41-4318-b6ed-7ea1f921ca34'),(17,'Image(s)','images','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSearchInput\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-03-28 22:44:36','2026-05-06 12:36:07',NULL,'c2d9c750-d7f6-412a-822c-7571172f15a5'),(18,'Rich Text Editor','richTextEditor','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"advancedLinkFields\":null,\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"characterLimit\":null,\"css\":null,\"cssFile\":null,\"defaultTransform\":null,\"defaultUploadLocationSubpath\":null,\"defaultUploadLocationVolume\":null,\"fullGraphqlData\":true,\"headingLevels\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"],\"imageEntryTypeUid\":null,\"imageFieldUid\":null,\"imageMode\":\"img\",\"js\":null,\"jsFile\":null,\"options\":null,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"toolbar\":[\"heading\",\"|\",\"bold\",\"italic\",\"link\",\"bulletedList\"],\"wordLimit\":null}','2026-03-28 23:07:05','2026-04-04 04:05:03',NULL,'64e2bf73-506f-4e6f-9a22-dd5d54f10b77'),(19,'Block — Call To Action','callToActionBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"741d3f3d-ba77-49c2-8006-ce53f9a6df52\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"ccbd6b59-b565-46aa-88f6-6f32433c31c5\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"Eyebrow\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"fb8347f5-df64-4639-8907-a7e8845b4e12\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"heading\",\"label\":\"Heading\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"28b90100-b662-46d8-b047-acc05be249bd\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"subHeader\",\"label\":\"Sub Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"d9cf0d28-62bf-4618-844e-ca96058c834a\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-04-04 04:30:29','2026-05-09 04:02:49',NULL,'dc36f051-fd02-4e59-bf63-204e8eccf224'),(20,'Block — Card Grid','cardGridBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"e9fe687e-4fbb-47a6-a1c3-4930c3c04600\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"289e6079-4559-4bf1-a95e-5db2d9014e51\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"sectionBackgroundColor\",\"label\":\"Section Background Color\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-09T05:00:55+00:00\",\"uid\":\"6b64b506-24d4-4971-88d7-d868e9d9714b\",\"fieldUid\":\"7c4edaa8-604a-48d2-a947-3388823e3b2b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrowText\",\"label\":\"Eyebrow Text\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-09T04:05:11+00:00\",\"uid\":\"33406d90-7e53-4c8f-9975-2dde40f485bf\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"header\",\"label\":\"Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-09T04:05:11+00:00\",\"uid\":\"7158299d-b9a4-4991-84f0-b575c0883bf5\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"subHeader\",\"label\":\"Sub Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-09T04:05:11+00:00\",\"uid\":\"eabf45a4-573f-4a0d-97de-29c9efa0728e\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-09T04:08:48+00:00\",\"uid\":\"512aa64b-20b2-4b34-8bf9-8d81ec78d167\",\"fieldUid\":\"bb71e142-3e9f-4467-9d03-43e288eb4bc0\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-05-09 04:03:56','2026-05-09 05:00:55',NULL,'6671498f-b940-4c47-a8d5-1de96b0bd763'),(21,'Matrix — Cards','cardsMatrix','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"62025e7c-d31e-4ea1-a778-df0457c8317a\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2026-05-09 04:05:48','2026-05-09 04:08:27',NULL,'bb71e142-3e9f-4467-9d03-43e288eb4bc0'),(22,'Color','color','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"White\",\"value\":\"white\",\"icon\":\"\",\"color\":\"#ffffff\",\"default\":\"1\"},{\"label\":\"Charcoal\",\"value\":\"charcoal\",\"icon\":\"\",\"color\":\"#29323d\",\"default\":\"\"},{\"label\":\"Teal\",\"value\":\"teal\",\"icon\":\"\",\"color\":\"#0ed3c8\",\"default\":\"\"},{\"label\":\"Bronze\",\"value\":\"bronze\",\"icon\":\"\",\"color\":\"#b67236\",\"default\":\"\"}]}','2026-05-09 04:17:14','2026-05-12 03:17:58',NULL,'7c4edaa8-604a-48d2-a947-3388823e3b2b'),(23,'Block — Timeline','timelineBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"9fed5cee-da60-4919-b0bb-dd3a82e2e158\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"afe39fe2-fd09-417a-8d3c-55664998c232\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"Eyebrow\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-12T03:29:36+00:00\",\"uid\":\"09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"header\",\"label\":\"Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-12T03:29:36+00:00\",\"uid\":\"e802b542-1048-4c16-99ea-5e3da1e5c867\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-12T03:31:57+00:00\",\"uid\":\"4928ee04-f500-4b08-932f-69c52bfede2c\",\"fieldUid\":\"07b62ac5-22b7-42e6-8930-c48a79658ed1\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-05-12 03:21:13','2026-05-12 03:41:50',NULL,'e85b17b1-d20e-4121-a465-aa688b1ebfa5'),(24,'Matrix — Timeline','timelineMatrix','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"cards\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":50,\"createButtonLabel\":null,\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"2589bc8f-a277-4da6-ae5f-f294f779bc87\":[]},\"entryTypes\":[{\"uid\":\"314fa8ad-a55f-4f35-9895-de1a13de0a96\",\"group\":\"General\"}]}','2026-05-12 03:31:06','2026-05-12 03:35:26',NULL,'07b62ac5-22b7-42e6-8930-c48a79658ed1'),(25,'Block — Subscribe ','subscribeblock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"7bde2698-f55f-4093-ae03-379a11ae9c7a\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"306fc606-f6c2-4ecc-95c5-7045beac8b99\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"sectionThemeBackground\",\"label\":\"Section Theme Background\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T14:23:46+00:00\",\"uid\":\"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\",\"fieldUid\":\"7c4edaa8-604a-48d2-a947-3388823e3b2b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"Eyebrow\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T14:21:46+00:00\",\"uid\":\"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"header\",\"label\":\"Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T14:21:46+00:00\",\"uid\":\"d1347db1-911d-4bca-a089-d27833338262\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"content\",\"label\":\"Content\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T14:21:46+00:00\",\"uid\":\"bf1ba574-e8c7-4fac-87ac-e22929847953\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T14:23:14+00:00\",\"uid\":\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\",\"fieldUid\":\"ea57733c-b37f-4fd3-b7bf-ad80ce561f3f\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-05-13 14:20:10','2026-05-13 15:25:13',NULL,'231b19ec-9923-4689-ad97-450bdcd8ca3a'),(26,'Form','form','global',NULL,NULL,0,'none',NULL,'verbb\\formie\\fields\\Forms','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showSearchInput\":true,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-05-13 14:22:59','2026-05-13 14:22:59',NULL,'ea57733c-b37f-4fd3-b7bf-ad80ce561f3f'),(27,'Block — Contact','contactBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"2f050593-eacf-497a-9408-25c5de09b145\":{\"tabs\":[{\"uid\":\"1e1c8807-6ced-496e-a5ea-a687285ae464\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"Eyebrow\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T17:47:35+00:00\",\"uid\":\"407511f6-7e16-42bb-8a88-b6f671292763\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"header\",\"label\":\"Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T17:47:35+00:00\",\"uid\":\"927b451e-7c8e-4c0f-a938-6686349bfb94\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"content\",\"label\":\"Content\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T17:47:35+00:00\",\"uid\":\"913d7fae-fcaf-45c7-a7eb-768408fea4f1\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T17:47:35+00:00\",\"uid\":\"0891567b-3219-4f59-af92-594e0f0dfed0\",\"fieldUid\":\"ea57733c-b37f-4fd3-b7bf-ad80ce561f3f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"formCallOut\",\"label\":\"Form Call Out\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T17:47:35+00:00\",\"uid\":\"3e52be7b-01a5-49fa-ac8f-66b9099a2124\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-05-13T17:47:35+00:00\",\"uid\":\"e6d1dd52-bf7e-4aff-ac40-3cc81ddc9cd6\",\"fieldUid\":\"1686a50c-1e1c-41a1-a2be-68b75ae85cbd\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-05-13 17:40:52','2026-05-13 17:47:35',NULL,'564a4360-56ee-4b5a-ba0a-01f13d394fa5'),(28,'Contact Matrix','contactMatrix','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"32df88de-3497-4bb2-8385-f85a301ab403\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":50,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"cards\"}','2026-05-13 17:47:28','2026-05-13 17:47:28',NULL,'1686a50c-1e1c-41a1-a2be-68b75ae85cbd');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_emailtemplates`
--

LOCK TABLES `formie_emailtemplates` WRITE;
/*!40000 ALTER TABLE `formie_emailtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayout_pages`
--

LOCK TABLES `formie_fieldlayout_pages` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayout_pages` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fieldlayout_pages` VALUES (1,1,'Page 1',0,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2026-05-13 14:45:16','2026-05-13 14:45:16','cb74b5a5-6a1c-4b6b-87ad-002c0f9f04ad'),(2,2,'Page 1',0,'{\"submitButtonLabel\":\"Submit\",\"backButtonLabel\":\"Back\",\"showBackButton\":false,\"saveButtonLabel\":\"Save\",\"showSaveButton\":false,\"saveButtonStyle\":\"link\",\"buttonsPosition\":\"left\",\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":null,\"enableNextButtonConditions\":false,\"nextButtonConditions\":[],\"enablePageConditions\":false,\"pageConditions\":[],\"enableJsEvents\":false,\"jsGtmEventOptions\":[]}','2026-05-13 14:58:09','2026-05-13 14:58:09','7cf15264-1485-4eb9-97ee-6fa219f97a4d');
/*!40000 ALTER TABLE `formie_fieldlayout_pages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayout_rows`
--

LOCK TABLES `formie_fieldlayout_rows` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayout_rows` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fieldlayout_rows` VALUES (1,1,1,0,'2026-05-13 14:58:09','2026-05-13 14:58:09','60372673-d5fe-4e18-9c29-097727d1e1a2'),(2,1,1,1,'2026-05-13 14:58:09','2026-05-13 14:58:09','4dc15bbe-5711-4154-8984-b4c19de9975a'),(3,1,1,2,'2026-05-13 14:58:09','2026-05-13 14:58:09','139c691d-6acb-48a5-95dc-074f0cc5a73e'),(4,1,1,3,'2026-05-13 14:58:09','2026-05-13 14:58:09','695a0b69-020c-4919-bcdf-b10a6963f6c8'),(5,2,2,0,'2026-05-13 14:58:09','2026-05-13 14:58:09','4c3ca922-18b7-4fb1-a1af-817ffc698aa9');
/*!40000 ALTER TABLE `formie_fieldlayout_rows` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fieldlayouts`
--

LOCK TABLES `formie_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `formie_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fieldlayouts` VALUES (1,'2026-05-13 14:45:16','2026-05-13 14:45:16','22d544f8-81a3-4088-9b9b-0ca5f8f9fffe'),(2,'2026-05-13 14:58:09','2026-05-13 14:58:09','0241c946-92be-411d-a48f-5dfeadb3a208');
/*!40000 ALTER TABLE `formie_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_fields`
--

LOCK TABLES `formie_fields` WRITE;
/*!40000 ALTER TABLE `formie_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_fields` VALUES (1,1,1,1,NULL,'First Name','firstName','verbb\\formie\\fields\\SingleLineText',0,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2026-05-13 14:58:09','2026-05-13 14:58:09','0f5b9f6c-1d95-493a-b4f3-bd9a72e8e5d4'),(2,1,1,2,NULL,'Last Name','lastName','verbb\\formie\\fields\\SingleLineText',0,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2026-05-13 14:58:09','2026-05-13 14:58:09','1ceb788e-a373-4990-b602-6e0334a497e8'),(3,1,1,3,NULL,'Email','email','verbb\\formie\\fields\\Email',0,'{\"validateDomain\":false,\"blockedDomains\":[],\"blockFreeDomains\":false,\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2026-05-13 14:58:09','2026-05-13 14:58:09','bb701a92-1930-4c73-9445-edab415508ea'),(4,2,2,5,NULL,'Date','date','verbb\\formie\\fields\\subfields\\DateDate',0,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":[{\"label\":\"type\",\"value\":\"date\"},{\"label\":\"autocomplete\",\"value\":\"off\"}],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2026-05-13 14:58:09','2026-05-13 14:58:09','92d9aaeb-d85b-4244-8760-05384f78fff8'),(5,2,2,5,NULL,'Time','time','verbb\\formie\\fields\\subfields\\DateTime',1,'{\"limit\":false,\"min\":null,\"minType\":\"characters\",\"max\":null,\"maxType\":\"characters\",\"uniqueValue\":false,\"instructions\":null,\"enabled\":false,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":null,\"inputAttributes\":[{\"label\":\"type\",\"value\":\"time\"},{\"label\":\"autocomplete\",\"value\":\"off\"}],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null}','2026-05-13 14:58:09','2026-05-13 14:58:09','91de6bb8-bff5-44bc-bde2-24af008338a8'),(6,1,1,4,NULL,'Your Pup\'s Birthday','yourPupsBirthday','verbb\\formie\\fields\\Date',0,'{\"dateFormat\":\"Y-m-d\",\"timeFormat\":\"H:i\",\"displayType\":\"calendar\",\"defaultOption\":null,\"datePickerOptions\":[],\"minDateOption\":\"\",\"minDate\":null,\"minDateOffset\":\"add\",\"minDateOffsetNumber\":0,\"minDateOffsetType\":\"days\",\"maxDateOption\":\"\",\"maxDate\":null,\"maxDateOffset\":\"add\",\"maxDateOffsetNumber\":0,\"maxDateOffsetType\":\"days\",\"minYearRange\":-100,\"maxYearRange\":100,\"availableDaysOfWeek\":\"*\",\"instructions\":null,\"enabled\":true,\"required\":false,\"matchField\":null,\"placeholder\":null,\"defaultValue\":null,\"prePopulate\":null,\"errorMessage\":null,\"labelPosition\":null,\"instructionsPosition\":null,\"cssClasses\":null,\"containerAttributes\":[],\"inputAttributes\":[],\"includeInEmail\":true,\"emailValue\":null,\"enableConditions\":false,\"conditions\":null,\"enableContentEncryption\":false,\"visibility\":null,\"nestedLayoutId\":2,\"contentTable\":null,\"subFieldLabelPosition\":null}','2026-05-13 14:58:09','2026-05-13 14:58:09','65d3c4ca-2af7-47e2-8f81-0505e08ffee8');
/*!40000 ALTER TABLE `formie_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_forms`
--

LOCK TABLES `formie_forms` WRITE;
/*!40000 ALTER TABLE `formie_forms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_forms` VALUES (544,'subscribe','{\"displayFormTitle\":false,\"displayCurrentPageTitle\":false,\"displayPageTabs\":false,\"displayPageProgress\":false,\"scrollToTop\":true,\"progressPosition\":\"end\",\"progressValuePosition\":\"inside-center\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"requiredIndicator\":\"asterisk\",\"submitMethod\":\"page-reload\",\"submitAction\":\"message\",\"submitActionTab\":null,\"submitActionUrl\":null,\"submitActionFormHide\":false,\"submitActionMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"},\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Submission saved.\\\"}]}]\",\"submitActionMessageTimeout\":null,\"submitActionMessagePosition\":\"top-form\",\"loadingIndicator\":null,\"loadingIndicatorText\":null,\"validationOnSubmit\":true,\"validationOnFocus\":false,\"errorMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"},\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Couldn’t save submission due to errors.\\\"}]}]\",\"errorMessagePosition\":\"top-form\",\"requireUser\":false,\"requireUserMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"scheduleForm\":false,\"scheduleFormStart\":null,\"scheduleFormEnd\":null,\"scheduleFormPendingMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"scheduleFormExpiredMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"limitSubmissions\":null,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":\"total\",\"limitSubmissionsMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"limitSubmissionsIpAddressNumber\":null,\"limitSubmissionsIpAddressType\":\"total\",\"limitSubmissionsIpAddressMessage\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"attrs\\\":{\\\"textAlign\\\":\\\"start\\\"}}]\",\"integrations\":[],\"submissionTitleFormat\":\"{timestamp}\",\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"fileUploadsAction\":null,\"redirectUrl\":null,\"pageRedirectUrl\":null,\"defaultEmailTemplateId\":null,\"disableCaptchas\":false}',1,NULL,NULL,NULL,1,'forever',NULL,'retain','retain','2026-05-13 14:45:16','2026-05-13 14:58:09','efaa672d-6aa6-4b00-a230-1711d4323ce8');
/*!40000 ALTER TABLE `formie_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_formtemplates`
--

LOCK TABLES `formie_formtemplates` WRITE;
/*!40000 ALTER TABLE `formie_formtemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_formtemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_integrations`
--

LOCK TABLES `formie_integrations` WRITE;
/*!40000 ALTER TABLE `formie_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_notifications`
--

LOCK TABLES `formie_notifications` WRITE;
/*!40000 ALTER TABLE `formie_notifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments`
--

LOCK TABLES `formie_payments` WRITE;
/*!40000 ALTER TABLE `formie_payments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments_plans`
--

LOCK TABLES `formie_payments_plans` WRITE;
/*!40000 ALTER TABLE `formie_payments_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_payments_subscriptions`
--

LOCK TABLES `formie_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `formie_payments_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_pdftemplates`
--

LOCK TABLES `formie_pdftemplates` WRITE;
/*!40000 ALTER TABLE `formie_pdftemplates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_pdftemplates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_relations`
--

LOCK TABLES `formie_relations` WRITE;
/*!40000 ALTER TABLE `formie_relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_sentnotifications`
--

LOCK TABLES `formie_sentnotifications` WRITE;
/*!40000 ALTER TABLE `formie_sentnotifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_sentnotifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_statuses`
--

LOCK TABLES `formie_statuses` WRITE;
/*!40000 ALTER TABLE `formie_statuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `formie_statuses` VALUES (1,'New','new','green',NULL,1,1,NULL,'2026-05-13 14:45:17','2026-05-13 14:45:17','a7ceddff-7f65-4670-a12c-343eec905a59');
/*!40000 ALTER TABLE `formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_stencils`
--

LOCK TABLES `formie_stencils` WRITE;
/*!40000 ALTER TABLE `formie_stencils` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `formie_submissions`
--

LOCK TABLES `formie_submissions` WRITE;
/*!40000 ALTER TABLE `formie_submissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `formie_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.9.23','5.9.0.8',0,'ndcscnsmnqia','3@znmrorkobx','2026-03-12 17:35:44','2026-05-13 17:58:44','bdb1fde7-0ca3-4ae0-9d78-8b50b127bbd3');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','a20bf386-7a2b-43b0-9928-b317decf2c48'),(2,'craft','m221101_115859_create_entries_authors_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','b9fd361d-6b9a-4b4c-bad7-d7aec1ba7aae'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','66259b27-a785-4263-af36-b4a8299aefc6'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','aa0fbf45-7ed2-415a-a6c5-70575a2c6bc0'),(5,'craft','m230314_110309_add_authenticator_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','e918579a-45ba-4b8d-81a6-d14269ab9ea8'),(6,'craft','m230314_111234_add_webauthn_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','3b47b684-b935-4b66-8d79-455796ec9764'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','1a0c9808-207c-4d43-bd69-f83ec7bfc751'),(8,'craft','m230511_000000_field_layout_configs','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','19a2bdce-90b4-4140-9630-7f40d5cb370b'),(9,'craft','m230511_215903_content_refactor','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c7ef5c1c-2e30-49fe-b749-157bb9a910c5'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','1e85dc00-aab3-493d-80ef-cbcff97794a1'),(11,'craft','m230524_000001_entry_type_icons','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','78ee0605-e495-4d38-b723-e706dccaabb6'),(12,'craft','m230524_000002_entry_type_colors','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c7d7293f-9d6b-4733-8e4a-c8deaa05466e'),(13,'craft','m230524_220029_global_entry_types','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','4b1f7b12-434f-49a1-974c-3592d2e9619a'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','da89b2ae-beee-4650-849a-62809815dbab'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','ca78b914-9fab-489f-b68d-c90f73ea1627'),(16,'craft','m230616_173810_kill_field_groups','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c3b95a84-1ddb-4b00-a921-2612a719a202'),(17,'craft','m230616_183820_remove_field_name_limit','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','41303200-9639-43a4-a4ac-ae16c1be1aee'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','7490fcee-134f-4e44-972b-0a3799c323fb'),(19,'craft','m230710_162700_element_activity','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','3e7ca49a-5075-49aa-9e1a-7411362a542c'),(20,'craft','m230820_162023_fix_cache_id_type','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','de5140cf-8e00-4fdd-b215-a26542eaa1e0'),(21,'craft','m230826_094050_fix_session_id_type','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','f8db394a-1532-441d-901d-e2066a1b3fab'),(22,'craft','m230904_190356_address_fields','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','2dff87f8-499b-4760-9f30-b63d3fd09f84'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','b5f8e29d-6bac-40bc-9028-20abfefc59c2'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','195e16b4-06ef-40ab-9d13-dc98900555fa'),(25,'craft','m231213_030600_element_bulk_ops','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','40538aeb-2f3c-4d93-bf2d-b27ee481c6aa'),(26,'craft','m240129_150719_sites_language_amend_length','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c7bd2f72-5a43-45b0-a8c8-a23ed99985fd'),(27,'craft','m240206_035135_convert_json_columns','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','1b16ae52-a7d0-4560-a239-4f6b9f34ae1c'),(28,'craft','m240207_182452_address_line_3','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','400e7a15-8bbc-47d4-a1bf-31f63caddf7c'),(29,'craft','m240302_212719_solo_preview_targets','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','43290dbb-491c-4f41-95c3-a13376d54c73'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','3a1c9e8f-0ded-43c7-9255-6157f954c79e'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','5b19adb2-9ca8-4d93-af12-11fd4b1f2393'),(32,'craft','m240731_053543_soft_delete_fields','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','5e504251-6405-4bb9-b574-cf428ffee1a8'),(33,'craft','m240805_154041_sso_identities','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','be6a6bfd-03cc-4083-a131-c1e3c052ab14'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','4167c866-d7e6-458b-b58f-6e2d494f4745'),(35,'craft','m241120_190905_user_affiliated_sites','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','9642cabe-05fc-4dcc-8cfd-3c4261f1bf92'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','9cc55afa-8a1f-495a-b7fb-2df1038be996'),(37,'craft','m250119_135304_entry_type_overrides','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','2ab2024d-8b47-4dcc-996f-cc5d6a45f270'),(38,'craft','m250206_135036_search_index_queue','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','a0b8f09f-ab5d-4aeb-b319-78b0baac4273'),(39,'craft','m250207_172349_bulkop_events','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','71039257-d0ad-48e8-8f40-f104f4399a0a'),(40,'craft','m250315_131608_unlimited_authors','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','84c585dd-c03d-4063-a8fb-604d4f67954a'),(41,'craft','m250403_171253_static_statuses','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','729d6528-94d6-4f2c-ba50-f1621e812798'),(42,'craft','m250512_164202_asset_mime_types','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','aa0b6cad-6e4e-47f1-94ad-ea73553205c0'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','de593bfe-35ce-43ca-8222-9ecb789cef78'),(44,'craft','m250531_183058_content_blocks','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','b565af7e-ca43-45f8-a1da-c9f279789e8b'),(45,'craft','m250623_105031_entry_type_descriptions','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c5e2ad72-86a4-4d56-9ca2-a6c2e2dd733d'),(46,'craft','m250910_144630_add_elements_owners_sort_order_index','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','260a9b69-3e9f-4034-8e23-2ca0a76f78da'),(47,'craft','m251030_203440_drop_widgets_enabled_column','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c2564e59-4dc1-4c43-bf3d-8bcb0db4404a'),(48,'craft','m251110_192405_entry_type_ui_label_formats','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','674c4263-c06f-443c-9003-2aca9d09c25f'),(49,'craft','m251205_190131_drop_searchindexqueue_fk','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','ae4e0875-bdd0-4178-8188-5724db985367'),(50,'craft','m251230_192239_update_field_layouts','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','627ce1e8-5f7a-497e-a97c-a62b7ef9134a'),(51,'craft','m260106_130629_directive_schema_components','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c3454821-d216-4298-b8af-05ac3cfb5d75'),(52,'craft','m260120_120907_line_breaks_in_titles','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','ac7cee81-c3f3-4a37-937d-6a95c5a262fe'),(53,'craft','m260125_233614_changeAuthorForPeerEntries_permission','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','dffee726-427a-4bd9-b8f4-bf8f5bde0613'),(54,'plugin:commerce','Install','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7aade688-b72f-4f78-9c18-6bc2747d2273'),(55,'plugin:commerce','m210614_073359_detailed_permission','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2fca51e6-85ad-4300-9105-ef0649fbe2e4'),(56,'plugin:commerce','m210831_080542_rename_variant_title_format_field','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','eb391375-7e06-4022-91de-a7d6a56f4bf0'),(57,'plugin:commerce','m210901_211323_not_null_booleans','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3b277548-0a06-40f5-b904-64b769366a81'),(58,'plugin:commerce','m210922_133729_add_discount_order_condition_builder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','45b15797-d05a-445c-9b56-c5031ef045eb'),(59,'plugin:commerce','m211118_101920_split_coupon_codes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d0a37a77-7aa8-4a0b-86e4-ae2702d75c70'),(60,'plugin:commerce','m220301_022054_user_addresses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','62d4cfac-96bf-41d6-86fe-c938e3a2d95e'),(61,'plugin:commerce','m220302_133730_add_discount_user_addresses_condition_builders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','72ea1369-6e9c-410a-a52c-9579dcd44727'),(62,'plugin:commerce','m220304_094835_discount_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b7f75c94-79df-4e84-84f1-1b4899c289ca'),(63,'plugin:commerce','m220308_221717_orderhistory_name','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5d4dd02b-dbde-477d-aa21-0b5fb4bb922e'),(64,'plugin:commerce','m220329_075053_convert_gateway_frontend_enabled_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a4b36cfc-a43c-4279-a0c0-62136e461204'),(65,'plugin:commerce','m220706_132118_add_purchasable_tax_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7a0e75f7-d8c2-4aee-bb10-d11d6aa5241d'),(66,'plugin:commerce','m220812_104819_add_primary_payment_source_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ad5ff4a2-14f7-431a-bd8c-20f12ee47dc8'),(67,'plugin:commerce','m220817_135050_add_purchase_total_back_if_missing','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','01d008b5-d579-498d-9028-477496af586c'),(68,'plugin:commerce','m220912_111800_add_order_total_qty_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','27e1569b-e0f6-48dd-a20b-478c2afa16c7'),(69,'plugin:commerce','m221025_083940_add_purchasables_stores_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','abde7a41-ed32-494a-954c-1f32ebd937cf'),(70,'plugin:commerce','m221026_105212_add_catalog_pricing_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','51484b72-f1b4-42c4-ba5c-8dc101223e5f'),(71,'plugin:commerce','m221027_070322_add_tax_shipping_category_soft_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','12a7d832-c9ce-4c2d-8364-d77918962c88'),(72,'plugin:commerce','m221027_074805_update_shipping_tax_category_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','827fee88-87d4-4b5f-aacd-789e592f1d3e'),(73,'plugin:commerce','m221028_192112_add_indexes_to_address_columns_on_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','df2a1531-c7fe-401a-8bf7-adf271e5fa0a'),(74,'plugin:commerce','m221122_055724_move_general_settings_to_per_store_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5118fafa-d72c-436c-b372-828422ba2d67'),(75,'plugin:commerce','m221122_055725_multi_store','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8c95f0d2-3e99-403c-a401-8229971f6ada'),(76,'plugin:commerce','m221122_155735_update_orders_shippingMethodHandle_default','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8630d687-f38e-4eb4-8aeb-3f86dbec66c9'),(77,'plugin:commerce','m221124_114239_add_date_deleted_to_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6dbc8a16-b885-4d08-8d16-14f0bb46a3bd'),(78,'plugin:commerce','m221206_094303_add_store_to_order','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','97c260cd-1d93-4988-9da8-cf4005883902'),(79,'plugin:commerce','m221213_052623_drop_lite','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4a4cb919-2b49-4fcf-9d5d-9857cec9e4d7'),(80,'plugin:commerce','m221213_070807_initial_storeId_records_transition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a5583b6c-a942-4168-9426-acb6f75f2e37'),(81,'plugin:commerce','m230103_122549_add_product_type_max_variants','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bfb0debb-cec9-48a3-a425-880302014cc0'),(82,'plugin:commerce','m230110_052712_site_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e4fc2759-4762-4bf0-9b93-378d1e987cbb'),(83,'plugin:commerce','m230111_112916_update_lineitems_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','99816f11-d8d6-402e-9784-b6cf1e04074c'),(84,'plugin:commerce','m230113_110914_remove_soft_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','dcf071af-7d51-4ec9-98f5-ce082522db13'),(85,'plugin:commerce','m230118_114424_add_purchasables_stores_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e2826c0a-c70e-4483-a60f-b7a422cc233a'),(86,'plugin:commerce','m230126_105337_rename_discount_sales_references','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b3b13f05-ac26-417d-94d4-11025ea261ba'),(87,'plugin:commerce','m230126_114655_add_catalog_pricing_rule_metadata_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1ccc35e8-15c7-47ab-947b-47d33aaad31a'),(88,'plugin:commerce','m230208_130445_add_store_id_to_shipping_categories','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','0175a345-120d-4146-b282-5d5262f35161'),(89,'plugin:commerce','m230210_093749_add_store_id_to_shipping_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4fcde55b-b00b-4f98-9f59-00b85c66dd81'),(90,'plugin:commerce','m230210_141514_add_store_id_to_shipping_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6a3021ff-df26-46ca-ad8d-ce16adb40de1'),(91,'plugin:commerce','m230214_094122_add_total_weight_column_to_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ebbca3a7-9c8d-4813-927d-ff4ca5589933'),(92,'plugin:commerce','m230214_095055_update_name_index_on_shipping_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','19139ad3-feaa-4ab8-9911-a295b219204a'),(93,'plugin:commerce','m230215_083820_add_order_condition_to_shipping_rules','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8b4b1c20-713c-4f54-8083-5905d3a4d40c'),(94,'plugin:commerce','m230215_114552_migrate_shipping_rule_conditions_to_condition_builder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','09b90034-2829-4db0-bac9-6dcde169b236'),(95,'plugin:commerce','m230217_095845_remove_shipping_rules_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b7533393-cb79-446e-bebd-99fcc62ed5ca'),(96,'plugin:commerce','m230217_143255_add_shipping_method_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','04e00277-60e1-4281-9b88-3959fe49794a'),(97,'plugin:commerce','m230220_075106_add_store_id_to_tax_rates','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e715c2b8-d1a7-4994-937d-b9661a87e3d5'),(98,'plugin:commerce','m230220_080107_add_store_id_to_tax_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','63924a53-c28c-48ae-8152-770ee383a3d9'),(99,'plugin:commerce','m230307_091520_add_sort_order_to_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','10237a03-0be9-4940-9a1f-eeb0586a4ef0'),(100,'plugin:commerce','m230308_084340_add_store_id_to_order_statuses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','479e1b0f-5204-47dd-b7b8-6950096454be'),(101,'plugin:commerce','m230310_102639_add_store_id_to_line_item_statuses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2f657d90-8f68-437e-9ab5-3c141d3ae36f'),(102,'plugin:commerce','m230313_095359_add_store_id_to_emails','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6b351e28-a4f8-4188-bc8e-378584604f6e'),(103,'plugin:commerce','m230317_102521_add_store_id_to_pdfs','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','244628f5-4e56-4c7e-99ed-b1024333ca85'),(104,'plugin:commerce','m230322_091615_move_email_settings_to_model','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a8f0d912-6061-4bc0-864f-5addd9f9deb5'),(105,'plugin:commerce','m230328_130343_move_pdf_settings_to_model','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','edda29cf-7791-47c1-a608-ecf6bc5df77e'),(106,'plugin:commerce','m230525_081243_add_has_update_pending_property','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b468089a-f83e-49f3-b4df-182a51dca0f4'),(107,'plugin:commerce','m230530_100604_add_complete_email_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7e75de98-70de-4792-ae2d-62338d0e7c77'),(108,'plugin:commerce','m230705_124845_add_save_address_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','38ba3551-7b87-4649-a5c6-ce11aa6c71d7'),(109,'plugin:commerce','m230719_082348_discount_nullable_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','468be260-47af-4304-9dda-48685eb35676'),(110,'plugin:commerce','m230724_080855_entrify_promotions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','296184c4-1eef-4208-8bcc-e563ccb2fd9d'),(111,'plugin:commerce','m230920_051125_move_primary_currency_to_store_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1ca89bf1-8d90-4aa8-8c16-f7b2d6e9d93a'),(112,'plugin:commerce','m230928_095544_fix_unique_on_some_tables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','de7b928e-81e9-46d1-a48a-9ca85307a3da'),(113,'plugin:commerce','m230928_155052_move_shipping_category_id_to_purchasable_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','cda4d52b-ee7e-4c3e-b9ac-263c382f64ce'),(114,'plugin:commerce','m231006_034833_add_indexes_for_source_address_on_order','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','f55445d4-0a13-4ed1-8ed3-67a45fd1d45d'),(115,'plugin:commerce','m231019_110814_update_variant_ownership','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','42415af7-a552-4e4a-ad90-f814dc4a4a9d'),(116,'plugin:commerce','m231110_081143_inventory_movement_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b8538b42-3524-4897-8056-42ef60dbe2da'),(117,'plugin:commerce','m231201_100454_update_discount_base_discount_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','18a95a80-b2ed-4fda-a3bb-c2141255c8dd'),(118,'plugin:commerce','m240119_073924_content_refactor_elements','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','874489bf-cc6f-4d0c-8077-2b23f61cc8cd'),(119,'plugin:commerce','m240119_075036_content_refactor_subscription_elements','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5176c1d6-2fa8-4a90-86ce-3b0cc4a73492'),(120,'plugin:commerce','m240208_083054_add_purchasable_stores_purchasable_fk','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','29caa140-2ce2-4fd2-bb53-8b2f8cc24ca4'),(121,'plugin:commerce','m240219_194855_donation_multi_store','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ad6faea1-0bb8-4fb8-999c-0efae783fd9c'),(122,'plugin:commerce','m240220_045806_product_versioning','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','279f6cb9-1108-439b-907c-aa0e4e35429e'),(123,'plugin:commerce','m240220_105746_remove_store_from_donations_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3eb5af0f-99ea-44a0-8579-7375ab7206d2'),(124,'plugin:commerce','m240221_030027_transfer_items','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2254100a-7cdd-4005-8b14-ceee5269c86c'),(125,'plugin:commerce','m240223_101158_update_recent_orders_widget_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','eee091ec-ed59-4c91-a385-799925adcdcc'),(126,'plugin:commerce','m240226_002943_remove_lite','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','00b6a5f4-7895-41bc-8e6a-57ccb3dbc4a1'),(127,'plugin:commerce','m240228_054005_rename_movements_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bf673434-13f4-4424-9a1b-5d9c1bc18570'),(128,'plugin:commerce','m240228_060604_add_fufilled_type_to_inventorytransactions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','63f2554b-42db-4652-a3b4-d78308067648'),(129,'plugin:commerce','m240228_120911_drop_order_id_and_make_line_item_cascade','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6c2c1ba4-0f98-416e-b4d3-d1c50ca05d80'),(130,'plugin:commerce','m240301_113924_add_line_item_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7c3c291f-84b6-4d0f-9a1b-b8b64c10b268'),(131,'plugin:commerce','m240306_091057_move_element_ids_on_discount_to_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','efff6932-eb2c-490d-9958-06db47b83618'),(132,'plugin:commerce','m240308_133451_tidy_shipping_categories','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','af77a30e-2c1a-437c-9762-60834fad0460'),(133,'plugin:commerce','m240313_131445_tidy_shipping_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1560f388-674b-4408-b727-f7c3f2a07ad4'),(134,'plugin:commerce','m240315_072659_add_fk_cascade_fixes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','81bc36f6-2c78-4a83-ab04-e07456f5a898'),(135,'plugin:commerce','m240430_161804_add_index_to_transaction_hash','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','05f00058-9ea3-4db5-ab25-8e4cf31d11ff'),(136,'plugin:commerce','m240507_081904_fix_store_pc_location','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3279a7fe-4ccd-46dd-8448-057fdc1e3427'),(137,'plugin:commerce','m240516_035616_update_permissions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a9223d9d-4791-498e-bae1-fea77c626a28'),(138,'plugin:commerce','m240516_035617_update_currency_and_store_general_permissions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ae26981a-2c27-49e6-9f05-fd88dc5572ee'),(139,'plugin:commerce','m240528_124101_add_extra_lineitem_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','fe5d2881-3d2b-4753-842a-753588bd8840'),(140,'plugin:commerce','m240529_095819_remove_commerce_user_field','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','fb488967-681c-451d-88d9-7f22d1492b9d'),(141,'plugin:commerce','m240605_110755_add_title_translations_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','687169b2-6db4-4289-aa08-84b2ddfd305a'),(142,'plugin:commerce','m240619_082224_add_product_and_variant_conditions_to_catalog_pricing_rules','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','32d6aff0-b768-44c4-9abe-58eb1d687fe5'),(143,'plugin:commerce','m240710_125204_ensure_shippingCategoryId_column_is_nullable','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','539bf392-11cf-48a2-973f-f4e5fff7d8d2'),(144,'plugin:commerce','m240711_092240_fix_fks','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','dda0f6e4-b5fa-431c-8da7-67723f7bcfc6'),(145,'plugin:commerce','m240715_045506_drop_available_if_exists','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','66eeb848-eedd-4290-8d37-a23cbe5ac71a'),(146,'plugin:commerce','m240717_044256_add_return_url_to_subscription','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','826ca2a9-0b56-403c-a5ef-ec187cffaa41'),(147,'plugin:commerce','m240718_073046_remove_sortOrder_variants_column_if_exists','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','525dd0b7-17cb-4de1-a7bf-31b69c78c191'),(148,'plugin:commerce','m240808_090256_cascade_delete_variants_on_product_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9a0f3c23-436a-407a-a52f-c1ebfecf515a'),(149,'plugin:commerce','m240808_093934_product_type_propagation','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','54a891a2-c77d-400f-b2ca-03e5bc0956df'),(150,'plugin:commerce','m240812_025615_add_transfer_details_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','da71e711-ae09-4281-b6b0-0c9783b3de70'),(151,'plugin:commerce','m240815_035618_fix_transfer_permission','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3bce0527-ba06-441b-be90-05c2223d8f2e'),(152,'plugin:commerce','m240830_081410_add_extra_indexes_to_catalog_pricing','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d260b057-fae1-4312-852f-a473ed69f628'),(153,'plugin:commerce','m240905_130549_add_require_coupon_code_discount_setting','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','44ffb96a-8358-42dd-94e2-111643288ed4'),(154,'plugin:commerce','m240906_105809_update_existing_coupon_discounts','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a3c4a637-1573-4dc9-bd54-42f85b871324'),(155,'plugin:commerce','m240906_115901_add_orderable_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','620b151b-27b0-4398-8fcf-ea0f9d094694'),(156,'plugin:commerce','m240923_132625_remove_orphaned_variants_sites','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','34a87a5e-c94d-471d-9399-fecddbbe588e'),(157,'plugin:commerce','m241010_061430_rename_orderable_product_type_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','03a88cb8-af4f-4fa0-9d54-790193bfdc76'),(158,'plugin:commerce','m241017_072151_fix_temp_skus','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1213dc37-b0a9-4e4a-bd0c-91c75e6286c4'),(159,'plugin:commerce','m241022_075144_add_missing_variant_revision_records','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a4f29225-62e4-4db4-82b4-529accbe35ae'),(160,'plugin:commerce','m241128_174712_fix_maxLevels_structured_productTypes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5f26fd4e-21c8-444c-b5ca-a9bc81ade2b2'),(161,'plugin:commerce','m241204_045158_enable_tax_rate','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2b7b2419-2da6-4279-ab59-44fe39c74a65'),(162,'plugin:commerce','m241204_091901_fix_store_environment_variables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','18e9613e-531d-42f4-b1d2-3bba983247a8'),(163,'plugin:commerce','m241213_083338_update_promotional_price_in_line_items','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ffa12e51-4e02-4517-ad34-247910795ae1'),(164,'plugin:commerce','m241219_071723_add_inventory_backorder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3be97a2a-4f38-446a-a76a-3597566e07ab'),(165,'plugin:commerce','m241220_082900_remove_inventory_for_non_inventory_purchasables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7a143972-f628-4e78-9278-3cfd7cda0aeb'),(166,'plugin:commerce','m250120_080035_move_to_tax_id_validators','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d5514635-753c-4f70-bb5d-451ba0d28a5a'),(167,'plugin:commerce','m250128_083515_add_make_primary_addresses_to_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','880a4522-217c-4920-8a4a-88447c47b880'),(168,'plugin:commerce','m250129_080909_fix_discount_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','98c9e7dd-e9b9-4b9f-b6f8-f38a9c4086a9'),(169,'plugin:commerce','m250210_125139_fix_cart_recalculation_modes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bfc18138-1cc0-408f-a42d-4f3c05e4c5ef'),(170,'plugin:commerce','m250301_120000_add_gateway_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5104b7f5-5ce2-43e2-8452-25b604486d4b'),(171,'plugin:commerce','m250401_091214_add_shipping_method_customer_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','99060cf4-d77b-4628-bc5c-8e9cad156ea3'),(172,'plugin:commerce','m250403_134328_add_shipping_rule_customer_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9132e3b1-640d-4a21-ae7e-e3d35fc9f277'),(173,'plugin:commerce','m250616_042356_fix_field_layout_id','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3045e4c5-266f-4974-9d91-cd87434dbc34'),(174,'plugin:commerce','m250617_105249_add_email_render_site_id','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','699fb72f-270f-4b78-828c-90e9c5d54a12'),(175,'plugin:commerce','m250701_054128_add_defaultVariant_idex_to_products','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','c409ee25-a29f-4604-86fc-808eaba140a1'),(176,'plugin:commerce','m250721_130616_fix_gateway_order_condition_pc','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','87b7d53c-db2e-48e8-8baa-b22882840a65'),(177,'plugin:commerce','m250731_020627_add_slug_options_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','27dc7c85-26b1-46fd-868a-2601ff12ecea'),(178,'plugin:commerce','m250815_120000_add_gateway_address_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','54bec4bc-e400-44da-bc57-a03efb4aff91'),(179,'plugin:commerce','m250919_111358_fix_methodId_shipping_rules_fk','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','78ccb51c-2057-49e2-9024-068280d79234'),(180,'plugin:commerce','m251003_120720_add_preview_targets_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','aa77b7dd-c2d1-4da8-8bdb-3d4b596a46bf'),(181,'plugin:commerce','m251028_095831_add_order_date_first_paid_property','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','71c83612-6244-4acc-ae4e-942432f0bc10'),(182,'plugin:commerce','m251030_094827_add_link_expiry_to_pdfs','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9bf25330-f53e-4f38-938e-0efe7f603b60'),(183,'plugin:commerce','m251105_194014_add_icon_and_color_to_categories_and_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4c8a7526-3dc9-43b1-9e2e-97dac636c53a'),(184,'plugin:commerce','m251111_092942_ensure_catalog_pricing_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9eb9c4ec-2aec-4cc4-953f-d134cea41318'),(185,'plugin:commerce','m251112_120000_fix_null_gateway_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3c78f6e4-d0ae-45c5-a9cc-b70cb88eaad2'),(186,'plugin:commerce','m260206_000000_add_ui_label_formats','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','30ab3700-d4f7-4c76-9780-755919923f08'),(188,'plugin:commerce','m260327_000000_ensure_link_expiry_on_pdfs','2026-05-06 11:40:20','2026-05-06 11:40:20','2026-05-06 11:40:20','398622ef-6a1f-401c-b83c-159622d08ce4'),(189,'module:verbb-auth','m221127_000000_install','2026-05-06 12:16:09','2026-05-06 12:16:09','2026-05-06 12:16:09','bb873229-63c0-4a7a-b54c-1fac41002f21'),(244,'plugin:commerce','m260506_000000_fix_fulfilled_check_constraint','2026-05-12 00:30:05','2026-05-12 00:30:05','2026-05-12 00:30:05','7e50a574-fea0-4662-a88a-406721ed91d7'),(245,'plugin:ckeditor','m260220_182920_drop_cke_configs','2026-05-12 00:46:53','2026-05-12 00:46:53','2026-05-12 00:46:53','a0706479-8667-4920-850f-b9bcfdcf8dd7'),(246,'plugin:formie','Install','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','dc94cb84-f909-46ae-8fe3-8da11ed5a528'),(247,'plugin:formie','m231125_000000_craft5','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','d4263ab5-6326-47a8-a4f1-78b2e374961a'),(248,'plugin:formie','m231129_000000_integrations_mapping','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','fe52872b-abcf-49a3-acb0-a5d2611320ef'),(249,'plugin:formie','m231130_000000_conditions_mapping','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','0751696b-5c5c-41b8-96b4-3af9dd7b9694'),(250,'plugin:formie','m231202_000000_auth_module','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','e983e74c-45ca-4b0f-8b29-cc107121a3c6'),(251,'plugin:formie','m240130_000000_permissions','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','31c3db37-46a9-49ee-9053-2de4a8a5ec8e'),(252,'plugin:formie','m240313_000000_subfields','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','e8f1d99f-d7d7-47f2-bd53-0d4cfe2f982c'),(253,'plugin:formie','m240318_000000_fix_content_table','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','2ea1daaf-aaa7-4716-b936-9d140ebdd3f0'),(254,'plugin:formie','m240318_000000_migrate_stencils','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','70b03320-1ce1-4d21-bbf2-edd4b0351b0c'),(255,'plugin:formie','m240318_000000_notification_fields','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','cfd36537-882c-4fc1-85e9-3bd63a04e6fe'),(256,'plugin:formie','m240325_000000_notifications_custom_settings','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','7164a483-b3ab-4315-a6b6-353c457dca25'),(257,'plugin:formie','m240407_000000_payment_fk','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','247f1af2-9084-4ada-8ef0-7b4866731be4'),(258,'plugin:formie','m240507_000000_entry_integration_ids','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','a5515d34-c1e8-42ed-963d-cb8a8593050b'),(259,'plugin:formie','m240528_000000_payment_fk','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','9dba7f34-fbb0-4c3d-a30a-50d31fffbb2e'),(260,'plugin:formie','m240614_000000_klaviyo','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','1fe70667-5636-43a9-a16b-e0704af587dc'),(261,'plugin:formie','m240807_000000_migrate_date_field_datetime','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','1f18cb77-3515-49a0-9d8f-5786f789b5cd'),(262,'plugin:formie','m241128_000000_user_group_integrations','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','8fe24925-d1d4-41fb-80d8-3d8ca7e02fb4'),(263,'plugin:formie','m241128_100000_entry_integrations','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','e9d6e7f5-6690-456d-9ac4-0d8fa1320c01'),(264,'plugin:formie','m250113_000000_calculations','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','d97264e1-1df8-41b3-a9fc-abc0bb7d241a'),(265,'plugin:formie','m250114_000000_email_blocked_domains','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','e1880825-2aba-420e-96bf-4dfce15d030b'),(266,'plugin:formie','m250117_000000_date_year_min','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','a6c73e3f-806d-4b34-b43d-e0b2dbc8a876'),(267,'plugin:formie','m250516_000000_payment_redirect','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','a0d11c48-d783-4c95-8f59-3a7f95ab5b8d'),(268,'plugin:formie','m250711_000000_fix_element_field_source_ids','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','e1a8386e-30e4-4b22-8ee6-08084309a90c'),(269,'plugin:formie','m250806_000000_integrations_optin','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','c2d9ab6a-0958-495c-9dd9-d3429d14fbff'),(270,'plugin:formie','m251014_000000_date_subfields','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','5cdf184d-e3d9-44c5-9899-170f396b7980'),(271,'plugin:formie','m251114_000000_email_conditions_mapping','2026-05-13 14:22:02','2026-05-13 14:22:02','2026-05-13 14:22:02','ca49b86b-ed8b-4634-8c22-d6ffdaf55520'),(272,'plugin:aws-s3','Install','2026-05-13 14:22:07','2026-05-13 14:22:07','2026-05-13 14:22:07','bb459210-b772-44f9-927f-c99ed9c677a0'),(273,'plugin:aws-s3','m220119_204627_update_fs_configs','2026-05-13 14:22:07','2026-05-13 14:22:07','2026-05-13 14:22:07','fafc466f-e26b-4cf5-8ea0-ba795254ada3');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'commerce','5.6.4','5.6.1.2','2026-03-12 17:49:17','2026-03-12 17:49:17','2026-05-12 03:15:50','fc99f9b1-ebab-48f9-8746-3501fdf82681'),(2,'vite','5.0.1','1.0.0','2026-03-12 18:04:30','2026-03-12 18:04:30','2026-03-12 18:04:30','5a4488a1-979f-4c7a-9e26-4804ac550b89'),(7,'ckeditor','5.5.0','5.0.0.1','2026-05-12 00:46:53','2026-05-12 00:46:53','2026-05-12 03:15:49','d8c63478-7782-42d5-9e99-43c70637e4a1'),(8,'formie','3.1.23','3.4.12','2026-05-13 14:22:00','2026-05-13 14:22:00','2026-05-13 14:22:00','987b1338-7863-4cf3-886e-357c571e67bb'),(9,'aws-s3','2.3.0','2.0','2026-05-13 14:22:07','2026-05-13 14:22:07','2026-05-13 14:22:07','561cb327-6083-498c-abf5-5922f628ca14');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.elementType','null'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.handle','\"dummy\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.isFrontendEnabled','true'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.name','\"Dummy\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\orders\\\\GatewayOrderCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.elementType','\"craft\\\\commerce\\\\elements\\\\Order\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.paymentType','\"purchase\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.elementType','null'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.sortOrder','99'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.type','\"craft\\\\commerce\\\\gateways\\\\Dummy\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.color','\"green\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.default','true'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.description','null'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.handle','\"new\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.name','\"New\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.sortOrder','99'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.store','\"645bb423-5466-4a2c-a05f-ceeb31bac6e5\"'),('commerce.sitestores.2589bc8f-a277-4da6-ae5f-f294f779bc87.store','\"645bb423-5466-4a2c-a05f-ceeb31bac6e5\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowCheckoutWithoutPayment','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowEmptyCartOnCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowPartialPaymentOnCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetCartShippingMethodOption','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetNewCartAddresses','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetPaymentSource','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.currency','\"USD\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.freeOrderPaymentStrategy','\"complete\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.handle','\"primary\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.minimumTotalPriceStrategy','\"default\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.name','\"Primary\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.orderReferenceFormat','\"{{number[:7]}}\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.primary','true'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireBillingAddressAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireShippingAddressAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireShippingMethodSelectionAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.sortOrder','99'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.useBillingAddressForTax','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.validateOrganizationTaxIdAsVatId','false'),('dateModified','1778695122'),('email.fromEmail','\"jerry@charliesbarkery.com\"'),('email.fromName','\"charlies\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.allowLineBreaksInTitles','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.color','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.description','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.cardThumbAlignment','\"end\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elementCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.dateAdded','\"2026-03-25T14:51:44+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.conditionRules.0.uid','\"2374da6a-41f3-45c7-a6f7-dd91cea4950b\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.conditionRules.0.values.0','\"contact\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.uid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.dateAdded','\"2026-04-04T04:31:41+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.uid','\"29202f5a-fbae-4c90-bec0-7f7518841fa3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.values.0','\"callToAction\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.fieldUid','\"dc36f051-fd02-4e59-bf63-204e8eccf224\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.uid','\"2d498e12-8f05-456e-aed4-cde0a37e8217\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.dateAdded','\"2026-05-09T04:09:57+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"2ae683ea-ff99-4bb1-bf4c-e84e6f562847\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.values.0','\"cardGrid\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.fieldUid','\"6671498f-b940-4c47-a8d5-1de96b0bd763\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.uid','\"2a3bcb22-2710-4671-a485-593335ab29a9\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.dateAdded','\"2026-05-13T17:58:42+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.fieldUid','\"564a4360-56ee-4b5a-ba0a-01f13d394fa5\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.uid','\"48c1f09c-c1d6-446f-92fb-c44e9f515bc3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.dateAdded','\"2026-03-25T14:51:44+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.uid','\"13565fba-b2f9-432c-b4f9-ef1b99eb911c\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.values.0','\"hero\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.fieldUid','\"d2dbcdc7-ca53-408a-8df4-99d795133201\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.uid','\"67c0702d-602b-4460-a842-68b69569157a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.dateAdded','\"2026-03-28T22:01:46+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.conditionRules.0.uid','\"0ae1e2fd-df8a-4f54-86b8-b48ca05f67ff\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.conditionRules.0.values.0','\"productCarousel\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.fieldUid','\"0119d5ec-bfd1-4692-a006-407e05e36d20\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.uid','\"57c417d6-920f-49f6-a35f-d01401a86a3d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.5.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.dateAdded','\"2026-03-28T23:22:29+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.conditionRules.0.uid','\"33120c20-0409-43bd-9a82-e4e454039d9f\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.conditionRules.0.values.0','\"splitSection\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.fieldUid','\"46d1905d-56db-493d-90c0-5de9d9910388\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.uid','\"dbb8f982-78f2-48c4-8258-217588847319\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.6.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.dateAdded','\"2026-05-13T14:42:35+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.conditionRules.0.uid','\"faa4e08d-b6ed-4d84-be81-2d983c7a77e4\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.conditionRules.0.values.0','\"subscribe\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.fieldUid','\"231b19ec-9923-4689-ad97-450bdcd8ca3a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.uid','\"952bf88c-85d0-4bdc-9c9a-38247f374055\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.7.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.dateAdded','\"2026-05-12T03:22:49+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.conditionRules.0.uid','\"dd64e939-9590-4119-8d13-bc890e040902\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.conditionRules.0.values.0','\"timeline\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.fieldUid','\"e85b17b1-d20e-4121-a465-aa688b1ebfa5\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.uid','\"a550e24e-d987-47d6-a8c4-f48df23f7934\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.8.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.name','\"Content\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.uid','\"2bda75ac-9d20-4c73-95d6-b9b86ee9722a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.thumbFieldKey','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.handle','\"pageBlocksEntry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.hasTitleField','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.icon','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.name','\"Page Blocks Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.showSlugField','true'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.showStatusField','true'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.slugTranslationKeyFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.slugTranslationMethod','\"site\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleTranslationKeyFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleTranslationMethod','\"site\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.uiLabelFormat','\"{title}\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.allowLineBreaksInTitles','false'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.color','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.description','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.cardThumbAlignment','\"end\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elementCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.autocapitalize','true'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.autocomplete','false'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.autocorrect','true'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.class','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.dateAdded','\"2026-05-12T03:30:32+00:00\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.disabled','false'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.elementCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.id','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.inputType','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.instructions','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.label','\"Year\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.max','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.min','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.name','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.orientation','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.placeholder','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.readonly','false'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.required','true'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.size','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.step','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.tip','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.title','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.uid','\"420c9f98-83b7-43dd-ba50-d00baebcc402\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.userCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.warning','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.0.width','100'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.dateAdded','\"2026-05-12T03:35:24+00:00\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.editCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.elementCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.fieldUid','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.handle','\"event\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.instructions','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.label','\"Event\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.required','false'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.tip','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.uid','\"915ddcc2-ca76-4f28-a64f-862b4b151d0d\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.userCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.warning','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.1.width','100'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.dateAdded','\"2026-05-12T03:35:24+00:00\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.editCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.elementCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.fieldUid','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.handle','\"eventDetails\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.instructions','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.label','\"Event Details\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.required','false'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.tip','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.uid','\"0b783164-c4fd-4198-8743-2cc921953e69\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.userCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.warning','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.elements.2.width','100'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.name','\"Content\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.uid','\"289a9302-7801-434a-b2fd-6d9648f8ba97\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.tabs.0.userCondition','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.fieldLayouts.c53f7454-c7e8-4ad7-93dd-b63f082d7af1.thumbFieldKey','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.handle','\"timelineMatrixEntry\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.hasTitleField','true'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.icon','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.name','\"Entry — Timeline Matrix\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.showSlugField','true'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.showStatusField','true'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.slugTranslationKeyFormat','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.slugTranslationMethod','\"site\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.titleFormat','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.titleTranslationKeyFormat','null'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.titleTranslationMethod','\"site\"'),('entryTypes.314fa8ad-a55f-4f35-9895-de1a13de0a96.uiLabelFormat','\"{title}\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.allowLineBreaksInTitles','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.color','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.description','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.cardThumbAlignment','\"end\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elementCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.autocapitalize','true'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.autocomplete','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.autocorrect','true'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.class','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.dateAdded','\"2026-05-13T17:44:17+00:00\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.disabled','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.elementCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.id','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.inputType','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.instructions','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.label','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.max','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.min','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.name','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.orientation','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.placeholder','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.readonly','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.required','true'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.size','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.step','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.tip','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.title','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.uid','\"972155eb-a924-4e7a-9c93-c9a86bb31231\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.userCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.warning','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.0.width','100'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.dateAdded','\"2026-05-13T17:47:06+00:00\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.editCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.elementCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.fieldUid','\"c2d9c750-d7f6-412a-822c-7571172f15a5\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.handle','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.instructions','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.label','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.required','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.tip','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.uid','\"fb1ef273-544d-4bb2-8327-37360e8b947f\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.userCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.warning','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.1.width','100'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.dateAdded','\"2026-05-13T17:47:06+00:00\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.editCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.elementCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.fieldUid','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.handle','\"subTitle\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.instructions','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.label','\"Sub Title\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.required','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.tip','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.uid','\"76f2b622-3531-4351-88e6-da1a07d1f6da\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.userCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.warning','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.2.width','100'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.dateAdded','\"2026-05-13T17:47:06+00:00\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.editCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.elementCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.fieldUid','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.handle','\"copy\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.instructions','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.label','\"Copy\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.required','false'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.tip','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.uid','\"3fc2daa6-83ef-4973-bc45-ff738ac33d28\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.userCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.warning','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.elements.3.width','100'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.name','\"Content\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.uid','\"73d951d3-c34b-46d3-89c9-d42e25ae3417\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.tabs.0.userCondition','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.fieldLayouts.6a69c341-021f-473e-a7a1-55fedef5d20d.thumbFieldKey','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.handle','\"contactMatrixEntry\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.hasTitleField','true'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.icon','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.name','\"Contact Matrix Entry\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.showSlugField','true'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.showStatusField','true'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.slugTranslationKeyFormat','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.slugTranslationMethod','\"site\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.titleFormat','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.titleTranslationKeyFormat','null'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.titleTranslationMethod','\"site\"'),('entryTypes.32df88de-3497-4bb2-8385-f85a301ab403.uiLabelFormat','\"{title}\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.allowLineBreaksInTitles','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.color','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.description','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.cardThumbAlignment','\"end\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elementCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.dateAdded','\"2026-05-09T04:08:27+00:00\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.editCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.elementCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.elementEditCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.fieldUid','\"c2d9c750-d7f6-412a-822c-7571172f15a5\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.handle','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.instructions','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.label','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.required','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.tip','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.uid','\"30f3b05b-923f-4ac2-891c-c772b3aa5f34\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.userCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.warning','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.0.width','100'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.autocapitalize','true'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.autocomplete','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.autocorrect','true'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.class','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.dateAdded','\"2026-05-09T04:05:37+00:00\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.disabled','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.elementCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.id','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.inputType','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.instructions','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.label','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.max','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.min','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.name','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.orientation','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.placeholder','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.readonly','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.required','true'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.size','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.step','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.tip','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.title','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.uid','\"edd241c2-9d84-4da0-a459-69f878a7e21d\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.userCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.warning','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.1.width','100'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.dateAdded','\"2026-05-09T04:08:27+00:00\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.editCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.elementCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.fieldUid','\"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.handle','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.instructions','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.label','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.required','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.tip','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.uid','\"4a92b64a-46cf-4608-a131-af258f11ddf0\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.userCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.warning','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.2.width','100'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.dateAdded','\"2026-05-09T04:08:27+00:00\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.editCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.elementCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.fieldUid','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.handle','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.instructions','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.label','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.required','false'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.tip','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.uid','\"d453f403-5d29-477c-9328-c1888e77bc6a\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.userCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.warning','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.elements.3.width','100'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.name','\"Content\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.uid','\"3b7af4f8-0b49-4f69-8059-d48ed5bdadb1\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.tabs.0.userCondition','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.fieldLayouts.6f926f6d-a1ea-4cd8-bc09-24233805c2ee.thumbFieldKey','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.handle','\"cardMatrixEntry\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.hasTitleField','true'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.icon','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.name','\"Entry — Card Matrix\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.showSlugField','true'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.showStatusField','true'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.slugTranslationKeyFormat','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.slugTranslationMethod','\"site\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.titleFormat','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.titleTranslationKeyFormat','null'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.titleTranslationMethod','\"site\"'),('entryTypes.62025e7c-d31e-4ea1-a778-df0457c8317a.uiLabelFormat','\"{title}\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.allowLineBreaksInTitles','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.color','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.description','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.cardThumbAlignment','\"end\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocomplete','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocorrect','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.class','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.dateAdded','\"2026-03-25T14:44:46+00:00\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.disabled','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.id','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.inputType','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.instructions','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.label','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.max','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.min','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.name','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.orientation','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.placeholder','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.readonly','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.required','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.size','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.step','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.tip','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.title','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.uid','\"33eaf735-2da8-403c-8230-8505eabf00a4\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.warning','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.width','100'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.dateAdded','\"2026-03-25T15:34:31+00:00\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.editCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.fieldUid','\"e91396d1-d7c4-4b1b-a3e9-55972a84ff9c\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.handle','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.instructions','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.label','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.required','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.tip','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.uid','\"fb60420e-7f69-437a-8dcb-a6054958208f\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.warning','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.width','100'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.name','\"Content\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.uid','\"bee69b4e-5d3a-4aa2-aa9e-e0e3e517671d\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.thumbFieldKey','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.handle','\"pageEntry\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.hasTitleField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.icon','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.name','\"Entry — Page\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.showSlugField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.showStatusField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.slugTranslationKeyFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.slugTranslationMethod','\"site\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleTranslationKeyFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleTranslationMethod','\"site\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.uiLabelFormat','\"{title}\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.columnSuffix','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.handle','\"productCarouselBlock\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.instructions','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.name','\"Block — Product Carousel\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.searchable','false'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.settings.viewMode','\"grouped\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.translationKeyFormat','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.translationMethod','\"site\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.columnSuffix','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.handle','\"timelineMatrix\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.instructions','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.name','\"Matrix — Timeline\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.searchable','false'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.createButtonLabel','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.defaultIndexViewMode','\"cards\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.enableVersioning','false'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.entryTypes.0.__assoc__.0.1','\"314fa8ad-a55f-4f35-9895-de1a13de0a96\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.includeTableView','false'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.maxEntries','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.minEntries','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.pageSize','50'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.propagationKeyFormat','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.propagationMethod','\"all\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.showCardsInGrid','false'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.settings.viewMode','\"cards\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.translationKeyFormat','null'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.translationMethod','\"site\"'),('fields.07b62ac5-22b7-42e6-8930-c48a79658ed1.type','\"craft\\\\fields\\\\Matrix\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.columnSuffix','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.handle','\"contactMatrix\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.instructions','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.name','\"Contact Matrix\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.searchable','false'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.createButtonLabel','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.defaultIndexViewMode','\"cards\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.enableVersioning','false'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.entryTypes.0.__assoc__.0.1','\"32df88de-3497-4bb2-8385-f85a301ab403\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.includeTableView','false'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.maxEntries','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.minEntries','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.pageSize','50'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.propagationKeyFormat','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.propagationMethod','\"all\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.showCardsInGrid','false'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.settings.viewMode','\"cards\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.translationKeyFormat','null'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.translationMethod','\"site\"'),('fields.1686a50c-1e1c-41a1-a2be-68b75ae85cbd.type','\"craft\\\\fields\\\\Matrix\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.columnSuffix','null'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.handle','\"subscribeblock\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.instructions','null'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.name','\"Block — Subscribe \"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.searchable','false'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.0','\"7bde2698-f55f-4093-ae03-379a11ae9c7a\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"306fc606-f6c2-4ecc-95c5-7045beac8b99\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"sectionThemeBackground\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"7c4edaa8-604a-48d2-a947-3388823e3b2b\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Section Theme Background\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-05-13T14:23:46+00:00\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"7a8c674e-47d9-4d72-a516-b7816ccc6c4f\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"eyebrow\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Eyebrow\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-05-13T14:21:46+00:00\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"fb2b2297-a46e-4b45-b61b-84c1fa9eb5f2\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"header\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Header\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-05-13T14:21:46+00:00\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"d1347db1-911d-4bca-a089-d27833338262\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"content\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"Content\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-05-13T14:21:46+00:00\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"bf1ba574-e8c7-4fac-87ac-e22929847953\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"ea57733c-b37f-4fd3-b7bf-ad80ce561f3f\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','100'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-05-13T14:23:14+00:00\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"57c13cd0-bf26-4bac-822b-aba5d9d274ef\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.settings.viewMode','\"grouped\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.translationKeyFormat','null'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.translationMethod','\"site\"'),('fields.231b19ec-9923-4689-ad97-450bdcd8ca3a.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.columnSuffix','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.handle','\"blockType\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.instructions','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.name','\"Block Type\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.searchable','false'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.customOptions','false'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.0.1','\"Call To Action \"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.1.1','\"callToAction\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.0.1','\"Card Grid\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.1.1','\"cardGrid\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.0.1','\"Contact\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.1.1','\"contact\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.0.1','\"Hero\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.1.1','\"hero\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.0.1','\"Product Carousel\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.1.1','\"productCarousel\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.4.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.0.1','\"Split Section\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.1.1','\"splitSection\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.5.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.0.1','\"Timeline\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.1.1','\"timeline\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.6.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.0.1','\"Subscribe\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.1.1','\"subscribe\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.7.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.translationKeyFormat','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.translationMethod','\"none\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.columnSuffix','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.handle','\"splitSectionBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.instructions','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.name','\"Block — Split Section\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.searchable','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.0','\"d8e5ef18-5837-4a24-af05-b595b119f921\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"c9261752-57ce-419e-a60c-f5cbb1a1067e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"imageRight\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Image Right\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.3.0','\"instructions\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.3.1','\"The image displays on the left by default. Enable this to move it to the right\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-03-28T23:20:57+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"7c4edaa8-604a-48d2-a947-3388823e3b2b\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-05-12T03:01:47+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"b1fc4697-c4a0-457e-be69-38665a393900\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"c2d9c750-d7f6-412a-822c-7571172f15a5\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"0b92e79b-252c-4fdd-9467-b23f1b66911f\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"eyebrow\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"eyebrow\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"4d44aae0-e56d-4315-bfaa-83937eb0421d\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.1','\"heading\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.1','\"Heading\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','75'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"f075b188-d366-4033-b4ba-472195410663\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.12.1','\"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.7.1','100'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.9.1','\"83858805-a6cd-43b6-9279-0edcf7240fb8\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.1.1','\"badge\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.2.1','\"Badge\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.4.0','\"tip\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.4.1','\"enable a badge on the image.\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.8.1','\"2026-03-28T23:15:12+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.9.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.1.1','\"badgeOverlay\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.0','\"elementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.0.0','\"elementType\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.1.0','\"fieldContext\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.1.1','\"global\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.2.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.0','\"conditionRules\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.1','\"e68405db-0928-4c2f-b930-df879cc9bb47\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.2.1','\"Badge Overlay\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.4.0','\"tip\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.4.1','\"When the Badge is enabled, it defaults to overlay mode. If this lightswitch is turned on, the badge will display in the corner instead.\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.8.1','\"2026-03-28T23:24:31+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.9.1','\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.1.1','\"badgeText\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.0','\"elementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.0.0','\"elementType\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.1.0','\"fieldContext\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.1.1','\"global\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.2.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.0','\"conditionRules\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.1','\"b87c08e7-328c-4388-a980-57e694f7e449\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.2.1','\"Badge Text\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.8.1','\"2026-03-28T23:25:42+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.9.1','\"5fd7f09f-bfc0-43e2-a982-7242517a38df\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.1.1','\"badgeSubText\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.0','\"elementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.0.0','\"elementType\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.1.0','\"fieldContext\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.1.1','\"global\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.2.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.0','\"conditionRules\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.1','\"585f14d6-aaeb-4c32-baa7-1afa136721db\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.1.1','\"110eb17b-884e-4aca-bee4-16acd14b8bfb\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.4.1','\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.2.1','\"Badge Sub Text\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.8.1','\"2026-04-03T16:21:09+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.9.1','\"a9fd0a03-657f-4952-9c55-566045985717\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.viewMode','\"grouped\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.translationKeyFormat','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.translationMethod','\"site\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.columnSuffix','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.handle','\"plainText\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.instructions','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.name','\"Plain Text\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.searchable','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.byteLimit','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.charLimit','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.code','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.initialRows','4'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.multiline','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.placeholder','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.uiMode','\"normal\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.translationKeyFormat','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.translationMethod','\"none\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.type','\"craft\\\\fields\\\\PlainText\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.columnSuffix','null'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.handle','\"contactBlock\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.instructions','null'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.name','\"Block — Contact\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.searchable','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.0','\"2f050593-eacf-497a-9408-25c5de09b145\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"1e1c8807-6ced-496e-a5ea-a687285ae464\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrow\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-05-13T17:47:35+00:00\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"407511f6-7e16-42bb-8a88-b6f671292763\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"header\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Header\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-05-13T17:47:35+00:00\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"927b451e-7c8e-4c0f-a938-6686349bfb94\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"content\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Content\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-05-13T17:47:35+00:00\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"913d7fae-fcaf-45c7-a7eb-768408fea4f1\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"ea57733c-b37f-4fd3-b7bf-ad80ce561f3f\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-05-13T17:47:35+00:00\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"0891567b-3219-4f59-af92-594e0f0dfed0\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.0','\"handle\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.1','\"formCallOut\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.0','\"label\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.1','\"Form Call Out\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','100'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-05-13T17:47:35+00:00\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"3e52be7b-01a5-49fa-ac8f-66b9099a2124\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.0.0','\"type\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.12.0','\"fieldUid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.12.1','\"1686a50c-1e1c-41a1-a2be-68b75ae85cbd\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.6.0','\"required\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.6.1','false'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.7.0','\"width\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.7.1','100'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.8.0','\"dateAdded\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.8.1','\"2026-05-13T17:47:35+00:00\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.9.0','\"uid\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.9.1','\"e6d1dd52-bf7e-4aff-ac40-3cc81ddc9cd6\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.settings.viewMode','\"grouped\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.translationKeyFormat','null'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.translationMethod','\"site\"'),('fields.564a4360-56ee-4b5a-ba0a-01f13d394fa5.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.columnSuffix','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.handle','\"linkField\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.instructions','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.name','\"Link Field\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.searchable','false'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.0','\"target\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.1','\"title\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.2','\"id\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.3','\"download\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.4','\"class\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.fullGraphqlData','true'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.maxLength','255'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.showLabelField','true'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.0','\"entry\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.1','\"url\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.2','\"asset\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.3','\"category\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.4','\"email\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.5','\"tel\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.6','\"product\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"allowedKinds\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.0','\"image\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.1','\"pdf\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.2','\"text\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.3','\"video\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.4','\"word\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"showUnpermittedVolumes\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedFiles\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.0','\"url\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowAnchors\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"1\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.translationKeyFormat','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.translationMethod','\"none\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.type','\"craft\\\\fields\\\\Link\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.columnSuffix','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.handle','\"richTextEditor\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.instructions','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.name','\"Rich Text Editor\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.searchable','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.advancedLinkFields','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.availableTransforms','\"\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.availableVolumes','\"\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.characterLimit','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.css','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.cssFile','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.defaultTransform','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.defaultUploadLocationSubpath','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.defaultUploadLocationVolume','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.fullGraphqlData','true'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.0','\"1\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.1','\"2\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.2','\"3\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.3','\"4\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.4','\"5\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.5','\"6\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.imageEntryTypeUid','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.imageFieldUid','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.imageMode','\"img\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.js','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.jsFile','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.options','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.parseEmbeds','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.purifierConfig','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.purifyHtml','true'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.showUnpermittedFiles','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.showUnpermittedVolumes','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.showWordCount','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.0','\"heading\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.1','\"|\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.2','\"bold\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.3','\"italic\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.4','\"link\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.5','\"bulletedList\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.wordLimit','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.translationKeyFormat','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.translationMethod','\"none\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.columnSuffix','null'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.handle','\"cardGridBlock\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.instructions','null'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.name','\"Block — Card Grid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.searchable','false'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.0','\"e9fe687e-4fbb-47a6-a1c3-4930c3c04600\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"289e6079-4559-4bf1-a95e-5db2d9014e51\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"sectionBackgroundColor\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"7c4edaa8-604a-48d2-a947-3388823e3b2b\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Section Background Color\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-05-09T05:00:55+00:00\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"6b64b506-24d4-4971-88d7-d868e9d9714b\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"eyebrowText\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Eyebrow Text\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-05-09T04:05:11+00:00\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"33406d90-7e53-4c8f-9975-2dde40f485bf\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"header\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Header\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-05-09T04:05:11+00:00\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"7158299d-b9a4-4991-84f0-b575c0883bf5\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"subHeader\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"Sub Header\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-05-09T04:05:11+00:00\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"eabf45a4-573f-4a0d-97de-29c9efa0728e\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"bb71e142-3e9f-4467-9d03-43e288eb4bc0\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','100'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-05-09T04:08:48+00:00\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"512aa64b-20b2-4b34-8bf9-8d81ec78d167\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.settings.viewMode','\"grouped\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.translationKeyFormat','null'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.translationMethod','\"site\"'),('fields.6671498f-b940-4c47-a8d5-1de96b0bd763.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.columnSuffix','null'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.handle','\"color\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.instructions','null'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.name','\"Color\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.searchable','false'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.customOptions','false'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.0.0','\"label\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.0.1','\"White\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.1.0','\"value\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.1.1','\"white\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.2.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.3.0','\"color\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.3.1','\"#ffffff\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.4.0','\"default\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.0.__assoc__.4.1','\"1\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.0.0','\"label\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.0.1','\"Charcoal\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.1.0','\"value\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.1.1','\"charcoal\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.2.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.3.0','\"color\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.3.1','\"#29323d\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.4.0','\"default\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.1.__assoc__.4.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.0.0','\"label\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.0.1','\"Teal\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.1.0','\"value\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.1.1','\"teal\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.2.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.3.0','\"color\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.3.1','\"#0ed3c8\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.4.0','\"default\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.2.__assoc__.4.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.0.0','\"label\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.0.1','\"Bronze\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.1.0','\"value\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.1.1','\"bronze\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.2.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.3.0','\"color\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.3.1','\"#b67236\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.4.0','\"default\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.settings.options.3.__assoc__.4.1','\"\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.translationKeyFormat','null'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.translationMethod','\"none\"'),('fields.7c4edaa8-604a-48d2-a947-3388823e3b2b.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.columnSuffix','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.handle','\"cardsMatrix\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.instructions','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.name','\"Matrix — Cards\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.searchable','false'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.createButtonLabel','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.defaultIndexViewMode','\"cards\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.enableVersioning','false'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.entryTypes.0.__assoc__.0.1','\"62025e7c-d31e-4ea1-a778-df0457c8317a\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.includeTableView','false'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.maxEntries','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.minEntries','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.pageSize','50'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.propagationKeyFormat','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.propagationMethod','\"all\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.showCardsInGrid','false'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.settings.viewMode','\"cards\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.translationKeyFormat','null'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.translationMethod','\"site\"'),('fields.bb71e142-3e9f-4467-9d03-43e288eb4bc0.type','\"craft\\\\fields\\\\Matrix\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.columnSuffix','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.handle','\"images\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.instructions','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.name','\"Image(s)\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.searchable','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowedKinds','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowSelfRelations','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowSubfolders','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowUploads','true'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.branchLimit','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.defaultPlacement','\"end\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.defaultUploadLocationSource','\"volume:ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.defaultUploadLocationSubpath','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.maintainHierarchy','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.maxRelations','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.minRelations','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.previewMode','\"full\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictedDefaultUploadSubpath','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictedLocationSource','\"volume:ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictedLocationSubpath','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictFiles','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictLocation','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.selectionLabel','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showSearchInput','true'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showSiteMenu','true'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showUnpermittedFiles','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showUnpermittedVolumes','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.sources','\"*\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.targetSiteId','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.validateRelatedElements','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.viewMode','\"list\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.translationKeyFormat','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.translationMethod','\"none\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.type','\"craft\\\\fields\\\\Assets\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.columnSuffix','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.handle','\"lighswitch\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.instructions','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.name','\"lighswitch\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.searchable','false'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.default','false'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.offLabel','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.onLabel','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.showLabelsInCards','false'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.translationKeyFormat','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.translationMethod','\"none\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.columnSuffix','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.handle','\"heroBlock\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.instructions','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.name','\"Block — Hero\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.searchable','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.0','\"4a670768-d431-43e7-9622-21d72c90f053\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"64586fe6-dda7-4d89-b978-a3e651f56501\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrowText\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow Text\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"3db4929f-d6dd-47ab-bb3b-1352061a74ac\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"headline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Headline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"Subheadline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Subheadline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"86a9bff4-35a7-4748-8dce-ad0e3139a069\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"button\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"Button\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"c53d75b5-67d6-47b2-b41a-327f91a1c146\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.1','\"buttonTwo\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.1','\"Button Two\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.viewMode','\"grouped\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.translationKeyFormat','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.translationMethod','\"site\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.columnSuffix','null'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.handle','\"callToActionBlock\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.instructions','null'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.name','\"Block — Call To Action\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.searchable','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.0','\"741d3f3d-ba77-49c2-8006-ce53f9a6df52\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"ccbd6b59-b565-46aa-88f6-6f32433c31c5\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrow\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"fb8347f5-df64-4639-8907-a7e8845b4e12\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"heading\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Heading\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"28b90100-b662-46d8-b047-acc05be249bd\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"subHeader\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Sub Header\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"d9cf0d28-62bf-4618-844e-ca96058c834a\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.viewMode','\"grouped\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.translationKeyFormat','null'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.translationMethod','\"site\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.columnSuffix','null'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.handle','\"timelineBlock\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.instructions','null'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.name','\"Block — Timeline\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.searchable','false'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.0','\"9fed5cee-da60-4919-b0bb-dd3a82e2e158\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"afe39fe2-fd09-417a-8d3c-55664998c232\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrow\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-05-12T03:29:36+00:00\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"09ff7d5e-e23f-4a74-9d6a-9e05a17b5a8c\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"header\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Header\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-05-12T03:29:36+00:00\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"e802b542-1048-4c16-99ea-5e3da1e5c867\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"07b62ac5-22b7-42e6-8930-c48a79658ed1\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-05-12T03:31:57+00:00\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"4928ee04-f500-4b08-932f-69c52bfede2c\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.settings.viewMode','\"grouped\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.translationKeyFormat','null'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.translationMethod','\"site\"'),('fields.e85b17b1-d20e-4121-a465-aa688b1ebfa5.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.columnSuffix','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.handle','\"blockPicker\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.instructions','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.name','\"Block Picker\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.searchable','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.createButtonLabel','\"New block\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.defaultIndexViewMode','\"cards\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.enableVersioning','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.0.1','\"0c390a43-79fb-43af-89ea-7b8a7c41d3d7\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.includeTableView','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.maxEntries','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.minEntries','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.pageSize','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.propagationKeyFormat','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.propagationMethod','\"all\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.showCardsInGrid','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.viewMode','\"blocks\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.translationKeyFormat','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.translationMethod','\"site\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.columnSuffix','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.handle','\"form\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.instructions','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.name','\"Form\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.searchable','false'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.allowSelfRelations','false'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.branchLimit','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.defaultPlacement','\"end\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.maintainHierarchy','false'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.maxRelations','1'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.minRelations','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.selectionLabel','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.showSearchInput','true'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.showSiteMenu','false'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.sources','\"*\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.targetSiteId','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.validateRelatedElements','false'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.settings.viewMode','\"list\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.translationKeyFormat','null'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.translationMethod','\"none\"'),('fields.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f.type','\"verbb\\\\formie\\\\fields\\\\Forms\"'),('formie.statuses.a7ceddff-7f65-4670-a12c-343eec905a59.color','\"green\"'),('formie.statuses.a7ceddff-7f65-4670-a12c-343eec905a59.description','null'),('formie.statuses.a7ceddff-7f65-4670-a12c-343eec905a59.handle','\"new\"'),('formie.statuses.a7ceddff-7f65-4670-a12c-343eec905a59.isDefault','true'),('formie.statuses.a7ceddff-7f65-4670-a12c-343eec905a59.name','\"New\"'),('formie.statuses.a7ceddff-7f65-4670-a12c-343eec905a59.sortOrder','1'),('formie.statuses.c58d7339-c7da-48b0-a338-3835c34549f1.color','\"green\"'),('formie.statuses.c58d7339-c7da-48b0-a338-3835c34549f1.description','null'),('formie.statuses.c58d7339-c7da-48b0-a338-3835c34549f1.handle','\"new\"'),('formie.statuses.c58d7339-c7da-48b0-a338-3835c34549f1.isDefault','true'),('formie.statuses.c58d7339-c7da-48b0-a338-3835c34549f1.name','\"New\"'),('formie.statuses.c58d7339-c7da-48b0-a338-3835c34549f1.sortOrder','1'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.dataRetention','\"forever\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.dataRetentionValue','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.fileUploadsAction','\"retain\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.collectIp','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.collectUser','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.dataRetention','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.dataRetentionValue','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.defaultEmailTemplateId','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.defaultInstructionsPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.defaultLabelPosition','\"verbb\\\\formie\\\\positions\\\\AboveInput\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.disableCaptchas','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.displayCurrentPageTitle','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.displayFormTitle','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.displayPageProgress','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.displayPageTabs','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.errorMessage.0.content.0.text','\"Couldn’t save submission due to errors.\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.errorMessage.0.content.0.type','\"text\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.errorMessage.0.type','\"paragraph\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.errorMessagePosition','\"top-form\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.fileUploadsAction','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissions','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissionsIpAddressMessage','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissionsIpAddressNumber','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissionsIpAddressType','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissionsMessage','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissionsNumber','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.limitSubmissionsType','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.loadingIndicator','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.loadingIndicatorText','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.pageRedirectUrl','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.progressPosition','\"end\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.progressValuePosition','\"inside-center\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.redirectUrl','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.requiredIndicator','\"asterisk\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.requireUser','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.requireUserMessage','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.scheduleForm','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.scheduleFormEnd','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.scheduleFormExpiredMessage','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.scheduleFormPendingMessage','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.scheduleFormStart','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.scrollToTop','true'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submissionTitleFormat','\"{timestamp}\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitAction','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionFormHide','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionMessage.0.content.0.text','\"Submission saved.\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionMessage.0.content.0.type','\"text\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionMessage.0.type','\"paragraph\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionMessagePosition','\"top-form\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionMessageTimeout','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionTab','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitActionUrl','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.submitMethod','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.validationOnFocus','false'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.settings.validationOnSubmit','true'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.data.userDeletedAction','\"retain\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.defaultStatus','\"c58d7339-c7da-48b0-a338-3835c34549f1\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.handle','\"contactForm\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.name','\"Contact Form\"'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.submitActionEntry','null'),('formie.stencils.226774f0-df25-4716-be27-d89522bf600c.template','null'),('fs.amazonFileSystem.hasUrls','true'),('fs.amazonFileSystem.name','\"Amazon File System\"'),('fs.amazonFileSystem.settings.addSubfolderToRootUrl','true'),('fs.amazonFileSystem.settings.autoFocalPoint','false'),('fs.amazonFileSystem.settings.bucket','\"charliesecom\"'),('fs.amazonFileSystem.settings.bucketSelectionMode','\"choose\"'),('fs.amazonFileSystem.settings.cfDistributionId','\"\"'),('fs.amazonFileSystem.settings.cfPrefix','\"\"'),('fs.amazonFileSystem.settings.expires','\"\"'),('fs.amazonFileSystem.settings.keyId','\"$AMAZON_ACCESS_KEY\"'),('fs.amazonFileSystem.settings.makeUploadsPublic','true'),('fs.amazonFileSystem.settings.region','\"us-east-2\"'),('fs.amazonFileSystem.settings.secret','\"$AMAZON_SECRET_KEY\"'),('fs.amazonFileSystem.settings.subfolder','\"$AMAZON_SUBPATH\"'),('fs.amazonFileSystem.type','\"craft\\\\awss3\\\\Fs\"'),('fs.amazonFileSystem.url','\"$AMAZON_BASE_URL\"'),('meta.__names__.0119d5ec-bfd1-4692-a006-407e05e36d20','\"Block — Product Carousel\"'),('meta.__names__.07b62ac5-22b7-42e6-8930-c48a79658ed1','\"Matrix — Timeline\"'),('meta.__names__.0c390a43-79fb-43af-89ea-7b8a7c41d3d7','\"Page Blocks Entry\"'),('meta.__names__.1686a50c-1e1c-41a1-a2be-68b75ae85cbd','\"Contact Matrix\"'),('meta.__names__.226774f0-df25-4716-be27-d89522bf600c','\"Contact Form\"'),('meta.__names__.231b19ec-9923-4689-ad97-450bdcd8ca3a','\"Block — Subscribe \"'),('meta.__names__.2589bc8f-a277-4da6-ae5f-f294f779bc87','\"charlies\"'),('meta.__names__.29323bbb-b103-4d28-aafb-f37b64ee4ae3','\"Block Type\"'),('meta.__names__.314fa8ad-a55f-4f35-9895-de1a13de0a96','\"Entry — Timeline Matrix\"'),('meta.__names__.32df88de-3497-4bb2-8385-f85a301ab403','\"Contact Matrix Entry\"'),('meta.__names__.46d1905d-56db-493d-90c0-5de9d9910388','\"Block — Split Section\"'),('meta.__names__.4d7ec46f-500b-47b6-8eba-f2f42e8066c1','\"Plain Text\"'),('meta.__names__.564a4360-56ee-4b5a-ba0a-01f13d394fa5','\"Block — Contact\"'),('meta.__names__.5eec91ac-9cac-40d5-915a-f973014bad60','\"Link Field\"'),('meta.__names__.62025e7c-d31e-4ea1-a778-df0457c8317a','\"Entry — Card Matrix\"'),('meta.__names__.645bb423-5466-4a2c-a05f-ceeb31bac6e5','\"Primary\"'),('meta.__names__.64e2bf73-506f-4e6f-9a22-dd5d54f10b77','\"Rich Text Editor\"'),('meta.__names__.6671498f-b940-4c47-a8d5-1de96b0bd763','\"Block — Card Grid\"'),('meta.__names__.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2','\"New\"'),('meta.__names__.7c4edaa8-604a-48d2-a947-3388823e3b2b','\"Color\"'),('meta.__names__.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f','\"Dummy\"'),('meta.__names__.a7ceddff-7f65-4670-a12c-343eec905a59','\"New\"'),('meta.__names__.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd','\"Pages\"'),('meta.__names__.b7d4b92a-3550-4709-ba61-d7e4d3829f54','\"Entry — Page\"'),('meta.__names__.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46','\"Home Page\"'),('meta.__names__.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8','\"Uploads\"'),('meta.__names__.bb71e142-3e9f-4467-9d03-43e288eb4bc0','\"Matrix — Cards\"'),('meta.__names__.c2d9c750-d7f6-412a-822c-7571172f15a5','\"Image(s)\"'),('meta.__names__.c3351fca-dd41-4318-b6ed-7ea1f921ca34','\"lighswitch\"'),('meta.__names__.c58d7339-c7da-48b0-a338-3835c34549f1','\"New\"'),('meta.__names__.d2dbcdc7-ca53-408a-8df4-99d795133201','\"Block — Hero\"'),('meta.__names__.d79efc26-fed5-43e6-bce8-1d7e7f9846b9','\"charlies\"'),('meta.__names__.dc36f051-fd02-4e59-bf63-204e8eccf224','\"Block — Call To Action\"'),('meta.__names__.e85b17b1-d20e-4121-a465-aa688b1ebfa5','\"Block — Timeline\"'),('meta.__names__.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c','\"Block Picker\"'),('meta.__names__.ea57733c-b37f-4fd3-b7bf-ad80ce561f3f','\"Form\"'),('plugins.aws-s3.edition','\"standard\"'),('plugins.aws-s3.enabled','true'),('plugins.aws-s3.schemaVersion','\"2.0\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"5.0.0.1\"'),('plugins.commerce.edition','\"pro\"'),('plugins.commerce.enabled','true'),('plugins.commerce.licenseKey','\"0U6EFPB4B0QWVBY8YV3X7TOY\"'),('plugins.commerce.schemaVersion','\"5.6.0.0\"'),('plugins.formie.edition','\"standard\"'),('plugins.formie.enabled','true'),('plugins.formie.licenseKey','\"9Q0TF6S3GNQ7VFFKO1ARLFLU\"'),('plugins.formie.schemaVersion','\"3.4.12\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.defaultPlacement','\"end\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.enableVersioning','true'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.entryTypes.0.uid','\"b7d4b92a-3550-4709-ba61-d7e4d3829f54\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.handle','\"pages\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.maxAuthors','1'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.name','\"Pages\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.previewTargets.0.label','\"Primary entry page\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.previewTargets.0.refresh','\"1\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.previewTargets.0.urlFormat','\"{url}\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.propagationMethod','\"all\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabledByDefault','true'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.template','\"pages/_entry.twig\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.uriFormat','\"{slug}\"'),('sections.a8354a78-8bd4-4740-a1e5-99da6ee4e9bd.type','\"channel\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.defaultPlacement','\"end\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.enableVersioning','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.entryTypes.0.uid','\"b7d4b92a-3550-4709-ba61-d7e4d3829f54\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.handle','\"homePage\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.maxAuthors','1'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.name','\"Home Page\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.label','\"Primary entry page\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.refresh','\"1\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.urlFormat','\"{url}\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.propagationMethod','\"all\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabledByDefault','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.template','\"index.twig\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.uriFormat','\"__home__\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.type','\"single\"'),('siteGroups.d79efc26-fed5-43e6-bce8-1d7e7f9846b9.name','\"charlies\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabled','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.handle','\"default\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.language','\"en\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.name','\"charlies\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.primary','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.siteGroup','\"d79efc26-fed5-43e6-bce8-1d7e7f9846b9\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"charlies\"'),('system.schemaVersion','\"5.9.0.8\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.altTranslationKeyFormat','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.altTranslationMethod','\"none\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.cardThumbAlignment','\"end\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elementCondition','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.autocapitalize','true'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.autocomplete','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.autocorrect','true'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.class','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.dateAdded','\"2026-04-04T20:13:49+00:00\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.disabled','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.elementCondition','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.id','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.inputType','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.instructions','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.label','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.max','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.min','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.name','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.orientation','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.placeholder','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.readonly','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.requirable','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.size','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.step','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.tip','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.title','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.uid','\"fd9c84b5-8600-49cf-9bd8-12445f0401a0\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.userCondition','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.warning','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.0.width','100'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.attribute','\"alt\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.class','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.cols','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.dateAdded','\"2026-04-04T20:17:23+00:00\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.disabled','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.elementCondition','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.id','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.instructions','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.label','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.name','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.orientation','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.placeholder','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.readonly','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.requirable','true'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.required','false'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.rows','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.tip','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.title','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AltField\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.uid','\"698e5bcb-85af-4329-a717-310a7f8f39fa\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.userCondition','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.warning','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.elements.1.width','100'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.name','\"Content\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.uid','\"d6c87f38-6a85-4545-9ccc-f2552c0025b3\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.tabs.0.userCondition','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fieldLayouts.00154f65-e361-46e7-b6f9-ce96873b6aa4.thumbFieldKey','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.fs','\"amazonFileSystem\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.handle','\"uploads\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.name','\"Uploads\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.sortOrder','1'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.subpath','\"\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.titleTranslationKeyFormat','null'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.titleTranslationMethod','\"site\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.transformFs','\"amazonFileSystem\"'),('volumes.ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8.transformSubpath','\"$AMAZON_TRANSFORMS_SUBPATH\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (5,17,249,NULL,300,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','719bbc9c-f592-4d8d-bbff-364ec8bfde5c'),(6,17,286,NULL,305,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','3d1f641e-e8a7-4549-b799-c9a272707744'),(7,17,295,NULL,306,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','feddfb98-0411-4135-8137-9858717a3ba8'),(8,17,312,NULL,300,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','e5063ba5-9f02-4f94-8435-d370d168576c'),(9,17,313,NULL,305,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','5c0b01f5-8600-447f-b25d-886bcd8bd4e6'),(10,17,314,NULL,306,1,'2026-05-09 21:12:32','2026-05-09 21:12:32','72b5f9c1-1dd3-430f-a82e-3281eb8abd76'),(12,26,539,NULL,544,1,'2026-05-13 14:58:25','2026-05-13 14:58:25','ec1ceeab-efed-4f0b-bf5d-eafbb9409938'),(13,26,550,NULL,544,1,'2026-05-13 14:58:25','2026-05-13 14:58:25','e08883a8-2144-440b-9bc1-de26b1912a55'),(14,26,554,NULL,544,1,'2026-05-13 15:18:35','2026-05-13 15:18:35','0c7eeaf3-a018-4190-8bd0-3100f3de4fa7'),(16,26,561,NULL,544,1,'2026-05-13 16:08:59','2026-05-13 16:08:59','57f4cefb-e436-457d-8e08-dac324819aaf'),(18,26,568,NULL,544,1,'2026-05-13 17:39:03','2026-05-13 17:39:03','221eb9eb-ce81-41d4-b6ac-4c9a1953f002');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (21,28,1,2,NULL),(22,29,1,2,NULL),(25,42,1,1,NULL),(73,64,1,13,NULL),(74,67,1,12,NULL),(78,3,1,44,'Applied “Draft 1”'),(79,144,1,2,NULL),(80,145,1,2,NULL),(81,3,1,45,'Applied “Draft 1”'),(82,144,1,3,NULL),(83,145,1,3,NULL),(84,3,1,46,''),(85,3,1,47,''),(86,3,1,48,'Applied “Draft 1”'),(87,3,1,49,'Applied “Draft 1”'),(88,144,1,4,NULL),(89,145,1,4,NULL),(90,3,1,50,''),(91,144,1,5,NULL),(92,145,1,5,NULL),(93,3,1,51,''),(94,3,1,52,'Applied “Draft 1”'),(95,64,1,14,NULL),(96,67,1,13,NULL),(97,3,1,53,'Applied “Draft 1”'),(98,64,1,15,NULL),(99,67,1,14,NULL),(100,3,1,54,'Applied “Draft 1”'),(101,64,1,16,NULL),(102,67,1,15,NULL),(103,3,1,55,'Applied “Draft 1”'),(104,64,1,17,NULL),(105,67,1,16,NULL),(106,3,1,56,''),(107,3,1,57,'Applied “Draft 1”'),(108,144,1,6,NULL),(109,145,1,6,NULL),(110,3,1,58,''),(111,144,1,7,NULL),(112,145,1,7,NULL),(113,3,1,59,'Applied “Draft 1”'),(114,144,1,8,NULL),(115,145,1,8,NULL),(116,3,1,60,'Applied “Draft 1”'),(117,144,1,9,NULL),(118,145,1,9,NULL),(119,3,1,61,'Applied “Draft 1”'),(120,229,1,1,NULL),(121,230,1,1,NULL),(122,3,1,62,''),(123,3,1,63,''),(124,3,1,64,''),(125,3,1,65,'Applied “Draft 1”'),(126,229,1,2,NULL),(127,230,1,2,NULL),(128,3,1,66,'Applied “Draft 1”'),(129,247,1,1,NULL),(130,248,1,1,NULL),(131,249,1,1,NULL),(132,3,1,67,'Applied “Draft 1”'),(133,3,1,68,''),(134,3,1,69,'Applied “Draft 1”'),(135,247,1,2,NULL),(136,248,1,2,NULL),(137,3,1,70,''),(138,247,1,3,NULL),(139,248,1,3,NULL),(140,3,1,71,''),(141,3,1,72,''),(142,3,1,73,''),(143,3,1,74,''),(144,3,1,75,'Applied “Draft 1”'),(145,247,1,4,NULL),(146,248,1,4,NULL),(147,3,1,76,'Applied “Draft 1”'),(148,247,1,5,NULL),(149,248,1,5,NULL),(150,3,1,77,'Applied “Draft 1”'),(151,247,1,6,NULL),(152,248,1,6,NULL),(153,286,1,1,NULL),(154,3,1,78,'Applied “Draft 1”'),(155,247,1,7,NULL),(156,248,1,7,NULL),(157,295,1,1,NULL),(158,3,1,79,'Applied “Draft 1”'),(159,247,1,8,NULL),(160,248,1,8,NULL),(161,249,1,2,NULL),(162,286,1,2,NULL),(163,295,1,2,NULL),(164,3,1,80,'Applied “Draft 1”'),(165,247,1,9,NULL),(166,248,1,9,NULL),(167,3,1,81,'Applied “Draft 1”'),(168,247,1,10,NULL),(169,248,1,10,NULL),(170,3,1,82,''),(171,328,1,1,''),(172,328,1,2,NULL),(173,328,1,3,NULL),(174,328,1,4,'Applied “Draft 1”'),(175,328,1,5,'Applied “Draft 1”'),(176,364,1,1,NULL),(177,365,1,1,NULL),(178,366,1,1,NULL),(179,367,1,1,NULL),(180,368,1,1,NULL),(181,328,1,6,'Applied “Draft 1”'),(182,364,1,2,NULL),(183,365,1,2,NULL),(184,328,1,7,''),(185,364,1,3,NULL),(186,365,1,3,NULL),(187,328,1,8,'Applied “Draft 1”'),(188,364,1,4,NULL),(189,365,1,4,NULL),(190,366,1,2,NULL),(191,328,1,9,'Applied “Draft 1”'),(192,364,1,5,NULL),(193,365,1,5,NULL),(194,366,1,3,NULL),(195,328,1,10,'Applied “Draft 1”'),(196,403,1,1,NULL),(197,404,1,1,NULL),(198,328,1,11,'Applied “Draft 1”'),(199,403,1,2,NULL),(200,404,1,2,NULL),(201,328,1,12,''),(202,328,1,13,'Applied “Draft 1”'),(203,328,1,14,'Applied “Draft 1”'),(204,403,1,3,NULL),(205,404,1,3,NULL),(206,422,1,1,NULL),(207,423,1,1,NULL),(208,328,1,15,'Applied “Draft 1”'),(209,422,1,2,NULL),(210,423,1,2,NULL),(211,328,1,16,'Applied “Draft 1”'),(212,422,1,3,NULL),(213,423,1,3,NULL),(214,328,1,17,'Applied “Draft 1”'),(215,422,1,4,NULL),(216,423,1,4,NULL),(217,328,1,18,'Applied “Draft 1”'),(218,403,1,4,NULL),(219,404,1,4,NULL),(220,364,1,6,NULL),(221,365,1,6,NULL),(222,422,1,5,NULL),(223,423,1,5,NULL),(224,3,1,83,'Applied “Draft 1”'),(225,144,1,10,NULL),(226,342,1,1,NULL),(227,343,1,1,NULL),(228,145,1,10,NULL),(229,344,1,1,NULL),(230,345,1,1,NULL),(231,64,1,18,NULL),(232,346,1,1,NULL),(233,347,1,1,NULL),(234,67,1,17,NULL),(235,348,1,1,NULL),(236,349,1,1,NULL),(237,247,1,11,NULL),(238,354,1,1,NULL),(239,355,1,1,NULL),(240,356,1,1,NULL),(241,357,1,1,NULL),(242,248,1,11,NULL),(243,3,1,84,'Applied “Draft 1”'),(244,247,1,12,NULL),(245,248,1,12,NULL),(246,328,1,19,''),(247,328,1,20,'Applied “Draft 1”'),(248,364,1,7,NULL),(249,365,1,7,NULL),(250,328,1,21,'Applied “Draft 1”'),(251,503,1,1,NULL),(252,504,1,1,NULL),(253,328,1,22,'Applied “Draft 1”'),(254,503,1,2,NULL),(255,504,1,2,NULL),(256,328,1,23,'Applied “Draft 1”'),(257,503,1,3,NULL),(258,504,1,3,NULL),(259,522,1,1,NULL),(260,523,1,1,NULL),(261,524,1,1,NULL),(262,525,1,1,NULL),(263,526,1,1,NULL),(264,3,1,85,'Applied “Draft 1”'),(265,538,1,1,NULL),(266,539,1,1,NULL),(267,3,1,86,''),(268,3,1,87,'Applied “Draft 1”'),(269,538,1,2,NULL),(270,539,1,2,NULL),(271,3,1,88,''),(272,3,1,89,''),(273,538,1,3,NULL),(274,539,1,3,NULL),(275,3,1,90,''),(276,3,1,91,''),(277,538,1,4,NULL),(278,539,1,4,NULL),(279,3,1,92,''),(280,3,1,93,''),(281,538,1,5,NULL),(282,539,1,5,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' jerry charliesbarkery com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'addressline1',0,1,''),(2,'addressline2',0,1,''),(2,'addressline3',0,1,''),(2,'administrativearea',0,1,''),(2,'countrycode',0,1,' us '),(2,'dependentlocality',0,1,''),(2,'fullname',0,1,''),(2,'locality',0,1,''),(2,'organization',0,1,''),(2,'organizationtaxid',0,1,''),(2,'postalcode',0,1,''),(2,'slug',0,1,''),(2,'sortingcode',0,1,''),(2,'title',0,1,' store '),(3,'slug',0,1,' home page '),(3,'title',0,1,' home page '),(28,'slug',0,1,' temp juhpquzqlrlrkshojqyuibpjewcwrrmiavbz '),(28,'title',0,1,''),(29,'slug',0,1,''),(42,'slug',0,1,' temp olptniqbrcvowkzmucejwynueaqayriksziw '),(42,'title',0,1,''),(47,'slug',0,1,''),(52,'slug',0,1,' temp rzbsvmxqlpvpseevknimnumdkivfzoibxmbb '),(52,'title',0,1,''),(57,'slug',0,1,' temp xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe '),(57,'title',0,1,''),(64,'slug',0,1,' temp etssgfgmmofjurapxtfmkrpoyidaadyzacxs '),(64,'title',0,1,''),(67,'slug',0,1,''),(144,'slug',0,1,' temp hhzrcvazyquagjeirsxdtpoymjuamcjdoznk '),(144,'title',0,1,''),(145,'slug',0,1,''),(229,'slug',0,1,' temp oatgqexjbwvdubaytzqxmvxsbnjbzlntisah '),(229,'title',0,1,''),(230,'slug',0,1,''),(247,'slug',0,1,' temp elbvgitvquqfhaaxemlchtkqwkenfzvdioty '),(247,'title',0,1,''),(248,'slug',0,1,''),(249,'slug',0,1,' bulk orders '),(249,'title',0,1,' bulk orders '),(286,'slug',0,1,' custom branding '),(286,'title',0,1,' custom branding '),(295,'slug',0,1,' events '),(295,'title',0,1,' events '),(300,'alt',0,1,''),(300,'extension',0,1,' svg '),(300,'filename',0,1,' box open svg '),(300,'kind',0,1,' image '),(300,'slug',0,1,''),(300,'title',0,1,' box open '),(305,'alt',0,1,''),(305,'extension',0,1,' svg '),(305,'filename',0,1,' palette svg '),(305,'kind',0,1,' image '),(305,'slug',0,1,''),(305,'title',0,1,' palette '),(306,'alt',0,1,''),(306,'extension',0,1,' svg '),(306,'filename',0,1,' calendar svg '),(306,'kind',0,1,' image '),(306,'slug',0,1,''),(306,'title',0,1,' calendar '),(328,'slug',0,1,' about '),(328,'title',0,1,' about '),(364,'slug',0,1,' temp bxahghshhxlymueuoxztjmsexptewuputdlr '),(364,'title',0,1,''),(365,'slug',0,1,''),(366,'slug',0,1,' real ingredients '),(366,'title',0,1,' real ingredients '),(367,'slug',0,1,' small batch always '),(367,'title',0,1,' small batch always '),(368,'slug',0,1,' made with love '),(368,'title',0,1,' made with love '),(403,'slug',0,1,' temp sxmjrksscvasfrlhdtkuzuhukvpiiskixgxy '),(403,'title',0,1,''),(404,'slug',0,1,''),(422,'slug',0,1,' temp nvjykcvwmlhafvdkeqyaiavgdwcdylszpxth '),(422,'title',0,1,''),(423,'slug',0,1,''),(503,'slug',0,1,' temp pzhaqzcsvzfvwtjuuezxvpccfbviiitqtmmv '),(503,'title',0,1,''),(504,'slug',0,1,''),(522,'slug',0,1,' 2019 '),(522,'title',0,1,' 2019 '),(523,'slug',0,1,' 2021 '),(523,'title',0,1,' 2021 '),(524,'slug',0,1,' 2022 '),(524,'title',0,1,' 2022 '),(525,'slug',0,1,' 2024 '),(525,'title',0,1,' 2024 '),(526,'slug',0,1,' now '),(526,'title',0,1,' now '),(538,'slug',0,1,' temp vmmkptljgxjmefhdjemlqrfaqnmtavsqgvuj '),(538,'title',0,1,''),(539,'slug',0,1,''),(544,'handle',0,1,' subscribe '),(544,'slug',0,1,''),(544,'title',0,1,' subscribe ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home Page','homePage','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-25 13:57:24','2026-03-25 13:57:24',NULL,'b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46'),(2,NULL,'Pages','pages','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-05-09 22:02:04','2026-05-09 22:02:04',NULL,'a8354a78-8bd4-4740-a1e5-99da6ee4e9bd');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,2,1,NULL,NULL,NULL),(2,2,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2026-03-25 13:57:24','2026-03-25 13:57:24','b4f998e7-d0b9-4e8b-a441-c055e583f8cd'),(2,2,1,1,'{slug}','pages/_entry.twig',1,'2026-05-09 22:02:04','2026-05-09 22:02:04','0783d99c-0c65-45e8-a05a-a6f7bd0bfbf6');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'charlies','2026-03-12 17:35:45','2026-03-12 17:35:45',NULL,'d79efc26-fed5-43e6-bce8-1d7e7f9846b9');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','charlies','default','en',1,'$PRIMARY_SITE_URL',1,'2026-03-12 17:35:45','2026-03-12 17:35:45',NULL,'2589bc8f-a277-4da6-ae5f-f294f779bc87');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\": \"en\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'jerry@charliesbarkery.com','$2y$13$W2qAPsTYHkeqfNKZNsh6F.x9w0kwBwf0UD0yM1m5vLCa7qTw0R7JC','2026-05-13 17:38:57',NULL,NULL,NULL,'2026-05-13 17:38:51',NULL,1,NULL,NULL,NULL,0,'2026-03-12 17:35:46','2026-03-12 17:35:46','2026-05-13 17:38:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,NULL,'Temporary Uploads',NULL,'2026-03-25 14:08:03','2026-03-25 14:08:03','5eb1e5fa-0337-4b24-ac74-4716df006b97'),(2,1,NULL,'user_1','user_1/','2026-03-25 14:08:03','2026-03-25 14:08:03','c31482f9-25d2-4d55-b6a8-d8aaf0325296'),(3,NULL,1,'Uploads',NULL,'2026-05-06 12:36:07','2026-05-06 12:36:07','62da03a2-3a7e-4381-82df-7c09a0252f7e');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,14,'Uploads','uploads','amazonFileSystem','','amazonFileSystem','$AMAZON_TRANSFORMS_SUBPATH','site',NULL,'none',NULL,1,'2026-05-06 12:36:07','2026-05-06 12:36:07',NULL,'ba77b7b1-a2e0-4dee-9e20-4dfafe54e7c8');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}','2026-03-12 17:35:49','2026-03-12 17:35:49','56aab7e7-f524-4e7b-8069-ebc5e4085705'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]','2026-03-12 17:35:49','2026-03-12 17:35:49','23336c33-3fe1-4b2a-8ff2-ac4da74dec31'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]','2026-03-12 17:35:49','2026-03-12 17:35:49','e9e99276-5f1e-4798-946a-e9155bf186a2'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}','2026-03-12 17:35:49','2026-03-12 17:35:49','c563780c-a8be-45d7-b69c-027eda9ea1c7');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-13 13:00:27
