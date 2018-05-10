<?php
// echo 'Hello';




require_once 'vendor/autoload.php';
require_once 'api/src/config/db.php';
       
require_once 'api/src/models/store.php';
require_once 'api/src/models/item.php';
require_once 'api/src/models/image.php';
require_once 'api/src/models/token.php';
       
require_once 'api/src/srvs/fileservice.php';
require_once 'api/src/srvs/imageservice.php';
require_once 'api/src/srvs/itemservice.php';
require_once 'api/src/srvs/storeservice.php';

       
require_once 'api/src/routes/router.php';
require_once 'api/src/routes/user.php';
