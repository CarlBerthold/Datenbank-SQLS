USE Sakila;

show tables;

select DISTINCT first_name from customer;

select last_name from customer;


select first_name as 'Vorname'
from customer;

select last_name as 'Nachnahme' 
from customer;

select first_name as 'Vorname',last_name as 'nachname'
from customer
ORDER BY first_name, last_name DESC;

select first_name as 'Vorname'
from customer as c
where c.last_name 
like 'CLARY';


select 
first_name as 'Vorname'
,last_name as 'Nachname'
from customer as c
where c.customer_id between 200 and 300;



select 
first_name as 'vorname',
last_name as 'nachname'
from customer as c
where c.first_name like '%na';

select 
first_name as 'vorname'
from customer as c
where c.first_name like 'b%';

select 
CONCAT('Vorname: ',first_name,' Nachname: ',last_name,' Email: ', email) as 'Name'
from customer as c;

select 
REVERSE(first_name) as 'reversed_first_name'
from customer;

Select UPPER(first_name) as 'Upper_first_name'
from customer;

Select LOWER(first_name) as 'Upper_first_name'
from customer;

SELECT DATE_FORMAT(CURDATE(), '%d.%m.%Y') AS 'DE_Aktuelles_Datum';