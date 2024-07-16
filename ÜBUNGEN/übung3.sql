CREATE TABLE IF NOT EXISTS Person_Adressen (
    PersonID INT,
    AdresseID INT,
    PRIMARY KEY (PersonID, AdresseID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID),
    FOREIGN KEY (AdresseID) REFERENCES Adressen(AdresseID)
);

INSERT INTO Person_Adressen (PersonID, AdresseID) VALUES (1, 1);
INSERT INTO Person_Adressen (PersonID, AdresseID) VALUES (1, 2);
INSERT INTO Person_Adressen (PersonID, AdresseID) VALUES (2, 3);

SELECT 
    p.Vorname, 
    p.Nachname, 
    a.AdresseID, 
    a.Strasse, 
    a.Hausnummer, 
    a.PLZ, 
    a.Ort 
FROM 
    Persons p
JOIN 
    Person_Adressen pa ON p.PersonID = pa.PersonID
JOIN 
    Adressen a ON pa.AdresseID = a.AdresseID
WHERE 
    p.PersonID = 2;
    
    
    
SELECT 
    a.Strasse, 
    a.Hausnummer, 
    a.PLZ, 
    a.Ort,
    p.Vorname,
    p.Nachname
FROM 
    Adressen a
JOIN 
    Person_Adressen pa ON a.AdresseID = pa.AdresseID
JOIN 
    Person p ON pa.PersonID = p.PersonID
WHERE 
    a.AdresseID = 1;