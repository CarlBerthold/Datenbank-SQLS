-- -------------------------------- DML ------------------------------------------
--  DML - Lesend auf die Datenbank zugreifen.

-- ------------------------------- USE -------------------------------------------
-- Datenbank Kontext wechseln

	USE Sakila;

-- ------------------------------ `...` ------------------------------------------
-- Hochkommata dienen dazu Datenbanken, Tabellen und Spalten trotz 
-- Sonderzeichen (Leerzeichen) zugreifbar zu machen.

	CREATE DATABASE `Archiv DB`;

	-- Fehler
	-- USE Archiv DB; 

	-- kein Fehler
	USE `Archiv DB`;
	
	USE Sakila;
	DROP DATABASE `Archiv DB`;

-- -------------------------- SELECT - Klausel -----------------------------------
-- Mit der SELECT-Klausel werden Multimengen / Bag / Feld / Tupel ausgegeben.
-- --> Duplikate sind dabei erlaubt.

	SELECT		First_Name
	FROM		ACTOR
	ORDER BY	1;

-- --------------------------- DISTINCT -----------------------------------------
-- Eindeutigkeit bestimmen (Duplikate entfernen).

	SELECT		DISTINCT First_Name
	FROM		ACTOR
	ORDER BY	1;

-- -------------------------------- * --------------------------------------------
-- Stern sagt aus dass alle Felder bzw. Tupel ausgegebn werden sollen.

	SELECT		*
	FROM		ACTOR;

-- ------------------------------ TUPEL-------------------------------------------
-- Hier werden nur die Felder ausgegeben, die im SELECT auftauchen.

	SELECT		First_Name
				,Last_Name
	FROM		ACTOR
	ORDER BY	1;

-- ---------------------------- FROM - Klausel ------------------------------------
-- In der FROM-Klausel werden die Tabellen angegeben, die abgefragt werden sollen.
-- --> Unabhängig davon, ob diese in Beziehung stehen oder nicht.

	SELECT	*
	FROM	Actor;
    
    SELECT	*
	FROM	City;

	SELECT	*
	FROM	Actor
			,City;
           
-- ------------------------------ Aliase Tabellen --------------------------------
-- Mit dem Schlagwort AS definiert man Temporaere Namen fuer Tabellen.
	
	SELECT		First_Name
	FROM		ACTOR;

	SELECT		Sakila.Actor.First_Name
	FROM		Sakila.Actor;
	
	SELECT		a.First_Name
	FROM		Actor				AS 	a;
			
	SELECT		a.First_Name
	FROM		Actor				a;

-- ----------------------------- Aliase Spalten ----------------------------------
-- Mit dem Schlagwort AS definiert man Temporaere Namen fuer Spalten.

	SELECT		First_Name
				,Last_Name
	FROM		ACTOR;

	SELECT		First_Name		AS Vorname
				,Last_Name		AS Nachname
	FROM		ACTOR;

	SELECT		First_Name		Vorname
				,Last_Name		Nachname
	FROM		ACTOR;
    
	SELECT		First_Name		AS  'Vorname'
				,Last_Name		AS	'Nachname'
	FROM		ACTOR;

-- -------------------------- ORDER BY - Klausel ---------------------------------
/*	
	Ergebnissmengen werden sortiert:
	
	- Aufsteigend	von A-Z bzw. von klein auf gross.
	- Absteigend	von Z-A bzw. von gross auf klein.

	--> Standard ist Aufsteigend.
*/

	SELECT		First_Name
	FROM		ACTOR;

	SELECT		First_Name
	FROM		ACTOR
	ORDER BY	First_Name ASC; 

	SELECT		First_Name
	FROM		ACTOR
	ORDER BY	First_Name DESC;

	SELECT		First_Name
				,Last_Name
	FROM		ACTOR
	ORDER BY	First_Name ASC, Last_Name DESC;

	SELECT		First_Name
	FROM		ACTOR
	ORDER BY	1 ;

	SELECT		First_Name
				,Last_Name
	FROM		ACTOR
	ORDER BY	1 ASC, 2 DESC;