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

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte Loeschen Sie die zuvor eingefügten Telfonnummern aus der Aufgabe 1. 
*/
------------------------------- LOESUNG - 2 --------------------------------------

	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte aktualisieren Sie alle Middelname inder Tabelle Person, die "null" sind,
	auf einen Leerstring.
*/
------------------------------- LOESUNG - 3 --------------------------------------
	
	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT

------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte fuegen Sie in der Tabelle BusinessEntity einen neuen Datensatz ein.
*/
------------------------------- LOESUNG - 4 --------------------------------------

	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT

------------------------------- AUFGABE - 5 -------------------------------------
/*	
	Bitte Loeschen Sie den zuvor engfügten Datensatz aus der Tabelle BusinessEntity.
*/
------------------------------- LOESUNG - 5 --------------------------------------

	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT