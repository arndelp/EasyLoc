<?php

// Définir le nom de la base de donnée, le nom d'utilisateur et le mot de passe
$db= 'test';
$user= 'root1';
$pwd='root1';

//COnnection à la Base de donnée
require_once '../PDO.php';


//Création de variable appelant la méthode prepare()

$my_Db_Connection->exec("CREATE DATABASE `$db`;
    CREATE USER '$user'@'localhost' IDENTIFIED BY '$pwd';
    GRANT ALL ON `$db` .* TO '$user'@'localhost';
    FLUSH PRIVILEGES;  ")
    or die(print_r($my_Db_Connection->errorInfo(), true));

               
        
echo "Création de la base de donnée réussie";

?>