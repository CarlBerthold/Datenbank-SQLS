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
	 DML - Lesend auf die Datenbank zugreifen.
*/
------------------------------- AUFGABE - 1 -------------------------------------
/*	
	1.	Bitte erzeugen eine Datenbank dessen Name ein Leerzeichen hat.
	2.	Wechseln Sie zu dieser Datenbank.
	3.	Loeschen Sie die Datenbank wieder.
	4.	Wechseln Sie im Anschlussn auf die AdventureWorks Datenbank.
*/
------------------------------- LOESUNG - 1 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person nur alle eindeutige FirstName aus.
*/
------------------------------- LOESUNG - 2 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person nur alle einedeutigen LastName aus.	
*/
------------------------------- LOESUNG - 3 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	
------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person alle FirstName mit dem Alias "Vorname"
	aus.
*/
------------------------------- LOESUNG - 4 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 5 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person alle LastName mit dem Alias "Nachname"
	aus.
*/
------------------------------- LOESUNG - 5 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 6 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person alle FirstName Aufsteigend und alle 
	LastName Absteigend aus.
*/
------------------------------- LOESUNG - 6 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
