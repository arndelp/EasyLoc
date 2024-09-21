/*Accéder à un contract à partir de sa clé unique*/
SELECT * FROM Contract
WHERE id = X; /*X= n° de de l'id */

/*Créer un contract à la date actuelle*/
INSERT INTO Contract (vehicle_uid, custumer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'vehicle_uid',  'customer_uid', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'date et heure de retour pr�vues');

/*Créer un contract à une autre date */
INSERT INTO Contract (vehicle_uid, custumer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'vehicle_uid',  'customer_uid', 'date et heure de signature','date et heure de d�but', 'date et heure de retour pr�vues');

/*Supprimer un contrat existant*/
DELETE FROM Contract WHERE id=X;
/* X=identifiant du contrat à suppimer */

/*Modifier un contrat existant*/
UPDATE Contract
SET  vehicle_uid = 'vehicle_uid', customer_uid = 'customer_uid'
WHERE id=X;
/*X= identifiant du contrat à modifier*/