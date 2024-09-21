<?php
var_dump($_POST);

require_once "../../Layout\header.php";
require_once "../../PDO.php";


echo "<table style='border: solid 1px black;'>";
echo "<tr>
        <th>Id</th>
        <th>price</th>
        <th>total_payé</th>
        </tr>";

class TableRows extends RecursiveIteratorIterator {
  function __construct($it) {
    parent::__construct($it, self::LEAVES_ONLY);
  }

  function current() {
    return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
  }

  function beginChildren() {
    echo "<tr>";
  }

  function endChildren() {
    echo "</tr>" . "\n";
  }
} 

    
$stmt = $my_Db_Connection->prepare(" SELECT Contract.ID, Contract.price ,SUM(Billing.Amount),
CASE
	WHEN SUM(Billing.Amount) = 0.00  AND Contract.price = 0.00 THEN 'Informations à saisir'
	WHEN SUM(Billing.Amount) = 0.00 THEN 'la location doit être payée'
	WHEN SUM(Billing.Amount) < Contract.price THEN 'Paiement partiel'
    WHEN SUM(Billing.Amount) = Contract.price THEN 'Le paiement est terminé'
    WHEN SUM(Billing.Amount) > Contract.price THEN 'Remboursement nécessaire'	
END AS 'Etat de la transaction'
FROM EasyLoc.Contract
  INNER JOIN  EasyLoc.Billing ON  Billing.Contract_id = Contract.id
WHERE Contract.ID =$_POST[Id_du_contrat]
GROUP BY Contract.ID ;");
$stmt->execute();   
$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
       
  echo $v;
    
} ;
echo "</table>";
 

?>