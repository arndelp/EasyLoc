INSERT INTO Contract (vehicle_uid,customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime, returning_datetime, price)
VALUES 
( 'FD569TR', '968klE', '11-02-2023 08:00', '11-02-2023 08:00', '20-02-2023 16:00','20-02-2023 16:00', 1050),
( 'AB865TR', '126RTt', '12-02-2023 13:20', '12-02-2023 13:20', '13-02-2023 18:00','13-02-2023 18:00', 100),
( 'TR986GH', '236yju', '13-02-2023 08:25', '14-02-2023 8:00', '15-02-2023 18:00','15-02-2023 18:00', 150);

INSERT INTO Contract (vehicle_uid, customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime)
VALUES 
( 'GA632FR', '236yju', '02-02-2023 08:00', '02-02-2023 08:00', '03-02-2023 16:00');

INSERT INTO Contract (vehicle_uid, customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime, returning_datetime, price)
VALUES 
( 'FT569TR', '968klE', '14-02-2023 08:00', '14-02-2023 08:00','20-02-2023 16:00', '25-02-2023 14:00', 1450);

INSERT INTO Contract (vehicle_uid, customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime, returning_datetime, price)
VALUES 
( 'FT869TP', '968klE', '26-02-2023 08:00', '26-02-2023 08:00','27-02-2023 16:00', '27-02-2023 16:30', 145);

INSERT INTO Contract (vehicle_uid, customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime, returning_datetime, price)
VALUES 
( 'FT869TP', '126RTt', '02-03-2023 08:00', '02-03-2023 08:00','04-03-2023 16:00', '05-03-2023 16:00', 300);

INSERT INTO Contract (vehicle_uid, customer_uid, sign_datetime, loc_begin_datetime, loc_end_datetime, returning_datetime, price)
VALUES 
( 'FT569TR', '236yju', '03-03-2023 08:00', '03-03-2023 08:00','04-03-2023 16:00', '04-03-2023 16:00', 100);

INSERT INTO Billing ( Contract_id, Amount)
VALUES (1007, 100);


UPDATE Contract
SET  returning_datetime = CONVERT(datetime, '2023-03-05T18:00:00.000')
WHERE id=1007;

SELECT * FROM Contract
SELECT * FROM Billing

DELETE  FROM Contract

ALTER TABLE Contract
DROP CONSTRAINT customer_uid; 

EXEC sp_rename 'Contract.customer_uid',  'customer_uidold', 'COLUMN'; 


UPDATE Contract
SET returning_datetime = loc_end_datetime
WHERE id=4; 

ALTER TABLE Contract
DROP COLUMN customer_uidold

ALTER TABLE Contract
ADD customer_uid CHAR(255) ; 

INSERT INTO Contract (customer_uid)
SELECT customer_uid
FROM Contract


DROP TABLE Contract

ALTER TABLE Contract
ALTER COLUMN price MONEY NOT NULL ;

SELECT SUM(price) FROM Contract
WHERE id = 1004;

DELETE FROM Billing 
WHERE ID=14;