<?php
require_once __DIR__ . '/vendor/autoload.php';


use MongoDB\Client;
use MongoDB\Driver\ServerApi;
// Replace the placeholder with your Atlas connection string
$uri = 'mongodb://root:root@localhost:27017/';
// Specify Stable API version 1
$apiVersion = new ServerApi(ServerApi::V1);
// Create a new client and connect to the server
$client = new MongoDB\Client($uri, [], ['serverApi' => $apiVersion]);
try {
    // Send a ping to confirm a successful connection
    $client->selectDatabase('admin')->command(['ping' => 1]);
    echo "Pinged your deployment. You successfully connected to MongoDB!\n";
} catch (Exception $e) {
    printf($e->getMessage());
}