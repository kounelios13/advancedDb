Drop table IF EXISTS PERSON cascade;
Drop table IF EXISTS CONTACT cascade;

DROP TYPE IF EXISTS ADDRESS cascade;
DROP TYPE IF EXISTS FYLLO cascade;

CREATE TYPE FYLLO AS ENUM ('Άνδρας','Γυναίκα');

CREATE TYPE ADDRESS AS  (
	POLH VARCHAR(60),
	XORA VARCHAR(60));

/* Δημιουργία Πίνακα {ΚΡΟΥΣΜΑ} */
CREATE TABLE PERSON
(KODIKOS VARCHAR(30) NOT NULL,
ONOMA VARCHAR(60) NOT NULL,
EPONYMO VARCHAR(120),
GENOS FYLLO NOT NULL,
SYMPTOMS TEXT [],
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
INSERT INTO PERSON VALUES ('demosthenes', 'Δημοσθένης', 'Ακουμιανάκης', 'Άνδρας', '{Fever, Cough}', ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('ktistakis', 'Γιώργος', 'Κτιστάκης', 'Άνδρας', '{Fever}', ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('fousteris', 'Νίκος', 'Φουστέρης', 'Άνδρας', '{Cough}', ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('koborakis', 'Γιάννης', 'Κομποράκης', 'Άνδρας', ARRAY['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('providakis', 'Αντωνης', 'Προβιδακης', 'Άνδρας', ARRAY['Cough'], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('marmatakis', 'Δημητρης', 'Μαρματακης', 'Άνδρας', ARRAY['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('feretzakis', 'Γιαννης', 'Φερετζακης', 'Άνδρας', ARRAY['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('vellis', 'Γιώργος', 'Βελής', 'Άνδρας', ARRAY['Cough'], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('kotsalis', 'Δημήτρης', 'Κότσαλης', 'Άνδρας', ARRAY['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
INSERT INTO PERSON VALUES ('plemenos', 'Ανάργυρος', 'Πλεμένος', 'Άνδρας', ARRAY['Fever'], ROW ('Χανιά', 'Ελλάς'));

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




-- Βρες τα συμπτώματα κάθε ασθενή 
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ, PERSON.SYMPTOMS AS ΣΥΜΠΤΩΜΑΤΑ
FROM PERSON;

-- Βρες τα συμπτώματα συγκεκριμένου ασθενή 
SELECT PERSON.SYMPTOMS[1] AS ΣΥΜΠΤΩΜΑΤΑ
FROM PERSON
WHERE PERSON.KODIKOS='demosthenes';

-- Βρες το ονοματεπώνυμο των ασθενών που εμφάνισαν 'Cough' ως δεύτερο σύμπτωμα
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
FROM PERSON WHERE PERSON.SYMPTOMS[2] = 'Cough';

-- Βρες το ονοματεπώνυμο των ασθενών που δεν εμφάνιοαν 'Fever' ως πρώτο σύμπτωμα
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ 
FROM PERSON WHERE PERSON.SYMPTOMS[1] != 'Fever';

-- Βρες το ονοματεπώνυμο των ασθενών που ως πρώτο σύμπτωμα εμφάνισνα είτε 'Fever' είτε 'Cough' 
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ 
FROM PERSON WHERE PERSON.SYMPTOMS[1] = 'Fever' OR PERSON.SYMPTOMS[1] = 'Cough';

-- Βρες το ονοματεπώνυμο των ασθενών που εμφάνισαν πρώτο σύμπτωμα 'Fever' και δεύτερο 'Cough' 
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ 
FROM PERSON WHERE PERSON.SYMPTOMS[1] = 'Fever' AND PERSON.SYMPTOMS[2] = 'Cough';

-- Βρείτε τα άτομα που παρουσίασαν και πυρετό και βήχα
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ 
FROM PERSON
WHERE 'Cough' = ANY (SYMPTOMS)
INTERSECT
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ    
FROM PERSON
WHERE 'Fever' = ANY (SYMPTOMS);

-- Βρείτε τα άτομα που παρουσίασαν βήχα αλλά όχι πυρετό (χωρίς να ενδιαφέρει η ακολουθία)
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ    
FROM PERSON
WHERE 'Cough' = ANY (SYMPTOMS)
EXCEPT
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ    
FROM PERSON
WHERE 'Fever' = ANY (SYMPTOMS);

-- Βρείτε τα άτομα που δεν παρουσίασαν 'Cough'
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ    
FROM PERSON
EXCEPT
SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ    
FROM PERSON
WHERE 'Cough' = ANY (SYMPTOMS)
