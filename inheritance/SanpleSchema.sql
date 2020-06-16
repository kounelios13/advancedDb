/* Inclass example 2019-2020 */

Drop table IF EXISTS OMADA CASCADE;
Drop table IF EXISTS USERS CASCADE;
Drop table IF EXISTS ADMINS CASCADE;
Drop table IF EXISTS MELOS CASCADE;

DROP TYPE IF EXISTS ADDRESS CASCADE;

CREATE TYPE ADDRESS AS  (
	POLH VARCHAR(60),
	XORA VARCHAR(60));

/* Δημιουργία Πίνακα {ΧΡΗΣΤΗΣ} */
CREATE TABLE USERS(
ONOMAXEIRISTH VARCHAR(30) NOT NULL,
ONOMA VARCHAR(60),
EPONYMO VARCHAR(120),
GENOS VARCHAR(20),
PERIGRAFH VARCHAR(400),
telephone text [],
DIAMONH ADDRESS,
PRIMARY KEY(ONOMAXEIRISTH));

/* Εισαγωγή εγγραφών στον  Πίνακα {ΧΡΗΣΤΗΣ} */
INSERT INTO USERS VALUES ('demosthenes', 'Δημοσθένης', 'Ακουμιανάκης', 'Άνδρας', 'Διδάσκων εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων', '{2810379190, 6973359242}', ROW('Χανιά',  'Ελλάς'));
INSERT INTO USERS VALUES ('ktistakis', 'Γιώργος', 'Κτιστάκης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων', '{2810321040, 6978559242}', ROW('Ηράκλειο',  'Ελλάς'));
INSERT INTO USERS VALUES ('koborakis', 'Γιάννης', 'Κομποράκης', 'Άνδρας', 'Βοηθός εργαστηρίου Προχωρημένα Θέματα Βάσεων Δεδομένων', '{2810321040, 6973352988}', ROW('Ρέθυμνο',  'Ελλάς'));

/* Δημιουργία Πίνακα {ΟΜΑΔΑ} */
CREATE TABLE OMADA
(KODIKOS_OMADAS INT NOT NULL,
ONOMA_OMADAS VARCHAR(100) NOT NULL,
PERIGRAFH VARCHAR(400) NOT NULL,
CHECK(KODIKOS_OMADAS > 0),
UNIQUE (ONOMA_OMADAS), 
HMER_DHMIOYRGIAS DATE NOT NULL,
PRIMARY KEY (KODIKOS_OMADAS));

/* Εισαγωγή εγγραφών στον  Πίνακα {ΟΜΑΔΑ} */
INSERT INTO OMADA  VALUES (1, 'Εργαστηριακή ομάδα 1', '15.15-17.00', TO_DATE('02/03/2020', 'dd/mm/yyyy'));
INSERT INTO OMADA  VALUES (2, 'Εργαστηριακή ομάδα 2', '17.15-19.00', TO_DATE('02/03/2020', 'dd/mm/yyyy'));

/* Δημιουργία υποκλάσεων */
CREATE TABLE ADMINS (
PRIMARY KEY(ONOMAXEIRISTH),
listaOmades INTEGER ARRAY
) INHERITS (USERS);

INSERT INTO ADMINS (ONOMAXEIRISTH, listaOmades) VALUES ('demosthenes', ARRAY[1,2]);

CREATE TABLE MELOS (
PRIMARY KEY(ONOMAXEIRISTH),
KODIKOS_OMADAS INT,
HMEREGGRAFHS DATE,
FOREIGN KEY (KODIKOS_OMADAS) REFERENCES OMADA (KODIKOS_OMADAS)
) INHERITS (USERS);

INSERT INTO MELOS (ONOMAXEIRISTH, KODIKOS_OMADAS, HMEREGGRAFHS) VALUES ('ktistakis', 1, TO_DATE('16/03/2016', 'dd/mm/yyyy'));
INSERT INTO MELOS (ONOMAXEIRISTH, KODIKOS_OMADAS, HMEREGGRAFHS) VALUES ('koborakis', 2, TO_DATE('16/03/2016', 'dd/mm/yyyy'));
