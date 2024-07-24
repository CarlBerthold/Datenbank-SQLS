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
	Bitte, ermitteln Sie alle Männlichen Mitarbeiterin, die älter sind als 45 und
	verheiratet sind und Ihre offenen Krankheitsstunden.
*/
------------------------------- LOESUNG - 1 --------------------------------------

	SELECT 
    p.FirstName,
    p.LastName,
    e.BirthDate,
    DATEDIFF(YEAR, e.BirthDate, GETDATE()) AS Age,
    e.SickLeaveHours
	FROM 
		HumanResources.Employee e
	JOIN 
		Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
	WHERE 
		e.Gender = 'M'  -- Male employees
		AND DATEDIFF(YEAR, e.BirthDate, GETDATE()) > 45  -- Older than 45
		AND e.MaritalStatus = 'M'  -- Married
	ORDER BY 
		p.LastName, p.FirstName;
	
------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte ermitteln Sie die Mitarbeiter, die wenige Krankheitsstunden haben.
*/
------------------------------- LOESUNG - 2 --------------------------------------


	SELECT AVG(e.SickLeaveHours) AS AverageSickLeaveHours
	FROM HumanResources.Employee e;

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte ermitteln Sie alle Mitarbeiter, deren Login sich in einem Zeichen 
	unterscheidet.
*/
------------------------------- LOESUNG - 3 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
