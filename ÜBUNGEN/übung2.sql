CREATE TABLE Adressen (
AdresseID INTEGER PRIMARY KEY AUTO_INCREMENT,
Strasse VARCHAR(100),
Hausnummer VARCHAR(5),
PLZ INTEGER(5),
Ort VARCHAR(50),
PersonID INT

);


INSERT INTO Adressen (strasse, hausnummer, plz, ort) 
VALUES ('Zollbruecke', '372a', '16259', 'Bad Freienwalde');

INSERT INTO Adressen (strasse, hausnummer, plz, ort) 
VALUES ('Reuterstrasse', '3b', '12035', 'Berlin');

INSERT INTO Adressen (strasse, hausnummer, plz, ort) 
VALUES ('Berlinerstrasse', '18', '10101', 'Berlin');

SELECT * FROM Adressen;
SELECT * FROM persons;

ALTER TABLE Adressen
ADD CONSTRAINT fk_person_id
FOREIGN KEY (PersonID) REFERENCES Person(PersonID);

INSERT INTO Adressen (Strasse, Hausnummer, PLZ, Ort, PersonID) VALUES ('Musterstrasse', '1', '12345', 'Musterstadt', 1);
INSERT INTO Adressen (Strasse, Hausnummer, PLZ, Ort, PersonID) VALUES ('Beispielweg', '22b', '67890', 'Beispielstadt', 1);
INSERT INTO Adressen (Strasse, Hausnummer, PLZ, Ort, PersonID) VALUES ('Teststrasse', '321', '11223', 'Teststadt', 2);

select * from Adressen;

SELECT 
	*
FROM 
    Persons p
JOIN 
    Adressen a ON p.PersonID = a.PersonID
WHERE 
    p.PersonID = 1;
    