<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

    $app = new \Slim\App;

    $app->get('/', function (Request $request, Response $response) {
        echo "This is the Home Page.php..."."<br/>";
        // include("../views/home/home.html");
//         echo "test ".DOMDocument::loadHTMLFile ( "../views/home/home.html" );
//         //create a new DOMDocument instance
//         $doc = new DOMDocument();
// //loading a HTML file
//         $doc->loadHTMLFile('../views/home/home.html');

// //format the output for nice display
//         $doc->formatOutput = true;
//         echo '<pre>' . htmlentities($doc->saveHTML(), ENT_COMPAT | ENT_HTML401, "ISO-8859-1") . '</pre>';
    });
