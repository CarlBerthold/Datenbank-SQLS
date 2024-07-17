-- -------------------------- Erzeugen Tabellen ------------------------------------------
create database JoinsDB;
use JoinsDB;

-- STUDENT -------------------------------------------------------------------
create table student
(
	IDstudent		int			auto_increment
	,Vorname 		varchar(30) not null
    ,Name			varchar(30) not null
    
    ,constraint primary key(IDstudent)
);

insert student 	(	Vorname	,Name		)
values			(	'Ulf'	,'Mueller'	);

insert student 	(	Vorname	,Name		)
values			(	'Jenny'	,'Hampy'	);

insert student 	(	Vorname	,Name		)
values			(	'Ali'	,'Mehmet'	);

insert student 	(	Vorname	,Name		)
values			(	'Maria'	,'James'	);

insert student 	(	Vorname	,Name		)
values			(	'Hannelore'	,'Dany'	);

insert student 	(	Vorname	,Name		)
values			(	'Aiche'	,'Omur'	);

-- Kurs ---------------------------------------------------------------------
create table Kurs
(
	IDKurs 			int 			auto_increment
    ,Bezeichnung	varchar(30) 	not null
    ,Thema			varchar(30) 	not null
    
    , constraint primary key (IDKurs)
);

insert Kurs 	(	Bezeichnung	,	Thema	 )
values			(	'DBS'		,	'keys');

insert Kurs 	(	Bezeichnung	,	Thema	 )
values			(	'Prog'		,	'DT');

insert Kurs 	(	Bezeichnung	,	Thema	 )
values			(	'OOP'		,	'Objekte');

insert Kurs 	(	Bezeichnung	,	Thema	 )
values			(	'WISO'		,	'RW');

insert Kurs 	(	Bezeichnung	,	Thema	 )
values			(	'Chemie'		,	'AC');

-- StudentKurs ---------------------------------------------------------------
create table StudentKurs
(	
	IDStudent	int		not null
    ,IDKurs		int		not null
    
    , constraint foreign key (IDStudent) 	references Student(IDStudent)
    , constraint foreign key (IDKurs)		references Kurs(IDKurs)
);

insert studentkurs	(	IDStudent	,	IDKurs	)
values				(	1			, 	2		);

insert studentkurs	(	IDStudent	,	IDKurs	)
values				(	1			, 	1		);

insert studentkurs	(	IDStudent	,	IDKurs	)
values				(	2			, 	2 		);

insert studentkurs	(	IDStudent	,	IDKurs	)
values				(	3			, 	3		);


-- -------------------- SELECT ---------------------------------------------------
select 	IDStudent
from 	student;

select 	IDStudent
		,IDKurs
from 	StudentKurs;

select 	IDKurs
from 	Kurs;


-- -------------------- Joins / Verbunde / Verlinkung ----------------------------
/*	
	In Relationale – DBS sind die Daten auf verschiedene Tabellen verteilt, die 
	miteinander in Beziehung stehen.

	Um die Daten wieder zusammen zu setzten muss ich über diese Tabellen joinen (linken).

	Joins Varianten:
	-	CROSS			JOIN
	-	INNER			JOIN
	-	LEFT			JOIN
	-	RIGHT			JOIN
*/
-- ----------------- 90's JOIN // ANSI 89's JOIN ---------------------------------
/*
	Früher wurde über die WHERE- Klausel gejoint. 
	
	--> Es ist heutzutage veraltet (deprecated).
*/
-- ------------------------- EXAMPLE (INNER) -------------------------------------

select 		*
from 		student 			as 	s
			,studentkurs 		as	sk
            ,kurs				as	k
where		s.idstudent 		= 	sk.idstudent
and			sk.idkurs			=	k.idkurs; 


-- --------------------------- Kreuzprodukt -------------------------------------
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
-- -------------------------- EXAMPLE - OHNE WHERE -------------------------------
	
select 		*
from 		student 			as 	s
			,studentkurs 		as	sk
			,kurs				as	k;
            
-- ------------------------- EXAMPLE - WHERE -------------------------------------

select 		*
from 		student 			as 	s
			,studentkurs 		as	sk
            ,kurs				as	k
where		s.idstudent 		= 	sk.idstudent
and			sk.idkurs			=	k.idkurs; 
            

-- -------------------------- EXAMPLE - CROSS JOIN --------------------------------

select 		*
from 		student 			as 	s
cross join	studentkurs 		as	sk
cross join	kurs				as	k;


-- --------------------------- INNER - JOIN --------------------------------------
/*
	Innere Schnittmenge von zwei Mengen / Tabellen.
*/
-- -------------------------- EXAMPLE - INNER JOIN --------------------------------

select 		*
from 		student 			as 	s
inner join	studentkurs 		as	sk
on			s.idstudent 		= 	sk.idstudent
inner join	kurs				as	k
on			sk.idkurs			= 	k.idkurs;

-- ------------------- EXAMPLE - JOIN (INNER - OPTIONAL) --------------------------

select 		*
from 		student 			as 	s
join		studentkurs 		as	sk
on			s.idstudent 		= 	sk.idstudent
join		kurs				as	k
on			sk.idkurs			= 	k.idkurs; 


-- -------------------------- LEFT OUTER JOIN --------------------------------------
/*
	Die Informationen von der Linken Tabellen ohne die Rechte Tabelle.
*/
-- ------------------------- EXAMPLE - LEFT OUTER JOIN -----------------------------

select 				*
from 				student 			as 	s	 
left outer join 	studentkurs 		as	sk
on					s.idstudent 		= 	sk.idstudent
left outer join		kurs				as	k
on					sk.idkurs			= 	k.idkurs; 	


-- ------------------ EXAMPLE - LEFT JOIN (OUTER - OPTIONAL) -----------------------------
	
select 		*
from 		student 			as 	s	 
left join 	studentkurs 		as	sk
on			s.idstudent 		= 	sk.idstudent
left join	kurs				as	k
on			sk.idkurs			= 	k.idkurs; 


-- ---------------- EXAMPLE - LEFT JOIN - OHNE SCHNITTMENGE -----------------------------

select 		*
from 		student 			as 	s	 
left join 	studentkurs 		as	sk
on			s.idstudent 		= 	sk.idstudent
left join	kurs				as	k
on			sk.idkurs			= 	k.idkurs
where		sk.idstudent 	is null;

-- -------------------------- RIGHT OUTER JOIN --------------------------------------
/*
	Die Informationen von der Rechten Tabellen ohne die Linke Tabelle.
*/
-- ------------------------- EXAMPLE - RIGHT OUTER JOIN -----------------------------

select 				*
from 				student 			as 	s	 
right outer join	studentkurs 		as	sk
on					s.idstudent 		= 		sk.idstudent
right outer join	kurs				as	k
on					sk.idkurs			= 	k.idkurs;


-- ------------------ EXAMPLE - RIGHT JOIN (OUTER - OPTIONAL) -----------------------------
	
select 		*
from 		student 			as 	s	 
right join 	studentkurs 		as	sk
on			s.idstudent 		= 	sk.idstudent
right join	kurs				as	k
on			sk.idkurs			= 	k.idkurs;


-- ---------------- EXAMPLE - RIGHT JOIN - OHNE SCHNITTMENGE -----------------------------

select 		*
from 		student 			as 	s	 
right join 	studentkurs 		as	sk
on			s.idstudent 		= 	sk.idstudent
right join	kurs				as	k
on			sk.idkurs			= 	k.idkurs
where		s.idstudent 	is null;