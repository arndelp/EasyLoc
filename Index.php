
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un contrat</title>
</head>

<body>

<!--///////////Base de donnée//////////////////-->
<h2>Créer la base de donnée</h2>
<form method="POST" action="./services/createDB.php">   
  <div> 
    <input type="submit" value="Création de EasyLoc"></input>
  </div>
</form>
<form method="POST" action="./servicesMongoDB/PDOMongoDB.php">   
  <div> 
    <input type="submit" value="Création de EasyLoc"></input>
  </div>
</form>

<!--///////////Table contrat//////////////////-->
<h2>Créer la table des contrats</h2>
<form method="POST" action="./services/addTableContract.php">   
  <div> 
    <input type="submit" value="Création de la table des contrats"></input>
  </div>
</form>


<!--/////////////Ajouter un contrat/////////////-->
<h2>Ajouter un contrat</h2>
<form method="POST" action="./services/addDataContract.php">  
  <div>
      <label for="vehicle" >Immatriculation du véhicule</label>
      <input type="text" name="vehicle"  id="vehicle" placeholder="AA111AA...">
  
  </div>
  <div >
    <label for="customer" >Numéro de permis de conduire</label>
    <input type="text" name="customer"  id="customer" placeholder="1234567891011...">
  </div>

  <div>
    <label for="sign" >Signature du contrat</label>
    <input type="datetime-local" name="sign"  id="sign" placeholder="jj / mm / aaa --:--">
  </div>

  <div>
    <label for="loc_begin" >Début de la location</label>
    <input type="datetime-local" name="loc_begin"  id="loc_begin" placeholder="jj / mm / aaa --:--">
  </div>

  <div>
    <label for="loc_end" >Fin de la location</label>
    <input type="datetime-local" name="loc_end"  id="loc_end" placeholder="jj / mm / aaa --:--">
  </div>

  <div>
    <label for="returning" >Retour du véhicule</label>
    <input type="datetime-local" name="returning"  id="returning" placeholder="jj / mm / aaa --:--">
  </div>

  <div>
    <label for="cprice" >Prix de la location</label>
    <input type="text" name="cprice"  id="cprice" placeholder="100.50">€
  </div>

  <div> 
    <input type="submit" value="Ajouter"></input>
  </div>

</form>

<!--////////////////////Sélectionnner et Modifier un enregistrement///////////////////////-->

<!--Recherche d'un contrat -->
<h2>Rechercher un contrat</h2>

<form method="GET" action="./services/selectContract.php">    
    <label for="search">Je cherche:</label>
    <input type="number" name="ID" placeholder="ID" /> 
    <input type="submit" value="Rechercher" />
</form>

<h2>Modifier un contrat</h2>

<form method="POST" action="./services/updateReturnContract.php">    
    <label for="update">Modifier la date de retour du véhicule</label>
    <input type="number" name="ID" placeholder="ID du contrat" /> 
    <input type="datetime-local" name="returning"  /> 
    <input type="submit" value="Modifier" />
</form>

<form method="POST" action="./services/updatePriceContract.php">    
    <label for="update">Modifier le prix de la location</label>
    <input type="number" name="ID" placeholder="ID du contrat" /> 
    <input type="text" name="price" placeholder="Prix de la location" /> 
    <input type="submit" value="Modifier" />
</form>

<!--/////////////////Supprimer un contrat////////////////////////////-->

<h2>Supprimer un contrat</h2>
<form method="POST" action="./services/deleteContract.php">    
    <label for="delete">ID du contrat à supprimer:</label>
    <input type="number" name="ID" placeholder="ID du contrat" /> 
    <input type="submit" value="Supprimer" />
</form>


<!--///////////Table paiement//////////////////-->
<h2>Créer la table des paiements</h2>
<form method="POST" action="./services/addTableBilling.php">   
  <div> 
    <input type="submit" value="Création de la table des paiements"></input>
  </div>
</form>

<!--/////////////Ajouter un paiement/////////////-->
<h2>Ajouter un paiement</h2>
<form method="POST" action="./services/addDataBilling.php">  
  <div>
      <label for="contract" >ID du contrat:</label>
      <input type="number" name="contract"  id="contract" placeholder="1....">
  
  </div>
  <div >
    <label for="amount" >paiement effectué:</label>
    <input type="text" name="amount"  id="amount" placeholder="10.0">€
  </div>

  <div> 
    <input type="submit" value="Ajouter"></input>
  </div>
 
</form>

<!--Recherche d'un paiement -->
<h2>Rechercher un paiement</h2>

<form method="GET" action="./services/selectAmount.php">    
    <label for="search">Je cherche:</label>
    <input type="number" name="ID" placeholder="ID" /> 
    <input type="submit" value="Rechercher" />
</form>

<!--Modifier un paiement-->
<h2>Modifier un paiement</h2>
<form method="POST" action="./services/updateAmountBilling.php">    
    <label for="update">Modifier la valeur du paiement</label>
    <input type="number" name="ID" placeholder="ID du paiement" /> 
    <input type="text" name="amount" placeholder="Paiement effectué" /> 
    <input type="submit" value="Modifier" />
</form>

<h2>Supprimer un paiement</h2>
<form method="POST" action="./services/deleteAmount.php">    
    <label for="delete">ID du paiement à supprimer:</label>
    <input type="number" name="ID" placeholder="ID du paiement" /> 
    <input type="submit" value="Supprimer" />
</form>


<!--/////////////////////Regroupement des données///////////////////-->
<!--/////Select All///////-->
<h2>Regroupement des données</h2>
<form action="groupContracts.php">    
    <label for="selectAll">par içi-></label>
    <input type="submit" value="Trier" />
</form>


</body>
</html>

