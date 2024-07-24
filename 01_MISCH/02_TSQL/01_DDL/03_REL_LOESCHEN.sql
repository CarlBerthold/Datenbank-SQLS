---------------------------------------------------------------------------------
-------------------- RUN CODE (CLEANING DATABASE - LINE 3-29) -------------------
	PRINT 'Changing Database Context "MASTER"';
	USE MASTER;
	GO
	
	:setvar DatabaseName "RelationLoeschenDB"
	GO
	
	PRINT 'Dropping Database "RelationLoeschenDB"';
	IF EXISTS 
			(
				SELECT name 
				FROM master.sys.databases
				WHERE name = N'$(DatabaseName)'
			)	DROP DATABASE $(DatabaseName);
	GO
	
	PRINT 'Creating Database "RelationLoeschenDB"';
	CREATE DATABASE RelationLoeschenDB;
	GO
	
	PRINT 'Changing Database Context "RelationLoeschenDB"';
	USE RelationLoeschenDB;
	GO

	PRINT 'Changing Autorization to "SA"';
	ALTER AUTHORIZATION ON DATABASE:: RelationLoeschenDB TO [sa];
	GO
------------------------ RELATIONEN - Loeschen ----------------------------------
/*
	Beim loeschen von Refrenzierten Datensaetzte muss zuerst der Eintrag in der 
	Referenz Tabelle gelöscht werden. 
*/
---------------------- EXAMPLE - 1 OHNE CASCADE ---------------------------------

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
	INSERT INTO StudentVorlesung VALUES (1,1);

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
	
	-- Fehler
	DELETE	Student
	WHERE	IDStudent = 1;
	
	-- kein Fehler 
	DELETE	StudentVorlesung
	WHERE	IDStudent = 1;

	DELETE	Student
	WHERE	IDStudent = 1;

	DROP TABLE StudentVorlesung;
	DROP TABLE Student;
	DROP TABLE Vorlesung;

--------------------- Loeschwitergabe - Loeschen ------------------------------
/*
	Beim loeschen von Referenzierten Datensaetzte wird die loeschung an die 
	Referenz - Tabelle weiter gegeben und in dieser werden dann ebenfalls ALLE 
	eintraege gelöscht.
*/
---------------------- EXAMPLE - 2 MIT CASCADE ---------------------------------

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
														ON DELETE CASCADE

		,CONSTRAINT		FK_StudentVorlesung_IDVorlesung	FOREIGN KEY (IDVorlesung) 
														REFERENCES	Vorlesung(IDVorlesung)	
														ON DELETE CASCADE
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
	INSERT INTO StudentVorlesung VALUES (1,1);

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
	
	-- kein Fehler
	DELETE	Student
	WHERE	IDStudent = 1;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;