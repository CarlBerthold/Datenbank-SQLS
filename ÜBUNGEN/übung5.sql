#Create tables
CREATE TABLE Dekans (
    DekanID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    Titel VARCHAR(50)
);

CREATE TABLE Universitaeten (
    UniversitaetID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    DekanID INT,
    CONSTRAINT FK_Dekan_ID FOREIGN KEY (DekanID) REFERENCES Dekans(DekanID)
);

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Vorname VARCHAR(50),
    Nachname VARCHAR(50),
    UniversitaetID INT,
    CONSTRAINT FK_Universitaet_ID FOREIGN KEY (UniversitaetID) REFERENCES Universitaeten(UniversitaetID)
);

CREATE TABLE Vorlesungen (
    VorlesungID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    StartDatum DATE,
    EndDatum DATE
);

CREATE TABLE StudentenVorlesungen (
    StudentID INT,
    VorlesungID INT,
    CONSTRAINT PRIMARY KEY (StudentID, VorlesungID),
	CONSTRAINT FK_Student_ID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Vorlesung_ID FOREIGN KEY (VorlesungID) REFERENCES Vorlesungen(VorlesungID)
);

#Insert data
INSERT INTO Dekans (Vorname, Nachname, Titel) VALUES ('Hans', 'Müller', 'Dr.');
INSERT INTO Dekans (Vorname, Nachname, Titel) VALUES ('Anna', 'Schmidt', 'Prof.');

INSERT INTO Universitaeten (Name, DekanID) VALUES ('Universität Berlin', 1);
INSERT INTO Universitaeten (Name, DekanID) VALUES ('Technische Universität München', 2);

INSERT INTO Students (Vorname, Nachname, UniversitaetID) VALUES ('Lukas', 'Meyer', 1);
INSERT INTO Students (Vorname, Nachname, UniversitaetID) VALUES ('Maria', 'Klein', 1);
INSERT INTO Students (Vorname, Nachname, UniversitaetID) VALUES ('Peter', 'Weber', 2);

INSERT INTO Vorlesungen (Name, StartDatum, EndDatum) VALUES ('Mathematik', '2024-04-01', '2024-07-01');
INSERT INTO Vorlesungen (Name, StartDatum, EndDatum) VALUES ('Informatik', '2024-04-01', '2024-07-01');
INSERT INTO Vorlesungen (Name, StartDatum, EndDatum) VALUES ('Physik', '2024-04-01', '2024-07-01');

INSERT INTO StudentenVorlesungen (StudentID, VorlesungID) VALUES (1, 1);
INSERT INTO StudentenVorlesungen (StudentID, VorlesungID) VALUES (1, 2);
INSERT INTO StudentenVorlesungen (StudentID, VorlesungID) VALUES (2, 1);
INSERT INTO StudentenVorlesungen (StudentID, VorlesungID) VALUES (3, 3);

#Select All Students and Their Vorlesungen
SELECT 
    s.Vorname AS StudentVorname, 
    s.Nachname AS StudentNachname, 
    v.Name AS VorlesungName, 
    v.StartDatum, 
    v.EndDatum, 
    u.Name AS UniversitaetName, 
    d.Vorname AS DekanVorname, 
    d.Nachname AS DekanNachname, 
    d.Titel AS DekanTitel
FROM 
    Students s
JOIN 
    StudentenVorlesungen sv ON s.StudentID = sv.StudentID
JOIN 
    Vorlesungen v ON sv.VorlesungID = v.VorlesungID
JOIN 
    Universitaeten u ON s.UniversitaetID = u.UniversitaetID
JOIN 
    Dekans d ON u.DekanID = d.DekanID;