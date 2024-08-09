---------------------------------------------------------------------------------
------ RUN CODE (Change Context / Autorization  DATABASE - LINE 3-9) ------------
	PRINT 'Changing Database Context "AdventureWorks"';
	USE AdventureWorks;
	GO
	
	PRINT 'Changing Autorization to "SA"';
	ALTER AUTHORIZATION ON DATABASE:: AdventureWorks TO [sa];
	GO

-------------------------- Aggregatsfunktion ----------------------------------
/*	
	Aggregatfunktionen f�hren Berechnungen f�r verschiedene Werte durch und geben
	immer nur einen einzelnen Wert zur�ck.

	Problem:
	- Wenn man versucht eine Multimenge und gleichzeitig eine Aggregatsfunktion 
	  in der selben Select-Klausel auszuf�hren m�chte, schl�gt es fehl, da die 
	  DBMS nicht wei� worauf sich die Aggregation beziehen soll.

	L�sung
	--> Alle spalten m�ssen entweder der Group By-Klausel angeh�ren.
	--> Oder mit einer Aggregatsfunktion versehen sein.

*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT		FirstName
	FROM		Person.Person; 
	
	SELECT		COUNT(FirstName)
	FROM		Person.Person;
	
	-- Fehler
	SELECT		FirstName
				,COUNT(FirstName)
	FROM		Person.Person;
	-- Die Person.Person.FirstName-Spalte ist in der Auswahlliste ung�ltig, 
	-- da sie nicht in einer Aggregatfunktion und nicht in der GROUP BY-Klausel enthalten ist.
	
	--kein Fehler
	SELECT		FirstName
				,COUNT(FirstName)
	FROM		Person.Person
	GROUP BY	FirstName; 
	
--------------------------------- HAVING ----------------------------------------
/*	
	 Beim Gruppieren kann nur ueber die Having�Klausel gefiltert werden.
*/
------------------------------- EXAMPLE -----------------------------------------

	-- Fehler
	SELECT		FirstName
				,COUNT(*)
	FROM		Person.Person
	WHERE		COUNT(*) <= 10
	GROUP BY	FirstName
	ORDER BY	FirstName;
	
	-- kein Fehler
	SELECT		FirstName 
				,COUNT(*)
	FROM		Person.Person
	GROUP BY	FirstName
	HAVING		COUNT(*) <= 10
	ORDER BY	FirstName;

------------------------------------ ... ----------------------------------------
/*	
		Bei Aggregatsfunktionen werden �NULL� - Werte Ignoriert.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT		COUNT(MiddleName)
	FROM		Person.Person;

	SELECT		MiddleName
	FROM		Person.Person
	WHERE		MiddleName IS NOT NULL;

	SELECT		COUNT( ISNULL (MiddleName,' ') )
	FROM		Person.Person;

	SELECT		MiddleName
	FROM		Person.Person;
	
-------------------------- Aggregatsfunktion -------------------------------------
/*	
	 Hier sind einige der gaengigen Aggegatsfunkeionen:
	- AVG
	- MIN 
	- MAX
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT	AVG(Bonus)
	FROM	Sales.SalesPerson;

	SELECT	MAX(Bonus)
	FROM	Sales.SalesPerson;
	
	SELECT	MIN(Bonus)
	FROM	Sales.SalesPerson;