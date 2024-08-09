use sakila;
-- ----------------------------- AUFGABE - 1 ---------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer nur alle eindeutige First_Name aus.
*/

	select	disticnt First_Name
	from	customer;

-- ----------------------------- AUFGABE - 2 ---------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer nur alle einedeutigen Last_Name aus.	
*/

	select distinct last_name
	from customer;


-- ----------------------------- AUFGABE - 3 ---------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer alle First_Name mit dem Alias "Vorname"
	aus.
*/

	select  	first_name		as Vorname 
	from 		customer;


-- ----------------------------- AUFGABE - 4 ---------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer alle LastName mit dem Alias "Nachname"
	aus.
*/

	select 	last_name Nachname 
	from 	customer;
	

-- ----------------------------- AUFGABE - 5 ---------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer alle First_Name Aufsteigend und alle 
	Last_Name Absteigend aus.
*/

	select 		first_name
				,last_name
	from 		Customer
	order by 	first_name asc, last_name desc;


-- ----------------------------- AUFGABE - 6 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer nur die First_Name, deren First_Name
    "Gloria" ist/sind aus.
*/

	select 	first_name
	from	customer
	where 	First_Name 	like 	'Gloria';

-- ----------------------------- AUFGABE - 7 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer nur die First_Name und Last_name, deren
	Customer_ID groesser ist als 200 aber kleiner ist als 300 aus.
*/

	select 	first_name
			,last_name
	from	customer
	where 	customer_id > 200
	and	 	customer_id < 300; 

-- ----------------------------- AUFGABE - 8 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer nur die First_Name, deren First_Name auf
	"na"- enden aus.
*/

	select 	first_name 
	from 	customer 
	where 	first_name like '%na';

-- ----------------------------- AUFGABE - 9 -------------------------------------
/*	
	Bitte geben Sie bei der Tabelle Customer nur die First_Name, deren email
	mit  "b" beginnt aus.
*/

	select First_Name
	from Customer
	where Email like 'b%';


-- ----------------------------- AUFGABE - 10 ------------------------------------
/*	
	Bitte geben Sie alle Personen  relevanten Informationen aus der Customer Tabelle
	als eine einzige Zeichenkette aus.
*/

	select 
	concat	(
				'Vorname: ', first_name, '\n',
				'Nachname: ', last_name, '\n',
				'Email:'	, email, '\n'
			) 	as customer_info
	from Customer;


-- ----------------------------- AUFGABE - 11 ------------------------------------
/*	
	Bitte geben Sie aus der Tabelle Customer alle First_Name Rueckwerts aus.
*/

	select reverse(first_name) 
	from customer;


-- ----------------------------- AUFGABE - 12 ------------------------------------
/*	
	Bitte geben Sie aus der Tabelle Customer alle Vorname in grossbuchstaben aus.
*/

	select 	upper(first_name) 
    from 	customer;

-- ----------------------------- AUFGABE - 13 ------------------------------------
/*	
	Bitte geben Sie aus der Tabelle Customer alle Vorname in kleinbuchstaben aus.
*/

	select lower(first_name) 
    from customer;
    

-- ----------------------------- AUFGABE - 14 ------------------------------------
/*	
	Bitte geben Sie dass aktuelle Datum im Deutschen Format aus.
*/

	select date_format(NOW(), '%d.%m.%Y') as deutsches_datum;
 