<?php


require_once "../Layout/header.php ";
require_once "../PDO.php";

    
$stmt = $my_Db_Connection->prepare("UPDATE EasyLoc.Contract
SET  returning_datetime = '$_POST[returning]'
WHERE ID = $_POST[ID];");
$stmt->execute();  


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

    
$stmt = $my_Db_Connection->prepare("SELECT * FROM EasyLoc.Contract WHERE ID = $_POST[ID];");
$stmt->execute();   
$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
       
  echo $v;
    
} ;
echo "</table>";
 

?>



