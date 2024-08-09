
select  *
from 	actor			as a
where	a.first_name 	like 'nick';


-- Stored Proceure ------------------------------------------
DELIMITER //
create procedure uspActor( paraFirst varchar(30), paraLast varchar(30))
BEGIN 
        insert into Actor	(first_name,last_name,last_update)
        values				(paraFirst,paraLast,curdate());
        
        select 	a.first_name	as	'Vorname'
				,a.last_name	as	'Nachname'
		from 	actor			as a;
END //
DELIMITER ;

call uspActor('sssssssss','dsadasdasdasd');