
<?php

//Données de connection au serveur SQL Server
$database= 'EasyLoc';
$sql = "mysql:host=127.0.0.1; charset=utf8mb4";
$username ='root';
$password = 'root';
$dsn_Options = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION];


//Connection à SQL Server EasyLoc
try {
$my_Db_Connection = new PDO($sql, $username, $password, $dsn_Options);
echo"\r\n";
echo "Connexion au serveur réussie!";    
} catch (PDOException $error) {
    echo "Echec de la connexion:".$error->getMessage();
}
?>