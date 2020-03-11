drop table if exists GRANDPRIX CASCADE;
drop table if exists RESULTS CASCADE;
drop table if exists BASELINE CASCADE;

create table GRANDPRIX
(
    GRANDPRIXID   INTEGER NOT NULL,
    GRANDPRIXNAME TEXT,
    PRIMARY KEY (GRANDPRIXID)
);

create table RESULTS
(
    GRANDPRIXID      INTEGER NOT NULL,
    BASELINEPOSITION INTEGER NOT NULL,
    FOREIGN KEY (GRANDPRIXID) REFERENCES GRANDPRIX (GRANDPRIXID),
    PRIMARY KEY (GRANDPRIXID, BASELINEPOSITION)
);

create table BASELINE
(
    BASELINEPOSITION INTEGER NOT NULL,
    PILOTID          INTEGER NOT NULL,
    CARNAME          TEXT,
    PILOTNAME        TEXT,
--FOREIGN KEY (BASELINEPOSITION) REFERENCES RESULTS(BASELINEPOSITION),
    PRIMARY KEY (BASELINEPOSITION, PILOTID)
);

INSERT INTO GRANDPRIX
VALUES (1, 'GRANDPRIX MONAKO');
INSERT INTO GRANDPRIX
VALUES (2, 'GRANDPRIX VIETNAM');

INSERT INTO RESULTS
VALUES (1, 56);
INSERT INTO RESULTS
VALUES (2, 56);

INSERT INTO BASELINE
VALUES (56, 123, 'MACLAREN', 'N. LAUDA');
INSERT INTO BASELINE
VALUES (56, 124, 'FERRARI', 'N. LAUDA');

/*
To script όπως αποτυπώνεται παραπάνω τρέχει. Σημειώνω επίσης τα ακόλουθα:
(1) Από το slide της εκφώνησης δεν προκύπτει (από πουθενά) η δήλωση περιορισμού ακεραιότητας
όπως αυτή που έχω κάνει strike out. Το ερώτημα που σας τέθηκε δεν είναι αν εισάγετε την παραπάνω δήλωση 
αλλά να διτυπώσετε τουλάχιστον μία συναρτησιακή εξάρτηση που να παραβιάζεται ή να μην ικανοποιείται

(2) παρόμοια θα δουλέψετε για όλες τις αποσυνθέσεις που αναφέρονται στο slide       
*/

select *
from GRANDPRIX
         natural join RESULTS
         natural join BASELINE;