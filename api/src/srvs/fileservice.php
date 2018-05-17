<?php

use Google\Cloud\Storage\StorageClient;


class FileService
{
    public static $remotDirAccess = 'https://ardavansassani.net/apimat/';
    public static $remotDirSave = '/home/ardavans/public_html/apimat/';
    

    public static function uploadFile($filePathName, $sourcePathName)
    {
        try
        {
            $dir = FileService::$remotDirSave.$filePathName;
            if(move_uploaded_file($sourcePathName, $dir))
            {
                return true;
            }else{
                return false;
            }
            
        }catch(Throwable $err){
            echo $err;
            return false;
        }
    }
    
    public static function removeFile($filePathName)
    {
        $dir = FileService::$remotDirSave.$filePathName;
        try{
            if(unlink($dir))
            {
                return true;
            }else{
                return false;
            }

        }catch(Throwable $err){
            echo $err;
            return false;
        }
    }

}