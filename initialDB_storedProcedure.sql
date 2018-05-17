USE `ardavans_rugshop`;


DROP PROCEDURE IF EXISTS `addEditItem`;
DELIMITER ;;
CREATE PROCEDURE `addEditItem`(
IN `_id` INT(5),
IN `_storeId` INT(5),
IN `_catAgeId` INT(5),
IN `_catCollId` INT(5),
IN `_catPileHeightId` INT(5),
IN `_catPileId` INT(5),
IN `_catShapeId` INT(5),
IN `_catsizeId` INT(5),
IN `_catstyleId` INT(5),
IN `_catweaveId` INT(5),
IN `_name` VARCHAR(50),
IN `_dsc` TEXT,
IN `_basePrice` FLOAT,
IN `_sizeW` FLOAT,
IN `_sizeL` FLOAT)
BEGIN
IF _id =-1 THEN
	INSERT INTO `items`
	(
	`stores_id`,
	`cat_ages_id`,			
	`cat_collections_id`,	
	`cat_pile_heights_id`,	
	`cat_piles_id`,			
	`cat_shapes_id`	,		
	`cat_sizes_id`	,		
	`cat_styles_id`	,		
	`cat_weaves_id`	,		
	`name`,
	`description`,
	`basePrice`,
	`size_w`,
	`size_l`)
	VALUES
	(
	_storeId,
	_catAgeId,
	_catCollId,	
	_catPileHeightId,	
	_catPileId,	
	_catShapeId,	
	_catsizeId,	
	_catstyleId,	
	_catweaveId,	
	_name,
	_dsc,
	_basePrice,
	_sizeW,
	_sizeL
	);
    SELECT LAST_INSERT_ID() AS lastId;
    ELSE
		UPDATE `items`
        SET
		`stores_id`						= if(_storeId			=-1, `stores_id`			,_storeId			),
		`cat_ages_id`					= if(_catAgeId			=-1, `cat_ages_id`			,_catAgeId			),
		`cat_collections_id`			= if(_catCollId			=-1, `cat_collections_id`	,_catCollId			),
		`cat_pile_heights_id`			= if(_catPileHeightId	=-1, `cat_pile_heights_id`	,_catPileHeightId	),
		`cat_piles_id`					= if(_catPileId			=-1, `cat_piles_id`			,_catPileId			),
		`cat_shapes_id`					= if(_catShapeId		=-1, `cat_shapes_id`		,_catShapeId		),
		`cat_sizes_id`					= if(_catsizeId			=-1, `cat_sizes_id`			,_catsizeId			),
		`cat_styles_id`					= if(_catstyleId		=-1, `cat_styles_id`		,_catstyleId		),
		`cat_weaves_id`					= if(_catweaveId		=-1, `cat_weaves_id`		,_catweaveId		),
		`name`							= if(_name				='null', `name`				,_name),
		`description`					= if(_dsc				='null', `description`		,_dsc),
		`basePrice`						= if(_basePrice			=-1, `basePrice`			,_basePrice),
		`size_w`						= if(_sizeW				=-1, `size_w`				,_sizeW),
		`size_l`						= if(_sizeL 			=-1, `size_l`				,_sizeL)
		WHERE items.id = _id;
        SELECT _id AS lastId;
END IF;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `addImage`;
DELIMITER ;;
CREATE PROCEDURE `addImage`(IN `_items_id` INT(11),
 IN `_imageUrl` VARCHAR(250)) 
BEGIN
	INSERT INTO images (items_id, imageUrl) 
	VALUES (_items_id,_imageUrl);
	SELECT LAST_INSERT_ID() AS lastId;
END;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `addUser`;
DELIMITER ;;
CREATE PROCEDURE `addUser`(IN `_fireUid` VARCHAR(150),
 IN `_displayName` VARCHAR(50),
 IN `_photoUrl` VARCHAR(150),
 IN `_email` VARCHAR(50),
 IN `_emailVerified` TINYINT(1))
BEGIN
	INSERT INTO `users` (`fireuid`,`displayName`, `photoUrl`, `email`, `emailVerified`) 
	VALUES (_fireUid, _displayName, _photoUrl, _email, _emailVerified);
    SELECT LAST_INSERT_ID() AS id;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `checkUser`;
DELIMITER ;;
CREATE PROCEDURE `checkUser`(IN `_username` VARCHAR(50),
 IN `_password` VARCHAR(50))
    NO SQL
SELECT * 
FROM users
WHERE users.username = _username AND users.password = _password ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `delImage`;
DELIMITER ;;
CREATE PROCEDURE `delImage`(IN _id int(5))
BEGIN
DELETE
FROM images
WHERE _id = id;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `delItem`;
DELIMITER ;;
CREATE PROCEDURE `delItem`(IN _id INT(50))
BEGIN
    DELETE FROM `images`
    WHERE items_id = _id;
    
	DELETE FROM `items`
    WHERE id = _id;
    

END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getCatAll`;
DELIMITER ;;
CREATE PROCEDURE `getCatAll`()
BEGIN
	SELECT 'age' AS catLable ,id,name, description FROM cat_ages WHERE isActive=1
	UNION ALL
	SELECT 'collection' AS catLable,id,name,description FROM cat_collections WHERE isActive=1
	UNION ALL
	SELECT 'pileHeight' AS catLable,id,name,description FROM cat_pile_heights WHERE isActive=1
	UNION ALL
	SELECT 'pile' AS catLable,id,name,description FROM cat_piles WHERE isActive=1
	UNION ALL
	SELECT 'shape' AS catLable,id,name,description FROM cat_shapes WHERE isActive=1
	UNION ALL
	SELECT 'size' AS catLable,id,name,description FROM cat_sizes WHERE isActive=1
	UNION ALL
	SELECT 'style' AS catLable,id,name,description FROM cat_styles WHERE isActive=1
	UNION ALL
	SELECT 'weaves' AS catLable,id,name,description FROM cat_weaves WHERE isActive=1;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getImageInfo`;
DELIMITER ;;
CREATE PROCEDURE `getImageInfo`(IN `_imageId` INT(10))
BEGIN
SELECT usr.id as userId , str.id as storeId, itm.id as itemId, img.id as imageId, img.imageUrl as imageUrl
FROM users AS usr INNER JOIN
		stores AS str on usr.id = str.users_id INNER JOIN
        items AS itm on str.id = itm.stores_id INNER JOIN
        images AS img on itm.id = img.items_id
WHERE img.id = _imageId;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getImages`;
DELIMITER ;;
CREATE PROCEDURE `getImages`(IN `_itemId` INT(5))
    NO SQL
SELECT id,imageUrl,isCoverImage
FROM images
WHERE items_id = _itemId ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getImageUrl`;
DELIMITER ;;
CREATE PROCEDURE `getImageUrl`(IN `_imageId` INT(5))
BEGIN
SELECT id,imageUrl
FROM images
WHERE id = _imageId;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getItemInfo`;
DELIMITER ;;
CREATE PROCEDURE `getItemInfo`(IN `_itemId` INT(10))
BEGIN
SELECT usr.id as userId , str.id as storeId, itm.id as itemId, img.id as imageId, img.imageUrl as imageUrl
FROM users AS usr INNER JOIN
		stores AS str on usr.id = str.users_id INNER JOIN
        items AS itm on str.id = itm.stores_id LEFT JOIN
        images AS img on itm.id = img.items_id
WHERE itm.id = _itemId;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getItemRawData`;
DELIMITER ;;
CREATE PROCEDURE `getItemRawData`(IN `_id` INT(6))
    NO SQL
BEGIN
SELECT * 
FROM items
WHERE id = _id;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getItems`;
DELIMITER ;;
CREATE PROCEDURE `getItems`(IN `_storeId` INT(5), IN `_id` INT(6))
    NO SQL
BEGIN
SET @storeFilter = '';
SET @itemFilter = '';
IF _storeId >0 THEN SET @storeFilter = CONCAT( ' AND i.stores_id = ',_storeId);
END IF;
IF _id >0 THEN SET @itemFilter = CONCAT( ' AND i.id = ',_id);
SET @storeFilter = '';
END IF;
SET @mainquery = CONCAT("
	SELECT 
	`i`.`id` AS `id`,
	`i`.`stores_id` AS `storeId`,
	`i`.`name` AS `title`,
	`i`.`description` AS `description`,
	`i`.`basePrice` AS `basePrice`,
	`i`.`coverImageId` AS `coverImageId`,
	`i`.`size_l` AS `size_l`,
	`i`.`size_w` AS `size_w`,
	`coll`.`name` AS `catColl`,
	`pile`.`name` AS `catPile`,
	`pileheight`.`name` AS `catPileHeight`,
	`age`.`name` AS `catAge`,
	`shape`.`name` AS `catShape`,
	`size`.`name` AS `catSize`,
	`style`.`name` AS `catStyle`,
	`weave`.`name` AS `catWeave`,
	`coll`.`id` AS `catCollId`,
	`pile`.`id` AS `catPileId`,
	`pileheight`.`id` AS `catPileHeightId`,
	`age`.`id` AS `catAgeId`,
	`shape`.`id` AS `catShapeId`,
	`size`.`id` AS `catSizeId`,
	`style`.`id` AS `catStyleId`,
	`weave`.`id` AS `catWeaveId`
	FROM ((((((((`items` `i` join
	 `cat_collections` `coll` on((`i`.`cat_collections_id` = `coll`.`id`))) join
	  `cat_piles` `pile` on((`i`.`cat_piles_id` = `pile`.`id`))) join
	   `cat_pile_heights` `pileheight` on((`i`.`cat_pile_heights_id` = `pileheight`.`id`))) join
	    `cat_ages` `age` on((`i`.`cat_ages_id` = `age`.`id`))) join
		 `cat_shapes` `shape` on((`i`.`cat_shapes_id` = `shape`.`id`))) join
		  `cat_sizes` `size` on((`i`.`cat_sizes_id` = `size`.`id`))) join
		   `cat_styles` `style` on((`i`.`cat_styles_id` = `style`.`id`))) join
		    `cat_weaves` `weave` on((`i`.`cat_weaves_id` = `weave`.`id`))) 
	WHERE 1 = 1"
,@storeFilter,@itemFilter);

PREPARE stmt FROM @mainquery;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getStoreInfo`;
DELIMITER ;;
CREATE PROCEDURE `getStoreInfo`(IN `_storeId` INT(10))
BEGIN
SELECT usr.id as userId , str.id as storeId, itm.id as itemId
FROM users AS usr INNER JOIN
		stores AS str on usr.id = str.users_id Left JOIN
        items AS itm on str.id = itm.stores_id
WHERE str.id = _storeId;
END ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getStores`;
DELIMITER ;;
CREATE PROCEDURE `getStores`(IN `_userId` INT(10))
    NO SQL
SELECT id, name, description
FROM stores
WHERE users_id = _userId ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getUser`;
DELIMITER ;;
CREATE PROCEDURE `getUser`(IN `_fireUid` VARCHAR(150))
SELECT *
FROM users
WHERE users.fireuid = _fireUid ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getUserPermission`;
DELIMITER ;;
CREATE PROCEDURE `getUserPermission`(IN `user_id` INT(50))
    NO SQL
SELECT p.name AS permissionName,pl.level_name AS accessLevel
FROM 
user_permissions AS up INNER JOIN
permissions AS p ON p.id=up.permissions_id INNER JOIN
permission_levels AS pl ON pl.id=up.permission_levels_id
WHERE up.users_id=user_id ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `getUsers`;
DELIMITER ;;
CREATE PROCEDURE `getUsers`(IN `_id` INT(50))
    NO SQL
SELECT * FROM users WHERE Id = _id ;;
DELIMITER ;

DROP PROCEDURE IF EXISTS `setCoverImage`;
DELIMITER ;;
CREATE PROCEDURE `setCoverImage`(IN `_itemId` INT(10),
 IN `_imageId` INT(10))
    NO SQL
UPDATE items
SET coverImageId = _imageId
WHERE id = _itemId ;;
DELIMITER ;