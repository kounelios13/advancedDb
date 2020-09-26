DROP TABLE IF EXISTS LEAGUE CASCADE;
DROP TABLE IF EXISTS OMADA CASCADE;
DROP TABLE IF EXISTS COUCH CASCADE;
DROP TABLE IF EXISTS ATHLETE CASCADE;

/* Δημιουργία Πίνακα {LEAGUE} */
CREATE TABLE LEAGUE
(
    NODEKEY VARCHAR(30) NOT NULL,
    FACET   TEXT,
    phones  text[],
    PRIMARY KEY (NODEKEY)
);

/* Εισαγωγή εγγραφών στον Πίνακα {LEAGUE} */
INSERT INTO LEAGUE
VALUES ('ΑΠΟΣΤΟΛΑΚΗΣ', 'ΑΘΛΗΤΗΣ', ARRAY ['28105454132', '6943242323']);
INSERT INTO LEAGUE
VALUES ('ΓΚΕΡΑΡΝΤ', 'ΠΡΟΠΟΝΗΤΗΣ', ARRAY ['28105454132', '6943242323']);
INSERT INTO LEAGUE
VALUES ('ΣΙΜΟΣ', 'ΠΡΟΠΟΝΗΤΗΣ', ARRAY ['28105454132', '6943242323']);
INSERT INTO LEAGUE
VALUES ('SUPERLEAGUE', 'ΑΡΧΗ', ARRAY ['28105454132', '6943242323']);
INSERT INTO LEAGUE
VALUES ('ΟΦΗ', 'ΣΩΜΑΤΕΙΟ', ARRAY ['28105454132', '6943242323']);
INSERT INTO LEAGUE
VALUES ('ΟΛΥΜΠΙΑΚΟΣ', 'ΣΩΜΑΤΕΙΟ', ARRAY ['28105454132', '6943242323']);
INSERT INTO LEAGUE
VALUES ('ΠΑΝΑΘΗΝΑΙΚΟΣ', 'ΣΩΜΑΤΕΙΟ', ARRAY ['28105454132', '6943242323']);

-- Τροποποιήστε τη βάση που σας δίδεται έτσι ώστε για κάθε πλειάδα στον πίνακα LEAGUE να καταγράφονται τουλάχιστον δύο τηλέφωνα επικοινωνίας της αρεσκείας σας [2.5 μονάδες].
-- Στη συνέχεια διατυπώστε σε SQL το ερώτημα "Για κάθε πλειάδα που χαρακτηρίζεται ως ΣΩΜΑΤΕΙΟ βρείτε το πρώτο τηλέφωνο που δηλώνει" [[2.5 μονάδες].
select phones[1]
from league
where facet = 'ΣΩΜΑΤΕΙΟ';

-- Q2: Δημιουργήστε μια ιεραρχία εξειδίκευσης έτσι ώστε παραστάσεις του πίνακα LEAGUE να διακρίνονται είτε σε ομάδες (OMADA) είτε σε αθλητές (ATHLETE) είτε σε προπονητές (COUCH) [3 μονάδες].
-- Στην περίπτωση των ομάδων να καταγράφονται υπό μορφή πλειότιμου γνωρίσματος τα τμήματα υποδομής που διαθέτουν δηλαδή μία ή περισσότερες από τις τιμές K12, K15, K19 (όπως εσείς θα επιλέξετε για κάθε ομάδα) [3 μονάδες].
CREATE TABLE OMADA
(
    YPODOMES TEXT[],
    PRIMARY KEY (NODEKEY)
) INHERITS (LEAGUE);

CREATE TABLE ATHLETE
(
    PRIMARY KEY (NODEKEY)
) INHERITS (LEAGUE);

CREATE TABLE COUCH
(
    PRIMARY KEY (NODEKEY)
) INHERITS (LEAGUE);

INSERT INTO OMADA
VALUES ('ΟΦΗ', ARRAY ['K12', 'K15', 'K19']);
INSERT INTO OMADA
VALUES ('ΟΛΥΜΠΙΑΚΟΣ', ARRAY ['K19']);
INSERT INTO OMADA
VALUES ('ΠΑΝΑΘΗΝΑΙΚΟΣ', ARRAY ['K15', 'K19']);

INSERT INTO ATHLETE
VALUES ('ΑΠΟΣΤΟΛΑΚΗΣ');

INSERT INTO COUCH
VALUES ('ΓΚΕΡΑΡΝΤ');
INSERT INTO COUCH
VALUES ('ΣΙΜΟΣ');


CREATE TABLE GRAPHNODE (
    NODEKEY VARCHAR(30) NOT NULL,
    FACET   VARCHAR(30),
    PRIMARY KEY (NODEKEY)
);

CREATE TABLE PROPERTYLINK (
    NODEKEY1 VARCHAR(30) NOT NULL,
    NODEKEY2 VARCHAR(30) NOT NULL,
    PROPERTYLABEL VARCHAR(30) NOT NULL,
    VALUE INT,
    FOREIGN KEY (NODEKEY1) REFERENCES GRAPHNODE (NODEKEY),
    FOREIGN KEY (NODEKEY2) REFERENCES GRAPHNODE (NODEKEY),
    PRIMARY KEY (NODEKEY1, NODEKEY2, PROPERTYLABEL)
);

INSERT INTO GRAPHNODE VALUES ('ΓΚΕΡΑΡΝΤ', 'ΠΡΟΠΟΝΗΤΗΣ');
INSERT INTO GRAPHNODE VALUES ('ΣΙΜΟΣ', 'ΠΡΟΠΟΝΗΤΗΣ');

INSERT INTO GRAPHNODE VALUES ('ΟΛΥΜΠΙΑΚΟΣ', 'ΣΩΜΑΤΕΙΟ');
INSERT INTO GRAPHNODE VALUES ('ΟΦΗ', 'ΣΩΜΑΤΕΙΟ');
INSERT INTO GRAPHNODE VALUES ('ΠΑΝΑΘΗΝΑΙΚΟΣ', 'ΣΩΜΑΤΕΙΟ');

INSERT INTO GRAPHNODE VALUES ('ΑΠΟΣΤΟΛΑΚΗΣ', 'ΑΘΛΗΤΗΣ');

INSERT INTO PROPERTYLINK VALUES ('ΓΚΕΡΑΡΝΤ', 'COUCΗES', 'ΟΦΗ', NULL);
INSERT INTO PROPERTYLINK VALUES ('ΣΙΜΟΣ', 'COUCΗES', 'ΟΛΥΜΠΙΑΚΟΣ', NULL);
INSERT INTO PROPERTYLINK VALUES ('ΑΠΟΣΤΟΛΑΚΗΣ', 'CONTRACTS', 'ΟΦΗ', 2500);