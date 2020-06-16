Drop table IF EXISTS PERSON cascade;
Drop table IF EXISTS CONTACT cascade;
Drop table IF EXISTS CONTACT cascade;
Drop table IF EXISTS UNORMALIZED cascade;

DROP TYPE IF EXISTS ADDRESS cascade;
DROP TYPE IF EXISTS FYLLO cascade;

CREATE TYPE FYLLO AS ENUM ('Άνδρας','Γυναίκα');

CREATE TYPE ADDRESS AS
(
    POLH VARCHAR(60),
    XORA VARCHAR(60)
);

/* Δημιουργία Πίνακα {ΕΠΑΦΕΣ} */
CREATE TABLE PERSON
(
    KODIKOS  VARCHAR(30) NOT NULL,
    ONOMA    VARCHAR(60) NOT NULL,
    EPONYMO  VARCHAR(120),
    GENOS    FYLLO       NOT NULL,
    SYMPTOMS TEXT[],
    DIAMONH  ADDRESS,
    PRIMARY KEY (KODIKOS)
);

/* Δημιουργία Πίνακα {ΚΡΟΥΣΜΑ} */
CREATE TABLE CONTACT
(
    CONNECTIONID INTEGER,
    KODIKOS1     VARCHAR(30) NOT NULL,
    KODIKOS2     VARCHAR(30),
    TYPE         VARCHAR(30),
    CONTACTDATE  DATE,
    FOREIGN KEY (KODIKOS1) REFERENCES PERSON (KODIKOS),
    PRIMARY KEY (CONNECTIONID, KODIKOS1)
);
drop type if exists ARROW;
CREATE TYPE ARROW AS
(
    TYP         VARCHAR(30),
    DESTINATION VARCHAR(30)
);

CREATE TABLE UNORMALIZED
(
    KOMVOS TEXT NOT NULL,
    ACT    text[][],
    PRIMARY KEY (KOMVOS)
);

INSERT INTO UNORMALIZED
VALUES ('demosthenes', ARRAY [['contacted' , 'vellis'],['email' , 'da@hmu.gr']]);

-- CREATE TABLE UNORMALIZED
-- (
--     KOMVOS    TEXT NOT NULL,
--     INCOMING  TEXT[],
--     OUTCOMING TEXT[],
--     PRIMARY KEY (KOMVOS)
-- );

-- INSERT INTO UNORMALIZED
-- VALUES ('demosthenes', ARRAY ['providakis','ktistakis'], ARRAY ['vellis']);
-- INSERT INTO UNORMALIZED
-- VALUES ('providakis', ARRAY ['vellis'], ARRAY ['demosthenes', 'marmatakis']);
-- INSERT INTO UNORMALIZED
-- VALUES ('vellis', ARRAY ['demosthenes'], ARRAY ['providakis','marmatakis','koborakis']);
-- INSERT INTO UNORMALIZED
-- VALUES ('ktistakis', NULL, ARRAY ['demosthenes','koborakis']);
-- INSERT INTO UNORMALIZED
-- VALUES ('marmatakis', ARRAY ['providakis','vellis'], NULL);
-- INSERT INTO UNORMALIZED
-- VALUES ('koborakis', ARRAY ['vellis','ktistakis'], ARRAY ['feretzakis']);
-- INSERT INTO UNORMALIZED
-- VALUES ('feretzakis', ARRAY ['koborakis'], NULL);

/* Εισαγωγή εγγραφών στον  Πίνακα {ΚΡΟΥΣΜΑ} */
INSERT INTO PERSON
VALUES ('demosthenes', 'Δημοσθένης', 'Ακουμιανάκης', 'Άνδρας', '{Fever, Cough}', ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('ktistakis', 'Γιώργος', 'Κτιστάκης', 'Άνδρας', '{Fever}', ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('fousteris', 'Νίκος', 'Φουστέρης', 'Άνδρας', '{Cough}', ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('koborakis', 'Γιάννης', 'Κομποράκης', 'Άνδρας', ARRAY ['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('providakis', 'Αντωνης', 'Προβιδακης', 'Άνδρας', ARRAY ['Cough'], ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('marmatakis', 'Δημητρης', 'Μαρματακης', 'Άνδρας', ARRAY ['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('feretzakis', 'Γιαννης', 'Φερετζακης', 'Άνδρας', ARRAY ['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('vellis', 'Γιώργος', 'Βελής', 'Άνδρας', ARRAY ['Cough'], ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('kotsalis', 'Δημήτρης', 'Κότσαλης', 'Άνδρας', ARRAY ['Fever', 'Cough'], ROW ('Χανιά', 'Ελλάς'));
-- INSERT INTO PERSON
-- VALUES ('plemenos', 'Ανάργυρος', 'Πλεμένος', 'Άνδρας', ARRAY ['Fever'], ROW ('Χανιά', 'Ελλάς'));

/* Εισαγωγή εγγραφών στον  Πίνακα {ΕΠΑΦΕΣ} */
-- INSERT INTO CONTACT
-- VALUES (1, 'demosthenes', 'vellis', 'contacted', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (2, 'providakis', 'demosthenes', 'contacted', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (3, 'providakis', 'marmatakis', 'contacted', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (4, 'vellis', 'providakis', 'contacted', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (5, 'vellis', 'marmatakis', 'contacted', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (6, 'vellis', 'koborakis', 'contacted', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (7, 'ktistakis', 'demosthenes', 'contacted', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (8, 'ktistakis', 'koborakis', 'contacted', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (9, 'marmatakis', NULL, 'contacted', NULL);
-- INSERT INTO CONTACT
-- VALUES (10, 'koborakis', 'feretzakis', 'contacted', TO_DATE('30/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT
-- VALUES (11, 'feretzakis', NULL, 'contacted', NULL);

/* Εισαγωγή εγγραφών στον  Πίνακα {ΕΠΑΦΕΣ} */
-- INSERT INTO CONTACT VALUES ('demosthenes', 'fousteris', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('demosthenes', 'vellis', TO_DATE('16/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('demosthenes', 'kotsalis', TO_DATE('17/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('vellis', 'kotsalis', TO_DATE('18/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('vellis', 'fousteris', TO_DATE('18/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('kotsalis', 'fousteris', TO_DATE('19/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('ktistakis', 'demosthenes', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('ktistakis', 'koborakis', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('ktistakis', 'vellis', TO_DATE('22/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('kotsalis', 'ktistakis', TO_DATE('23/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('fousteris', 'koborakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('fousteris', 'providakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('fousteris', 'marmatakis', TO_DATE('24/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('koborakis', 'feretzakis', TO_DATE('25/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('providakis', 'demosthenes', TO_DATE('28/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('providakis', 'marmatakis', TO_DATE('29/03/2020', 'dd/mm/yyyy'));
-- INSERT INTO CONTACT VALUES ('marmatakis', 'demosthenes', TO_DATE('30/03/2020', 'dd/mm/yyyy'));


-- -- Βρες τα συμπτώματα κάθε ασθενή
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ, PERSON.SYMPTOMS AS ΣΥΜΠΤΩΜΑΤΑ
-- FROM PERSON;
--
-- -- Βρες τα συμπτώματα συγκεκριμένου ασθενή
-- SELECT PERSON.SYMPTOMS[1] AS ΣΥΜΠΤΩΜΑΤΑ
-- FROM PERSON
-- WHERE PERSON.KODIKOS='demosthenes';
--
-- -- Βρες το ονοματεπώνυμο των ασθενών που εμφάνισαν 'Cough' ως δεύτερο σύμπτωμα
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON WHERE PERSON.SYMPTOMS[2] = 'Cough';
--
-- -- Βρες το ονοματεπώνυμο των ασθενών που δεν εμφάνιοαν 'Fever' ως πρώτο σύμπτωμα
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON WHERE PERSON.SYMPTOMS[1] != 'Fever';
--
-- -- Βρες το ονοματεπώνυμο των ασθενών που ως πρώτο σύμπτωμα εμφάνισνα είτε 'Fever' είτε 'Cough'
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON WHERE PERSON.SYMPTOMS[1] = 'Fever' OR PERSON.SYMPTOMS[1] = 'Cough';
--
-- -- Βρες το ονοματεπώνυμο των ασθενών που εμφάνισαν πρώτο σύμπτωμα 'Fever' και δεύτερο 'Cough'
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON WHERE PERSON.SYMPTOMS[1] = 'Fever' AND PERSON.SYMPTOMS[2] = 'Cough';
--
-- -- Βρείτε τα άτομα που παρουσίασαν και πυρετό και βήχα
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON
-- WHERE 'Cough' = ANY (SYMPTOMS)
-- INTERSECT
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON
-- WHERE 'Fever' = ANY (SYMPTOMS);
--
-- -- Βρείτε τα άτομα που παρουσίασαν βήχα αλλά όχι πυρετό (χωρίς να ενδιαφέρει η ακολουθία)
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON
-- WHERE 'Cough' = ANY (SYMPTOMS)
-- EXCEPT
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON
-- WHERE 'Fever' = ANY (SYMPTOMS);
--
-- -- Βρείτε τα άτομα που δεν παρουσίασαν 'Cough'
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON
-- EXCEPT
-- SELECT PERSON.EPONYMO AS ΕΠΩΝΥΜΟ, PERSON.ONOMA AS ΟΝΟΜΑ
-- FROM PERSON
-- WHERE 'Cough' = ANY (SYMPTOMS)
