CREATE TABLE Billing (
	ID int NOT NULL PRIMARY KEY IDENTITY,  /*cl� unique du paiement*/
	Contract_id int FOREIGN KEY REFERENCES Contract(id), /* cl� unique du contrat concern� par le paiement*/
	Amount MONEY /*Montant pay�*/
);