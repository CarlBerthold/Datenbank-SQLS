CREATE DATABASE UebungDB;

use UebungDB;
CREATE TABLE Persons (
PersonID INTEGER auto_increment NOT NULL,
Vorname VARCHAR(20), 
Nachname VARCHAR(20),

CONSTRAINT		PK_PersonsID
PRIMARY KEY 	(PersonID)

);

ALTER TABLE Persons ADD COLUMN Titel VARCHAR(20);

ALTER TABLE Persons ADD CONSTRAINT UQ_Title_length CHECK (CHAR_LENGTH(Titel) >= 3);

INSERT INTO Persons (Vorname, Nachname, Titel) 
values ('Carl', 'Berthold', 'violated');

INSERT INTO Persons (Vorname, Nachname, Titel) 
values ('Eva', 'Knuts', 'prof.');

INSERT INTO Persons (Vorname, Nachname, Titel) 
values ('Ava', 'Schramm', 'Senior');


Select * 
From Persons, addressen;





