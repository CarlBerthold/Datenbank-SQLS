-- ------------------------------- DDL -------------------------------------------
-- Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren Beziehungen.	

	CREATE DATABASE ThreeDB;
	USE ThreeDB;

-- ------------------------------- RELATIONEN ------------------------------------
/*
	Entitaeten		-->		Tabellen
	Attribute 		-->		Spalten

	Beziehungen:
	Werden in relationalen Datenbanken anhand Ihrer Multiplizität unterschieden.
*/
-- -------------------------------- 1-N -------------------------------------------
-- Die ID-Spalte von der Einser-Seite wird in die Viele Seite eingefügt.

-- Beispiel: 
-- --> Ein Kunde hat viele Adressen.

	CREATE TABLE Kunde 
	(
		IDKunde			INT				AUTO_INCREMENT 	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Kunde_IDKunde	PRIMARY KEY (IDKunde)
	);

	CREATE TABLE Adresse 
	(
		IDAdresse		INT				AUTO_INCREMENT	NOT NULL
		,Strasse 		VARCHAR(30)						NOT NULL
		,HsNr			VARCHAR(10)						NOT NULL
		,Plz			INT								NOT NULL
		,Ort			VARCHAR(30)						NOT NULL

		,IDKunde		INT								NOT NULL
		
		,CONSTRAINT		PK_Adresse_IDAdresse	PRIMARY KEY (IDAdresse)
		,CONSTRAINT		FK_Adresse_IDKunde		FOREIGN KEY (IDKunde) 
													REFERENCES	Kunde(IDKunde)
	);

	INSERT Kunde 	(Vorname,Nachname)
    VALUES			('Ken'	, 'Jason');
    
	INSERT Kunde 	(Vorname,nachname)
    VALUES			('Ali', 'Mehmet');
    
	INSERT Kunde 	(Vorname,nachname)
    VALUES			('Jennifer', 'Petersen');

	INSERT Adresse 	(Strasse	,HsNr	,Plz	,Ort	,IDKunde)
    VALUES			('HauptStr.','5b'	,51109	,'Koeln', 1);
	
	INSERT Adresse 	(Strasse	,HsNr	,Plz	,Ort	,IDKunde)
    VALUES			('BerlinerStr.','300',59456,'Koeln', 1);
	
	INSERT Adresse 	(Strasse	,HsNr	,Plz	,Ort	,IDKunde) 
    VALUES			('Heideweg','13',41014,'Duesseldorf', 1);
	
	INSERT Adresse 	(Strasse	,HsNr	,Plz	,Ort	,IDKunde) 
    VALUES			('Kaiserring.','67',68105,'Mannheim', 2);
	
	SELECT * FROM Kunde;
	SELECT * FROM Adresse;

	SELECT	*
	FROM	Kunde		AS	k
	JOIN	Adresse		AS	a
	ON		k.IDKunde = a.IDKunde;
	
    DROP TABLE Adresse;
	DROP TABLE Kunde;

-- -------------------------------- N-M ------------------------------------------
-- Die ID-Spalte der N-Seite und die ID-Spalte der M-Seite werden beide in eine 
-- zwichen Tabelle eingefuegt.

-- Beispiel: 
-- --> Viele Studenten hoeren viele Vorlesungen.

-- ---------------------- Version 1
	CREATE TABLE Student 
	(
		Vorname			VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
	
		,IDStudent		INT				AUTO_INCREMENT	NOT NULL

		,CONSTRAINT		PK_Student_IDStudent	PRIMARY KEY (IDStudent)
	);

	CREATE TABLE Vorlesung 
	(
		IDVorlesung		INT				AUTO_INCREMENT	NOT NULL
		,Dozent			VARCHAR(30)						NOt NULL
		,Fach			VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Vorlesung_IDVorlesung	PRIMARY KEY (IDVorlesung)
	);

	CREATE TABLE StudentVorlesung 
	(
		IDStudent		INT								NOT NULL
		,IDVorlesung	INT								NOT NULL
		
		,CONSTRAINT		FK_StudentVorlesung_IDStudent	FOREIGN KEY (IDStudent) 
															REFERENCES	Student(IDStudent)

		,CONSTRAINT		FK_StudentVorlesung_IDVorlesung	FOREIGN KEY (IDVorlesung) 
															REFERENCES	Vorlesung(IDVorlesung)	
	);

	INSERT Student 	(Vorname,Nachname)
    VALUES			('Jerry', 'Bean');
    
	INSERT Student 	(Vorname,Nachname)
    VALUES			('Josef', 'Albrecht');
    
	INSERT Student 	(Vorname,Nachname)
    VALUES			('Melanie', 'Petersen');
    
	INSERT INTO Vorlesung 	(	 Dozent		,Fach				)
    VALUES					(	'Dr. Perry'	,'Programmierung'	);
    
	INSERT INTO Vorlesung 	(	 Dozent		,Fach				)
    VALUES					('Prof. Meyers'	, 'Elektrotechnik'	);
	
    INSERT INTO Vorlesung 	(	 Dozent		,Fach				) 
    VALUES					(	'Vogt'		,'Datenbanken'		);

	INSERT StudentVorlesung VALUES (2,3);
	INSERT StudentVorlesung VALUES (3,3);
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);
	
	-- kein Fehler --> Doppelte lassen sich einfügen 
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);
	
	SELECT * FROM Student;
	SELECT * FROM StudentVorlesung;
	SELECT * FROM Vorlesung;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;

	DROP TABLE StudentVorlesung;
	DROP TABLE Student;
	DROP TABLE Vorlesung;

-- ---------------------- Version 2
	CREATE TABLE Student 
	(
		Vorname			VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
	
		,IDStudent		INT				AUTO_INCREMENT	NOT NULL

		,CONSTRAINT		PK_Student_IDStudent	PRIMARY KEY (IDStudent)
	);

	CREATE TABLE Vorlesung 
	(
		IDVorlesung		INT				AUTO_INCREMENT	NOT NULL
		,Dozent			VARCHAR(30)						NOt NULL
		,Fach			VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Vorlesung_IDVorlesung	PRIMARY KEY (IDVorlesung)
	);

	CREATE TABLE StudentVorlesung 
	(
		IDStudent		INT								NOT NULL
		,IDVorlesung	INT								NOT NULL
		
		,CONSTRAINT PRIMARY KEY (IDStudent,IDVorlesung) 
		
		,FOREIGN KEY (IDStudent) REFERENCES	Student(IDStudent)

		,FOREIGN KEY (IDVorlesung) REFERENCES	Vorlesung(IDVorlesung)	
	);

	INSERT Student 	(Vorname,Nachname)
    VALUES			('Jerry', 'Bean');
    
	INSERT Student 	(Vorname,Nachname)
    VALUES			('Josef', 'Albrecht');
    
	INSERT Student 	(Vorname,Nachname)
    VALUES			('Melanie', 'Petersen');
    
	INSERT INTO Vorlesung 	(	 Dozent		,Fach				)
    VALUES					(	'Dr. Perry'	,'Programmierung'	);
    
	INSERT INTO Vorlesung 	(	 Dozent		,Fach				)
    VALUES					('Prof. Meyers'	, 'Elektrotechnik'	);
	
    INSERT INTO Vorlesung 	(	 Dozent		,Fach				) 
    VALUES					(	'Vogt'		,'Datenbanken'		);

	INSERT INTO StudentVorlesung VALUES (2,3);
	INSERT INTO StudentVorlesung VALUES (3,3);
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);

	-- Fehler --> Doppelte lassen sich nicht mehr einfügen 
	-- INSERT INTO StudentVorlesung VALUES (2,2);
	-- INSERT INTO StudentVorlesung VALUES (1,3);
	
	SELECT * FROM Student;
	SELECT * FROM StudentVorlesung;
	SELECT * FROM Vorlesung;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;

	DROP TABLE StudentVorlesung;
	DROP TABLE Student;
	DROP TABLE Vorlesung;
 
 
-- -------------------------------- 1-1 ------------------------------------------
-- Die Schluessel werden jeweils in die andere Tabelle eingefuegt.

-- Beispiel: 
-- --> Jeder Mitarbeiter hat ein Notebook.

-- ---------------------- Version 1
	CREATE TABLE Mitarbeiter 
	(
		IDMitarbeiter	INT				AUTO_INCREMENT	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL

		,IDNotebook		INT								NULL
		
		,CONSTRAINT		PK_Mitarbeiter_IDMitarbeiter	PRIMARY KEY (IDMitarbeiter)
		-- ,CONSTRAINT		FK_Mitarbeiter_IDNotebook		FOREIGN KEY (IDNotebook)
		--  													REFERENCES	Notebook(IDNotebook)
	);

	CREATE TABLE Notebook 
	(
		IDNotebook		INT				AUTO_INCREMENT	NOT NULL
		,Hersteller		VARCHAR(30)						NOT NULL
		,Seriennummer	VARCHAR(30)						NOT NULL

		,IDMitarbeiter	INT								NULL
		
		,CONSTRAINT		PK_Notebook_IDNotebook			PRIMARY KEY (IDNotebook)
		,CONSTRAINT		FK_Notebook_IDMitarbeiter		FOREIGN KEY (IDMitarbeiter)
															REFERENCES	Mitarbeiter(IDMitarbeiter)
	);

	ALTER TABLE Mitarbeiter ADD CONSTRAINT	FK_Mitarbeiter_IDNotebook	
	FOREIGN KEY (IDNotebook) 	REFERENCES	Notebook(IDNotebook);

	INSERT INTO Mitarbeiter 	(Vorname	,Nachname	, IDNotebook	)
    VALUES						( 'Ken' 	,'Jason'	, NULL			);
    
	INSERT INTO Mitarbeiter 	(Vorname	,Nachname	, IDNotebook	)
    VALUES						( 'Ali' 	,'Mehmet'	, NULL			);
    	
	INSERT INTO Mitarbeiter 	(Vorname	,Nachname	, IDNotebook	)
	VALUES						( 'Jennifer','Petersen'	, NULL			);
    

	INSERT INTO Notebook 		(Hersteller	,Seriennummer	,IDMitarbeiter	)
    VALUES						('Microsoft','wdfwer435b'	,NULL			);
    
	INSERT INTO Notebook 		(Hersteller	,Seriennummer	,IDMitarbeiter	)
    VALUES						('Asus'		,'334r300'		, NULL			);
    
	INSERT INTO Notebook 		(Hersteller	,Seriennummer	,IDMitarbeiter	)
    VALUES						('Samsung'	,'1343zu3'		, NULL			);

	UPDATE	Mitarbeiter SET	IDNotebook = 1 WHERE IDMitarbeiter = 1;
	UPDATE	Mitarbeiter SET	IDNotebook = 2 WHERE IDMitarbeiter = 2;
	UPDATE	Mitarbeiter SET	IDNotebook = 3 WHERE IDMitarbeiter = 3;

	UPDATE	Notebook SET IDMitarbeiter	= 1 WHERE IDNotebook = 1;
	UPDATE	Notebook SET IDMitarbeiter	= 2 WHERE IDNotebook = 2;
	UPDATE	Notebook SET IDMitarbeiter	= 3 WHERE IDNotebook = 3;	
	
	SELECT * FROM Mitarbeiter;
	SELECT * FROM Notebook;

	SELECT	*
	FROM	Notebook				AS	n
	JOIN	Mitarbeiter				AS	m
	ON		m.IDMitarbeiter = n.IDMitarbeiter; 

	ALTER TABLE	Mitarbeiter DROP CONSTRAINT FK_Mitarbeiter_IDNotebook;
	ALTER TABLE	Notebook DROP CONSTRAINT FK_Notebook_IDMitarbeiter;

	DROP TABLE Mitarbeiter;
	DROP TABLE Notebook;

-- ---------------------- Version 2
	CREATE TABLE Mitarbeiter 
	(
		IDMitarbeiter	INT				AUTO_INCREMENT	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Mitarbeiter_IDMitarbeiter	PRIMARY KEY (IDMitarbeiter)
	);

	CREATE TABLE Notebook 
	(
		IDNotebook		INT				AUTO_INCREMENT	NOT NULL
		,Hersteller		VARCHAR(30)						NOT NULL
		,Seriennummer	VARCHAR(30)						NOT NULL

		,IDMitarbeiter	INT	UNIQUE						NOT NULL
		
		,CONSTRAINT		PK_Notebook_IDNotebook			PRIMARY KEY (IDNotebook)
		,CONSTRAINT		FK_Mitarbeiter_IDMitarbeiter	FOREIGN KEY (IDMitarbeiter)
															REFERENCES	Mitarbeiter(IDMitarbeiter)
	);

	INSERT INTO Mitarbeiter 	(Vorname	,Nachname	)
    VALUES						( 'Ken' 	,'Jason'	);
    
	INSERT INTO Mitarbeiter 	(Vorname	,Nachname	)
    VALUES						( 'Ali' 	,'Mehmet'	);
    	
	INSERT INTO Mitarbeiter 	(Vorname	,Nachname	)
	VALUES						( 'Jennifer','Petersen'	);
    

	INSERT INTO Notebook 		(Hersteller	,Seriennummer	,IDMitarbeiter	)
    VALUES						('Microsoft','wdfwer435b'	,1				);
    
	INSERT INTO Notebook 		(Hersteller	,Seriennummer	,IDMitarbeiter	)
    VALUES						('Asus'		,'334r300'		,2				);
    
	INSERT INTO Notebook 		(Hersteller	,Seriennummer	,IDMitarbeiter	)
    VALUES						('Samsung'	,'1343zu3'		,3				);
	
	SELECT * FROM Mitarbeiter;
	SELECT * FROM Notebook;

	SELECT	*
	FROM	Notebook				AS	n
	JOIN	Mitarbeiter				AS	m
	ON		m.IDMitarbeiter = n.IDMitarbeiter; 
   
	DROP TABLE Notebook;
	DROP TABLE Mitarbeiter;
    
    
	DROP DATABASE  IF EXISTS ThreeDB;