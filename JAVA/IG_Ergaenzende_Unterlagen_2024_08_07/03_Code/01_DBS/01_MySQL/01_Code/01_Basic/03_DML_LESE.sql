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
    
    -- ----------------------------- WHERE -------------------------------------------
/*	
	 In der WHERE-Klausal wenden wir auf unsere Ergebnismenge filter an.

	 Mit einem Vregleichsoperator führen wir vergleiche aus:

	 - GLEICHEIT
	 - UNGLEICHEIT
	 - GROESSER / GLEICH
	 - KLEINER / GLEICH
*/
-- ----------------------------- GLEICHEIT -----------------------------------------

	SELECT		*
	FROM		ACTOR
	WHERE		Actor_Id		= 7;

-- ----------------------------- UNGLEICHEIT ---------------------------------------

	SELECT		*
	FROM		ACTOR
	WHERE		Actor_Id		!= 7
	ORDER	BY 	1;
	
	SELECT		*
	FROM		ACTOR
	WHERE		Actor_Id		<> 7
	ORDER	BY 	1;

-- ----------------------------- GROESSER -----------------------------------------

	SELECT		*
	FROM		ACTOR
	WHERE		Actor_Id		> 7
	ORDER	BY 	1;
    
	
-- -------------------------- GROESSER - GLEICH -----------------------------------

	SELECT	*	
	FROM	ACTOR
	WHERE	Actor_Id		>=	90
	ORDER	BY 1;

-- ----------------------------- KLEINER ------------------------------------------

	SELECT		*
	FROM		ACTOR
	WHERE		Actor_Id		< 7
	ORDER	BY 	1;

-- -------------------------- KLEINER - GLEICH ------------------------------------

	SELECT		*
	FROM		ACTOR
	WHERE		Actor_Id		<= 7
	ORDER	BY 	1;

-- ------------------------ LOGISCHE OPERATOREN ----------------------------------
/*	
	 Die Logischen Operatoren werden zur Logsicne Verknuepfung benoetigt:

	 - NOT
	 - AND
	 - OR
*/
-- ---------------------------------- NOT ----------------------------------------

	SELECT		*
	FROM		ACTOR
	WHERE		NOT Actor_Id		= 7
	ORDER	BY 	1;

-- ---------------------------------- AND ----------------------------------------

	SELECT		*
	FROM		Customer
	WHERE		store_id		= 2
    and 		active 			= 0
    and 		create_date		>= '2006-02-14'
	ORDER	BY 	3;
	
-- ---------------------------------- OR ----------------------------------------

	SELECT		*
	FROM		Customer
	WHERE		store_id		= 2
    or	 		create_date		>= '2006-02-14'
    or			active			= 0
    or			active			= 1
	ORDER	BY 	3;

-- --------------------------------- NULL ----------------------------------------
/*	
	Null ist bei der Datenbanken mit nichts zu vergleichen auch nicht mit sich
	selbst.

	--> Pruefung auf NULL:
			- IS NULL
			- IS NOT NULL
*/
-- ------------------------------- IS NULL ----------------------------------------
	
	SELECT	*	
	FROM	Address
	WHERE	address2		= NULL;

	SELECT	*	
	FROM	Address
	WHERE	address2		IS NULL;

-- ---------------------------- IS NOT NULL ----------------------------------------
	
	SELECT	*	
	FROM	Address
	WHERE	address2		!= NULL;

	SELECT	*	
	FROM	Address
	WHERE	address2		IS NOT NULL;

-- -------------------------------- LIKE ------------------------------------------
/*	
	Mit Like suchen wir nach bestimmten Mustern innheralb eines Feldes.

	--> Es wird nach Zeicheketten gesucht:
		-	'%' beliebig viele Zeichen (auch keins).
		-	'_' steht für ein Zeichen.
*/
-- ----------------------------------- % -----------------------------------------
	
	SELECT		First_Name	
	FROM		Actor
	WHERE		First_Name LIKE '%en'
	ORDER BY	First_Name;

-- ----------------------------------- _ ------------------------------------------

	SELECT		First_Name	
	FROM		Actor
	WHERE		First_Name LIKE '_an'
	ORDER BY	1;
    
    
    -- ----------------------------- Ausdruecke --------------------------------------
/*	
	Ausdruecke koennen Berechnungen durchfuehren, mit Zeichenketten arbeiten und 
	Funktionen verwenden:

		- Ausdruck mit einem konstanten Wert.
		- Bildung von Ausdrücken durch Verkettung.
		- String Funktionen
		- Datums Funktionen
		- Mathematische Funktionen
*/
-- ------------------------- konstanten Wert ----------------------------------------
	
	SELECT 333;
	
	SELECT @@VERSION;
	
	SELECT NOW()								AS 'Aktuelles Datum/ Uhrzeit',
		   DATEDIFF(	NOW()	,'2023-11-27')	AS 'Zeitspanne';

-- ----------------------------- Verkettung --------------------------------------

	SELECT	CONCAT(a.First_Name, ' ', a.Last_Name)	AS 'Verkettung mit einer String-Funktion'
	FROM	Actor									AS a;

-- --------------------------- String Funktionen ---------------------------------

	SELECT	First_Name							AS 'Vorname'
			,LENGTH(First_Name)					AS 'Laenge des Strings'
			,REVERSE(First_Name)				AS 'Name Rueckwaerts'
			,UPPER(First_Name)					AS 'Name in grossbuchstaben'
			,LOWER(First_Name)					AS 'Name in kleinbuchstaben'
			,LEFT(First_Name, 2)				AS 'ersten beiden Buchstaben'
			,RIGHT(First_Name, 2)				AS 'letzen beiden Buchstaben'
			,SUBSTRING(First_Name, 2, 2)		AS 'zwei Buchstaben aus dem Namen'
	FROM	Actor;

----------------------------- Datums Funktionen --------------------------------- 

	SELECT CURDATE();
	
	SELECT DATE_ADD("2017-06-15", INTERVAL 20 DAY);
	
	SELECT DATEDIFF('2023-01-01', NOW());
	

-------------------------- Mathematische Funktionen -----------------------------
	
	SELECT POWER(5,3);
	
	SELECT SQRT(25);
	
	SELECT RAND() * 100;
	
	SELECT PI();
	
	SELECT ROUND(3.495, 2);
	
	SELECT ROUND(13.495, -2);
    
    
    -- ------------------------ Aggregatsfunktion ----------------------------------
/*	
	Aggregatfunktionen führen Berechnungen für verschiedene Werte durch und geben
	immer nur einen einzelnen Wert zurück.

	Problem:
	- Wenn man versucht eine Multimenge und gleichzeitig eine Aggregatsfunktion 
	  in der selben Select-Klausel auszuführen möchte, schlägt es fehl, da die 
	  DBMS nicht weiß worauf sich die Aggregation beziehen soll.

	Lösung
	--> Alle spalten müssen entweder der Group By-Klausel angehören.
	--> Oder mit einer Aggregatsfunktion versehen sein.
*/

-- ---------------------------- MySQL ------------------------------------------
-- ONLY_FULL_GROUP_BY Modus muss aktiv sein.

SET SESSION sql_mode = sys.list_add(@@session.sql_mode, 'ONLY_FULL_GROUP_BY');

-- -------------------------- GROUP BY -----------------------------------------
	SELECT		First_Name
	FROM		ACTOR;

	SELECT		COUNT(First_Name)
	FROM 		ACTOR;

-- -- FEHLER
	SELECT		First_Name
				,COUNT(First_Name)
	FROM 		ACTOR;
    
    SELECT		First_Name
				,COUNT(First_Name)
	FROM 		ACTOR
	GROUP BY	First_Name;

	SELECT		First_Name
				,COUNT(First_Name)
                ,AVG(actor_ID)
                ,MAX(actor_ID)
	FROM 		ACTOR
	GROUP BY	First_Name;

-- ------------------------------- HAVING ----------------------------------------
-- Beim Gruppieren kann nur ueber die Having-Klausel gefiltert werden.

-- -- FEHLER
-- 	SELECT		First_Name
-- 				,COUNT(First_Name)
-- 	FROM 		ACTOR
--  WHERE 		COUNT(First_Name) = 4
-- 	GROUP BY	First_Name;

	SELECT		First_Name
				,COUNT(First_Name)
	FROM 		ACTOR
	GROUP BY	First_Name
    HAVING 		COUNT(First_Name) > 2;

-- ----------------------------- NULL-Werte ---------------------------------------
-- Bei Aggregatsfunktionen werden NULL - Werte ignoriert.

-- JEDE ZEILE WIRD GEZAEHLT ! --> COUNT (*)	
	SELECT		COUNT(*)
	FROM		Address;

	SELECT		Address2
	FROM		Address;
    
	SELECT		COUNT(Address2)
	FROM		Address;
    
	SELECT		COUNT(IFNULL(Address2,' '))
	FROM		Address;

-- ------------------------ Aggregatsfunktion -------------------------------------
/*	
	 Hier sind einige der gaengigen Aggegatsfunkeionen:
	- COUNT
    - SUM
    - AVG
	- MIN 
	- MAX
*/

	SELECT	SUM(amount)
	FROM	Payment;

	SELECT	AVG(amount)
	FROM	Payment;

	SELECT	MAX(amount)
	FROM	Payment;
	
	SELECT	MIN(amount)
	FROM	Payment;
    
    