-- ------------------------------- DDL -------------------------------------------
-- Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren Beziehungen.

-- ------------------------ CREATE DATABASE --------------------------------------
-- Erstellen einer neuen Datenbank und die zum Speichern benötigten Dateien.

	CREATE DATABASE OneDB;
   
-- ------------------------------- USE -------------------------------------------
-- Datenbank Kontext wechseln.

	USE OneDB;
    
-- ------------------------------- DROP ------------------------------------------
-- Entfernt eine oder mehrere Datenbanken.

	CREATE 	DATABASE 	TestDB;
	DROP 	DATABASE 	TestDB;

-- ---------------------------- CREATE TABLE -------------------------------------
-- Erstellt eine neue Tabelle mit der definierten Struktur. 

	CREATE TABLE Produkt 
	(
		Bezeichnung VARCHAR(20)
	);

-- ------------------------------ DROP TABLE -------------------------------------
-- Entfernt eine Tabelle mit ihrer Struktur. 

	DROP TABLE Produkt;

-- ----------------------------- TRUNCATE ----------------------------------------
/*	
	Entfernt alle Zeilen oder angegebenen Partitionen einer Tabelle, ohne die 
	einzelnen Löschungen zu protokollieren. TRUNCATE TABLE entspricht DELETE ohne 
	WHERE-Klausel. TRUNCATE TABLE ist jedoch schneller und verwendet weniger 
	Systemressourcen und Ressourcen für die Transaktionsprotokollierung.
	Wenn die Tabelle eine AUTO_INCREMENT enthält, wird der Zähler für diese 
	Spalte auf den Ausgangswert zurückgesetzt, der für die Spalte definiert ist. 
	Wenn kein Ausgangswert definiert wurde, wird der Standardwert 1 verwendet. 
	(Falls Sie den Wert des Identitätszählers erhalten möchten, verwenden Sie 
	stattdessen DELETE.)
	
	--> Leert eine Tabelle und setzt das AUTO_INCREMENT zurück.
*/

	CREATE TABLE Test
	(	 IDTest		INT			AUTO_INCREMENT  PRIMARY KEY
		,Name		VARCHAR(30)					NOT NULL
	);
	
	INSERT	Test 	(Name)		
    VALUES 			('Petra');
    
	INSERT	Test 	(Name)		
    VALUES 			('Ulf');
    
	INSERT	Test 	(Name)		
    VALUES 			('Ina');
    
	SELECT * FROM Test;

	TRUNCATE TABLE Test;
	
	SELECT * FROM Test;
	
	INSERT	Test 	(Name)		
    VALUES 			('Hans');
    
	SELECT * FROM Test;

	DELETE FROM Test;

-- ----------------------------- AUTO-INCREMENT ----------------------------------------
-- Jede Spalte kann beim einfügen Automatisch hochgezählt werden wenn diese eine 
-- AUTO-INCREMENT definiert hat.
	
	CREATE TABLE Dozent
    (
		IDDozent 		INT				AUTO_INCREMENT
        ,Name			VARCHAR(30)
        
        ,CONSTRAINT		PK_Dozent_IDDozent 		PRIMARY KEY 	(IDDozent)
	);
    
    INSERT 	Dozent	( 	Name 		)
    VALUES			(	'Petersen' 	);
    
	INSERT 	Dozent	( 	Name 		)
    VALUES			(	'Vogt' 		);
    
    SELECT 	*
    FROM	Dozent;
    

    DROP TABLE Dozent;
    
    
	DROP DATABASE  IF EXISTS OneDB;