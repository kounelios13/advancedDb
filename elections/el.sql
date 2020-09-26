DROP TABLE IF EXISTS ELECTIONS CASCADE;
DROP TABLE IF EXISTS GRAPHNODE CASCADE;
DROP TABLE IF EXISTS PROPERTYLINK CASCADE;

CREATE TABLE ELECTIONS
(
    NODEKEY  VARCHAR(30) NOT NULL,
    FACET    TEXT,
    THLEFONA TEXT[],
    PRIMARY KEY (NODEKEY)
);

/* Εισαγωγή εγγραφών στον Πίνακα {ELECTIONS} */
INSERT INTO ELECTIONS
VALUES ('HMMY', 'TMHMA', ARRAY ['2810111111','2810111112']);
INSERT INTO ELECTIONS
VALUES ('ΜΗΧΑΝΙΚΩΝ', 'ΣΧΟΛΗ', ARRAY ['2810111111','2810111112']);
INSERT INTO ELECTIONS
VALUES ('ΔΙΟΙΚΗΣΗΣ', 'ΣΧΟΛΗ', ARRAY ['2810111111','2810111112']);
INSERT INTO ELECTIONS
VALUES ('ΕΛΜΕΠΑ', 'ΙΔΡΥΜΑ', ARRAY ['2810111111','2810111112']);
INSERT INTO ELECTIONS
VALUES ('ΑΚΟΥΜΙΑΝΑΚΗΣ', 'ΔΕΠ', ARRAY ['2810555551','2810111112']);
INSERT INTO ELECTIONS
VALUES ('ΠΑΠΑΔΟΥΡΑΚΗΣ', 'ΔΕΠ', ARRAY ['2810666661','2810111112']);
INSERT INTO ELECTIONS
VALUES ('ΞΕΖΩΝΑΚΗΣ', 'ΔΕΠ', ARRAY ['2810777771','2810111112']);

CREATE TABLE GRAPHNODE
(
    NODEKEY VARCHAR(30) NOT NULL,
    FACET   VARCHAR(30),
    PRIMARY KEY (NODEKEY)
);

CREATE TABLE PROPERTYLINK
(
    NODEKEY1      VARCHAR(30) NOT NULL,
    NODEKEY2      VARCHAR(30) NOT NULL,
    PROPERTYLABEL VARCHAR(30) NOT NULL,
    VOTES         INT,
    FOREIGN KEY (NODEKEY1) REFERENCES GRAPHNODE (NODEKEY),
    FOREIGN KEY (NODEKEY2) REFERENCES GRAPHNODE (NODEKEY),
    PRIMARY KEY (NODEKEY1, NODEKEY2, PROPERTYLABEL)
);

INSERT INTO GRAPHNODE
VALUES ('HMMY', 'TMHMA');
INSERT INTO GRAPHNODE
VALUES ('ΜΗΧΑΝΙΚΩΝ', 'ΣΧΟΛΗ');
INSERT INTO GRAPHNODE
VALUES ('ΔΙΟΙΚΗΣΗΣ', 'ΣΧΟΛΗ');
INSERT INTO GRAPHNODE
VALUES ('ΕΛΜΕΠΑ', 'ΙΔΡΥΜΑ');
INSERT INTO GRAPHNODE
VALUES ('ΑΚΟΥΜΙΑΝΑΚΗΣ', 'ΔΕΠ');
INSERT INTO GRAPHNODE
VALUES ('ΠΑΠΑΔΟΥΡΑΚΗΣ', 'ΔΕΠ');
INSERT INTO GRAPHNODE
VALUES ('ΞΕΖΩΝΑΚΗΣ', 'ΔΕΠ');

INSERT INTO PROPERTYLINK
VALUES ('ΑΚΟΥΜΙΑΝΑΚΗΣ', 'HMMY', 'CANDIDATE_FOR', 25);
INSERT INTO PROPERTYLINK
VALUES ('ΠΑΠΑΔΟΥΡΑΚΗΣ', 'HMMY', 'CANDIDATE_FOR', 25);
INSERT INTO PROPERTYLINK
VALUES ('ΞΕΖΩΝΑΚΗΣ', 'ΜΗΧΑΝΙΚΩΝ', 'CANDIDATE_FOR', 25);

INSERT INTO PROPERTYLINK
VALUES ('HMMY', 'ΜΗΧΑΝΙΚΩΝ', 'BELONGS_TO', NULL);
INSERT INTO PROPERTYLINK
VALUES ('ΜΗΧΑΝΙΚΩΝ', 'ΕΛΜΕΠΑ', 'BELONGS_TO', NULL);
/*
Q4: Στο γράφο που δημιουργήσατε γράψτε τις δηλώσεις SQL που υπολογίζουν
•    Υπολογίστε τους υποψήφιους για κάθε δομή και τους ψήφους που έλαβαν – διάσχιση γράφου κατεύθυνσης [5 μονάδες]
•    Υπολογίστε όλες τις διαδρομές που εμπλέκεται ο κόμβος HMMY – διάσχιση μη κατευθυνόμενου γράφου [5 μονάδες]
*/
select votes, nodekey1
from propertylink;
select *
from propertylink
where nodekey1 = 'HMMY'
   or nodekey2 = 'HMMY';

/*
Q5: Με τη χρήση αναδρομικού ερωτήματος SQL υπολογίστε (α)
Για κάθε κόμβο υπολογίστε όλους τους προηγούμενους και όλους τους επόμενους σε όλες τις κατευθύνσεις [5 μονάδες]
(β) Βρείτε όλες τις δομές στις οποίες είναι υποψήφιος ο ΑΚΟΥΜΙΑΝΑΚΗΣ [5 μονάδες]
*/

WITH RECURSIVE FIND_NEXT_NODES AS (
    SELECT NODEKEY1, PROPERTYLABEL, NODEKEY2
    FROM PROPERTYLINK N
    UNION
    SELECT N.NODEKEY1, N.PROPERTYLABEL, N.NODEKEY2
    FROM PROPERTYLINK N
             INNER JOIN FIND_NEXT_NODES F ON N.NODEKEY1 = F.NODEKEY2 AND N.PROPERTYLABEL = F.PROPERTYLABEL
)
SELECT *
FROM FIND_NEXT_NODES;
----------------------------------------------------
WITH RECURSIVE TRANSITIVE_CLOSURE(NODEKEY1, NODEKEY2, PROPERTYLABEL, DISTANCE, PATH_STRING) AS (
    SELECT NODEKEY1,
           NODEKEY2,
           PROPERTYLABEL,
           1                            AS DISTANCE,
           NODEKEY1 || '->' || NODEKEY2 AS PATH_STRING
    FROM PROPERTYLINK
    UNION
    SELECT TC.NODEKEY1,
           E.NODEKEY2,
           TC.PROPERTYLABEL,
           TC.DISTANCE + 1,
           TC.PATH_STRING || '->' || E.NODEKEY2 AS PATH_STRING
    FROM PROPERTYLINK AS E
             JOIN TRANSITIVE_CLOSURE AS TC
                  ON E.NODEKEY1 = TC.NODEKEY2
    WHERE TC.PATH_STRING NOT LIKE '%' || E.NODEKEY2 || '%'
)
SELECT *
FROM TRANSITIVE_CLOSURE tc join PROPERTYLINK p on tc.NODEKEY1= p.nodekey1
where tc.PROPERTYLABEL = 'CANDIDATE_FOR'
ORDER BY tc.NODEKEY1, tc.NODEKEY2, DISTANCE;


