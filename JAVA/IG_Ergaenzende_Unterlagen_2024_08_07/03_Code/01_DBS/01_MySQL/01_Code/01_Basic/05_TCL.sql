
	CREATE DATABASE TCLDBS;
	USE TCLDBS;

	-- DDL - ERZEUGEN TABELLEN & BEZIEHUNG
	CREATE TABLE Person 
	(
		IDPerson		INT				AUTO_INCREMENT 		NOT NULL
		,Vorname		VARCHAR(30)							NOT NULL
		,Nachname		VARCHAR(30)							NOT NULL
        
		,CONSTRAINT		PK_Person_IDPerson	PRIMARY KEY (IDPerson)
	);
    
    -- DML - SCHREIB - INSERT - UPDATE - DELETE 
    INSERT Person 	(Vorname,Nachname)
    VALUES			('Hans', 'Mueller');
   
	INSERT Person 	(Vorname,Nachname)
    VALUES			('Jenny', 'Peters');
       
	INSERT Person 	(Vorname,Nachname)
    VALUES			('Ali', 'Mehmet');
    
    SELECT * 
    FROM Person;

-- MYSQL TCL ----------------------------------------------------------------------------------------

-- TRANSAKTION SIND AUF AUTOCOMMIT 
-- --> Jede Transaktion wird festgeschrieben
SELECT @@AUTOCOMMIT;
-- SET AUTOCOMMIT= true;
-- SET AUTOCOMMIT = 1; 


-- IMPLIZIT 
-- --> Start Auto 
-- --> Ende COMMIT / ROLLBACK
SELECT @@AUTOCOMMIT;
-- SET AUTOCOMMIT = false;
-- SET AUTOCOMMIT = 0; 
SELECT @@AUTOCOMMIT;

	SELECT * 
    FROM Person;
    
	DELETE FROM  PERSON;
    INSERT Person 	(Vorname,Nachname)
    VALUES			('Ali', 'Mehmet');
   
	INSERT Person 	(Vorname,Nachname)
    VALUES			('Maria', 'Jeffrey');
       
	INSERT Person 	(Vorname,Nachname)
    VALUES			('Ana', 'Peters');
    
	SELECT * 
    FROM Person;
 
SELECT @@AUTOCOMMIT;

-- ROLLBACK;
-- COMMIT;

-- DROP DATABASE  IF EXISTS TCLDBS;