<?php
use \Firebase\JWT\JWT;

class User
{
    public $id;
    public $fireuid;
    public $first_name;
    public $last_name;
    public $username;
    public $password;
    public $displayName;
    public $photoUrl;
    public $email;
    public $emailVerified;
    public $permissions;
    public $stores;



    public function getUser($_token)
    {
        // print_r("so far so good");
        // if (1 === 1) {
            $requesttoken = $this->checkToken($_token);
        if ($requesttoken != false) {
            $requesttoken = json_decode($requesttoken,true);
            $fireUserId = $requesttoken['user_id'];
            $fireUserId = $requesttoken['user_id'];
            // return "ok";
            return $this->getUserFromDb($fireUserId,$requesttoken);
        }else {
            print_r("<pre>". "token is invalid" ."</pre>");
            return false;
        }

    }

    private function getUserFromDb($fireUserId, $requesttoken=false)
    {
        $user = new User;
        $mySql = DB::mySql();
        $query = "CALL getUser('" . $fireUserId . "');";
        try {
            if ($result = $mySql->query($query)) {
                $resultArray = $result->fetchAll();
                if ($result->rowCount()>0) {// logedin user is existed
                    $user->id = $resultArray[0]['id'];
                    $user->fireuid = $resultArray[0]['fireuid'];
                    $user->first_name = $resultArray[0]['firstName'];
                    $user->last_name = $resultArray[0]['lastName'];
                    $user->username = $resultArray[0]['username'];
                    $user->password = $resultArray[0]['password'];
                    $user->displayName = $resultArray[0]['displayName'];
                    $user->photoUrl = $resultArray[0]['photoUrl'];
                    $user->email = $resultArray[0]['email'];
                    $user->emailVerified = $resultArray[0]['emailVerified'];
                    // user permissions goes here...
                    // user stores goes here...
                }
                else {// logedin user is new, must be added to data base...
                    if(!$requesttoken){                    
                        $user->id 					= -1;
                        $user->fireuid 				= $requesttoken['user_id'];
                        $user->first_name 			= null;
                        $user->last_name 			= null;
                        $user->username 			= null;
                        $user->password 			= null;
                        $user->displayName 			= $requesttoken['name'];
                        $user->photoUrl 			= $requesttoken['picture'];
                        $user->email 				= $requesttoken['email'];
                        $user->emailVerified 		= $requesttoken['email_verified'];
                        $user = $this->addUser($user);
                    }
                }
            }
           $user->permissions =  $this->getUserPermissions($user);
           $user->stores = $this->getStores($user);
            return json_encode($user);   
            // return json_encode($user, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);   
        } catch (Throwable $err) {
            echo $err;
            return json_encode($err);
        }
    }

    private function checkToken($_token)
    {
        $key = $this->getpublickeys();
        try {
            $decoded = JWT::decode($_token, $key, array('RS256'));
            $json = json_encode($decoded, JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK);
            return $json;
        } catch (Throwable $err) {
            print_r("<pre>". $err->getMessage()."</pre>");
            return false;
        }
    }

    private function getpublickeys()
    {
        try {
            $ch = curl_init("https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com"); 
            curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
            $output = curl_exec($ch);
            $keys  = json_decode($output,true);
            curl_close($ch);
            return $keys;
        } catch (Throwable $e) {
            echo 'An error occurred during the getting googleapis publickey list';
        }
    }

    public function addUser(User $_user)
    {
        if ($_user->fireuid != '') {
            $mySql = DB::mySql();
            $query = "CALL `addUser`('" .
                $_user->fireuid . "','" .
                $_user->displayName . "','" .
                $_user->photoUrl . "','" .
                $_user->email . "','" .
                $_user->emailVerified . "');";
            if ($result = $mySql->query($query)) {
                $_user->id = $result->fetchAll()[0]['id'];
            }
        }
        return $_user;
    }

    private function getUserPermissions(User $_user)
    {
        $mySql = DB::mySql();
        $query = "CALL `getUserPermission`(" .$_user->id. ");";
        if ($result = $mySql->query($query)) {
            $data = $result->fetchAll();
            $permission = [];
            foreach($data as $element) {
                $permission[ $element['permissionName']][] = $element['accessLevel'];
            }
            return $permission;
        }
    }

    private function getStores(User $_user)
    {
        $mySql = DB::mySql();
        $query = "CALL `getStores`(" .$_user->id. ");";
        if ($result = $mySql->query($query)) {
            $data = $result->fetchAll(PDO::FETCH_ASSOC);
            return $data;
        }
    }

    public function checkOwnership($fireUserId,$_InfoArray)
    {
        $user = json_decode( $this->getUserFromDb($fireUserId));
        if($user->id == $_InfoArray["userId"]){
            return true;
        }
        return false;
    }
}
