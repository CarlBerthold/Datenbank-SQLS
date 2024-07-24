--------------------------------------------------------------------------------
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
	Bitte aktualisieren Sie die Tabelle Person so, dass gar keine Leerwerte 
	mehr vorhanden sind.
*/
------------------------------- LOESUNG - 1 --------------------------------------

	BEGIN TRAN

	-- find all the columns in Person.Person which are can be NULL NULLABLE
	SELECT 
    COLUMN_NAME
	FROM 
		INFORMATION_SCHEMA.COLUMNS
	WHERE 
		TABLE_NAME = 'Person'
		AND IS_NULLABLE = 'YES';

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte Ändern Sie alle „Middlename“ die nicht ausgeschrieben sind, in einem 
	Leerstring um.
*/
------------------------------- LOESUNG - 2 --------------------------------------
	
	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte Ändern Sie in der Tabelle Adress alle Leerwerte in einen Leerstrings um. 
*/
------------------------------- LOESUNG - 3 --------------------------------------

	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte fügen Sie in Datenbank 5 neue Personen inklusive Ihrer Adresse ein. 
*/
------------------------------- LOESUNG - 4 --------------------------------------


	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 5 -------------------------------------
/*	
	Bitte erzeugen Sie drei neue Mitarbeiter mit Ihren Logins in der Datenbank.
*/
------------------------------- LOESUNG - 5 --------------------------------------

	
	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 6 -------------------------------------
/*	
	Bitte Simulieren Sie das Überschreiben aller Firstname, Lastname und 
	Middlename der Tabelle  Person als Transaktion und Verwerfen diese wieder. 
*/
------------------------------- LOESUNG - 6 --------------------------------------

	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT
	
------------------------------- AUFGABE - 7 -------------------------------------
/*	
	Bitte Löschen Sie alle Einträge der Tabelle SalesPersonQuotaHistory, 
	deren SalesPerson keinen Bonus Eintrag haben. 
*/
------------------------------- LOESUNG - 7 --------------------------------------

	BEGIN TRAN

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

	ROLLBACK
	-- COMMIT