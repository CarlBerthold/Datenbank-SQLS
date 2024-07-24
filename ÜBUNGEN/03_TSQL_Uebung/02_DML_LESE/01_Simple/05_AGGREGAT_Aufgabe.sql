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
	Bitte geben Sie dei Anzahl der eindeutige FirstName aus der Tabelle Person aus.
*/
------------------------------- LOESUNG - 1 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
	
------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte geben Sie alle Personen, deren Vornamen und Nachnamen mehr als
	viermal in der Datenbank vorkommen aus. 
*/
------------------------------- LOESUNG - 2 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte geben Sie alle Personen, deren Vornamen und Nachnamen mehr als
	zweimal und deren FirstName mit einem "S" oder einem "B" beginnen aus.
*/
------------------------------- LOESUNG - 3 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
