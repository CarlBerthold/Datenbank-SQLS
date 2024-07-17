show tables;

select * from actor;
select * from film_actor;
select * from film;
select * from address;
select * from language;
select * from staff;
select * from actor_info;

select
    a.first_name AS 'schauspielerVorname', 
    a.last_name AS 'SchauspielerNachname', 
    f.title AS 'FilmTitel'
From
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id;


select 
    a.first_name AS 'schauspielerVorname',
    a.last_name AS 'SchauspielerNachname', 
    f.title AS 'FilmTitel',
    category AS 'Kategorie'
from 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id
JOIN 
    film_category fc ON f.film_id = fc.film_id;

select 
f.title AS 'title',
l.name AS 'sprache'
from film AS f
JOIN language l ON f.language_id = l.language_id;



select
    s.first_name AS 'Vorname',
    s.last_name AS 'Nachname',
    a.address AS 'Strasse',
    a.district AS 'Bezirk',
    a.postal_code AS 'PLZ',
    a.phone AS 'Telefon',
    ci.city AS 'Stadt',
    co.country AS 'Land'
FROM 
    staff s
JOIN 
    address a ON s.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    country co ON ci.country_id = co.country_id;





select 
    f.title AS 'FilmTitel',
    l.name AS 'Sprache',
    a.first_name AS 'SchauspielerVorname',
    a.last_name AS 'SchauspielerNachname',
    f.description AS 'FilmBeschreibung',
    f.release_year AS 'Erscheinungsjahr',
    c.name AS 'Kategorie'
FROM 
    film f
JOIN 
    language l ON f.language_id = l.language_id
JOIN 
    film_actor fa ON f.film_id = fa.film_id
JOIN 
    actor a ON fa.actor_id = a.actor_id
JOIN 
    film_category fc ON f.film_id = fc.film_id
JOIN 
    category c ON fc.category_id = c.category_id;



select 
    s.first_name AS 'Vorname',
    s.last_name AS 'Nachname',
    home_address.address AS 'Wohnadresse',
    work_address.address AS 'Arbeitsadresse'
FROM 
    staff s
JOIN 
    address home_address ON s.address_id = home_address.address_id
JOIN 
    store ON s.store_id = store.store_id
    # need to join address again for workadress
JOIN 
    address work_address ON store.address_id = work_address.address_id;