DROP TABLE IF EXISTS ELECTIONS CASCADE;

/* Δημιουργία Πίνακα {ELECTIONS} */
CREATE TABLE ELECTIONS (
NODEKEY VARCHAR(30) NOT NULL,
FACET TEXT,
tel text[],
PRIMARY KEY(NODEKEY));

/* Εισαγωγή εγγραφών στον Πίνακα {ELECTIONS} */
INSERT INTO ELECTIONS VALUES ('HMMY', 'TMHMA',array['6955123412','21012341234']);
INSERT INTO ELECTIONS VALUES ('ΜΗΧΑΝΙΚΩΝ','ΣΧΟΛΗ',array['69553453412','21012876234']);
INSERT INTO ELECTIONS VALUES ('ΔΙΟΙΚΗΣΗΣ','ΣΧΟΛΗ',array['695513453412','210133541234']);
INSERT INTO ELECTIONS VALUES ('ΕΛΜΕΠΑ', 'ΙΔΡΥΜΑ',array['69551234412','210121231234']);
INSERT INTO ELECTIONS VALUES ('ΑΚΟΥΜΙΑΝΑΚΗΣ', 'ΔΕΠ',array['6953453412','21042341234']);
INSERT INTO ELECTIONS VALUES ('ΠΑΠΑΔΟΥΡΑΚΗΣ', 'ΔΕΠ',array['69553423412','210355341234']);
INSERT INTO ELECTIONS VALUES ('ΞΕΖΩΝΑΚΗΣ', 'ΔΕΠ',array['6955463412','2101212341234']);

---Στη συνέχεια διατυπώστε σε SQL το ερώτημα "Για κάθε πλειάδα της κατηγορίας ΔΕΠ βρείτε το πρώτο τηλέφωνο που καταγράφεται" [2.5 μονάδες].

select tel[1] from elections where facet='ΔΕΠ';

/*
Q2: Δημιουργήστε μια ιεραρχία εξειδίκευσης έτσι ώστε παραστάσεις του πίνακα ELECTIONS να διακρίνονται είτε σε εκπαιδευτικές μονάδες (UNIT) που διενεργούν
εκλογές είτε σε υποψήφιους (CANDIDATES) που θέτουν υποψηφιότητα στις εκλογές [4 μονάδες].
 Στην περίπτωση των εκπαιδευτικών μονάδων θα πρέπει να καταγράφονται υπό μορφή πλειότιμου γνωρίσματος οι κατηγορίες που έχουν δικαίωμα ψήφου [2 μονάδες].

*/

create table unit(
	NODEKEY VARCHAR(30) NOT NULL,
	categories text[],
	primary key (nodekey)
)inherits(elections);

create table cantidates(
	NODEKEY VARCHAR(30) NOT NULL,
	primary key (nodekey)
)inherits(elections);


insert into unit (nodekey, categories) values ('ΜΗΧΑΝΙΚΩΝ',array['cat1','cat2']),('ΔΙΟΙΚΗΣΗΣ',array['cat3','cat2']),('HMMY',array['cat1','cat3']);
insert into unit (nodekey, categories) values ('ΕΛΜΕΠΑ',array['cat4','cat1']);
insert into cantidates (nodekey) values ('ΑΚΟΥΜΙΑΝΑΚΗΣ'),('ΠΑΠΑΔΟΥΡΑΚΗΣ'),('ΞΕΖΩΝΑΚΗΣ');

/*
Q3: Δημιουργήστε τη σχεσιακή αναπαράσταση ενός (property) graph δύο κατευθύνσεων. Η πρώτη κατεύθυνση ('CANDIDATE_FOR')
θα πρέπει να συνδέει υποψήφιους με τις δομές στις οποίες θέτουν υποψηφιότητα ενώ η δεύτερη κατεύθυνση ('BELONGS_TO') θα πρέπει να συνδέει τις δομές μεταξύ τους
(δηλαδή το τμήμα HMMY ανήκει στη σχολή ΜΗΧΑΝΙΚΩΝ, η σχολή ΜΗΧΑΝΙΚΩΝ ανήκει στο ΕΛΜΕΠΑ, κοκ). Στις συνδέσεις που θα καταγραφούν να υπάρχει και ένα γενικό γνώρισμα τύπου INT που να μπορεί να λάβει
τιμή NULL και το οποίο θα καταγράφει τους ψήφους που συνέλεξε ένας υποψήφιος στις εκλογές, διαφορετικά θα είναι NULL. Μπορείτε να υποθέσετε ότι οι υποψηφιότητες που υποβλήθηκαν για το τμήμα HMMY είναι δύο,
από τους ΑΚΟΥΜΙΑΝΑΚΗΣ και ΠΑΠΑΔΟΥΡΑΚΗΣ και έλαβαν καθένας 25 ψήφους. Επίσης ο ΞΕΖΩΝΑΚΗΣ ήταν υποψήφιος στη σχολή των ΜΗΧΑΝΙΚΩΝ και έλαβε 25 ψήφους.
Τέλος στην κατεύθυνση ‘BELONGS_TO’ να θεωρήσετε ότι το HMMY ανήκει στη σχολή ΜΗΧΑΝΙΚΩΝ η οποία με τη σειρά της ανήκει στο ΕΛΜΕΠΑ.

*/

CREATE TABLE PROPERTYLINK (
NODEKEY1 VARCHAR(30) NOT NULL,
NODEKEY2 VARCHAR(30) NOT NULL,
PROPERTYLABEL VARCHAR(30) NOT NULL,
votes int,
FOREIGN KEY (NODEKEY1) REFERENCES ELECTIONS (NODEKEY),
FOREIGN KEY (NODEKEY2) REFERENCES ELECTIONS (NODEKEY),
PRIMARY KEY (NODEKEY1, NODEKEY2, PROPERTYLABEL)
);

insert into PROPERTYLINK values('HMMY','ΜΗΧΑΝΙΚΩΝ','BELONGS_TO',NULL);
insert into PROPERTYLINK values('ΜΗΧΑΝΙΚΩΝ','ΕΛΜΕΠΑ','BELONGS_TO',NULL);
insert into PROPERTYLINK values('ΑΚΟΥΜΙΑΝΑΚΗΣ','HMMY','CANDIDATE_FOR',25);
insert into PROPERTYLINK values('ΠΑΠΑΔΟΥΡΑΚΗΣ','HMMY','CANDIDATE_FOR',25);
insert into PROPERTYLINK values('ΞΕΖΩΝΑΚΗΣ','ΜΗΧΑΝΙΚΩΝ','CANDIDATE_FOR',25);

/*
Q4: Στο γράφο που δημιουργήσατε γράψτε τις δηλώσεις SQL που υπολογίζουν
•    Υπολογίστε τους υποψήφιους για κάθε δομή και τους ψήφους που έλαβαν – διάσχιση γράφου κατεύθυνσης [5 μονάδες]
•    Υπολογίστε όλες τις διαδρομές που εμπλέκεται ο κόμβος HMMY – διάσχιση μη κατευθυνόμενου γράφου [5 μονάδες]
*/

select votes, nodekey1 from propertylink where votes is not null;
select * from propertylink where nodekey1='HMMY' or nodekey2='HMMY';

/*
Q5: Με τη χρήση αναδρομικού ερωτήματος SQL υπολογίστε
(α) Για κάθε κόμβο υπολογίστε όλους τους προηγούμενους και όλους τους επόμενους σε όλες τις κατευθύνσεις [5 μονάδες]
(β) Βρείτε όλες τις δομές στις οποίες είναι υποψήφιος ο ΑΚΟΥΜΙΑΝΑΚΗΣ [5 μονάδες]
*/
--α
WITH RECURSIVE anadromi(NODEKEY1, NODEKEY2,path) AS
( SELECT p.NODEKEY1, p.NODEKEY2, p.NODEKEY1 || '->' ||p.NODEKEY2 as path
FROM PROPERTYLINK p
UNION all
    SELECT a.NODEKEY1, p.NODEKEY2, path || '->' ||p.NODEKEY2 as path
    FROM PROPERTYLINK p, anadromi a
    WHERE a.nodekey2= p.nodekey1 and path not like '%'||p.nodekey2||'->%'
  )
SELECT *
FROM anadromi;
--β
WITH RECURSIVE anadromi(NODEKEY1, NODEKEY2,path) AS
( SELECT p.NODEKEY1, p.NODEKEY2, p.NODEKEY1 || '->' ||p.NODEKEY2 as path
FROM PROPERTYLINK p
UNION all
    SELECT a.NODEKEY1, p.NODEKEY2, path || '->' ||p.NODEKEY2 as path
    FROM PROPERTYLINK p, anadromi a
    WHERE a.nodekey2= p.nodekey1 and path not like '%'||p.nodekey2||'->%'
  )
SELECT *
FROM anadromi where nodekey1='ΑΚΟΥΜΙΑΝΑΚΗΣ'

