---------------------------------------------------------------------------------
------ RUN CODE (Change Context / Autorization  DATABASE - LINE 3-9) ------------
	PRINT 'Changing Database Context "AdventureWorks"';
	USE AdventureWorks;
	GO
	
	PRINT 'Changing Autorization to "SA"';
	ALTER AUTHORIZATION ON DATABASE:: AdventureWorks TO [sa];
	GO
---------------------- Joins / Verbunde / Verlinkung ----------------------------
/*	
	In Relationale – DBS sind die Daten auf verschiedene Tabellen verteilt, die 
	miteinander in Beziehung stehen.

	Um die Daten wieder zusammen zu setzten muss ich über diese Tabellen joinen (linken).

	Joins Varianten:
	-	CROSS			JOIN
	-	INNER			JOIN
	-	LEFT			JOIN
	-	RIGHT			JOIN
	-	FULL OUTER		JOIN

*/
------------------- 90's JOIN // ANSI 89's JOIN ---------------------------------
/*
	Früher wurde über die WHERE- Klausel gejoint. 
	
	--> Es ist heutzutage veraltet (deprecated).
*/
--------------------------- EXAMPLE (INNER) -------------------------------------

	SELECT	*
	FROM	Person.Person					AS p 
			,HumanResources.Employee		AS e
	WHERE	e.BusinessEntityID		=		p.BusinessEntityID;
 
----------------------------- Kreuzprodukt -------------------------------------
/*
	Das kartesische Produkt oder Mengenprodukt ist in der Mengenlehre eine 
	grundlegende Konstruktion, aus gegebenen Mengen eine neue Menge zu erzeugen. 
	Das kartesische Produkt zweier Mengen ist die Menge aller geordneten Paare 
	von Elementen der beiden Mengen, wobei die erste 
	Komponente ein Element der ersten Menge und die zweite Komponente ein Element 
	der zweiten Menge ist. 
	
	--> Das Ergebnis wird genannt:
			-	Produktmenge
			-	Kreuzmenge 
			-	Verbindungsmenge

	--> Wenn wir zwei Tabellen name ohne eine Where- Klausel schreiben, dann 
		erhalten wir immer das kartesische Produkt.
	
	--> Das erreichen wir auch mit dem Schlagwort CROSS JOIN
*/
---------------------------- EXAMPLE - OHNE WHERE -------------------------------
	
	SELECT	*
	FROM	Person.Person				AS p 
			,HumanResources.Employee	AS e;

---------------------------- EXAMPLE - CROSS JOIN --------------------------------

	SELECT		 *
	FROM		Person.Person					AS p
	CROSS JOIN	HumanResources.Employee			AS e;

----------------------------- INNER - JOIN --------------------------------------
/*
	Innere Schnittmenge von zwei Mengen / Tabellen.
*/
--------------------------- EXAMPLE - WHERE -------------------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person				AS p
				,HumanResources.Employee	AS e

	WHERE		p.BusinessEntityID			=		e.BusinessEntityID;

--------------------------- EXAMPLE - INNER JOIN --------------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person				AS p

	INNER JOIN	HumanResources.Employee		AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID;

--------------------- EXAMPLE - JOIN (INNER - OPTIONAL) --------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person				AS p

	JOIN		HumanResources.Employee		AS e

	ON			p.BusinessEntityID				=		e.BusinessEntityID;

---------------------------- LEFT OUTER JOIN --------------------------------------
/*
	Die Informationen von der Linken Tabellen ohne die Rechte Tabelle.
*/
--------------------------- EXAMPLE - LEFT OUTER JOIN -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		LEFT OUTER JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID;

-------------------- EXAMPLE - LEFT JOIN (OUTER - OPTIONAL) -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		LEFT JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID;

------------------ EXAMPLE - LEFT JOIN - OHNE SCHNITTMENGE -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		LEFT JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID
	
	WHERE		e.BusinessEntityID			IS NULL;

---------------------------- RIGHT OUTER JOIN --------------------------------------
/*
	Die Informationen von der Rechten Tabellen ohne die Linke Tabelle.
*/
--------------------------- EXAMPLE - RIGHT OUTER JOIN -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		RIGHT OUTER JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID;

-------------------- EXAMPLE - RIGHT JOIN (OUTER - OPTIONAL) -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		RIGHT JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID;

------------------ EXAMPLE - RIGHT JOIN - OHNE SCHNITTMENGE -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		RIGHT JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID
	
	WHERE		p.BusinessEntityID			IS NULL;

---------------------------- FULL OUTER JOIN --------------------------------------
/*
	Die Informationen von der Rechten und der Linken Tabelle.
*/
--------------------------- EXAMPLE - FULL OUTER JOIN -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		FULL OUTER JOIN			HumanResources.Employee AS e

	ON			p.BusinessEntityID			=		e.BusinessEntityID;

-------------------- EXAMPLE - FULL JOIN (OUTER - OPTIONAL) -----------------------------
	
	SELECT		p.FirstName					AS Vorname
				,p.LastName					AS Nachname
				,p.BusinessEntityID			AS PID
				,e.BusinessEntityID			AS EID
				,e.JobTitle					AS Taetigkeit
	
	FROM		Person.Person AS p		FULL JOIN			HumanResources.Employee AS e

	ON		p.BusinessEntityID				=		e.BusinessEntityID;