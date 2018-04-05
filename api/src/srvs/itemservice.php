<?php

    class ItemService
    {
        public static  function getItems($_storeId, $_itemId)
        {
            $result=[];
            $items = [];
            try{
                $mySql = DB::mySql();
                $query = "CALL `getItems`(" .$_storeId.",".$_itemId. ");";
            if ($sqlResult = $mySql->query($query)) {
                    $images;
                    foreach($sqlResult as $element){
                        $item = new Item;
                        $item->id				=	$element['id']; 
                        $item->storeId			=	$element['storeId'];
                        
                        $item->age				=	$element['catAge'];
                        $item->collection		=	$element['catColl'];
                        $item->pile_height		=	$element['catPileHeight'];
                        $item->pile				=	$element['catPile'];
                        $item->shape			=	$element['catShape'];
                        $item->size				=	$element['catSize'];
                        $item->style			=	$element['catStyle'];
                        $item->weave			=	$element['catWeave'];
                        
                        $item->catAgeId			=	$element['catAgeId'];
                        $item->catCollId		=	$element['catCollId'];
                        $item->catPileHeightId	=	$element['catPileHeightId'];
                        $item->catPileId		=	$element['catPileId'];
                        $item->catShapeId		=	$element['catShapeId'];
                        $item->catSizeId		=	$element['catSizeId'];
                        $item->catStyleId		=	$element['catStyleId'];
                        $item->catWeaveId		=	$element['catWeaveId'];
                        
                        $item->title			=	$element['title'];
                        $item->description		=	$element['description'];
                        $item->basePrice		=	$element['basePrice'];
                        $item->coverImage		=	$element['coverImageId'];
                        // $item->images			=	$element[''];
                        $item->sizeW			=	$element['size_w'];
                        $item->sizeL			=	$element['size_l'];
                        $images = ImageService::getImages($element['id']);
                        $item->images = $images;
                        array_push($items,$item);
                        }
                        return json_encode ($items, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
                    }else{
                        $result['code']=500;
                        $result['message'] = 'Item deletion has failed!';
                        return json_encode($result);
                    }
                    }catch(Throwable $err)
                    {
                        $result['code']=501;
                        $result['message'] = 'Something is wrong in the server!';
                        $result['Error'] = $err->getMessage();
                        return json_encode($result);
                    }
            
        }

        public static function addItem($_fireuid, $_item, $_storeId)
        {
            $result=[];
            try{
                $storeInfo = StoreService::getStoreInfo($_storeId);
                $user = new User();
                if($user->checkOwnership($_fireuid,$storeInfo)){
                    $ni = ItemService::creatItemObject($_item);
                    $itemInfo = $_storeId			." ,'".
                                $ni->age			."','".
                                $ni->collection	    ."','".
                                $ni->pile_height	."','".
                                $ni->pile			."','".
                                $ni->shape			."','".
                                $ni->size			."','".
                                $ni->style			."','".
                                $ni->weave			."','".
                                $ni->title			."','".	
                                $ni->description	."','".	
                                $ni->basePrice		."','".
                                $ni->sizeW			."','".
                                $ni->sizeL			."'";
                    $mySql = DB::mySql();
                    $query = "CALL `addEditItem`(".(-1).",".$itemInfo.");";
                        if($sqlResult = $mySql->query($query)){
                            $sqlResult = $sqlResult->fetchAll();
                            $result['code']=200;
                            $result['message'] = 'You have been added an item into this store';
                            $result['currentId'] = $sqlResult[0]['lastId'];
                        }else{
                            $result['code']=500;
                            $result['message'] = 'Item creation has been failed!';
                        }
                    }else{
                        $result['code']=403;
                        $result['message'] = 'You do not have permision to add/edit/delete items in this store!';
                    }
                    return json_encode($result);
                    } catch (Throwable $err) {
                        $result['code']=501;
                        $result['message'] = 'Something is wrong in the server!';
                        $result['Error'] = $err->getMessage();
                        return json_encode($result);
                    }
        }

        public static function editItem($_fireuid, $_item, $_itemId)
        {
            $result=[];
            try{
                $itemInfo = ItemService:: getItemInfo($_itemId);
                $user = new User();
                if($user->checkOwnership($_fireuid,$itemInfo)){
                    $ni = ItemService::creatItemObject($_item);
                    $itemInfo = $ni->storeId		." ,'".
                                $ni->age			."','".
                                $ni->collection	    ."','".
                                $ni->pile_height	."','".
                                $ni->pile			."','".
                                $ni->shape			."','".
                                $ni->size			."','".
                                $ni->style			."','".
                                $ni->weave			."','".
                                $ni->title			."','".	
                                $ni->description	."','".	
                                $ni->basePrice		."','".
                                $ni->sizeW			."','".
                                $ni->sizeL			."'";
                    $mySql = DB::mySql();
                    $query = "CALL `addEditItem`(" .$_itemId.",".$itemInfo.");";
                        if($sqlResult = $mySql->query($query)){
                            $sqlResult = $sqlResult->fetchAll();
                            $result['code']=200;
                            $result['message'] = 'You have been edited an item into this store';
                            $result['currentId'] = $sqlResult[0]['lastId'];
                        }else{
                            $result['code']=500;
                            $result['message'] = 'Item creation has been failed!';
                        }
                    }else{
                        $result['code']=403;
                        $result['message'] = 'You do not have permision to add/edit/delete items in this store!';
                    }
                    return json_encode($result);
                    } catch (Throwable $err) {
                        $result['code']=501;
                        $result['message'] = 'Something is wrong in the server!';
                        $result['Error'] = $err->getMessage();
                        return json_encode($result);
                    }
        }

        public static function removeItem($_fireuid, $_itemId)
        {
            try{
            $result=[];
            $itemInfo = ItemService:: getItemInfo($_itemId);
            $user = new User();
                if($user->checkOwnership($_fireuid,$itemInfo)){
                    // get relevent images ...
                    $Itemimages = $itemInfo["images"];
                    if(count($Itemimages)>0){
                        // delete relevent images ...
                       if(!ImageService::deleteImageUns($Itemimages)){
                        $result['code']=500;
                        $result['message'] = 'Item deletion has failed due to error from image deletion!';
                        return json_encode($result);
                       }                        
                    }
                    // remove item from DB ...
                    $mySql = DB::mySql();
                    $query = "CALL `delItem`(" .$_itemId.");";
                    if($sqlResult = $mySql->query($query)){
                        $result['code']=200;
                        $result['message'] = 'Youve been removed an item from your store!';
                    }else{
                        $result['code']=500;
                        $result['message'] = 'Item deletion has failed!';
                    }
                }else{
                    $result['code']=403;
                    $result['message'] = 'You do not have the permision to remove items in this store or item is not existed!';
                }
                return json_encode($result);
            } catch (Throwable $err) {
                $result['code']=501;
                $result['message'] = 'Something is wrong in the server!';
                $result['Error'] = $err->getMessage();
                return json_encode($result);
            }
        }

        public static function creatItemObject($_itemJson)
        {
            $ni = new Item();
            $ni->storeId		= -1;
            $ni->age			= -1;
            $ni->collection	    = -1;	
            $ni->pile_height	= -1;	
            $ni->pile			= -1;	
            $ni->shape			= -1;	
            $ni->size			= -1;	
            $ni->style			= -1;	
            $ni->weave			= -1;	
            $ni->title			= "null";	
            $ni->description	= "null";	
            $ni->basePrice		= -1;	
            $ni->sizeW			= -1;	
            $ni->sizeL			= -1;
            
            if (array_key_exists('storeId', $_itemJson)) 	        $ni->storeId		= $_itemJson["storeId"];
			if (array_key_exists('catAgeId', $_itemJson)) 	        $ni->age			= $_itemJson["catAgeId"];
            if (array_key_exists('catCollId', $_itemJson)) 	        $ni->collection	    = $_itemJson["catCollId"];
			if (array_key_exists('catPileHeightId', $_itemJson)) 	$ni->pile_height	= $_itemJson["catPileHeightId"];
            if (array_key_exists('catPileId', $_itemJson)) 	        $ni->pile			= $_itemJson["catPileId"];
			if (array_key_exists('catShapeId', $_itemJson)) 	    $ni->shape			= $_itemJson["catShapeId"];
			if (array_key_exists('catSizeId', $_itemJson)) 	        $ni->size			= $_itemJson["catSizeId"];
			if (array_key_exists('catStyleId', $_itemJson)) 	    $ni->style			= $_itemJson["catStyleId"];
			if (array_key_exists('catWeaveId', $_itemJson)) 	    $ni->weave			= $_itemJson["catWeaveId"];
            if (array_key_exists('title', $_itemJson)) 		        $ni->title			= $_itemJson["title"];
            if (array_key_exists('description', $_itemJson))        $ni->description	= $_itemJson["description"];
            if (array_key_exists('basePrice', $_itemJson)) 	        $ni->basePrice		= $_itemJson["basePrice"];
            if (array_key_exists('sizeW', $_itemJson))              $ni->sizeW	        = $_itemJson["sizeW"];
            if (array_key_exists('sizeL', $_itemJson)) 		        $ni->sizeL			= $_itemJson["sizeL"];
					
            return $ni;
        }

        public static function getItemInfo($_itemId)
        {
            $itemInfo = [];
            $itemInfo["userId"] 	= -1;
            $itemInfo["storeId"] 	= -1;
            $itemInfo["itemId"] 	= -1;
            $itemInfo["images"] 	= [];
            $images = [];
            $mySql = DB::mySql();
            $query = "CALL `getItemInfo`(" .$_itemId.");";
            if($sqlResult = $mySql->query($query)){
                $sqlResult = $sqlResult->fetchAll();
                if(count($sqlResult)>0){
                    $itemInfo["userId"] = $sqlResult[0]["userId"];
                    $itemInfo["storeId"] = $sqlResult[0]["storeId"];
                    $itemInfo["itemId"] = $sqlResult[0]["itemId"];
                    foreach($sqlResult AS $element){
                        $image = new Image;
                        $image->id = $element['imageId'];
                        $image->url = $element['imageUrl'];
                        if(isset($element['imageId']))array_push($images,$image);
                    }
                    $itemInfo["images"] =  $images;
                }
            }
            return $itemInfo;
        }

    }