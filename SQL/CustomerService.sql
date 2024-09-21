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
  

  /*Lister toutes les locations impayés*/ 
  SELECT  Contract_id, SUM(Billing.Amount) AS 'Paiements effectués' ,MAX(Contract.price) AS 'Montant total ' 
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