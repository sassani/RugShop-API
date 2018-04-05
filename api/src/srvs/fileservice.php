<?php

use Google\Cloud\Storage\StorageClient;


class FileService
{
    

    public static function uploadFile($filePathName, $sourcePathName)
    {
        try
        {
            $dir = dirname(__DIR__, 5).'/public_html/apimat/'.$filePathName;
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
        $dir = dirname(__DIR__, 5).'/public_html/apimat/'.$filePathName;
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