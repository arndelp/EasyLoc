<?php
require_once "../Layout/header.php ";
require_once '../PDO.php';


$my_Db_Connection->exec("DELETE FROM EasyLoc.Contract WHERE id=$_POST[ID];")



    or die(print_r($my_Db_Connection->errorInfo(), true));

    echo "&nbsp Suppression du contrat effectué.";

    ?>