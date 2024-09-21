
           ////////////* PARTIE 1 SQL SERVER*/////////////////


/*Création de la base de données "EasyLoc"*/
CREATE DATABASE EasyLoc

/*Création de la table Contrat*/
CREATE TABLE Contract (
    id int NOT NULL PRIMARY KEY IDENTITY,  /*clé unique du contrat*/
    vehicle_uid CHAR(255) NOT NULL , /*uid du véhicule*/
    customer_uid CHAR(255) NOT NULL ,/*uid du client*/
    sign_datetime DATETIME,                /*date de signature du contrat*/
    loc_begin_datetime DATETIME,           /*date de début de location*/
	loc_end_datetime DATETIME,             /*date de fin de location*/
	returning_datetime DATETIME,           /*date de rendu du véhicule*/
	price MONEY                            /*prix facturé pour le contrat*/
);

/*Création de la table Billing*/
CREATE TABLE Billing (
	ID int NOT NULL PRIMARY KEY IDENTITY,  /*clé unique du paiement*/
	Contract_id int FOREIGN KEY REFERENCES Contract(id), /* clé unique du contrat concerné par le paiement*/
	Amount MONEY /*Montant payé*/
);

/*Accéder à un contract à partir de sa clé unique*/
SELECT * FROM Contract
WHERE id = X; /*X= n°de de l'id */

/*Créer un contract à la date actuelle*/
INSERT INTO Contract (vehicle_uid, custumer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'vehicle_uid',  'customer_uid', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'date et heure de retour prévues');

/*Créer un contract à une autre date */
INSERT INTO Contract (vehicle_uid, custumer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'vehicle_uid',  'customer_uid', 'date et heure de signature','date et heure de début', 'date et heure de retour prévues');

/*Supprimer un contrat existant*/
DELETE FROM Contract WHERE id=X;
/* X=identifiant du contrat à suppimer */

/*Modifier un contrat existant*/
UPDATE Contract
SET  vehicle_uid = 'vehicle_uid', customer_uid = 'customer_uid'
WHERE id=X;
/*X= identifiant du contrat à modifier*/



  ////////////* PARTIE 2 SQL SERVER*/////////////////

  /*Pouvoir lister tout les contrats associés à un uid de customer*/
  SELECT * FROM Contract
  WHERE customer_uid ='X'; /*X=customer_uid*/

  /*Lister les locations en cours associées d'un uid de customer*/
  SELECT * FROM Contract
  WHERE customer_uid = 'X' AND returning_datetime IS NULL;  /*X=customer_uid*/

  /*Lister toutes les location en retard d'une heure*/
  SELECT * FROM Contract
  WHERE returning_datetime > loc_end_datetime +1.00;

  /*Lister tout les paiements associés à une location*/
  SELECT Amount FROM Billing
  WHERE Contract_id = X;  /*X = contract_id*/

  /*Vérifier qu'une location a été intégralement payée*/
 SELECT Contract.id, MAX(Contract.price) AS 'Prix de location',SUM(Billing.Amount) AS 'total payé',
CASE
	WHEN SUM(Billing.Amount) = 0.00  AND MAX(Contract.price) = 0.00 THEN 'Informations à saisir'
	WHEN SUM(Billing.Amount) = 0.00 THEN 'la location doit être payée'
	WHEN SUM(Billing.Amount) < MAX(Contract.price) THEN 'Paiement partiel'
    WHEN SUM(Billing.Amount) = MAX(Contract.price) THEN 'Le paiement est terminé'
    WHEN SUM(Billing.Amount) > MAX(Contract.price) THEN 'Remboursement nécessaire'	
END AS 'Etat de la transaction'
FROM Contract
  INNER JOIN  Billing ON  Billing.Contract_id = Contract.id
GROUP BY Contract.id ;
  

  /*Lister toutes les locations impayés*/ 
  SELECT  Contract_id, SUM(Billing.Amount) AS 'Paiements effectués' ,MAX(Contract.price) AS 'Montant total dû' 
  FROM Contract
  INNER JOIN  Billing ON  Billing.Contract_id = Contract.id
  GROUP BY Contract_id 
  HAVING SUM(Billing.Amount) < MAX(Contract.price);

  /*Compter le nombre de retard entre deux dates données*/
  SELECT COUNT(Contract.loc_end_datetime) AS 'nombre de retard' from Contract
  WHERE  Contract.returning_datetime > Contract.loc_end_datetime AND  
  Contract.loc_end_datetime >= CONVERT(datetime, 'date1')  /*   date1 = par exemple '2023-02-15T08:00:00.000'   */
  AND  Contract.loc_end_datetime < CONVERT(datetime, 'date2'); /*   date2 = par exemple '2023-03-26T23:00:00.000'   */	
									

  /*Lister tout les contrats où un certain véhicule a été utilisé*/
  SELECT vehicle_uid, contract.id, customer_uid FROM Contract
  WHERE vehicle_uid = 'X'; /*X=vehicle_uid*/

 
/*Pouvoir récuperer tout les contrats regroupés par véhicule*/
SELECT * FROM Contract
WHERE vehicle_uid ='X'; /*X=vehicle_uid*/
/*Pouvoir récuperer tout les contrats regroupés par client/cliente*/
SELECT * FROM Contract
WHERE customer_uid ='X'; /*X=vehicle_uid*/







 


SELECT * FROM Contract;
SELECT * FROM Billing;


  





