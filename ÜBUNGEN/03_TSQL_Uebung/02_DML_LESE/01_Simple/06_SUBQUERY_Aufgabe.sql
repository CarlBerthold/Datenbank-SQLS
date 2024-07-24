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
	Bitte geben Sie die Namen der Mitarbeiter, die im Jahr 2011 eingestellt 
	worden sind aus. 
*/
------------------------------- LOESUNG - 1 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
