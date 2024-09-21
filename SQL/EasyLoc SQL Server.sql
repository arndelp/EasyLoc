
           ////////////* PARTIE 1 SQL SERVER*/////////////////


/*Cr�ation de la base de donn�es "EasyLoc"*/
CREATE DATABASE EasyLoc

/*Cr�ation de la table Contrat*/
CREATE TABLE Contract (
    id int NOT NULL PRIMARY KEY IDENTITY,  /*cl� unique du contrat*/
    vehicle_uid CHAR(255) NOT NULL , /*uid du v�hicule*/
    customer_uid CHAR(255) NOT NULL ,/*uid du client*/
    sign_datetime DATETIME,                /*date de signature du contrat*/
    loc_begin_datetime DATETIME,           /*date de d�but de location*/
	loc_end_datetime DATETIME,             /*date de fin de location*/
	returning_datetime DATETIME,           /*date de rendu du v�hicule*/
	price MONEY                            /*prix factur� pour le contrat*/
);

/*Cr�ation de la table Billing*/
CREATE TABLE Billing (
	ID int NOT NULL PRIMARY KEY IDENTITY,  /*cl� unique du paiement*/
	Contract_id int FOREIGN KEY REFERENCES Contract(id), /* cl� unique du contrat concern� par le paiement*/
	Amount MONEY /*Montant pay�*/
);

/*Acc�der � un contract � partir de sa cl� unique*/
SELECT * FROM Contract
WHERE id = X; /*X= n�de de l'id */

/*Cr�er un contract � la date actuelle*/
INSERT INTO Contract (vehicle_uid, custumer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'vehicle_uid',  'customer_uid', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'date et heure de retour pr�vues');

/*Cr�er un contract � une autre date */
INSERT INTO Contract (vehicle_uid, custumer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'vehicle_uid',  'customer_uid', 'date et heure de signature','date et heure de d�but', 'date et heure de retour pr�vues');

/*Supprimer un contrat existant*/
DELETE FROM Contract WHERE id=X;
/* X=identifiant du contrat � suppimer */

/*Modifier un contrat existant*/
UPDATE Contract
SET  vehicle_uid = 'vehicle_uid', customer_uid = 'customer_uid'
WHERE id=X;
/*X= identifiant du contrat � modifier*/



  ////////////* PARTIE 2 SQL SERVER*/////////////////

  /*Pouvoir lister tout les contrats associ�s � un uid de customer*/
  SELECT * FROM Contract
  WHERE customer_uid ='X'; /*X=customer_uid*/

  /*Lister les locations en cours associ�es d'un uid de customer*/
  SELECT * FROM Contract
  WHERE customer_uid = 'X' AND returning_datetime IS NULL;  /*X=customer_uid*/

  /*Lister toutes les location en retard d'une heure*/
  SELECT * FROM Contract
  WHERE returning_datetime > loc_end_datetime +1.00;

  /*Lister tout les paiements associ�s � une location*/
  SELECT Amount FROM Billing
  WHERE Contract_id = X;  /*X = contract_id*/

  /*V�rifier qu'une location a �t� int�gralement pay�e*/
 SELECT Contract.id, MAX(Contract.price) AS 'Prix de location',SUM(Billing.Amount) AS 'total pay�',
CASE
	WHEN SUM(Billing.Amount) = 0.00  AND MAX(Contract.price) = 0.00 THEN 'Informations � saisir'
	WHEN SUM(Billing.Amount) = 0.00 THEN 'la location doit �tre pay�e'
	WHEN SUM(Billing.Amount) < MAX(Contract.price) THEN 'Paiement partiel'
    WHEN SUM(Billing.Amount) = MAX(Contract.price) THEN 'Le paiement est termin�'
    WHEN SUM(Billing.Amount) > MAX(Contract.price) THEN 'Remboursement n�cessaire'	
END AS 'Etat de la transaction'
FROM Contract
  INNER JOIN  Billing ON  Billing.Contract_id = Contract.id
GROUP BY Contract.id ;
  

  /*Lister toutes les locations impay�s*/ 
  SELECT  Contract_id, SUM(Billing.Amount) AS 'Paiements effectu�s' ,MAX(Contract.price) AS 'Montant total d�' 
  FROM Contract
  INNER JOIN  Billing ON  Billing.Contract_id = Contract.id
  GROUP BY Contract_id 
  HAVING SUM(Billing.Amount) < MAX(Contract.price);

  /*Compter le nombre de retard entre deux dates donn�es*/
  SELECT COUNT(Contract.loc_end_datetime) AS 'nombre de retard' from Contract
  WHERE  Contract.returning_datetime > Contract.loc_end_datetime AND  
  Contract.loc_end_datetime >= CONVERT(datetime, 'date1')  /*   date1 = par exemple '2023-02-15T08:00:00.000'   */
  AND  Contract.loc_end_datetime < CONVERT(datetime, 'date2'); /*   date2 = par exemple '2023-03-26T23:00:00.000'   */	
									

  /*Lister tout les contrats o� un certain v�hicule a �t� utilis�*/
  SELECT vehicle_uid, contract.id, customer_uid FROM Contract
  WHERE vehicle_uid = 'X'; /*X=vehicle_uid*/

 
/*Pouvoir r�cuperer tout les contrats regroup�s par v�hicule*/
SELECT * FROM Contract
WHERE vehicle_uid ='X'; /*X=vehicle_uid*/
/*Pouvoir r�cuperer tout les contrats regroup�s par client/cliente*/
SELECT * FROM Contract
WHERE customer_uid ='X'; /*X=vehicle_uid*/







 


SELECT * FROM Contract;
SELECT * FROM Billing;


  





