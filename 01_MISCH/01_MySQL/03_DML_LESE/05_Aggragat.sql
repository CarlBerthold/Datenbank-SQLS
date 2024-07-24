-- -------------------------------- DML ------------------------------------------
--  DML - Lesend auf die Datenbank zugreifen.

	USE Sakila;
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
	-- SELECT		First_Name
	-- 				,COUNT(First_Name)
	-- FROM 		ACTOR;
    
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