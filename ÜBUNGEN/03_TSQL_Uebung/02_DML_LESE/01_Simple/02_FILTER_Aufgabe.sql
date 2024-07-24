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
	Bitte geben Sie bei der Tabelle Person nur die FirstName, deren Namen "Jean"
	sind aus.
*/
------------------------------ LOESUNG - 1 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 2 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person nur die FirstName und Lastname, deren
	BusinessEntityID groesser ist als 3500 aber kleienr ist als 10000 aus.
*/
------------------------------ LOESUNG - 2 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 3 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person nur die FirstName, deren FirstName auf
	"ica"- enden aus.
*/
------------------------------ LOESUNG - 3 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!

------------------------------- AUFGABE - 4 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Person nur die FirstName, deren MiddleName
	nicht "null" ist aus.
*/
------------------------------ LOESUNG - 4 --------------------------------------

	-- Bitte loeschen Sie diese Zeile und tragen Sie stattdessen Ihre Loesung ein!
