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
	Mit DML-Befehle erhält man einen Schreibzugriff auf die Datenbank / Datenbasis.
*/
------------------------------- AUFGABE - 1 -------------------------------------
/*	
	Bitte fuegen Sie fuer die Person mit der BusinessEntityID "1" in der Tabelle
	PersonPhone die "0221-6732894" Rufnummer fuer die Arbeit und die 
	"02234-7832798" Rufnummer fuer zu Hause ein.
*/
------------------------------- LOESUNG - 1 --------------------------------------

	BEGIN TRAN
	INSERT INTO Person.PersonPhone (
	BusinessEntityID, 
	PhoneNumber, 
	PhoneNumberTypeID, 
	ModifiedDate
	)
	VALUES (
		1,
		'0221-6732894', (
			SELECT PhoneNumberTypeID 
			FROM Person.PhoneNumberType 
			WHERE Name = 'Work'
		),
		GETDATE()
	);

	-- Insert home phone number
	INSERT INTO Person.PersonPhone (
	BusinessEntityID, 
	PhoneNumber, 
	PhoneNumberTypeID, 
	ModifiedDate
	)
	VALUES (
	1,
	'02234-7832798', (
		SELECT PhoneNumberTypeID 
		FROM Person.PhoneNumberType 
		WHERE Name = 'Home'), GETDATE()
	);

	-- check if it works
	SELECT 
    BusinessEntityID,
    PhoneNumber, (
		SELECT Name 
		FROM Person.PhoneNumberType 
		WHERE PhoneNumberTypeID = pp.PhoneNumberTypeID
	) AS PhoneNumberType,
    ModifiedDate
	FROM 
		Person.PersonPhone pp
	WHERE 
		BusinessEntityID = 1;

	--ROLLBACK
	COMMIT
	
------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte Loeschen Sie die zuvor eingefügten Telfonnummern aus der Aufgabe 1. 
*/
------------------------------- LOESUNG - 2 --------------------------------------

	BEGIN TRAN

	DELETE FROM 
	Person.PersonPhone
	WHERE 
		BusinessEntityID = 1
		AND PhoneNumber = '0221-6732894';

	-- Delete the home phone number
	DELETE FROM 
	Person.PersonPhone
	WHERE 
		BusinessEntityID = 1
		AND PhoneNumber = '02234-7832798';

	ROLLBACK
	-- COMMIT

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte aktualisieren Sie alle Middelname inder Tabelle Person, die "null" sind,
	auf einen Leerstring.
*/
------------------------------- LOESUNG - 3 --------------------------------------
	
	BEGIN TRAN

	UPDATE
	Person.Person
	SET 
		MiddleName = ''
	WHERE 
		MiddleName IS NULL;

	-- check if it works
	SELECT 
    BusinessEntityID,
    FirstName,
    MiddleName,
    LastName
	FROM 
		Person.Person
	WHERE 
		MiddleName IS NOT NULL;

	ROLLBACK
	-- COMMIT

------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte fuegen Sie in der Tabelle BusinessEntity einen neuen Datensatz ein.
*/
------------------------------- LOESUNG - 4 --------------------------------------

	BEGIN TRAN

	INSERT INTO Person.BusinessEntity (
	rowguid,
	ModifiedDate
	)
	VALUES (
		NEWID(),
		GETDATE()
	);

	-- check if it works
	SELECT TOP 10
    BusinessEntityID,
    rowguid,
    ModifiedDate
	FROM 
		Person.BusinessEntity
	ORDER BY 
		BusinessEntityID DESC;

	ROLLBACK
	-- COMMIT

------------------------------- AUFGABE - 5 -------------------------------------
/*	
	Bitte Loeschen Sie den zuvor engfügten Datensatz aus der Tabelle BusinessEntity.
*/
------------------------------- LOESUNG - 5 --------------------------------------

	BEGIN TRAN

	DELETE FROM Person.BusinessEntity
	WHERE BusinessEntityID = 20778


	-- check if it works
	SELECT BusinessEntityID
	FROM Person.BusinessEntity
	WHERE BusinessEntityID = 20778; 

	ROLLBACK
	-- COMMIT