USE Sakila;

show tables;

select DISTINCT first_name from customer;

select last_name from customer;


select first_name as 'Vorname'
from customer;

select last_name as 'Nachnahme' 
from customer;