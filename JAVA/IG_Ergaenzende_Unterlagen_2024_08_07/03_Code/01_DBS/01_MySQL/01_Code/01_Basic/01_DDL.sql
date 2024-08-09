-- ------------------------------- DDL -------------------------------------------
-- Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren Beziehungen.

-- ------------------------ CREATE DATABASE --------------------------------------
-- Erstellen einer neuen Datenbank und die zum Speichern benötigten Dateien.

	CREATE DATABASE OneDB;
   
-- ------------------------------- USE -------------------------------------------
-- Datenbank Kontext wechseln.

	USE OneDB;
    
-- ------------------------------- DROP ------------------------------------------
-- Entfernt eine oder mehrere Datenbanken.

	CREATE 	DATABASE 	TestDB;
	DROP 	DATABASE 	TestDB;

-- ---------------------------- CREATE TABLE -------------------------------------
-- Erstellt eine neue Tabelle mit der definierten Struktur. 

	CREATE TABLE Produkt 
	(
		Bezeichnung VARCHAR(20)
	);

-- ------------------------------ DROP TABLE -------------------------------------
-- Entfernt eine Tabelle mit ihrer Struktur. 

	DROP TABLE Produkt;

-- ----------------------------- TRUNCATE ----------------------------------------
/*	
	Entfernt alle Zeilen oder angegebenen Partitionen einer Tabelle, ohne die 
	einzelnen Löschungen zu protokollieren. TRUNCATE TABLE entspricht DELETE ohne 
	WHERE-Klausel. TRUNCATE TABLE ist jedoch schneller und verwendet weniger 
	Systemressourcen und Ressourcen für die Transaktionsprotokollierung.
	Wenn die Tabelle eine AUTO_INCREMENT enthält, wird der Zähler für diese 
	Spalte auf den Ausgangswert zurückgesetzt, der für die Spalte definiert ist. 
	Wenn kein Ausgangswert definiert wurde, wird der Standardwert 1 verwendet. 
	(Falls Sie den Wert des Identitätszählers erhalten möchten, verwenden Sie 
	stattdessen DELETE.)
	
	--> Leert eine Tabelle und setzt das AUTO_INCREMENT zurück.
*/

	CREATE TABLE Test
	(	 IDTest		INT			AUTO_INCREMENT  PRIMARY KEY
		,Name		VARCHAR(30)					NOT NULL
	);
	
	INSERT	Test 	(Name)		
    VALUES 			('Petra');
    
	INSERT	Test 	(Name)		
    VALUES 			('Ulf');
    
	INSERT	Test 	(Name)		
    VALUES 			('Ina');
    
	SELECT * FROM Test;

	TRUNCATE TABLE Test;
	
	SELECT * FROM Test;
	
	INSERT	Test 	(Name)		
    VALUES 			('Hans');
    
	SELECT * FROM Test;

	DELETE FROM Test;

-- ----------------------------- AUTO-INCREMENT ----------------------------------------
-- Jede Spalte kann beim einfügen Automatisch hochgezählt werden wenn diese eine 
-- AUTO-INCREMENT definiert hat.
	
	CREATE TABLE Dozent
    (
		IDDozent 		INT				AUTO_INCREMENT
        ,Name			VARCHAR(30)
        
        ,CONSTRAINT		PK_Dozent_IDDozent 		PRIMARY KEY 	(IDDozent)
	);
    
    INSERT 	Dozent	( 	Name 		)
    VALUES			(	'Petersen' 	);
    
	INSERT 	Dozent	( 	Name 		)
    VALUES			(	'Vogt' 		);
    
    SELECT 	*
    FROM	Dozent;
    

    DROP TABLE Dozent;
    
    
    -- ------------------- CONSTRAINTS/EINSCHRAENKUNGEN -------------------------------
/*
	Einschraenkungen sind Regeln, die auf Datenbank/Tabellen-Ebene erzwungen werden. 
	Sie pruefen DML-Anweisungen bevor Sie angewendet werden. 
	Die Regeln, koennen nicht umgegangen werden. Sie können nur ganz entfernt werden.

	Constraint - Typen:
		- Primary Key
		- Foreign Key 
		- Check
		- Not Null 
*/
-- --------------------------- PRIMARY KEY ---------------------------------------
/*	
	Erzwingt die Eindeutigkeit. Die als Primary Key definierte Spalte ist 
    automatisch nicht NULL. Jede Tabelle sollte einen haben. Es kann nur einen in
    jeder Tabelle geben. Er kann auch aus mehreren Spalten bestehen, wenn eine 
    Spalte alleine keine Eindeutigkeit schafft.
*/

-- ---------------------- Version 1  - SPALTEN EBENE
	CREATE TABLE Person
    (
		IDPerson 	INT 			PRIMARY KEY
        ,Vorname	VARCHAR(20)		
	);
  
-- ---------------------- Version 2  - TABELLEN EBENE
    CREATE TABLE Produkt
    (
		IDProdukt 		INT
        
        ,PRIMARY KEY 	(IDProdukt)
	);

-- ---------------------- Version 3  - TABELLEN EBENE & PK_TABELLENNAME_SPALTENNAME
	CREATE TABLE Adresse
    (
		IDAdresse 		INT
        
        ,CONSTRAINT		PK_Adresse_IDAdresse 	PRIMARY KEY 	(IDAdresse)
	);
    
    DROP TABLE Person;
    DROP TABLE Produkt;
    DROP TABLE Adresse;

-- --------------------------- FOREIGN KEY ---------------------------------------
/*	
	Verweist auf den P-Key einer anderen Tabelle.Muss in der Referenztabelle vorhanden 
	sein. Null werte sind erlaubt (Explizit NULL).
*/
    
    CREATE TABLE Dozent
    (
		IDDozent 		INT
        ,Name			VARCHAR(30)
        
        ,CONSTRAINT		PK_Dozent_IDDozent 		PRIMARY KEY 	(IDDozent)
	);
    
    INSERT 	Dozent	(IDDozent	,Name)
    VALUES			(	11		,'Petersen');
    
    INSERT 	Dozent	(IDDozent	,Name)
    VALUES			(	20	,	'Vogt' );
    
    SELECT 	*
    FROM	Dozent;
    
	CREATE TABLE Kurs
    (
		IDKurs 			INT
        ,Veranstaltung	VARCHAR(30)
        ,IDDozent		INT
        
        ,CONSTRAINT		PK_Kurs_IDKurs	 		PRIMARY KEY 	(IDKurs)
        ,CONSTRAINT 	FK_Kurs_IDDozent 		FOREIGN KEY 	(IDDozent) 
													REFERENCES Dozent(IDDozent)
	);
    
	INSERT 	Kurs
    VALUES	(	1	,'Prog'	,11 );
    
	INSERT 	Kurs
    VALUES	(	33	,'DBS'	,20 );
    
    SELECT 	*
    FROM	Kurs;
    
    -- Fehler
	INSERT 	Kurs
    VALUES	(	76	,'Netztwerk'	,20 );
    
    DROP TABLE Kurs;
    DROP TABLE Dozent;

-- ------------------------------ CHECK ------------------------------------------
/*	
	Werte werden auf Gültigkeit geprüft bevor diese eingefügt werden.
	Verweist auf die Inhalte des selben Datensatzes. Kein verweis auf andere 
	Datensätze / Tabellen.
*/

	CREATE TABLE Wohnort 
	(
		PLZ	INT
		
		,CONSTRAINT CK_Wohnort_PLZ CHECK (PLZ > 1000 )
	);
	
	-- FEHLER
	-- INSERT 	Wohnort 
    -- VALUES 	(1000);
	
	-- Kein Fehler
	INSERT 	Wohnort 
    VALUES 	(1001);
	
	SELECT 	* 
    FROM Wohnort;

    DROP TABLE Wohnort;
    
-- ----------------------- NULL (EINSCHRÄNKUNG) ----------------------------------
/*	
	Die NULL (EINSCHRÄNKUNG) Erzwingt beim einfügen oder ändern eines Datensatz,
	dass ein Datensatz eingegeben werden muss. Es dürfen keine Leerwerte eingefügt
	werden.
	
	Jede Spalte wird automatisch auf NULLBAR gesetzt es sei denn man sagt das diese
	NICHT NULL sein darf. Sie sollten immer bei jedem Datentypen Explizit erwähnen
	ob dieser NULL oder NOT NULL ist. 
*/

	CREATE TABLE Firma 
	(
		Nummer			INT				NOT NULL
		,Bezeichnung	VARCHAR(20)			NULL
	);

    INSERT 	Firma	(Nummer,Bezeichnung)
	VALUES			(	null		, 'gredfhg'		);
    
    -- Fehler
	-- INSERT 	Firma
	-- VALUES	(null		, 'Die Firma XYZ'	);
	
	SELECT 	* 
    FROM Firma;

    DROP TABLE Firma;
    

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
		,HsNr			VARCHAR(10)						NOt NULL
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

	INSERT INTO StudentVorlesung VALUES (2,3);
	INSERT INTO StudentVorlesung VALUES (3,3);
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
		-- ,CONSTRAINT		FK_Mitarbeiter_IDNotebook	FOREIGN KEY (IDNotebook)
		-- 												REFERENCES	Notebook(IDNotebook)
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
	FOREIGN KEY (IDNotebook)
	REFERENCES	Notebook(IDNotebook);

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
    
    -- ------------------------- ALTER ADD COLUMN ------------------------------------
-- Mit dem Befehl ALTER veraendern wir die bereits bestehende Tabellen Struktur.
-- Hinzufuegen einer Spalte.

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung VARCHAR(20) 
	);    
	
    INSERT 		Produkt
    VALUES 		('Notebook'); 
	
    SELECT 		* 
    FROM 		Produkt;
    
	ALTER 	TABLE		Produkt 
    ADD 	COLUMN 		Nummer 		INT;
	
    INSERT 	Produkt 
    VALUES 	(	'Smartphone'	,623453	); 
	
    SELECT 	* 
    FROM 	Produkt;
    
	DROP TABLE 	Produkt;
    
-- -------------------------- DROP COLUMN-----------------------------------------
-- Enfernen einer Spalte.

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung 	VARCHAR(20)
        ,Nummer			INT
	); 
    
	INSERT 	Produkt 
    VALUES 	( 	'Smartphone'	,77 	);
    
	SELECT 	* 
    FROM 	Produkt;
	
	ALTER 	TABLE		Produkt 
    DROP 	COLUMN 		Nummer;
	
    SELECT 	* 
    FROM 	Produkt;

	DROP TABLE 	Produkt;
        
-- --------------------------- MODIFY COLUMN --------------------------------------
-- Aendern einer Spalte.

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung 	VARCHAR(20)
	); 
    
	INSERT 	Produkt 
    VALUES 	(	'Nootebook - Eigenbau'	); 
    
	SELECT 	LENGTH(Bezeichnung)		as 'Anzahlzeichen'
			,Bezeichnung	
    FROM 	Produkt;
    
    -- FEHLER
	-- INSERT 	Produkt 
    -- VALUES 	(	'Notebook iX Przesser 4th GenerationV'	);

	ALTER 	TABLE		Produkt 
    MODIFY 	COLUMN 		Bezeichnung VARCHAR(40);

	INSERT 	Produkt 
    VALUES 	(	'Notebook iX Przesser 4th GenerationV'	);
    
	SELECT 	LENGTH(Bezeichnung)		AS 'Anzahlzeichen'
			,Bezeichnung	
    FROM 	Produkt;
    
	DROP TABLE 	Produkt;

-- -------------------------- ADD NOT NULL ---------------------------------------
-- Eine Spalte Nullbar machen.	

	CREATE 	TABLE	Produkt
 	( 
		Bezeichnung 	VARCHAR(20)			NOT NULL
        ,Marke			VARCHAR(20) 		NULL
	); 
    
	INSERT 	Produkt 	(	Bezeichnung		,	Marke	 	)
    VALUES 				(	'Smartphone'	,	null		); 
	 
	SELECT 	*
    FROM 	Produkt;
    
    UPDATE 	Produkt
    SET 	Marke = ''
	WHERE	Marke IS NULL;

	ALTER 	TABLE		Produkt 
    MODIFY 	COLUMN		Marke		 	VARCHAR(20) 	NOT NULL 		DEFAULT	 '';
	
	INSERT 	Produkt 	(	Bezeichnung	 	)
    VALUES 				(	'Tablet'		); 
    
    SELECT 	*
    FROM 	Produkt;
    
	DROP TABLE 	Produkt;
    
-- ---------------------------- ADD CONSTRAINT -----------------------------------
-- Einschränkungen können auch nach der Tabelle Definition eingefügt werden.

    CREATE TABLE Dozent
    (
        Titel			VARCHAR(10)
	);
    
	INSERT Dozent 
    VALUES ('Bachelor');
    
    ALTER TABLE	Dozent 
	ADD CHECK ( ( LENGTH(Titel)  > 3 ) );

	-- FEHLER
	-- INSERT Dozent 
    -- VALUES ('Dr.');
    
    SELECT 	*
    FROM	Dozent;
    
    DROP TABLE Dozent;

-- -------------------------- DROP - CONSTRAINT ----------------------------------
-- Einschränkungen können auch nach der Tabelle Definition gelöscht werden.

	CREATE TABLE Wohnort 
	(
		PLZ	INT
		
		,CONSTRAINT CK_Wohnort_PLZ CHECK (PLZ > 1000 )
	);
	
	-- FEHLER
	-- INSERT 	Wohnort 
    -- VALUES 	(1000);
	
	-- Kein Fehler
	INSERT 	Wohnort 
    VALUES 	(1001);
	
	SELECT 	* 
    FROM 	Wohnort;

	ALTER TABLE	Wohnort 
    DROP CONSTRAINT CK_Wohnort_PLZ;
    
	INSERT 	Wohnort 
    VALUES 	(564);

    SELECT 	* 
    FROM 	Wohnort;
    
	DROP TABLE Wohnort;
    
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
    
    
	DROP DATABASE  IF EXISTS OneDB;