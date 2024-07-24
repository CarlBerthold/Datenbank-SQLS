USE Sakila;
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