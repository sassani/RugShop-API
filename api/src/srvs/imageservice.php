<?php

    class ImageService
    {
        private static $targetdir = "images/items/";
        
        public static function getImages($_itemId)
        {
            $images=[];
            $mySql = DB::mySql();
            $query = "CALL `getImages`(" .$_itemId. ");";
            if ($result = $mySql->query($query)) {
                foreach($result as $imageData){
                    $image = new Image;
                    $image->id = $imageData['id'];
                    $image->url = $imageData['imageUrl'];
                    $image->isCoverImage = $imageData['isCoverImage'];
                    array_push($images,$image);
                }
            }
            return $images;
        }

        public static function addImages($_reqToken, $_itemId,$_imageFile)
        {
            $result =[];
            try{
                $itemInfo = ItemService:: getItemInfo($_itemId);
                $user = new User();
                if($user->checkOwnership($_reqToken,$itemInfo))
                {
                    $itemStoreId = $itemInfo["storeId"];
                    // $itemStoreId = json_decode( ItemService::getItems(0,$_itemId))[0]->storeId;
                    $fileName = $_imageFile['name'][0];
                    $fileLocalTemp = $_imageFile['tmp_name'][0];
                    $fileContents = file_get_contents($fileLocalTemp);
                    $ext = pathinfo($fileName, PATHINFO_EXTENSION);
                    $targetName = $itemStoreId."_".$_itemId."_".time()."_".hash("sha256",$fileLocalTemp).".".$ext;
                    $targetfile = ImageService::$targetdir.$targetName;
                    if(FileService::uploadFile($targetfile,$fileLocalTemp))
                    {
                        $imageUrl = FileService::$remotDirAccess.$targetfile;
                        // $imageUrl = dirname(__DIR__, 2)."/resources/".$targetfile;
                        // echo $imageUrl;
                        // $bucketName = getenv("GOOGLE_BUCKET_NAME");
                        // $imageUrl = 'https://storage.googleapis.com/'.$bucketName."/".$targetfile;
                        if($sqlResult = ImageService::addImageUrl($_itemId,$imageUrl))
                        {
                            $result['code']=200;
                            $result['message'] = 'picture has been added successfully '.$_imageFile;
                            $result['file'] = $_imageFile;
                            $result['currentId'] = $sqlResult;
                        }else
                        {
                            $result['code']=500;
                            $result['message'] = 'picture insertion has failed!';
                        }
                    }else
                    {
                        $result['code']=500;
                        $result['message'] = 'picture file insertion has failed!';
                        $result['file'] = json_encode($_imageFile);
                    }  
                }else
                {
                    $result['code']=403;
                    $result['message'] = 'You do not have permision to add/edit/delete items in this store.';
                }
            return json_encode($result, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
            }catch (Throwable $err) {
                $result['code']=501;
                $result['message'] = 'Something is wrong in the server!';
                $result['Error'] = $err->getMessage();
                return json_encode($result);
            }
        }

        private static Function addImageUrl($_itemId,$_imageUrl)
        {
            $mySql = DB::mySql();
            $_imageUrl = str_replace("\\","/",$_imageUrl);
            $query = "CALL `addImage`(" .$_itemId.",'".$_imageUrl. "');";
            try{
                if($sqlResult = $mySql->query($query)){
                    $sqlResult = $sqlResult->fetchAll();
                    return $sqlResult[0]['lastId'];
                }else{
                    return false;
                }

            } catch (Throwable $err) {
                // echo json_encode($err);
                return false;
            }
        }

        public static function deleteImageUns($_images)
        //delete images without ownershipchek for internal use only!
        //parameter : image[]
        {
            $result = false;
            try{
                foreach($_images AS $image){
                    $targetName = basename($image->url);
                    $targetfile = ImageService::$targetdir.$targetName;
                    if(FileService::removeFile($targetfile)){
                        if(ImageService::deleteImageUrl($image->id)){
                            $result = true;
                        }else{
                            return false;
                        }
                    }else{
                        return false;
                    }
                }
                return $result;
            }catch (Throwable $err) {
                return false;
            }
        }

        public static function deleteImage($_reqToken, $_imageId)
        {
            $result=[];
            try{
            $imageInfo = ImageService:: getImageInfo($_imageId);
            $targetName = basename($imageInfo["imageUrl"]);
            $targetfile = ImageService::$targetdir.$targetName;
            $user = new User();
                if($user->checkOwnership($_reqToken,$imageInfo)){
                    if(FileService::removeFile($targetfile)){
                        if(ImageService::deleteImageUrl($_imageId)){
                            $result['code']=200;
                            $result['message'] = 'picture has been removed successfully';
                        }else{
                            $result['code']=500;
                            $result['message'] = 'picture deletetion has failed!';
                        }
                    }else{
                        $result['code']=500;
                        $result['message'] = 'picture file deletetion has failed!';
                    }
                }else{
                    $result['code']=403;
                    $result['message'] = 'You do not have the permision to remove this image!';
                }
                return json_encode($result);
            }catch (Throwable $err) {
                $result['code']=501;
                $result['message'] = 'Something is wrong in the server!';
                $result['Error'] = $err->getMessage();
                return json_encode($result);
            }
        }

        private static function deleteImageUrl($imageId)
        {
            try{
            $mySql = DB::mySql();
            $query = "CALL `delImage`(" .$imageId. ");";
                $result = $mySql->query($query);
                return true;
            } catch (Throwable $err) {
                // echo json_encode($err);
                return false;
            }
        }

        public static function getImageInfo($_imageId)
        {
            $imageInfo = [];
            $imageInfo["userId"] 	= -1;
            $imageInfo["storeId"] 	= -1;
            $imageInfo["itemId"] 	= -1;
            $imageInfo["imageId"] 	= -1;
            $imageInfo["imageUrl"] 	= -1;
            $mySql = DB::mySql();
            $query = "CALL `getImageInfo`(" .$_imageId.");";
            if($sqlResult = $mySql->query($query)){
                $sqlResult = $sqlResult->fetchAll();
                if(count($sqlResult)>0){
                    $imageInfo["userId"] = $sqlResult[0]["userId"];
                    $imageInfo["storeId"] = $sqlResult[0]["storeId"];
                    $imageInfo["itemId"] = $sqlResult[0]["itemId"];
                    $imageInfo["imageId"] = $sqlResult[0]["imageId"];
                    $imageInfo["imageUrl"] = $sqlResult[0]["imageUrl"];
                }
            }
            return $imageInfo;
        }
    }



