---------------------------------------------------------------------------------
------ RUN CODE (Change Context / Autorization  DATABASE - LINE 3-9) ------------
	--PRINT 'Changing Database Context "AdventureWorks"';
	--USE AdventureWorks;
	--GO
	
	--PRINT 'Changing Autorization to "SA"';
	--ALTER AUTHORIZATION ON DATABASE:: AdventureWorks TO [sa];
	--GO
---------------------------------- DML ------------------------------------------
/*	
	 DML - Lesend auf die Datenbank zugreifen.
*/
--------------------------------- USE -------------------------------------------
/*	
	Datenbank Kontext wechseln
*/
------------------------------- EXAMPLE -----------------------------------------

	USE AdventureWorks;

-------------------------------- [...] ------------------------------------------
/*	
	Eckige Klammer dienen dazu Datenbanken, Tabellen und Spalten trotz 
	Sonderzeichen (Leerzeichen) zugreifbar zu machen.
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE DATABASE [Archiv DB];  

	-- Fehler
	USE Archiv DB; 

	-- kein Fehler
	USE [Archiv DB];
	
	USE AdventureWorks;
	DROP DATABASE [Archiv DB];

---------------------------- SELECT - Klausel -----------------------------------
/*	
	Mit der SELECT-Klausel werden Multimengen / Bag / Feld / Tupel ausgegeben.

	--> Duplikate sind dabei erlaubt.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT		FirstName
	FROM		Person.Person
	ORDER BY	1;

----------------------------- DISTINCT -----------------------------------------
/*	
	Eindeutigkeit bestimmen (Duplikate entfernen).
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT		DISTINCT FirstName
	FROM		Person.Person
	ORDER BY	1;

---------------------------------- * --------------------------------------------
/*	
	Stern sagt aus dass alle Felder bzw. Tupel ausgegebn werden sollen.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT	*
	FROM	Person.Person;

-------------------------------- TUPEL-------------------------------------------
/*	
	Hier werden nur die Felder ausgegeben, die im SELECT auftauchen.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT		FirstName
				,LastName
	FROM		Person.Person;

------------------------------ FROM - Klausel ------------------------------------
/*	
	In der FROM-Klausel werden die Tabellen angegeben, die abgefragt werden sollen.
	
	--> Unabhängig davon, ob diese in Beziehung stehen oder nicht.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT	*
	FROM	Person.PhoneNumberType;
	
	SELECT	*
	FROM	Person.AddressType;
	
	SELECT	*
	FROM	Person.PhoneNumberType
			,Person.AddressType;

-------------------------------- Aliase Tabellen --------------------------------
/*	
	 Mit dem Schlagwort AS definiert man Temporaere Namen fuer Tabellen.
*/
------------------------------- EXAMPLE -----------------------------------------
	
	SELECT	FirstName
	FROM	Person.Person;

	SELECT	Person.Person.FirstName
	FROM	Person.Person;
	
	SELECT	p.FirstName
	FROM	Person.Person AS p;

	SELECT	p.FirstName
	FROM	Person.Person p;

------------------------------- Aliase Spalten ----------------------------------
/*	
	 Mit dem Schlagwort AS definiert man Temporaere Namen fuer Spalten.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT	FirstName	
			,LastName	
	FROM	Person.Person;

	SELECT	FirstName		AS Vorname
			,LastName		AS Nachname
	FROM	Person.Person;

	SELECT	FirstName		Vorname  
			,LastName		Nachname
	FROM	Person.Person;

---------------------------- ORDER BY - Klausel ---------------------------------
/*	
	Ergebnissmengen werden sortiert:
	
	- Aufsteigend	von A-Z bzw. von klein auf gross.
	- Absteigend	von Z-A bzw. von gross auf klein.

	--> Standard ist Aufsteigend.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT		FirstName
	FROM		Person.Person
	ORDER BY	FirstName;

	SELECT		FirstName
	FROM		Person.Person
	ORDER BY	FirstName ASC; 

	SELECT		FirstName
	FROM		Person.Person
	ORDER BY	FirstName DESC;

	SELECT		FirstName
				,LastName
	FROM		Person.Person
	ORDER BY	FirstName ASC, LastName DESC;

	SELECT		FirstName
				,LastName
	FROM		Person.Person
	ORDER BY	1 ASC, 2 DESC;