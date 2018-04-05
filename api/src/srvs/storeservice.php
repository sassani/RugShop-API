<?php


class StoreService {


    public static function getStoreInfo($_storeId)
    {
        $storeInfo = [];
        $storeInfo["userId"] 	= -1;
        $storeInfo["storeId"] 	= -1;
        $storeInfo["items"] 	= -1;
        $items = [];
        $mySql = DB::mySql();
        $query = "CALL `getStoreInfo`(" .$_storeId.");";
        if($sqlResult = $mySql->query($query)){
            $sqlResult = $sqlResult->fetchAll();
            if(count($sqlResult)>0){
                $storeInfo["userId"] = $sqlResult[0]["userId"];
                $storeInfo["storeId"] = $sqlResult[0]["storeId"];
                foreach($sqlResult AS $element){
                    $item = new Item;
                    $item->id = $element['itemId'];
                    if(isset($element['itemId']))array_push($items,$item);
                }
                $storeInfo["items"] =  $items;
            }
        }
        return $storeInfo;
    }
}
