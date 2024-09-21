<?php
require_once "../Layout/header.php ";
require_once '../PDO.php';


$my_Db_Connection->exec("CREATE TABLE EasyLoc.Billing (
    ID INT NOT NULL AUTO_INCREMENT,  
	Contract_id INT ,
	Amount DOUBLE(7,2), 
    PRIMARY KEY (ID),
    FOREIGN KEY (Contract_id) REFERENCES Contract(ID));")



    or die(print_r($my_Db_Connection->errorInfo(), true));

    echo "&nbsp Création de la table effectuée.";

    ?>