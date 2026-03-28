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
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ormddxrcumphquwdvfxiglhefevvbriwxcup` (`primaryOwnerId`),
  CONSTRAINT `fk_burcfhwwsqnemxpdimiyzbchbbfviryibngp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ormddxrcumphquwdvfxiglhefevvbriwxcup` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsjesalrhwdrsyivkfblzrttjuocgbnjlumx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_cmowmlyonzmkgkhrezbmptfgwcdwdtigifnj` (`dateRead`),
  KEY `fk_jyttsscppltohcopfvyiagmfmfyiwlsnxtrk` (`pluginId`),
  CONSTRAINT `fk_jyttsscppltohcopfvyiagmfmfyiwlsnxtrk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nahvpoyvzndmrdydumhdatnmdtlsnaaspjwh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yjjouaqfenkohbskcpcqrsxfgpzywtyauljv` (`sessionId`,`volumeId`),
  KEY `idx_ftuwtenqvbowmlbddbistchvlgroatisxpwh` (`volumeId`),
  CONSTRAINT `fk_lixnqpevpxljisdvptstizxvwzzcccpazdon` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xnhybhlzcdrqjuerbnhpapeamvxndlgcfxnn` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_shtajetermqxrtjhzylblhmtlfqyiwslyexv` (`siteId`),
  CONSTRAINT `fk_dmawudaduiiiufivtrbpnjdesmwfvruwvgfv` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shtajetermqxrtjhzylblhmtlfqyiwslyexv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qpzbwngwsdscdimwoodeiclaktcyzjrxmnjt` (`userId`),
  CONSTRAINT `fk_qpzbwngwsdscdimwoodeiclaktcyzjrxmnjt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_ybrvauzdxfjfhmelfgxogdaclegvtmngxenv` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rcuxbllhofgqmcgekolgaulglkxihpsytoxb` (`name`),
  KEY `idx_ozcrrhgowgehnqfkblrfuftujtdxiygetfcb` (`handle`),
  KEY `idx_iqbwxlyviknnpwjbiochrmqbskgwesrofees` (`structureId`),
  KEY `idx_coowqhvacymkhoaxduckqsmalxyogqgvimyg` (`fieldLayoutId`),
  KEY `idx_keqbpmayesvsitftfxfsclsklfcwossiwxwm` (`dateDeleted`),
  CONSTRAINT `fk_bslonockcwopimnhtuddvundvpikomaqxssl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tuojxzewdvuhmzdisyvqtuijstvelkbbxtqa` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szqsgukcotxyanalbueyytmhrtezxefzxern` (`groupId`,`siteId`),
  KEY `idx_zheymmmoxzvbgruznjmgpykxxxtiekknkelz` (`siteId`),
  CONSTRAINT `fk_oefnbgtxaagjdpcatrkxfjtlubtpwhmtuqdb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yothusamekrysyijbsokhsautgafnihzgznl` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `attribute` varchar(255) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_catalogpricingrules`
--

DROP TABLE IF EXISTS `commerce_catalogpricingrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_catalogpricingrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `storeId` int NOT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `applyPriceType` enum('price','promotionalPrice') NOT NULL,
  `productCondition` text,
  `variantCondition` text,
  `purchasableCondition` text,
  `customerCondition` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isPromotionalPrice` tinyint(1) NOT NULL DEFAULT '0',
  `metadata` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rqcxjvikxuwdsaolnadiwcoebgeicpmdxawl` (`storeId`),
  CONSTRAINT `fk_tdewoovkbfvcwfjbvskglbrikixkmecmtcpa` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfcoggyjznqjcmpxeivnacsdjasozmvufvis` (`catalogPricingRuleId`),
  KEY `idx_yknayqrbvunfcgyjmsabpwrmpjfnrdahlyju` (`userId`),
  CONSTRAINT `fk_ikagpqlsqyiiiazjugmmlyvslzrqztlnoniy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qbedobqcdegblqbqqvdwpvxrxambcnbpzqps` FOREIGN KEY (`catalogPricingRuleId`) REFERENCES `commerce_catalogpricingrules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_coupons`
--

DROP TABLE IF EXISTS `commerce_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `discountId` int NOT NULL,
  `uses` int NOT NULL DEFAULT '0',
  `maxUses` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fpqnyirucmfgreuuqsqnzzcahkansloelrek` (`code`),
  KEY `idx_hxainigtrohbslzmbuejjlthictxwgtgxxlu` (`discountId`),
  CONSTRAINT `fk_hfdxogsrntmeaekcbglvpxsgwcqjpkygzwqh` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ghyfoyjrrwdevwwxmpdgiqybjmqavkecqiim` (`customerId`,`discountId`),
  KEY `idx_nscdsrpowfblcoxsjrsmkbqvvwcnzcflbtfy` (`discountId`),
  CONSTRAINT `fk_furtkcabplhmuhykyletlpdsfzbucqyhsuwq` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_subrqsgfxtuhrckmcwdjyfbvbdnfzyohzjdl` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_royiwiqpgblcwqaxvbywgdipchkkxhgkvcco` (`customerId`),
  KEY `idx_mlxdqvqooazmlxkuooqlchrktekbknyyfsys` (`primaryBillingAddressId`),
  KEY `idx_ntcgqxmgyyqhvyguwcylrtmnebhynamquhnn` (`primaryPaymentSourceId`),
  KEY `idx_jywukepimsunmziwqotufgvhtpgccnwuyppi` (`primaryShippingAddressId`),
  CONSTRAINT `fk_afyevzcspaorllfndisfzuijenauhmojijuj` FOREIGN KEY (`primaryShippingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cqfehukdepbpvjmiohdovfbfnsizcumwjdvk` FOREIGN KEY (`primaryPaymentSourceId`) REFERENCES `commerce_paymentsources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qrqijmtdgmfeittznfqbuohflmzqhirqjaug` FOREIGN KEY (`primaryBillingAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_trjfhugklqpuyoohiqirlwnizbxcmbdkgdhp` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ygcceyqplpevdkrevwlfwctdgzsuaoctjwjy` (`discountId`,`categoryId`),
  KEY `idx_aptsxzfvgdsjaolctovumpxrkwbswsuynkkj` (`categoryId`),
  CONSTRAINT `fk_kblbdtnjtzrqmhpdlmastovkmzxxevbgxmke` FOREIGN KEY (`categoryId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_onckwqrfkjqsnyvxhqpulyjqadonzpnbzyqo` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gaahbrynvsvkiqzamsenkqslbdvawtmrfnou` (`discountId`,`purchasableId`),
  KEY `idx_qxxoezgttbtaiwbbbepvnpvzqfwinfmeegus` (`purchasableId`),
  CONSTRAINT `fk_agkwhivykiqyrovxrfgrqkwlwylfowoydezo` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_olnozghownxeytgpggautbfgewbyhuemzael` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `description` text,
  `couponFormat` varchar(20) NOT NULL DEFAULT '######',
  `orderCondition` text,
  `customerCondition` text,
  `shippingAddressCondition` text,
  `billingAddressCondition` text,
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
  `percentageOffSubject` enum('original','discounted') NOT NULL,
  `excludeOnPromotion` tinyint(1) NOT NULL DEFAULT '0',
  `hasFreeShippingForMatchingItems` tinyint(1) NOT NULL DEFAULT '0',
  `hasFreeShippingForOrder` tinyint(1) NOT NULL DEFAULT '0',
  `allPurchasables` tinyint(1) NOT NULL DEFAULT '0',
  `purchasableIds` text,
  `allCategories` tinyint(1) NOT NULL DEFAULT '0',
  `categoryIds` text,
  `appliedTo` enum('matchingLineItems','allLineItems') NOT NULL DEFAULT 'matchingLineItems',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `orderConditionFormula` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `stopProcessing` tinyint(1) NOT NULL DEFAULT '0',
  `ignorePromotions` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vwnftiotcbmfigpthcdkvgyzobsoktzsdbtt` (`dateFrom`),
  KEY `idx_xziehntvjpmeruxkeiqbnpnzcyyuejzpqsbl` (`dateTo`),
  KEY `fk_tythgkcttsondaosgspfqflklaorhftfcboc` (`storeId`),
  CONSTRAINT `fk_tythgkcttsondaosgspfqflklaorhftfcboc` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_donations`
--

DROP TABLE IF EXISTS `commerce_donations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_donations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vkfelzdpmfmdhmfazcqwgflzjhhsuachflur` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `email` varchar(255) NOT NULL,
  `uses` int unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yqmsvlaccxqxkbwtrlwilzollftahnzofdqx` (`email`,`discountId`),
  KEY `idx_lmmlqgyekchvrsnvjrdrvihhboghezqxkewe` (`discountId`),
  CONSTRAINT `fk_tlsabvoviaavtqwnjnzhwtszjnnmypoqvbhf` FOREIGN KEY (`discountId`) REFERENCES `commerce_discounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `senderAddress` varchar(255) DEFAULT NULL,
  `senderName` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `recipientType` enum('customer','custom') DEFAULT 'custom',
  `to` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `templatePath` varchar(255) NOT NULL,
  `plainTextTemplatePath` varchar(255) DEFAULT NULL,
  `pdfId` int DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `renderSiteId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_supnroxwffyehrikaglcwmymdlpfuovolzcf` (`storeId`),
  KEY `fk_peavpfbozxsijgkhjpqswutsqlqtehrwwvnx` (`pdfId`),
  KEY `fk_okrjragxjldjiuzpiiyiqpyxuyriycupwurc` (`renderSiteId`),
  CONSTRAINT `fk_cegqclyumlopjrrxdqkdspufgjxdmknziika` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_okrjragxjldjiuzpiiyiqpyxuyriycupwurc` FOREIGN KEY (`renderSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_peavpfbozxsijgkhjpqswutsqlqtehrwwvnx` FOREIGN KEY (`pdfId`) REFERENCES `commerce_pdfs` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_gateways`
--

DROP TABLE IF EXISTS `commerce_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_gateways` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `settings` text,
  `paymentType` enum('authorize','purchase') NOT NULL DEFAULT 'purchase',
  `isFrontendEnabled` varchar(500) NOT NULL DEFAULT '1',
  `orderCondition` text,
  `shippingAddressCondition` text,
  `billingAddressCondition` text,
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_amrevuxwecafinwyqscgyaslaathhonvoxno` (`handle`),
  KEY `idx_jyxarqidrvqnhdcffohuaoriwykbbqdfnevw` (`isArchived`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `countryCodeOfOrigin` varchar(255) DEFAULT NULL,
  `administrativeAreaCodeOfOrigin` varchar(255) DEFAULT NULL,
  `harmonizedSystemCode` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_krxxbgskggrgvlxznumcjdfwxxcbnneicwsb` (`purchasableId`),
  CONSTRAINT `fk_djsjwlythrajuxaunympkfovatsnkuhkljie` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_inventorylocations`
--

DROP TABLE IF EXISTS `commerce_inventorylocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_inventorylocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `addressId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_psbdwnerjjksitefpiylcsrplnsivdnwzgdf` (`addressId`),
  CONSTRAINT `fk_psbdwnerjjksitefpiylcsrplnsivdnwzgdf` FOREIGN KEY (`addressId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ycdmtedwwosasppzkyjlpskhvvcotbakdnwp` (`inventoryLocationId`),
  KEY `fk_gwtapynmvqbdyujzfcrmmsvihlqoosnxmkej` (`storeId`),
  CONSTRAINT `fk_gwtapynmvqbdyujzfcrmmsvihlqoosnxmkej` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ycdmtedwwosasppzkyjlpskhvvcotbakdnwp` FOREIGN KEY (`inventoryLocationId`) REFERENCES `commerce_inventorylocations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `movementHash` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `type` enum('incoming','available','committed','reserved','damaged','safety','fulfilled','qualityControl') NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `transferId` int DEFAULT NULL,
  `lineItemId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type` enum('purchasable','custom') NOT NULL DEFAULT 'purchasable',
  `purchasableId` int DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `shippingCategoryId` int NOT NULL,
  `description` text,
  `options` text,
  `optionsSignature` varchar(255) NOT NULL,
  `price` decimal(14,4) unsigned NOT NULL,
  `promotionalPrice` decimal(14,4) unsigned DEFAULT NULL,
  `promotionalAmount` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `salePrice` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `sku` varchar(255) DEFAULT NULL,
  `weight` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `height` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `length` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `width` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `subtotal` decimal(14,4) unsigned NOT NULL DEFAULT '0.0000',
  `total` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `qty` int unsigned NOT NULL,
  `note` text,
  `privateNote` text,
  `hasFreeShipping` tinyint(1) DEFAULT NULL,
  `isPromotable` tinyint(1) DEFAULT NULL,
  `isShippable` tinyint(1) DEFAULT NULL,
  `isTaxable` tinyint(1) DEFAULT NULL,
  `snapshot` longtext,
  `lineItemStatusId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vkyshywzalgrwnisclhvajytjbwaooddxzdk` (`orderId`,`purchasableId`,`optionsSignature`),
  KEY `idx_lzquctldqjoeksamwsybupllztjzcyhhvmia` (`purchasableId`),
  KEY `idx_mtskrtkkskndpofihavdcqqzazoaosideiie` (`shippingCategoryId`),
  KEY `idx_fdwzutwyfpnjixdcwgpmaolcuoasqnehodvx` (`taxCategoryId`),
  CONSTRAINT `fk_jzobynnqkfhvydpithyglaacrxxgkmbfivvr` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_oprchqofghgaaqrqasynzqcuvihajcpamjeq` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_soranhkttibvpiazlzdcvcodlpnynoultznv` FOREIGN KEY (`purchasableId`) REFERENCES `elements` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_zzpiffzzddtounkggxbiubrxbfveuwlfzlgl` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdrqhlvtcetauxxaycizjplmvivgxqbayjwv` (`storeId`),
  CONSTRAINT `fk_whujpxvuyuwcbuxjnumynneooryeohvnxwub` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `amount` decimal(14,4) NOT NULL,
  `included` tinyint(1) NOT NULL DEFAULT '0',
  `isEstimated` tinyint(1) NOT NULL DEFAULT '0',
  `sourceSnapshot` longtext,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tnhdcxucgqsbqwyntfawfasqpkbnlkxfxres` (`orderId`),
  CONSTRAINT `fk_djtnuvfwwucbgtthwspaftdolzxtrsjvfijd` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `userName` varchar(255) DEFAULT NULL,
  `prevStatusId` int DEFAULT NULL,
  `newStatusId` int DEFAULT NULL,
  `message` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vmguuqhcnryndvqdsqzfvbwqiuwrmamwcejv` (`newStatusId`),
  KEY `idx_dkopbltxsfmftvxxeyewaddpjjfspuvbzclc` (`orderId`),
  KEY `idx_dbkpexpiekynxtldkfaezagcepsksxmoyucv` (`prevStatusId`),
  KEY `idx_pcgrpckzeryauervtsgtzfghqzrnuouidnxd` (`userId`),
  CONSTRAINT `fk_cxrvrfhhadorgqwattslimtufzftdnblfnop` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_diwrgnrcmzfuiqawbpmgihvohyfygboupwye` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gszvnuhkihfqkqbgeblpvfcjdnawqapdlslz` FOREIGN KEY (`prevStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_xoijjzitnvpijprlgryspadltlyhhjcllpyn` FOREIGN KEY (`newStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type` varchar(255) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `message` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eenvririziravirszoujxilrnzeaxawognvp` (`orderId`),
  CONSTRAINT `fk_mehokvttkfxhchgrfpyfqyshlhgxbaphcmkt` FOREIGN KEY (`orderId`) REFERENCES `commerce_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `number` varchar(32) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `couponCode` varchar(255) DEFAULT NULL,
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
  `paidStatus` enum('paid','partial','unpaid','overPaid') DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `orderCompletedEmail` varchar(255) DEFAULT NULL,
  `isCompleted` tinyint(1) NOT NULL DEFAULT '0',
  `dateOrdered` datetime DEFAULT NULL,
  `datePaid` datetime DEFAULT NULL,
  `dateFirstPaid` datetime DEFAULT NULL,
  `dateAuthorized` datetime DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `lastIp` varchar(255) DEFAULT NULL,
  `orderLanguage` varchar(12) NOT NULL,
  `origin` enum('web','cp','remote') NOT NULL DEFAULT 'web',
  `message` text,
  `registerUserOnOrderComplete` tinyint(1) NOT NULL DEFAULT '0',
  `saveBillingAddressOnOrderComplete` tinyint(1) NOT NULL DEFAULT '0',
  `makePrimaryBillingAddress` tinyint(1) NOT NULL DEFAULT '0',
  `saveShippingAddressOnOrderComplete` tinyint(1) NOT NULL DEFAULT '0',
  `makePrimaryShippingAddress` tinyint(1) NOT NULL DEFAULT '0',
  `recalculationMode` enum('all','none','adjustmentsOnly') NOT NULL DEFAULT 'all',
  `returnUrl` text,
  `cancelUrl` text,
  `shippingMethodHandle` varchar(255) NOT NULL DEFAULT '',
  `shippingMethodName` varchar(255) NOT NULL DEFAULT '',
  `orderSiteId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vweorcfxjtkcvegzjphosdceqbtbassrjxit` (`emailId`),
  KEY `idx_izacumvffvfogtyxvebwpiuxmseubruuqngu` (`orderStatusId`),
  CONSTRAINT `fk_ukqaciofxyfapbvpsgaimbhkejpuombcairs` FOREIGN KEY (`emailId`) REFERENCES `commerce_emails` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_unvkyumtptprqbuanassqafyucntzulxqhlu` FOREIGN KEY (`orderStatusId`) REFERENCES `commerce_orderstatuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `sortOrder` int DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_myoweetnkealwcavrgdukrsikalrokowrcrw` (`storeId`),
  CONSTRAINT `fk_kcwbumdllvpkqufoahlbeehvxcbkfyvyngjw` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `iso` varchar(3) NOT NULL,
  `primary` tinyint(1) NOT NULL DEFAULT '0',
  `rate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rbnvtykhbhccmjcxldorfnoycieymkjntgvk` (`iso`),
  KEY `fk_qvutjbjvffmfozspeycqszloyerqcwtwxmcr` (`storeId`),
  CONSTRAINT `fk_qvutjbjvffmfozspeycqszloyerqcwtwxmcr` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `token` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gdzracsroxkywkieagernoofkhigzthvlxam` (`customerId`),
  KEY `fk_gpraxecvgjbkzkzawaorwmbdtmyswbugsrnd` (`gatewayId`),
  CONSTRAINT `fk_gdzracsroxkywkieagernoofkhigzthvlxam` FOREIGN KEY (`customerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gpraxecvgjbkzkzawaorwmbdtmyswbugsrnd` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `templatePath` varchar(255) NOT NULL,
  `fileNameFormat` varchar(255) DEFAULT NULL,
  `paperOrientation` varchar(255) DEFAULT 'portrait',
  `paperSize` varchar(255) DEFAULT 'letter',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `isDefault` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tiimipsydtxddieofrsaggcgqtohviswetdj` (`handle`),
  KEY `idx_uwlmdmtomlffdejefhcsuznysqjehclnbjbi` (`storeId`),
  CONSTRAINT `fk_dheextmiuwyhdyjoqczkxirojswdklvoyvpc` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `planData` text,
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `dateArchived` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `sortOrder` int DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iqhryyfsfdxrgncboowdocmhonkwvyynzyyi` (`handle`),
  KEY `idx_tlbmpxgutfjvqzymcuaozphusqjszxmengik` (`gatewayId`),
  KEY `idx_hdkyyidgepoyrajbnuhxqggjdoqpzfofxqig` (`reference`),
  KEY `fk_sfgyzslcnawctcdjjzpheveltmurgzhptxvd` (`planInformationId`),
  CONSTRAINT `fk_nicfjzgsnsnykonkkhvjfxmastxixufwlzfo` FOREIGN KEY (`gatewayId`) REFERENCES `commerce_gateways` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfgyzslcnawctcdjjzpheveltmurgzhptxvd` FOREIGN KEY (`planInformationId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `defaultSku` varchar(255) DEFAULT NULL,
  `defaultPrice` decimal(14,4) DEFAULT NULL,
  `defaultHeight` decimal(14,4) DEFAULT NULL,
  `defaultLength` decimal(14,4) DEFAULT NULL,
  `defaultWidth` decimal(14,4) DEFAULT NULL,
  `defaultWeight` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lajeooodvzsyuvaemetlgqsuisfkcwnmupqb` (`expiryDate`),
  KEY `idx_xsweobnafrkmbiecubtxgfdekfspyebriubb` (`postDate`),
  KEY `idx_urbjhassxstmvqacmcngbklcelepivjorwqj` (`typeId`),
  KEY `fk_hslqycmoufwkvoyapysqjkgivgorghiafqab` (`defaultVariantId`),
  CONSTRAINT `fk_akrmazhufqnqmojsnvcowbjlrglzobfxhreb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dwlhttxsxovjjkfzzchhsgyshnocqwqmlkmd` FOREIGN KEY (`typeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hslqycmoufwkvoyapysqjkgivgorghiafqab` FOREIGN KEY (`defaultVariantId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `structureId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `variantFieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxVariants` int DEFAULT NULL,
  `hasDimensions` tinyint(1) NOT NULL DEFAULT '0',
  `hasVariantTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `variantTitleFormat` varchar(255) NOT NULL,
  `variantTitleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `variantTitleTranslationKeyFormat` varchar(255) DEFAULT NULL,
  `variantUiLabelFormat` varchar(255) NOT NULL DEFAULT '{title}',
  `hasProductTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `productTitleFormat` varchar(255) DEFAULT NULL,
  `productTitleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `productTitleTranslationKeyFormat` varchar(255) DEFAULT NULL,
  `productUiLabelFormat` varchar(255) NOT NULL DEFAULT '{title}',
  `showSlugField` tinyint(1) NOT NULL DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` varchar(255) DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` json DEFAULT NULL,
  `skuFormat` varchar(255) DEFAULT NULL,
  `descriptionFormat` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lovyrjmwmtsivbujjycsbxyyfzhxxtutwosm` (`handle`),
  KEY `idx_befzzkxsdgtdtagcocnmyohacojuiuzfawri` (`structureId`),
  KEY `idx_lpbjzzfhtkbsvstnnquzsybetxoldmfqbamu` (`fieldLayoutId`),
  KEY `idx_zceyowezgnxzklsnyidipaqougzyujhbufds` (`variantFieldLayoutId`),
  CONSTRAINT `fk_hyvqpmkghwvxvmxtqawsruowdqomqdxykhfc` FOREIGN KEY (`variantFieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sechjdhmdnpjtcooczjoxwrhjpeqgmdgthmi` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vfbovbinujywpoklkqlmpsollvwdtwztfqej` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_emfpjnxbvchpaoqemvdhdrekxppbpgphwvwy` (`productTypeId`,`shippingCategoryId`),
  KEY `idx_wtupolvhnbhqajykrutymtqhbfjwtemhmhts` (`shippingCategoryId`),
  CONSTRAINT `fk_qfsepbivzzkozkqwugcgnisoxiruyohpeqrm` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tapyqeswoxjllegjfhkohggoeeojzmwebcfp` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ellqktejbmrycxqimnmxhvysscackpusvujd` (`productTypeId`,`siteId`),
  KEY `idx_gjoweofjazfchqmvwakpliychafyprjoxrng` (`siteId`),
  CONSTRAINT `fk_fofwygrozkxxxkmrbgovjhutyidemqpsazlh` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ipnchrntbcabzgeojwnnftdhjvmyzndsqnqh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xudpiwvalqsxcfjanvyhqrpdmigbpntaswrt` (`productTypeId`,`taxCategoryId`),
  KEY `idx_irvlboihqcdgppquwvpbzrthbsdowpglxkti` (`taxCategoryId`),
  CONSTRAINT `fk_ayldxnrpivlvabowhfsbducpglinlqsriefv` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hkzkfbqkvznjnakfbodrrasnbjbiimwcmmrj` FOREIGN KEY (`productTypeId`) REFERENCES `commerce_producttypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_purchasables`
--

DROP TABLE IF EXISTS `commerce_purchasables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_purchasables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) NOT NULL,
  `description` text,
  `width` decimal(14,4) DEFAULT NULL,
  `height` decimal(14,4) DEFAULT NULL,
  `length` decimal(14,4) DEFAULT NULL,
  `weight` decimal(14,4) DEFAULT NULL,
  `taxCategoryId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_glcsuellnjalrfjhkkhzunelfpstedxhqvkz` (`sku`),
  KEY `fk_yaansxfwbpuuocjzrswdgofrnnnjybmvqtwz` (`taxCategoryId`),
  CONSTRAINT `fk_kjkqctxyyhaljrlwesgcybghuhvehhjklqcx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yaansxfwbpuuocjzrswdgofrnnnjybmvqtwz` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ecsmfdzvrumzywtxwoisxlwagwhrdvvpxaxm` (`purchasableId`),
  KEY `idx_uccjgagxdhyzthuewzxdjohudmugmcbjstvs` (`storeId`),
  KEY `fk_hexaesdpbpjxdedecolkhmcwtudpwnfrvfba` (`shippingCategoryId`),
  CONSTRAINT `fk_amjuopsutqlmxmjenntxjpronuitidbsvfrx` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hexaesdpbpjxdedecolkhmcwtudpwnfrvfba` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kxpqqojlhvxnesamfndauubfscflydavmkcn` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_riwovdpnqmhhysduyjloehfzjowwjnqzdwnz` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cxfnojixeprxzwrlsfjphmluwjrdjmkhluhg` (`saleId`,`categoryId`),
  KEY `idx_qkpnmiojowyycwrqhugeorhsyscutayrvzwl` (`categoryId`),
  CONSTRAINT `fk_ugnlepwogqytmievqsrlwzdddemydfidwvvn` FOREIGN KEY (`categoryId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wxctiwlkbghpmqrbuzmzjrshzghqfrydhgdd` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `purchasableType` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uedketjpfmfhtakyvjhqovrduzvmrakclcvl` (`saleId`,`purchasableId`),
  KEY `idx_lrbzejbtdsniutadxvbtnrwoxmysxdghonoe` (`purchasableId`),
  CONSTRAINT `fk_dfzlcwztncerpouiivschancgfeoqipqzeuh` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wtrjowttfcfiapplisnqtsvojdffaivdcbgz` FOREIGN KEY (`purchasableId`) REFERENCES `commerce_purchasables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tmrlygzfpafeaolkkndhoutcfyhxlpbguizw` (`saleId`,`userGroupId`),
  KEY `idx_broopqplhovoiyrnwssvlfahskeioeoavjmx` (`userGroupId`),
  CONSTRAINT `fk_blgfsjckphofvwwkujhnqtxdfaclfexumllk` FOREIGN KEY (`userGroupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dmevqotpyuggsfwdudzawuybgagqiwrxxgwy` FOREIGN KEY (`saleId`) REFERENCES `commerce_sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_sales`
--

DROP TABLE IF EXISTS `commerce_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `apply` enum('toPercent','toFlat','byPercent','byFlat') NOT NULL,
  `applyAmount` decimal(14,4) NOT NULL,
  `allGroups` tinyint(1) NOT NULL DEFAULT '0',
  `allPurchasables` tinyint(1) NOT NULL DEFAULT '0',
  `allCategories` tinyint(1) NOT NULL DEFAULT '0',
  `categoryRelationshipType` enum('element','sourceElement','targetElement') NOT NULL DEFAULT 'element',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `ignorePrevious` tinyint(1) NOT NULL DEFAULT '0',
  `stopProcessing` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hahbkvnoeqwkkjonqwdpikoczmxrqtsfselq` (`storeId`),
  CONSTRAINT `fk_xdzcetqdmzhtuevkablmvosthyimtfkblxhd` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `orderCondition` text,
  `customerCondition` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmvzslshkhpmlyahaqsimoisibdjddwbdqef` (`name`),
  KEY `idx_gqwktmbexcofozfiuixtyvxwcembmmtgvgsp` (`storeId`),
  CONSTRAINT `fk_ceahsstjgwfttjkpvhmndrrkiytmtadiqhud` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `condition` enum('allow','disallow','require') NOT NULL,
  `perItemRate` decimal(14,4) DEFAULT NULL,
  `weightRate` decimal(14,4) DEFAULT NULL,
  `percentageRate` decimal(14,4) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gwzpjexrsczbijqkdxjofpbxloujrmajjems` (`shippingCategoryId`),
  KEY `idx_lwjbjmlijzecwwfnpldknxsojhwbwzyrhlzv` (`shippingRuleId`),
  CONSTRAINT `fk_pcwgddjeglbncziwwbzmsghqijkyshdthhcm` FOREIGN KEY (`shippingCategoryId`) REFERENCES `commerce_shippingcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tbnugguzghaajcqpkdsmnqciryslkmmllsjx` FOREIGN KEY (`shippingRuleId`) REFERENCES `commerce_shippingrules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `orderConditionFormula` text,
  `orderCondition` text,
  `customerCondition` text,
  `baseRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `perItemRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `weightRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `percentageRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `minRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `maxRate` decimal(14,4) NOT NULL DEFAULT '0.0000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zwbthzjpbjrrzlkearmhztpenuwacdprirys` (`methodId`),
  KEY `idx_dojdwqzybhiczckavzwisefwfxvlijhzsobi` (`name`),
  CONSTRAINT `fk_naapmagqqiahxipzxnrmxbigsmrfdgqqwohj` FOREIGN KEY (`methodId`) REFERENCES `commerce_shippingmethods` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `condition` text,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ylkvyfltlnltnydosgsadylcaopvpxadvoly` (`name`),
  KEY `idx_mqtjmsosgjigkgwxnbnaiwuplaeglxkopahf` (`storeId`),
  CONSTRAINT `fk_cnfehjfezqwirlhpbftzgbpqezbekqrrfdjn` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_stores`
--

DROP TABLE IF EXISTS `commerce_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT 'USD',
  `autoSetCartShippingMethodOption` varchar(255) NOT NULL DEFAULT 'false',
  `autoSetNewCartAddresses` varchar(255) NOT NULL DEFAULT 'false',
  `autoSetPaymentSource` varchar(255) NOT NULL DEFAULT 'false',
  `allowEmptyCartOnCheckout` varchar(255) NOT NULL DEFAULT 'false',
  `allowCheckoutWithoutPayment` varchar(255) NOT NULL DEFAULT 'false',
  `allowPartialPaymentOnCheckout` varchar(255) NOT NULL DEFAULT 'false',
  `requireShippingAddressAtCheckout` varchar(255) NOT NULL DEFAULT 'false',
  `requireBillingAddressAtCheckout` varchar(255) NOT NULL DEFAULT 'false',
  `requireShippingMethodSelectionAtCheckout` varchar(255) NOT NULL DEFAULT 'false',
  `useBillingAddressForTax` varchar(255) NOT NULL DEFAULT 'false',
  `validateOrganizationTaxIdAsVatId` varchar(255) NOT NULL DEFAULT 'false',
  `orderReferenceFormat` varchar(255) DEFAULT NULL,
  `freeOrderPaymentStrategy` varchar(255) DEFAULT 'complete',
  `minimumTotalPriceStrategy` varchar(255) DEFAULT 'default',
  `sortOrder` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `countries` text,
  `marketAddressCondition` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_mydaptinhcojxpmdaelrhhahaqwukcewfvpf` (`locationAddressId`),
  CONSTRAINT `fk_mydaptinhcojxpmdaelrhhahaqwukcewfvpf` FOREIGN KEY (`locationAddressId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zqjiawklakqzpjwvwubdleypycavkmwnciyq` FOREIGN KEY (`id`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text,
  `trialDays` int NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT '1',
  `isSuspended` tinyint(1) NOT NULL DEFAULT '0',
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL DEFAULT '0',
  `returnUrl` text,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_taxcategories`
--

DROP TABLE IF EXISTS `commerce_taxcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_taxcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `rate` decimal(14,10) NOT NULL,
  `include` tinyint(1) NOT NULL DEFAULT '0',
  `isVat` tinyint(1) NOT NULL DEFAULT '0',
  `taxIdValidators` text,
  `removeIncluded` tinyint(1) NOT NULL DEFAULT '0',
  `removeVatIncluded` tinyint(1) NOT NULL DEFAULT '0',
  `taxable` enum('purchasable','price','shipping','price_shipping','order_total_shipping','order_total_price') NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ejpncatgiybwgihionlnpanfqqkrsksytexu` (`storeId`),
  KEY `idx_zihdknjzibkjcbspsgupdditnpbniivngmpf` (`taxCategoryId`),
  KEY `idx_mkntsenkqktwdwfllbfiwekopuhmgujinwxt` (`taxZoneId`),
  CONSTRAINT `fk_dowcofwvyephujrhlyhceuugedvrjuulakli` FOREIGN KEY (`taxCategoryId`) REFERENCES `commerce_taxcategories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pekqzvnsarydlbvaugyzgifxnvfumfkkqhsm` FOREIGN KEY (`taxZoneId`) REFERENCES `commerce_taxzones` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_vhvbptnprqismvhpuxzrfwvkphnocijgcrox` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `condition` text,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzhbkhhldbzhbvxywkszddkseziwyfoxkgdl` (`name`),
  KEY `idx_sgrlnmevnegpejtyhconzwjphbvfvglcmwpq` (`storeId`),
  CONSTRAINT `fk_zjvurtztibxlukituyutjwzwrhmctqjwblmp` FOREIGN KEY (`storeId`) REFERENCES `commerce_stores` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `hash` varchar(32) DEFAULT NULL,
  `type` enum('authorize','capture','purchase','refund') NOT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `paymentAmount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `paymentCurrency` varchar(255) DEFAULT NULL,
  `paymentRate` decimal(14,4) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text,
  `note` mediumtext,
  `response` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `inventoryItemDescription` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `quantityAccepted` int NOT NULL,
  `quantityRejected` int NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jstutsryhqghswvqowsfibpfkydqgeqiqlfg` (`transferId`),
  KEY `idx_rdvovpguwrkffsobkfawqvrythobzcphjxyi` (`inventoryItemId`),
  CONSTRAINT `fk_lcdomhfhezxkexdqffwmptrvowlrtbzugwrt` FOREIGN KEY (`transferId`) REFERENCES `commerce_transfers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mkfrvrwoeiicfjkybdnrrzngvmhlueogwlmh` FOREIGN KEY (`inventoryItemId`) REFERENCES `commerce_inventoryitems` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commerce_transfers`
--

DROP TABLE IF EXISTS `commerce_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerce_transfers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transferStatus` enum('draft','pending','partial','received') NOT NULL,
  `originLocationId` int DEFAULT NULL,
  `destinationLocationId` int DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hacrfztncdjnkzpyjkdknlxsqznxfjvodfnv` (`destinationLocationId`),
  KEY `idx_upicggbfjxvpzqtfkwpvfnnloqxchttlssta` (`originLocationId`),
  CONSTRAINT `fk_lfnwcgsfabnfjxnjpeyszlzztwuqbjmunjfc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qsukhhctuydmtvyanhhucxyuceiegxyyypjl` (`primaryOwnerId`),
  CONSTRAINT `fk_nkjfwwkifvtdfyujlqflhoeydbrnnjtubtqf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rycofvndqkzuwknexmgsupdjqislwyzdiodp` FOREIGN KEY (`primaryOwnerId`) REFERENCES `commerce_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tjfllkquxfnnenmfdcwftryshozetcmodeoc` (`userId`),
  CONSTRAINT `fk_tjfllkquxfnnenmfdcwftryshozetcmodeoc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zpimwtubjoxmbjslxirlwccqnouprmlpblqq` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_dpyfbaaqmpwyoadwlotbxqprhmosodguqzdp` (`creatorId`,`provisional`),
  KEY `idx_prphrcvfijvozmmrdykzhgudxgltwauatbia` (`saved`),
  KEY `fk_ayvxjzufrejhzntmcfhbitwrvohqtksagpzb` (`canonicalId`),
  CONSTRAINT `fk_ayvxjzufrejhzntmcfhbitwrvohqtksagpzb` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xobgohuzxhtczunzticevktrgsltebhkudbe` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type` varchar(255) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_geizkylfvrwdrzrzznllsohqngijechcrciq` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uiyocbqjwtlzbjhhfbgcvzsnbexjbydzqesl` (`elementId`,`siteId`),
  KEY `idx_uyvbzkuhauktgcnndykbpwjkgimihqqfnsfm` (`siteId`),
  KEY `idx_eunatrjsudxpwblsckoplsfgmqjxktgesfvt` (`title`,`siteId`),
  KEY `idx_oezgsauajkykigadlwzsjfprxvbddepwtisi` (`slug`,`siteId`),
  KEY `idx_ybwtrthuxitmpkkftsagjftcxzadxyvhoosy` (`enabled`),
  KEY `idx_srkfxeginhfjxufmsohflxeagzggnpjqhrbw` (`uri`,`siteId`),
  CONSTRAINT `fk_ilwvmakckovcaqaiozbbytanlsgyvtkazxrq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rthtlkucnowoovbwmsitlkxpegzntithprbz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `uiLabelFormat` varchar(255) NOT NULL DEFAULT '{title}',
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `allowLineBreaksInTitles` tinyint(1) NOT NULL DEFAULT '0',
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ifiitucuhqqhuilguzyhjsecncmjxnkyxtju` (`fieldLayoutId`),
  KEY `idx_jtdqpdenrgpsgbocczqletggweymwcavzzrw` (`dateDeleted`),
  CONSTRAINT `fk_atqxuuxirvpoxnwarqiscgrranaofibfbxoc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wuykhwvpmpiquooycvkpwhpxiekphrrsldmy` (`dateDeleted`),
  KEY `idx_xkcgewsjgqyltshbivhisigfoblogfwehwhs` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_anrgurexdbhhoylrgzsypkfvkgecnmxnjwto` (`handle`,`context`),
  KEY `idx_aqmjuwmzlizuczcwioyxuxzractnxbzuchrh` (`context`),
  KEY `idx_cbvnqjvfcvyoodmvccksnmttkdjhkothjayr` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hhmzztgxgungmmuzfujimbhtixflrsbitvcw` (`name`),
  KEY `idx_lslywwvncpklvxifvknzsxqxkaaobxwhhfqa` (`handle`),
  KEY `idx_bhscngxyjetgznjwhyfsahofrmnfqhebcbxi` (`fieldLayoutId`),
  KEY `idx_qwbqzzfzwsqrxsnsnhdnaobehdaejklrqmcs` (`sortOrder`),
  CONSTRAINT `fk_thmzyngcysvlffzzicbpscujxidztbtstqta` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tnvipdaelijdxrgloqfsraaipjhxceftwphn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mrrkhfklrolmoteqjrpdqarnrmkmjwoajvlm` (`accessToken`),
  UNIQUE KEY `idx_fcplatzcemtmxhgxybbdcwhrfgkksqtbgpzc` (`name`),
  KEY `fk_wgbxagusaobvzdcmaabffryemawkhfxmdjhc` (`schemaId`),
  CONSTRAINT `fk_wgbxagusaobvzdcmaabffryemawkhfxmdjhc` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pqwjwhjhqregqddspskeqnhudtpxlerbrydv` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wajwmzghjpbwejrwtwnekpbfeplbfvzvvbtp` (`name`),
  KEY `idx_ttitqevrnrfzqpjspjcpyfyuawgpnomgtkzz` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hkcqlcoydofkmhrwydevcwgziffagdkwfmko` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qzewdqhrmzkxsnqkzrmthccwkdlqeriyaixk` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_wbcdheloramfobmpvervazbopbaskzuerwat` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_jzdiuqgizxwvfhoglhmcdulkrpaeptevfyxr` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_elqygqiqtnsklfidtitxdjuzgjumiroklqef` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_egiudpjputqwhbolpagixocqmcufstkugowq` (`sourceId`),
  KEY `idx_capbdjasiyytnygzkttwpbpaxgsjxjspviiu` (`targetId`),
  KEY `idx_ncvgebfvmomtgtkgqrnyuytvhiibagnnzicj` (`sourceSiteId`),
  CONSTRAINT `fk_ecpmxfbztzdephfwnadksqatsjlxgwwiizar` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jcrvgopboucbjnifsfivpdmsjovrjkjhezdm` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uphwvpplewxlqhykqfhitmbiwjvsfyxskqcs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qmvbsdlaxvndyzchhxivxiooozhurreaqxip` (`canonicalId`,`num`),
  KEY `fk_xfiikacylgngbmgpbwrsyuwxmoxpizvzxxje` (`creatorId`),
  CONSTRAINT `fk_tojnxwdekiifhkehaygdspcwimjilbfybvvv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xfiikacylgngbmgpbwrsyuwxmoxpizvzxxje` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_htzqnlgjudkeiscbvynqgclsycyfeqxnxieb` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_grnwijwfwdjzmwtkvrfiwnmvzjpezraoiryi` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_cmiwpscqrytgllwhquakvgacdbudjymaxmux` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xcdpyducmyriptaofhxdjrtosjkcdufpoxfx` (`handle`),
  KEY `idx_focexfkiupjyafxunfyzwzenkhuyguechudt` (`name`),
  KEY `idx_jwgskyhzvawsovekntlyyqzgwmsixiymdail` (`structureId`),
  KEY `idx_bocqglltvnoyewidjxsilhkjnnlpolrxnkbr` (`dateDeleted`),
  CONSTRAINT `fk_nlbwjbtwdofuobraawhnngtqruhjapostanh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_dchlgovthdztlaaeceyhlvakcovvbmtcovxt` (`typeId`),
  CONSTRAINT `fk_dchlgovthdztlaaeceyhlvakcovvbmtcovxt` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkyvilzndzdlqasodvweqpopwzclcqquimri` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ruktbganzgpkduqxhwqqvzdtpkqxbucszfec` (`sectionId`,`siteId`),
  KEY `idx_tikglbhkjxdiklqrzqljgirurzqypnqorfew` (`siteId`),
  CONSTRAINT `fk_lbowrzhjkoutswejgdvvqscpsqxvxvujkvzi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lbqjnzkydyoqevcawtkanwnltedgrmrhbpxd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fuwyzudlzscyiqxkwngwtnslmwhhoveknxjh` (`uid`),
  KEY `idx_oknthapuiroxrgtpqylhvcxqrkcvbuobeawu` (`token`),
  KEY `idx_dwcsfnihjegnheazdoymyoirpbqzucqpznjo` (`dateUpdated`),
  KEY `idx_ktnhosdkzqfkylxwwkwefvmyychrsqtrzmlr` (`userId`),
  CONSTRAINT `fk_ujwsqwmifplipfiufggiylswcjehyestsukz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dlxhmqpfnkaoelyulxnrzwzkdlizteqeirqs` (`userId`,`message`),
  CONSTRAINT `fk_hwpioxgnywwxggikrubqjujlnivwiircfcfa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rmwrsromfnjsfmkpjlncxucepvseuusawaql` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wbgmixlqsvbfmjhqxusuadpsxhtfzbvlbwja` (`dateDeleted`),
  KEY `idx_whgivwnwkjrryhcepdekwkiwbqvihgjsfvnv` (`handle`),
  KEY `idx_zagcbqwobrkxuxwoymthzpevnndbavxkovnx` (`sortOrder`),
  KEY `fk_isnuxwmkmwhkcbywhnzlozgshskxfkoqqfmj` (`groupId`),
  CONSTRAINT `fk_isnuxwmkmwhkcbywhnzlozgshskxfkoqqfmj` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_ljgutpjgnvpplievbxqdkotfrnmeindqfrkh` (`userId`),
  CONSTRAINT `fk_ljgutpjgnvpplievbxqdkotfrnmeindqfrkh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_auqicuafgptczuolnxfotkjpcicnefxhxkfd` (`structureId`,`elementId`),
  KEY `idx_ctirhqzklgamuanvjlghnhcjwfjjsufrkiug` (`root`),
  KEY `idx_vyodqbxjmwmodnhawfrwzlijwjsrjkntajlw` (`lft`),
  KEY `idx_acwgxnwvefgcowjqmksjkpihjxriocieovri` (`rgt`),
  KEY `idx_puxhwnbjrknevyoivogtcbdlszbykgcajxtz` (`level`),
  KEY `idx_bsfabwiswsnyckgjzgmkdlejzuhpkbxxptch` (`elementId`),
  CONSTRAINT `fk_fbohyuxnufnxivjwnjzdyliuiwtefbszgtmt` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdxmfcqmitjiysayyfnandaxjcwokhycxags` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_opajkwnjnxcbyvjouiemhkcdxmdkpzhtnsed` (`key`,`language`),
  KEY `idx_ivwylzbelpyvqlxqhyhgowajduyudbfejhju` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_basbisazwwgcncjxqzggkxebpvrhbowgoeqm` (`name`),
  KEY `idx_aqliuffhezffxvmesknjrgvazfouqpjhcxqo` (`handle`),
  KEY `idx_tzhuneefpitnnbkmkqbepspfgruwvrqebnrn` (`dateDeleted`),
  KEY `fk_dlfmvqxjtsiqibdxoahiyzjzempfgrrdarzl` (`fieldLayoutId`),
  CONSTRAINT `fk_dlfmvqxjtsiqibdxoahiyzjzempfgrrdarzl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kgzlijlpqlzpaonrkqflrytrbxdxoyavtoga` (`token`),
  KEY `idx_vzqjmdwqvxlnklnlcvbmdnarcggsuyyjqaax` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dieumqitlfpgmkttghkuiulnaspvrjtmtjxl` (`handle`),
  KEY `idx_yxdaqrcagtqqmcjfgxrlehqltapvcoaifbhb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zvagyojffgzubhjleszxnyfrlrizmhvspdvw` (`groupId`,`userId`),
  KEY `idx_ayuyiuyuvgbrksbnhzrsxvnvpcilppxpzbys` (`userId`),
  CONSTRAINT `fk_bxaechuiqyoprlziqvsfwrtuligszuthcxoy` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpwsmzxpqmivwjealkuhnietcdpnvwtkhpaz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dnjogdzmchnajaxwbdwktkpsjwbuvepdksqv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mvfkactcoshdszsnrdggusebgbtsysuzkjjf` (`permissionId`,`groupId`),
  KEY `idx_lmqjhangshkqxlxryxczncmdljqemwdpjnem` (`groupId`),
  CONSTRAINT `fk_xkzoffyacykrmyihrxwvcuvdhfvldmcceigc` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yatxztuffoejljswackjnxaocvqodwmfeuxt` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hehhhdqgmdapmclpetetmmxwqtjuyqxvzmav` (`permissionId`,`userId`),
  KEY `idx_wxyqhnpnfnqznyaaiksghjecfadnjsreqmuw` (`userId`),
  CONSTRAINT `fk_oarcpbxftfrfumuoxpgqngpeavjeovtbizsw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfoeifmrgwlttyqghtsejnczaocjiazphdxh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wpdbpqnxgegqzxcdwjgmknidizomyiewtmop` (`name`,`parentId`,`volumeId`),
  KEY `idx_mnvwqfzuhmbpgsgxkqxshazkscqgutvkvccq` (`parentId`),
  KEY `idx_nctozrfxxhmzbzqwpybgsdgnhrygnqwhpkri` (`volumeId`),
  CONSTRAINT `fk_ehkmlxfdjmxfzmevueqrqxwuivoytdoeoyds` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvuiljjwkigtesikpkyfrkzdstlzvzwfpeib` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xmppumwgtvqgoxqnhnfkejesevxoxpnnpeaw` (`name`),
  KEY `idx_oahlofdbsdkdmwhhsblsimdyrmkfiizxvuve` (`handle`),
  KEY `idx_znzuwowjnfffaanxytrxznuxdhxuseijfoas` (`fieldLayoutId`),
  KEY `idx_dogtlwohdmixhvxurojyxkwgbhnwssjfvyrl` (`dateDeleted`),
  CONSTRAINT `fk_ffytungflajyzfmmfeyhargljwxewztokgbw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_yvvrazazirffdvvjgfayfzstnpvsptdvhsym` (`userId`),
  CONSTRAINT `fk_yvvrazazirffdvvjgfayfzstnpvsptdvhsym` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iqfuropdienitbvtaigrilkguertrlbdpwel` (`userId`),
  CONSTRAINT `fk_vsgsufrebmmdieeiaimsvsftbwvcoogeisde` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2026-03-28 18:19:40
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
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
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
INSERT INTO `changedattributes` VALUES (3,1,'fieldLayoutId','2026-03-25 14:42:33',0,1),(3,1,'title','2026-03-25 14:45:23',0,1),(3,1,'typeId','2026-03-25 14:42:33',0,1),(4,1,'expiryDate','2026-03-25 13:57:24',0,1),(4,1,'fieldId','2026-03-25 13:57:24',0,1),(4,1,'id','2026-03-25 13:57:24',0,1),(4,1,'postDate','2026-03-25 13:57:24',0,1),(4,1,'primaryOwnerId','2026-03-25 13:57:24',0,1),(4,1,'sectionId','2026-03-25 13:57:24',0,1),(4,1,'status','2026-03-25 13:57:24',0,1),(4,1,'title','2026-03-25 13:57:24',0,1),(4,1,'typeId','2026-03-25 13:57:24',0,1),(19,1,'fieldLayoutId','2026-03-25 14:42:33',0,1),(19,1,'title','2026-03-25 14:42:33',0,1),(19,1,'typeId','2026-03-25 14:42:33',0,1),(21,1,'title','2026-03-25 14:43:11',0,1),(22,1,'title','2026-03-25 14:44:47',0,1),(23,1,'title','2026-03-25 14:45:11',0,1),(24,1,'title','2026-03-25 14:45:23',0,1),(28,1,'title','2026-03-25 15:36:14',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,1,'06046102-5b5b-459b-bfc9-b30d0fca0637','2026-03-25 14:11:43',0,1),(3,1,1,'155e57b8-c7fc-4b17-86a3-539f80f5ed0a','2026-03-25 14:11:43',0,1),(3,1,1,'5ce97453-9ece-40ca-ac1b-64149ca635d4','2026-03-25 14:11:29',0,1),(3,1,2,'82655099-51f2-45f3-b4e0-d7289fd79e60','2026-03-25 14:13:57',0,1),(3,1,2,'afd6c57d-6011-47c0-9ed8-510fa3b29b73','2026-03-25 14:13:10',0,1),(3,1,3,'ba5603f2-a7cb-4004-b88b-b781db84dd1f','2026-03-25 14:45:23',0,1),(3,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 22:19:12',0,1),(10,1,1,'5ce97453-9ece-40ca-ac1b-64149ca635d4','2026-03-25 14:11:29',0,1),(12,1,1,'06046102-5b5b-459b-bfc9-b30d0fca0637','2026-03-25 14:11:43',0,1),(12,1,1,'155e57b8-c7fc-4b17-86a3-539f80f5ed0a','2026-03-25 14:11:43',0,1),(14,1,2,'afd6c57d-6011-47c0-9ed8-510fa3b29b73','2026-03-25 14:13:01',0,1),(15,1,2,'afd6c57d-6011-47c0-9ed8-510fa3b29b73','2026-03-25 14:13:10',0,1),(17,1,2,'82655099-51f2-45f3-b4e0-d7289fd79e60','2026-03-25 14:13:57',0,1),(28,1,4,'67c0702d-602b-4460-a842-68b69569157a','2026-03-25 15:36:14',0,1),(29,1,2,'6d5ccc92-c8d6-422f-8931-38d5f2e409e3','2026-03-25 15:36:14',0,1),(29,1,2,'c53d75b5-67d6-47b2-b41a-327f91a1c146','2026-03-25 15:36:14',0,1),(30,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-25 15:35:21',0,1),(36,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-25 15:36:14',0,1),(43,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 03:09:25',0,1),(53,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 22:17:28',0,1),(58,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 22:19:12',0,1);
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
INSERT INTO `contentblocks` VALUES (29,28,4),(32,31,4),(38,37,4),(47,42,6);
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
INSERT INTO `elementactivity` VALUES (3,1,1,NULL,'edit','2026-03-28 22:19:10'),(3,1,1,NULL,'save','2026-03-28 22:19:12'),(3,1,1,NULL,'view','2026-03-28 22:19:12');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-03-12 17:35:45','2026-03-12 17:35:45',NULL,NULL,NULL,'e6a65f99-d8b8-4732-a2d0-8eab87664dfc'),(2,NULL,NULL,NULL,NULL,'craft\\elements\\Address',1,0,'2026-03-19 20:00:10','2026-03-19 20:00:10',NULL,NULL,NULL,'de78bd12-37b5-4b6a-9cf5-eca2759aff06'),(3,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2026-03-25 13:57:24','2026-03-28 22:19:12',NULL,NULL,NULL,'52117ec7-dc39-4708-b0bd-2c00fab12cbb'),(4,3,NULL,1,1,'craft\\elements\\Entry',1,0,'2026-03-25 13:57:24','2026-03-25 13:57:24',NULL,NULL,NULL,'a1429ae9-495c-4fcd-91a9-bb24e9e10a4b'),(5,3,NULL,2,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:04:06','2026-03-25 14:04:06',NULL,NULL,NULL,'a906b248-4ebb-44a9-b9af-838e651dd77f'),(6,3,NULL,3,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:04:53','2026-03-25 14:04:53',NULL,NULL,NULL,'0be51669-528f-450e-ad46-f8f530ca8e9a'),(7,3,NULL,4,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:06:22','2026-03-25 14:06:22',NULL,NULL,NULL,'2bbba098-33d8-4f4c-9659-bfa47577b6ed'),(8,3,NULL,5,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:11:10','2026-03-25 14:11:10',NULL,NULL,NULL,'0ffcf6c5-e5af-4253-b663-96e5170cdf37'),(10,3,NULL,6,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:11:29','2026-03-25 14:11:29',NULL,NULL,NULL,'f8c20630-5345-4f89-8039-d8b6756abe4a'),(12,3,NULL,7,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:11:43','2026-03-25 14:11:43',NULL,NULL,NULL,'b1b3ff6c-45a7-4647-b9a3-fe0c7c050c23'),(14,3,NULL,8,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:13:01','2026-03-25 14:13:01',NULL,NULL,NULL,'fe00a824-ebaa-4bc5-a12f-1cf14dd3fc56'),(15,3,NULL,9,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:13:10','2026-03-25 14:13:10',NULL,NULL,NULL,'fbabbd7d-99ef-4c48-9854-766daad83dea'),(17,3,NULL,10,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:13:57','2026-03-25 14:13:57',NULL,NULL,NULL,'8c95c5f3-75da-4f91-92b3-2b00a7a4e723'),(18,3,NULL,11,1,'craft\\elements\\Entry',1,0,'2026-03-25 14:16:56','2026-03-25 14:16:56',NULL,NULL,NULL,'74a0f2cd-f8f1-4b61-b3aa-2dfd8155dd97'),(19,3,NULL,12,2,'craft\\elements\\Entry',1,0,'2026-03-25 14:42:33','2026-03-25 14:42:33',NULL,NULL,NULL,'f9a64e72-5689-4188-ab2e-1adf0c7402f4'),(21,3,NULL,13,2,'craft\\elements\\Entry',1,0,'2026-03-25 14:43:11','2026-03-25 14:43:11',NULL,NULL,NULL,'5f6282b6-7c5e-4cc1-89d9-0a5533b19736'),(22,3,NULL,14,2,'craft\\elements\\Entry',1,0,'2026-03-25 14:44:47','2026-03-25 14:44:47',NULL,NULL,NULL,'55a02113-386e-4d73-881b-56ab9f3f47f9'),(23,3,NULL,15,2,'craft\\elements\\Entry',1,0,'2026-03-25 14:45:11','2026-03-25 14:45:11',NULL,NULL,NULL,'6554da98-e49f-47e1-92dc-094c271f1d25'),(24,3,NULL,16,2,'craft\\elements\\Entry',1,0,'2026-03-25 14:45:23','2026-03-25 14:45:23',NULL,NULL,NULL,'8e45b76b-211e-4483-8049-29acb0f7471a'),(28,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:36:14',NULL,NULL,NULL,'5dc34ace-f4e6-4b49-9074-c14cd5fabaee'),(29,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:35:21','2026-03-25 15:36:14',NULL,NULL,NULL,'ac7a05e7-5c8b-4387-8884-4561cead9a27'),(30,3,NULL,17,2,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:35:21',NULL,NULL,NULL,'1bfcdba4-23d2-4dac-904c-d1a9d8276a78'),(31,28,NULL,18,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:35:21',NULL,NULL,NULL,'0b32d946-4718-40a5-9076-b8fbf8e5e5d1'),(32,29,NULL,19,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:35:21','2026-03-25 15:35:21',NULL,NULL,NULL,'0716f4ec-b3fd-4a63-b92b-bae76340ec4b'),(36,3,NULL,20,2,'craft\\elements\\Entry',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'98fdd0dc-d933-4ae0-9c19-03ca7f6c29bb'),(37,28,NULL,21,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'c84aea3c-6b05-4a5e-8dfd-ec36cdb4748f'),(38,29,NULL,22,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'422f35ce-e410-4a6d-9405-2f5c15cad8df'),(39,3,NULL,23,2,'craft\\elements\\Entry',1,0,'2026-03-25 15:37:03','2026-03-25 15:37:03',NULL,NULL,NULL,'56d6477c-9f6c-4d8a-87cb-e63f4cdf199c'),(42,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'07910d49-eb8a-4eff-bd25-79bd905b6079'),(43,3,NULL,24,2,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'92afe79a-9747-41a4-8e91-19295eb7811a'),(44,42,NULL,25,5,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'38472fdd-2ae0-4a05-b6a3-1ed95fe87252'),(47,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-28 22:15:26','2026-03-28 22:15:26',NULL,NULL,NULL,'87c8ba6f-c5dd-42e6-9dc8-3d2e8bbfc9bb'),(52,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 22:17:28',NULL,NULL,NULL,'250a255e-e419-43d2-8aa5-6a9f520d344a'),(53,3,NULL,26,2,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 22:17:28',NULL,NULL,NULL,'0c138eb9-3d57-444d-949e-261e1d808f78'),(54,52,NULL,27,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 22:17:28',NULL,NULL,NULL,'601e442d-3eab-4a6b-b911-f6ff734f2acd'),(57,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 22:19:12',NULL,NULL,NULL,'e2ca7a56-b5f0-453d-9d9f-302b34ebb8e7'),(58,3,NULL,28,2,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 22:19:12',NULL,NULL,NULL,'0b935efd-d8a4-417b-8609-d73d14b8c445'),(59,57,NULL,29,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 22:19:12',NULL,NULL,NULL,'76494736-0970-479f-a228-4a0cb860cf44');
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
INSERT INTO `elements_owners` VALUES (28,3,1),(29,28,1),(31,30,1),(32,31,1),(37,36,1),(37,39,1),(37,43,1),(37,53,1),(37,58,1),(38,37,1),(47,42,1),(42,3,2),(44,43,2),(44,53,2),(44,58,2),(52,3,3),(54,53,3),(54,58,3),(57,3,4),(59,58,4);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-03-12 17:35:45','2026-03-12 17:35:45','bf2a1227-9b30-4d9b-a781-4eee0ab37d98'),(2,2,1,'Store',NULL,NULL,NULL,1,'2026-03-19 20:00:10','2026-03-19 20:00:10','f02022f3-a7db-48fe-b796-118b163421d0'),(3,3,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 13:57:24','2026-03-25 14:45:23','20668cf6-40b0-4041-8510-abb38cff89e9'),(4,4,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 13:57:24','2026-03-25 13:57:24','09902fa3-1e5f-4fc2-a214-25d921477cbf'),(5,5,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 14:04:06','2026-03-25 14:04:06','4f257779-bf0d-4d22-b564-32e624fc54cd'),(6,6,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 14:04:53','2026-03-25 14:04:53','834781a0-8568-480b-800c-f50656b93b99'),(7,7,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 14:06:22','2026-03-25 14:06:22','036626d6-56f2-4c2c-9733-422f25f2ae22'),(8,8,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 14:11:10','2026-03-25 14:11:10','ea17de6b-567b-4c3c-bca5-0d6339d5f8c5'),(10,10,1,'Home Page','home-page','__home__','{\"5ce97453-9ece-40ca-ac1b-64149ca635d4\": \"Handmade in Charlotte, NC\"}',1,'2026-03-25 14:11:29','2026-03-25 14:11:29','1195a535-c993-4c55-a657-11c6d28ec43b'),(12,12,1,'Home Page','home-page','__home__','{\"06046102-5b5b-459b-bfc9-b30d0fca0637\": \"Treats Your Dog Will Beg For\", \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"5ce97453-9ece-40ca-ac1b-64149ca635d4\": \"Handmade in Charlotte, NC\"}',1,'2026-03-25 14:11:43','2026-03-25 14:11:43','5fc51171-3104-4cdf-b605-e180b53dc08e'),(14,14,1,'Home Page','home-page','__home__','{\"06046102-5b5b-459b-bfc9-b30d0fca0637\": \"Treats Your Dog Will Beg For\", \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"5ce97453-9ece-40ca-ac1b-64149ca635d4\": \"Handmade in Charlotte, NC\", \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\": {\"type\": \"url\", \"label\": \"Find Us\", \"value\": \"https://maps.app.goo.gl/EK2JQFsAR9AaLnq99\", \"target\": \"_blank\"}}',1,'2026-03-25 14:13:01','2026-03-25 14:13:01','bbc8fd21-80e3-4b59-ac29-54099eaf8c6e'),(15,15,1,'Home Page','home-page','__home__','{\"06046102-5b5b-459b-bfc9-b30d0fca0637\": \"Treats Your Dog Will Beg For\", \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"5ce97453-9ece-40ca-ac1b-64149ca635d4\": \"Handmade in Charlotte, NC\", \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/EK2JQFsAR9AaLnq99\", \"target\": \"_blank\"}}',1,'2026-03-25 14:13:10','2026-03-25 14:13:10','44f33517-fb17-4f79-a23b-8860b7af5f54'),(17,17,1,'Home Page','home-page','__home__','{\"06046102-5b5b-459b-bfc9-b30d0fca0637\": \"Treats Your Dog Will Beg For\", \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"5ce97453-9ece-40ca-ac1b-64149ca635d4\": \"Handmade in Charlotte, NC\", \"82655099-51f2-45f3-b4e0-d7289fd79e60\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}, \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/EK2JQFsAR9AaLnq99\", \"target\": \"_blank\"}}',1,'2026-03-25 14:13:57','2026-03-25 14:13:57','3e1184ee-857b-4f74-aa95-05e30618f77b'),(18,18,1,'Home Page','home-page','__home__','{\"06046102-5b5b-459b-bfc9-b30d0fca0637\": \"Treats Your Dog Will Beg For\", \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"5ce97453-9ece-40ca-ac1b-64149ca635d4\": \"Handmade in Charlotte, NC\", \"82655099-51f2-45f3-b4e0-d7289fd79e60\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}, \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/EK2JQFsAR9AaLnq99\", \"target\": \"_blank\"}}',1,'2026-03-25 14:16:56','2026-03-25 14:16:56','92baca07-0ff1-499b-a46c-72ec75f0826a'),(19,19,1,NULL,'home-page','__home__',NULL,1,'2026-03-25 14:42:33','2026-03-25 14:42:33','ba223794-1268-428b-97d2-0e6ddcf47738'),(21,21,1,NULL,'home-page','__home__',NULL,1,'2026-03-25 14:43:11','2026-03-25 14:43:11','349b182b-877b-496c-b59e-db39ac504bc6'),(22,22,1,NULL,'home-page','__home__',NULL,1,'2026-03-25 14:44:47','2026-03-25 14:44:47','7e305f7d-bd64-4260-98c4-2296a17655aa'),(23,23,1,NULL,'home-page','__home__',NULL,1,'2026-03-25 14:45:11','2026-03-25 14:45:11','1e609f58-bcf1-4e18-adb8-554171064111'),(24,24,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 14:45:23','2026-03-25 14:45:23','28e6d79d-789f-4466-9ce5-6b93c33c6f1a'),(28,28,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','8dc77f7c-f03f-4494-944f-abf198215ff1'),(29,29,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/KqPJGqHaUqELJ5Cs9\", \"target\": \"_blank\"}, \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"c53d75b5-67d6-47b2-b41a-327f91a1c146\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}}',1,'2026-03-25 15:35:21','2026-03-25 15:36:14','97ce8045-5d14-496d-bd48-77f52706d192'),(30,30,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 15:35:21','2026-03-25 15:35:21','e06ea0ad-5cd2-47f6-80d4-2250f106ea7f'),(31,31,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','5e797ce7-0ea6-47ba-a416-5680b26b64af'),(32,32,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','95e8b005-a6db-43ca-8768-2b5b2fbfde55'),(36,36,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 15:36:14','2026-03-25 15:36:14','73a046cd-3d2d-43ee-a3f8-f1eacbcea72a'),(37,37,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:36:14','2026-03-25 15:36:14','dc7c5c1c-152c-489f-9e94-d56c995db96f'),(38,38,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/KqPJGqHaUqELJ5Cs9\", \"target\": \"_blank\"}, \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"c53d75b5-67d6-47b2-b41a-327f91a1c146\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}}',1,'2026-03-25 15:36:14','2026-03-25 15:36:14','a6b286c1-2e45-4b51-908a-11e629755388'),(39,39,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 15:37:03','2026-03-25 15:37:03','02230044-0058-4394-9271-a901a66ba6bc'),(42,42,1,NULL,'__temp_olptniqbrcvowkzmucejwynueaqayriksziw',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"productCarousel\"}',1,'2026-03-28 03:09:25','2026-03-28 03:09:25','15e69424-6ba3-4e3e-b189-159b3330539c'),(43,43,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 03:09:25','2026-03-28 03:09:25','fd750b0c-1947-4c80-a95c-d77f3162cc8d'),(44,44,1,NULL,'__temp_olptniqbrcvowkzmucejwynueaqayriksziw',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"productCarousel\"}',1,'2026-03-28 03:09:25','2026-03-28 03:09:25','55cb802c-be83-46d2-8037-a202ebb544f8'),(47,47,1,NULL,NULL,NULL,NULL,1,'2026-03-28 22:15:26','2026-03-28 22:15:26','bfd41646-3bb1-4fb9-89c0-b9b8d2d64009'),(52,52,1,NULL,'__temp_rzbsvmxqlpvpseevknimnumdkivfzoibxmbb',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:17:28','2026-03-28 22:17:28','40513ccd-28c5-4c5a-959e-427113d42a47'),(53,53,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 22:17:28','2026-03-28 22:17:28','ac242283-ceec-4097-a49e-e164b168704b'),(54,54,1,NULL,'__temp_rzbsvmxqlpvpseevknimnumdkivfzoibxmbb',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:17:28','2026-03-28 22:17:28','1a14dd2f-06c9-4d84-9c35-53376132b3e4'),(57,57,1,NULL,'__temp_xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:19:12','2026-03-28 22:19:12','cdfd0ab0-69c3-4e9f-8f14-ec63a542f359'),(58,58,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 22:19:12','2026-03-28 22:19:12','44d2419b-6a93-499e-bf65-fe265d28fd68'),(59,59,1,NULL,'__temp_xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:19:12','2026-03-28 22:19:12','2632ca3f-3740-4b18-bf02-78c760ac28c3');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 13:57:24','2026-03-25 14:42:33'),(4,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 13:57:24','2026-03-25 13:57:24'),(5,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:04:06','2026-03-25 14:04:06'),(6,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:04:53','2026-03-25 14:04:53'),(7,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:06:22','2026-03-25 14:06:22'),(8,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:11:10','2026-03-25 14:11:10'),(10,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:11:29','2026-03-25 14:11:29'),(12,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:11:43','2026-03-25 14:11:43'),(14,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:13:01','2026-03-25 14:13:01'),(15,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:13:10','2026-03-25 14:13:10'),(17,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:13:57','2026-03-25 14:13:57'),(18,1,NULL,NULL,NULL,1,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:16:56','2026-03-25 14:16:56'),(19,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:42:33','2026-03-25 14:42:33'),(21,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:43:11','2026-03-25 14:43:11'),(22,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:44:47','2026-03-25 14:44:47'),(23,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:45:11','2026-03-25 14:45:11'),(24,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:45:23','2026-03-25 14:45:23'),(28,NULL,NULL,3,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(30,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(31,NULL,NULL,30,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(36,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 15:36:14','2026-03-25 15:36:14'),(37,NULL,NULL,36,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:36:14','2026-03-25 15:36:14'),(39,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 15:37:03','2026-03-25 15:37:03'),(42,NULL,NULL,3,5,3,'2026-03-28 03:09:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(43,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(44,NULL,NULL,43,5,3,'2026-03-28 03:09:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(52,NULL,NULL,3,5,3,'2026-03-28 22:17:00',NULL,'live',NULL,NULL,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(53,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(54,NULL,NULL,53,5,3,'2026-03-28 22:17:00',NULL,'live',NULL,NULL,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(57,NULL,NULL,3,5,3,'2026-03-28 22:19:00',NULL,'live',NULL,NULL,'2026-03-28 22:19:12','2026-03-28 22:19:12'),(58,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 22:19:12','2026-03-28 22:19:12'),(59,NULL,NULL,58,5,3,'2026-03-28 22:19:00',NULL,'live',NULL,NULL,'2026-03-28 22:19:12','2026-03-28 22:19:12');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Homepage','homepage',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-25 13:57:22','2026-03-25 13:57:22','2026-03-25 14:34:34','06aab01b-e069-4c88-8964-28f89b370076'),(2,2,'Page — Home','pageHomeEntry',NULL,NULL,NULL,'{title}',1,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-25 14:20:44','2026-03-25 14:51:33',NULL,'b7d4b92a-3550-4709-ba61-d7e4d3829f54'),(3,5,'Page Blocks Entry','pageBlocksEntry',NULL,NULL,NULL,'{title}',0,'site',NULL,NULL,0,1,'site',NULL,1,'2026-03-25 14:51:44','2026-03-25 14:51:56',NULL,'0c390a43-79fb-43af-89ea-7b8a7c41d3d7');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"25d5974e-d00c-4ae1-b3c7-ca87427ddefd\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d4293c02-b206-4ab2-ad76-c544ee55e217\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-25T13:55:56+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"7e2ff94c-198a-4d2c-84c9-0d127a74020d\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Hero Section\", \"dateAdded\": \"2026-03-25T14:10:32+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5ce97453-9ece-40ca-ac1b-64149ca635d4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:04:52+00:00\", \"instructions\": \"Eyebrow Text Eyebrow / Kicker (small top text)\", \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"06046102-5b5b-459b-bfc9-b30d0fca0637\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:04:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subheadline\", \"width\": 100, \"handle\": \"subheadline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:06:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"82655099-51f2-45f3-b4e0-d7289fd79e60\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:09:51+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": \"linkField2\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:10:16+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 13:57:22','2026-03-25 14:11:07','2026-03-25 14:34:34','caeac63d-3450-4753-886c-81962cf78ae2'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"bee69b4e-5d3a-4aa2-aa9e-e0e3e517671d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"33eaf735-2da8-403c-8230-8505eabf00a4\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-25T14:44:46+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"fb60420e-7f69-437a-8dcb-a6054958208f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e91396d1-d7c4-4b1b-a3e9-55972a84ff9c\", \"required\": false, \"dateAdded\": \"2026-03-25T15:34:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:20:44','2026-03-25 15:34:31',NULL,'75d0994b-d90d-4008-bb5d-78000befd65e'),(3,'craft\\elements\\ContentBlock',NULL,'2026-03-25 14:31:44','2026-03-25 14:31:44',NULL,'276abbee-f882-42de-b9d4-031b096676bc'),(4,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"64586fe6-dda7-4d89-b978-a3e651f56501\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0cd78069-1878-4d0e-85cc-9a8d65311cdb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"86a9bff4-35a7-4748-8dce-ad0e3139a069\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subheadline\", \"width\": 100, \"handle\": \"Subheadline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"c53d75b5-67d6-47b2-b41a-327f91a1c146\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"button\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button Two\", \"width\": 100, \"handle\": \"buttonTwo\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:34:06','2026-03-25 14:34:15',NULL,'4a670768-d431-43e7-9622-21d72c90f053'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"2bda75ac-9d20-4c73-95d6-b9b86ee9722a\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"required\": false, \"dateAdded\": \"2026-03-25T14:51:44+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"67c0702d-602b-4460-a842-68b69569157a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d2dbcdc7-ca53-408a-8df4-99d795133201\", \"required\": false, \"dateAdded\": \"2026-03-25T14:51:44+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"13565fba-b2f9-432c-b4f9-ef1b99eb911c\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"hero\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"57c417d6-920f-49f6-a35f-d01401a86a3d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0119d5ec-bfd1-4692-a006-407e05e36d20\", \"required\": false, \"dateAdded\": \"2026-03-28T22:01:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"0ae1e2fd-df8a-4f54-86b8-b48ca05f67ff\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"productCarousel\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:51:44','2026-03-28 22:17:09',NULL,'1f6fda9f-8346-4063-a50c-9ddafd204e07'),(6,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:01:03','2026-03-28 22:01:03',NULL,'2e18bd7b-7791-42d0-a644-39515e19122f'),(7,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:14:35','2026-03-28 22:14:35',NULL,'9e0f7050-8b3e-4182-a4da-a1160fff658c'),(8,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:16:08','2026-03-28 22:16:08',NULL,'60305552-5b6f-441b-afac-ab00f74184b2');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Plain Text','plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-03-25 14:01:05','2026-03-25 14:01:05',NULL,'4d7ec46f-500b-47b6-8eba-f2f42e8066c1'),(2,'Link Field','linkField','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"advancedFields\":[\"target\",\"title\",\"id\",\"download\"],\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"asset\":{\"allowedKinds\":[\"image\",\"pdf\",\"text\",\"video\",\"word\"],\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"1\",\"allowCustomSchemes\":\"\"}},\"types\":[\"entry\",\"url\",\"asset\",\"category\",\"email\",\"tel\",\"product\"]}','2026-03-25 14:09:49','2026-03-25 14:16:44',NULL,'5eec91ac-9cac-40d5-915a-f973014bad60'),(3,'Block Type','blockType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"Hero\",\"value\":\"hero\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Product Carousel\",\"value\":\"productCarousel\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Split Section\",\"value\":\"splitSection\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2026-03-25 14:30:59','2026-03-28 22:15:01',NULL,'29323bbb-b103-4d28-aafb-f37b64ee4ae3'),(4,'Hero Block','heroBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"4a670768-d431-43e7-9622-21d72c90f053\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"64586fe6-dda7-4d89-b978-a3e651f56501\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrowText\",\"label\":\"Eyebrow Text\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"3db4929f-d6dd-47ab-bb3b-1352061a74ac\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"headline\",\"label\":\"Headline\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"Subheadline\",\"label\":\"Subheadline\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"86a9bff4-35a7-4748-8dce-ad0e3139a069\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"button\",\"label\":\"Button\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"c53d75b5-67d6-47b2-b41a-327f91a1c146\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"buttonTwo\",\"label\":\"Button Two\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-03-25 14:31:44','2026-03-25 14:34:15',NULL,'d2dbcdc7-ca53-408a-8df4-99d795133201'),(5,'Block Picker','blockPicker','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":\"New block\",\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"0c390a43-79fb-43af-89ea-7b8a7c41d3d7\",\"group\":\"General\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2026-03-25 14:41:24','2026-03-25 14:51:59',NULL,'e91396d1-d7c4-4b1b-a3e9-55972a84ff9c'),(6,'Product Carousel Block','productCarouselBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"viewMode\":\"grouped\"}','2026-03-28 22:00:56','2026-03-28 22:01:03',NULL,'0119d5ec-bfd1-4692-a006-407e05e36d20'),(7,'Split Section Block','splitSectionBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"viewMode\":\"grouped\",\"fieldLayouts\":{\"60305552-5b6f-441b-afac-ab00f74184b2\":null}}','2026-03-28 22:14:35','2026-03-28 22:16:08',NULL,'46d1905d-56db-493d-90c0-5de9d9910388');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
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
INSERT INTO `info` VALUES (1,'5.9.16','5.9.0.8',0,'fecgodpxgxjr','3@jiljruxgii','2026-03-12 17:35:44','2026-03-28 22:17:09','bdb1fde7-0ca3-4ae0-9d78-8b50b127bbd3');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','a20bf386-7a2b-43b0-9928-b317decf2c48'),(2,'craft','m221101_115859_create_entries_authors_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','b9fd361d-6b9a-4b4c-bad7-d7aec1ba7aae'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','66259b27-a785-4263-af36-b4a8299aefc6'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','aa0fbf45-7ed2-415a-a6c5-70575a2c6bc0'),(5,'craft','m230314_110309_add_authenticator_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','e918579a-45ba-4b8d-81a6-d14269ab9ea8'),(6,'craft','m230314_111234_add_webauthn_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','3b47b684-b935-4b66-8d79-455796ec9764'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','1a0c9808-207c-4d43-bd69-f83ec7bfc751'),(8,'craft','m230511_000000_field_layout_configs','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','19a2bdce-90b4-4140-9630-7f40d5cb370b'),(9,'craft','m230511_215903_content_refactor','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c7ef5c1c-2e30-49fe-b749-157bb9a910c5'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','1e85dc00-aab3-493d-80ef-cbcff97794a1'),(11,'craft','m230524_000001_entry_type_icons','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','78ee0605-e495-4d38-b723-e706dccaabb6'),(12,'craft','m230524_000002_entry_type_colors','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c7d7293f-9d6b-4733-8e4a-c8deaa05466e'),(13,'craft','m230524_220029_global_entry_types','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','4b1f7b12-434f-49a1-974c-3592d2e9619a'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','da89b2ae-beee-4650-849a-62809815dbab'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','ca78b914-9fab-489f-b68d-c90f73ea1627'),(16,'craft','m230616_173810_kill_field_groups','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c3b95a84-1ddb-4b00-a921-2612a719a202'),(17,'craft','m230616_183820_remove_field_name_limit','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','41303200-9639-43a4-a4ac-ae16c1be1aee'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','7490fcee-134f-4e44-972b-0a3799c323fb'),(19,'craft','m230710_162700_element_activity','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','3e7ca49a-5075-49aa-9e1a-7411362a542c'),(20,'craft','m230820_162023_fix_cache_id_type','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','de5140cf-8e00-4fdd-b215-a26542eaa1e0'),(21,'craft','m230826_094050_fix_session_id_type','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','f8db394a-1532-441d-901d-e2066a1b3fab'),(22,'craft','m230904_190356_address_fields','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','2dff87f8-499b-4760-9f30-b63d3fd09f84'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','b5f8e29d-6bac-40bc-9028-20abfefc59c2'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','195e16b4-06ef-40ab-9d13-dc98900555fa'),(25,'craft','m231213_030600_element_bulk_ops','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','40538aeb-2f3c-4d93-bf2d-b27ee481c6aa'),(26,'craft','m240129_150719_sites_language_amend_length','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c7bd2f72-5a43-45b0-a8c8-a23ed99985fd'),(27,'craft','m240206_035135_convert_json_columns','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','1b16ae52-a7d0-4560-a239-4f6b9f34ae1c'),(28,'craft','m240207_182452_address_line_3','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','400e7a15-8bbc-47d4-a1bf-31f63caddf7c'),(29,'craft','m240302_212719_solo_preview_targets','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','43290dbb-491c-4f41-95c3-a13376d54c73'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','3a1c9e8f-0ded-43c7-9255-6157f954c79e'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','5b19adb2-9ca8-4d93-af12-11fd4b1f2393'),(32,'craft','m240731_053543_soft_delete_fields','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','5e504251-6405-4bb9-b574-cf428ffee1a8'),(33,'craft','m240805_154041_sso_identities','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','be6a6bfd-03cc-4083-a131-c1e3c052ab14'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','4167c866-d7e6-458b-b58f-6e2d494f4745'),(35,'craft','m241120_190905_user_affiliated_sites','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','9642cabe-05fc-4dcc-8cfd-3c4261f1bf92'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','9cc55afa-8a1f-495a-b7fb-2df1038be996'),(37,'craft','m250119_135304_entry_type_overrides','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','2ab2024d-8b47-4dcc-996f-cc5d6a45f270'),(38,'craft','m250206_135036_search_index_queue','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','a0b8f09f-ab5d-4aeb-b319-78b0baac4273'),(39,'craft','m250207_172349_bulkop_events','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','71039257-d0ad-48e8-8f40-f104f4399a0a'),(40,'craft','m250315_131608_unlimited_authors','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','84c585dd-c03d-4063-a8fb-604d4f67954a'),(41,'craft','m250403_171253_static_statuses','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','729d6528-94d6-4f2c-ba50-f1621e812798'),(42,'craft','m250512_164202_asset_mime_types','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','aa0b6cad-6e4e-47f1-94ad-ea73553205c0'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','de593bfe-35ce-43ca-8222-9ecb789cef78'),(44,'craft','m250531_183058_content_blocks','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','b565af7e-ca43-45f8-a1da-c9f279789e8b'),(45,'craft','m250623_105031_entry_type_descriptions','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c5e2ad72-86a4-4d56-9ca2-a6c2e2dd733d'),(46,'craft','m250910_144630_add_elements_owners_sort_order_index','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','260a9b69-3e9f-4034-8e23-2ca0a76f78da'),(47,'craft','m251030_203440_drop_widgets_enabled_column','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c2564e59-4dc1-4c43-bf3d-8bcb0db4404a'),(48,'craft','m251110_192405_entry_type_ui_label_formats','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','674c4263-c06f-443c-9003-2aca9d09c25f'),(49,'craft','m251205_190131_drop_searchindexqueue_fk','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','ae4e0875-bdd0-4178-8188-5724db985367'),(50,'craft','m251230_192239_update_field_layouts','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','627ce1e8-5f7a-497e-a97c-a62b7ef9134a'),(51,'craft','m260106_130629_directive_schema_components','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c3454821-d216-4298-b8af-05ac3cfb5d75'),(52,'craft','m260120_120907_line_breaks_in_titles','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','ac7cee81-c3f3-4a37-937d-6a95c5a262fe'),(53,'craft','m260125_233614_changeAuthorForPeerEntries_permission','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','dffee726-427a-4bd9-b8f4-bf8f5bde0613'),(54,'plugin:commerce','Install','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7aade688-b72f-4f78-9c18-6bc2747d2273'),(55,'plugin:commerce','m210614_073359_detailed_permission','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2fca51e6-85ad-4300-9105-ef0649fbe2e4'),(56,'plugin:commerce','m210831_080542_rename_variant_title_format_field','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','eb391375-7e06-4022-91de-a7d6a56f4bf0'),(57,'plugin:commerce','m210901_211323_not_null_booleans','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3b277548-0a06-40f5-b904-64b769366a81'),(58,'plugin:commerce','m210922_133729_add_discount_order_condition_builder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','45b15797-d05a-445c-9b56-c5031ef045eb'),(59,'plugin:commerce','m211118_101920_split_coupon_codes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d0a37a77-7aa8-4a0b-86e4-ae2702d75c70'),(60,'plugin:commerce','m220301_022054_user_addresses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','62d4cfac-96bf-41d6-86fe-c938e3a2d95e'),(61,'plugin:commerce','m220302_133730_add_discount_user_addresses_condition_builders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','72ea1369-6e9c-410a-a52c-9579dcd44727'),(62,'plugin:commerce','m220304_094835_discount_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b7f75c94-79df-4e84-84f1-1b4899c289ca'),(63,'plugin:commerce','m220308_221717_orderhistory_name','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5d4dd02b-dbde-477d-aa21-0b5fb4bb922e'),(64,'plugin:commerce','m220329_075053_convert_gateway_frontend_enabled_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a4b36cfc-a43c-4279-a0c0-62136e461204'),(65,'plugin:commerce','m220706_132118_add_purchasable_tax_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7a0e75f7-d8c2-4aee-bb10-d11d6aa5241d'),(66,'plugin:commerce','m220812_104819_add_primary_payment_source_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ad5ff4a2-14f7-431a-bd8c-20f12ee47dc8'),(67,'plugin:commerce','m220817_135050_add_purchase_total_back_if_missing','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','01d008b5-d579-498d-9028-477496af586c'),(68,'plugin:commerce','m220912_111800_add_order_total_qty_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','27e1569b-e0f6-48dd-a20b-478c2afa16c7'),(69,'plugin:commerce','m221025_083940_add_purchasables_stores_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','abde7a41-ed32-494a-954c-1f32ebd937cf'),(70,'plugin:commerce','m221026_105212_add_catalog_pricing_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','51484b72-f1b4-42c4-ba5c-8dc101223e5f'),(71,'plugin:commerce','m221027_070322_add_tax_shipping_category_soft_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','12a7d832-c9ce-4c2d-8364-d77918962c88'),(72,'plugin:commerce','m221027_074805_update_shipping_tax_category_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','827fee88-87d4-4b5f-aacd-789e592f1d3e'),(73,'plugin:commerce','m221028_192112_add_indexes_to_address_columns_on_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','df2a1531-c7fe-401a-8bf7-adf271e5fa0a'),(74,'plugin:commerce','m221122_055724_move_general_settings_to_per_store_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5118fafa-d72c-436c-b372-828422ba2d67'),(75,'plugin:commerce','m221122_055725_multi_store','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8c95f0d2-3e99-403c-a401-8229971f6ada'),(76,'plugin:commerce','m221122_155735_update_orders_shippingMethodHandle_default','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8630d687-f38e-4eb4-8aeb-3f86dbec66c9'),(77,'plugin:commerce','m221124_114239_add_date_deleted_to_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6dbc8a16-b885-4d08-8d16-14f0bb46a3bd'),(78,'plugin:commerce','m221206_094303_add_store_to_order','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','97c260cd-1d93-4988-9da8-cf4005883902'),(79,'plugin:commerce','m221213_052623_drop_lite','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4a4cb919-2b49-4fcf-9d5d-9857cec9e4d7'),(80,'plugin:commerce','m221213_070807_initial_storeId_records_transition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a5583b6c-a942-4168-9426-acb6f75f2e37'),(81,'plugin:commerce','m230103_122549_add_product_type_max_variants','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bfb0debb-cec9-48a3-a425-880302014cc0'),(82,'plugin:commerce','m230110_052712_site_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e4fc2759-4762-4bf0-9b93-378d1e987cbb'),(83,'plugin:commerce','m230111_112916_update_lineitems_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','99816f11-d8d6-402e-9784-b6cf1e04074c'),(84,'plugin:commerce','m230113_110914_remove_soft_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','dcf071af-7d51-4ec9-98f5-ce082522db13'),(85,'plugin:commerce','m230118_114424_add_purchasables_stores_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e2826c0a-c70e-4483-a60f-b7a422cc233a'),(86,'plugin:commerce','m230126_105337_rename_discount_sales_references','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b3b13f05-ac26-417d-94d4-11025ea261ba'),(87,'plugin:commerce','m230126_114655_add_catalog_pricing_rule_metadata_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1ccc35e8-15c7-47ab-947b-47d33aaad31a'),(88,'plugin:commerce','m230208_130445_add_store_id_to_shipping_categories','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','0175a345-120d-4146-b282-5d5262f35161'),(89,'plugin:commerce','m230210_093749_add_store_id_to_shipping_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4fcde55b-b00b-4f98-9f59-00b85c66dd81'),(90,'plugin:commerce','m230210_141514_add_store_id_to_shipping_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6a3021ff-df26-46ca-ad8d-ce16adb40de1'),(91,'plugin:commerce','m230214_094122_add_total_weight_column_to_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ebbca3a7-9c8d-4813-927d-ff4ca5589933'),(92,'plugin:commerce','m230214_095055_update_name_index_on_shipping_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','19139ad3-feaa-4ab8-9911-a295b219204a'),(93,'plugin:commerce','m230215_083820_add_order_condition_to_shipping_rules','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8b4b1c20-713c-4f54-8083-5905d3a4d40c'),(94,'plugin:commerce','m230215_114552_migrate_shipping_rule_conditions_to_condition_builder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','09b90034-2829-4db0-bac9-6dcde169b236'),(95,'plugin:commerce','m230217_095845_remove_shipping_rules_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b7533393-cb79-446e-bebd-99fcc62ed5ca'),(96,'plugin:commerce','m230217_143255_add_shipping_method_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','04e00277-60e1-4281-9b88-3959fe49794a'),(97,'plugin:commerce','m230220_075106_add_store_id_to_tax_rates','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e715c2b8-d1a7-4994-937d-b9661a87e3d5'),(98,'plugin:commerce','m230220_080107_add_store_id_to_tax_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','63924a53-c28c-48ae-8152-770ee383a3d9'),(99,'plugin:commerce','m230307_091520_add_sort_order_to_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','10237a03-0be9-4940-9a1f-eeb0586a4ef0'),(100,'plugin:commerce','m230308_084340_add_store_id_to_order_statuses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','479e1b0f-5204-47dd-b7b8-6950096454be'),(101,'plugin:commerce','m230310_102639_add_store_id_to_line_item_statuses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2f657d90-8f68-437e-9ab5-3c141d3ae36f'),(102,'plugin:commerce','m230313_095359_add_store_id_to_emails','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6b351e28-a4f8-4188-bc8e-378584604f6e'),(103,'plugin:commerce','m230317_102521_add_store_id_to_pdfs','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','244628f5-4e56-4c7e-99ed-b1024333ca85'),(104,'plugin:commerce','m230322_091615_move_email_settings_to_model','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a8f0d912-6061-4bc0-864f-5addd9f9deb5'),(105,'plugin:commerce','m230328_130343_move_pdf_settings_to_model','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','edda29cf-7791-47c1-a608-ecf6bc5df77e'),(106,'plugin:commerce','m230525_081243_add_has_update_pending_property','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b468089a-f83e-49f3-b4df-182a51dca0f4'),(107,'plugin:commerce','m230530_100604_add_complete_email_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7e75de98-70de-4792-ae2d-62338d0e7c77'),(108,'plugin:commerce','m230705_124845_add_save_address_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','38ba3551-7b87-4649-a5c6-ce11aa6c71d7'),(109,'plugin:commerce','m230719_082348_discount_nullable_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','468be260-47af-4304-9dda-48685eb35676'),(110,'plugin:commerce','m230724_080855_entrify_promotions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','296184c4-1eef-4208-8bcc-e563ccb2fd9d'),(111,'plugin:commerce','m230920_051125_move_primary_currency_to_store_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1ca89bf1-8d90-4aa8-8c16-f7b2d6e9d93a'),(112,'plugin:commerce','m230928_095544_fix_unique_on_some_tables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','de7b928e-81e9-46d1-a48a-9ca85307a3da'),(113,'plugin:commerce','m230928_155052_move_shipping_category_id_to_purchasable_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','cda4d52b-ee7e-4c3e-b9ac-263c382f64ce'),(114,'plugin:commerce','m231006_034833_add_indexes_for_source_address_on_order','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','f55445d4-0a13-4ed1-8ed3-67a45fd1d45d'),(115,'plugin:commerce','m231019_110814_update_variant_ownership','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','42415af7-a552-4e4a-ad90-f814dc4a4a9d'),(116,'plugin:commerce','m231110_081143_inventory_movement_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b8538b42-3524-4897-8056-42ef60dbe2da'),(117,'plugin:commerce','m231201_100454_update_discount_base_discount_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','18a95a80-b2ed-4fda-a3bb-c2141255c8dd'),(118,'plugin:commerce','m240119_073924_content_refactor_elements','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','874489bf-cc6f-4d0c-8077-2b23f61cc8cd'),(119,'plugin:commerce','m240119_075036_content_refactor_subscription_elements','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5176c1d6-2fa8-4a90-86ce-3b0cc4a73492'),(120,'plugin:commerce','m240208_083054_add_purchasable_stores_purchasable_fk','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','29caa140-2ce2-4fd2-bb53-8b2f8cc24ca4'),(121,'plugin:commerce','m240219_194855_donation_multi_store','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ad6faea1-0bb8-4fb8-999c-0efae783fd9c'),(122,'plugin:commerce','m240220_045806_product_versioning','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','279f6cb9-1108-439b-907c-aa0e4e35429e'),(123,'plugin:commerce','m240220_105746_remove_store_from_donations_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3eb5af0f-99ea-44a0-8579-7375ab7206d2'),(124,'plugin:commerce','m240221_030027_transfer_items','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2254100a-7cdd-4005-8b14-ceee5269c86c'),(125,'plugin:commerce','m240223_101158_update_recent_orders_widget_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','eee091ec-ed59-4c91-a385-799925adcdcc'),(126,'plugin:commerce','m240226_002943_remove_lite','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','00b6a5f4-7895-41bc-8e6a-57ccb3dbc4a1'),(127,'plugin:commerce','m240228_054005_rename_movements_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bf673434-13f4-4424-9a1b-5d9c1bc18570'),(128,'plugin:commerce','m240228_060604_add_fufilled_type_to_inventorytransactions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','63f2554b-42db-4652-a3b4-d78308067648'),(129,'plugin:commerce','m240228_120911_drop_order_id_and_make_line_item_cascade','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6c2c1ba4-0f98-416e-b4d3-d1c50ca05d80'),(130,'plugin:commerce','m240301_113924_add_line_item_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7c3c291f-84b6-4d0f-9a1b-b8b64c10b268'),(131,'plugin:commerce','m240306_091057_move_element_ids_on_discount_to_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','efff6932-eb2c-490d-9958-06db47b83618'),(132,'plugin:commerce','m240308_133451_tidy_shipping_categories','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','af77a30e-2c1a-437c-9762-60834fad0460'),(133,'plugin:commerce','m240313_131445_tidy_shipping_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1560f388-674b-4408-b727-f7c3f2a07ad4'),(134,'plugin:commerce','m240315_072659_add_fk_cascade_fixes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','81bc36f6-2c78-4a83-ab04-e07456f5a898'),(135,'plugin:commerce','m240430_161804_add_index_to_transaction_hash','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','05f00058-9ea3-4db5-ab25-8e4cf31d11ff'),(136,'plugin:commerce','m240507_081904_fix_store_pc_location','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3279a7fe-4ccd-46dd-8448-057fdc1e3427'),(137,'plugin:commerce','m240516_035616_update_permissions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a9223d9d-4791-498e-bae1-fea77c626a28'),(138,'plugin:commerce','m240516_035617_update_currency_and_store_general_permissions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ae26981a-2c27-49e6-9f05-fd88dc5572ee'),(139,'plugin:commerce','m240528_124101_add_extra_lineitem_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','fe5d2881-3d2b-4753-842a-753588bd8840'),(140,'plugin:commerce','m240529_095819_remove_commerce_user_field','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','fb488967-681c-451d-88d9-7f22d1492b9d'),(141,'plugin:commerce','m240605_110755_add_title_translations_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','687169b2-6db4-4289-aa08-84b2ddfd305a'),(142,'plugin:commerce','m240619_082224_add_product_and_variant_conditions_to_catalog_pricing_rules','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','32d6aff0-b768-44c4-9abe-58eb1d687fe5'),(143,'plugin:commerce','m240710_125204_ensure_shippingCategoryId_column_is_nullable','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','539bf392-11cf-48a2-973f-f4e5fff7d8d2'),(144,'plugin:commerce','m240711_092240_fix_fks','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','dda0f6e4-b5fa-431c-8da7-67723f7bcfc6'),(145,'plugin:commerce','m240715_045506_drop_available_if_exists','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','66eeb848-eedd-4290-8d37-a23cbe5ac71a'),(146,'plugin:commerce','m240717_044256_add_return_url_to_subscription','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','826ca2a9-0b56-403c-a5ef-ec187cffaa41'),(147,'plugin:commerce','m240718_073046_remove_sortOrder_variants_column_if_exists','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','525dd0b7-17cb-4de1-a7bf-31b69c78c191'),(148,'plugin:commerce','m240808_090256_cascade_delete_variants_on_product_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9a0f3c23-436a-407a-a52f-c1ebfecf515a'),(149,'plugin:commerce','m240808_093934_product_type_propagation','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','54a891a2-c77d-400f-b2ca-03e5bc0956df'),(150,'plugin:commerce','m240812_025615_add_transfer_details_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','da71e711-ae09-4281-b6b0-0c9783b3de70'),(151,'plugin:commerce','m240815_035618_fix_transfer_permission','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3bce0527-ba06-441b-be90-05c2223d8f2e'),(152,'plugin:commerce','m240830_081410_add_extra_indexes_to_catalog_pricing','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d260b057-fae1-4312-852f-a473ed69f628'),(153,'plugin:commerce','m240905_130549_add_require_coupon_code_discount_setting','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','44ffb96a-8358-42dd-94e2-111643288ed4'),(154,'plugin:commerce','m240906_105809_update_existing_coupon_discounts','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a3c4a637-1573-4dc9-bd54-42f85b871324'),(155,'plugin:commerce','m240906_115901_add_orderable_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','620b151b-27b0-4398-8fcf-ea0f9d094694'),(156,'plugin:commerce','m240923_132625_remove_orphaned_variants_sites','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','34a87a5e-c94d-471d-9399-fecddbbe588e'),(157,'plugin:commerce','m241010_061430_rename_orderable_product_type_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','03a88cb8-af4f-4fa0-9d54-790193bfdc76'),(158,'plugin:commerce','m241017_072151_fix_temp_skus','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1213dc37-b0a9-4e4a-bd0c-91c75e6286c4'),(159,'plugin:commerce','m241022_075144_add_missing_variant_revision_records','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a4f29225-62e4-4db4-82b4-529accbe35ae'),(160,'plugin:commerce','m241128_174712_fix_maxLevels_structured_productTypes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5f26fd4e-21c8-444c-b5ca-a9bc81ade2b2'),(161,'plugin:commerce','m241204_045158_enable_tax_rate','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2b7b2419-2da6-4279-ab59-44fe39c74a65'),(162,'plugin:commerce','m241204_091901_fix_store_environment_variables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','18e9613e-531d-42f4-b1d2-3bba983247a8'),(163,'plugin:commerce','m241213_083338_update_promotional_price_in_line_items','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ffa12e51-4e02-4517-ad34-247910795ae1'),(164,'plugin:commerce','m241219_071723_add_inventory_backorder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3be97a2a-4f38-446a-a76a-3597566e07ab'),(165,'plugin:commerce','m241220_082900_remove_inventory_for_non_inventory_purchasables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7a143972-f628-4e78-9278-3cfd7cda0aeb'),(166,'plugin:commerce','m250120_080035_move_to_tax_id_validators','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d5514635-753c-4f70-bb5d-451ba0d28a5a'),(167,'plugin:commerce','m250128_083515_add_make_primary_addresses_to_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','880a4522-217c-4920-8a4a-88447c47b880'),(168,'plugin:commerce','m250129_080909_fix_discount_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','98c9e7dd-e9b9-4b9f-b6f8-f38a9c4086a9'),(169,'plugin:commerce','m250210_125139_fix_cart_recalculation_modes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bfc18138-1cc0-408f-a42d-4f3c05e4c5ef'),(170,'plugin:commerce','m250301_120000_add_gateway_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5104b7f5-5ce2-43e2-8452-25b604486d4b'),(171,'plugin:commerce','m250401_091214_add_shipping_method_customer_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','99060cf4-d77b-4628-bc5c-8e9cad156ea3'),(172,'plugin:commerce','m250403_134328_add_shipping_rule_customer_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9132e3b1-640d-4a21-ae7e-e3d35fc9f277'),(173,'plugin:commerce','m250616_042356_fix_field_layout_id','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3045e4c5-266f-4974-9d91-cd87434dbc34'),(174,'plugin:commerce','m250617_105249_add_email_render_site_id','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','699fb72f-270f-4b78-828c-90e9c5d54a12'),(175,'plugin:commerce','m250701_054128_add_defaultVariant_idex_to_products','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','c409ee25-a29f-4604-86fc-808eaba140a1'),(176,'plugin:commerce','m250721_130616_fix_gateway_order_condition_pc','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','87b7d53c-db2e-48e8-8baa-b22882840a65'),(177,'plugin:commerce','m250731_020627_add_slug_options_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','27dc7c85-26b1-46fd-868a-2601ff12ecea'),(178,'plugin:commerce','m250815_120000_add_gateway_address_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','54bec4bc-e400-44da-bc57-a03efb4aff91'),(179,'plugin:commerce','m250919_111358_fix_methodId_shipping_rules_fk','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','78ccb51c-2057-49e2-9024-068280d79234'),(180,'plugin:commerce','m251003_120720_add_preview_targets_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','aa77b7dd-c2d1-4da8-8bdb-3d4b596a46bf'),(181,'plugin:commerce','m251028_095831_add_order_date_first_paid_property','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','71c83612-6244-4acc-ae4e-942432f0bc10'),(182,'plugin:commerce','m251030_094827_add_link_expiry_to_pdfs','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9bf25330-f53e-4f38-938e-0efe7f603b60'),(183,'plugin:commerce','m251105_194014_add_icon_and_color_to_categories_and_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4c8a7526-3dc9-43b1-9e2e-97dac636c53a'),(184,'plugin:commerce','m251111_092942_ensure_catalog_pricing_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9eb9c4ec-2aec-4cc4-953f-d134cea41318'),(185,'plugin:commerce','m251112_120000_fix_null_gateway_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3c78f6e4-d0ae-45c5-a9cc-b70cb88eaad2'),(186,'plugin:commerce','m260206_000000_add_ui_label_formats','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','30ab3700-d4f7-4c76-9780-755919923f08');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'commerce','5.6.0','5.6.0.0','2026-03-12 17:49:17','2026-03-12 17:49:17','2026-03-12 17:49:17','fc99f9b1-ebab-48f9-8746-3501fdf82681'),(2,'vite','5.0.1','1.0.0','2026-03-12 18:04:30','2026-03-12 18:04:30','2026-03-12 18:04:30','5a4488a1-979f-4c7a-9e26-4804ac550b89');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.elementType','null'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.handle','\"dummy\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.isFrontendEnabled','true'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.name','\"Dummy\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\orders\\\\GatewayOrderCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.elementType','\"craft\\\\commerce\\\\elements\\\\Order\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.paymentType','\"purchase\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.elementType','null'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.sortOrder','99'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.type','\"craft\\\\commerce\\\\gateways\\\\Dummy\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.color','\"green\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.default','true'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.description','null'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.handle','\"new\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.name','\"New\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.sortOrder','99'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.store','\"645bb423-5466-4a2c-a05f-ceeb31bac6e5\"'),('commerce.sitestores.2589bc8f-a277-4da6-ae5f-f294f779bc87.store','\"645bb423-5466-4a2c-a05f-ceeb31bac6e5\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowCheckoutWithoutPayment','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowEmptyCartOnCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowPartialPaymentOnCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetCartShippingMethodOption','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetNewCartAddresses','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetPaymentSource','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.currency','\"USD\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.freeOrderPaymentStrategy','\"complete\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.handle','\"primary\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.minimumTotalPriceStrategy','\"default\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.name','\"Primary\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.orderReferenceFormat','\"{{number[:7]}}\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.primary','true'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireBillingAddressAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireShippingAddressAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireShippingMethodSelectionAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.sortOrder','99'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.useBillingAddressForTax','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.validateOrganizationTaxIdAsVatId','false'),('dateModified','1774736229'),('email.fromEmail','\"jerry@charliesbarkery.com\"'),('email.fromName','\"charlies\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.allowLineBreaksInTitles','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.color','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.description','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.cardThumbAlignment','\"end\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elementCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.dateAdded','\"2026-03-25T14:51:44+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.uid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.dateAdded','\"2026-03-25T14:51:44+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.uid','\"13565fba-b2f9-432c-b4f9-ef1b99eb911c\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.values.0','\"hero\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.fieldUid','\"d2dbcdc7-ca53-408a-8df4-99d795133201\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.uid','\"67c0702d-602b-4460-a842-68b69569157a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.dateAdded','\"2026-03-28T22:01:46+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"0ae1e2fd-df8a-4f54-86b8-b48ca05f67ff\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.values.0','\"productCarousel\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.fieldUid','\"0119d5ec-bfd1-4692-a006-407e05e36d20\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.uid','\"57c417d6-920f-49f6-a35f-d01401a86a3d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.name','\"Content\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.uid','\"2bda75ac-9d20-4c73-95d6-b9b86ee9722a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.thumbFieldKey','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.handle','\"pageBlocksEntry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.hasTitleField','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.icon','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.name','\"Page Blocks Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.showSlugField','true'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.showStatusField','true'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.slugTranslationKeyFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.slugTranslationMethod','\"site\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleTranslationKeyFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleTranslationMethod','\"site\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.uiLabelFormat','\"{title}\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.allowLineBreaksInTitles','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.color','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.description','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.cardThumbAlignment','\"end\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocomplete','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocorrect','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.class','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.dateAdded','\"2026-03-25T14:44:46+00:00\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.disabled','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.id','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.inputType','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.instructions','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.label','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.max','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.min','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.name','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.orientation','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.placeholder','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.readonly','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.required','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.size','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.step','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.tip','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.title','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.uid','\"33eaf735-2da8-403c-8230-8505eabf00a4\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.warning','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.width','100'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.dateAdded','\"2026-03-25T15:34:31+00:00\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.editCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.fieldUid','\"e91396d1-d7c4-4b1b-a3e9-55972a84ff9c\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.handle','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.instructions','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.label','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.required','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.tip','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.uid','\"fb60420e-7f69-437a-8dcb-a6054958208f\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.warning','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.width','100'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.name','\"Content\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.uid','\"bee69b4e-5d3a-4aa2-aa9e-e0e3e517671d\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.thumbFieldKey','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.handle','\"pageHomeEntry\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.hasTitleField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.icon','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.name','\"Page — Home\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.showSlugField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.showStatusField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.slugTranslationKeyFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.slugTranslationMethod','\"site\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleTranslationKeyFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleTranslationMethod','\"site\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.uiLabelFormat','\"{title}\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.columnSuffix','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.handle','\"productCarouselBlock\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.instructions','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.name','\"Product Carousel Block\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.searchable','false'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.settings.viewMode','\"grouped\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.translationKeyFormat','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.translationMethod','\"site\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.columnSuffix','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.handle','\"blockType\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.instructions','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.name','\"Block Type\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.searchable','false'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.customOptions','false'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.0.1','\"Hero\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.1.1','\"hero\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.0.1','\"Product Carousel\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.1.1','\"productCarousel\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.0.1','\"Split Section\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.1.1','\"splitSection\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.translationKeyFormat','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.translationMethod','\"none\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.columnSuffix','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.handle','\"splitSectionBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.instructions','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.name','\"Split Section Block\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.searchable','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.viewMode','\"grouped\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.translationKeyFormat','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.translationMethod','\"site\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.columnSuffix','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.handle','\"plainText\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.instructions','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.name','\"Plain Text\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.searchable','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.byteLimit','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.charLimit','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.code','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.initialRows','4'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.multiline','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.placeholder','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.uiMode','\"normal\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.translationKeyFormat','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.translationMethod','\"none\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.type','\"craft\\\\fields\\\\PlainText\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.columnSuffix','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.handle','\"linkField\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.instructions','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.name','\"Link Field\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.searchable','false'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.0','\"target\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.1','\"title\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.2','\"id\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.3','\"download\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.fullGraphqlData','true'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.maxLength','255'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.showLabelField','true'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.0','\"entry\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.1','\"url\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.2','\"asset\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.3','\"category\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.4','\"email\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.5','\"tel\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.6','\"product\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"allowedKinds\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.0','\"image\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.1','\"pdf\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.2','\"text\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.3','\"video\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.4','\"word\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"showUnpermittedVolumes\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedFiles\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.0','\"url\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowAnchors\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"1\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.translationKeyFormat','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.translationMethod','\"none\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.type','\"craft\\\\fields\\\\Link\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.columnSuffix','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.handle','\"heroBlock\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.instructions','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.name','\"Hero Block\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.searchable','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.0','\"4a670768-d431-43e7-9622-21d72c90f053\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"64586fe6-dda7-4d89-b978-a3e651f56501\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrowText\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow Text\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"3db4929f-d6dd-47ab-bb3b-1352061a74ac\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"headline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Headline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"Subheadline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Subheadline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"86a9bff4-35a7-4748-8dce-ad0e3139a069\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"button\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"Button\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"c53d75b5-67d6-47b2-b41a-327f91a1c146\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.1','\"buttonTwo\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.1','\"Button Two\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.viewMode','\"grouped\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.translationKeyFormat','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.translationMethod','\"site\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.columnSuffix','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.handle','\"blockPicker\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.instructions','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.name','\"Block Picker\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.searchable','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.createButtonLabel','\"New block\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.defaultIndexViewMode','\"cards\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.enableVersioning','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.0.1','\"0c390a43-79fb-43af-89ea-7b8a7c41d3d7\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.includeTableView','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.maxEntries','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.minEntries','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.pageSize','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.propagationKeyFormat','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.propagationMethod','\"all\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.showCardsInGrid','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.viewMode','\"blocks\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.translationKeyFormat','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.translationMethod','\"site\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.type','\"craft\\\\fields\\\\Matrix\"'),('meta.__names__.0119d5ec-bfd1-4692-a006-407e05e36d20','\"Product Carousel Block\"'),('meta.__names__.0c390a43-79fb-43af-89ea-7b8a7c41d3d7','\"Page Blocks Entry\"'),('meta.__names__.2589bc8f-a277-4da6-ae5f-f294f779bc87','\"charlies\"'),('meta.__names__.29323bbb-b103-4d28-aafb-f37b64ee4ae3','\"Block Type\"'),('meta.__names__.46d1905d-56db-493d-90c0-5de9d9910388','\"Split Section Block\"'),('meta.__names__.4d7ec46f-500b-47b6-8eba-f2f42e8066c1','\"Plain Text\"'),('meta.__names__.5eec91ac-9cac-40d5-915a-f973014bad60','\"Link Field\"'),('meta.__names__.645bb423-5466-4a2c-a05f-ceeb31bac6e5','\"Primary\"'),('meta.__names__.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2','\"New\"'),('meta.__names__.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f','\"Dummy\"'),('meta.__names__.b7d4b92a-3550-4709-ba61-d7e4d3829f54','\"Page — Home\"'),('meta.__names__.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46','\"Home Page\"'),('meta.__names__.d2dbcdc7-ca53-408a-8df4-99d795133201','\"Hero Block\"'),('meta.__names__.d79efc26-fed5-43e6-bce8-1d7e7f9846b9','\"charlies\"'),('meta.__names__.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c','\"Block Picker\"'),('plugins.commerce.edition','\"pro\"'),('plugins.commerce.enabled','true'),('plugins.commerce.licenseKey','\"0U6EFPB4B0QWVBY8YV3X7TOY\"'),('plugins.commerce.schemaVersion','\"5.6.0.0\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.defaultPlacement','\"end\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.enableVersioning','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.entryTypes.0.uid','\"b7d4b92a-3550-4709-ba61-d7e4d3829f54\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.handle','\"homePage\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.maxAuthors','1'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.name','\"Home Page\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.label','\"Primary entry page\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.refresh','\"1\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.urlFormat','\"{url}\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.propagationMethod','\"all\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabledByDefault','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.template','\"index.twig\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.uriFormat','\"__home__\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.type','\"single\"'),('siteGroups.d79efc26-fed5-43e6-bce8-1d7e7f9846b9.name','\"charlies\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabled','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.handle','\"default\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.language','\"en\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.name','\"charlies\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.primary','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.siteGroup','\"d79efc26-fed5-43e6-bce8-1d7e7f9846b9\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"charlies\"'),('system.schemaVersion','\"5.9.0.8\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
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
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,''),(3,3,1,3,NULL),(4,3,1,4,NULL),(5,3,1,5,NULL),(6,3,1,6,'Applied “Draft 1”'),(7,3,1,7,'Applied “Draft 1”'),(8,3,1,8,'Applied “Draft 1”'),(9,3,1,9,''),(10,3,1,10,'Applied “Draft 1”'),(11,3,1,11,''),(12,3,1,12,NULL),(13,3,1,13,NULL),(14,3,1,14,NULL),(15,3,1,15,NULL),(16,3,1,16,'Applied “Draft 1”'),(17,3,1,17,'Applied “Draft 1”'),(18,28,1,1,NULL),(19,29,1,1,NULL),(20,3,1,18,'Applied “Draft 1”'),(21,28,1,2,NULL),(22,29,1,2,NULL),(23,3,1,19,''),(24,3,1,20,'Applied “Draft 1”'),(25,42,1,1,NULL),(26,3,1,21,'Applied “Draft 1”'),(27,52,1,1,NULL),(28,3,1,22,'Applied “Draft 1”'),(29,57,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' jerry charliesbarkery com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'addressline1',0,1,''),(2,'addressline2',0,1,''),(2,'addressline3',0,1,''),(2,'administrativearea',0,1,''),(2,'countrycode',0,1,' us '),(2,'dependentlocality',0,1,''),(2,'fullname',0,1,''),(2,'locality',0,1,''),(2,'organization',0,1,''),(2,'organizationtaxid',0,1,''),(2,'postalcode',0,1,''),(2,'slug',0,1,''),(2,'sortingcode',0,1,''),(2,'title',0,1,' store '),(3,'slug',0,1,' home page '),(3,'title',0,1,' home page '),(28,'slug',0,1,' temp juhpquzqlrlrkshojqyuibpjewcwrrmiavbz '),(28,'title',0,1,''),(29,'slug',0,1,''),(42,'slug',0,1,' temp olptniqbrcvowkzmucejwynueaqayriksziw '),(42,'title',0,1,''),(47,'slug',0,1,''),(52,'slug',0,1,' temp rzbsvmxqlpvpseevknimnumdkivfzoibxmbb '),(52,'title',0,1,''),(57,'slug',0,1,' temp xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe '),(57,'title',0,1,'');
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
INSERT INTO `sections` VALUES (1,NULL,'Home Page','homePage','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2026-03-25 13:57:24','2026-03-25 13:57:24',NULL,'b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,2,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2026-03-25 13:57:24','2026-03-25 13:57:24','b4f998e7-d0b9-4e8b-a441-c055e583f8cd');
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
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'jerry@charliesbarkery.com','$2y$13$W2qAPsTYHkeqfNKZNsh6F.x9w0kwBwf0UD0yM1m5vLCa7qTw0R7JC','2026-03-28 21:59:47',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-28 21:59:47');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,NULL,'Temporary Uploads',NULL,'2026-03-25 14:08:03','2026-03-25 14:08:03','5eb1e5fa-0337-4b24-ac74-4716df006b97'),(2,1,NULL,'user_1','user_1/','2026-03-25 14:08:03','2026-03-25 14:08:03','c31482f9-25d2-4d55-b6a8-d8aaf0325296');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
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

-- Dump completed on 2026-03-28 18:19:41
