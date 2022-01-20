/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `aplikacija` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `aplikacija`;

CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`, `is_active`) VALUES
	(1, 'aleksa', '$2b$11$F6dTnlsNs6ReyhbSoJt8LONWpVJFzF64xbIE5pp/POMRhPH8yJnma', 1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `is_promoted` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `uq_article_title` (`title`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `created_at`, `title`, `excerpt`, `description`, `is_active`, `is_promoted`, `category_id`) VALUES
	(17, '2022-01-20 16:53:35', 'Calypso Sweet Time', 'Calypso Sweet Time sat za djevojčice.', 'Calypso Sweet Time analogni kvarcni sat za djevojčice. Vodootporan do 50m. ', 1, 0, 20),
	(18, '2022-01-20 16:59:24', 'Calypso Football', 'Calypso dečiji analogni sat.', 'Calypso 27mm dečiji analogni kvarcni  sat sa gumenom narukvicom. ', 1, 0, 21),
	(19, '2022-01-20 17:20:27', 'RUCNI SAT TOMMY HILFIGER ', 'Tommy Hilfiger ženski sat sa brojčanikom svetlo roze boje.', '38mm Tommy Hilfiger ženski sat sa brojčanikom svetlo roze boje sa prikazom datuma, dana u nedelji i doba dana, sa kućištem od nerđajućeg čelika srebrene i svetlo roze boje i svetlo roze plastičnom narukvicom.', 1, 0, 18),
	(20, '2022-01-20 17:34:46', 'RUCNI SAT AX ', 'Armani Exchange muški sat.', 'Armani Exchange muški hronograf od plavog nerđajućeg čelika sa rose gold detaljima na brojčaniku. ', 1, 0, 4),
	(21, '2022-01-20 18:57:17', 'RUCNI SAT SECTOR 650', 'Sector 650 muški hronograf.', 'Sector 650 muški hronograf sa crnim brojčanikom sa žutim detaljima i crnom narukvicom od silikona. ', 1, 0, 9),
	(22, '2022-01-20 19:05:02', 'RUCNI SAT FOSSIL ME', 'Fossil muški automatik sat.', '45mm Fossil muški Grant automatik sat sa kožnom narukvicom.', 1, 0, 3),
	(23, '2022-01-20 19:09:17', 'RUCNI SAT MICHAEL KORS', 'Michael Kors ženski sat.', 'Michael Kors ženski sat sa puder roze teksturiranim brojčanikom, koronom ukrašenom cirkonima i srebrnom narukvicom od nerđajućeg čelika.', 1, 0, 7),
	(24, '2022-01-20 19:13:19', 'RUCNI SAT FOSSIL ES', 'Fossil Jaqueline multifunction ženski sat.', '38mm Fossil Jaqueline multifunction ženski sat sa bež brojčanikom, prikazom datuma, dana u nedelji i pokazivačem doba daba, indeksima u boji roze zlata, kućištem od nerđajućeg čelika u boji roze zlata ukrašeno cirkonima i bež kožnim kaišem.', 1, 0, 6),
	(25, '2022-01-20 19:32:55', 'RUCNI SAT SECTOR 180', 'Sector muški hronograf.', '46mm Sector muški hronograf sa kućištem od nerđajućeg čelika, plavim brojčanikom sa prikazom datuma i plavom kožnom narukvicom.', 1, 0, 3),
	(27, '2022-01-20 19:42:31', 'RUCNI SAT MICHAEL KORS(MK6936)', ' Parker Mihael Kors ženski hronograf.', '39mm Parker Mihael Kors ženski hronograf sa belim brojčanikom sa srebrnim detaljima i koronom ukrašenom cirkonima. Narukvica je plava od kože sa svetlucavim detaljima.', 1, 0, 6);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `article_feature` (
  `article_feature_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `feature_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `article_feature` DISABLE KEYS */;
INSERT INTO `article_feature` (`article_feature_id`, `value`, `article_id`, `feature_id`) VALUES
	(48, 'Calypso', 17, 25),
	(49, 'plastika', 17, 26),
	(50, 'silikon', 17, 27),
	(51, 'okruglo', 17, 28),
	(52, 'analogni', 17, 29),
	(53, '33', 17, 30),
	(54, '5 ATM', 17, 31),
	(55, 'kvarcni', 17, 32),
	(56, 'akrilno', 17, 33),
	(57, 'Calypso', 18, 25),
	(58, 'nerđajući čelik', 18, 26),
	(59, 'silikon', 18, 27),
	(60, 'okruglo', 18, 28),
	(61, 'analogni', 18, 29),
	(62, '27', 18, 30),
	(63, '5 ATM', 18, 31),
	(64, 'kvarcni', 18, 32),
	(65, 'akrilno', 18, 33),
	(66, 'Tommy Hilfiger', 19, 45),
	(67, 'nerđajući čelik', 19, 46),
	(68, 'silikon', 19, 47),
	(69, '25 meseci', 19, 48),
	(70, 'okruglo', 19, 49),
	(71, 'analogni', 19, 50),
	(72, '38', 19, 51),
	(73, '3 ATM', 19, 52),
	(74, 'kvarcni', 19, 53),
	(75, 'mineralno', 19, 54),
	(76, 'prikaz datuma, dana u nedelji i doba dana', 19, 55),
	(77, 'Armani Exchange', 20, 34),
	(78, 'nerđajući čelik', 20, 35),
	(79, 'nerđajući čelik', 20, 36),
	(80, '25 meseci', 20, 37),
	(81, 'okruglo', 20, 38),
	(82, 'analogni', 20, 39),
	(83, '46', 20, 40),
	(84, '5 ATM', 20, 41),
	(85, 'kvarcni', 20, 42),
	(86, 'mineralno', 20, 43),
	(87, 'štoperica', 20, 44),
	(88, 'Sector', 21, 34),
	(89, 'nerđajući čelik ', 21, 35),
	(90, 'silikon', 21, 36),
	(91, '36 meseci ', 21, 37),
	(92, 'okruglo', 21, 38),
	(93, 'analogni', 21, 39),
	(94, '45', 21, 40),
	(95, '10 ATM', 21, 41),
	(96, 'kvarcni', 21, 42),
	(97, 'mineralno', 21, 43),
	(98, 'datum, prikaz 24 sata, štoperica', 21, 44),
	(99, 'Fossil', 22, 34),
	(100, 'nerđajući čelik', 22, 35),
	(101, 'koža', 22, 36),
	(102, '25 meseci', 22, 37),
	(103, 'okruglo', 22, 38),
	(104, 'analogni', 22, 39),
	(105, '45', 22, 40),
	(106, '5 ATM', 22, 41),
	(107, 'automatik', 22, 42),
	(108, 'mineralno', 22, 43),
	(109, 'Michael Kors', 23, 45),
	(110, 'nerđajući čelik', 23, 46),
	(111, 'nerđajući čelik', 23, 47),
	(112, '25 meseci', 23, 48),
	(113, 'okruglo', 23, 49),
	(114, 'analogni', 23, 50),
	(115, '38', 23, 51),
	(116, '3 ATM', 23, 52),
	(117, 'kvarcni', 23, 53),
	(118, 'mineralno', 23, 54),
	(119, 'Fossil', 24, 45),
	(120, 'nerđajući čelik', 24, 46),
	(121, 'koža', 24, 47),
	(122, ' 25 meseci ', 24, 48),
	(123, 'okruglo', 24, 49),
	(124, 'analogni', 24, 50),
	(125, '38', 24, 51),
	(126, '5 ATM', 24, 52),
	(127, 'kvarcni', 24, 53),
	(128, 'mineralno', 24, 54),
	(129, 'dan, datum, prikaz 24 sata', 24, 55),
	(130, 'Sector', 25, 34),
	(131, 'nerđajući čelik ', 25, 35),
	(132, 'koža', 25, 36),
	(133, '36 meseci', 25, 37),
	(134, 'okruglo', 25, 38),
	(135, 'analogni', 25, 39),
	(136, '45', 25, 40),
	(137, '10 ATM', 25, 41),
	(138, 'kvarcni', 25, 42),
	(139, 'mineralno', 25, 43),
	(140, 'alarm, datum, štoperica, vremenske zone', 25, 44),
	(141, 'Michael Kors', 27, 34),
	(142, 'nerđajući čelik', 27, 35),
	(143, 'koža', 27, 36),
	(144, '25 meseci', 27, 37),
	(145, 'okruglo', 27, 38),
	(146, 'analogni', 27, 39),
	(147, '39', 27, 40),
	(148, '5 ATM', 27, 41),
	(149, 'kvarcni', 27, 42),
	(150, 'mineralno', 27, 43),
	(151, 'datum, štoperica', 27, 44);
/*!40000 ALTER TABLE `article_feature` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `article_price` (
  `article_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(10,2) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price_article_id` (`article_id`),
  CONSTRAINT `fk_article_price_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `article_price` DISABLE KEYS */;
INSERT INTO `article_price` (`article_price_id`, `created_at`, `price`, `article_id`) VALUES
	(16, '2022-01-20 16:53:35', 30.00, 17),
	(17, '2022-01-20 16:59:24', 30.00, 18),
	(18, '2022-01-20 17:20:27', 153.00, 19),
	(19, '2022-01-20 17:34:46', 245.00, 20),
	(20, '2022-01-20 18:57:17', 182.00, 21),
	(21, '2022-01-20 19:05:02', 205.00, 22),
	(22, '2022-01-20 19:09:17', 205.00, 23),
	(23, '2022-01-20 19:13:19', 155.00, 24),
	(24, '2022-01-20 19:32:55', 145.00, 25),
	(25, '2022-01-20 19:42:31', 258.00, 27);
/*!40000 ALTER TABLE `article_price` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_id`, `created_at`, `user_id`) VALUES
	(11, '2022-01-20 16:54:04', 2),
	(12, '2022-01-20 19:14:55', 2);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cart_article` (
  `cart_article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `cart_article` DISABLE KEYS */;
INSERT INTO `cart_article` (`cart_article_id`, `quantity`, `cart_id`, `article_id`) VALUES
	(11, 1, 11, 22),
	(12, 1, 11, 20);
/*!40000 ALTER TABLE `cart_article` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent__category_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_category_parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
	(1, 'Muški satovi', '/static/categories/muski-satovi.png', NULL),
	(2, 'Ženski satovi', '/static/categories/zenski-satovi.png', NULL),
	(3, 'Sa kožnom narukvicom', '/static/categories/mkoza.png', 1),
	(4, 'Sa metalnom narukvicom', '/static/categories/mmetal.png', 1),
	(6, 'Sa kožnom narukvicom', '/static/categories/zkoza.png', 2),
	(7, 'Sa metalnom narukvicom', '/static/categories/zmetal.png', 2),
	(9, 'Sa silikonskom narukvicom', '/static/categories/msilikon.png', 1),
	(18, 'Sa silikonskom narukvicom', '/static/categories/zsilikon.png', 2),
	(19, 'Dečiji satovi', '/static/categories/deciji-satovi.png', NULL),
	(20, 'Sa plastičnim kućištem', '/static/categories/dplastika.png', 19),
	(21, 'Sa metalnim kućištem', '/static/categories/dmetal.png', 19);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `feature` (
  `feature_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
	(34, 'Brend', 1),
	(45, 'Brend', 2),
	(25, 'Brend', 19),
	(44, 'Funkcije', 1),
	(55, 'Funkcije', 2),
	(37, 'Garancija', 1),
	(48, 'Garancija', 2),
	(35, 'Materijal kućišta', 1),
	(46, 'Materijal kućišta', 2),
	(26, 'Materijal kućišta', 19),
	(36, 'Materijal narukvice', 1),
	(47, 'Materijal narukvice', 2),
	(27, 'Materijal narukvice', 19),
	(38, 'Oblik kućišta', 1),
	(49, 'Oblik kućišta', 2),
	(28, 'Oblik kućišta', 19),
	(39, 'Tip sata', 1),
	(50, 'Tip sata', 2),
	(29, 'Tip sata', 19),
	(40, 'Veličina kućišta (mm)', 1),
	(51, 'Veličina kućišta (mm)', 2),
	(30, 'Veličina kućišta (mm)', 19),
	(41, 'Vodootpornost', 1),
	(52, 'Vodootpornost', 2),
	(31, 'Vodootpornost', 19),
	(42, 'Vrsta mehanizma', 1),
	(53, 'Vrsta mehanizma', 2),
	(32, 'Vrsta mehanizma', 19),
	(43, 'Vrsta stakla', 1),
	(54, 'Vrsta stakla', 2),
	(33, 'Vrsta stakla', 19);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','rejected','accepted','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cart_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`, `created_at`, `status`, `cart_id`) VALUES
	(6, '2022-01-20 19:14:55', 'pending', 11);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`photo_id`, `image_path`, `article_id`) VALUES
	(16, 'static/uploads/2022/01/1318da0f-d49f-4a37-abe5-b188c67c6223-k5789-1_800_1200px.png', 17),
	(17, 'static/uploads/2022/01/67f571f0-1c03-4fb4-92e8-8e957262b3c7-k5790-1_800_1200px.png', 18),
	(18, 'static/uploads/2022/01/e7d512d7-1294-4deb-bcc4-45f5cdaa1e1b-1782343_800_1200px.png', 19),
	(19, 'static/uploads/2022/01/0e50e606-55a1-46e2-b177-9d6ff311cc45-axmuski.PNG', 20),
	(20, 'static/uploads/2022/01/c81efec3-f7d5-4776-93f5-1386470eee7c-muski-silikon-sector2.PNG', 21),
	(21, 'static/uploads/2022/01/e1481c90-0b17-4c99-830f-bcbc8d5254a8-fossil-muski-koza.PNG', 22),
	(22, 'static/uploads/2022/01/fa8d20a1-9e85-4b27-841d-b47c243b7c58-zenski-metal.PNG', 23),
	(23, 'static/uploads/2022/01/494af8fb-1dab-415e-a192-7999df565d50-fossil-zenski-koza.PNG', 24),
	(24, 'static/uploads/2022/01/56a85c32-4014-4768-88dc-295125674d4a-sektor-koza-muski.PNG', 25),
	(25, 'static/uploads/2022/01/02ff7e78-9144-4fe8-94bb-9762f3a88016-mk-zenski-koza.PNG', 27);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forename` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `created_at`, `email`, `password_hash`, `password_reset_code`, `forename`, `surname`, `phone_number`, `postal_address`, `is_active`) VALUES
	(1, '2022-01-13 15:56:08', 'mtair@singidunum.ac.rs', '$2b$11$Z3F47fcrCqxnWjGQ/8Y8eOIjBeLSMLTR8KvWlRA1ExnjkAKFR91.a', NULL, 'Milan', 'Tair', '+381691281231', 'danijelova 32, 11010 Beograd, R. Srbija', 1),
	(2, '2022-01-13 22:16:09', 'aleksa@mail.local', '$2b$11$974alJp1A6ele7.AWVwV9etKpZLk4u86pLhZiVah0mYWV9RnqS1jK', NULL, 'Aleksa', 'Stojsic', '+38169876543', 'Neka ulica 123', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
