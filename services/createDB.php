<?php
require_once "../Layout/header.php ";
// Définir le nom de la base de donnée, le nom d'utilisateur et le mot de passe
$db= 'EasyLoc';


//COnnection à la Base de donnée
require_once '../PDO.php';


//Création de variable appelant la méthode prepare()

$my_Db_Connection->exec("CREATE DATABASE `$db`; ")
    or die(print_r($my_Db_Connection->errorInfo(), true));

               
        
echo " &nbsp Création de la base de donnée réussie";

?>