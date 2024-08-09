use sakila;
-- ----------------------------- AUFGABE - 1 ---------------------------------------
/*	
	1.	Welcher Schauspieler hat welchen Film gemacht?
	
    Bitte verwenden Sie dazu die folgenden Tabellen:
		-	film
		-	film_actor
		-	actor
*/

	select 	f.title					as 'Titel'
			,concat(
						a.first_name
                        , ' '
						,a.last_name
                    )				as 'Name'
	from 	film					as f
    join 	film_actor				as fa
    on 		f.film_id = fa.film_id
    join	actor					as a
    on		fa.actor_id	= a.actor_id;
    

-- ----------------------------- AUFGABE - 2 ---------------------------------------
/*	
	2.	Welcher Schauspieler hat welchen Film gemacht und vor allem welcher Kategorie gehört dieser Film an?
		Bitte verwenden Sie dazu die folgenden Tabellen:
		-	film
		-	film_actor
		-	actor
		-	film_category
		-	category
*/

	select 	*
	from 	film							as f
    join 	film_actor						as fa
    on 		f.film_id = fa.film_id
    join	actor							as a
    on		fa.actor_id	= a.actor_id
	join	film_category					as fc
	on		fc.film_id = f.film_id
    join	category						as	c
    on		c.category_id =	fc.category_id;


-- ----------------------------- AUFGABE - 3 ---------------------------------------
/*	
	3.	Bitte geben Sie aus welchem Film in welche Sprache gedreht wurde. 
		Bitte verwenden Sie dazu die folgenden Tabellen:
        -	film
		-	language
*/

	select 	*
	from 	film							as f
    join 	language						as l
    on 		f.language_id = l.language_id;


-- ----------------------------- AUFGABE - 4 ---------------------------------------
/*	
		4.	Bitte geben Sie bei von den Mitarbeitern den First_Name, den Last_Name als auch die Adresse aus.
		Bitte verwenden Sie dazu die folgenden Tabellen:
		-	Staff
		-	Address
*/

	select 	*
	from 	Staff							as s
    join 	Address							as a
    on 		a.address_id = s.address_id;
		-	

-- ----------------------------- AUFGABE - 5 ---------------------------------------
/*	
	5.	Bitte geben Sie von den Mitarbeitern den First_Name, den Last_Name als Namen sowie die vollständige Adresse mit dem Land und der Stadt aus.
		Bitte verwenden Sie dazu die folgenden Tabellen:
		-	Staff
		-	Address
		-	City
		-	Country
*/

-- ----------------------------- AUFGABE - 6 -------------------------------------
/*	
	6.	Bitte geben Sie alle Daten die Sie über einen Film oder einen Schauspieler finden können aus.  

	Zusatzaufgabe:

		Bitte geben Sie bei von den Mitarbeitern den First_Name, den Last_Name als auch die Wohnadresse und die Arbeitsadresse aus.

		Bitte verwenden Sie dazu die folgenden Tabellen:
			-	Staff
			-	Address
			-	Store
*/
