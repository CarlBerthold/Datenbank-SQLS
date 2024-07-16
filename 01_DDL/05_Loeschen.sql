-- ------------------------------- DDL -------------------------------------------
-- Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren Beziehungen.	
    
    CREATE DATABASE FiveDB;
	USE FiveDB;

-- ------------------------------- RELATIONEN - Loeschen --------------------------
-- Beim loeschen von Refrenzierten Datensaetzte muss zuerst der Eintrag in der 
-- Referenz Tabelle gelöscht werden. 

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

	INSERT INTO StudentVorlesung VALUES (2,3);
	INSERT INTO StudentVorlesung VALUES (3,3);
	INSERT INTO StudentVorlesung VALUES (1,3);
	INSERT INTO StudentVorlesung VALUES (2,2);
	INSERT INTO StudentVorlesung VALUES (1,1);

	SELECT * FROM Student;
	SELECT * FROM StudentVorlesung;
	SELECT * FROM Vorlesung;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;

	-- Fehler
	-- DELETE	FROM	Student
	-- WHERE			IDStudent = 1;
	
	-- kein Fehler 
	DELETE	FROM	StudentVorlesung
	WHERE			IDStudent = 1;

	DELETE	FROM	Student
	WHERE			IDStudent = 1;

	DROP TABLE StudentVorlesung;
	DROP TABLE Student;
	DROP TABLE Vorlesung;

-- ------------------- Loeschweitergabe - Loeschen ------------------------------
-- Beim loeschen von Referenzierten Datensaetzte wird die loeschung an die 
-- Referenzierte - Tabelle weiter gegeben.

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
														ON DELETE CASCADE

		,CONSTRAINT		FK_StudentVorlesung_IDVorlesung	FOREIGN KEY (IDVorlesung) 
														REFERENCES	Vorlesung(IDVorlesung)	
														ON DELETE CASCADE
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
	INSERT INTO StudentVorlesung VALUES (1,1);
	
	SELECT * FROM Student;
	SELECT * FROM StudentVorlesung;
	SELECT * FROM Vorlesung;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;

	-- kein Fehler
	DELETE	FROM	Student
	WHERE			IDStudent = 1;

	SELECT	*
	FROM	Student								AS s
	JOIN	StudentVorlesung					AS sv
	ON		s.IDStudent			= sv.IDStudent
	JOIN	Vorlesung							AS v
	ON		sv.IDVorlesung		= v.IDVorlesung;
    
	DROP TABLE StudentVorlesung;
	DROP TABLE Student;
	DROP TABLE Vorlesung;
    
    
	DROP DATABASE  IF EXISTS FiveDB;