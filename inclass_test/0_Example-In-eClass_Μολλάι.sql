Drop table IF EXISTS USERS cascade;
Drop table IF EXISTS KNOWS cascade;
DROP TABLE IF EXISTS FOLLOWS CASCADE;

DROP TYPE IF EXISTS ADDRESS cascade;
DROP TYPE IF EXISTS FYLLO cascade;

CREATE TYPE FYLLO AS ENUM ('Άνδρας','Γυναίκα');

CREATE TYPE ADDRESS AS
(
    POLH VARCHAR(60),
    XORA VARCHAR(60)
);

/* Δημιουργία Πίνακα {ΧΡΗΣΤΗΣ} */

CREATE TABLE USERS
(
    ONOMAXEIRISTH VARCHAR(30)  NOT NULL,
    ONOMA         VARCHAR(60)  NOT NULL,
    EPONYMO       VARCHAR(120),
    GENOS         FYLLO        NOT NULL,
    PERIGRAFH     VARCHAR(400) NOT NULL,
    telephone     varchar(20)[],
    DIAMONH       ADDRESS,
    PRIMARY KEY (ONOMAXEIRISTH)
);

/* Δημιουργία Πίνακα {ΦΙΛΙΕΣ} */

CREATE TABLE KNOWS
(
    ONOMAXRHSTH1     VARCHAR(30) NOT NULL,
    ONOMAXRHSTH2     VARCHAR(30) NOT NULL,
    HMERDESMOUFILIAS DATE        NOT NULL,
    FOREIGN KEY (ONOMAXRHSTH1) REFERENCES USERS (ONOMAXEIRISTH),
    FOREIGN KEY (ONOMAXRHSTH2) REFERENCES USERS (ONOMAXEIRISTH),
    PRIMARY KEY (ONOMAXRHSTH1, ONOMAXRHSTH2)
);

-- Table for adjancency list (nested sets)
CREATE TABLE FOLLOWS
(
    komvos    varchar(30) not null,
    out_Going varchar(30)[],
    in_Coming varchar(30)[],
    foreign key (komvos) references users (onomaxeiristh),
    primary key (komvos)
);

/* Εισαγωγή εγγραφών στον  Πίνακα {ΧΡΗΣΤΗΣ} */
INSERT INTO USERS
VALUES ('demosthenes', 'Δημοσθένης', 'Ακουμιανάκης', 'Άνδρας',
        'Διδάσκων εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων', '{2810379190, 6973359242}', ROW ('Χανιά', 'Ελλάς'));
INSERT INTO USERS
VALUES ('ktistakis', 'Γιώργος', 'Κτιστάκης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810321040, 6978559242}', ROW ('Ηράκλειο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('papadakis', 'Χάρης', 'Παπαδάκης', 'Άνδρας', 'Διδάσκων εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810379196, 6979876754}', ROW ('Ηράκλειο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('koborakis', 'Γιάννης', 'Κομποράκης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810321040, 6973352988}', ROW ('Ρέθυμνο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('providakis', 'Αντωνης', 'Προβιδακης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810321040, 6973352988}', ROW ('Ρέθυμνο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('marmatakis', 'Δημητρης', 'Μαρματακης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810321040, 6973352988}', ROW ('Ρέθυμνο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('feretzakis', 'Γιαννης', 'Φερετζακης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810321040, 6973352988}', ROW ('Ρέθυμνο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('vellis', 'Γιώργος', 'Βελής', 'Άνδρας', 'Διδάσκων εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810379190, 6973359242}', ROW ('Ηράκλειο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('kotsalis', 'Δημήτρης', 'Κότσαλης', 'Άνδρας', 'Διδάσκων εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810379190, 6973359242}', ROW ('Ηράκλειο', 'Ελλάς'));
INSERT INTO USERS
VALUES ('plemenos', 'Ανάργυρος', 'Πλεμένος', 'Άνδρας', 'Διδάσκων εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων',
        '{2810379190, 6973359242}', ROW ('Ηράκλειο', 'Ελλάς'));

/* Εισαγωγή εγγραφών στον  Πίνακα {KNOWS} */
INSERT INTO KNOWS
VALUES ('ktistakis', 'feretzakis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('feretzakis', 'providakis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('feretzakis', 'koborakis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('koborakis', 'kotsalis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('koborakis', 'providakis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('kotsalis', 'vellis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('vellis', 'papadakis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO KNOWS
VALUES ('papadakis', 'ktistakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));

/* Εισαγωγή εγγραφών στον  Πίνακα {FOLLOWS} */
insert INTO FOLLOWS
VALUES ('demosthenes', ARRAY ['papadakis', 'vellis','kotsalis', 'ktistakis'], NULL);
insert INTO FOLLOWS
VALUES ('vellis', ARRAY ['marmatakis','koborakis'], ARRAY ['demosthenes']);
insert INTO FOLLOWS
VALUES ('kotsalis', ARRAY ['providakis'], ARRAY ['demosthenes']);
insert INTO FOLLOWS
VALUES ('papadakis', ARRAY ['feretzakis'], ARRAY ['demosthenes']);
insert INTO FOLLOWS
VALUES ('koborakis', NULL, ARRAY ['vellis']);
insert INTO FOLLOWS
VALUES ('providakis', NULL, ARRAY ['kotsalis']);
insert INTO FOLLOWS
VALUES ('marmatakis', ARRAY ['feretzakis'], ARRAY ['vellis']);
insert INTO FOLLOWS
VALUES ('ktistakis', NULL, ARRAY ['demosthenes']);
insert INTO FOLLOWS
VALUES ('feretzakis', NULL, ARRAY ['demosthenes']);

-- Q1: Ποιοι είναι οι επόμενοι του papadakis στη διαδρομή FOLLOWS;
select FOLLOWS.out_Going
from FOLLOWS
where komvos = 'papadakis';

-- Q2: Ποιοι είναι οι επόμενοι του papadakis στη διαδρομή KNOWS;
select KNOWS.ONOMAXRHSTH2
from KNOWS
where ONOMAXRHSTH1 = 'papadakis';

-- Q3: Βρες για το χρήστη demosthenes ποίος είναι ο δεύτερος επόμενος στη διαδρομή FOLLOWS
select unnest(FOLLOWS.out_Going)
from FOLLOWS
where FOLLOWS.komvos = any (
    select unnest(FOLLOWS.out_Going)
    from FOLLOWS
    where FOLLOWS.komvos = 'demosthenes');

-- Q4: Υπολογίστε αυτούς που είτε γνωρίζει ο vellis είτε γνωρίζουν τον vellis (undirected graph ενός χρήστη)
select KNOWS.ONOMAXRHSTH2 as onoma
from KNOWS
where KNOWS.ONOMAXRHSTH1 = 'vellis'
union
select KNOWS.ONOMAXRHSTH1 as onoma
from KNOWS
where KNOWS.ONOMAXRHSTH2 = 'vellis';

-- Νέο Q5: Σε ππιο ερώτημα απαντάει το query
-- SELECT p1.ONOMA, p1.EPONYMO
-- FROM USERS p1
--          JOIN KNOWS ON KNOWS.ONOMAXRHSTH2 = p1.ONOMAXEIRISTH
--          JOIN USERS p2 ON KNOWS.ONOMAXRHSTH1 = p2.ONOMAXEIRISTH
-- WHERE p2.ONOMAXEIRISTH = 'feretzakis';
Απαντάει στο ερώτημα ποιούς ξέρει ο 'feretzakis'