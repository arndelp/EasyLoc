
<?php

require_once "Layout/header.php ";
require_once "PDO.php";


echo "<table style='border: solid 1px black;'>";
echo "<tr>
        <th>Id</th>
        <th>Vehicle_uid</th>
        <th>Customer_uid</th>
        <th>sign_datetime</th>
        <th>loc_begin_datetime</th>
        <th>loc_end_datetime</th>
        <th>returning_datetime</th>
        <th>price (€)</th>

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

    
$stmt = $my_Db_Connection->prepare("SELECT * FROM EasyLoc.Contract");
$stmt->execute();   
$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
       
  echo $v;
    
} ;

echo "</table>";
 
?>
  

<br /> 

<!--/////Regroupement par customer_uid////////////-->
<form method="POST" action="services/regroupements/customerContract.php">    
    <label for="groupContractsCust">Recherche des contrats d'un client:</label>
    <input type="text" name="customer_uid" placeholder="Customer_uid" /> 
    <input type="submit" value="Chercher" />
</form>

<!--//////Retard d'une heure/////////-->
<form method="POST" action="services/regroupements/lateMore1h.php">    
    <label for="lateMore1h">Lister les contracts ayant un retard de plus d'une heure:</label>
    <input type="submit" value="Cliquer içi!" />
</form>

<!--//////Locations non terminées///////////-->
<form method="POST" action="services/regroupements/notCompleted.php">    
    <label for="groupContractsCust">Recherche des locations non terminées:</label>
    <input type="text" name="customer_uid" placeholder="Customer_uid" /> 
    <input type="submit" value="Chercher" />
</form>

<!--//////Lister les paiement d'un contrat///////////-->
<form method="POST" action="services/regroupements/amountsListContract.php">    
    <label for="amountsListContract">Lister les paiements d'un contrat:</label>
    <input type="text" name="Contractid" placeholder="Contract_id" /> 
    <input type="submit" value="Chercher" />
</form>

<!--//////Vérifier qu'un contrat est totalemet payé///////////-->
<form method="POST" action="services/regroupements/verifAmount.php">    
    <label for="verifAmount">Vérifier qu'un contrat est payé:</label>
    <input type="number" name="Id_du_contrat" placeholder="Contract_id" /> 
    <input type="submit" value="Vérifier" />
</form>



</body>
</html>

