---------------------------------------------------------------------------------
------ RUN CODE (Change Context / Autorization  DATABASE - LINE 3-9) ------------
	--PRINT 'Changing Database Context "AdventureWorks"';
	--USE AdventureWorks;
	--GO
	
	--PRINT 'Changing Autorization to "SA"';
	--ALTER AUTHORIZATION ON DATABASE:: AdventureWorks TO [sa];
	--GO
------------------------------- WHERE -------------------------------------------
/*	
	 In der WHERE-Klausal wenden wir auf unsere Ergebnismenge filter an.
*/
------------------------------- EXAMPLE -----------------------------------------

	SELECT	FirstName	
	FROM	Person.Person
	WHERE	FirstName		= 'Aaron';

--------------------------- Vergleichoperatoren ----------------------------------
/*	
	 Mit einem Vregleichsoperator führen wir vergleiche aus:

	 - GLEICHEIT
	 - UNGLEICHEIT
	 - GROESSER / GLEICH
	 - KLEINER / GLEICH
*/
------------------------------- GLEICHEIT -----------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID	=	90;

------------------------------- UNGLEICHEIT ---------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID		!=	90
	ORDER	BY 1;
	
	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID		<>	90
	ORDER	BY 1;

------------------------------- GROESSER -----------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID		>	90
	ORDER	BY 1;

---------------------------- GROESSER - GLEICH -----------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID		>=	90
	ORDER	BY 1;

------------------------------- KLEINER ------------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID		<	90
	ORDER	BY 1;

---------------------------- KLEINER - GLEICH ------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID		<=	90
	ORDER	BY 1;

-------------------------- LOGISCHE OPERATOREN ----------------------------------
/*	
	 Die Logischen Operatoren werden zur Logsicne Verknuepfung benoetigt:

	 - NOT
	 - AND
	 - OR
*/
------------------------------------ NOT ----------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	NOT BusinessEntityID =	90
	ORDER	BY 1;

------------------------------------ AND ----------------------------------------

	SELECT	BusinessEntityID
			,FirstName
			, MiddleName
			,LastName
	FROM	Person.Person
	WHERE	FirstName	= 'Danielle'
	AND		MiddleName	= 'C'
	AND		LastName	= 'Tiedt';
	
------------------------------------ OR ----------------------------------------

	SELECT	BusinessEntityID	
	FROM	Person.Person
	WHERE	BusinessEntityID =	90
	OR		BusinessEntityID =	123;

----------------------------------- NULL ----------------------------------------
/*	
	Null ist bei der Datenbanken mit nichts zu vergleichen auch nicht mit sich
	selbst.

	--> Pruefung auf NULL:
			- IS NULL
			- IS NOT NULL
*/
--------------------------------- IS NULL ----------------------------------------
	
	SELECT	MiddleName	
	FROM	Person.Person
	WHERE	MiddleName		= NULL;

	SELECT	MiddleName	
	FROM	Person.Person
	WHERE	MiddleName		IS NULL;

------------------------------ IS NOT NULL ----------------------------------------
	
	SELECT	MiddleName	
	FROM	Person.Person
	WHERE	MiddleName		!= NULL;

	SELECT	MiddleName	
	FROM	Person.Person
	WHERE	MiddleName		IS NOT NULL;

---------------------------------- LIKE ------------------------------------------
/*	
	Mit Like suchen wir nach bestimmten Mustern innheralb eines Feldes.

	--> Es wird nach Zeicheketten gesucht:
		-	'%' beliebig viele Zeichen (auch keins).
		-	'_' steht für ein Zeichen.
		-	'[ab]' beliebig Zeichen in einer Menge.
		-	'[...-...]' beliebig Zeichen dass sich in einem Berreich befindet.
		-	'[^...]' beliebig Zeichen dass sich nicht in einem Berreich befindet.
*/
------------------------------------- % -----------------------------------------
	
	SELECT		FirstName	
	FROM		Person.Person
	WHERE		FirstName LIKE '%en'
	ORDER BY	FirstName;

------------------------------------- _ ------------------------------------------

	SELECT		FirstName
	FROM		Person.Person
	WHERE		FirstName LIKE '_ean'
	ORDER BY	1;

------------------------------------ [ab] ------------------------------------------

	SELECT		FirstName
	FROM		Person.Person
	WHERE		FirstName LIKE '[sj]ean'
	ORDER BY	1;

---------------------------------- [...-...] -------------------------------------

	SELECT		FirstName
	FROM		Person.Person
	WHERE		FirstName LIKE '[a-ct-z]%'
	ORDER BY	1;

---------------------------------- [^...] -----------------------------------------

	SELECT		FirstName
	FROM		Person.Person
	WHERE		FirstName LIKE '[^a-ct-z]%'
	ORDER BY	1;