DROP TABLE IF EXISTS GLOBAL_CURRENCY CASCADE;
DROP TABLE IF EXISTS EURO CASCADE;
DROP TABLE IF EXISTS USD CASCADE;
DROP TABLE IF EXISTS STERLING CASCADE;
DROP TABLE IF EXISTS GRAPHNODE CASCADE;
DROP TABLE IF EXISTS ISOTIMIA CASCADE;

/* Δημιουργία Πίνακα {GLOBAL_CURRENCY} */
CREATE TABLE GLOBAL_CURRENCY
(
    NODEKEY   VARCHAR(30) NOT NULL,
    COUNTRIES TEXT[],
    PRIMARY KEY (NODEKEY)
);

/* Εισαγωγή εγγραφών στον Πίνακα {GLOBAL_CURRENCY} */
INSERT INTO GLOBAL_CURRENCY
VALUES ('EURO', ARRAY ['Ελλάδα','Ιταλία','Γερμανία']);
INSERT INTO GLOBAL_CURRENCY
VALUES ('USD', ARRAY ['Ηνωμένες Πολιτείες Αμερικής']);
INSERT INTO GLOBAL_CURRENCY
VALUES ('STERLING', ARRAY ['Ηνωμένο Βασίλειο']);

-- Q1: Τροποποιήστε τη βάση που σας δίδεται έτσι ώστε για κάθε νόμισμα να καταγράφονται οι χώρες που το υιοθετούν ως εθνικό γνώρισμα [1 μονάδες].
-- Ενδεικτικά, για το EURO δηλώστε ως χώρες που το υιοθετούν τις Ελλάδα, Ιταλία και Γερμανία.
-- Για το USD δηλώστε ως χώρα που το υιοθετεί τις Ηνωμένες Πολιτείες Αμερικής.
-- Για το νόμισμα STERLING δηλώστε ως χώρα που το υιοθετεί το Ηνωμένο Βασίλειο [2 μονάδες].
-- Τέλος διατυπώστε σε SQL το ερώτημα "Για κάθε νόμισμα βρείτε την πρώτη χώρα που το υιοθετεί ως εθνικό γνώρισμα" [2 μονάδες].
select COUNTRIES[1]
from GLOBAL_CURRENCY;

-- Q2: Δημιουργήστε μια ιεραρχία εξειδίκευσης έτσι ώστε τα τρία νομίσματα που υπάρχουν στη βάση να κληρονομούν από τον
-- πίνακα GLOBAL_CURRENCY και επιπλέον μόνο για το νόμισμα EURO να μπορεί να καταγράφεται η ημερομηνία (τύπου DATE) που
-- δημιουργήθηκε (π.χ. 01/01/2000) [6 μονάδες]

create table EURO
(
    primary key (NODEKEY),
    DATE_CREATED DATE
) inherits (GLOBAL_CURRENCY);

create table USD
(
    primary key (NODEKEY)
) inherits (GLOBAL_CURRENCY);

create table STERLING
(
    primary key (NODEKEY)
) inherits (GLOBAL_CURRENCY);

insert into EURO
values ('EURO', array ['Ελλάδα','Ιταλία','Γερμανία'], to_date('2000-01-01', 'YYYY-MM-DD'));
insert into USD
values ('USD', ARRAY ['Ηνωμένες Πολιτείες Αμερικής']);
insert into STERLING
values ('STERLING', ARRAY ['Ηνωμένο Βασίλειο']);

-- Q3: Δημιουργήστε τη σχεσιακή αναπαράσταση ενός (property) graph μίας κατεύθυνση με όνομα 'isotimia'
-- έτσι ώστε να καταγράφονται οι ακόλουθες ισοτιμίες μεταξύ των νομισμάτων:
-- •    (Euro, USD, 1,4) [3 μονάδες]
-- •    (Euro, Sterling, 1.2) [3 μονάδες]
-- •    (USD, Sterling, 0.9) [3 μονάδες]

CREATE TABLE GRAPHNODE
(
    NODEKEY VARCHAR(30) NOT NULL,
    FACET   VARCHAR(30),
    PRIMARY KEY (NODEKEY)
);

CREATE TABLE ISOTIMIA
(
    NODEKEY1 VARCHAR(30) NOT NULL,
    NODEKEY2 VARCHAR(30) NOT NULL,
    VALUE    FLOAT,
    FOREIGN KEY (NODEKEY1) REFERENCES GRAPHNODE (NODEKEY),
    FOREIGN KEY (NODEKEY2) REFERENCES GRAPHNODE (NODEKEY),
    PRIMARY KEY (NODEKEY1, NODEKEY2, VALUE)
);

INSERT INTO GRAPHNODE
VALUES ('EURO', 'CURRENCY');
INSERT INTO GRAPHNODE
VALUES ('USD', 'CURRENCY');
INSERT INTO GRAPHNODE
VALUES ('STERLING', 'CURRENCY');

INSERT INTO ISOTIMIA
VALUES ('EURO', 'USD', 1.4);
INSERT INTO ISOTIMIA
VALUES ('EURO', 'STERLING', 1.2);
INSERT INTO ISOTIMIA
VALUES ('USD', 'STERLING', 0.9);

-- Q4: Στο γράφο που δημιουργήσατε γράψτε τις δηλώσεις SQL που υπολογίζουν
-- •    Τα νομίσματα που έχουν ισοτιμία με το νόμισμα STERLING και την τρέχουσα τιμή αυτής της ισοτιμίας [5 μονάδες] - (διάσχιση γράφου κατεύθυνσης)
SELECT NODEKEY1, VALUE
FROM ISOTIMIA
WHERE NODEKEY2 = 'STERLING';
-- •    Τα νομίσματα που συνδέονται με το νόμισμα USD και τις χώρες που τα υιοθετούν (διάσχιση μη-κατευθυνόμενου γράφου)
SELECT DISTINCT i.NODEKEY1, gc.COUNTRIES
FROM ISOTIMIA i
         join GLOBAL_CURRENCY gc on i.NODEKEY1 = gc.NODEKEY
where i.NODEKEY1 = 'USD'
   or i.NODEKEY2 = 'USD';


-- Q5: Με τη χρήση αναδρομικού ερωτήματος SQL υπολογίστε
-- •    Για κάθε νόμισμα όλες τις ισοτιμίες που υπάρχουν στη βάση [5 μονάδες]
WITH RECURSIVE FIND_NEXT_NODES (NODEKEY1, NODEKEY2, VALUE) AS (
    SELECT NODEKEY1, NODEKEY2, VALUE
    FROM ISOTIMIA N
    UNION
    SELECT N.NODEKEY1, N.NODEKEY2, N.VALUE
    FROM ISOTIMIA N
             INNER JOIN FIND_NEXT_NODES F ON N.NODEKEY1 = F.NODEKEY2 AND N.VALUE = F.VALUE
)
SELECT *
FROM FIND_NEXT_NODES;
-- •    Όλα τα νομίσματα με τα οποία το EURO διατηρεί ισοτιμία και την τιμή της ισοτιμίας αυτής [5 μονάδες]
WITH RECURSIVE FIND_NEXT_NODES (NODEKEY1, NODEKEY2, VALUE) AS (
    SELECT NODEKEY1, NODEKEY2, VALUE
    FROM ISOTIMIA N
    WHERE N.NODEKEY1 = 'EURO'
    UNION
    SELECT N.NODEKEY1, N.NODEKEY2, N.VALUE
    FROM ISOTIMIA N
             INNER JOIN FIND_NEXT_NODES F ON N.NODEKEY1 = F.NODEKEY2 AND N.VALUE = F.VALUE
)
SELECT *
FROM FIND_NEXT_NODES;

-- Q6: Με τη χρήση της ιδιότητας του μεταβατικού κλεισίματος υπολογίστε όλες τις δυνατές διαδρομές που συνδέουν
-- το νόμισμα EURO με καθένα από τα υπόλοιπα νομίσματα της βάσης [10 μονάδες]
WITH RECURSIVE TRANSITIVE_CLOSURE(NODEKEY1, NODEKEY2, PATH_STRING) AS (
    SELECT NODEKEY1,
           NODEKEY2,
           NODEKEY1 || '->' || NODEKEY2 AS PATH_STRING
    FROM ISOTIMIA
    UNION
    SELECT TC.NODEKEY1,
           E.NODEKEY2,
           TC.PATH_STRING || '->' || E.NODEKEY2 AS PATH_STRING
    FROM ISOTIMIA AS E
             JOIN TRANSITIVE_CLOSURE AS TC
                  ON E.NODEKEY1 = TC.NODEKEY2
    WHERE TC.PATH_STRING NOT LIKE '%' || E.NODEKEY2 || '%'
)
SELECT *
FROM TRANSITIVE_CLOSURE tc
where tc.NODEKEY1 = 'EURO'
ORDER BY tc.NODEKEY1, tc.NODEKEY2;
