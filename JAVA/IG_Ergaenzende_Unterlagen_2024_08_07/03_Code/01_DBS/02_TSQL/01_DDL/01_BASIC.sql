---------------------------------------------------------------------------------
-------------------- RUN CODE (CLEANING DATABASE - LINE 3-29) -------------------
	--PRINT 'Changing Database Context "MASTER"';
	--USE MASTER;
	--GO
	
	--:setvar DatabaseName "DDLDB"
	--GO
	
	--PRINT 'Dropping Database "DDLDB"';
	--IF EXISTS 
	--		(
	--			SELECT name 
	--			FROM master.sys.databases
	--			WHERE name = N'$(DatabaseName)'
	--		)	DROP DATABASE $(DatabaseName);
	--GO
	
	--PRINT 'Creating Database "DDLDB"';
	--CREATE DATABASE DDLDB;
	--GO
	
	--PRINT 'Changing Database Context "DDLDB"';
	--USE DDLDB;
	--GO
	
	--PRINT 'Changing Autorization to "SA"';
	--ALTER AUTHORIZATION ON DATABASE:: DDLDB TO [sa];
	--GO
--------------------------------- DDL -------------------------------------------
/*	
	Mit DDL-Anweisungen erzeugt man Datenbanken und Tabellen mit ihren 
	Beziehungen.
*/
------------------------------- DATABASE ----------------------------------------
-------------------------------- CREATE -----------------------------------------
/*	
	Erstellt eine neue Datenbank und die zum Speichern der Datenbank verwendeten 
	Dateien, erstellt einen Datenbanksnapshot oder hängt eine Datenbank aus den 
	getrennten Dateien einer zuvor erstellten Datenbank an.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE DATABASE <DatenbankName>;
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE DATABASE TestDB;

--------------------------------- DROP ------------------------------------------
/*	
	Entfernt eine oder mehrere Datenbanken oder Datenbanksnapshots von einer SQL 
	Server-Instanz.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	DROP DATABASE <DatenbankName>;
*/
------------------------------- EXAMPLE -----------------------------------------

	DROP DATABASE TestDB;

--------------------------------- TABLE -----------------------------------------
--------------------------------- CREATE ----------------------------------------
/*
	Erstellt eine neue Tabelle mit der definierten Struktur. 
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE TABLE <TabellenName> 
	(
		<Spaltename> <DATENTYP>
	);
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE TestTable 
	(
		TestName VARCHAR(20)
	);

--------------------------------- DROP ------------------------------------------
/*	
	Entfernt eine Tabelle mit ihrer Struktur. 
*/
------------------------------- SYNTAX ------------------------------------------
/*
	DROP TABLE <TabellenName>;
*/
------------------------------- EXAMPLE -----------------------------------------

	DROP TABLE TestTable;

---------------------------------------------------------------------------------
------------------------------- TRUNCATE ----------------------------------------
/*	
	Entfernt alle Zeilen oder angegebenen Partitionen einer Tabelle, ohne die 
	einzelnen Löschungen zu protokollieren. TRUNCATE TABLE entspricht DELETE ohne 
	WHERE-Klausel. TRUNCATE TABLE ist jedoch schneller und verwendet weniger 
	Systemressourcen und Ressourcen für die Transaktionsprotokollierung.
	Wenn die Tabelle eine Identitätsspalte enthält, wird der Zähler für diese 
	Spalte auf den Ausgangswert zurückgesetzt, der für die Spalte definiert ist. 
	Wenn kein Ausgangswert definiert wurde, wird der Standardwert 1 verwendet. 
	(Falls Sie den Wert des Identitätszählers erhalten möchten, verwenden Sie 
	stattdessen DELETE.)
	
	-->Leert eine Tabelle und setzt die Identity zurück.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	TRUNCATE TABLE <TabellenName>;
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE TrunTable
	(	 IDTrunTable		INT			IDENTITY (1,1)	NOT NULL
		,TrunTableName		VARCHAR(30)					NOT NULL
	);
	
	INSERT	TrunTable VALUES ('Petra');
	INSERT	TrunTable VALUES ('Ulf');
	INSERT	TrunTable VALUES ('Ina');
	SELECT * FROM TrunTable;

	TRUNCATE TABLE TrunTable;
	
	SELECT * FROM TrunTable;
	INSERT	TrunTable VALUES ('Hans');
	SELECT * FROM TrunTable;

------------------------- NULL (EINSCHRÄNKUNG) ----------------------------------
/*	
	Die NULL (EINSCHRÄNKUNG) Erzwingt beim einfügen oder ändern eines Datensatz,
	dass ein Datensatz eingegeben werden muss. Es dürfen keine Leerwerte eingefügt
	werden.
	
	Jede Spalte wird automatisch auf NULLBAR gesetzt es sei denn man sagt das diese
	NICHT NULL sein darf. Sie sollten immer bei jedem Datentypen Explizit erwähnen
	ob dieser NULL oder NOT NULL ist. 
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE TABLE <TabellenName> 
	(
		<Spaltename> <DATENTYP> NOT NULL,
		<Spaltename> <DATENTYP> NULL
	);
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE NULLBAR 
	(
		IDNUllbar		INT				NOT NULL
		,NullbarName	VARCHAR(20)		NULL
	);

------------------------------- IDENTITY ----------------------------------------
/*	
	Jede Spalte kann beim einfügen Automatisch hochgezählt werden wenn diese 
	eine Identität definiert hat.
		
	IDENTITY (	STARTWERT, SCHRITTWEITE): 
		STARTWERT:		Beginn der Zählung.
		SCHRITTWEITE:	Um welchen Wert erhöht werden soll.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE TABLE <TabellenName> 
	(
		<Spaltename> <DATENTYP> IDENTITY(<START>,<WEITE>) NOT NULL
	);
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE TableOhneIdentity 
	(
		IDTableIdentity			INT				NOT NULL
		,TableOhneIdentityName	VARCHAR(20)			NULL
	);
	
	INSERT TableOhneIdentity VALUES (1,'Jenny');
	INSERT TableOhneIdentity VALUES (1,'Jenny');
	INSERT TableOhneIdentity VALUES (523,'Peter');
	
	SELECT * FROM TableOhneIdentity;
	
	CREATE TABLE TableMitIdentity 
	(
		IDTableMitIdentity		INT			IDENTITY(1,1)	NOT NULL,
		TableMitIdentityName	VARCHAR(20)					NULL
	);
	
	INSERT TableMitIdentity VALUES ('Jenny');
	INSERT TableMitIdentity VALUES ('Jenny');
	INSERT TableMitIdentity VALUES ('Peter');
	
	SELECT * FROM TableMitIdentity;

-------------------------------- ALTER ------------------------------------------
/*	
	Mit dem Befehl ALTER verändern wir die bereits bestehende Tabellen Struktur.
*/
---------------------------- ADD COLUMN -----------------------------------------
/*	
	Hinzufügen einer Spalte.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	ALTER TABLE	<TabellenName> ADD <SpaltenName> DATENTYP;
*/
------------------------------- EXAMPLE -----------------------------------------
	
	CREATE TABLE TableAdd ( TableAddName VARCHAR(20) NULL);
	INSERT TableAdd VALUES ('Jenny'); 
	SELECT * FROM TableAdd;

	ALTER TABLE	TableAdd ADD Testnummer INT;
	INSERT TableAdd VALUES ('Hans', 33); 
	SELECT * FROM TableAdd;
	
---------------------------- DROP COLUMN-----------------------------------------
/*	
	Enfernen einer Spalte.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	ALTER TABLE	<TabellenName> DROP COLUMN	<SpaltenName>;
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE TableDrop ( TableDropNummer INT NULL, TableDropName VARCHAR(20) NULL);
	INSERT TableDrop VALUES (77,'Peter'); 
	SELECT * FROM TableDrop;
	
	ALTER TABLE	TableDrop DROP COLUMN TableDropNummer;
	SELECT * FROM TableDrop;

----------------------------- ALTER COLUMN --------------------------------------
/*	
	Ändern einer Spalte.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	ALTER TABLE	<TabellenName> ALTER COLUMN <SpaltenName> DATENTYP;
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE TableAlter ( TableAlterName VARCHAR(20) NULL);
	INSERT TableAlter VALUES ('Ali'); 
	SELECT * FROM TableAlter;

	ALTER TABLE	TableAlter ALTER COLUMN TableAlterName VARCHAR(40);

	INSERT TableAlter VALUES ('Hans-Peter Von Oberfuerstenhausen');
	SELECT * FROM TableAlter;

---------------------------- ADD NOT NULL ---------------------------------------
/*	
	Eine Spalte Nullbar machen.	
*/
------------------------------- SYNTAX ------------------------------------------
/*
	ALTER TABLE	<TabellenName> ADD <SpaltenName> DATENTYP NOT NULL DEFAULT <WERT>;
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE TableNotNull ( TableNotNullName VARCHAR(20) NULL);
	INSERT TableNotNull VALUES ('Ursula'); 
	SELECT * FROM TableNotNull;

	ALTER TABLE	TableNotNull ADD Bereich VARCHAR(20) NOT NULL DEFAULT '';

	INSERT TableNotNull VALUES ('Hanne','Kundenberatung');
	SELECT * FROM TableNotNull;

--------------------- CONSTRAINTS/EINSCHRÄNKUNGEN -------------------------------
/*
	Einschränkungen sind Regeln, die auf Datenbank/Tabellen-Ebene erzwungen werden. 
	Sie prüfen DML-Anweisungen bevor Sie angewendet werden. 
	Die Regeln, können nicht umgegangen werden. Sie können nur ganz entfernt werden.

	Constraint - Typen:
		- Primary Key
		- Foreign Key 
		- Check
		- Not Null 
*/
----------------------------- PRIMARY KEY ---------------------------------------
/*	
	Erzwingt die Eindeutigkeit. Die als Primary Key definierte Spalte ist automatisch
	nicht NULL. Ein Index durch schnelles finden wird erstellt. Jede Tabelle sollte 
	einen haben. Es kann nur einen in jeder Tabelle geben. Er kann auch aus mehreren 
	Spalten bestehen, wenn eine Spalte alleine keine Eindeutigkeit schafft.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE TABLE <TABLENAME> (<Spaltename> <DATENTYP> PRIMARY KEY );

	CREATE TABLE <TABLENAME> (<Spaltename> <DATENTYP> CONSTRAINT <PKNAME> PRIMARY KEY );

	CREATE TABLE <TABLENAME> 
	(
		<Spaltename>	<DATENTYP>,
		CONSTRAINT		<PKNAME> PRIMARY KEY (<SPALTENNAME>)
	);
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE PKEinfach (IDPkEinfach INT PRIMARY KEY);

	CREATE TABLE PKSpalte (IDPKSpalte INT CONSTRAINT PK_PKSpalte_IDPKSPALTE PRIMARY KEY);

	CREATE TABLE PKTabelle 
	(
		IDPKTabelle	INT,
		CONSTRAINT	PK_PKTabelle_IDPKTabelle PRIMARY KEY (IDPKTabelle)
	);

----------------------------- FOREIGN KEY ---------------------------------------
/*	
	Verweist auf den P-Key einer anderen Tabelle.Muss in der Referenztabelle vorhanden 
	sein. Null werte sind erlaubt (Explizit NULL). 
	Cascadierung ist möglich (Änderung- Löschweitergabe).
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE TABLE <TabellenName> 
	(
		<SPALTENNAME>	<DATENTYP>,
		
		CONSTRAINT	<FKNAME>	FOREIGN KEY (<SPALTENNAME>) 
								REFERENCES <NAMEREFERENZTABELLE>(<NAMEREFERENZSPALTE>)
	);
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE FKTabelleReferenz 
	(
		IDFKTabelleReferenz	INT,
		CONSTRAINT	PK_FKTabelleReferenz_IDFKTabelleReferenz PRIMARY KEY (IDFKTabelleReferenz)
	);

	CREATE TABLE FKTabelle 
	(
		IDFKTabelleReferenz	INT,
		
		CONSTRAINT FK_FKTabelle_IDFKTabelleReferenz FOREIGN KEY (IDFKTabelleReferenz) 
													REFERENCES FKTabelleReferenz(IDFKTabelleReferenz)
	);

-------------------------------- CHECK ------------------------------------------
/*	
	Werte werden auf Gültigkeit geprüft bevor diese eingefügt werden.
	Verweist auf die Inhalte des selben Datensatzes. Kein verweis auf andere 
	Datensätze / Tabellen.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	CREATE TABLE <TABLENAME> 
	(
		<SPALTENNAME>	<DATENTYP>,
		
		CONSTRAINT <CKNAME> CHECK (<SPALTENNAME> > 1000 )
	);
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE CKTabelle 
	(
		PLZ	INT,
		
		CONSTRAINT CK_CKTabelle_PLZ CHECK (PLZ > 1000 )
	);
	
	-- FEHLER
	INSERT CKTabelle VALUES (1000);
	
	-- Kein Fehler
	INSERT CKTabelle VALUES (1001);
	
	SELECT * FROM CKTabelle;

------------------------------ ADD CONSTRAINT -----------------------------------
/*	
	Einschränkungen können auch nach der Tabelle Definition eingefügt werden.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	ALTER TABLE	<TABLENAME> ADD	CONSTRAINT <CONSTRAINNAME> CHECK (<BEDINGUNG>) );
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE AddConTabelle 
	(
		AddConTabelleName		VARCHAR(10),
	);

	ALTER TABLE	AddConTabelle 
	ADD CONSTRAINT CK_AddConTabelle_AddConTabelleName 
	CHECK ( ( LEN(AddConTabelleName)  > 2 ) );

	-- Fehler:
	INSERT AddConTabelle VALUES ('Ja');

	-- Kein Fehler
	INSERT AddConTabelle VALUES ('Jam');

	SELECT * FROM AddConTabelle;

---------------------------- DROP - CONSTRAINT ----------------------------------
/*	
	Einschränkungen können auch nach der Tabelle Definition gelöscht werden.
*/
------------------------------- SYNTAX ------------------------------------------
/*
	ALTER TABLE	<TabellenName> DROP CONSTRAINT <CONSTRAINNAME>;
*/
------------------------------- EXAMPLE -----------------------------------------

	CREATE TABLE DropConTabelle 
	(
		PLZ	INT,
		
		CONSTRAINT CK_DropConTabelle_PLZ CHECK (PLZ > 1000 )
	);
	
	-- Fehler
	INSERT DropConTabelle VALUES (1000);

	-- kein Fehler
	INSERT DropConTabelle VALUES (1005);

	ALTER TABLE	DropConTabelle DROP CONSTRAINT CK_DropConTabelle_PLZ;
	
	INSERT DropConTabelle VALUES (564);
	
	SELECT * FROM DropConTabelle;