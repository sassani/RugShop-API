<?php


use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


include 'user.php';
include 'categories.php';


    $app = new \Slim\App();

    $app->add(function ($req, $res, $next)
    {
        $response = $next($req, $res);

        return $response
        ->withHeader('Access-Control-Allow-Origin' , '*')// for enable the CORS
        ->withHeader('Access-Control-Allow-Headers', 'X-Http-Method-Override,apikey,Accept,Content-Type,Content-Length,origin, fireuid,  requesttoken, X-Requested-With,    Client-Security-Token, Accept-Encoding, enctype')// add Content-Type, Accept, Origin, Authorization and apikey as a valid header
        ->withHeader('Content-Type' , 'application/json')
        ->withHeader('Access-Control-Allow-Methods', 'PATCH,PUT,GET,POST,OPTIONS,DELETE');
    });

    $checkApi = function ($request, $response, $next)
    {
        $apikey = $request->getHeader('apikey')[0];
        $origin ="";
        if(isset($_SERVER["HTTP_ORIGIN"]))$origin = $_SERVER["HTTP_ORIGIN"];
            if($apikey == 'AIzaSyBiCBS_ijXuYfiw2xIgL_OuFPTkegWrk3w' || $origin =="https://rugpersia.com"){
                $response = $next($request, $response);
            }else{
                $data = array('errors' => 
                    [
                        'message'=>'Bad Authentication data.',
                        'Ardook says'=>$apikey
                    ], 
                    'status' => 401);
                $response = $response->withJson($data,200);
        }
        return $response;
    };


// Users
    $app->get('/users/getaccess', function (Request $request, Response $response) {
        try{
        $reqToken = $request->getHeader('requesttoken')[0];
        $user = new User();
        $user = $user->getUser($reqToken);
        return $user;
        } catch (Throwable $err) {
            return json_encode($err);
        }
    // });
    })->add($checkApi);

    $app->get('/users/getaccess/token', function (Request $request, Response $response) {
        try{
        $reqToken = $request->getHeader('requesttoken')[0];
        $user = new User();
        $user = $user->getUser($reqToken);
        return $user;
        } catch (Throwable $err) {
            return json_encode($err);
        }
    // });
    })->add($checkApi);


// Items...
    $app->get('/stores/{storeId}/items', function (Request $request, Response $response) {
        $item = new ItemService;
        $storId = $request->getAttribute('storeId');
        return $item->getItems($storId,0);
    })->add($checkApi);
    
    $app->get('/stores/{storeId}/items/{itemId}', function (Request $request, Response $response) {
        $item = new ItemService;
        $itemId = $request->getAttribute('itemId');
        print_r($itemId);
        return $item->getItems(0,$itemId);
    })->add($checkApi);
    
    $app->post('/stores/{storeId}/items', function (Request $request, Response $response) {
        $fireuid = $request->getHeader('fireuid')[0];
        $storeId = $request->getAttribute('storeId');
        $body = $request->getParsedBody();
        return ItemService::addItem($fireuid, $body,$storeId);        
    })->add($checkApi);
    
    $app->patch('/stores/{storeId}/items/{itemId}', function (Request $request, Response $response) {
        $fireuid = $request->getHeader('fireuid')[0];
        $itemId = $request->getAttribute('itemId');
        $body = $request->getParsedBody();
        return ItemService::editItem($fireuid, $body,$itemId);
    })->add($checkApi);

    $app->delete('/stores/{storeId}/items/{itemId}', function (Request $request, Response $response) {
        $fireuid = $request->getHeader('fireuid')[0];
        $itemId = $request->getAttribute('itemId');
        return ItemService::removeItem($fireuid,$itemId);
    })->add($checkApi);

// Images...
    $app->get('/stores/{storeId}/items/{itemId}/images', function (Request $request, Response $response) {
        $itemId = $request->getAttribute('itemId');
        // var_dump($itemId);
        return json_encode (ImageService::getImages($itemId), JSON_PRETTY_PRINT | JSON_NUMERIC_CHECK|JSON_UNESCAPED_UNICODE);
    })->add($checkApi);

    $app->post('/stores/{storeId}/items/{itemId}/images', function (Request $request, Response $response) {
        $reqToken = $request->getHeader('fireuid')[0];
        $itemId = $request->getAttribute('itemId');
        $file = $_FILES['imagefile'];
        return ImageService::addImages($reqToken,$itemId,$file);
    })->add($checkApi);

    $app->delete('/stores/{storeId}/items/{itemId}/images/{imageId}', function (Request $request, Response $response) {
        $reqToken = $request->getHeader('fireuid')[0];
        $imageId = $request->getAttribute('imageId');
        return ImageService::deleteImage($reqToken,$imageId);
    })->add($checkApi);

// Home ...

    $app->get('/home', function(Request $request, Response $response){ home($request, $response);});
    $app->get('/', function(Request $request, Response $response){ home($request, $response);});

    function home($request, $response){
        echo "<pre>RugShop API by\nArdavan Sassani\na.sassani@gmail.com\n</pre>";
    }

// Categories
    $app->get('/categories', function (Request $request, Response $response) {
        return Categories::getCatAll();
    })->add($checkApi);


// Test Area ...
    $app->get('/ardook/info', function (Request $request, Response $response) {
    print_r(__DIR__ );
    // include(realpath(__DIR__ . '/../..').'/info.php');
});
// })->add($checkApi);

$app->get('/test/{e}', function (Request $request, Response $response) {
    return Categories::getCatAll();
    // try{
    //     $mySql = DB::mySql();
    //     $query = "call ardavans_rugshop.getUsers(1);";

    //     if ($sqlResult = $mySql->query($query)) {
    //         // var_dump($sqlResult);
    //         foreach($sqlResult as $element){
    //             print_r($element['fireuid']);
    //         }
    //         }
    //     // var_dump();
    //     }
    // catch(Throwable $err){
    //     print_r($err);
    //     }
    });
    // })->add($checkApi);

    $app->run();
