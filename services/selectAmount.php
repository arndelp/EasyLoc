
<?php

require_once "../Layout/header.php ";
require_once "../PDO.php";


echo "<table style='border: solid 1px black;'>";
echo "<tr>
        <th>ID</th>
        <th>Contract_id</th>
        <th>Amount (€)</th>
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

    
$stmt = $my_Db_Connection->prepare("SELECT * FROM EasyLoc.Billing WHERE ID = $_GET[ID];");
$stmt->execute();   
$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
       
  echo $v;
    
} ;
echo "</table>";
 
?>
  

<br /> 


<form method="POST" action="updateAmountBilling.php">    
    <label for="update">Modifier la valeur du paiement</label>
    <input type="number" name="ID" placeholder="ID du paiement" /> 
    <input type="text" name="amount" placeholder="Paiement effectué" /> 
    <input type="submit" value="Modifier" />
</form>

</body>
</html>

