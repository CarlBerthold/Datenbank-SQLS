---------------------------------------------------------------------------------
-------------------- RUN CODE (CLEANING DATABASE - LINE 3-29) -------------------
	--PRINT 'Changing Database Context "MASTER"';
	--USE MASTER;
	--GO
	
	--:setvar DatabaseName "RelationDB"
	--GO
	
	--PRINT 'Dropping Database "RelationDB"';
	--IF EXISTS 
	--		(
	--			SELECT name 
	--			FROM master.sys.databases
	--			WHERE name = N'$(DatabaseName)'
	--		)	DROP DATABASE $(DatabaseName);
	--GO
	
	--PRINT 'Creating Database "RelationDB"';
	--CREATE DATABASE RelationDB;
	--GO
	
	--PRINT 'Changing Database Context "RelationDB"';
	--USE RelationDB;
	--GO

	--PRINT 'Changing Autorization to "SA"';
	--ALTER AUTHORIZATION ON DATABASE:: RelationDB TO [sa];
	--GO
-------------------------------- RELATIONEN -------------------------------------
/*
	Entitaeten		-->		Tabellen
	Attribute 		-->		Spalten

	Beziehungen:
	Werden in relationalen Datenbanken anhand Ihrer Multiplizität unterschieden.
*/
---------------------------------- N-1 ------------------------------------------
/*
	In der Viele zu eins (N-1) Beziehung wird die ID-Spalte von der Einser-Seite
	(1-Seite) in die Viele Seite eingefügt.
*/
------------------------------- AUFTRAG ------------------------------------------
/*
	Ein Kunde hat viele Adressen.

	- Die Kunden-Tabelle ist die "Einser" - Seite.
	- Die Adress-Tabelle ist die "Viele" - Seite.
*/
------------------------------- EXAMPLE ------------------------------------------

----- 01 - Tabellen Definieren
	CREATE TABLE Kunde 
	(
		IDKunde			INT				IDENTITY(1,1)	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Kunde_IDKunde	PRIMARY KEY (IDKunde)
	);

	CREATE TABLE Adresse 
	(
		IDAdresse		INT				IDENTITY(1,1)	NOT NULL
		,Strasse 		VARCHAR(30)						NOT NULL
		,HsNr			VARCHAR(10)						NOt NULL
		,Plz			INT								NOT NULL
		,Ort			VARCHAR(30)						NOT NULL

		,IDKunde		INT								NOT NULL
		
		,CONSTRAINT		PK_Adresse_IDAdresse	PRIMARY KEY (IDAdresse)
		,CONSTRAINT		FK_Adresse_IDKunde		FOREIGN KEY (IDKunde) 
												REFERENCES	Kunde(IDKunde)
	);

----- 02 - Datensaetzte Einfuegen
	INSERT INTO Kunde VALUES('Ken', 'Jason');
	INSERT INTO Kunde VALUES('Ali', 'Mehmet');
	INSERT INTO Kunde VALUES('Jennifer', 'Petersen');

	INSERT INTO Adresse VALUES('HauptStr.','5b',51109,'Koeln', 2);
	INSERT INTO Adresse VALUES('BerlinerStr.','300',59456,'Koeln', 2);
	INSERT INTO Adresse VALUES('Heideweg','13',41014,'Duesseldorf', 3);
	INSERT INTO Adresse VALUES('HauptStr.','5b',5109,'Koeln', 3);
	INSERT INTO Adresse VALUES('HauptStr.','5b',5109,'Koeln', 3);

----- 03 - Kontrollieren 	
	SELECT * FROM Kunde;
	SELECT * FROM Adresse;

	SELECT	*
	FROM	Kunde		AS	k
	JOIN	Adresse		AS	a
	ON		k.IDKunde = a.IDKunde; 

---------------------------------- N-M ------------------------------------------
/*	
	In der Viele zu Viele (N-M) Beziehung wird sowohl die ID-Spalte der N-Seite
	als auch die ID-Spalte der M-Seite in eine zwichen Tabelle eingefügt.
*/
------------------------------- AUFTRAG ------------------------------------------
/*
	Viele Studenten hoeren viele Vorlesungen.

	- Die Studenten-Tabelle ist eine "Viele" - Seite.
	- Die Vorlesungs-Tabelle ist eine "Viele" - Seite.
*/
------------------------------- EXAMPLE - 1 ---------------------------------------

----- 01 - Tabellen Definieren
	CREATE TABLE Student 
	(
		Vorname			VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
	
		,IDStudent		INT				IDENTITY(1,1)	NOT NULL

		,CONSTRAINT		PK_Student_IDStudent	PRIMARY KEY (IDStudent)
	);

	CREATE TABLE Vorlesung 
	(
		IDVorlesung		INT				IDENTITY(1,1)	NOT NULL
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

----- 02 - Datensaetzte Einfuegen
	INSERT INTO Student VALUES('Jerry', 'Bean');
	INSERT INTO Student VALUES('Josef', 'Albrecht');
	INSERT INTO Student VALUES('Melanie', 'Petersen');

	INSERT INTO Vorlesung VALUES('Dr. Perry', 'Programmierung');
	INSERT INTO Vorlesung VALUES('Prof. Meyers', 'Elektrotechnik');
	INSERT INTO Vorlesung VALUES('Vogt', 'Datenbanken');

	INSERT INTO StudentVorlesung VALUES (2,3);
	INSERT INTO StudentVorlesung VALUES (3,3);
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);
	
	-- kein Fehler --> Doppelte lassen sich einfügen 
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);

----- 03 - Kontrollieren 	
	SELECT * FROM Student;
	SELECT * FROM StudentVorlesung;
	SELECT * FROM Vorlesung;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;


----- 04 Loeschen
	DROP TABLE StudentVorlesung;
	DROP TABLE Student;
	DROP TABLE Vorlesung;

------------------------------- EXAMPLE - 2 ---------------------------------------

----- 01 - Tabellen Definieren
	CREATE TABLE Student 
	(
		Vorname			VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
	
		,IDStudent		INT				IDENTITY(1,1)	NOT NULL

		,CONSTRAINT		PK_Student_IDStudent	PRIMARY KEY (IDStudent)
	);

	CREATE TABLE Vorlesung 
	(
		IDVorlesung		INT				IDENTITY(1,1)	NOT NULL
		,Dozent			VARCHAR(30)						NOt NULL
		,Fach			VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Vorlesung_IDVorlesung	PRIMARY KEY (IDVorlesung)
	);

	CREATE TABLE StudentVorlesung 
	(
		IDStudent		INT								NOT NULL
		,IDVorlesung	INT								NOT NULL
		
		,CONSTRAINT		PK_StudentVorlesung_IDStudentIDVorlesung PRIMARY KEY (IDStudent,IDVorlesung) 
		
		,CONSTRAINT		FK_StudentVorlesung_IDStudent	FOREIGN KEY (IDStudent) 
														REFERENCES	Student(IDStudent)

		,CONSTRAINT		FK_StudentVorlesung_IDVorlesung	FOREIGN KEY (IDVorlesung) 
														REFERENCES	Vorlesung(IDVorlesung)	
	);

----- 02 - Datensaetzte Einfuegen
	INSERT INTO Student VALUES('Jerry', 'Bean');
	INSERT INTO Student VALUES('Josef', 'Albrecht');
	INSERT INTO Student VALUES('Melanie', 'Petersen');

	INSERT INTO Vorlesung VALUES('Dr. Perry', 'Programmierung');
	INSERT INTO Vorlesung VALUES('Prof. Meyers', 'Elektrotechnik');
	INSERT INTO Vorlesung VALUES('Vogt', 'Datenbanken');

	INSERT INTO StudentVorlesung VALUES (2,3);
	INSERT INTO StudentVorlesung VALUES (3,3);
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);

	-- Fehler --> Doppelte lassen sich nicht mehr einfügen 
	INSERT INTO StudentVorlesung VALUES (2,2);
	INSERT INTO StudentVorlesung VALUES (1,3);

----- 03 - Kontrollieren 	
	SELECT * FROM Student;
	SELECT * FROM StudentVorlesung;
	SELECT * FROM Vorlesung;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;

---------------------------------- 1-1 ------------------------------------------
/*
	In der Eins zu eins (1-1) Beziehung wird der eigene Schlüssel in die andere
	Tabelle eingefügt und umgekehrt.  
*/
------------------------------- AUFTRAG ------------------------------------------
/*
	Jeder Mitarbeiter hat ein Notebook.
*/
------------------------------- EXAMPLE - 1 --------------------------------------

----- 01 - Tabellen Definieren
	CREATE TABLE Mitarbeiter 
	(
		IDMitarbeiter	INT				IDENTITY(1,1)	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL

		,IDNotebook		INT								NULL
		
		,CONSTRAINT		PK_Mitarbeiter_IDMitarbeiter	PRIMARY KEY (IDMitarbeiter)
		--,CONSTRAINT		FK_Mitarbeiter_IDNotebook	FOREIGN KEY (IDNotebook)
		--												REFERENCES	Notebook(IDNotebook)
	);

	CREATE TABLE Notebook 
	(
		IDNotebook		INT				IDENTITY(1,1)	NOT NULL
		,Hersteller		VARCHAR(30)						NOT NULL
		,Seriennummer	VARCHAR(30)						NOT NULL

		,IDMitarbeiter	INT								NULL
		
		,CONSTRAINT		PK_Notebook_IDNotebook			PRIMARY KEY (IDNotebook)
		,CONSTRAINT		FK_Notebook_IDMitarbeiter		FOREIGN KEY (IDMitarbeiter)
														REFERENCES	Mitarbeiter(IDMitarbeiter)
	);

	ALTER TABLE Mitarbeiter ADD CONSTRAINT	FK_Mitarbeiter_IDNotebook	
	FOREIGN KEY (IDNotebook)
	REFERENCES	Notebook(IDNotebook);

--- 02 - Datensaetzte Einfuegen
	INSERT INTO Mitarbeiter VALUES('Ken', 'Jason',NULL);
	INSERT INTO Mitarbeiter VALUES('Ali', 'Mehmet',NULL);
	INSERT INTO Mitarbeiter VALUES('Jennifer', 'Petersen',NULL);

	INSERT INTO Notebook VALUES('Microsoft','wdfwer435b',NULL);
	INSERT INTO Notebook VALUES('Asus','334r300', NULL);
	INSERT INTO Notebook VALUES('Samsung','1343zu3', NULL);

	UPDATE	Mitarbeiter SET	IDNotebook = 1 WHERE IDMitarbeiter = 1;
	UPDATE	Mitarbeiter SET	IDNotebook = 2 WHERE IDMitarbeiter = 2;
	UPDATE	Mitarbeiter SET	IDNotebook = 3 WHERE IDMitarbeiter = 3;

	UPDATE	Notebook SET IDMitarbeiter	= 1 WHERE IDNotebook = 1;
	UPDATE	Notebook SET IDMitarbeiter	= 2 WHERE IDNotebook = 2;
	UPDATE	Notebook SET IDMitarbeiter	= 3 WHERE IDNotebook = 3;	

----- 03 - Kontrollieren 	
	SELECT * FROM Mitarbeiter;
	SELECT * FROM Notebook;

	SELECT	*
	FROM	Notebook				AS	n
	JOIN	Mitarbeiter				AS	m
	ON		m.IDMitarbeiter = n.IDMitarbeiter; 

----- 04 Loeschen
	ALTER TABLE	Mitarbeiter DROP CONSTRAINT FK_Mitarbeiter_IDNotebook;
	ALTER TABLE	Notebook DROP CONSTRAINT FK_Notebook_IDMitarbeiter;

	DROP TABLE Mitarbeiter;
	DROP TABLE Notebook;

------------------------------- EXAMPLE - 2 --------------------------------------

----- 01 - Tabellen Definieren
	CREATE TABLE Mitarbeiter 
	(
		IDMitarbeiter	INT				IDENTITY(1,1)	NOT NULL
		,Vorname		VARCHAR(30)						NOT NULL
		,Nachname		VARCHAR(30)						NOT NULL
		
		,CONSTRAINT		PK_Mitarbeiter_IDMitarbeiter	PRIMARY KEY (IDMitarbeiter)
	);

	CREATE TABLE Notebook 
	(
		IDNotebook		INT				IDENTITY(1,1)	NOT NULL
		,Hersteller		VARCHAR(30)						NOT NULL
		,Seriennummer	VARCHAR(30)						NOT NULL

		,IDMitarbeiter	INT	UNIQUE						NOT NULL
		
		,CONSTRAINT		PK_Notebook_IDNotebook			PRIMARY KEY (IDNotebook)
		,CONSTRAINT		FK_Mitarbeiter_IDMitarbeiter	FOREIGN KEY (IDMitarbeiter)
														REFERENCES	Mitarbeiter(IDMitarbeiter)
	);

--- 02 - Datensaetzte Einfuegen
	INSERT INTO Mitarbeiter VALUES('Ken', 'Jason');
	INSERT INTO Mitarbeiter VALUES('Ali', 'Mehmet');
	INSERT INTO Mitarbeiter VALUES('Jennifer', 'Petersen');

	INSERT INTO Notebook VALUES('Microsoft','wdfwer435b',1);
	INSERT INTO Notebook VALUES('Asus','334r300', 2);
	INSERT INTO Notebook VALUES('Samsung','1343zu3', 3);

----- 03 - Kontrollieren 	
	SELECT * FROM Mitarbeiter;
	SELECT * FROM Notebook;

	SELECT	*
	FROM	Notebook				AS	n
	JOIN	Mitarbeiter				AS	m
	ON		m.IDMitarbeiter = n.IDMitarbeiter; 