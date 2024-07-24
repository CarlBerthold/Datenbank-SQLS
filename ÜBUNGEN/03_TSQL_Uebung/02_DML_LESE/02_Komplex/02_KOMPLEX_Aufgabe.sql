---------------------------------------------------------------------------------
------ RUN CODE (Change Context / Autorization  DATABASE - LINE 3-9) ------------
	PRINT 'Changing Database Context "AdventureWorks"';
	USE AdventureWorks;
	GO
	
	PRINT 'Changing Autorization to "SA"';
	ALTER AUTHORIZATION ON DATABASE:: AdventureWorks TO [sa];
	GO
---------------------------------- DML ------------------------------------------
/*	
	 DML - Lesend auf die Datenbank zugreifen.
*/
------------------------------- AUFGABE - 1 -------------------------------------
/*	
	Bitte zaehlen Sie alle Nachnamen die mehrmals Vorkommen und ein "o" oder ein
	"a" enthalten. 	
*/
------------------------------- LOESUNG - 1 --------------------------------------

	SELECT 
		p.LastName,
		COUNT(*) AS OccurrenceCount
	FROM 
		Person.Person p
	WHERE 
		p.LastName LIKE '%o%' 
		OR p.LastName LIKE '%a%'
	GROUP BY 
		p.LastName
	HAVING 
		COUNT(*) > 1
	ORDER BY 
		OccurrenceCount DESC;	
------------------------------- AUFGABE - 2 -------------------------------------
/*
	Bitte finden Sie alle Namen (Vor-und Nachname) die mehr als 2 aber weniger 
	als 5 mal vorkommen.
*/
------------------------------- LOESUNG - 2 --------------------------------------

	SELECT 
    CONCAT(p.FirstName, ' ', p.LastName) AS FullName,
    COUNT(*) AS OccurrenceCount
	FROM 
		Person.Person p
	GROUP BY 
		CONCAT(p.FirstName, ' ', p.LastName)
	HAVING 
		COUNT(*) > 2 AND COUNT(*) < 5
	ORDER BY 
		OccurrenceCount DESC;
	
------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte ermitteln Sie alle Namen, die mehr als 3 Buchstaben im Nachnamen haben.
*/
------------------------------- LOESUNG - 3 --------------------------------------

	SELECT 
    p.FirstName,
    p.LastName
	FROM 
		Person.Person p
	WHERE 
		LEN(p.LastName) > 3
	ORDER BY 
		p.LastName, p.FirstName;

------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte finden Sie alle Produkte, die nur für eine begrenzte Zeit verkauft werden.
*/
------------------------------- LOESUNG - 4 --------------------------------------

	SELECT 
    p.ProductID,
    p.Name AS ProductName,
    so.SpecialOfferID,
    so.Description AS SpecialOfferDescription,
    so.StartDate,
    so.EndDate
	FROM 
		Production.Product p
	JOIN 
		Sales.SpecialOfferProduct sop ON p.ProductID = sop.ProductID
	JOIN 
		Sales.SpecialOffer so ON sop.SpecialOfferID = so.SpecialOfferID
	WHERE 
		so.EndDate IS NOT NULL
	ORDER BY 
		so.EndDate DESC, p.Name;
------------------------------- AUFGABE - 5 -------------------------------------
/*	
	Bitte geben Sie alle Namen aus, die ein ModifiedDate im Jahr 2009 haben. 
*/
------------------------------- LOESUNG - 5 --------------------------------------

	SELECT 
    p.FirstName,
    p.LastName,
    p.ModifiedDate
	FROM 
		Person.Person p
	WHERE 
		YEAR(p.ModifiedDate) = 2009
	ORDER BY 
		p.ModifiedDate;

------------------------------- AUFGABE - 6 -------------------------------------
/*	
	Bitte geben Sie alle Namen aus, die den Titel "Mr." haben
*/
------------------------------- LOESUNG - 6 --------------------------------------

SELECT 
    p.FirstName,
    p.LastName,
	p.title as anrede
FROM 
    Person.Person p
WHERE 
	p.Title = 'Mr.';
------------------------------- AUFGABE - 7 -------------------------------------
/*	
	Bitte geben Sie alle Namen aus, die Vokale enthalten.
*/
------------------------------- LOESUNG - 7 --------------------------------------
	
	SELECT 
    p.FirstName,
    p.LastName
	FROM 
		Person.Person p
	WHERE 
		p.FirstName LIKE '%a%' OR
		p.FirstName LIKE '%e%' OR
		p.FirstName LIKE '%i%' OR
		p.FirstName LIKE '%o%' OR
		p.FirstName LIKE '%u%' OR
		p.LastName LIKE '%a%' OR
		p.LastName LIKE '%e%' OR
		p.LastName LIKE '%i%' OR
		p.LastName LIKE '%o%' OR
		p.LastName LIKE '%u%'
	ORDER BY 
		p.FirstName, p.LastName;
------------------------------- AUFGABE - 8 -------------------------------------
/*	
	Bitte geben Sie alle Namen aus, die keine Vokale enthalten.
*/
------------------------------- LOESUNG - 8 --------------------------------------
	
	SELECT 
    p.FirstName,
    p.LastName
	FROM 
		Person.Person p
	WHERE 
		p.FirstName NOT LIKE '%a%' AND
		p.FirstName NOT LIKE '%e%' AND
		p.FirstName NOT LIKE '%i%' AND
		p.FirstName NOT LIKE '%o%' AND
		p.FirstName NOT LIKE '%u%' AND
		p.LastName NOT LIKE '%a%' AND
		p.LastName NOT LIKE '%e%' AND
		p.LastName NOT LIKE '%i%' AND
		p.LastName NOT LIKE '%o%' AND
		p.LastName NOT LIKE '%u%'
	ORDER BY 
		p.FirstName, p.LastName;
------------------------------- AUFGABE - 9 -------------------------------------
/*	
	Bitte geben Sie alle Namen aus, deren BusinessEntityID größer als 50 aber 
	kleiner als 100 ist.
*/
------------------------------- LOESUNG - 9 --------------------------------------

	SELECT 
    p.FirstName,
    p.LastName,
    p.BusinessEntityID
	FROM 
		Person.Person p
	WHERE 
		p.BusinessEntityID > 50 
		AND p.BusinessEntityID < 100
	ORDER BY 
		p.BusinessEntityID;