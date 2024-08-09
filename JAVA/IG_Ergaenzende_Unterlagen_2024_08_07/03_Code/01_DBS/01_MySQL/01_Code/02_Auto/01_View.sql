select 	a.first_name	as	'Vorname'
  		,a.last_name	as	'Nachname'
from 	actor			as a;


-- View erzeugen --------------------------------------------
create view 	wert 	as 

select 	a.first_name	as	'Vorname'
  		,a.last_name	as	'Nachname'
from 	actor			as a
order by first_name ;

-- View verwenden -------------------------------------------
select 	*
from 	wert;

-- View veraendern ------------------------------------------
create or replace view 	vSchauspieler 	as 

select 	lower(a.first_name)	as	'Vorname'
  		,lower(a.last_name)	as	'Nachname'
from 	actor			as a;

select 	*
from 	vschauspieler;