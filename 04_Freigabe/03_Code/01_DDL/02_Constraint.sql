-- ------------------------------- DDL -------------------------------------------
-- Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren Beziehungen.	
    
    CREATE DATABASE TwoDB;
	USE TwoDB;

-- ------------------- CONSTRAINTS/EINSCHRAENKUNGEN -------------------------------
/*
	Einschraenkungen sind Regeln, die auf Datenbank/Tabellen-Ebene erzwungen werden. 
	Sie pruefen DML-Anweisungen bevor Sie angewendet werden. 
	Die Regeln, koennen nicht umgegangen werden. Sie können nur ganz entfernt werden.

	Constraint - Typen:
		- Primary Key
		- Foreign Key 
		- Check
		- Not Null 
*/
-- --------------------------- PRIMARY KEY ---------------------------------------
/*	
	Erzwingt die Eindeutigkeit. Die als Primary Key definierte Spalte ist 
    automatisch nicht NULL. Jede Tabelle sollte einen haben. Es kann nur einen in
    jeder Tabelle geben. Er kann auch aus mehreren Spalten bestehen, wenn eine 
    Spalte alleine keine Eindeutigkeit schafft.
*/

-- ---------------------- Version 1  - SPALTEN EBENE
	CREATE TABLE Person
    (
		IDPerson 	INT 			PRIMARY KEY
        ,Vorname	VARCHAR(20)		
	);
  
-- ---------------------- Version 2  - TABELLEN EBENE
    CREATE TABLE Produkt
    (
		IDProdukt 		INT
        
        ,PRIMARY KEY 	(IDProdukt)
	);

-- ---------------------- Version 3  - TABELLEN EBENE & PK_TABELLENNAME_SPALTENNAME
	CREATE TABLE Adresse
    (
		IDAdresse 		INT
        
        ,CONSTRAINT		PK_Adresse_IDAdresse 	PRIMARY KEY 	(IDAdresse)
	);
    
    DROP TABLE Person;
    DROP TABLE Produkt;
    DROP TABLE Adresse;

-- --------------------------- FOREIGN KEY ---------------------------------------
/*	
	Verweist auf den P-Key einer anderen Tabelle.Muss in der Referenztabelle vorhanden 
	sein. Null werte sind erlaubt (Explizit NULL).
*/
    
    CREATE TABLE Dozent
    (
		IDDozent 		INT
        ,Name			VARCHAR(30)
        
        ,CONSTRAINT		PK_Dozent_IDDozent 		PRIMARY KEY 	(IDDozent)
	);
    
    INSERT 	Dozent	(IDDozent	,Name)
    VALUES			(	11		,'Petersen');
    
    INSERT 	Dozent	(IDDozent	,Name)
    VALUES			(	20	,	'Vogt' );
    
    SELECT 	*
    FROM	Dozent;
    
	CREATE TABLE Kurs
    (
		IDKurs 			INT
        ,Veranstaltung	VARCHAR(30)
        ,IDDozent		INT
        
        ,CONSTRAINT		PK_Kurs_IDKurs	 		PRIMARY KEY 	(IDKurs)
        ,CONSTRAINT 	FK_Kurs_IDDozent 		FOREIGN KEY 	(IDDozent) 
													REFERENCES Dozent(IDDozent)
	);
    
	INSERT 	Kurs
    VALUES	(	1	,'Prog'	,11 );
    
	INSERT 	Kurs
    VALUES	(	33	,'DBS'	,20 );
    
    SELECT 	*
    FROM	Kurs;
    
    -- Fehler
	INSERT 	Kurs
    VALUES	(	76	,'Netztwerk'	,12 );
    
    DROP TABLE Kurs;
    DROP TABLE Dozent;

-- ------------------------------ CHECK ------------------------------------------
/*	
	Werte werden auf Gültigkeit geprüft bevor diese eingefügt werden.
	Verweist auf die Inhalte des selben Datensatzes. Kein verweis auf andere 
	Datensätze / Tabellen.
*/

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
    FROM Wohnort;

    DROP TABLE Wohnort;
    
-- ----------------------- NULL (EINSCHRÄNKUNG) ----------------------------------
/*	
	Die NULL (EINSCHRÄNKUNG) Erzwingt beim einfügen oder ändern eines Datensatz,
	dass ein Datensatz eingegeben werden muss. Es dürfen keine Leerwerte eingefügt
	werden.
	
	Jede Spalte wird automatisch auf NULLBAR gesetzt es sei denn man sagt das diese
	NICHT NULL sein darf. Sie sollten immer bei jedem Datentypen Explizit erwähnen
	ob dieser NULL oder NOT NULL ist. 
*/

	CREATE TABLE Firma 
	(
		Nummer			INT				NOT NULL
		,Bezeichnung	VARCHAR(20)			NULL
	);

    INSERT 	Firma	(	Nummer		,	Bezeichnung		)
	VALUES			(	1234		, 	'xxxxxxxxx'		);
    
    -- Fehler
	-- INSERT 	Firma	(	Nummer		,	Bezeichnung		)
	-- VALUES			(	null		, 	'Die Firma XYZ'	);
	
	SELECT 	* 
    FROM Firma;

    DROP TABLE Firma;
    
	DROP DATABASE  IF EXISTS TwoDB;