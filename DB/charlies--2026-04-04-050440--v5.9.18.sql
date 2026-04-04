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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2026-04-04  1:04:40
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
INSERT INTO `changedattributes` VALUES (3,1,'fieldLayoutId','2026-03-25 14:42:33',0,1),(3,1,'title','2026-03-25 14:45:23',0,1),(3,1,'typeId','2026-03-25 14:42:33',0,1),(24,1,'title','2026-03-25 14:45:23',0,1),(28,1,'title','2026-03-25 15:36:14',0,1),(64,1,'title','2026-04-04 03:57:31',0,1),(144,1,'title','2026-04-04 04:05:29',0,1),(229,1,'title','2026-04-04 04:42:31',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,1,'06046102-5b5b-459b-bfc9-b30d0fca0637','2026-03-25 14:11:43',0,1),(3,1,1,'155e57b8-c7fc-4b17-86a3-539f80f5ed0a','2026-03-25 14:11:43',0,1),(3,1,1,'5ce97453-9ece-40ca-ac1b-64149ca635d4','2026-03-25 14:11:29',0,1),(3,1,2,'82655099-51f2-45f3-b4e0-d7289fd79e60','2026-03-25 14:13:57',0,1),(3,1,2,'afd6c57d-6011-47c0-9ed8-510fa3b29b73','2026-03-25 14:13:10',0,1),(3,1,3,'ba5603f2-a7cb-4004-b88b-b781db84dd1f','2026-03-25 14:45:23',0,1),(3,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:42:32',0,1),(28,1,4,'67c0702d-602b-4460-a842-68b69569157a','2026-03-25 15:36:14',0,1),(29,1,2,'6d5ccc92-c8d6-422f-8931-38d5f2e409e3','2026-03-25 15:36:14',0,1),(29,1,2,'c53d75b5-67d6-47b2-b41a-327f91a1c146','2026-03-25 15:36:14',0,1),(30,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-25 15:35:21',0,1),(36,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-25 15:36:14',0,1),(43,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 03:09:25',0,1),(53,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 22:17:28',0,1),(58,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 22:19:12',0,1),(61,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 23:21:39',0,1),(64,1,7,'dbb8f982-78f2-48c4-8258-217588847319','2026-04-04 03:57:31',0,1),(65,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-03-28 23:21:47',0,1),(67,1,1,'4d44aae0-e56d-4315-bfaa-83937eb0421d','2026-04-03 16:05:50',0,1),(67,1,1,'5fd7f09f-bfc0-43e2-a982-7242517a38df','2026-04-03 16:06:19',0,1),(67,1,1,'a9fd0a03-657f-4952-9c55-566045985717','2026-04-04 03:57:31',0,1),(67,1,1,'f075b188-d366-4033-b4ba-472195410663','2026-04-03 16:05:49',0,1),(67,1,16,'a65ee03d-5758-4410-8604-5324d9775b1e','2026-04-03 16:06:19',0,1),(67,1,16,'f531efbe-8694-4e7e-9973-ec72a83577b3','2026-04-03 16:05:50',0,1),(67,1,16,'fa3aa4f4-0531-4405-be51-1ae540e06fb0','2026-04-04 03:57:31',0,1),(67,1,18,'83858805-a6cd-43b6-9279-0edcf7240fb8','2026-04-03 18:44:29',0,1),(71,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 03:19:39',0,1),(75,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 03:42:20',0,1),(82,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 04:06:33',0,1),(88,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 04:06:53',0,1),(94,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 16:04:28',0,1),(100,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 16:04:34',0,1),(106,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 16:04:56',0,1),(112,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 16:05:49',0,1),(118,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 16:06:19',0,1),(123,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 16:22:20',0,1),(132,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 17:48:18',0,1),(138,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:02:34',0,1),(144,1,7,'dbb8f982-78f2-48c4-8258-217588847319','2026-04-04 04:12:57',0,1),(145,1,1,'4d44aae0-e56d-4315-bfaa-83937eb0421d','2026-04-03 18:03:55',0,1),(145,1,1,'5fd7f09f-bfc0-43e2-a982-7242517a38df','2026-04-03 18:05:30',0,1),(145,1,1,'a9fd0a03-657f-4952-9c55-566045985717','2026-04-03 18:05:30',0,1),(145,1,1,'f075b188-d366-4033-b4ba-472195410663','2026-04-03 18:03:55',0,1),(145,1,16,'a65ee03d-5758-4410-8604-5324d9775b1e','2026-04-03 18:05:30',0,1),(145,1,16,'f531efbe-8694-4e7e-9973-ec72a83577b3','2026-04-04 04:12:57',0,1),(145,1,16,'fa3aa4f4-0531-4405-be51-1ae540e06fb0','2026-04-03 18:05:30',0,1),(145,1,18,'83858805-a6cd-43b6-9279-0edcf7240fb8','2026-04-04 04:05:29',0,1),(146,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:02:52',0,1),(152,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:03:55',0,1),(158,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:05:30',0,1),(164,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:36:41',0,1),(168,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:37:18',0,1),(174,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:37:45',0,1),(181,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:42:57',0,1),(187,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:44:08',0,1),(193,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-03 18:44:29',0,1),(199,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 03:57:31',0,1),(206,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:05:19',0,1),(209,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:05:29',0,1),(215,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:12:27',0,1),(221,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:12:57',0,1),(229,1,19,'2d498e12-8f05-456e-aed4-cde0a37e8217','2026-04-04 04:42:31',0,1),(230,1,1,'08cac8fc-1927-49e7-94b7-efa0d85ba5bd','2026-04-04 04:42:31',0,1),(230,1,1,'28b90100-b662-46d8-b047-acc05be249bd','2026-04-04 04:42:31',0,1),(230,1,1,'fb8347f5-df64-4639-8907-a7e8845b4e12','2026-04-04 04:42:31',0,1),(230,1,2,'d9cf0d28-62bf-4618-844e-ca96058c834a','2026-04-04 04:42:31',0,1),(231,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:35:26',0,1),(240,1,5,'fb60420e-7f69-437a-8dcb-a6054958208f','2026-04-04 04:42:31',0,1);
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
INSERT INTO `contentblocks` VALUES (29,28,4),(32,31,4),(38,37,4),(47,42,6),(67,64,7),(73,72,7),(77,76,7),(84,83,7),(90,89,7),(96,95,7),(102,101,7),(108,107,7),(114,113,7),(120,119,7),(125,124,7),(134,133,7),(140,139,7),(145,144,7),(148,147,7),(154,153,7),(160,159,7),(170,169,7),(176,175,7),(183,182,7),(189,188,7),(195,194,7),(201,200,7),(208,207,7),(211,210,7),(217,216,7),(223,222,7),(230,229,19),(233,232,19),(242,241,19);
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
INSERT INTO `elementactivity` VALUES (3,1,1,NULL,'edit','2026-04-04 04:42:24'),(3,1,1,NULL,'save','2026-04-04 04:42:32'),(3,1,1,NULL,'view','2026-04-04 05:03:23');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2026-03-12 17:35:45','2026-03-12 17:35:45',NULL,NULL,NULL,'e6a65f99-d8b8-4732-a2d0-8eab87664dfc'),(2,NULL,NULL,NULL,NULL,'craft\\elements\\Address',1,0,'2026-03-19 20:00:10','2026-03-19 20:00:10',NULL,NULL,NULL,'de78bd12-37b5-4b6a-9cf5-eca2759aff06'),(3,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2026-03-25 13:57:24','2026-04-04 04:42:31',NULL,NULL,NULL,'52117ec7-dc39-4708-b0bd-2c00fab12cbb'),(24,3,NULL,16,2,'craft\\elements\\Entry',1,0,'2026-03-25 14:45:23','2026-03-25 14:45:23',NULL,NULL,NULL,'8e45b76b-211e-4483-8049-29acb0f7471a'),(28,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:36:14',NULL,NULL,NULL,'5dc34ace-f4e6-4b49-9074-c14cd5fabaee'),(29,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:35:21','2026-03-25 15:36:14',NULL,NULL,NULL,'ac7a05e7-5c8b-4387-8884-4561cead9a27'),(30,3,NULL,17,2,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:35:21',NULL,NULL,NULL,'1bfcdba4-23d2-4dac-904c-d1a9d8276a78'),(31,28,NULL,18,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:35:21','2026-03-25 15:35:21',NULL,NULL,NULL,'0b32d946-4718-40a5-9076-b8fbf8e5e5d1'),(32,29,NULL,19,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:35:21','2026-03-25 15:35:21',NULL,NULL,NULL,'0716f4ec-b3fd-4a63-b92b-bae76340ec4b'),(36,3,NULL,20,2,'craft\\elements\\Entry',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'98fdd0dc-d933-4ae0-9c19-03ca7f6c29bb'),(37,28,NULL,21,5,'craft\\elements\\Entry',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'c84aea3c-6b05-4a5e-8dfd-ec36cdb4748f'),(38,29,NULL,22,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-25 15:36:14','2026-03-25 15:36:14',NULL,NULL,NULL,'422f35ce-e410-4a6d-9405-2f5c15cad8df'),(39,3,NULL,23,2,'craft\\elements\\Entry',1,0,'2026-03-25 15:37:03','2026-03-25 15:37:03',NULL,NULL,NULL,'56d6477c-9f6c-4d8a-87cb-e63f4cdf199c'),(42,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'07910d49-eb8a-4eff-bd25-79bd905b6079'),(43,3,NULL,24,2,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'92afe79a-9747-41a4-8e91-19295eb7811a'),(44,42,NULL,25,5,'craft\\elements\\Entry',1,0,'2026-03-28 03:09:25','2026-03-28 03:09:25',NULL,NULL,NULL,'38472fdd-2ae0-4a05-b6a3-1ed95fe87252'),(47,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-28 22:15:26','2026-03-28 22:15:26',NULL,NULL,NULL,'87c8ba6f-c5dd-42e6-9dc8-3d2e8bbfc9bb'),(52,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 23:21:39',NULL,'2026-03-28 23:21:39',NULL,'250a255e-e419-43d2-8aa5-6a9f520d344a'),(53,3,NULL,26,2,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 22:17:28',NULL,NULL,NULL,'0c138eb9-3d57-444d-949e-261e1d808f78'),(54,52,NULL,27,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:17:28','2026-03-28 22:17:28',NULL,'2026-03-28 23:21:39',NULL,'601e442d-3eab-4a6b-b911-f6ff734f2acd'),(57,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 23:21:39',NULL,'2026-03-28 23:21:39',NULL,'e2ca7a56-b5f0-453d-9d9f-302b34ebb8e7'),(58,3,NULL,28,2,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 22:19:12',NULL,NULL,NULL,'0b935efd-d8a4-417b-8609-d73d14b8c445'),(59,57,NULL,29,5,'craft\\elements\\Entry',1,0,'2026-03-28 22:19:12','2026-03-28 22:19:12',NULL,'2026-03-28 23:21:39',NULL,'76494736-0970-479f-a228-4a0cb860cf44'),(61,3,NULL,30,2,'craft\\elements\\Entry',1,0,'2026-03-28 23:21:39','2026-03-28 23:21:39',NULL,NULL,NULL,'8003f5e2-49dc-406e-85ac-5ab6c2e2d23a'),(64,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-03-28 23:21:47','2026-04-04 03:57:31',NULL,NULL,NULL,'be31753f-0b89-4653-897d-f5cd9f2d17de'),(65,3,NULL,31,2,'craft\\elements\\Entry',1,0,'2026-03-28 23:21:47','2026-03-28 23:21:47',NULL,NULL,NULL,'b0450f72-921e-40d0-96d1-fc63c7a40d6a'),(66,64,NULL,32,5,'craft\\elements\\Entry',1,0,'2026-03-28 23:21:47','2026-03-28 23:21:47',NULL,NULL,NULL,'9f663e43-e6d1-4ff1-be62-8332e1137ff2'),(67,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-03-28 23:22:37','2026-04-04 03:57:31',NULL,NULL,NULL,'f562049a-c26d-4efc-9fe4-bdbc4672540d'),(71,3,NULL,33,2,'craft\\elements\\Entry',1,0,'2026-04-03 03:19:39','2026-04-03 03:19:39',NULL,NULL,NULL,'16c03972-c72a-4254-9268-6b1e3cd80bc3'),(72,64,NULL,34,5,'craft\\elements\\Entry',1,0,'2026-04-03 03:19:39','2026-04-03 03:19:39',NULL,NULL,NULL,'c36d3075-807a-410d-9b50-5e9522e90b5b'),(73,67,NULL,35,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 03:19:39','2026-04-03 03:19:39',NULL,NULL,NULL,'b45b9a3f-e8ed-416e-b2ec-13b5777a64f1'),(74,3,NULL,36,2,'craft\\elements\\Entry',1,0,'2026-04-03 03:32:35','2026-04-03 03:32:35',NULL,NULL,NULL,'8780d4b8-9679-4422-88b8-3f350cc15bcc'),(75,3,NULL,37,2,'craft\\elements\\Entry',1,0,'2026-04-03 03:42:20','2026-04-03 03:42:20',NULL,NULL,NULL,'06ce6c0c-a26e-4977-868d-4816dc3ff3d6'),(76,64,NULL,38,5,'craft\\elements\\Entry',1,0,'2026-04-03 03:42:20','2026-04-03 03:42:20',NULL,NULL,NULL,'7ad65bcf-7f0e-46e1-8ec8-7db630cd8f28'),(77,67,NULL,39,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 03:42:20','2026-04-03 03:42:20',NULL,NULL,NULL,'a10d38a0-3379-45fd-95d8-d87249ddede8'),(78,3,NULL,40,2,'craft\\elements\\Entry',1,0,'2026-04-03 03:43:29','2026-04-03 03:43:29',NULL,NULL,NULL,'6ebb6e17-9a6f-4161-aed8-a53299ba6466'),(82,3,NULL,41,2,'craft\\elements\\Entry',1,0,'2026-04-03 04:06:33','2026-04-03 04:06:33',NULL,NULL,NULL,'f78ac036-f327-4965-a91d-390bb8a4fce6'),(83,64,NULL,42,5,'craft\\elements\\Entry',1,0,'2026-04-03 04:06:33','2026-04-03 04:06:33',NULL,NULL,NULL,'a7576f84-94b0-42fb-affc-a8837ca03af2'),(84,67,NULL,43,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 04:06:33','2026-04-03 04:06:33',NULL,NULL,NULL,'d078158c-19ee-4d5a-8c58-10b82d9f90e5'),(88,3,NULL,44,2,'craft\\elements\\Entry',1,0,'2026-04-03 04:06:53','2026-04-03 04:06:53',NULL,NULL,NULL,'dc11ee98-6db2-4bee-b2f9-556523759917'),(89,64,NULL,45,5,'craft\\elements\\Entry',1,0,'2026-04-03 04:06:53','2026-04-03 04:06:53',NULL,NULL,NULL,'7fb7daa6-6008-4575-8af4-6cc87e2c3d8f'),(90,67,NULL,46,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 04:06:53','2026-04-03 04:06:53',NULL,NULL,NULL,'b73da76b-c5a0-4caa-88bc-e431ffc3d1dc'),(94,3,NULL,47,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:04:28','2026-04-03 16:04:28',NULL,NULL,NULL,'ee01059e-1d69-4d65-9ca3-43908a3ad976'),(95,64,NULL,48,5,'craft\\elements\\Entry',1,0,'2026-04-03 16:04:28','2026-04-03 16:04:28',NULL,NULL,NULL,'cb322e51-013f-4494-a914-aa3394bbf8a7'),(96,67,NULL,49,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 16:04:28','2026-04-03 16:04:28',NULL,NULL,NULL,'dde1f411-80fc-4249-bbc2-f04dbea91916'),(100,3,NULL,50,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:04:34','2026-04-03 16:04:34',NULL,NULL,NULL,'1ca7ae8d-ddcf-4a92-b31a-bc94df8b2b30'),(101,64,NULL,51,5,'craft\\elements\\Entry',1,0,'2026-04-03 16:04:34','2026-04-03 16:04:34',NULL,NULL,NULL,'9b87f274-f431-48ae-8bd0-75fa46b3f282'),(102,67,NULL,52,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 16:04:34','2026-04-03 16:04:34',NULL,NULL,NULL,'37492a50-faf8-493a-b9af-8e7922eb1c18'),(106,3,NULL,53,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:04:56','2026-04-03 16:04:56',NULL,NULL,NULL,'b0a83c18-ccfe-41bb-b60a-6a1bfd761039'),(107,64,NULL,54,5,'craft\\elements\\Entry',1,0,'2026-04-03 16:04:56','2026-04-03 16:04:56',NULL,NULL,NULL,'e5e164ea-d14e-442e-83b0-1168cdee8004'),(108,67,NULL,55,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 16:04:56','2026-04-03 16:04:56',NULL,NULL,NULL,'73a95131-0209-47a9-b732-5a2441806331'),(112,3,NULL,56,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:05:49','2026-04-03 16:05:49',NULL,NULL,NULL,'a34c4833-bfcf-43f0-ada1-2920da3ac204'),(113,64,NULL,57,5,'craft\\elements\\Entry',1,0,'2026-04-03 16:05:49','2026-04-03 16:05:49',NULL,NULL,NULL,'4ecc08f5-1fb1-456b-814a-fbc98189af4a'),(114,67,NULL,58,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 16:05:49','2026-04-03 16:05:50',NULL,NULL,NULL,'fdd6ea2a-b7ce-4bab-a091-f0e531d4be11'),(118,3,NULL,59,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:06:19','2026-04-03 16:06:19',NULL,NULL,NULL,'82996f50-f31a-4bb1-8f70-e35406568c6c'),(119,64,NULL,60,5,'craft\\elements\\Entry',1,0,'2026-04-03 16:06:19','2026-04-03 16:06:19',NULL,NULL,NULL,'c1cf3c51-8446-4cf7-b352-f7d4c4db464d'),(120,67,NULL,61,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 16:06:19','2026-04-03 16:06:19',NULL,NULL,NULL,'452d0948-8edc-40e4-afa8-c5c1322593ad'),(121,3,NULL,62,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:21:31','2026-04-03 16:21:31',NULL,NULL,NULL,'689ddff4-d73c-4c48-a16f-5e297386af56'),(122,3,NULL,63,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:21:56','2026-04-03 16:21:56',NULL,NULL,NULL,'e70b83aa-440f-40ea-82b4-f038c93fbfdc'),(123,3,NULL,64,2,'craft\\elements\\Entry',1,0,'2026-04-03 16:22:20','2026-04-03 16:22:20',NULL,NULL,NULL,'3a7b1dca-494d-4b02-9b1e-15aca68bd33b'),(124,64,NULL,65,5,'craft\\elements\\Entry',1,0,'2026-04-03 16:22:20','2026-04-03 16:22:20',NULL,NULL,NULL,'c640550e-7cca-498f-ba3d-0f4c209cdebf'),(125,67,NULL,66,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 16:22:20','2026-04-03 16:22:20',NULL,NULL,NULL,'3f098518-6443-4e0e-98bc-2b9122d7a0ea'),(127,3,NULL,67,2,'craft\\elements\\Entry',1,0,'2026-04-03 17:06:54','2026-04-03 17:06:54',NULL,NULL,NULL,'2504286d-d7e5-4fd7-b0e0-28d259a7576f'),(128,3,NULL,68,2,'craft\\elements\\Entry',1,0,'2026-04-03 17:09:42','2026-04-03 17:09:42',NULL,NULL,NULL,'aa3047a4-618a-4e64-a5f5-a50e08b86002'),(132,3,NULL,69,2,'craft\\elements\\Entry',1,0,'2026-04-03 17:48:18','2026-04-03 17:48:18',NULL,NULL,NULL,'c454b5c2-680b-4530-b567-df0df06c0914'),(133,64,NULL,70,5,'craft\\elements\\Entry',1,0,'2026-04-03 17:48:18','2026-04-03 17:48:18',NULL,NULL,NULL,'77df0419-8ad5-498a-865f-ab733cc65dcd'),(134,67,NULL,71,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 17:48:18','2026-04-03 17:48:18',NULL,NULL,NULL,'a0d5a575-4040-4667-9ace-906ae47f37df'),(138,3,NULL,72,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:34','2026-04-03 18:02:34',NULL,NULL,NULL,'70fdbea0-f679-4e63-9128-56522e2c5344'),(139,64,NULL,73,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:34','2026-04-03 18:02:34',NULL,NULL,NULL,'e059b609-66ac-4f5a-80b6-869323acfd75'),(140,67,NULL,74,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:02:34','2026-04-03 18:02:34',NULL,NULL,NULL,'fd9afb69-df30-4d6d-b086-e286f8587068'),(144,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:52','2026-04-04 04:12:57',NULL,NULL,NULL,'26738c79-c34d-4c43-a7ac-484fd43e3464'),(145,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:02:52','2026-04-04 04:12:57',NULL,NULL,NULL,'a58414f2-600b-487e-941a-837c0685d362'),(146,3,NULL,75,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:52','2026-04-03 18:02:52',NULL,NULL,NULL,'56e983f9-b6f8-497b-8d80-981a6bb5d4c7'),(147,144,NULL,76,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:02:52','2026-04-03 18:02:52',NULL,NULL,NULL,'c8ef1f46-28ad-4751-88c5-4b628031c1e6'),(148,145,NULL,77,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:02:52','2026-04-03 18:02:52',NULL,NULL,NULL,'569a272f-17a8-4869-887c-067ad648c99c'),(152,3,NULL,78,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:03:55','2026-04-03 18:03:55',NULL,NULL,NULL,'aea3333f-531d-43b4-9ca5-fe1cea3e57b9'),(153,144,NULL,79,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:03:55','2026-04-03 18:03:55',NULL,NULL,NULL,'f1679293-60c2-48af-8db9-2c4a770aa96c'),(154,145,NULL,80,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:03:55','2026-04-03 18:03:55',NULL,NULL,NULL,'119a34fc-41d0-4280-b1fa-05b633570c6c'),(158,3,NULL,81,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:05:30','2026-04-03 18:05:30',NULL,NULL,NULL,'d14e1e8e-a163-462c-a788-c43413d21279'),(159,144,NULL,82,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:05:30','2026-04-03 18:05:30',NULL,NULL,NULL,'d113ecd8-c11a-4c85-b5d8-cc13c7d729da'),(160,145,NULL,83,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:05:30','2026-04-03 18:05:30',NULL,NULL,NULL,'274ae81d-96b5-4e3e-9794-2ee21acea0fd'),(161,3,NULL,84,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:16:26','2026-04-03 18:16:26',NULL,NULL,NULL,'c6b6f33e-2ed3-49cc-b5b6-d01dbdbaf322'),(162,3,NULL,85,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:17:16','2026-04-03 18:17:16',NULL,NULL,NULL,'a9c65da4-8909-4039-b0d0-cfd8a0b01183'),(164,3,NULL,86,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:36:41','2026-04-03 18:36:41',NULL,NULL,NULL,'d7d21fe5-d3d8-4e53-a91e-00ab98a767a7'),(168,3,NULL,87,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:18','2026-04-03 18:37:18',NULL,NULL,NULL,'382e8d79-18ec-4af3-9e31-b2d19e07fcc3'),(169,144,NULL,88,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:18','2026-04-03 18:37:18',NULL,NULL,NULL,'e3cd796e-6433-4316-ad1c-e4d2a0c4a1ac'),(170,145,NULL,89,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:37:18','2026-04-03 18:37:18',NULL,NULL,NULL,'86be528e-a37b-468e-892a-21bc415acc74'),(174,3,NULL,90,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:45','2026-04-03 18:37:45',NULL,NULL,NULL,'ba64c289-96f9-403b-b249-bd80784359d8'),(175,144,NULL,91,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:37:45','2026-04-03 18:37:45',NULL,NULL,NULL,'ec3c0f81-530f-4cfe-972d-be42e8dab822'),(176,145,NULL,92,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:37:45','2026-04-03 18:37:45',NULL,NULL,NULL,'d3efdde9-623e-4283-9efa-689387450b82'),(177,3,NULL,93,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:38:57','2026-04-03 18:38:57',NULL,NULL,NULL,'173f64d7-bc3d-4778-b1ab-ddcb43f2c423'),(181,3,NULL,94,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:42:57','2026-04-03 18:42:57',NULL,NULL,NULL,'40a32896-a3cb-4b0f-848d-21efe665344e'),(182,64,NULL,95,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:42:57','2026-04-03 18:42:57',NULL,NULL,NULL,'8988832d-60fe-401f-9418-4e9b87d0eac4'),(183,67,NULL,96,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:42:57','2026-04-03 18:42:57',NULL,NULL,NULL,'e3b0f729-651e-411c-ab0a-b147a8f15711'),(187,3,NULL,97,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:08','2026-04-03 18:44:08',NULL,NULL,NULL,'5466e5ed-2405-4565-afe4-35aaef9a72b9'),(188,64,NULL,98,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:08','2026-04-03 18:44:08',NULL,NULL,NULL,'fea0faf0-2ede-4e0b-bdeb-842fff3cef5b'),(189,67,NULL,99,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:44:08','2026-04-03 18:44:08',NULL,NULL,NULL,'214791e1-33e3-4981-b365-485f777fc205'),(193,3,NULL,100,2,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:29','2026-04-03 18:44:29',NULL,NULL,NULL,'dc8087cc-a753-434d-8ab3-be409259612d'),(194,64,NULL,101,5,'craft\\elements\\Entry',1,0,'2026-04-03 18:44:29','2026-04-03 18:44:29',NULL,NULL,NULL,'1424708b-1609-419a-9275-e6317f5490c2'),(195,67,NULL,102,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-03 18:44:29','2026-04-03 18:44:29',NULL,NULL,NULL,'f4d41948-ba43-49c7-8fd9-8a3f931b9e25'),(199,3,NULL,103,2,'craft\\elements\\Entry',1,0,'2026-04-04 03:57:31','2026-04-04 03:57:31',NULL,NULL,NULL,'946e6d5f-34e7-4132-a8ec-9f8278f46129'),(200,64,NULL,104,5,'craft\\elements\\Entry',1,0,'2026-04-04 03:57:31','2026-04-04 03:57:31',NULL,NULL,NULL,'7959ea49-d306-4eff-a76b-12a7ec8cdcc7'),(201,67,NULL,105,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 03:57:31','2026-04-04 03:57:31',NULL,NULL,NULL,'7ed0ece9-5050-4a7a-b028-4ab31e670c2c'),(202,3,NULL,106,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:05','2026-04-04 04:05:05',NULL,NULL,NULL,'67cf8f1d-ea02-43c4-b8aa-f2ed6b655ce4'),(206,3,NULL,107,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:19','2026-04-04 04:05:19',NULL,NULL,NULL,'20d4f118-0c5b-4d68-a220-508b120e59ee'),(207,144,NULL,108,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:19','2026-04-04 04:05:19',NULL,NULL,NULL,'56d02974-53d3-4e22-92ec-58ff9ff9a09c'),(208,145,NULL,109,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:05:19','2026-04-04 04:05:19',NULL,NULL,NULL,'2a1ca3bb-2efe-4ca9-8d24-e6a6c421e572'),(209,3,NULL,110,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:29','2026-04-04 04:05:29',NULL,NULL,NULL,'ebdf6a46-1f8f-4991-92af-95b3e388565b'),(210,144,NULL,111,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:05:29','2026-04-04 04:05:29',NULL,NULL,NULL,'153c286b-2767-4c47-876f-dabe11f848c3'),(211,145,NULL,112,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:05:29','2026-04-04 04:05:29',NULL,NULL,NULL,'640c22d2-a1b0-4177-8ce1-a0daea9913c7'),(215,3,NULL,113,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:27','2026-04-04 04:12:27',NULL,NULL,NULL,'3d622156-db9f-45a2-8917-b5e2d689164a'),(216,144,NULL,114,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:27','2026-04-04 04:12:27',NULL,NULL,NULL,'c9cd52e6-87ed-4e77-ad9f-9c219556d0e8'),(217,145,NULL,115,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:12:27','2026-04-04 04:12:27',NULL,NULL,NULL,'3be559d3-f77b-43e1-88bb-5cafc533066b'),(221,3,NULL,116,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:57','2026-04-04 04:12:57',NULL,NULL,NULL,'167c71b2-e27f-4507-b52a-c88c9e32a704'),(222,144,NULL,117,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:12:57','2026-04-04 04:12:57',NULL,NULL,NULL,'4cfc4482-69a4-4610-8d35-e7526b2f1588'),(223,145,NULL,118,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:12:57','2026-04-04 04:12:57',NULL,NULL,NULL,'02fd109e-9d7f-495f-b50e-bf05fe839881'),(229,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:35:26','2026-04-04 04:42:31',NULL,NULL,NULL,'0d0da1b3-2f34-4bab-b909-df4b1ab2d0f1'),(230,NULL,NULL,NULL,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:35:26','2026-04-04 04:42:31',NULL,NULL,NULL,'8ddf1964-6636-4a1c-b9d2-052c95554a28'),(231,3,NULL,119,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:35:26','2026-04-04 04:35:26',NULL,NULL,NULL,'af660260-c5d8-4e7f-9263-280c7fc08ef9'),(232,229,NULL,120,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:35:26','2026-04-04 04:35:26',NULL,NULL,NULL,'24deb15b-6d99-4a29-9496-2b86756c93a8'),(233,230,NULL,121,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:35:26','2026-04-04 04:35:26',NULL,NULL,NULL,'0f7c71c5-ac90-49da-b49d-22d935b12daf'),(234,3,NULL,122,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:37:28','2026-04-04 04:37:28',NULL,NULL,NULL,'abdd45a8-ea02-48a2-9061-ede472541308'),(235,3,NULL,123,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:38:46','2026-04-04 04:38:46',NULL,NULL,NULL,'f64efc04-ca28-4e45-88ef-e611f75ed096'),(236,3,NULL,124,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:38:57','2026-04-04 04:38:57',NULL,NULL,NULL,'3106cb20-1257-4e0b-bd8d-66e754c2963e'),(240,3,NULL,125,2,'craft\\elements\\Entry',1,0,'2026-04-04 04:42:31','2026-04-04 04:42:31',NULL,NULL,NULL,'7bffc16c-ea8e-44ed-ad83-23c11ca34936'),(241,229,NULL,126,5,'craft\\elements\\Entry',1,0,'2026-04-04 04:42:31','2026-04-04 04:42:31',NULL,NULL,NULL,'9c18f77e-42b4-4914-936d-e1925ad98671'),(242,230,NULL,127,NULL,'craft\\elements\\ContentBlock',1,0,'2026-04-04 04:42:31','2026-04-04 04:42:31',NULL,NULL,NULL,'d725ee28-2ca4-4bf6-b683-5c0170e526d7');
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
INSERT INTO `elements_owners` VALUES (28,3,1),(29,28,1),(31,30,1),(32,31,1),(37,36,1),(37,39,1),(37,43,1),(37,53,1),(37,58,1),(37,61,1),(37,65,1),(37,71,1),(37,74,1),(37,75,1),(37,78,1),(37,82,1),(37,88,1),(37,94,1),(37,100,1),(37,106,1),(37,112,1),(37,118,1),(37,121,1),(37,122,1),(37,123,1),(37,127,1),(37,128,1),(37,132,1),(37,138,1),(37,146,1),(37,152,1),(37,158,1),(37,161,1),(37,162,1),(37,164,1),(37,168,1),(37,174,1),(37,177,1),(37,181,1),(37,187,1),(37,193,1),(37,199,1),(37,202,1),(37,206,1),(37,209,1),(37,215,1),(37,221,1),(37,231,1),(37,234,1),(37,235,1),(37,236,1),(37,240,1),(38,37,1),(47,42,1),(67,64,1),(73,72,1),(77,76,1),(84,83,1),(90,89,1),(96,95,1),(102,101,1),(108,107,1),(114,113,1),(120,119,1),(125,124,1),(134,133,1),(140,139,1),(145,144,1),(148,147,1),(154,153,1),(160,159,1),(170,169,1),(176,175,1),(183,182,1),(189,188,1),(195,194,1),(201,200,1),(208,207,1),(211,210,1),(217,216,1),(223,222,1),(230,229,1),(233,232,1),(242,241,1),(42,3,2),(44,43,2),(44,53,2),(44,58,2),(44,61,2),(44,65,2),(44,71,2),(44,74,2),(44,75,2),(44,78,2),(44,82,2),(44,88,2),(44,94,2),(44,100,2),(44,106,2),(44,112,2),(44,118,2),(44,121,2),(44,122,2),(44,123,2),(44,127,2),(44,128,2),(44,132,2),(44,138,2),(44,146,2),(44,152,2),(44,158,2),(44,161,2),(44,162,2),(44,164,2),(44,168,2),(44,174,2),(44,177,2),(44,181,2),(44,187,2),(44,193,2),(44,199,2),(44,202,2),(44,206,2),(44,209,2),(44,215,2),(44,221,2),(44,231,2),(44,234,2),(44,235,2),(44,236,2),(44,240,2),(52,3,3),(54,53,3),(54,58,3),(66,65,3),(72,71,3),(72,74,3),(76,75,3),(76,78,3),(83,82,3),(89,88,3),(95,94,3),(101,100,3),(107,106,3),(113,112,3),(119,118,3),(119,121,3),(119,122,3),(124,123,3),(124,127,3),(124,128,3),(133,132,3),(139,138,3),(139,146,3),(139,152,3),(139,158,3),(139,161,3),(139,162,3),(144,3,3),(159,164,3),(169,168,3),(175,174,3),(175,177,3),(175,181,3),(175,187,3),(175,193,3),(175,199,3),(175,202,3),(207,206,3),(210,209,3),(216,215,3),(222,221,3),(222,231,3),(222,234,3),(222,235,3),(222,236,3),(222,240,3),(57,3,4),(59,58,4),(64,3,4),(139,164,4),(139,168,4),(139,174,4),(139,177,4),(147,146,4),(153,152,4),(159,158,4),(159,161,4),(159,162,4),(182,181,4),(188,187,4),(194,193,4),(200,199,4),(200,202,4),(200,206,4),(200,209,4),(200,215,4),(200,221,4),(200,231,4),(200,234,4),(200,235,4),(200,236,4),(200,240,4),(229,3,5),(232,231,5),(232,234,5),(232,235,5),(232,236,5),(241,240,5);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,NULL,NULL,1,'2026-03-12 17:35:45','2026-03-12 17:35:45','bf2a1227-9b30-4d9b-a781-4eee0ab37d98'),(2,2,1,'Store',NULL,NULL,NULL,1,'2026-03-19 20:00:10','2026-03-19 20:00:10','f02022f3-a7db-48fe-b796-118b163421d0'),(3,3,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 13:57:24','2026-03-25 14:45:23','20668cf6-40b0-4041-8510-abb38cff89e9'),(24,24,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 14:45:23','2026-03-25 14:45:23','28e6d79d-789f-4466-9ce5-6b93c33c6f1a'),(28,28,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','8dc77f7c-f03f-4494-944f-abf198215ff1'),(29,29,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/KqPJGqHaUqELJ5Cs9\", \"target\": \"_blank\"}, \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"c53d75b5-67d6-47b2-b41a-327f91a1c146\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}}',1,'2026-03-25 15:35:21','2026-03-25 15:36:14','97ce8045-5d14-496d-bd48-77f52706d192'),(30,30,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 15:35:21','2026-03-25 15:35:21','e06ea0ad-5cd2-47f6-80d4-2250f106ea7f'),(31,31,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','5e797ce7-0ea6-47ba-a416-5680b26b64af'),(32,32,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\"}',1,'2026-03-25 15:35:21','2026-03-25 15:35:21','95e8b005-a6db-43ca-8768-2b5b2fbfde55'),(36,36,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 15:36:14','2026-03-25 15:36:14','73a046cd-3d2d-43ee-a3f8-f1eacbcea72a'),(37,37,1,NULL,'__temp_juhpquzqlrlrkshojqyuibpjewcwrrmiavbz',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"hero\"}',1,'2026-03-25 15:36:14','2026-03-25 15:36:14','dc7c5c1c-152c-489f-9e94-d56c995db96f'),(38,38,1,NULL,NULL,NULL,'{\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\": \"Treats Your Dog Will Beg For\", \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\": \"Handmade in Charlotte, NC\", \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\": {\"type\": \"url\", \"label\": \"Find Us Locally\", \"value\": \"https://maps.app.goo.gl/KqPJGqHaUqELJ5Cs9\", \"target\": \"_blank\"}, \"86a9bff4-35a7-4748-8dce-ad0e3139a069\": \"Small-batch, dog-safe goodies baked fresh — available online, at local farmers markets, and through Charlotte-area shops.\", \"c53d75b5-67d6-47b2-b41a-327f91a1c146\": {\"type\": \"url\", \"label\": \"Shop Now\", \"value\": \"#\"}}',1,'2026-03-25 15:36:14','2026-03-25 15:36:14','a6b286c1-2e45-4b51-908a-11e629755388'),(39,39,1,'Home Page','home-page','__home__',NULL,1,'2026-03-25 15:37:03','2026-03-25 15:37:03','02230044-0058-4394-9271-a901a66ba6bc'),(42,42,1,NULL,'__temp_olptniqbrcvowkzmucejwynueaqayriksziw',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"productCarousel\"}',1,'2026-03-28 03:09:25','2026-03-28 03:09:25','15e69424-6ba3-4e3e-b189-159b3330539c'),(43,43,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 03:09:25','2026-03-28 03:09:25','fd750b0c-1947-4c80-a95c-d77f3162cc8d'),(44,44,1,NULL,'__temp_olptniqbrcvowkzmucejwynueaqayriksziw',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"productCarousel\"}',1,'2026-03-28 03:09:25','2026-03-28 03:09:25','55cb802c-be83-46d2-8037-a202ebb544f8'),(47,47,1,NULL,NULL,NULL,NULL,1,'2026-03-28 22:15:26','2026-03-28 22:15:26','bfd41646-3bb1-4fb9-89c0-b9b8d2d64009'),(52,52,1,NULL,'__temp_rzbsvmxqlpvpseevknimnumdkivfzoibxmbb',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:17:28','2026-03-28 22:17:28','40513ccd-28c5-4c5a-959e-427113d42a47'),(53,53,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 22:17:28','2026-03-28 22:17:28','ac242283-ceec-4097-a49e-e164b168704b'),(54,54,1,NULL,'__temp_rzbsvmxqlpvpseevknimnumdkivfzoibxmbb',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:17:28','2026-03-28 22:17:28','1a14dd2f-06c9-4d84-9c35-53376132b3e4'),(57,57,1,NULL,'__temp_xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:19:12','2026-03-28 22:19:12','cdfd0ab0-69c3-4e9f-8f14-ec63a542f359'),(58,58,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 22:19:12','2026-03-28 22:19:12','44d2419b-6a93-499e-bf65-fe265d28fd68'),(59,59,1,NULL,'__temp_xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 22:19:12','2026-03-28 22:19:12','2632ca3f-3740-4b18-bf02-78c760ac28c3'),(61,61,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 23:21:39','2026-03-28 23:21:39','667f0724-6d6e-4dfa-8bd6-26aaae8587a5'),(64,64,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 23:21:47','2026-03-28 23:21:47','031392cb-e033-475d-95a5-a973ab5b14f9'),(65,65,1,'Home Page','home-page','__home__',NULL,1,'2026-03-28 23:21:47','2026-03-28 23:21:47','750eace4-ee9f-485e-96ce-ba38689cedae'),(66,66,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-03-28 23:21:47','2026-03-28 23:21:47','f7836611-bcae-4cc6-8f87-7260895f7450'),(67,67,1,NULL,NULL,NULL,'{\"0b92e79b-252c-4fdd-9467-b23f1b66911f\": [], \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-03-28 23:22:37','2026-04-03 18:44:29','76a6f393-3c93-40cc-9df3-9f99d2f564bf'),(71,71,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 03:19:39','2026-04-03 03:19:39','431c62db-f3ec-446f-9c52-6113f9c3ee67'),(72,72,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 03:19:39','2026-04-03 03:19:39','0e04fa52-3b47-4fb5-b7d4-6dfabde75dbc'),(73,73,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 03:19:39','2026-04-03 03:19:39','7524af1c-ee7c-430b-a83c-0a9e9a72b7e3'),(74,74,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 03:32:35','2026-04-03 03:32:35','e03d8e0e-4146-4df3-b2b8-eec3f79a9432'),(75,75,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 03:42:20','2026-04-03 03:42:20','dc29f605-761f-433c-abdb-d6ea2e808419'),(76,76,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 03:42:20','2026-04-03 03:42:20','8b098232-396f-41d8-8ed2-d5fdfd6ccf82'),(77,77,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Eyebrow\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 03:42:20','2026-04-03 03:42:20','0952d835-e3da-4ff7-a129-646bf2a3a313'),(78,78,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 03:43:29','2026-04-03 03:43:29','b0836cab-ab05-4f61-8fae-a9ab344b0abb'),(82,82,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 04:06:33','2026-04-03 04:06:33','13d20516-d158-458a-bd4d-005f8f6d535b'),(83,83,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 04:06:33','2026-04-03 04:06:33','945c4a2b-a4a0-48b0-96f0-9bb155a76980'),(84,84,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 04:06:33','2026-04-03 04:06:33','73603378-c725-49e5-8b62-b4d599e763e9'),(88,88,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 04:06:53','2026-04-03 04:06:53','f10fb4e7-2bcd-42cf-875f-3d6a3fc38a97'),(89,89,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 04:06:53','2026-04-03 04:06:53','535ba5fa-eb9f-4e4f-ade8-8d4a566b388c'),(90,90,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 04:06:53','2026-04-03 04:06:53','ef84e9e5-5d06-46e3-aec4-d93e591542d8'),(94,94,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:04:28','2026-04-03 16:04:28','e18ba380-ff8d-4e63-be2a-59bbf8e3232b'),(95,95,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 16:04:28','2026-04-03 16:04:28','f8f93878-11a5-443a-989b-3f385eb33e17'),(96,96,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 16:04:28','2026-04-03 16:04:28','93183c91-a86f-48bb-a6a1-c6b330f0917c'),(100,100,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:04:34','2026-04-03 16:04:34','cfd647c2-9309-4576-ad56-87bf0c591b60'),(101,101,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 16:04:34','2026-04-03 16:04:34','602fd6ef-fe9c-4d75-baec-7066a6202183'),(102,102,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 16:04:34','2026-04-03 16:04:34','359de175-29bd-40d7-a54c-210ce66b0690'),(106,106,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:04:56','2026-04-03 16:04:56','db888d4f-c750-4c46-827a-af49c8fb0b44'),(107,107,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 16:04:56','2026-04-03 16:04:56','cdd530b3-9208-4235-bcc0-61b698084027'),(108,108,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 16:04:56','2026-04-03 16:04:56','b4b92282-457b-42e0-aa42-218053563d9e'),(112,112,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:05:49','2026-04-03 16:05:49','4626cdb5-bef1-4b61-89f7-12856013a469'),(113,113,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 16:05:49','2026-04-03 16:05:49','b2f5a6dc-55e3-4635-8364-ce4b18cc871b'),(114,114,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 16:05:50','2026-04-03 16:05:50','2647fca3-d0e7-45ed-a6b0-c14eadfcde51'),(118,118,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:06:19','2026-04-03 16:06:19','72b6a138-d86a-4fac-8ad8-5f33db6db831'),(119,119,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 16:06:19','2026-04-03 16:06:19','5c8c6738-3d23-4ffd-90de-7913c30aa549'),(120,120,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 16:06:19','2026-04-03 16:06:19','9da48d5c-e77d-4f64-a54a-ff771fcd8227'),(121,121,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:21:31','2026-04-03 16:21:31','a0c4b520-44b8-4aaf-89b1-b99db2e2b49e'),(122,122,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:21:56','2026-04-03 16:21:56','44c122fe-04f2-4ec9-bedd-31fdeb6b68a9'),(123,123,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 16:22:20','2026-04-03 16:22:20','61373460-7560-44f6-88c9-ee3c2d823368'),(124,124,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 16:22:20','2026-04-03 16:22:20','95a3058a-1f91-4b06-a494-5c158779d67e'),(125,125,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"Badge Sub Text\", \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 16:22:20','2026-04-03 16:22:20','1b7891ad-f9b0-41b4-bfd6-abac3680e6ce'),(127,127,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 17:06:54','2026-04-03 17:06:54','439886ee-4024-4de7-b807-77303665b1c3'),(128,128,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 17:09:42','2026-04-03 17:09:42','13098356-0638-416e-9aa9-b3ab1ac8e68d'),(132,132,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 17:48:18','2026-04-03 17:48:18','d76fd7e2-a52f-4353-8067-86384d0b47fa'),(133,133,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 17:48:18','2026-04-03 17:48:18','2ed0574c-1448-44ba-bb07-72cdbbafc061'),(134,134,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 17:48:18','2026-04-03 17:48:18','fef1e23c-1c42-4e23-a391-4c2545e783f3'),(138,138,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:02:34','2026-04-03 18:02:34','46e4cd5c-7100-4634-bb79-34b36c45d878'),(139,139,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:02:34','2026-04-03 18:02:34','5c4e27c8-5e7b-4061-afcb-12b2cc2d8da9'),(140,140,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:02:34','2026-04-03 18:02:34','229211b2-6fc6-40bd-a534-a2fa578db3a8'),(144,144,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:02:52','2026-04-03 18:02:52','e2757675-f287-4ab7-98ac-42088132e98e'),(145,145,1,NULL,NULL,NULL,'{\"0b92e79b-252c-4fdd-9467-b23f1b66911f\": [], \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:02:52','2026-04-04 04:12:57','1d013ea1-9851-49fd-9d1c-f0022257363f'),(146,146,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:02:52','2026-04-03 18:02:52','f6b1022e-fca1-4dfc-9922-e16b9e945917'),(147,147,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:02:52','2026-04-03 18:02:52','98056091-4317-4538-a5aa-abb6bf921098'),(148,148,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:02:52','2026-04-03 18:02:52','ab3fbd97-a6ea-46c4-9a6d-c241db777960'),(152,152,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:03:55','2026-04-03 18:03:55','9a1daf88-2f35-40e4-9586-9bc7094203c3'),(153,153,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:03:55','2026-04-03 18:03:55','a1fa9af4-fc32-4624-8cff-8f44bd747488'),(154,154,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": false, \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:03:55','2026-04-03 18:03:55','c6024c25-4528-43e0-97c8-626d0a1c6c61'),(158,158,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:05:30','2026-04-03 18:05:30','1e25883a-52db-4700-b50a-aa55980a244c'),(159,159,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:05:30','2026-04-03 18:05:30','a6e3f7f3-3dcf-40e8-bfa1-0f502ca72f43'),(160,160,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p>100% dog-safe ingredients<br />Made to order — customizable message<br />Available for pickup or shipping</p>\", \"a3c25b1b-0d05-48dc-85f4-25c8f848c54a\": false, \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:05:30','2026-04-03 18:05:30','bc9eac5d-f9df-4af8-baee-cd39e2f07f51'),(161,161,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:16:26','2026-04-03 18:16:26','95bad8af-ec9d-4bb4-b9dc-9e73a9b5f63f'),(162,162,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:17:16','2026-04-03 18:17:16','3b1ea346-a3ea-4060-8894-a04beb7ea0bd'),(164,164,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:36:41','2026-04-03 18:36:41','8d6287f9-ce30-4455-bca2-0569a51b8311'),(168,168,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:37:18','2026-04-03 18:37:18','aae87159-670b-441a-802f-b0cc7284e630'),(169,169,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:37:18','2026-04-03 18:37:18','89902265-0e20-476b-8e5a-f82f43242597'),(170,170,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p>100% dog-safe ingredients<br />Made to order — customizable message<br />Available for pickup or shipping</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:37:18','2026-04-03 18:37:18','80fd2a57-50b2-4a72-9395-8f207808c404'),(174,174,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:37:45','2026-04-03 18:37:45','f38dbb3e-0929-4ac0-a912-c8bac96cee5a'),(175,175,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:37:45','2026-04-03 18:37:45','9a6f1727-1116-4c67-9121-87f548b14bcf'),(176,176,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p>100% dog-safe ingredients<br />Made to order — customizable message<br />Available for pickup or shipping</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-03 18:37:45','2026-04-03 18:37:45','a5d36771-d03c-4413-8622-9a25f10dd2be'),(177,177,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:38:57','2026-04-03 18:38:57','da8657ea-4e30-4361-9d2d-ab14f152d452'),(181,181,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:42:57','2026-04-03 18:42:57','0f021a7d-d490-4a79-a046-6b53586b8a72'),(182,182,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:42:57','2026-04-03 18:42:57','23994f8c-956a-4253-87a1-cbbb33083efa'),(183,183,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid aperiam, deleniti dolores eaque illum in iure modi nihil nobis officia perferendis quas quia quibusdam quis quod saepe ullam voluptas voluptatem.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:42:57','2026-04-03 18:42:57','06db4781-a4a4-45a5-90be-7565acb26840'),(187,187,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:44:08','2026-04-03 18:44:08','07c24b23-eb0a-40b4-ad5a-ea74568a39a5'),(188,188,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:44:08','2026-04-03 18:44:08','b09024d9-6cb8-43be-9220-dde00af9bb31'),(189,189,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.\\\",<br />\\\"Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:44:08','2026-04-03 18:44:08','c04d48ca-1a01-47bb-b4a5-e16a4a6b5c39'),(193,193,1,'Home Page','home-page','__home__',NULL,1,'2026-04-03 18:44:29','2026-04-03 18:44:29','3642bd9e-8f70-4c07-8274-61435b6c7552'),(194,194,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-03 18:44:29','2026-04-03 18:44:29','a488d6e2-a793-4073-b736-8f0a0eae9c70'),(195,195,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-03 18:44:29','2026-04-03 18:44:29','366b5459-3d27-4e92-ba0c-4b9d9281dc76'),(199,199,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 03:57:31','2026-04-04 03:57:31','096e6d38-4813-4a91-a843-3ecc6350a3a2'),(200,200,1,NULL,'__temp_etssgfgmmofjurapxtfmkrpoyidaadyzacxs',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 03:57:31','2026-04-04 03:57:31','0356a4c1-f316-4fc3-8596-f4b96a3a5a0b'),(201,201,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": false, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"Our story\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Est. in Charlotte, NC\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Charlie\'s Barkery started with one dog, one kitchen, and a whole lot of peanut butter. What began as a hobby turned into a mission — giving dogs the same care and quality ingredients we\'d want for ourselves.<br /> </p><p>Every treat is handmade in small batches using dog-safe, wholesome ingredients. No fillers, no funny stuff — just good food for good dogs.</p>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"f075b188-d366-4033-b4ba-472195410663\": \"Baked with Love, Made for Dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": false}',1,'2026-04-04 03:57:31','2026-04-04 03:57:31','44c01222-d9a0-488c-a886-ae6db95e734c'),(202,202,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:05:05','2026-04-04 04:05:05','9e6932fe-6bab-43bb-8416-b43320a5f68d'),(206,206,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:05:19','2026-04-04 04:05:19','91ebb588-1731-4c0e-b700-c49eeb0f8b6a'),(207,207,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:05:19','2026-04-04 04:05:19','8921eee0-dece-4b0f-b4d7-c26465356761'),(208,208,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:05:19','2026-04-04 04:05:19','7b2f52ee-156a-4f74-9eb2-16f4a284cf9e'),(209,209,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:05:29','2026-04-04 04:05:29','d189f3ab-c6d0-4e55-bfcf-9d28be04abcc'),(210,210,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:05:29','2026-04-04 04:05:29','d29fdede-a0d8-44e2-a3ba-b815340c715e'),(211,211,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:05:29','2026-04-04 04:05:29','a99f0eb0-d116-48d5-bfc4-c8dd597ab0cd'),(215,215,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:12:27','2026-04-04 04:12:27','c9b061f3-19d0-44a1-ae87-e8afaea667c3'),(216,216,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:12:27','2026-04-04 04:12:27','237a11bb-4940-4d39-9049-2c77bf88920a'),(217,217,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": false, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:12:27','2026-04-04 04:12:27','b59bb288-0644-4788-a8a8-1247067fc6c7'),(221,221,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:12:57','2026-04-04 04:12:57','62c68844-8879-4244-a697-5d7ba3edcd2e'),(222,222,1,NULL,'__temp_hhzrcvazyquagjeirsxdtpoymjuamcjdoznk',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"splitSection\"}',1,'2026-04-04 04:12:57','2026-04-04 04:12:57','f9270fc6-c181-4adc-81ee-7a496313b831'),(223,223,1,NULL,NULL,NULL,'{\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\": true, \"4d44aae0-e56d-4315-bfaa-83937eb0421d\": \"make it special\", \"5fd7f09f-bfc0-43e2-a982-7242517a38df\": \"Order 48 hrs in advance\", \"83858805-a6cd-43b6-9279-0edcf7240fb8\": \"<p>Because every pup deserves a moment. Our dog-safe birthday cakes are handmade to order — customizable, frosted, and ready to make tails wag.</p><p> </p><ul style=\\\"list-style-type:disc;\\\"><li>100% dog-safe ingredients</li><li>Made to order — customizable message</li><li>Available for pickup or shipping</li></ul>\", \"a65ee03d-5758-4410-8604-5324d9775b1e\": true, \"a9fd0a03-657f-4952-9c55-566045985717\": \"So we have time to bake it fresh, just for your pup.\", \"f075b188-d366-4033-b4ba-472195410663\": \"Brithday Cakes for very Good dogs\", \"f531efbe-8694-4e7e-9973-ec72a83577b3\": true, \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\": true}',1,'2026-04-04 04:12:57','2026-04-04 04:12:57','165b60c2-8760-4e3f-8bf5-e8041f87ec36'),(229,229,1,NULL,'__temp_oatgqexjbwvdubaytzqxmvxsbnjbzlntisah',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"callToAction\"}',1,'2026-04-04 04:35:26','2026-04-04 04:35:26','29fb6955-9794-4b2d-82df-8f797585e180'),(230,230,1,NULL,NULL,NULL,'{\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\": \"Browse our full range of handmade treats, birthday cakes, and seasonal specials.\", \"28b90100-b662-46d8-b047-acc05be249bd\": \"Ready to Shop?\", \"d9cf0d28-62bf-4618-844e-ca96058c834a\": {\"type\": \"url\", \"label\": \"Shop All Treats\", \"value\": \"#\"}, \"fb8347f5-df64-4639-8907-a7e8845b4e12\": \"Treat your pup\"}',1,'2026-04-04 04:35:26','2026-04-04 04:42:31','be51f35d-c7e6-493a-be20-7489e20212a5'),(231,231,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:35:26','2026-04-04 04:35:26','32ffc013-cfc5-4e93-b9dc-78e607613e5e'),(232,232,1,NULL,'__temp_oatgqexjbwvdubaytzqxmvxsbnjbzlntisah',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"callToAction\"}',1,'2026-04-04 04:35:26','2026-04-04 04:35:26','e9f98852-6c54-47bc-b96c-50018691a925'),(233,233,1,NULL,NULL,NULL,NULL,1,'2026-04-04 04:35:26','2026-04-04 04:35:26','06f18f7d-0a4b-4737-bb13-868914b2149a'),(234,234,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:37:28','2026-04-04 04:37:28','c70027ae-a38e-4ff5-80c4-fa5589f4cd48'),(235,235,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:38:46','2026-04-04 04:38:46','74855b08-9bbf-4ef4-82cb-9fd30c0bbebb'),(236,236,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:38:57','2026-04-04 04:38:57','33281086-d23b-443d-9e5f-d158e0d704b2'),(240,240,1,'Home Page','home-page','__home__',NULL,1,'2026-04-04 04:42:31','2026-04-04 04:42:31','ba0bd132-fdfc-4ba8-aa43-14df0982dff2'),(241,241,1,NULL,'__temp_oatgqexjbwvdubaytzqxmvxsbnjbzlntisah',NULL,'{\"54e0155b-2027-4647-9f61-6a820c7b699d\": \"callToAction\"}',1,'2026-04-04 04:42:31','2026-04-04 04:42:31','e854e56a-cf58-43c9-9d45-8404b0950b1e'),(242,242,1,NULL,NULL,NULL,'{\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\": \"Browse our full range of handmade treats, birthday cakes, and seasonal specials.\", \"28b90100-b662-46d8-b047-acc05be249bd\": \"Ready to Shop?\", \"d9cf0d28-62bf-4618-844e-ca96058c834a\": {\"type\": \"url\", \"label\": \"Shop All Treats\", \"value\": \"#\"}, \"fb8347f5-df64-4639-8907-a7e8845b4e12\": \"Treat your pup\"}',1,'2026-04-04 04:42:31','2026-04-04 04:42:31','f142b1c7-f844-43aa-9046-e19fbe5b2688');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 13:57:24','2026-03-25 14:42:33'),(24,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 14:45:23','2026-03-25 14:45:23'),(28,NULL,NULL,3,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(30,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(31,NULL,NULL,30,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:35:21','2026-03-25 15:35:21'),(36,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 15:36:14','2026-03-25 15:36:14'),(37,NULL,NULL,36,5,3,'2026-03-25 15:34:00',NULL,'live',NULL,NULL,'2026-03-25 15:36:14','2026-03-25 15:36:14'),(39,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-25 15:37:03','2026-03-25 15:37:03'),(42,NULL,NULL,3,5,3,'2026-03-28 03:09:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(43,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(44,NULL,NULL,43,5,3,'2026-03-28 03:09:00',NULL,'live',NULL,NULL,'2026-03-28 03:09:25','2026-03-28 03:09:25'),(52,NULL,NULL,3,5,3,'2026-03-28 22:17:00',NULL,'live',0,0,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(53,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(54,NULL,NULL,53,5,3,'2026-03-28 22:17:00',NULL,'live',NULL,NULL,'2026-03-28 22:17:28','2026-03-28 22:17:28'),(57,NULL,NULL,3,5,3,'2026-03-28 22:19:00',NULL,'live',0,0,'2026-03-28 22:19:12','2026-03-28 22:19:12'),(58,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 22:19:12','2026-03-28 22:19:12'),(59,NULL,NULL,58,5,3,'2026-03-28 22:19:00',NULL,'live',NULL,NULL,'2026-03-28 22:19:12','2026-03-28 22:19:12'),(61,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 23:21:39','2026-03-28 23:21:39'),(64,NULL,NULL,3,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-03-28 23:21:47','2026-03-28 23:21:47'),(65,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-03-28 23:21:47','2026-03-28 23:21:47'),(66,NULL,NULL,65,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-03-28 23:21:47','2026-03-28 23:21:47'),(71,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 03:19:39','2026-04-03 03:19:39'),(72,NULL,NULL,71,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 03:19:39','2026-04-03 03:19:39'),(74,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 03:32:35','2026-04-03 03:32:35'),(75,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 03:42:20','2026-04-03 03:42:20'),(76,NULL,NULL,75,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 03:42:20','2026-04-03 03:42:20'),(78,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 03:43:29','2026-04-03 03:43:29'),(82,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 04:06:33','2026-04-03 04:06:33'),(83,NULL,NULL,82,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 04:06:33','2026-04-03 04:06:33'),(88,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 04:06:53','2026-04-03 04:06:53'),(89,NULL,NULL,88,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 04:06:53','2026-04-03 04:06:53'),(94,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:04:28','2026-04-03 16:04:28'),(95,NULL,NULL,94,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 16:04:28','2026-04-03 16:04:28'),(100,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:04:34','2026-04-03 16:04:34'),(101,NULL,NULL,100,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 16:04:34','2026-04-03 16:04:34'),(106,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:04:56','2026-04-03 16:04:56'),(107,NULL,NULL,106,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 16:04:56','2026-04-03 16:04:56'),(112,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:05:49','2026-04-03 16:05:49'),(113,NULL,NULL,112,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 16:05:50','2026-04-03 16:05:50'),(118,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:06:19','2026-04-03 16:06:19'),(119,NULL,NULL,118,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 16:06:19','2026-04-03 16:06:19'),(121,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:21:31','2026-04-03 16:21:31'),(122,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:21:56','2026-04-03 16:21:56'),(123,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 16:22:20','2026-04-03 16:22:20'),(124,NULL,NULL,123,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 16:22:20','2026-04-03 16:22:20'),(127,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 17:06:54','2026-04-03 17:06:54'),(128,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 17:09:42','2026-04-03 17:09:42'),(132,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 17:48:18','2026-04-03 17:48:18'),(133,NULL,NULL,132,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 17:48:18','2026-04-03 17:48:18'),(138,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:34','2026-04-03 18:02:34'),(139,NULL,NULL,138,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:34','2026-04-03 18:02:34'),(144,NULL,NULL,3,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:52','2026-04-03 18:02:52'),(146,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:52','2026-04-03 18:02:52'),(147,NULL,NULL,146,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:02:52','2026-04-03 18:02:52'),(152,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:03:55','2026-04-03 18:03:55'),(153,NULL,NULL,152,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:03:55','2026-04-03 18:03:55'),(158,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:05:30','2026-04-03 18:05:30'),(159,NULL,NULL,158,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:05:30','2026-04-03 18:05:30'),(161,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:16:26','2026-04-03 18:16:26'),(162,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:17:16','2026-04-03 18:17:16'),(164,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:36:41','2026-04-03 18:36:41'),(168,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:18','2026-04-03 18:37:18'),(169,NULL,NULL,168,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:18','2026-04-03 18:37:18'),(174,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:45','2026-04-03 18:37:45'),(175,NULL,NULL,174,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-03 18:37:45','2026-04-03 18:37:45'),(177,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:38:57','2026-04-03 18:38:57'),(181,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:42:57','2026-04-03 18:42:57'),(182,NULL,NULL,181,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:42:57','2026-04-03 18:42:57'),(187,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:08','2026-04-03 18:44:08'),(188,NULL,NULL,187,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:08','2026-04-03 18:44:08'),(193,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:29','2026-04-03 18:44:29'),(194,NULL,NULL,193,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-03 18:44:29','2026-04-03 18:44:29'),(199,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 03:57:31','2026-04-04 03:57:31'),(200,NULL,NULL,199,5,3,'2026-03-28 23:21:00',NULL,'live',NULL,NULL,'2026-04-04 03:57:31','2026-04-04 03:57:31'),(202,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:05','2026-04-04 04:05:05'),(206,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:19','2026-04-04 04:05:19'),(207,NULL,NULL,206,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:19','2026-04-04 04:05:19'),(209,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:29','2026-04-04 04:05:29'),(210,NULL,NULL,209,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:05:29','2026-04-04 04:05:29'),(215,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:27','2026-04-04 04:12:27'),(216,NULL,NULL,215,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:27','2026-04-04 04:12:27'),(221,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:57','2026-04-04 04:12:57'),(222,NULL,NULL,221,5,3,'2026-04-03 18:02:00',NULL,'live',NULL,NULL,'2026-04-04 04:12:57','2026-04-04 04:12:57'),(229,NULL,NULL,3,5,3,'2026-04-04 04:35:00',NULL,'live',NULL,NULL,'2026-04-04 04:35:26','2026-04-04 04:35:26'),(231,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:35:26','2026-04-04 04:35:26'),(232,NULL,NULL,231,5,3,'2026-04-04 04:35:00',NULL,'live',NULL,NULL,'2026-04-04 04:35:26','2026-04-04 04:35:26'),(234,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:37:28','2026-04-04 04:37:28'),(235,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:38:46','2026-04-04 04:38:46'),(236,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:38:57','2026-04-04 04:38:57'),(240,1,NULL,NULL,NULL,2,'2026-03-25 13:57:00',NULL,'live',NULL,NULL,'2026-04-04 04:42:31','2026-04-04 04:42:31'),(241,NULL,NULL,240,5,3,'2026-04-04 04:35:00',NULL,'live',NULL,NULL,'2026-04-04 04:42:31','2026-04-04 04:42:31');
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
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"25d5974e-d00c-4ae1-b3c7-ca87427ddefd\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"d4293c02-b206-4ab2-ad76-c544ee55e217\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-25T13:55:56+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"7e2ff94c-198a-4d2c-84c9-0d127a74020d\", \"type\": \"craft\\\\fieldlayoutelements\\\\Heading\", \"heading\": \"Hero Section\", \"dateAdded\": \"2026-03-25T14:10:32+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5ce97453-9ece-40ca-ac1b-64149ca635d4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:04:52+00:00\", \"instructions\": \"Eyebrow Text Eyebrow / Kicker (small top text)\", \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"06046102-5b5b-459b-bfc9-b30d0fca0637\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:04:52+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"155e57b8-c7fc-4b17-86a3-539f80f5ed0a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subheadline\", \"width\": 100, \"handle\": \"subheadline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:06:20+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"82655099-51f2-45f3-b4e0-d7289fd79e60\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:09:51+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"afd6c57d-6011-47c0-9ed8-510fa3b29b73\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": \"linkField2\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:10:16+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 13:57:22','2026-03-25 14:11:07','2026-03-25 14:34:34','caeac63d-3450-4753-886c-81962cf78ae2'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"bee69b4e-5d3a-4aa2-aa9e-e0e3e517671d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"33eaf735-2da8-403c-8230-8505eabf00a4\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"required\": true, \"dateAdded\": \"2026-03-25T14:44:46+00:00\", \"inputType\": null, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"fb60420e-7f69-437a-8dcb-a6054958208f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"e91396d1-d7c4-4b1b-a3e9-55972a84ff9c\", \"required\": false, \"dateAdded\": \"2026-03-25T15:34:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:20:44','2026-03-25 15:34:31',NULL,'75d0994b-d90d-4008-bb5d-78000befd65e'),(3,'craft\\elements\\ContentBlock',NULL,'2026-03-25 14:31:44','2026-03-25 14:31:44',NULL,'276abbee-f882-42de-b9d4-031b096676bc'),(4,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"64586fe6-dda7-4d89-b978-a3e651f56501\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"3db4929f-d6dd-47ab-bb3b-1352061a74ac\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrowText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0cd78069-1878-4d0e-85cc-9a8d65311cdb\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"86a9bff4-35a7-4748-8dce-ad0e3139a069\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Subheadline\", \"width\": 100, \"handle\": \"Subheadline\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"c53d75b5-67d6-47b2-b41a-327f91a1c146\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button\", \"width\": 100, \"handle\": \"button\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Button Two\", \"width\": 100, \"handle\": \"buttonTwo\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-25T14:34:06+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:34:06','2026-03-25 14:34:15',NULL,'4a670768-d431-43e7-9622-21d72c90f053'),(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"2bda75ac-9d20-4c73-95d6-b9b86ee9722a\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"required\": false, \"dateAdded\": \"2026-03-25T14:51:44+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"67c0702d-602b-4460-a842-68b69569157a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"d2dbcdc7-ca53-408a-8df4-99d795133201\", \"required\": false, \"dateAdded\": \"2026-03-25T14:51:44+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"13565fba-b2f9-432c-b4f9-ef1b99eb911c\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"hero\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"57c417d6-920f-49f6-a35f-d01401a86a3d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"0119d5ec-bfd1-4692-a006-407e05e36d20\", \"required\": false, \"dateAdded\": \"2026-03-28T22:01:46+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"0ae1e2fd-df8a-4f54-86b8-b48ca05f67ff\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"productCarousel\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"dbb8f982-78f2-48c4-8258-217588847319\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"46d1905d-56db-493d-90c0-5de9d9910388\", \"required\": false, \"dateAdded\": \"2026-03-28T23:22:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"33120c20-0409-43bd-9a82-e4e454039d9f\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"splitSection\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"2d498e12-8f05-456e-aed4-cde0a37e8217\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"dc36f051-fd02-4e59-bf63-204e8eccf224\", \"required\": false, \"dateAdded\": \"2026-04-04T04:31:41+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\", \"elementType\": \"craft\\\\elements\\\\Entry\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"29202f5a-fbae-4c90-bec0-7f7518841fa3\", \"class\": \"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\", \"values\": [\"callToAction\"], \"fieldUid\": \"29323bbb-b103-4d28-aafb-f37b64ee4ae3\", \"operator\": \"in\", \"layoutElementUid\": \"54e0155b-2027-4647-9f61-6a820c7b699d\"}]}, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-25 14:51:44','2026-04-04 04:31:41',NULL,'1f6fda9f-8346-4063-a50c-9ddafd204e07'),(6,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:01:03','2026-03-28 22:01:03',NULL,'2e18bd7b-7791-42d0-a644-39515e19122f'),(7,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:14:35','2026-03-28 22:14:35',NULL,'9e0f7050-8b3e-4182-a4da-a1160fff658c'),(8,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:16:08','2026-03-28 22:16:08',NULL,'60305552-5b6f-441b-afac-ab00f74184b2'),(9,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"08bb808c-0f00-414e-8630-4c6572e9c0b2\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"476c07cd-574a-447c-9c18-76a735aadf55\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow Text\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"e22dce09-0d72-4df3-9bef-8775b4b87f12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Heading\", \"width\": 100, \"handle\": \"heading\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": true, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"9520f8fa-bad4-4a41-83dc-71074276a09a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Body Text\", \"width\": 100, \"handle\": \"body\", \"warning\": null, \"fieldUid\": \"1a574c61-2303-4a8b-86b7-7eb6d32f8310\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"cb5d09f4-db4a-4c57-9708-04ec94de83a9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Bullet Points\", \"width\": 100, \"handle\": \"bullets\", \"warning\": null, \"fieldUid\": \"9a981332-0b86-41c1-9403-d34ea88120a7\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"c99c2670-9403-4602-8815-8368eec327db\", \"name\": \"Image & Badge\", \"elements\": [{\"tip\": null, \"uid\": \"1cc59c78-7566-485b-b5d8-6b4469c1ecc0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image\", \"width\": 100, \"handle\": \"image\", \"warning\": null, \"fieldUid\": \"749757f2-2a14-490e-94f7-20c2e7ee83ec\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"8fa0d4ab-1d2a-41fb-9297-a97168329989\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image on Left\", \"width\": 50, \"handle\": \"imagePosition\", \"warning\": null, \"fieldUid\": \"5ffac5b3-782c-498e-a7d9-42ad705fdbd8\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"815fd70c-acf1-4826-bc98-bdc7fc69b0ec\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Background Color\", \"width\": 50, \"handle\": \"background\", \"warning\": null, \"fieldUid\": \"c2e12686-5149-4457-8555-3c624aed5cf8\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"5e86bf84-8204-49bd-bd48-82f86d93ab49\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Style\", \"width\": 100, \"handle\": \"badgeStyle\", \"warning\": null, \"fieldUid\": \"ca23eb84-fab3-4853-a946-1717643f6acc\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"4b90f090-c9bb-46ec-9806-9ccc9d5e0f8b\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Text\", \"width\": 50, \"handle\": \"badgeText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"98444b6a-3b98-4cf4-abe6-4eb12890833d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Subtext\", \"width\": 50, \"handle\": \"badgeSubtext\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"7dde63eb-b11b-41c3-9b1e-6809b463df44\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Color\", \"width\": 100, \"handle\": \"badgeColor\", \"warning\": null, \"fieldUid\": \"542ec83a-995e-4897-ae72-7fda3f87a4dd\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"431ec017-19f8-403f-abb6-91fb01957eb5\", \"name\": \"CTAs\", \"elements\": [{\"tip\": null, \"uid\": \"a7e41a5e-e32e-455e-922b-558ca83fd5b0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Primary CTA\", \"width\": 100, \"handle\": \"primaryCta\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"2008fbe8-18c5-4142-b38a-f0fe5934c09f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Primary CTA Style\", \"width\": 100, \"handle\": \"primaryCtaStyle\", \"warning\": null, \"fieldUid\": \"d228dd99-209b-4700-9c49-e95c806c2308\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"8f31dc57-59e7-490d-b4df-6b299ed8e183\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Secondary CTA\", \"width\": 100, \"handle\": \"secondaryCta\", \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-03-28T00:00:00+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-28 22:36:49','2026-03-28 22:36:49',NULL,'a57984eb-3ebd-4d82-9816-ebb4a8985c0c'),(10,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:38:43','2026-03-28 22:38:43',NULL,'76d6d6d7-b34a-45ab-92f0-889faec44f64'),(11,'craft\\elements\\ContentBlock',NULL,'2026-03-28 22:38:43','2026-03-28 22:38:43',NULL,'9db20ff8-01b6-449c-b6b3-ecee7634b0d8'),(12,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"c9261752-57ce-419e-a60c-f5cbb1a1067e\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"4c037aa7-7177-41fc-84d2-94d8e8aac99d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Image Right\", \"width\": 25, \"handle\": \"imageRight\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:20:57+00:00\", \"instructions\": \"The image displays on the left by default. Enable this to move it to the right\", \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": \"The default theme is bronze and white. Enable this to switch to the charcoal theme.\", \"uid\": \"f531efbe-8694-4e7e-9973-ec72a83577b3\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Dark Theme\", \"width\": 25, \"handle\": \"darkTheme\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"0b92e79b-252c-4fdd-9467-b23f1b66911f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 25, \"handle\": null, \"warning\": null, \"fieldUid\": \"c2d9c750-d7f6-412a-822c-7571172f15a5\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"4d44aae0-e56d-4315-bfaa-83937eb0421d\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"eyebrow\", \"width\": 25, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"f075b188-d366-4033-b4ba-472195410663\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Heading\", \"width\": 75, \"handle\": \"heading\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"83858805-a6cd-43b6-9279-0edcf7240fb8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\", \"required\": false, \"dateAdded\": \"2026-03-28T23:07:07+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": \"enable a badge on the image.\", \"uid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge\", \"width\": 25, \"handle\": \"badge\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:15:12+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": \"When the Badge is enabled, it defaults to overlay mode. If this lightswitch is turned on, the badge will display in the corner instead.\", \"uid\": \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Overlay\", \"width\": 25, \"handle\": \"badgeOverlay\", \"warning\": null, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"required\": false, \"dateAdded\": \"2026-03-28T23:24:31+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"e68405db-0928-4c2f-b930-df879cc9bb47\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"5fd7f09f-bfc0-43e2-a982-7242517a38df\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Text\", \"width\": 25, \"handle\": \"badgeText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-03-28T23:25:42+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"b87c08e7-328c-4388-a980-57e694f7e449\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\"}]}, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"a9fd0a03-657f-4952-9c55-566045985717\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Badge Sub Text\", \"width\": 25, \"handle\": \"badgeSubText\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-03T16:21:09+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": {\"class\": \"craft\\\\elements\\\\conditions\\\\ElementCondition\", \"elementType\": \"craft\\\\elements\\\\ContentBlock\", \"fieldContext\": \"global\", \"conditionRules\": [{\"uid\": \"585f14d6-aaeb-4c32-baa7-1afa136721db\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"a65ee03d-5758-4410-8604-5324d9775b1e\"}, {\"uid\": \"110eb17b-884e-4aca-bee4-16acd14b8bfb\", \"class\": \"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\", \"value\": true, \"fieldUid\": \"c3351fca-dd41-4318-b6ed-7ea1f921ca34\", \"layoutElementUid\": \"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"}]}, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-03-28 23:07:07','2026-04-04 03:58:03',NULL,'d8e5ef18-5837-4a24-af05-b595b119f921'),(13,'craft\\elements\\ContentBlock','{\"tabs\": [{\"uid\": \"ccbd6b59-b565-46aa-88f6-6f32433c31c5\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"fb8347f5-df64-4639-8907-a7e8845b4e12\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Eyebrow\", \"width\": 100, \"handle\": \"eyebrow\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"28b90100-b662-46d8-b047-acc05be249bd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Heading\", \"width\": 100, \"handle\": \"heading\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Sub Header\", \"width\": 100, \"handle\": \"subHeader\", \"warning\": null, \"fieldUid\": \"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}, {\"tip\": null, \"uid\": \"d9cf0d28-62bf-4618-844e-ca96058c834a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"5eec91ac-9cac-40d5-915a-f973014bad60\", \"required\": false, \"dateAdded\": \"2026-04-04T04:30:29+00:00\", \"instructions\": null, \"editCondition\": null, \"userCondition\": null, \"elementCondition\": null, \"elementEditCondition\": null}], \"userCondition\": null, \"elementCondition\": null}], \"cardView\": [], \"thumbFieldKey\": null, \"generatedFields\": [], \"cardThumbAlignment\": \"end\"}','2026-04-04 04:30:29','2026-04-04 04:38:45',NULL,'741d3f3d-ba77-49c2-8006-ce53f9a6df52');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,'Plain Text','plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-03-25 14:01:05','2026-03-25 14:01:05',NULL,'4d7ec46f-500b-47b6-8eba-f2f42e8066c1'),(2,'Link Field','linkField','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Link','{\"advancedFields\":[\"target\",\"title\",\"id\",\"download\",\"class\"],\"fullGraphqlData\":true,\"maxLength\":255,\"showLabelField\":true,\"typeSettings\":{\"asset\":{\"allowedKinds\":[\"image\",\"pdf\",\"text\",\"video\",\"word\"],\"showUnpermittedVolumes\":\"\",\"showUnpermittedFiles\":\"\"},\"entry\":{\"sources\":\"*\",\"showUnpermittedSections\":\"\",\"showUnpermittedEntries\":\"\"},\"url\":{\"allowRootRelativeUrls\":\"\",\"allowAnchors\":\"1\",\"allowCustomSchemes\":\"\"}},\"types\":[\"entry\",\"url\",\"asset\",\"category\",\"email\",\"tel\",\"product\"]}','2026-03-25 14:09:49','2026-03-28 23:09:28',NULL,'5eec91ac-9cac-40d5-915a-f973014bad60'),(3,'Block Type','blockType','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"Hero\",\"value\":\"hero\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Product Carousel\",\"value\":\"productCarousel\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Split Section\",\"value\":\"splitSection\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"},{\"label\":\"Call To Action \",\"value\":\"callToAction\",\"icon\":\"\",\"color\":\"\",\"default\":\"\"}]}','2026-03-25 14:30:59','2026-04-04 04:31:10',NULL,'29323bbb-b103-4d28-aafb-f37b64ee4ae3'),(4,'Hero Block','heroBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"4a670768-d431-43e7-9622-21d72c90f053\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"64586fe6-dda7-4d89-b978-a3e651f56501\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrowText\",\"label\":\"Eyebrow Text\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"3db4929f-d6dd-47ab-bb3b-1352061a74ac\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"headline\",\"label\":\"Headline\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"Subheadline\",\"label\":\"Subheadline\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"86a9bff4-35a7-4748-8dce-ad0e3139a069\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"button\",\"label\":\"Button\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"c53d75b5-67d6-47b2-b41a-327f91a1c146\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"buttonTwo\",\"label\":\"Button Two\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-25T14:34:06+00:00\",\"uid\":\"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-03-25 14:31:44','2026-03-25 14:34:15',NULL,'d2dbcdc7-ca53-408a-8df4-99d795133201'),(5,'Block Picker','blockPicker','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"enableVersioning\":false,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"defaultIndexViewMode\":\"cards\",\"pageSize\":null,\"createButtonLabel\":\"New block\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"2589bc8f-a277-4da6-ae5f-f294f779bc87\":[]},\"entryTypes\":[{\"uid\":\"0c390a43-79fb-43af-89ea-7b8a7c41d3d7\",\"group\":\"General\"}]}','2026-03-25 14:41:24','2026-03-28 23:22:30',NULL,'e91396d1-d7c4-4b1b-a3e9-55972a84ff9c'),(6,'Product Carousel Block','productCarouselBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"viewMode\":\"grouped\"}','2026-03-28 22:00:56','2026-03-28 22:01:03',NULL,'0119d5ec-bfd1-4692-a006-407e05e36d20'),(7,'Split Section Block','splitSectionBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"d8e5ef18-5837-4a24-af05-b595b119f921\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"c9261752-57ce-419e-a60c-f5cbb1a1067e\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"imageRight\",\"label\":\"Image Right\",\"instructions\":\"The image displays on the left by default. Enable this to move it to the right\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:20:57+00:00\",\"uid\":\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\",\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"darkTheme\",\"label\":\"Dark Theme\",\"tip\":\"The default theme is bronze and white. Enable this to switch to the charcoal theme.\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"f531efbe-8694-4e7e-9973-ec72a83577b3\",\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"0b92e79b-252c-4fdd-9467-b23f1b66911f\",\"fieldUid\":\"c2d9c750-d7f6-412a-822c-7571172f15a5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"eyebrow\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"4d44aae0-e56d-4315-bfaa-83937eb0421d\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"heading\",\"label\":\"Heading\",\"required\":false,\"width\":75,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"f075b188-d366-4033-b4ba-472195410663\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-03-28T23:07:07+00:00\",\"uid\":\"83858805-a6cd-43b6-9279-0edcf7240fb8\",\"fieldUid\":\"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badge\",\"label\":\"Badge\",\"tip\":\"enable a badge on the image.\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:15:12+00:00\",\"uid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\",\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badgeOverlay\",\"label\":\"Badge Overlay\",\"tip\":\"When the Badge is enabled, it defaults to overlay mode. If this lightswitch is turned on, the badge will display in the corner instead.\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:24:31+00:00\",\"uid\":\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"e68405db-0928-4c2f-b930-df879cc9bb47\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\"}]},\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badgeText\",\"label\":\"Badge Text\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-03-28T23:25:42+00:00\",\"uid\":\"5fd7f09f-bfc0-43e2-a982-7242517a38df\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"b87c08e7-328c-4388-a980-57e694f7e449\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\"}]},\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"badgeSubText\",\"label\":\"Badge Sub Text\",\"required\":false,\"width\":25,\"dateAdded\":\"2026-04-03T16:21:09+00:00\",\"uid\":\"a9fd0a03-657f-4952-9c55-566045985717\",\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\ContentBlock\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\ElementCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"585f14d6-aaeb-4c32-baa7-1afa136721db\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"a65ee03d-5758-4410-8604-5324d9775b1e\"},{\"class\":\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\",\"uid\":\"110eb17b-884e-4aca-bee4-16acd14b8bfb\",\"value\":true,\"fieldUid\":\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\",\"layoutElementUid\":\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"}]},\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-03-28 22:14:35','2026-04-04 03:58:03',NULL,'46d1905d-56db-493d-90c0-5de9d9910388'),(8,'Background Color','backgroundDropdown','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"White\",\"value\":\"bg-white\",\"default\":true},{\"label\":\"Charcoal\",\"value\":\"bg-charcoal\",\"default\":false},{\"label\":\"Bronze\",\"value\":\"bg-bronze\",\"default\":false},{\"label\":\"Teal\",\"value\":\"bg-teal\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','c2e12686-5149-4457-8555-3c624aed5cf8'),(9,'Badge Style','badgeStyleDropdown','global',NULL,'Corner = floating badge outside the image. Overlay = frosted glass badge inside the image.',0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"none\",\"default\":true},{\"label\":\"Corner\",\"value\":\"corner\",\"default\":false},{\"label\":\"Overlay\",\"value\":\"overlay\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','ca23eb84-fab3-4853-a946-1717643f6acc'),(10,'Bullet Points','bulletsTable','global',NULL,'Optional checklist items shown beneath the body text.',0,'none',NULL,'craft\\fields\\Table','{\"columns\":{\"col1\":{\"heading\":\"Item\",\"handle\":\"item\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[],\"minRows\":null,\"maxRows\":null,\"staticRows\":false}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','9a981332-0b86-41c1-9403-d34ea88120a7'),(11,'Badge Color','badgeColorDropdown','global',NULL,'Only applies when Badge Style is set to Corner.',0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Bronze\",\"value\":\"bg-bronze\",\"default\":true},{\"label\":\"Teal\",\"value\":\"bg-teal\",\"default\":false},{\"label\":\"Charcoal\",\"value\":\"bg-charcoal\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','542ec83a-995e-4897-ae72-7fda3f87a4dd'),(12,'CTA Style','ctaStyleDropdown','global',NULL,'Solid = charcoal button. Teal = teal button. Ghost = outlined button.',0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Solid\",\"value\":\"solid\",\"default\":true},{\"label\":\"Teal\",\"value\":\"teal\",\"default\":false},{\"label\":\"Ghost\",\"value\":\"ghost\",\"default\":false}]}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','d228dd99-209b-4700-9c49-e95c806c2308'),(13,'Image','assetsImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":1,\"minRelations\":null,\"maxRelations\":1,\"restrictFiles\":true,\"showSiteMenu\":false,\"sources\":\"*\",\"targetSiteId\":null,\"viewMode\":\"list\"}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','749757f2-2a14-490e-94f7-20c2e7ee83ec'),(14,'Body Text','bodyPlainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":6,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','1a574c61-2303-4a8b-86b7-7eb6d32f8310'),(15,'Image on Left','imagePositionLightswitch','global',NULL,'Toggle on to place the image on the left. Off = image on the right.',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":true,\"offLabel\":\"Right\",\"onLabel\":\"Left\"}','2026-03-28 22:36:49','2026-03-28 22:36:49','2026-03-28 22:38:43','5ffac5b3-782c-498e-a7d9-42ad705fdbd8'),(16,'lighswitch','lighswitch','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null,\"showLabelsInCards\":false}','2026-03-28 22:43:17','2026-03-28 22:43:17',NULL,'c3351fca-dd41-4318-b6ed-7ea1f921ca34'),(17,'Image(s)','images','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":null,\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":null,\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2026-03-28 22:44:36','2026-03-28 22:44:36',NULL,'c2d9c750-d7f6-412a-822c-7571172f15a5'),(18,'Rich Text Editor','richTextEditor','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"advancedLinkFields\":null,\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"characterLimit\":null,\"css\":null,\"cssFile\":null,\"defaultTransform\":null,\"defaultUploadLocationSubpath\":null,\"defaultUploadLocationVolume\":null,\"fullGraphqlData\":true,\"headingLevels\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"],\"imageEntryTypeUid\":null,\"imageFieldUid\":null,\"imageMode\":\"img\",\"js\":null,\"jsFile\":null,\"options\":null,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"toolbar\":[\"heading\",\"|\",\"bold\",\"italic\",\"link\",\"bulletedList\"],\"wordLimit\":null}','2026-03-28 23:07:05','2026-04-04 04:05:03',NULL,'64e2bf73-506f-4e6f-9a22-dd5d54f10b77'),(19,'Call To Action Block','callToActionBlock','global',NULL,NULL,0,'site',NULL,'craft\\fields\\ContentBlock','{\"fieldLayouts\":{\"741d3f3d-ba77-49c2-8006-ce53f9a6df52\":{\"tabs\":[{\"name\":\"Content\",\"uid\":\"ccbd6b59-b565-46aa-88f6-6f32433c31c5\",\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"eyebrow\",\"label\":\"Eyebrow\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"fb8347f5-df64-4639-8907-a7e8845b4e12\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"heading\",\"label\":\"Heading\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"28b90100-b662-46d8-b047-acc05be249bd\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"subHeader\",\"label\":\"Sub Header\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\",\"fieldUid\":\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"required\":false,\"width\":100,\"dateAdded\":\"2026-04-04T04:30:29+00:00\",\"uid\":\"d9cf0d28-62bf-4618-844e-ca96058c834a\",\"fieldUid\":\"5eec91ac-9cac-40d5-915a-f973014bad60\"}]}],\"cardThumbAlignment\":\"end\"}},\"viewMode\":\"grouped\"}','2026-04-04 04:30:29','2026-04-04 04:38:45',NULL,'dc36f051-fd02-4e59-bf63-204e8eccf224');
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
INSERT INTO `info` VALUES (1,'5.9.18','5.9.0.8',0,'sqrkwgxeapew','3@gedzpnopwq','2026-03-12 17:35:44','2026-04-04 04:38:45','bdb1fde7-0ca3-4ae0-9d78-8b50b127bbd3');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','a20bf386-7a2b-43b0-9928-b317decf2c48'),(2,'craft','m221101_115859_create_entries_authors_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','b9fd361d-6b9a-4b4c-bad7-d7aec1ba7aae'),(3,'craft','m221107_112121_add_max_authors_to_sections','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','66259b27-a785-4263-af36-b4a8299aefc6'),(4,'craft','m221205_082005_translatable_asset_alt_text','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','aa0fbf45-7ed2-415a-a6c5-70575a2c6bc0'),(5,'craft','m230314_110309_add_authenticator_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','e918579a-45ba-4b8d-81a6-d14269ab9ea8'),(6,'craft','m230314_111234_add_webauthn_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','3b47b684-b935-4b66-8d79-455796ec9764'),(7,'craft','m230503_120303_add_recoverycodes_table','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','1a0c9808-207c-4d43-bd69-f83ec7bfc751'),(8,'craft','m230511_000000_field_layout_configs','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','19a2bdce-90b4-4140-9630-7f40d5cb370b'),(9,'craft','m230511_215903_content_refactor','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c7ef5c1c-2e30-49fe-b749-157bb9a910c5'),(10,'craft','m230524_000000_add_entry_type_show_slug_field','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','1e85dc00-aab3-493d-80ef-cbcff97794a1'),(11,'craft','m230524_000001_entry_type_icons','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','78ee0605-e495-4d38-b723-e706dccaabb6'),(12,'craft','m230524_000002_entry_type_colors','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c7d7293f-9d6b-4733-8e4a-c8deaa05466e'),(13,'craft','m230524_220029_global_entry_types','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','4b1f7b12-434f-49a1-974c-3592d2e9619a'),(14,'craft','m230531_123004_add_entry_type_show_status_field','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','da89b2ae-beee-4650-849a-62809815dbab'),(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','ca78b914-9fab-489f-b68d-c90f73ea1627'),(16,'craft','m230616_173810_kill_field_groups','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','c3b95a84-1ddb-4b00-a921-2612a719a202'),(17,'craft','m230616_183820_remove_field_name_limit','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','41303200-9639-43a4-a4ac-ae16c1be1aee'),(18,'craft','m230617_070415_entrify_matrix_blocks','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','7490fcee-134f-4e44-972b-0a3799c323fb'),(19,'craft','m230710_162700_element_activity','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','3e7ca49a-5075-49aa-9e1a-7411362a542c'),(20,'craft','m230820_162023_fix_cache_id_type','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','de5140cf-8e00-4fdd-b215-a26542eaa1e0'),(21,'craft','m230826_094050_fix_session_id_type','2026-03-12 17:35:46','2026-03-12 17:35:46','2026-03-12 17:35:46','f8db394a-1532-441d-901d-e2066a1b3fab'),(22,'craft','m230904_190356_address_fields','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','2dff87f8-499b-4760-9f30-b63d3fd09f84'),(23,'craft','m230928_144045_add_subpath_to_volumes','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','b5f8e29d-6bac-40bc-9028-20abfefc59c2'),(24,'craft','m231013_185640_changedfields_amend_primary_key','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','195e16b4-06ef-40ab-9d13-dc98900555fa'),(25,'craft','m231213_030600_element_bulk_ops','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','40538aeb-2f3c-4d93-bf2d-b27ee481c6aa'),(26,'craft','m240129_150719_sites_language_amend_length','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c7bd2f72-5a43-45b0-a8c8-a23ed99985fd'),(27,'craft','m240206_035135_convert_json_columns','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','1b16ae52-a7d0-4560-a239-4f6b9f34ae1c'),(28,'craft','m240207_182452_address_line_3','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','400e7a15-8bbc-47d4-a1bf-31f63caddf7c'),(29,'craft','m240302_212719_solo_preview_targets','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','43290dbb-491c-4f41-95c3-a13376d54c73'),(30,'craft','m240619_091352_add_auth_2fa_timestamp','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','3a1c9e8f-0ded-43c7-9255-6157f954c79e'),(31,'craft','m240723_214330_drop_bulkop_fk','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','5b19adb2-9ca8-4d93-af12-11fd4b1f2393'),(32,'craft','m240731_053543_soft_delete_fields','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','5e504251-6405-4bb9-b574-cf428ffee1a8'),(33,'craft','m240805_154041_sso_identities','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','be6a6bfd-03cc-4083-a131-c1e3c052ab14'),(34,'craft','m240926_202248_track_entries_deleted_with_section','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','4167c866-d7e6-458b-b58f-6e2d494f4745'),(35,'craft','m241120_190905_user_affiliated_sites','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','9642cabe-05fc-4dcc-8cfd-3c4261f1bf92'),(36,'craft','m241125_122914_add_viewUsers_permission','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','9cc55afa-8a1f-495a-b7fb-2df1038be996'),(37,'craft','m250119_135304_entry_type_overrides','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','2ab2024d-8b47-4dcc-996f-cc5d6a45f270'),(38,'craft','m250206_135036_search_index_queue','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','a0b8f09f-ab5d-4aeb-b319-78b0baac4273'),(39,'craft','m250207_172349_bulkop_events','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','71039257-d0ad-48e8-8f40-f104f4399a0a'),(40,'craft','m250315_131608_unlimited_authors','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','84c585dd-c03d-4063-a8fb-604d4f67954a'),(41,'craft','m250403_171253_static_statuses','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','729d6528-94d6-4f2c-ba50-f1621e812798'),(42,'craft','m250512_164202_asset_mime_types','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','aa0b6cad-6e4e-47f1-94ad-ea73553205c0'),(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','de593bfe-35ce-43ca-8222-9ecb789cef78'),(44,'craft','m250531_183058_content_blocks','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','b565af7e-ca43-45f8-a1da-c9f279789e8b'),(45,'craft','m250623_105031_entry_type_descriptions','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c5e2ad72-86a4-4d56-9ca2-a6c2e2dd733d'),(46,'craft','m250910_144630_add_elements_owners_sort_order_index','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','260a9b69-3e9f-4034-8e23-2ca0a76f78da'),(47,'craft','m251030_203440_drop_widgets_enabled_column','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c2564e59-4dc1-4c43-bf3d-8bcb0db4404a'),(48,'craft','m251110_192405_entry_type_ui_label_formats','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','674c4263-c06f-443c-9003-2aca9d09c25f'),(49,'craft','m251205_190131_drop_searchindexqueue_fk','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','ae4e0875-bdd0-4178-8188-5724db985367'),(50,'craft','m251230_192239_update_field_layouts','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','627ce1e8-5f7a-497e-a97c-a62b7ef9134a'),(51,'craft','m260106_130629_directive_schema_components','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','c3454821-d216-4298-b8af-05ac3cfb5d75'),(52,'craft','m260120_120907_line_breaks_in_titles','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','ac7cee81-c3f3-4a37-937d-6a95c5a262fe'),(53,'craft','m260125_233614_changeAuthorForPeerEntries_permission','2026-03-12 17:35:47','2026-03-12 17:35:47','2026-03-12 17:35:47','dffee726-427a-4bd9-b8f4-bf8f5bde0613'),(54,'plugin:commerce','Install','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7aade688-b72f-4f78-9c18-6bc2747d2273'),(55,'plugin:commerce','m210614_073359_detailed_permission','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2fca51e6-85ad-4300-9105-ef0649fbe2e4'),(56,'plugin:commerce','m210831_080542_rename_variant_title_format_field','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','eb391375-7e06-4022-91de-a7d6a56f4bf0'),(57,'plugin:commerce','m210901_211323_not_null_booleans','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3b277548-0a06-40f5-b904-64b769366a81'),(58,'plugin:commerce','m210922_133729_add_discount_order_condition_builder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','45b15797-d05a-445c-9b56-c5031ef045eb'),(59,'plugin:commerce','m211118_101920_split_coupon_codes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d0a37a77-7aa8-4a0b-86e4-ae2702d75c70'),(60,'plugin:commerce','m220301_022054_user_addresses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','62d4cfac-96bf-41d6-86fe-c938e3a2d95e'),(61,'plugin:commerce','m220302_133730_add_discount_user_addresses_condition_builders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','72ea1369-6e9c-410a-a52c-9579dcd44727'),(62,'plugin:commerce','m220304_094835_discount_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b7f75c94-79df-4e84-84f1-1b4899c289ca'),(63,'plugin:commerce','m220308_221717_orderhistory_name','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5d4dd02b-dbde-477d-aa21-0b5fb4bb922e'),(64,'plugin:commerce','m220329_075053_convert_gateway_frontend_enabled_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a4b36cfc-a43c-4279-a0c0-62136e461204'),(65,'plugin:commerce','m220706_132118_add_purchasable_tax_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7a0e75f7-d8c2-4aee-bb10-d11d6aa5241d'),(66,'plugin:commerce','m220812_104819_add_primary_payment_source_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ad5ff4a2-14f7-431a-bd8c-20f12ee47dc8'),(67,'plugin:commerce','m220817_135050_add_purchase_total_back_if_missing','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','01d008b5-d579-498d-9028-477496af586c'),(68,'plugin:commerce','m220912_111800_add_order_total_qty_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','27e1569b-e0f6-48dd-a20b-478c2afa16c7'),(69,'plugin:commerce','m221025_083940_add_purchasables_stores_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','abde7a41-ed32-494a-954c-1f32ebd937cf'),(70,'plugin:commerce','m221026_105212_add_catalog_pricing_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','51484b72-f1b4-42c4-ba5c-8dc101223e5f'),(71,'plugin:commerce','m221027_070322_add_tax_shipping_category_soft_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','12a7d832-c9ce-4c2d-8364-d77918962c88'),(72,'plugin:commerce','m221027_074805_update_shipping_tax_category_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','827fee88-87d4-4b5f-aacd-789e592f1d3e'),(73,'plugin:commerce','m221028_192112_add_indexes_to_address_columns_on_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','df2a1531-c7fe-401a-8bf7-adf271e5fa0a'),(74,'plugin:commerce','m221122_055724_move_general_settings_to_per_store_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5118fafa-d72c-436c-b372-828422ba2d67'),(75,'plugin:commerce','m221122_055725_multi_store','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8c95f0d2-3e99-403c-a401-8229971f6ada'),(76,'plugin:commerce','m221122_155735_update_orders_shippingMethodHandle_default','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8630d687-f38e-4eb4-8aeb-3f86dbec66c9'),(77,'plugin:commerce','m221124_114239_add_date_deleted_to_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6dbc8a16-b885-4d08-8d16-14f0bb46a3bd'),(78,'plugin:commerce','m221206_094303_add_store_to_order','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','97c260cd-1d93-4988-9da8-cf4005883902'),(79,'plugin:commerce','m221213_052623_drop_lite','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4a4cb919-2b49-4fcf-9d5d-9857cec9e4d7'),(80,'plugin:commerce','m221213_070807_initial_storeId_records_transition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a5583b6c-a942-4168-9426-acb6f75f2e37'),(81,'plugin:commerce','m230103_122549_add_product_type_max_variants','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bfb0debb-cec9-48a3-a425-880302014cc0'),(82,'plugin:commerce','m230110_052712_site_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e4fc2759-4762-4bf0-9b93-378d1e987cbb'),(83,'plugin:commerce','m230111_112916_update_lineitems_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','99816f11-d8d6-402e-9784-b6cf1e04074c'),(84,'plugin:commerce','m230113_110914_remove_soft_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','dcf071af-7d51-4ec9-98f5-ce082522db13'),(85,'plugin:commerce','m230118_114424_add_purchasables_stores_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e2826c0a-c70e-4483-a60f-b7a422cc233a'),(86,'plugin:commerce','m230126_105337_rename_discount_sales_references','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b3b13f05-ac26-417d-94d4-11025ea261ba'),(87,'plugin:commerce','m230126_114655_add_catalog_pricing_rule_metadata_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1ccc35e8-15c7-47ab-947b-47d33aaad31a'),(88,'plugin:commerce','m230208_130445_add_store_id_to_shipping_categories','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','0175a345-120d-4146-b282-5d5262f35161'),(89,'plugin:commerce','m230210_093749_add_store_id_to_shipping_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4fcde55b-b00b-4f98-9f59-00b85c66dd81'),(90,'plugin:commerce','m230210_141514_add_store_id_to_shipping_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6a3021ff-df26-46ca-ad8d-ce16adb40de1'),(91,'plugin:commerce','m230214_094122_add_total_weight_column_to_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ebbca3a7-9c8d-4813-927d-ff4ca5589933'),(92,'plugin:commerce','m230214_095055_update_name_index_on_shipping_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','19139ad3-feaa-4ab8-9911-a295b219204a'),(93,'plugin:commerce','m230215_083820_add_order_condition_to_shipping_rules','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','8b4b1c20-713c-4f54-8083-5905d3a4d40c'),(94,'plugin:commerce','m230215_114552_migrate_shipping_rule_conditions_to_condition_builder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','09b90034-2829-4db0-bac9-6dcde169b236'),(95,'plugin:commerce','m230217_095845_remove_shipping_rules_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b7533393-cb79-446e-bebd-99fcc62ed5ca'),(96,'plugin:commerce','m230217_143255_add_shipping_method_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','04e00277-60e1-4281-9b88-3959fe49794a'),(97,'plugin:commerce','m230220_075106_add_store_id_to_tax_rates','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','e715c2b8-d1a7-4994-937d-b9661a87e3d5'),(98,'plugin:commerce','m230220_080107_add_store_id_to_tax_zones','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','63924a53-c28c-48ae-8152-770ee383a3d9'),(99,'plugin:commerce','m230307_091520_add_sort_order_to_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','10237a03-0be9-4940-9a1f-eeb0586a4ef0'),(100,'plugin:commerce','m230308_084340_add_store_id_to_order_statuses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','479e1b0f-5204-47dd-b7b8-6950096454be'),(101,'plugin:commerce','m230310_102639_add_store_id_to_line_item_statuses','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2f657d90-8f68-437e-9ab5-3c141d3ae36f'),(102,'plugin:commerce','m230313_095359_add_store_id_to_emails','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6b351e28-a4f8-4188-bc8e-378584604f6e'),(103,'plugin:commerce','m230317_102521_add_store_id_to_pdfs','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','244628f5-4e56-4c7e-99ed-b1024333ca85'),(104,'plugin:commerce','m230322_091615_move_email_settings_to_model','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a8f0d912-6061-4bc0-864f-5addd9f9deb5'),(105,'plugin:commerce','m230328_130343_move_pdf_settings_to_model','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','edda29cf-7791-47c1-a608-ecf6bc5df77e'),(106,'plugin:commerce','m230525_081243_add_has_update_pending_property','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b468089a-f83e-49f3-b4df-182a51dca0f4'),(107,'plugin:commerce','m230530_100604_add_complete_email_column','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7e75de98-70de-4792-ae2d-62338d0e7c77'),(108,'plugin:commerce','m230705_124845_add_save_address_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','38ba3551-7b87-4649-a5c6-ce11aa6c71d7'),(109,'plugin:commerce','m230719_082348_discount_nullable_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','468be260-47af-4304-9dda-48685eb35676'),(110,'plugin:commerce','m230724_080855_entrify_promotions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','296184c4-1eef-4208-8bcc-e563ccb2fd9d'),(111,'plugin:commerce','m230920_051125_move_primary_currency_to_store_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1ca89bf1-8d90-4aa8-8c16-f7b2d6e9d93a'),(112,'plugin:commerce','m230928_095544_fix_unique_on_some_tables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','de7b928e-81e9-46d1-a48a-9ca85307a3da'),(113,'plugin:commerce','m230928_155052_move_shipping_category_id_to_purchasable_stores','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','cda4d52b-ee7e-4c3e-b9ac-263c382f64ce'),(114,'plugin:commerce','m231006_034833_add_indexes_for_source_address_on_order','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','f55445d4-0a13-4ed1-8ed3-67a45fd1d45d'),(115,'plugin:commerce','m231019_110814_update_variant_ownership','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','42415af7-a552-4e4a-ad90-f814dc4a4a9d'),(116,'plugin:commerce','m231110_081143_inventory_movement_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','b8538b42-3524-4897-8056-42ef60dbe2da'),(117,'plugin:commerce','m231201_100454_update_discount_base_discount_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','18a95a80-b2ed-4fda-a3bb-c2141255c8dd'),(118,'plugin:commerce','m240119_073924_content_refactor_elements','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','874489bf-cc6f-4d0c-8077-2b23f61cc8cd'),(119,'plugin:commerce','m240119_075036_content_refactor_subscription_elements','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5176c1d6-2fa8-4a90-86ce-3b0cc4a73492'),(120,'plugin:commerce','m240208_083054_add_purchasable_stores_purchasable_fk','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','29caa140-2ce2-4fd2-bb53-8b2f8cc24ca4'),(121,'plugin:commerce','m240219_194855_donation_multi_store','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ad6faea1-0bb8-4fb8-999c-0efae783fd9c'),(122,'plugin:commerce','m240220_045806_product_versioning','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','279f6cb9-1108-439b-907c-aa0e4e35429e'),(123,'plugin:commerce','m240220_105746_remove_store_from_donations_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3eb5af0f-99ea-44a0-8579-7375ab7206d2'),(124,'plugin:commerce','m240221_030027_transfer_items','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2254100a-7cdd-4005-8b14-ceee5269c86c'),(125,'plugin:commerce','m240223_101158_update_recent_orders_widget_settings','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','eee091ec-ed59-4c91-a385-799925adcdcc'),(126,'plugin:commerce','m240226_002943_remove_lite','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','00b6a5f4-7895-41bc-8e6a-57ccb3dbc4a1'),(127,'plugin:commerce','m240228_054005_rename_movements_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bf673434-13f4-4424-9a1b-5d9c1bc18570'),(128,'plugin:commerce','m240228_060604_add_fufilled_type_to_inventorytransactions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','63f2554b-42db-4652-a3b4-d78308067648'),(129,'plugin:commerce','m240228_120911_drop_order_id_and_make_line_item_cascade','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','6c2c1ba4-0f98-416e-b4d3-d1c50ca05d80'),(130,'plugin:commerce','m240301_113924_add_line_item_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7c3c291f-84b6-4d0f-9a1b-b8b64c10b268'),(131,'plugin:commerce','m240306_091057_move_element_ids_on_discount_to_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','efff6932-eb2c-490d-9958-06db47b83618'),(132,'plugin:commerce','m240308_133451_tidy_shipping_categories','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','af77a30e-2c1a-437c-9762-60834fad0460'),(133,'plugin:commerce','m240313_131445_tidy_shipping_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1560f388-674b-4408-b727-f7c3f2a07ad4'),(134,'plugin:commerce','m240315_072659_add_fk_cascade_fixes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','81bc36f6-2c78-4a83-ab04-e07456f5a898'),(135,'plugin:commerce','m240430_161804_add_index_to_transaction_hash','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','05f00058-9ea3-4db5-ab25-8e4cf31d11ff'),(136,'plugin:commerce','m240507_081904_fix_store_pc_location','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3279a7fe-4ccd-46dd-8448-057fdc1e3427'),(137,'plugin:commerce','m240516_035616_update_permissions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a9223d9d-4791-498e-bae1-fea77c626a28'),(138,'plugin:commerce','m240516_035617_update_currency_and_store_general_permissions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ae26981a-2c27-49e6-9f05-fd88dc5572ee'),(139,'plugin:commerce','m240528_124101_add_extra_lineitem_columns','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','fe5d2881-3d2b-4753-842a-753588bd8840'),(140,'plugin:commerce','m240529_095819_remove_commerce_user_field','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','fb488967-681c-451d-88d9-7f22d1492b9d'),(141,'plugin:commerce','m240605_110755_add_title_translations_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','687169b2-6db4-4289-aa08-84b2ddfd305a'),(142,'plugin:commerce','m240619_082224_add_product_and_variant_conditions_to_catalog_pricing_rules','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','32d6aff0-b768-44c4-9abe-58eb1d687fe5'),(143,'plugin:commerce','m240710_125204_ensure_shippingCategoryId_column_is_nullable','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','539bf392-11cf-48a2-973f-f4e5fff7d8d2'),(144,'plugin:commerce','m240711_092240_fix_fks','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','dda0f6e4-b5fa-431c-8da7-67723f7bcfc6'),(145,'plugin:commerce','m240715_045506_drop_available_if_exists','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','66eeb848-eedd-4290-8d37-a23cbe5ac71a'),(146,'plugin:commerce','m240717_044256_add_return_url_to_subscription','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','826ca2a9-0b56-403c-a5ef-ec187cffaa41'),(147,'plugin:commerce','m240718_073046_remove_sortOrder_variants_column_if_exists','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','525dd0b7-17cb-4de1-a7bf-31b69c78c191'),(148,'plugin:commerce','m240808_090256_cascade_delete_variants_on_product_delete','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9a0f3c23-436a-407a-a52f-c1ebfecf515a'),(149,'plugin:commerce','m240808_093934_product_type_propagation','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','54a891a2-c77d-400f-b2ca-03e5bc0956df'),(150,'plugin:commerce','m240812_025615_add_transfer_details_table','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','da71e711-ae09-4281-b6b0-0c9783b3de70'),(151,'plugin:commerce','m240815_035618_fix_transfer_permission','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3bce0527-ba06-441b-be90-05c2223d8f2e'),(152,'plugin:commerce','m240830_081410_add_extra_indexes_to_catalog_pricing','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d260b057-fae1-4312-852f-a473ed69f628'),(153,'plugin:commerce','m240905_130549_add_require_coupon_code_discount_setting','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','44ffb96a-8358-42dd-94e2-111643288ed4'),(154,'plugin:commerce','m240906_105809_update_existing_coupon_discounts','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a3c4a637-1573-4dc9-bd54-42f85b871324'),(155,'plugin:commerce','m240906_115901_add_orderable_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','620b151b-27b0-4398-8fcf-ea0f9d094694'),(156,'plugin:commerce','m240923_132625_remove_orphaned_variants_sites','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','34a87a5e-c94d-471d-9399-fecddbbe588e'),(157,'plugin:commerce','m241010_061430_rename_orderable_product_type_type','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','03a88cb8-af4f-4fa0-9d54-790193bfdc76'),(158,'plugin:commerce','m241017_072151_fix_temp_skus','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','1213dc37-b0a9-4e4a-bd0c-91c75e6286c4'),(159,'plugin:commerce','m241022_075144_add_missing_variant_revision_records','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','a4f29225-62e4-4db4-82b4-529accbe35ae'),(160,'plugin:commerce','m241128_174712_fix_maxLevels_structured_productTypes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5f26fd4e-21c8-444c-b5ca-a9bc81ade2b2'),(161,'plugin:commerce','m241204_045158_enable_tax_rate','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','2b7b2419-2da6-4279-ab59-44fe39c74a65'),(162,'plugin:commerce','m241204_091901_fix_store_environment_variables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','18e9613e-531d-42f4-b1d2-3bba983247a8'),(163,'plugin:commerce','m241213_083338_update_promotional_price_in_line_items','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','ffa12e51-4e02-4517-ad34-247910795ae1'),(164,'plugin:commerce','m241219_071723_add_inventory_backorder','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3be97a2a-4f38-446a-a76a-3597566e07ab'),(165,'plugin:commerce','m241220_082900_remove_inventory_for_non_inventory_purchasables','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','7a143972-f628-4e78-9278-3cfd7cda0aeb'),(166,'plugin:commerce','m250120_080035_move_to_tax_id_validators','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','d5514635-753c-4f70-bb5d-451ba0d28a5a'),(167,'plugin:commerce','m250128_083515_add_make_primary_addresses_to_orders','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','880a4522-217c-4920-8a4a-88447c47b880'),(168,'plugin:commerce','m250129_080909_fix_discount_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','98c9e7dd-e9b9-4b9f-b6f8-f38a9c4086a9'),(169,'plugin:commerce','m250210_125139_fix_cart_recalculation_modes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','bfc18138-1cc0-408f-a42d-4f3c05e4c5ef'),(170,'plugin:commerce','m250301_120000_add_gateway_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','5104b7f5-5ce2-43e2-8452-25b604486d4b'),(171,'plugin:commerce','m250401_091214_add_shipping_method_customer_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','99060cf4-d77b-4628-bc5c-8e9cad156ea3'),(172,'plugin:commerce','m250403_134328_add_shipping_rule_customer_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9132e3b1-640d-4a21-ae7e-e3d35fc9f277'),(173,'plugin:commerce','m250616_042356_fix_field_layout_id','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3045e4c5-266f-4974-9d91-cd87434dbc34'),(174,'plugin:commerce','m250617_105249_add_email_render_site_id','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','699fb72f-270f-4b78-828c-90e9c5d54a12'),(175,'plugin:commerce','m250701_054128_add_defaultVariant_idex_to_products','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','c409ee25-a29f-4604-86fc-808eaba140a1'),(176,'plugin:commerce','m250721_130616_fix_gateway_order_condition_pc','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','87b7d53c-db2e-48e8-8baa-b22882840a65'),(177,'plugin:commerce','m250731_020627_add_slug_options_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','27dc7c85-26b1-46fd-868a-2601ff12ecea'),(178,'plugin:commerce','m250815_120000_add_gateway_address_conditions','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','54bec4bc-e400-44da-bc57-a03efb4aff91'),(179,'plugin:commerce','m250919_111358_fix_methodId_shipping_rules_fk','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','78ccb51c-2057-49e2-9024-068280d79234'),(180,'plugin:commerce','m251003_120720_add_preview_targets_to_product_types','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','aa77b7dd-c2d1-4da8-8bdb-3d4b596a46bf'),(181,'plugin:commerce','m251028_095831_add_order_date_first_paid_property','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','71c83612-6244-4acc-ae4e-942432f0bc10'),(182,'plugin:commerce','m251030_094827_add_link_expiry_to_pdfs','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9bf25330-f53e-4f38-938e-0efe7f603b60'),(183,'plugin:commerce','m251105_194014_add_icon_and_color_to_categories_and_methods','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','4c8a7526-3dc9-43b1-9e2e-97dac636c53a'),(184,'plugin:commerce','m251111_092942_ensure_catalog_pricing_indexes','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','9eb9c4ec-2aec-4cc4-953f-d134cea41318'),(185,'plugin:commerce','m251112_120000_fix_null_gateway_order_condition','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','3c78f6e4-d0ae-45c5-a9cc-b70cb88eaad2'),(186,'plugin:commerce','m260206_000000_add_ui_label_formats','2026-03-12 17:49:25','2026-03-12 17:49:25','2026-03-12 17:49:25','30ab3700-d4f7-4c76-9780-755919923f08'),(187,'plugin:ckeditor','m260220_182920_drop_cke_configs','2026-03-28 22:40:42','2026-03-28 22:40:42','2026-03-28 22:40:42','098cd80b-a79a-482d-85f8-5e2e4025acfa');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'commerce','5.6.0','5.6.0.0','2026-03-12 17:49:17','2026-03-12 17:49:17','2026-03-12 17:49:17','fc99f9b1-ebab-48f9-8746-3501fdf82681'),(2,'vite','5.0.1','1.0.0','2026-03-12 18:04:30','2026-03-12 18:04:30','2026-03-12 18:04:30','5a4488a1-979f-4c7a-9e26-4804ac550b89'),(3,'ckeditor','5.3.1','5.0.0.1','2026-03-28 22:40:42','2026-03-28 22:40:42','2026-03-28 22:40:42','d9905813-3e3b-4c5c-8f19-3ca20e3a289b');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.elementType','null'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.billingAddressCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.handle','\"dummy\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.isFrontendEnabled','true'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.name','\"Dummy\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\orders\\\\GatewayOrderCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.elementType','\"craft\\\\commerce\\\\elements\\\\Order\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.orderCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.paymentType','\"purchase\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.class','\"craft\\\\commerce\\\\elements\\\\conditions\\\\addresses\\\\GatewayAddressCondition\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.elementType','null'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.shippingAddressCondition.fieldContext','\"global\"'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.sortOrder','99'),('commerce.gateways.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f.type','\"craft\\\\commerce\\\\gateways\\\\Dummy\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.color','\"green\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.default','true'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.description','null'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.handle','\"new\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.name','\"New\"'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.sortOrder','99'),('commerce.orderStatuses.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2.store','\"645bb423-5466-4a2c-a05f-ceeb31bac6e5\"'),('commerce.sitestores.2589bc8f-a277-4da6-ae5f-f294f779bc87.store','\"645bb423-5466-4a2c-a05f-ceeb31bac6e5\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowCheckoutWithoutPayment','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowEmptyCartOnCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.allowPartialPaymentOnCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetCartShippingMethodOption','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetNewCartAddresses','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.autoSetPaymentSource','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.currency','\"USD\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.freeOrderPaymentStrategy','\"complete\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.handle','\"primary\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.minimumTotalPriceStrategy','\"default\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.name','\"Primary\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.orderReferenceFormat','\"{{number[:7]}}\"'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.primary','true'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireBillingAddressAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireShippingAddressAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.requireShippingMethodSelectionAtCheckout','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.sortOrder','99'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.useBillingAddressForTax','false'),('commerce.stores.645bb423-5466-4a2c-a05f-ceeb31bac6e5.validateOrganizationTaxIdAsVatId','false'),('dateModified','1775277525'),('email.fromEmail','\"jerry@charliesbarkery.com\"'),('email.fromName','\"charlies\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.allowLineBreaksInTitles','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.color','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.description','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.cardThumbAlignment','\"end\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elementCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.dateAdded','\"2026-03-25T14:51:44+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.uid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.0.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.dateAdded','\"2026-03-25T14:51:44+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.uid','\"13565fba-b2f9-432c-b4f9-ef1b99eb911c\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.conditionRules.0.values.0','\"hero\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.fieldUid','\"d2dbcdc7-ca53-408a-8df4-99d795133201\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.uid','\"67c0702d-602b-4460-a842-68b69569157a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.1.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.dateAdded','\"2026-03-28T22:01:46+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"0ae1e2fd-df8a-4f54-86b8-b48ca05f67ff\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.conditionRules.0.values.0','\"productCarousel\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.fieldUid','\"0119d5ec-bfd1-4692-a006-407e05e36d20\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.uid','\"57c417d6-920f-49f6-a35f-d01401a86a3d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.2.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.dateAdded','\"2026-03-28T23:22:29+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.conditionRules.0.uid','\"33120c20-0409-43bd-9a82-e4e454039d9f\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.conditionRules.0.values.0','\"splitSection\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.fieldUid','\"46d1905d-56db-493d-90c0-5de9d9910388\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.uid','\"dbb8f982-78f2-48c4-8258-217588847319\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.3.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.dateAdded','\"2026-04-04T04:31:41+00:00\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.editCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.fieldUid','\"29323bbb-b103-4d28-aafb-f37b64ee4ae3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.layoutElementUid','\"54e0155b-2027-4647-9f61-6a820c7b699d\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.operator','\"in\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.uid','\"29202f5a-fbae-4c90-bec0-7f7518841fa3\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.conditionRules.0.values.0','\"callToAction\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementCondition.fieldContext','\"global\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.elementEditCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.fieldUid','\"dc36f051-fd02-4e59-bf63-204e8eccf224\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.handle','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.instructions','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.label','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.required','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.tip','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.uid','\"2d498e12-8f05-456e-aed4-cde0a37e8217\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.warning','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.elements.4.width','100'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.name','\"Content\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.uid','\"2bda75ac-9d20-4c73-95d6-b9b86ee9722a\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.tabs.0.userCondition','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.fieldLayouts.1f6fda9f-8346-4063-a50c-9ddafd204e07.thumbFieldKey','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.handle','\"pageBlocksEntry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.hasTitleField','false'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.icon','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.name','\"Page Blocks Entry\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.showSlugField','true'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.showStatusField','true'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.slugTranslationKeyFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.slugTranslationMethod','\"site\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleTranslationKeyFormat','null'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.titleTranslationMethod','\"site\"'),('entryTypes.0c390a43-79fb-43af-89ea-7b8a7c41d3d7.uiLabelFormat','\"{title}\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.allowLineBreaksInTitles','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.color','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.description','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.cardThumbAlignment','\"end\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocomplete','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.autocorrect','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.class','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.dateAdded','\"2026-03-25T14:44:46+00:00\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.disabled','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.id','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.inputType','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.instructions','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.label','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.max','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.min','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.name','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.orientation','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.placeholder','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.readonly','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.required','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.size','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.step','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.tip','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.title','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.uid','\"33eaf735-2da8-403c-8230-8505eabf00a4\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.warning','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.0.width','100'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.dateAdded','\"2026-03-25T15:34:31+00:00\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.editCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.elementCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.elementEditCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.fieldUid','\"e91396d1-d7c4-4b1b-a3e9-55972a84ff9c\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.handle','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.instructions','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.label','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.required','false'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.tip','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.uid','\"fb60420e-7f69-437a-8dcb-a6054958208f\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.warning','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.elements.1.width','100'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.name','\"Content\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.uid','\"bee69b4e-5d3a-4aa2-aa9e-e0e3e517671d\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.tabs.0.userCondition','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.fieldLayouts.75d0994b-d90d-4008-bb5d-78000befd65e.thumbFieldKey','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.handle','\"pageHomeEntry\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.hasTitleField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.icon','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.name','\"Page — Home\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.showSlugField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.showStatusField','true'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.slugTranslationKeyFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.slugTranslationMethod','\"site\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleTranslationKeyFormat','null'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.titleTranslationMethod','\"site\"'),('entryTypes.b7d4b92a-3550-4709-ba61-d7e4d3829f54.uiLabelFormat','\"{title}\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.columnSuffix','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.handle','\"productCarouselBlock\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.instructions','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.name','\"Product Carousel Block\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.searchable','false'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.settings.viewMode','\"grouped\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.translationKeyFormat','null'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.translationMethod','\"site\"'),('fields.0119d5ec-bfd1-4692-a006-407e05e36d20.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.columnSuffix','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.handle','\"blockType\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.instructions','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.name','\"Block Type\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.searchable','false'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.customOptions','false'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.0.1','\"Hero\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.1.1','\"hero\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.0.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.0.1','\"Product Carousel\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.1.1','\"productCarousel\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.1.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.0.1','\"Split Section\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.1.1','\"splitSection\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.2.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.0.0','\"label\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.0.1','\"Call To Action \"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.1.0','\"value\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.1.1','\"callToAction\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.2.0','\"icon\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.2.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.3.0','\"color\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.3.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.4.0','\"default\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.settings.options.3.__assoc__.4.1','\"\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.translationKeyFormat','null'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.translationMethod','\"none\"'),('fields.29323bbb-b103-4d28-aafb-f37b64ee4ae3.type','\"craft\\\\fields\\\\Dropdown\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.columnSuffix','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.handle','\"splitSectionBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.instructions','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.name','\"Split Section Block\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.searchable','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.0','\"d8e5ef18-5837-4a24-af05-b595b119f921\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"c9261752-57ce-419e-a60c-f5cbb1a1067e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"imageRight\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Image Right\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.3.0','\"instructions\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.3.1','\"The image displays on the left by default. Enable this to move it to the right\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-03-28T23:20:57+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"4c037aa7-7177-41fc-84d2-94d8e8aac99d\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"darkTheme\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Dark Theme\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.4.0','\"tip\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.4.1','\"The default theme is bronze and white. Enable this to switch to the charcoal theme.\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"f531efbe-8694-4e7e-9973-ec72a83577b3\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"c2d9c750-d7f6-412a-822c-7571172f15a5\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"0b92e79b-252c-4fdd-9467-b23f1b66911f\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"eyebrow\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"eyebrow\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"4d44aae0-e56d-4315-bfaa-83937eb0421d\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.1','\"heading\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.1','\"Heading\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','75'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"f075b188-d366-4033-b4ba-472195410663\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.12.1','\"64e2bf73-506f-4e6f-9a22-dd5d54f10b77\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.7.1','100'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.8.1','\"2026-03-28T23:07:07+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.5.__assoc__.9.1','\"83858805-a6cd-43b6-9279-0edcf7240fb8\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.1.1','\"badge\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.2.1','\"Badge\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.4.0','\"tip\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.4.1','\"enable a badge on the image.\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.8.1','\"2026-03-28T23:15:12+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.6.__assoc__.9.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.1.1','\"badgeOverlay\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.0','\"elementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.0.0','\"elementType\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.1.0','\"fieldContext\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.1.1','\"global\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.2.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.0','\"conditionRules\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.1','\"e68405db-0928-4c2f-b930-df879cc9bb47\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.12.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.2.1','\"Badge Overlay\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.4.0','\"tip\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.4.1','\"When the Badge is enabled, it defaults to overlay mode. If this lightswitch is turned on, the badge will display in the corner instead.\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.8.1','\"2026-03-28T23:24:31+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.7.__assoc__.9.1','\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.1.1','\"badgeText\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.0','\"elementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.0.0','\"elementType\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.1.0','\"fieldContext\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.1.1','\"global\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.2.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.0','\"conditionRules\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.1','\"b87c08e7-328c-4388-a980-57e694f7e449\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.2.1','\"Badge Text\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.8.1','\"2026-03-28T23:25:42+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.8.__assoc__.9.1','\"5fd7f09f-bfc0-43e2-a982-7242517a38df\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.0.0','\"type\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.1.0','\"handle\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.1.1','\"badgeSubText\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.0','\"elementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.0.0','\"elementType\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.0.1','\"craft\\\\elements\\\\ContentBlock\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.1.0','\"fieldContext\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.1.1','\"global\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.2.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\ElementCondition\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.0','\"conditionRules\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.1.1','\"585f14d6-aaeb-4c32-baa7-1afa136721db\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.0.__assoc__.4.1','\"a65ee03d-5758-4410-8604-5324d9775b1e\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.0.0','\"class\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.0.1','\"craft\\\\fields\\\\conditions\\\\LightswitchFieldConditionRule\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.1.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.1.1','\"110eb17b-884e-4aca-bee4-16acd14b8bfb\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.2.0','\"value\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.2.1','true'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.3.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.3.1','\"c3351fca-dd41-4318-b6ed-7ea1f921ca34\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.4.0','\"layoutElementUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.11.1.__assoc__.3.1.1.__assoc__.4.1','\"fa3aa4f4-0531-4405-be51-1ae540e06fb0\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.12.0','\"fieldUid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.2.0','\"label\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.2.1','\"Badge Sub Text\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.6.0','\"required\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.6.1','false'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.7.0','\"width\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.7.1','25'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.8.0','\"dateAdded\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.8.1','\"2026-04-03T16:21:09+00:00\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.9.0','\"uid\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.9.__assoc__.9.1','\"a9fd0a03-657f-4952-9c55-566045985717\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.settings.viewMode','\"grouped\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.translationKeyFormat','null'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.translationMethod','\"site\"'),('fields.46d1905d-56db-493d-90c0-5de9d9910388.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.columnSuffix','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.handle','\"plainText\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.instructions','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.name','\"Plain Text\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.searchable','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.byteLimit','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.charLimit','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.code','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.initialRows','4'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.multiline','false'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.placeholder','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.settings.uiMode','\"normal\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.translationKeyFormat','null'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.translationMethod','\"none\"'),('fields.4d7ec46f-500b-47b6-8eba-f2f42e8066c1.type','\"craft\\\\fields\\\\PlainText\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.columnSuffix','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.handle','\"linkField\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.instructions','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.name','\"Link Field\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.searchable','false'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.0','\"target\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.1','\"title\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.2','\"id\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.3','\"download\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.advancedFields.4','\"class\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.fullGraphqlData','true'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.maxLength','255'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.showLabelField','true'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.0','\"entry\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.1','\"url\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.2','\"asset\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.3','\"category\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.4','\"email\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.5','\"tel\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.types.6','\"product\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"allowedKinds\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.0','\"image\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.1','\"pdf\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.2','\"text\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.3','\"video\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.0.1.4','\"word\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"showUnpermittedVolumes\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.2.0','\"showUnpermittedFiles\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.0.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.0','\"entry\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"showUnpermittedSections\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.2.0','\"showUnpermittedEntries\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.1.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.0','\"url\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"allowRootRelativeUrls\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowAnchors\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"1\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.2.0','\"allowCustomSchemes\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.settings.typeSettings.__assoc__.2.1.__assoc__.2.1','\"\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.translationKeyFormat','null'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.translationMethod','\"none\"'),('fields.5eec91ac-9cac-40d5-915a-f973014bad60.type','\"craft\\\\fields\\\\Link\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.columnSuffix','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.handle','\"richTextEditor\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.instructions','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.name','\"Rich Text Editor\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.searchable','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.advancedLinkFields','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.availableTransforms','\"\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.availableVolumes','\"\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.characterLimit','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.css','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.cssFile','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.defaultTransform','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.defaultUploadLocationSubpath','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.defaultUploadLocationVolume','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.fullGraphqlData','true'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.0','\"1\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.1','\"2\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.2','\"3\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.3','\"4\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.4','\"5\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.headingLevels.5','\"6\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.imageEntryTypeUid','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.imageFieldUid','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.imageMode','\"img\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.js','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.jsFile','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.options','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.parseEmbeds','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.purifierConfig','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.purifyHtml','true'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.showUnpermittedFiles','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.showUnpermittedVolumes','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.showWordCount','false'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.sourceEditingGroups.0','\"__ADMINS__\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.0','\"heading\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.1','\"|\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.2','\"bold\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.3','\"italic\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.4','\"link\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.toolbar.5','\"bulletedList\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.settings.wordLimit','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.translationKeyFormat','null'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.translationMethod','\"none\"'),('fields.64e2bf73-506f-4e6f-9a22-dd5d54f10b77.type','\"craft\\\\ckeditor\\\\Field\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.columnSuffix','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.handle','\"images\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.instructions','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.name','\"Image(s)\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.searchable','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowedKinds','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowSelfRelations','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowSubfolders','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.allowUploads','true'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.branchLimit','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.defaultPlacement','\"end\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.defaultUploadLocationSource','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.defaultUploadLocationSubpath','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.maintainHierarchy','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.maxRelations','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.minRelations','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.previewMode','\"full\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictedDefaultUploadSubpath','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictedLocationSource','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictedLocationSubpath','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictFiles','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.restrictLocation','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.selectionLabel','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showSearchInput','true'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showSiteMenu','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showUnpermittedFiles','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.showUnpermittedVolumes','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.sources','\"*\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.targetSiteId','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.validateRelatedElements','false'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.settings.viewMode','\"list\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.translationKeyFormat','null'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.translationMethod','\"none\"'),('fields.c2d9c750-d7f6-412a-822c-7571172f15a5.type','\"craft\\\\fields\\\\Assets\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.columnSuffix','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.handle','\"lighswitch\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.instructions','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.name','\"lighswitch\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.searchable','false'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.default','false'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.offLabel','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.onLabel','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.settings.showLabelsInCards','false'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.translationKeyFormat','null'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.translationMethod','\"none\"'),('fields.c3351fca-dd41-4318-b6ed-7ea1f921ca34.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.columnSuffix','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.handle','\"heroBlock\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.instructions','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.name','\"Hero Block\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.searchable','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.0','\"4a670768-d431-43e7-9622-21d72c90f053\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"64586fe6-dda7-4d89-b978-a3e651f56501\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrowText\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow Text\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"3db4929f-d6dd-47ab-bb3b-1352061a74ac\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"headline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Headline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"0cd78069-1878-4d0e-85cc-9a8d65311cdb\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"Subheadline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Subheadline\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"86a9bff4-35a7-4748-8dce-ad0e3139a069\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.1.1','\"button\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.2.1','\"Button\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"c53d75b5-67d6-47b2-b41a-327f91a1c146\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.0','\"type\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.0','\"handle\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.1.1','\"buttonTwo\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.0','\"fieldUid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.0','\"label\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.2.1','\"Button Two\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.0','\"required\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.6.1','false'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.0','\"width\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.7.1','100'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.0','\"dateAdded\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.8.1','\"2026-03-25T14:34:06+00:00\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.0','\"uid\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.4.__assoc__.9.1','\"6d5ccc92-c8d6-422f-8931-38d5f2e409e3\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.settings.viewMode','\"grouped\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.translationKeyFormat','null'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.translationMethod','\"site\"'),('fields.d2dbcdc7-ca53-408a-8df4-99d795133201.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.columnSuffix','null'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.handle','\"callToActionBlock\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.instructions','null'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.name','\"Call To Action Block\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.searchable','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.0','\"741d3f3d-ba77-49c2-8006-ce53f9a6df52\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.0','\"tabs\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.0','\"name\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.0.1','\"Content\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.1.1','\"ccbd6b59-b565-46aa-88f6-6f32433c31c5\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.0','\"elements\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.0','\"handle\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.1.1','\"eyebrow\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.0','\"label\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.2.1','\"Eyebrow\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.0.__assoc__.9.1','\"fb8347f5-df64-4639-8907-a7e8845b4e12\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.0','\"handle\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.1.1','\"heading\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.0','\"label\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.2.1','\"Heading\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.1.__assoc__.9.1','\"28b90100-b662-46d8-b047-acc05be249bd\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.0','\"handle\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.1.1','\"subHeader\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.12.1','\"4d7ec46f-500b-47b6-8eba-f2f42e8066c1\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.0','\"label\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.2.1','\"Sub Header\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.2.__assoc__.9.1','\"08cac8fc-1927-49e7-94b7-efa0d85ba5bd\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.0','\"type\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.0.1','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.0','\"fieldUid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.12.1','\"5eec91ac-9cac-40d5-915a-f973014bad60\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.0','\"required\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.6.1','false'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.0','\"width\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.7.1','100'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.0','\"dateAdded\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.8.1','\"2026-04-04T04:30:29+00:00\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.0','\"uid\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.0.1.0.__assoc__.4.1.3.__assoc__.9.1','\"d9cf0d28-62bf-4618-844e-ca96058c834a\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.0','\"cardThumbAlignment\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.fieldLayouts.__assoc__.0.1.__assoc__.4.1','\"end\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.settings.viewMode','\"grouped\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.translationKeyFormat','null'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.translationMethod','\"site\"'),('fields.dc36f051-fd02-4e59-bf63-204e8eccf224.type','\"craft\\\\fields\\\\ContentBlock\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.columnSuffix','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.handle','\"blockPicker\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.instructions','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.name','\"Block Picker\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.searchable','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.createButtonLabel','\"New block\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.defaultIndexViewMode','\"cards\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.enableVersioning','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.0.1','\"0c390a43-79fb-43af-89ea-7b8a7c41d3d7\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.1.0','\"group\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.entryTypes.0.__assoc__.1.1','\"General\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.includeTableView','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.maxEntries','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.minEntries','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.pageSize','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.propagationKeyFormat','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.propagationMethod','\"all\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.showCardsInGrid','false'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.settings.viewMode','\"blocks\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.translationKeyFormat','null'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.translationMethod','\"site\"'),('fields.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c.type','\"craft\\\\fields\\\\Matrix\"'),('meta.__names__.0119d5ec-bfd1-4692-a006-407e05e36d20','\"Product Carousel Block\"'),('meta.__names__.0c390a43-79fb-43af-89ea-7b8a7c41d3d7','\"Page Blocks Entry\"'),('meta.__names__.2589bc8f-a277-4da6-ae5f-f294f779bc87','\"charlies\"'),('meta.__names__.29323bbb-b103-4d28-aafb-f37b64ee4ae3','\"Block Type\"'),('meta.__names__.46d1905d-56db-493d-90c0-5de9d9910388','\"Split Section Block\"'),('meta.__names__.4d7ec46f-500b-47b6-8eba-f2f42e8066c1','\"Plain Text\"'),('meta.__names__.5eec91ac-9cac-40d5-915a-f973014bad60','\"Link Field\"'),('meta.__names__.645bb423-5466-4a2c-a05f-ceeb31bac6e5','\"Primary\"'),('meta.__names__.64e2bf73-506f-4e6f-9a22-dd5d54f10b77','\"Rich Text Editor\"'),('meta.__names__.69d4a3e4-5d6a-4e7f-8108-3ce57d5a8fc2','\"New\"'),('meta.__names__.8a0ba0e6-6a25-4da5-afdb-887f84ffdf4f','\"Dummy\"'),('meta.__names__.b7d4b92a-3550-4709-ba61-d7e4d3829f54','\"Page — Home\"'),('meta.__names__.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46','\"Home Page\"'),('meta.__names__.c2d9c750-d7f6-412a-822c-7571172f15a5','\"Image(s)\"'),('meta.__names__.c3351fca-dd41-4318-b6ed-7ea1f921ca34','\"lighswitch\"'),('meta.__names__.d2dbcdc7-ca53-408a-8df4-99d795133201','\"Hero Block\"'),('meta.__names__.d79efc26-fed5-43e6-bce8-1d7e7f9846b9','\"charlies\"'),('meta.__names__.dc36f051-fd02-4e59-bf63-204e8eccf224','\"Call To Action Block\"'),('meta.__names__.e91396d1-d7c4-4b1b-a3e9-55972a84ff9c','\"Block Picker\"'),('plugins.ckeditor.edition','\"standard\"'),('plugins.ckeditor.enabled','true'),('plugins.ckeditor.schemaVersion','\"5.0.0.1\"'),('plugins.commerce.edition','\"pro\"'),('plugins.commerce.enabled','true'),('plugins.commerce.licenseKey','\"0U6EFPB4B0QWVBY8YV3X7TOY\"'),('plugins.commerce.schemaVersion','\"5.6.0.0\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.defaultPlacement','\"end\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.enableVersioning','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.entryTypes.0.uid','\"b7d4b92a-3550-4709-ba61-d7e4d3829f54\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.handle','\"homePage\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.maxAuthors','1'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.name','\"Home Page\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.label','\"Primary entry page\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.refresh','\"1\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.previewTargets.0.urlFormat','\"{url}\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.propagationMethod','\"all\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabledByDefault','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.template','\"index.twig\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.siteSettings.2589bc8f-a277-4da6-ae5f-f294f779bc87.uriFormat','\"__home__\"'),('sections.b7f30bd9-4da3-41f0-8d17-26a2a6a0bf46.type','\"single\"'),('siteGroups.d79efc26-fed5-43e6-bce8-1d7e7f9846b9.name','\"charlies\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.enabled','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.handle','\"default\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.hasUrls','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.language','\"en\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.name','\"charlies\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.primary','true'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.siteGroup','\"d79efc26-fed5-43e6-bce8-1d7e7f9846b9\"'),('sites.2589bc8f-a277-4da6-ae5f-f294f779bc87.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"charlies\"'),('system.schemaVersion','\"5.9.0.8\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
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
INSERT INTO `revisions` VALUES (16,3,1,16,'Applied “Draft 1”'),(17,3,1,17,'Applied “Draft 1”'),(18,28,1,1,NULL),(19,29,1,1,NULL),(20,3,1,18,'Applied “Draft 1”'),(21,28,1,2,NULL),(22,29,1,2,NULL),(23,3,1,19,''),(24,3,1,20,'Applied “Draft 1”'),(25,42,1,1,NULL),(26,3,1,21,'Applied “Draft 1”'),(27,52,1,1,NULL),(28,3,1,22,'Applied “Draft 1”'),(29,57,1,1,NULL),(30,3,1,23,'Applied “Draft 1”'),(31,3,1,24,'Applied “Draft 1”'),(32,64,1,1,NULL),(33,3,1,25,'Applied “Draft 1”'),(34,64,1,2,NULL),(35,67,1,1,NULL),(36,3,1,26,''),(37,3,1,27,''),(38,64,1,3,NULL),(39,67,1,2,NULL),(40,3,1,28,''),(41,3,1,29,'Applied “Draft 1”'),(42,64,1,4,NULL),(43,67,1,3,NULL),(44,3,1,30,'Applied “Draft 1”'),(45,64,1,5,NULL),(46,67,1,4,NULL),(47,3,1,31,'Applied “Draft 1”'),(48,64,1,6,NULL),(49,67,1,5,NULL),(50,3,1,32,'Applied “Draft 1”'),(51,64,1,7,NULL),(52,67,1,6,NULL),(53,3,1,33,'Applied “Draft 1”'),(54,64,1,8,NULL),(55,67,1,7,NULL),(56,3,1,34,'Applied “Draft 1”'),(57,64,1,9,NULL),(58,67,1,8,NULL),(59,3,1,35,'Applied “Draft 1”'),(60,64,1,10,NULL),(61,67,1,9,NULL),(62,3,1,36,''),(63,3,1,37,''),(64,3,1,38,''),(65,64,1,11,NULL),(66,67,1,10,NULL),(67,3,1,39,'Applied “Draft 1”'),(68,3,1,40,''),(69,3,1,41,'Applied “Draft 1”'),(70,64,1,12,NULL),(71,67,1,11,NULL),(72,3,1,42,'Applied “Draft 1”'),(73,64,1,13,NULL),(74,67,1,12,NULL),(75,3,1,43,'Applied “Draft 1”'),(76,144,1,1,NULL),(77,145,1,1,NULL),(78,3,1,44,'Applied “Draft 1”'),(79,144,1,2,NULL),(80,145,1,2,NULL),(81,3,1,45,'Applied “Draft 1”'),(82,144,1,3,NULL),(83,145,1,3,NULL),(84,3,1,46,''),(85,3,1,47,''),(86,3,1,48,'Applied “Draft 1”'),(87,3,1,49,'Applied “Draft 1”'),(88,144,1,4,NULL),(89,145,1,4,NULL),(90,3,1,50,''),(91,144,1,5,NULL),(92,145,1,5,NULL),(93,3,1,51,''),(94,3,1,52,'Applied “Draft 1”'),(95,64,1,14,NULL),(96,67,1,13,NULL),(97,3,1,53,'Applied “Draft 1”'),(98,64,1,15,NULL),(99,67,1,14,NULL),(100,3,1,54,'Applied “Draft 1”'),(101,64,1,16,NULL),(102,67,1,15,NULL),(103,3,1,55,'Applied “Draft 1”'),(104,64,1,17,NULL),(105,67,1,16,NULL),(106,3,1,56,''),(107,3,1,57,'Applied “Draft 1”'),(108,144,1,6,NULL),(109,145,1,6,NULL),(110,3,1,58,''),(111,144,1,7,NULL),(112,145,1,7,NULL),(113,3,1,59,'Applied “Draft 1”'),(114,144,1,8,NULL),(115,145,1,8,NULL),(116,3,1,60,'Applied “Draft 1”'),(117,144,1,9,NULL),(118,145,1,9,NULL),(119,3,1,61,'Applied “Draft 1”'),(120,229,1,1,NULL),(121,230,1,1,NULL),(122,3,1,62,''),(123,3,1,63,''),(124,3,1,64,''),(125,3,1,65,'Applied “Draft 1”'),(126,229,1,2,NULL),(127,230,1,2,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' jerry charliesbarkery com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'addressline1',0,1,''),(2,'addressline2',0,1,''),(2,'addressline3',0,1,''),(2,'administrativearea',0,1,''),(2,'countrycode',0,1,' us '),(2,'dependentlocality',0,1,''),(2,'fullname',0,1,''),(2,'locality',0,1,''),(2,'organization',0,1,''),(2,'organizationtaxid',0,1,''),(2,'postalcode',0,1,''),(2,'slug',0,1,''),(2,'sortingcode',0,1,''),(2,'title',0,1,' store '),(3,'slug',0,1,' home page '),(3,'title',0,1,' home page '),(28,'slug',0,1,' temp juhpquzqlrlrkshojqyuibpjewcwrrmiavbz '),(28,'title',0,1,''),(29,'slug',0,1,''),(42,'slug',0,1,' temp olptniqbrcvowkzmucejwynueaqayriksziw '),(42,'title',0,1,''),(47,'slug',0,1,''),(52,'slug',0,1,' temp rzbsvmxqlpvpseevknimnumdkivfzoibxmbb '),(52,'title',0,1,''),(57,'slug',0,1,' temp xxrsinvghpwaqytoaxnwtgwgyccxfwduxmpe '),(57,'title',0,1,''),(64,'slug',0,1,' temp etssgfgmmofjurapxtfmkrpoyidaadyzacxs '),(64,'title',0,1,''),(67,'slug',0,1,''),(144,'slug',0,1,' temp hhzrcvazyquagjeirsxdtpoymjuamcjdoznk '),(144,'title',0,1,''),(145,'slug',0,1,''),(229,'slug',0,1,' temp oatgqexjbwvdubaytzqxmvxsbnjbzlntisah '),(229,'title',0,1,''),(230,'slug',0,1,'');
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
INSERT INTO `users` VALUES (1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'jerry@charliesbarkery.com','$2y$13$W2qAPsTYHkeqfNKZNsh6F.x9w0kwBwf0UD0yM1m5vLCa7qTw0R7JC','2026-04-04 03:55:20',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2026-03-12 17:35:46','2026-03-12 17:35:46','2026-04-04 03:55:20');
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

-- Dump completed on 2026-04-04  1:04:41
