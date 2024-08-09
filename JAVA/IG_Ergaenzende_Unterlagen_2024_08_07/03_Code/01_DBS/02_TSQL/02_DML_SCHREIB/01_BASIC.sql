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
	Mit DML-Befehle erhält man einen Schreibzugriff auf die Datenbank / Datenbasis.
*/
-------------------------------- VORGEHEN ----------------------------------------
/*	
	Beim manipulieren von Daten sollten Sie dabei achten, dass Sie die DatenBank,
	immer in einen Integeren Zustand verlassen. 

	SCHRITTE:
		1. SUCHEN					--> PK
		2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
		3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT
		4. PRUEFEN
*/
-------------------------------- INSERT -----------------------------------------
/*
	Mit dem befehl Insert fügen wir Datensätze in einer tabellen ein. 
*/
------------------------------- EXAMPLE -----------------------------------------

----------------- 	1. SUCHEN				--> PK  
	SELECT		* 
	FROM		Person.PersonPhone		AS	p
	WHERE		p.BusinessEntityID		=	3242;

----------------- 	2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
	BEGIN TRAN

	INSERT Person.PersonPhone
			( BusinessEntityID		,PhoneNumber	,PhoneNumberTypeID	,ModifiedDate)
	VALUES
			(3242					,4916367788		,3					,GETDATE()	);

	ROLLBACK

----------------- 	3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN

	INSERT Person.PersonPhone
			( BusinessEntityID		,PhoneNumber	,PhoneNumberTypeID	,ModifiedDate)
	VALUES
			(3242					,4916367788		,3					,GETDATE()	);

	COMMIT

----------------- 	4. PRUEFEN
	SELECT		* 
	FROM		Person.PersonPhone		AS	p
	WHERE		p.BusinessEntityID		=	3242;

-------------------------------- INSERT SELECT -----------------------------------------
/*
	...
*/
------------------------------- EXAMPLE -----------------------------------------

----------------- 	1. SUCHEN				--> PK  

	--> Datensätze, die eingefügt werden sollen:
	SELECT		*
	FROM		Person.PersonPhone AS p
	WHERE		p.BusinessEntityID = 3242
	AND			p.PhoneNumberTypeID = 3;

	----> Für welche BusinessEntityID sollen die Datensätze eingefügt werden:
	SELECT		*
	FROM		Person.PersonPhone AS p
	WHERE		p.BusinessEntityID = 3;

----------------- 	2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
	BEGIN TRAN

	INSERT INTO		Person.PersonPhone
	SELECT			3					---> BusinessEntityID in der Sie eingefügt werden soll.
					,p.PhoneNumber
					,p.PhoneNumberTypeID
					,GetDate()
	FROM			Person.PersonPhone		AS p
	WHERE			p.BusinessEntityID = 3242
	AND				p.PhoneNumberTypeID = 3;
	
	ROLLBACK

----------------- 	3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN

	INSERT INTO		Person.PersonPhone
	SELECT			3					---> BusinessEntityID in der Sie eingefügt werden soll.
					,p.PhoneNumber
					,p.PhoneNumberTypeID
					,GetDate()
	FROM			Person.PersonPhone		AS p
	WHERE			p.BusinessEntityID = 3242
	AND				p.PhoneNumberTypeID = 3;

	COMMIT

----------------- 	4. PRUEFEN
	
	SELECT		*
				,'BusinessEntityID = 3242' AS 'Quelle'
	FROM		Person.PersonPhone AS p
	WHERE		p.BusinessEntityID = 3242
	AND			p.PhoneNumberTypeID = 3;
	
	SELECT		*
				,'BusinessEntityID = 3' AS 'Ziel'
	FROM		Person.PersonPhone AS p
	WHERE		p.BusinessEntityID = 3
	AND			p.PhoneNumberTypeID = 3 
	ORDER BY	1;

-------------------------------- UPDATE -----------------------------------------
/*
	Mit Update aktualsieren wir Zeilen.
*/
------------------------------- EXAMPLE -----------------------------------------
----------------- 1.SUCHEN				--> PK  
	SELECT	*
	FROM	Person.Person AS p
	WHERE	p.BusinessEntityID = 83;

----------------- 2.AKTUALISIEREN MIT	--> BEGIN TRAN & ROLLBACK
	BEGIN TRAN

	UPDATE	Person.Person
	SET		FirstName = 'Morpheus'
	WHERE	BusinessEntityID = 83;

	ROLLBACK

----------------- 3.AKTUALISIEREN MIT	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN

	UPDATE	Person.Person
	SET		FirstName			=	'Morpheus'
	WHERE	BusinessEntityID	=	83;

	COMMIT

----------------- 4 - PRUEFEN

	SELECT	*
	FROM	Person.Person			AS	p
	WHERE	p.BusinessEntityID		=	83;

----------------------------- UPDATE NULL ---------------------------------------
/*
	'NULL' ungleich NULL  
*/
------------------------------- EXAMPLE -----------------------------------------
----------------- 	1. SUCHEN				--> PK  
	SELECT	*
	FROM	Person.Person AS p
	WHERE	p.BusinessEntityID = 83;

----------------- 	2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
	BEGIN TRAN

	UPDATE	Person.Person
	SET		FirstName = NULL
	WHERE	BusinessEntityID = 83;

	--  Fehler
	/*
		Der Wert NULL kann in die FirstName-Spalte, AdventureWorks.Person.Person-Tabelle 
		nicht eingefügt werden. Die Spalte lässt NULL-Werte nicht zu. Fehler bei UPDATE.
	*/
	
	ROLLBACK
	
	BEGIN TRAN
	
	-- Kein Fehler
	UPDATE	Person.Person
	SET		FirstName			=	'NULL'
	WHERE	BusinessEntityID	=	83;

	ROLLBACK

----------------- 	3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN

	UPDATE	Person.Person
	SET		FirstName			=	'NULL'
	WHERE	BusinessEntityID	=	83;

	COMMIT

----------------- 	4. PRUEFEN
	SELECT	*
	FROM	Person.Person		AS	p
	WHERE	p.BusinessEntityID	=	83;

-------------------------- UPDATE NULL ('') -------------------------------------
/*
	LEER-STRING ('') BESSER ALS NULL-STRING ('NULL')  
*/
------------------------------- EXAMPLE -----------------------------------------
----------------- 	1. SUCHEN				--> PK  
	SELECT	*
	FROM	Person.Person		AS	p
	WHERE	p.BusinessEntityID	=	83;

----------------- 	2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
	BEGIN TRAN

	UPDATE	Person.Person
	SET		FirstName = ''
	WHERE	BusinessEntityID = 83;

	ROLLBACK

----------------- 	3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN

	UPDATE	Person.Person
	SET		FirstName = ''
	WHERE	BusinessEntityID = 83;

	COMMIT

----------------- 	4. PRUEFEN
	SELECT	*
	FROM	Person.Person			AS	p
	WHERE	p.BusinessEntityID		=	83;

-------------------------------- DELETE -----------------------------------------
/*
	Entfernt Zeile aus einer Tabelle.
*/
------------------------------- EXAMPLE -----------------------------------------
----------------- 	1. SUCHEN				--> PK  
	
	SELECT		*
	FROM		Sales.SalesPersonQuotaHistory	AS	q
	WHERE		q.BusinessEntityID				=	274
	ORDER BY	1;

----------------- 	2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
	
	BEGIN TRAN
	
	DELETE	Sales.SalesPersonQuotaHistory
	WHERE	BusinessEntityID = 274;
	
	ROLLBACK

----------------- 	3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN
	
	DELETE	Sales.SalesPersonQuotaHistory
	WHERE	BusinessEntityID = 274;
	
	COMMIT

----------------- 	4. PRUEFEN
	
	SELECT		*
	FROM		Sales.SalesPersonQuotaHistory AS q
	WHERE		q.BusinessEntityID = 274
	ORDER BY	1;

---------------------------- DELETE - QUERY -------------------------------------
/*
	...
*/
------------------------------- EXAMPLE -----------------------------------------

----------------- 	1. SUCHEN				--> PK  
	SELECT		*
	FROM		Sales.SalesPersonQuotaHistory	AS	spqh  
	INNER JOIN	Sales.SalesPerson				AS	sp  
	ON			spqh.BusinessEntityID	=	sp.BusinessEntityID  
	WHERE		sp.SalesYTD				>	2500000.00; 

----------------- 	2. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & ROLLBACK 
	
	BEGIN TRAN

	DELETE		spqh  
	FROM		Sales.SalesPersonQuotaHistory	AS	spqh  
	INNER JOIN	Sales.SalesPerson				AS	sp  
	ON			spqh.BusinessEntityID	=	sp.BusinessEntityID  
	WHERE		sp.SalesYTD				>	2500000.00;  

	ROLLBACK

----------------- 	3. AKTUALISIEREN / LOESCHEN	--> BEGIN TRAN & COMMIT 

	BEGIN TRAN

	DELETE		spqh  
	FROM		Sales.SalesPersonQuotaHistory	AS	spqh  
	INNER JOIN	Sales.SalesPerson				AS	sp  
	ON			spqh.BusinessEntityID	=	sp.BusinessEntityID  
	WHERE		sp.SalesYTD				>	2500000.00;  

	COMMIT

----------------- 	4. PRUEFEN
	SELECT		*
	FROM		Sales.SalesPersonQuotaHistory	AS	spqh  
	INNER JOIN	Sales.SalesPerson				AS	sp  
	ON			spqh.BusinessEntityID	=	sp.BusinessEntityID  
	WHERE		sp.SalesYTD				>	2500000.00;  

--------------------------- DELETE TABLE ----------------------------------------
/*
	Löscht eine Tabelle und setzt die Identity nicht zurück.
*/
------------------------------- EXAMPLE -----------------------------------------

	BEGIN TRAN

	CREATE TABLE DeleteTable
	(	 IDDeleteTable		INT				IDENTITY (1,1)	NOT NULL
		,DeleteTableName	VARCHAR	(30)					NOT NULL

		,CONSTRAINT		PK_DeleteTable_IDDeleteTable PRIMARY KEY (IDDeleteTable)
	);

	INSERT	DeleteTable VALUES	('Leyla');
	INSERT	DeleteTable VALUES	('Joerg');
	INSERT	DeleteTable VALUES	('Merry');
	
	SELECT * FROM DeleteTable;
	
	DELETE	DeleteTable;
	
	INSERT	DeleteTable VALUES	('Leyla');
	INSERT	DeleteTable VALUES	('Joerg');
	INSERT	DeleteTable VALUES	('Merry');
	
	SELECT * FROM DeleteTable;

	ROLLBACK