USE Sakila;
-- ----------------------------- Ausdruecke --------------------------------------
/*	
	Ausdruecke koennen Berechnungen durchfuehren, mit Zeichenketten arbeiten und 
	Funktionen verwenden:

		- Ausdruck mit einem konstanten Wert.
		- Bildung von Ausdrücken durch Verkettung.
		- String Funktionen
		- Datums Funktionen
		- Mathematische Funktionen
*/
-- ------------------------- konstanten Wert ----------------------------------------
	
	SELECT 333;
	
	SELECT @@VERSION;
	
	SELECT NOW()								AS 'Aktuelles Datum/ Uhrzeit',
		   DATEDIFF(	NOW()	,'2024-07-01')	AS 'Zeitspanne';

-- ----------------------------- Verkettung --------------------------------------

	SELECT	CONCAT(a.First_Name, ' ', a.Last_Name)	AS 'Verkettung mit einer String-Funktion'
	FROM	Actor									AS a;

-- --------------------------- String Funktionen ---------------------------------

	SELECT	First_Name							AS 'Vorname'
			,LENGTH(First_Name)					AS 'Laenge des Strings'
			,REVERSE(First_Name)				AS 'Name Rueckwaerts'
			,UPPER(First_Name)					AS 'Name in grossbuchstaben'
			,LOWER(First_Name)					AS 'Name in kleinbuchstaben'
			,LEFT(First_Name, 2)				AS 'ersten beiden Buchstaben'
			,RIGHT(First_Name, 2)				AS 'letzen beiden Buchstaben'
			,SUBSTRING(First_Name, 2, 2)		AS 'zwei Buchstaben aus dem Namen'
	FROM	Actor;

----------------------------- Datums Funktionen --------------------------------- 

	SELECT CURDATE();
	
	SELECT DATE_ADD("2017-06-15", INTERVAL 20 DAY);
	
	SELECT DATEDIFF('2023-01-01', NOW());
	

-------------------------- Mathematische Funktionen -----------------------------
	
	SELECT POWER(5,3);
	
	SELECT SQRT(25);
	
	SELECT RAND() * 100;
	
	SELECT PI();
	
	SELECT ROUND(3.495, 2);
	
	SELECT ROUND(13.495, -2);