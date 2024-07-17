-- ------------------------------- DDL -------------------------------------------
-- Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren Beziehungen.

    CREATE DATABASE FourDB;
	USE FourDB;

-- ------------------------- ALTER ADD COLUMN ------------------------------------
-- Mit dem Befehl ALTER veraendern wir die bereits bestehende Tabellen Struktur.
-- Hinzufuegen einer Spalte.

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung VARCHAR(20) 
	);    
	
    INSERT 		Produkt
    VALUES 		('Notebook'); 
	
    SELECT 		* 
    FROM 		Produkt;
    
	ALTER 	TABLE		Produkt 
    ADD 	COLUMN 		Nummer 		INT;
	
    INSERT 	Produkt 
    VALUES 	(	'Smartphone'	,623453	); 
	
    SELECT 	* 
    FROM 	Produkt;
    
	DROP TABLE 	Produkt;
    
-- -------------------------- DROP COLUMN-----------------------------------------
-- Enfernen einer Spalte.

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung 	VARCHAR(20)
        ,Nummer			INT
	); 
    
	INSERT 	Produkt 
    VALUES 	( 	'Smartphone'	,77 	);
    
	SELECT 	* 
    FROM 	Produkt;
	
	ALTER 	TABLE		Produkt 
    DROP 	COLUMN 		Nummer;
	
    SELECT 	* 
    FROM 	Produkt;

	DROP TABLE 	Produkt;
        
-- --------------------------- MODIFY COLUMN --------------------------------------
-- Aendern einer Spalte.

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung 	VARCHAR(20)
	); 
    
	INSERT 	Produkt 
    VALUES 	(	'Nootebook - Eigenbau'	); 
    
	SELECT 	LENGTH(Bezeichnung)		as 'Anzahlzeichen'
			,Bezeichnung	
    FROM 	Produkt;
    
    -- FEHLER
	-- INSERT 	Produkt 
    -- VALUES 	(	'Notebook iX Przesser 4th GenerationV'	);

	ALTER 	TABLE		Produkt 
    MODIFY 	COLUMN 		Bezeichnung VARCHAR(40);

	INSERT 	Produkt 
    VALUES 	(	'Notebook iX Przesser 4th GenerationV'	);
    
	SELECT 	LENGTH(Bezeichnung)		AS 'Anzahlzeichen'
			,Bezeichnung	
    FROM 	Produkt;
    
	DROP TABLE 	Produkt;

-- -------------------------- ADD NOT NULL ---------------------------------------
-- Eine Spalte Nullbar machen.	

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung 	VARCHAR(20)			NOT NULL
        ,Marke			VARCHAR(20) 		NULL
	); 
    
	INSERT 	Produkt 	(	Bezeichnung		,	Marke	 	)
    VALUES 				(	'Smartphone'	,	null		); 
	 
	SELECT 	*
    FROM 	Produkt;
    
    UPDATE 	Produkt
    SET 	Marke = ''
	WHERE	Marke IS NULL;

	ALTER 	TABLE		Produkt 
    MODIFY 	COLUMN		Marke		 	VARCHAR(20) 	NOT NULL 		DEFAULT	 '';
	
	INSERT 	Produkt 	(	Bezeichnung	 	)
    VALUES 				(	'Tablet'		); 
    
    SELECT 	*
    FROM 	Produkt;
    
	DROP TABLE 	Produkt;
    
-- ---------------------------- ADD CONSTRAINT -----------------------------------
-- Einschränkungen können auch nach der Tabelle Definition eingefügt werden.

    CREATE TABLE Dozent
    (
        Titel			VARCHAR(10)
	);
    
	INSERT Dozent 
    VALUES ('Bachelor');
    
    ALTER TABLE	Dozent 
	ADD CHECK ( ( LENGTH(Titel)  > 3 ) );

	-- FEHLER
	-- INSERT Dozent 
    -- VALUES ('Dr.');
    
    SELECT 	*
    FROM	Dozent;
    
    DROP TABLE Dozent;

-- -------------------------- DROP - CONSTRAINT ----------------------------------
-- Einschränkungen können auch nach der Tabelle Definition gelöscht werden.

	CREATE TABLE Wohnort 
	(
		PLZ	INT
		
		,CONSTRAINT CK_Wohnort_PLZ CHECK (PLZ > 1000 )
	);
	
	-- FEHLER
	-- INSERT 	Wohnort 
    -- VALUES 	(1000);
	
	-- Kein Fehler
	INSERT 	Wohnort 
    VALUES 	(1001);
	
	SELECT 	* 
    FROM 	Wohnort;

	ALTER TABLE	Wohnort 
    DROP CONSTRAINT CK_Wohnort_PLZ;
    
	INSERT 	Wohnort 
    VALUES 	(564);

    SELECT 	* 
    FROM 	Wohnort;
    
	DROP TABLE Wohnort;
    
    
	DROP DATABASE  IF EXISTS FourDB;