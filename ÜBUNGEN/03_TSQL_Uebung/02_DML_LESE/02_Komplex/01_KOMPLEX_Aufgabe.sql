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
	Bitte geben Sie den Vornamen und den Nachnamen aus der Tabelle Person als 
	einen Namen aus.

*/
------------------------------- LOESUNG - 1 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	SELECT CONCAT_WS('-', FirstName, LastName) as fullName
	FROM Person.Person;

------------------------------- AUFGABE - 2 -------------------------------------
/*	
	 Bitte geben Sie alle FirstName und LastName deren middlename leer ist, aus.
*/
------------------------------- LOESUNG - 2 --------------------------------------
	
	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	SELECT 
	CONCAT_WS('-', FirstName, LastName) as fullName,
	MiddleName as middle
	FROM Person.Person
	WHERE MiddleName IS NULL; 

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	 Bitte geben alles aus der Personen Tabelle aus.
*/
------------------------------- LOESUNG - 3 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	SELECT * From Person.Person;

------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte ermitteln Sie alle Mitarbeiter und ermitteln Sie alle Kunden, die in 
	der Datenbank gespeichert sind.

	Bitte gehen Sie davon aus, dass alle Personen, die sich nicht in der Emplyoee
	Tabelle befinden Kunden sind.
*/
------------------------------- LOESUNG - 4 --------------------------------------
	
	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	SELECT * FROM Person.Person where PersonType != 'EM'; 

------------------------------- AUFGABE - 5 -------------------------------------
/*	
	Bitte, ermitteln Sie alle weibliche Mitarbeiterin, die Junger sind als 37 und
	nicht verheiratet sind. 
*/
------------------------------- LOESUNG - 5 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

-- Calculate the date that is 37 years ago from today
	DECLARE @MaxBirthDate DATE;
	SET @MaxBirthDate = DATEADD(YEAR, -37, GETDATE());

	-- Query to select all female employees who are younger than 37 and not married
	SELECT 
		p.FirstName, 
		p.LastName AS Name,
		e.BirthDate
	FROM 
		Person.Person p
	JOIN 
		HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
	WHERE 
		e.Gender = 'F'
		AND e.BirthDate > @MaxBirthDate
		AND e.MaritalStatus = 'S';

	SELECT * from HumanResources.Employee;
------------------------------- AUFGABE - 6 -------------------------------------
/*	
	Bitte ermitteln Sie alle Personen, die nach Ihrer Bewerbung eingestellt 
	worden sind und auch die Stelle, die Sie besetzten.
*/
------------------------------- LOESUNG - 6 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!


	SELECT 
    p.FirstName,
    p.LastName AS Name,
    e.HireDate,
    jc.ModifiedDate AS ApplicationDate,
    e.JobTitle,
    cast(edh.StartDate AS DATETime) as StartTime
	-- edh.StartDate
	FROM 
		Person.Person p
	JOIN 
		HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
	JOIN 
		HumanResources.JobCandidate jc ON e.BusinessEntityID = jc.BusinessEntityID
	JOIN 
		HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
	WHERE edh.StartDate < jc.ModifiedDate;

	-- Lösung laut Tutor
	SELECT p.FirstName + ' ' + p.LastName AS 'Name'
	,ISNULL(e.JobTitle, ' - - - - KUNDE - - - - ') AS 'Position'
	FROM Person.Person AS p
	FULL JOIN HumanResources.Employee AS e
	ON p.BusinessEntityID = e.BusinessEntityID
	ORDER BY p.BusinessEntityID;

------------------------------- AUFGABE - 7 -------------------------------------
/*	
	Bitte ermitteln Sie die Orte, in denen Sie die meisten Kunden haben.
*/
------------------------------- LOESUNG - 7 --------------------------------------
	
	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	SELECT 
    a.City,
    sp.Name AS StateProvince,
    COUNT(c.CustomerID) AS CustomerCount
	FROM 
		Person.Address a
	JOIN 
		Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
	JOIN 
		Person.BusinessEntityAddress bea ON a.AddressID = bea.AddressID
	JOIN 
		Sales.Customer c ON bea.BusinessEntityID = c.CustomerID
	GROUP BY 
		a.City, 
		sp.Name
	ORDER BY 
		CustomerCount DESC;
	
------------------------------- AUFGABE - 8 -------------------------------------
/*	
	Bitte berechnen Sie die Summe der Boni der Sales Mitarbeiter, die dass 
	Unternehmen gezahlt hat.
*/
------------------------------- LOESUNG - 8 --------------------------------------

	SELECT 
		SUM(Bonus) AS TotalBonuses
	FROM 
		Sales.SalesPerson;	
	------------------------------- AUFGABE - 9 -------------------------------------
/*	
	Bitte finden Sie alle Mitarbeiter, die Ihr Passwort nach 2013 nicht geändert 
	haben. Und suchen Sie zudem auch Ihre E-Mail-Adresse heraus. 
*/
------------------------------- LOESUNG - 9 --------------------------------------

	SELECT 
    p.FirstName,
    p.LastName,
    ea.EmailAddress,
    pw.ModifiedDate AS LastPasswordChangeDate
	FROM 
		HumanResources.Employee e
	JOIN 
		Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
	JOIN 
		Person.EmailAddress ea ON p.BusinessEntityID = ea.BusinessEntityID
	JOIN 
		Person.Password pw ON p.BusinessEntityID = pw.BusinessEntityID
	WHERE 
		pw.ModifiedDate < '2014-01-01';

------------------------------- AUFGABE - 10 -------------------------------------
/*	
	Bitte ermitteln Sie die ersten Zehn Mitarbeiter des Unternehmens und geben Sie
	Ihre Telefonnummern, Ihre Mailadresse und deren Adresse mit aus.
*/
------------------------------- LOESUNG - 10 --------------------------------------

	SELECT TOP 10 
		p.FirstName,
		p.LastName,
		pp.PhoneNumber,
		ea.EmailAddress,
		a.AddressLine1,
		a.City,
		sp.Name AS StateProvince,
		a.PostalCode
	FROM 
		HumanResources.Employee e
	JOIN 
		Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
	JOIN 
		Person.EmailAddress ea ON p.BusinessEntityID = ea.BusinessEntityID
	JOIN 
		Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
	JOIN 
		Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
	JOIN 
		Person.Address a ON bea.AddressID = a.AddressID
	JOIN 
		Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
	ORDER BY 
		e.BusinessEntityID;
------------------------------- AUFGABE - 11 --------------------------------------
/*	
	Bitte geben Sie alle Daten, aus die Sie über die Person Patrick Cook finden 
	können aus.
*/
------------------------------- LOESUNG - 11 --------------------------------------
	
	SELECT 
    p.BusinessEntityID,
    p.FirstName,
    p.LastName,
    p.Title,
    pp.PhoneNumber,
    ea.EmailAddress,
    a.AddressLine1,
    a.City,
    sp.Name AS StateProvince,
    a.PostalCode,
    e.JobTitle,
    e.HireDate
	FROM 
		Person.Person p
	LEFT JOIN 
		HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
	LEFT JOIN 
		Person.EmailAddress ea ON p.BusinessEntityID = ea.BusinessEntityID
	LEFT JOIN 
		Person.PersonPhone pp ON p.BusinessEntityID = pp.BusinessEntityID
	LEFT JOIN 
		Person.BusinessEntityAddress bea ON p.BusinessEntityID = bea.BusinessEntityID
	LEFT JOIN 
		Person.Address a ON bea.AddressID = a.AddressID
	LEFT JOIN 
		Person.StateProvince sp ON a.StateProvinceID = sp.StateProvinceID
	WHERE 
		p.FirstName = 'Patrick' 
		AND p.LastName = 'Cook';
