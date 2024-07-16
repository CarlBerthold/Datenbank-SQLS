CREATE TABLE Dozent (
    DozentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Vorname VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Vorname VARCHAR(50),
    Matrikelnr VARCHAR(20)
);

CREATE TABLE Kurs (
    KursID INT AUTO_INCREMENT PRIMARY KEY,
    Bezeichnung VARCHAR(100),
    Thema VARCHAR(100),
    DozentID INT,
    CONSTRAINT FK_Dozent_ID FOREIGN KEY (DozentID) REFERENCES Dozent(DozentID)
);

CREATE TABLE Teilnahme (
    StudentID INT,
    KursID INT,
    CONSTRAINT PK_Student_ID PRIMARY KEY (StudentID, KursID),
    CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    CONSTRAINT FK_Kurs_ID FOREIGN KEY (KursID) REFERENCES Kurs(KursID),
    TeilnahmeDatum DATE
);


INSERT INTO Dozent (Name, Vorname, Email) VALUES ('Müller', 'Hans', 'hans.mueller@example.com');
INSERT INTO Dozent (Name, Vorname, Email) VALUES ('Schmidt', 'Anna', 'anna.schmidt@example.com');

SELECT * FROM dozent;

INSERT INTO Student (Name, Vorname, Matrikelnr) VALUES ('Meyer', 'Lukas', '123456');
INSERT INTO Student (Name, Vorname, Matrikelnr) VALUES ('Klein', 'Maria', '789012');
INSERT INTO Student (Name, Vorname, Matrikelnr) VALUES ('Weber', 'Peter', '345678');

INSERT INTO Kurs (Bezeichnung, Thema, DozentID) VALUES ('Mathematik 101', 'Algebra', 1);
INSERT INTO Kurs (Bezeichnung, Thema, DozentID) VALUES ('Informatik 101', 'Programmierung', 2);
INSERT INTO Kurs (Bezeichnung, Thema, DozentID) VALUES ('Physik 101', 'Mechanik', 1);

INSERT INTO Teilnahme (StudentID, KursID, TeilnahmeDatum) VALUES (1, 1, '2024-07-01');
INSERT INTO Teilnahme (StudentID, KursID, TeilnahmeDatum) VALUES (1, 2, '2024-07-01');
INSERT INTO Teilnahme (StudentID, KursID, TeilnahmeDatum) VALUES (2, 1, '2024-07-02');
INSERT INTO Teilnahme (StudentID, KursID, TeilnahmeDatum) VALUES (3, 3, '2024-07-03');

#STUDENTS
SELECT 
    s.Name AS StudentName, 
    s.Vorname AS StudentVorname, 
    k.Bezeichnung AS KursBezeichnung, 
    k.Thema AS KursThema, 
    d.Name AS DozentName, 
    d.Vorname AS DozentVorname
FROM 
    Student s
JOIN 
    Teilnahme t ON s.StudentID = t.StudentID
JOIN 
    Kurs k ON t.KursID = k.KursID
JOIN 
    Dozent d ON k.DozentID = d.DozentID;
    
    
#KURSE
SELECT 
    k.Bezeichnung AS KursBezeichnung, 
    k.Thema AS KursThema, 
    d.Name AS DozentName, 
    d.Vorname AS DozentVorname, 
    s.Name AS StudentName, 
    s.Vorname AS StudentVorname
FROM 
    Kurs k
JOIN 
    Teilnahme t ON k.KursID = t.KursID
JOIN 
    Student s ON t.StudentID = s.StudentID
JOIN 
    Dozent d ON k.DozentID = d.DozentID;