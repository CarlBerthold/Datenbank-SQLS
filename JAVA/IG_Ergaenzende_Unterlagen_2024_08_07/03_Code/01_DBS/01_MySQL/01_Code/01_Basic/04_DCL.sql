
	CREATE DATABASE DCLDB;
	USE DCLDB;

	CREATE TABLE Person 
	(
		IDPerson		INT				AUTO_INCREMENT 		NOT NULL
		,Vorname		VARCHAR(30)							NOT NULL
		,Nachname		VARCHAR(30)							NOT NULL
        
		,CONSTRAINT		PK_Person_IDPerson	PRIMARY KEY (IDPerson)
	);
    
    INSERT Person 	(Vorname,Nachname)
    VALUES			('Hans', 'Mueller');
   
	INSERT Person 	(Vorname,Nachname)
    VALUES			('Jenny', 'Peters');
       
	INSERT Person 	(Vorname,Nachname)
    VALUES			('Ali', 'Mehmet');
 /*   
    UPDATE 	PERSON
    SET 	VORNAME = 'Ali-Murat'
    WHERE 	IDPerson = 1;
    
	DELETE FROM  PERSON;
*/
    SELECT * 
    FROM Person;

-- MYSQL DCL ----------------------------------------------------------------------------------------
-- ABFRAGEN - USER / ROLLE -----------------------
SELECT 	CURRENT_USER();
SELECT	CURRENT_ROLE();

SHOW 	GRANTS FOR	CURRENT_USER();
SHOW 	GRANTS FOR	UserOne;
SHOW 	GRANTS FOR	User_Role;

-- ERZEUGEN - USER / ROLLE -----------------------
CREATE 	USER		UserOne	
IDENTIFIED BY 		'1234-wert';

CREATE 	USER		UserTwo
IDENTIFIED BY 		'1234-wert';

CREATE 	ROLE	User_Role;

-- ZUWEISUNG - USER / ROLLE ---------------------
GRANT User_Role TO UserOne;

-- AKTIVIEREN - USER / ROLLE --------------------
SET DEFAULT ROLE ALL TO UserOne;
SET DEFAULT ROLE ALL TO User_Role;

-- BERECHTIGUNG - GEBEN ------------------------
GRANT SELECT ON Person TO User_Role;
GRANT INSERT, UPDATE, DELETE ON Person TO Petra;
GRANT SELECT, UPDATE (vorname, nachName) ON Person TO User_Role;
GRANT SELECT ON Person TO UserTwo;

GRANT UPDATE (Vorname) ON Person TO UserOne;
GRANT INSERT, UPDATE, DELETE ON Person TO UserOne; 

-- BERECHTIGUNG - ENTZIEHEN --------------------
REVOKE UPDATE ON Person FROM User_Role;
REVOKE UPDATE ON Person FROM UserOne;

-- USER / ROLE - LOESCHEN ----------------------
-- DROP USER UserOne;
-- DROP ROLE User_Role;

-- DROP DATABASE  IF EXISTS DCLDB;