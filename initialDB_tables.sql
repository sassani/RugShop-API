USE `ardavans_rugshop`;

--
-- Table structure for table `cat_ages`
--

DROP TABLE IF EXISTS `cat_ages`;
CREATE TABLE `cat_ages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_ages`
--

LOCK TABLES `cat_ages` WRITE;
INSERT INTO `cat_ages` 
VALUES 
(1,'Antique',NULL,1),
(2,'Semi Antique',NULL,1),
(3,'New',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_collections`
--

DROP TABLE IF EXISTS `cat_collections`;
CREATE TABLE `cat_collections` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_collections`
--

LOCK TABLES `cat_collections` WRITE;
INSERT INTO `cat_collections`
VALUES
(1,'Afghan',NULL,1),
(2,'Agra',NULL,1),
(3,'Alta',NULL,1),
(4,'Aqua',NULL,1),
(5,'Arcadia',NULL,1),
(6,'Aria',NULL,1),
(7,'Arte',NULL,1),
(8,'Aubusson',NULL,1),
(9,'Avant-Garde',NULL,1),
(10,'Bakhtiar',NULL,1),
(11,'Balboa',NULL,1),
(12,'Balouch',NULL,1),
(13,'Barcelona',NULL,1),
(14,'Basic',NULL,1),
(15,'Bidjar',NULL,1),
(16,'Bokhara',NULL,1),
(17,'Braided Chindi',NULL,1),
(18,'Braided Jute',NULL,1),
(19,'Capri',NULL,1),
(20,'Casablanca',NULL,1),
(21,'Chevron',NULL,1),
(22,'Chinese',NULL,1),
(23,'Chunky Jute',NULL,1),
(24,'Coffee Shop',NULL,1),
(25,'Collectible',NULL,1),
(26,'Copenhagen',NULL,1),
(27,'Country',NULL,1),
(28,'Cowhide',NULL,1),
(29,'Cowhide / Leather',NULL,1),
(30,'Cut and Loop',NULL,1),
(31,'Damask',NULL,1),
(32,'Darya',NULL,1),
(33,'Dimensions',NULL,1),
(34,'Door Surround',NULL,1),
(35,'Downtown',NULL,1),
(36,'Dynasty',NULL,1),
(37,'Eclat',NULL,1),
(38,'Ethereal',NULL,1),
(39,'Floral Frieze',NULL,1),
(40,'Florence',NULL,1),
(41,'Fresco',NULL,1),
(42,'Frieze',NULL,1),
(43,'Furuzan',NULL,1),
(44,'Gabbeh',NULL,1),
(45,'Greek Key',NULL,1),
(46,'Hamedan',NULL,1),
(47,'Harmony',NULL,1),
(48,'Harvest',NULL,1),
(49,'Havana',NULL,1),
(50,'Hereke',NULL,1),
(51,'Heritage',NULL,1),
(52,'Heriz',NULL,1),
(53,'Himalaya',NULL,1),
(54,'Houndstooth',NULL,1),
(55,'Ikat',NULL,1),
(56,'Insert',NULL,1),
(57,'Isfahan',NULL,1),
(58,'Istanbul',NULL,1),
(59,'Karabakh',NULL,1),
(60,'Kars',NULL,1),
(61,'Kashan',NULL,1),
(62,'Kashmar',NULL,1),
(63,'Kazak',NULL,1),
(64,'Kensington',NULL,1),
(65,'Kerman',NULL,1),
(66,'Kilim / Sumak',NULL,1),
(67,'Kilim Modern',NULL,1),
(68,'Lahour',NULL,1),
(69,'Lexington',NULL,1),
(70,'Loft',NULL,1),
(71,'Mahal',NULL,1),
(72,'Mamluk',NULL,1),
(73,'Mashad',NULL,1),
(74,'Melange',NULL,1),
(75,'Meshkabad',NULL,1),
(76,'Metropolis',NULL,1),
(77,'Michelle Armas Laura',NULL,1),
(78,'Mirage',NULL,1),
(79,'Monaco',NULL,1),
(80,'Monogram',NULL,1),
(81,'Montreal',NULL,1),
(82,'Mood',NULL,1),
(83,'Moroccan',NULL,1),
(84,'Nain',NULL,1),
(85,'Naples',NULL,1),
(86,'Navajo',NULL,1),
(87,'Nepal / Tibet',NULL,1),
(88,'New Vintage',NULL,1),
(89,'Nomad',NULL,1),
(90,'Outdoor',NULL,1),
(91,'Palazzo',NULL,1),
(92,'Patchwork',NULL,1),
(93,'Pictorial',NULL,1),
(94,'Play Time',NULL,1),
(95,'Qom / Kashmir',NULL,1),
(96,'Renaissance',NULL,1),
(97,'Restoration',NULL,1),
(98,'Romani',NULL,1),
(99,'Saddle Bag',NULL,1),
(100,'Safari',NULL,1),
(101,'Sahara',NULL,1),
(102,'Santa Fe',NULL,1),
(103,'Sari',NULL,1),
(104,'Sarough',NULL,1),
(105,'Serapi',NULL,1),
(106,'Shag',NULL,1),
(107,'Shahreza',NULL,1),
(108,'Shiraz',NULL,1),
(109,'Sisal',NULL,1),
(110,'Soho',NULL,1),
(111,'Solid',NULL,1),
(112,'Spectrum',NULL,1),
(113,'Stockholm',NULL,1),
(114,'Striped Modern Ziegler',NULL,1),
(115,'Tabriz',NULL,1),
(116,'Tangier',NULL,1),
(117,'Tapestry',NULL,1),
(118,'Textured Solid',NULL,1),
(119,'Torkaman',NULL,1),
(120,'Transitional',NULL,1),
(121,'Trellis',NULL,1),
(122,'Tribe',NULL,1),
(123,'Tribeca',NULL,1),
(124,'Ultra Vintage',NULL,1),
(125,'Uptown',NULL,1),
(126,'Valencia',NULL,1),
(127,'Venice',NULL,1),
(128,'Victoria',NULL,1),
(129,'Vienna',NULL,1),
(130,'Villa',NULL,1),
(131,'Vista',NULL,1),
(132,'Wood / Sisal',NULL,1),
(133,'Yalameh',NULL,1),
(134,'Ziegler / Kazak',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_pile_heights`
--

DROP TABLE IF EXISTS `cat_pile_heights`;
CREATE TABLE `cat_pile_heights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_pile_heights`
--

LOCK TABLES `cat_pile_heights` WRITE;
INSERT INTO `cat_pile_heights`
VALUES
(1,'Flat',NULL,1),
(2,'Low Pile',NULL,1),
(3,'Medium',NULL,1),
(4,'High',NULL,1),
(5,'Shag',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_piles`
--

DROP TABLE IF EXISTS `cat_piles`;
CREATE TABLE `cat_piles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_piles`
--

LOCK TABLES `cat_piles` WRITE;
INSERT INTO `cat_piles`
VALUES
(1,'Cotton',NULL,1),
(2,'Polyamide',NULL,1),
(3,'Polyester',NULL,1),
(4,'Polypropylene',NULL,1),
(5,'Silk',NULL,1),
(6,'Viscose',NULL,1),
(7,'Wool',NULL,1),
(8,'Wool & Polyester',NULL,1),
(9,'Wool & Silk',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_shapes`
--

DROP TABLE IF EXISTS `cat_shapes`;
CREATE TABLE `cat_shapes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_shapes`
--

LOCK TABLES `cat_shapes` WRITE;
INSERT INTO `cat_shapes`
VALUES
(1,'Standard',NULL,1),
(2,'Runners',NULL,1),
(3,'Rounds',NULL,1),
(4,'Squares',NULL,1),
(5,'Octagons',NULL,1),
(6,'Ovals',NULL,1),
(7,'Pillows',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_sizes`
--

DROP TABLE IF EXISTS `cat_sizes`;
CREATE TABLE `cat_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_sizes`
--

LOCK TABLES `cat_sizes` WRITE;
INSERT INTO `cat_sizes`
VALUES
(1,'Oversized',NULL,1),
(2,'2x3',NULL,1),
(3,'3x5',NULL,1),
(4,'4x6',NULL,1),
(5,'5x8',NULL,1),
(6,'6x9',NULL,1),
(7,'7x10',NULL,1),
(8,'8x10',NULL,1),
(9,'8x11',NULL,1),
(10,'9x12',NULL,1),
(11,'10x13',NULL,1),
(12,'10x14',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_styles`
--

DROP TABLE IF EXISTS `cat_styles`;
CREATE TABLE `cat_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_styles`
--

LOCK TABLES `cat_styles` WRITE;
INSERT INTO `cat_styles`
VALUES
(1,'Abstract',NULL,1),
(2,'Border',NULL,1),
(3,'Botanical',NULL,1),
(4,'Carved',NULL,1),
(5,'Casual',NULL,1),
(6,'Checkered',NULL,1),
(7,'Country',NULL,1),
(8,'Flatweave',NULL,1),
(9,'Floral',NULL,1),
(10,'Fringe',NULL,1),
(11,'Geometric',NULL,1),
(12,'Gradient',NULL,1),
(13,'Kids',NULL,1),
(14,'Medallion',NULL,1),
(15,'Modern',NULL,1),
(16,'Moroccan',NULL,1),
(17,'Noborder',NULL,1),
(18,'Novelty',NULL,1),
(19,'Over-Dyed',NULL,1),
(20,'Plush',NULL,1),
(21,'Sisal',NULL,1),
(22,'Solid',NULL,1),
(23,'Southwestern',NULL,1),
(24,'Striped',NULL,1),
(25,'Traditional',NULL,1),
(26,'Transitional',NULL,1),
(27,'Tribal',NULL,1),
(28,'Vintage',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `cat_weaves`
--

DROP TABLE IF EXISTS `cat_weaves`;
CREATE TABLE `cat_weaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cat_weaves`
--

LOCK TABLES `cat_weaves` WRITE;
INSERT INTO `cat_weaves`
VALUES
(1,'Hand Knotted',NULL,1),
(2,'Hand Woven',NULL,1),
(3,'Machine Made',NULL,1),
(4,'Tufted',NULL,1);
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fireuid` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `firstName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoUrl` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailVerified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`fireuid`),

  UNIQUE KEY `fireuid_UNIQUE` (`fireuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
INSERT INTO `users`
VALUES
(1,'aYH66GIUfIdnrEd0O3q8qp1M01B3','Ardavan','Sassani','Ardook',NULL,'Ardavan Sassani','https://lh6.googleusercontent.com/-og3Rdx0m1Fg/AAAAAAAAAAI/AAAAAAAAACE/LsKE-jMcR3E/photo.jpg','a.sassani@gmail.com',1),
(2,'HC3Lo0XJ8FUl1E1kNGz1rMKXcg73',NULL,NULL,NULL,NULL,'Paniz Mozaffari','https://lh5.googleusercontent.com/-Rpiz2vvs-xU/AAAAAAAAAAI/AAAAAAAAAas/okGV3k6E_8w/photo.jpg','paniz.mozafari@gmail.com',1);
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `users_id` int(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  CONSTRAINT `stores_fk` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
INSERT INTO `stores`
VALUES
(1,1,'Art of Persia',''),
(2,2,'Another Store','This Store is under construction...');
UNLOCK TABLES;


--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stores_id` int(5) NOT NULL,
  `cat_ages_id` int(5) NOT NULL,
  `cat_collections_id` int(5) NOT NULL,
  `cat_pile_heights_id` int(5) NOT NULL,
  `cat_piles_id` int(5) NOT NULL,
  `cat_shapes_id` int(5) NOT NULL,
  `cat_sizes_id` int(5) NOT NULL,
  `cat_styles_id` int(5) NOT NULL,
  `cat_weaves_id` int(5) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `basePrice` float DEFAULT '0',
  `coverImageId` int(10) DEFAULT NULL,
  `size_w` float DEFAULT '0',
  `size_l` float DEFAULT '0',
  `color1` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `knote_density` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stores_id` (`stores_id`),
  KEY `cat_ages_id` (`cat_ages_id`),
  KEY `cat_collections_id` (`cat_collections_id`),
  KEY `cat_pile_heights_id` (`cat_pile_heights_id`),
  KEY `cat_piles_id` (`cat_piles_id`),
  KEY `cat_shapes_id` (`cat_shapes_id`),
  KEY `cat_sizes_id` (`cat_sizes_id`),
  KEY `cat_styles_id` (`cat_styles_id`),
  KEY `cat_weaves_id` (`cat_weaves_id`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`stores_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `items_ibfk_2` FOREIGN KEY (`cat_ages_id`) REFERENCES `cat_ages` (`id`),
  CONSTRAINT `items_ibfk_3` FOREIGN KEY (`cat_collections_id`) REFERENCES `cat_collections` (`id`),
  CONSTRAINT `items_ibfk_4` FOREIGN KEY (`cat_pile_heights_id`) REFERENCES `cat_pile_heights` (`id`),
  CONSTRAINT `items_ibfk_5` FOREIGN KEY (`cat_piles_id`) REFERENCES `cat_piles` (`id`),
  CONSTRAINT `items_ibfk_6` FOREIGN KEY (`cat_shapes_id`) REFERENCES `cat_shapes` (`id`),
  CONSTRAINT `items_ibfk_7` FOREIGN KEY (`cat_sizes_id`) REFERENCES `cat_sizes` (`id`),
  CONSTRAINT `items_ibfk_8` FOREIGN KEY (`cat_styles_id`) REFERENCES `cat_styles` (`id`),
  CONSTRAINT `items_ibfk_9` FOREIGN KEY (`cat_weaves_id`) REFERENCES `cat_weaves` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
INSERT INTO `items`
VALUES
(2,1,1,115,1,1,1,1,3,4,'Ardavan Sassani','test test8888',90012,NULL,15,20,NULL,NULL,NULL);
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `imageUrl` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `isCoverImage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
UNLOCK TABLES;



--
-- Table structure for table `permission_levels`
--

DROP TABLE IF EXISTS `permission_levels`;
CREATE TABLE `permission_levels` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_levels`
--

LOCK TABLES `permission_levels` WRITE;
INSERT INTO `permission_levels`
VALUES
(1,'Read'),
(2,'Write'),
(3,'Delete'),
(4,'Add');
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions`
VALUES
(1,'posts','add, edit items'),
(2,'photos','add edit photos');
UNLOCK TABLES;


--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permissions`;
CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `permissions_id` int(2) NOT NULL,
  `permission_levels_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `permissions_id` (`permissions_id`),
  KEY `permission_levels_id` (`permission_levels_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`permission_levels_id`) REFERENCES `permission_levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permissions` WRITE;
INSERT INTO `user_permissions`
VALUES
(1,1,1,1),
(2,1,2,1),
(3,1,2,2);
UNLOCK TABLES;