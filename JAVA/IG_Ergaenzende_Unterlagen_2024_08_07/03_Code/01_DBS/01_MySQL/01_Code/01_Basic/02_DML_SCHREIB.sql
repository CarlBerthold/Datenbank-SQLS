-- ------------------------------- DML --------------------------------------------
/*	
	Mit DML-Befehle erhält man einen Schreibzugriff auf die Datenbank / Datenbasis.

	Beim manipulieren von Daten sollten Sie dabei achten, dass Sie die DatenBank,
	immer in einen Integeren Zustand verlassen. 

	SCHRITTE:
		1. SUCHEN							--> PK
		2. INSERT / UPDATE / DELETE
		3. PRUEFEN
*/
-- ----------------------------- CREATE DB/TABLE ---------------------------------
    
    CREATE DATABASE SixDB;
	USE SixDB;

	CREATE TABLE Kunde 
	(
		IDKunde			INT				AUTO_INCREMENT 	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Kunde_IDKunde	PRIMARY KEY (IDKunde)
	);

-- ------------------------------ INSERT -----------------------------------------
-- Mit dem befehl Insert fügen wir Datensätze in einer tabellen ein. 

	SELECT * FROM Kunde;

-- ---------------------- Version 1
	INSERT  Kunde 	(Vorname,Nachname)
    VALUES			('Ken'	, 'Jason');
    
-- ---------------------- Version 2    
	INSERT Kunde 	(Vorname,nachname)
    VALUES			('PENELOPE','GUINESS')
					,('NICK','WAHLBERG')
					,('ED','CHASE')
					,('JENNIFER','DAVIS')
					,('JOHNNY','LOLLOBRIGIDA')
					,('BETTE','NICHOLSON');

-- ---------------------- Version 3                    
	INSERT INTO		KUNDE 		(	Vorname		,Nachname	)
    SELECT 							first_name	,last_name
    FROM			SAKILA.ACTOR;
    
	SELECT	*
	FROM	sakila.actor;

-- ------------------------------ UPDATE -----------------------------------------
-- Mit Update aktualsieren wir Zeilen.

	SELECT	*
	FROM	Kunde
    WHERE	IDKunde = 5 ;

	UPDATE	Kunde
	SET		Nachname =	'Mehmet'
    WHERE	IDKunde = 5 ;

	SELECT	*
	FROM	Kunde;

-- --------------------------- UPDATE NULL ---------------------------------------
-- 'NULL' UNGLEICH  NULL  
-- LEER-STRING ('') BESSER ALS NULL-STRING ('NULL')

	SELECT	*
	FROM	Kunde
	WHERE	IDKunde		=	3;

	UPDATE	Kunde
	-- SET		Nachname	=	'NULL'
	SET		Nachname	=	''
	WHERE	IDKunde		=	3;

	SELECT	*
	FROM	Kunde
	WHERE	IDKunde		=	3;

-- ------------------------------ DELETE -----------------------------------------
-- Entfernt Zeile aus einer Tabelle.

	SELECT	*
	FROM	Kunde
	WHERE	IDKunde		=	7;

	DELETE	FROM	Kunde
	WHERE			IDKunde		=	7;

	SELECT	*
	FROM	Kunde
	WHERE	IDKunde		=	7;


	DROP DATABASE IF EXISTS SixDB;