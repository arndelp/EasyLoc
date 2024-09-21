<?php
require_once "../Layout/header.php ";
require_once '../PDO.php';


//Variables du contrat à ajouter

$Contract_id = $_POST['contract'];
$Amount = $_POST['amount'];




$my_Insert_Statement = $my_Db_Connection->prepare("INSERT INTO  EasyLoc.Billing (Contract_id, Amount ) 
    VALUES (:Contract_id,:Amount)");


if ($my_Insert_Statement->execute([
    'Contract_id' => $_POST['contract'],
    'Amount' => $_POST['amount']]
    
)) {
    echo "Nouvel enregistrement créé avec succès.";
    } else {
    echo "Impossible de créer l'enregistrement";
    }

?>