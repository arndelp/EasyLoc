<?php
require_once "../Layout/header.php ";
require_once '../PDO.php';

//Variables du contrat à ajouter

$vehicle_uid = $_POST['vehicle'];
$customer_uid = $_POST['customer'];
$sign_datetime = $_POST['sign'];
$loc_begin_datetime = $_POST['loc_begin'];
$loc_end_datetime = $_POST['loc_end'];
$returning_datetime = $_POST['returning'];
$price = $_POST['cprice'];



$my_Insert_Statement = $my_Db_Connection->prepare("INSERT INTO  EasyLoc.Contract (vehicle_uid, customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime,returning_datetime,price ) 
    VALUES (:vehicle_uid,:customer_uid, :sign_datetime, :loc_begin_datetime, :loc_end_datetime, :returning_datetime, :price)");


if ($my_Insert_Statement->execute([
    'vehicle_uid' => $_POST['vehicle'],
    'customer_uid' => $_POST['customer'],
    'sign_datetime' =>$_POST['sign'],
    'loc_begin_datetime' => $_POST['loc_begin'],
    'loc_end_datetime' => $_POST['loc_end'],
    'returning_datetime' => $_POST['returning'],
    'price' => $_POST['cprice']]
    
)) {
    echo "Nouvel enregistrement créé avec succès.";
    } else {
    echo "Impossible de créer l'enregistrement";
    }

?>