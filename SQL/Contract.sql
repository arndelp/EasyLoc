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
