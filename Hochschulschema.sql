DROP TABLE IF EXISTS aa_hoeren;
DROP TABLE IF EXISTS aa_voraussetzen;
DROP TABLE IF EXISTS aa_pruefen;
DROP TABLE IF EXISTS aa_Vorlesungen;
DROP TABLE IF EXISTS aa_Studenten;
DROP TABLE IF EXISTS aa_Assistenten;
DROP TABLE IF EXISTS aa_Professoren;

CREATE TABLE aa_Studenten
       (MatrNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Semester       INTEGER);

CREATE TABLE aa_Professoren
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Rang           CHAR(2) CHECK (Rang in ('C2', 'C3', 'C4')),
        Raum           INTEGER UNIQUE);

CREATE TABLE aa_Assistenten
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Fachgebiet     VARCHAR(30),
        Boss           INTEGER,
        FOREIGN KEY    (Boss) REFERENCES aa_Professoren(PersNR));

CREATE TABLE aa_Vorlesungen
       (VorlNr         INTEGER PRIMARY KEY,
        Titel          VARCHAR(30),
        SWS            INTEGER,
        gelesenVon     INTEGER REFERENCES aa_Professoren);

CREATE TABLE aa_hoeren
       (MatrNr         INTEGER REFERENCES aa_Studenten ON DELETE CASCADE,
        VorlNr         INTEGER REFERENCES aa_Vorlesungen ON DELETE CASCADE,
        PRIMARY KEY    (MatrNr, VorlNr));

CREATE TABLE aa_voraussetzen
       (Vorgaenger     INTEGER REFERENCES aa_Vorlesungen ON DELETE CASCADE,
        Nachfolger     INTEGER REFERENCES aa_Vorlesungen ON DELETE NO ACTION,
        PRIMARY KEY    (Vorgaenger, Nachfolger));

CREATE TABLE aa_pruefen
       (MatrNr         INTEGER REFERENCES aa_Studenten ON DELETE CASCADE,
        VorlNr         INTEGER REFERENCES aa_Vorlesungen,
        PersNr         INTEGER REFERENCES aa_Professoren,
        Note           NUMERIC(2,1) CHECK (Note between 0.7 and 5.0),
        PRIMARY KEY    (MatrNr, VorlNr));


INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (24002, 'Xenokrates', 18); 
 
INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (25403, 'Jonas', 12); 
 
INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (26120, 'Fichte', 10); 

INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (26830, 'Aristoxenos', 8); 
 
INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (27550, 'Schopenhauer', 6); 

INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (28106, 'Carnap', 3); 
 
INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (29120, 'Theophrastos', 2); 
 
INSERT INTO aa_Studenten(MatrNr, Name, Semester) 
VALUES (29555, 'Feuerbach', 2); 
 
INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2125, 'Sokrates', 'C4', 226); 

INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2126, 'Russel', 'C4', 232);  
 
INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2127, 'Kopernikus', 'C3', 310); 
 
INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2133, 'Popper', 'C3', 052); 
 
INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2134, 'Augustinus', 'C3', 309); 
 
INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2136, 'Curie', 'C4', 036); 
 
INSERT INTO aa_Professoren(PersNr, Name, Rang, Raum) 
VALUES (2137, 'Kant', 'C4', 007); 
 
INSERT INTO aa_Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3002, 'Platon', 'Ideenlehre', 2125); 
 
INSERT INTO aa_Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3003, 'Aristoteles', 'Syllogistik', 2125); 
 
INSERT INTO aa_Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3004, 'Wittgenstein', 'Sprachtheorie', 2126); 
 
INSERT INTO aa_Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3005, 'Rhetikus', 'Planetenbewegung', 2127); 
 
INSERT INTO aa_Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3006, 'Newton', 'Keplersche Gesetze', 2127); 
 
INSERT INTO aa_Assistenten(PersNr, Name, Fachgebiet, Boss) 
VALUES (3007, 'Spinoza', 'Gott und Natur', 2134); 

INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5001, 'Grundzuege', 4, 2137);

INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5041, 'Ethik', 4, 2125);
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5043, 'Erkenntnistheorie', 3, 2126);
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5049, 'Maeeutik', 2, 2125);
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (4052, 'Logik', 4, 2125);
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5052, 'Wissenschaftstheorie', 3, 2126); 
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5216, 'Bioethik', 2, 2126); 
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5259, 'Der Wiener Kreis', 2, 2133); 
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (5022, 'Glaube und Wissen', 2, 2134); 
 
INSERT INTO aa_Vorlesungen(VorlNr, Titel, SWS, gelesenVon) 
VALUES (4630, 'Die 3 Kritiken', 4, 2137); 

INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (26120, 5001); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (27550, 5001); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (27550, 4052); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (28106, 5041); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (28106, 5052); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (28106, 5216); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (28106, 5259); 
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (29120, 5001); 

INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (29120, 5041); 

INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (29120, 5049); 

INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (29555, 5022); 

INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (25403, 5022);  
 
INSERT INTO aa_hoeren(MatrNr, VorlNr) 
VALUES (29555, 5001);  

INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5001, 5041); 
 
INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5001, 5043); 
 
INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5001, 5049); 
 
INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5041, 5216);  

INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5043, 5052);  

INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5041, 5052); 
 
INSERT INTO aa_voraussetzen(Vorgaenger, Nachfolger) 
VALUES (5052, 5259); 

INSERT INTO aa_pruefen(MatrNr, VorlNr, PersNr, Note) 
VALUES (28106, 5001, 2126, 1.0);

INSERT INTO aa_pruefen(MatrNr, VorlNr, PersNr, Note) 
VALUES (25403, 5041, 2125, 2.0);

INSERT INTO aa_pruefen(MatrNr, VorlNr, PersNr, Note) 
VALUES (27550, 4630, 2137, 2.0);

SELECT s.Name
FROM aa_Studenten s
JOIN aa_hoeren h ON s.MatrNr = h.MatrNr
JOIN aa_Vorlesungen v ON h.VorlNr = v.VorlNr
JOIN aa_Professoren p ON v.gelesenVon = p.PersNr
WHERE p.Name = 'Sokrates';

SELECT DISTINCT s.Name
FROM aa_Studenten s
JOIN aa_hoeren h ON s.MatrNr = h.MatrNr
WHERE h.VorlNr IN (
    SELECT h2.VorlNr
    FROM aa_hoeren h2
    JOIN aa_Studenten s2 ON h2.MatrNr = s2.MatrNr
    WHERE s2.Name = 'Fichte'
);
SELECT a.Name
FROM aa_Assistenten a
JOIN aa_Professoren p ON a.Boss = p.PersNr
WHERE p.PersNr IN (
    SELECT v.gelesenVon
    FROM aa_Vorlesungen v
    JOIN aa_hoeren h ON v.VorlNr = h.VorlNr
    JOIN aa_Studenten s ON h.MatrNr = s.MatrNr
    WHERE s.Name = 'Carnap'
);
SELECT a.Name
FROM aa_Assistenten a
JOIN aa_Professoren p ON a.Boss = p.PersNr
WHERE p.PersNr IN (
    SELECT v.gelesenVon
    FROM aa_Vorlesungen v
    JOIN aa_hoeren h ON v.VorlNr = h.VorlNr
    JOIN aa_Studenten s ON h.MatrNr = s.MatrNr
    WHERE s.Name = 'Carnap'
);
SELECT DISTINCT v.Titel
FROM aa_Vorlesungen v
JOIN aa_hoeren h ON v.VorlNr = h.VorlNr
JOIN aa_Studenten s ON h.MatrNr = s.MatrNr
WHERE s.Semester BETWEEN 1 AND 4;
SELECT AVG(Semester) AS Durchschnittliches_Semester
FROM aa_Studenten;



