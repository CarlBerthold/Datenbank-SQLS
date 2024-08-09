---------------------------------------------------------------------------------
------ RUN CODE (Change Context / Autorization  DATABASE - LINE 3-9) ------------
	--PRINT 'Changing Database Context "AdventureWorks"';
	--USE AdventureWorks;
	--GO
	
	--PRINT 'Changing Autorization to "SA"';
	--ALTER AUTHORIZATION ON DATABASE:: AdventureWorks TO [sa];
	--GO
------------------------------- Ausdruecke --------------------------------------
/*	
	Ausdruecke koennen Berechnungen durchfuehren, mit Zeichenketten arbeiten und 
	Funktionen verwenden:

		- Ausdruck mit einem konstanten Wert.
		- Bildung von Ausdrücken durch Verkettung.
		- String Funktionen
		- Datums Funktionen
		- Mathematische Funktionen
*/
---------------------------- konstanten Wert ----------------------------------------
	
	SELECT 333;
	
	SELECT @@VERSION;
	
	SELECT GETDATE()								AS 'Aktuelles Datum/ Uhrzeit',
		   DATEDIFF(YEAR, '1971-12-18', GETDATE())	AS 'Zeitspanne',
		   @@SERVERNAME								AS 'Name des Servers';

------------------------------- Verkettung --------------------------------------

	SELECT	p.FirstName + ' ' + p.LastName			AS 'Verkettung mit dem Plus-Operator'
			,CONCAT(p.FirstName, ' ', p.LastName)	AS 'Verkettung mit einer String-Funktion'
	FROM	Person.Person							AS p;

----------------------------- String Funktionen ---------------------------------

	SELECT	p.FirstName							AS 'Vorname'
			,LEN(p.FirstName)					AS 'Laenge des Strings'
			,REVERSE(p.FirstName)				AS 'Name Rueckwaerts'
			,UPPER(p.FirstName)					AS 'Name in grossbuchstaben'
			,LOWER(p.FirstName)					AS 'Name in kleinbuchstaben'
			,LEFT(p.FirstName, 2)				AS 'ersten beiden Buchstaben'
			,RIGHT(p.FirstName, 2)				AS 'letzen beiden Buchstaben'
			,SUBSTRING(p.FirstName, 2, 2)		AS 'zwei Buchstaben aus dem Namen'
	FROM	Person.Person						AS p;

----------------------------- Datums Funktionen --------------------------------- 

	SELECT GETDATE();
	
	SELECT DATEADD(M,2,Getdate());
	
	SELECT DATEDIFF(M, '01-01-1900', GETDATE());
	
	SELECT CONVERT(varchar, GetDate(), 104)		AS 'DEUTSCHES DATUM';
	
	SELECT CONVERT(varchar, GetDate(), 113)		AS 'DEUTSCHES DATUM';
	
	SELECT FORMAT(GETDATE(), 'dd.MM.yyyy.hh.mm.ss')		AS 'DEUTSCHES DATUM';

-------------------------- Mathematische Funktionen -----------------------------
	
	SELECT POWER(5,3);
	
	SELECT SQRT(25);
	
	SELECT RAND() * 100;
	
	SELECT PI();
	
	SELECT ROUND(3.495, 2);		-- rechte Seite
	
	SELECT ROUND(13.495, -2);	-- linke Seite