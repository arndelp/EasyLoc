<?php
require_once "../Layout/header.php ";
require_once '../PDO.php';

$my_Db_Connection->exec("CREATE TABLE EasyLoc.Contract (
    ID int NOT NULL AUTO_INCREMENT,  
    vehicle_uid CHAR(255) NOT NULL , /*uid du véhicule*/
    customer_uid CHAR(255) NOT NULL ,/*uid du client*/
    sign_datetime DATETIME,                /*date de signature du contrat*/
    loc_begin_datetime DATETIME,           /*date de début de location*/
	loc_end_datetime DATETIME,             /*date de fin de location*/
	returning_datetime DATETIME,           /*date de rendu du véhicule*/
	price DOUBLE(7,2),                      /*prix facturé pour le contrat*/
    PRIMARY KEY (ID)                       /*clé unique du contrat*/
);
")
    or die(print_r($my_Db_Connection->errorInfo(), true));

    echo "&nbsp Création de la table effectuée.";

    ?>