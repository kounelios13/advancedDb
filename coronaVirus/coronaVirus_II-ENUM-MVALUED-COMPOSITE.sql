Drop table IF EXISTS PERSON cascade;
Drop table IF EXISTS CONTACT cascade;

DROP TYPE IF EXISTS ADDRESS cascade;
DROP TYPE IF EXISTS FYLLO cascade;

CREATE TYPE FYLLO AS ENUM ('Άνδρας','Γυναίκα');

CREATE TYPE ADDRESS AS  (
	POLH VARCHAR(60),
	XORA VARCHAR(60),
	TELEPHONE TEXT []);

/* Δημιουργία Πίνακα {ΚΡΟΥΣΜΑ} */
CREATE TABLE PERSON
(KODIKOS VARCHAR(30) NOT NULL,
ONOMA VARCHAR(60) NOT NULL,
EPONYMO VARCHAR(120),
GENOS FYLLO NOT NULL,
SYMPTOMS TEXT [][],
DIAMONH ADDRESS,
PRIMARY KEY(KODIKOS));

/* Δημιουργία Πίνακα {ΕΠΑΦΕΣ} */
CREATE TABLE CONTACT
(KODIKOS1 VARCHAR(30) NOT NULL,
KODIKOS2 VARCHAR(30) NOT NULL, 
CONTACTDATE DATE NOT NULL,
FOREIGN KEY (KODIKOS1) REFERENCES PERSON (KODIKOS),
FOREIGN KEY (KODIKOS2) REFERENCES PERSON (KODIKOS),
PRIMARY KEY (KODIKOS1, KODIKOS2));

/* Εισαγωγή εγγραφών στον  Πίνακα {ΚΡΟΥΣΜΑ} */
INSERT INTO PERSON VALUES ('demosthenes', 'Δημοσθένης', 'Ακουμιανάκης', 'Άνδρας', ARRAY[['1', 'Fever'], ['2', 'Cough']], 
						   ROW ('Χανιά', 'Ελλάς','{28103334444, 6973555555, 333345444}'));
/*
INSERT INTO PERSON VALUES ('ktistakis', 'Γιώργος', 'Κτιστάκης', 'Άνδρας', ARRAY[['1', 'Fever']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('fousteris', 'Νίκος', 'Φουστέρης', 'Άνδρας', ARRAY[['1','Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('koborakis', 'Γιάννης', 'Κομποράκης', 'Άνδρας', ARRAY[['1', 'Fever'], ['2', 'Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('providakis', 'Αντωνης', 'Προβιδακης', 'Άνδρας', ARRAY[['1','Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('marmatakis', 'Δημητρης', 'Μαρματακης', 'Άνδρας', ARRAY[['1', 'Fever'], ['2', 'Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('feretzakis', 'Γιαννης', 'Φερετζακης', 'Άνδρας', ARRAY[['1', 'Fever'], ['2', 'Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('vellis', 'Γιώργος', 'Βελής', 'Άνδρας', ARRAY[['1','Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('kotsalis', 'Δημήτρης', 'Κότσαλης', 'Άνδρας', ARRAY[['1', 'Fever'], ['2', 'Cough']], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('plemenos', 'Ανάργυρος', 'Πλεμένος', 'Άνδρας', ARRAY[['1', 'Fever']], ROW ('Χανιά', 'Ελλάς'));
*/
/* Εισαγωγή εγγραφών στον  Πίνακα {ΕΠΑΦΕΣ} */
INSERT INTO CONTACT VALUES ('demosthenes', 'fousteris', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('demosthenes', 'vellis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('demosthenes', 'kotsalis', TO_DATE('17/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('vellis', 'kotsalis', TO_DATE('18/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('vellis', 'fousteris', TO_DATE('18/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('kotsalis', 'fousteris', TO_DATE('19/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('ktistakis', 'demosthenes', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('ktistakis', 'koborakis', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('ktistakis', 'vellis', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('kotsalis', 'ktistakis', TO_DATE('23/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('fousteris', 'koborakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('fousteris', 'providakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('fousteris', 'marmatakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('koborakis', 'feretzakis', TO_DATE('25/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('providakis', 'demosthenes', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('providakis', 'marmatakis', TO_DATE('29/03/2020', 'dd/mm/yyyy'));
INSERT INTO CONTACT VALUES ('marmatakis', 'demosthenes', TO_DATE('30/03/2020', 'dd/mm/yyyy'));

SELECT PERSON.EPONYMO, PERSON.ONOMA, PERSON.SYMPTOMS 
FROM PERSON;

-- Βρες πόσα συμπτώματα είχε κάθε ασθενής 
SELECT PERSON.EPONYMO, PERSON.ONOMA, array_length (PERSON.SYMPTOMS, 1)
FROM PERSON;

-- Βρείτε τα άτομα που παρουσίασαν και πυρετό και βήχα
SELECT PERSON.EPONYMO, PERSON.ONOMA, SYMPTOMS   
FROM PERSON
WHERE 'Cough' = ANY (SYMPTOMS)
INTERSECT
SELECT PERSON.EPONYMO, PERSON.ONOMA, SYMPTOMS   
FROM PERSON
WHERE 'Fever' = ANY (SYMPTOMS);

/*
 Βρείτε τα άτομα που παρουσίασαν βήχα αλλά όχι πυρετό
 */
SELECT PERSON.EPONYMO, PERSON.ONOMA, SYMPTOMS   
FROM PERSON
WHERE 'Cough' = ANY (SYMPTOMS)
EXCEPT
SELECT PERSON.EPONYMO, PERSON.ONOMA, SYMPTOMS   
FROM PERSON
WHERE 'Fever' = ANY (SYMPTOMS);

SELECT *
FROM PERSON
WHERE (PERSON.DIAMONH).POLH = 'Χανιά' and (PERSON.DIAMONH).XORA = 'Ελλάς';

SELECT (PERSON.DIAMONH).TELEPHONE[3]
FROM PERSON
WHERE (PERSON.DIAMONH).POLH = 'Χανιά' and (PERSON.DIAMONH).XORA = 'Ελλάς';

