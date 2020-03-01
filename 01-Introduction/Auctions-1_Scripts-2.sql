-- Να βρεθούν οι δημοπρασίες στις οποίες διατέθηκαν τουλάχιστον δύο (2) και όχι περισσότερα από επτά (7)
-- έργα τέχνης {τίτλοι στηλών στην εκτύπωση: ΚωδικόςΔημοπρασίας, ΟνομασίαΔημοπρασίας,
-- ΠλήθοςΈργων}. [Υπόδειξη: Δημιουργήστε αρχικά μια όψη (χρησιμοποιώντας μόνο τον πίνακα INCLUDED)
-- στην οποία θα υπολογίζετε τον αριθμό έργων τέχνης που διατέθηκαν σε κάθε δημοπρασία, και στη
-- συνέχεια με βάση αυτή συντάξτε το τελικό SQL ερώτημα.]
DROP VIEW IF EXISTS VIEW1;
CREATE VIEW VIEW1 AS
SELECT INCLUDED.AUCTIONID, COUNT(INCLUDED.ARTWORKID) AS CNT
FROM INCLUDED
GROUP BY INCLUDED.AUCTIONID;
SELECT VIEW1.AUCTIONID, AUCTION.NAME, VIEW1.CNT
FROM VIEW1
         INNER JOIN AUCTION ON VIEW1.AUCTIONID = AUCTION.AUCTIONID
WHERE VIEW1.CNT >= 2
  AND VIEW1.CNT < 7
ORDER BY VIEW1.CNT;

-- Να βρεθούν οι καλλιτέχνες που έχουν δημιουργήσει έργα τα οποία ανήκουν στον/στους τύπο/ους έργων
-- τέχνης με τα λιγότερα έργα. {τίτλοι στηλών στην εκτύπωση: ΚωδικόςΚαλλιτέχνη, ΌνομαΚαλλιτέχνη}
-- [Υπόδειξη: Δημιουργήστε αρχικά μια όψη (χρησιμοποιώντας μόνο τον πίνακα ARTWORK) στην οποία θα
-- υπολογίζετε τον αριθμό έργων τέχνης ανά τύπο έργου, και στη συνέχεια με βάση αυτή συντάξτε το τελικό
-- SQL ερώτημα.]
DROP VIEW IF EXISTS VIEW2;
CREATE VIEW VIEW2 AS
SELECT ARTWORK.TYPEOFWORK, COUNT(ARTWORK.TYPEOFWORK) AS CNT
FROM ARTWORK
GROUP BY ARTWORK.TYPEOFWORK;
SELECT ARTIST.ARTISTID, ARTIST.NAME
FROM ARTWORK
         INNER JOIN ARTIST ON ARTWORK.CREATEDBY = ARTIST.ARTISTID
         INNER JOIN VIEW2 ON ARTWORK.TYPEOFWORK = VIEW2.TYPEOFWORK
WHERE VIEW2.CNT = (SELECT MIN(VIEW2.CNT) FROM VIEW2);

-- Να βρεθούν οι καλλιτέχνες που έχουν δημιουργήσει έργα τέχνης τόσο πριν από την ηλικία των 60 ετών,
-- όσο και μετά την ηλικία αυτή. {τίτλοι στηλών στην εκτύπωση: ΚωδικόςΚαλλιτέχνη, ΌνομαΚαλλιτέχνη}.
-- [Υπόδειξη: Δημιουργήστε συνολικά τρεις όψεις, ως εξής. Αρχικά η πρώτη όψη θα περιέχει τον μοναδικό
-- κωδικό του έργου τέχνης, καθώς και την ηλικία του καλλιτέχνη όταν το δημιούργησε. Στην όψη αυτή δεν
-- θα λάβετε υπόψη έργα για τα οποία δεν είναι γνωστό το έτος δημιουργίας. Η δεύτερη και η τρίτη όψη θα
-- δημιουργηθούν κάνοντας χρήση της πρώτης όψης, και θα περιέχουν το μοναδικό κωδικό του καλλιτέχνη,
-- το μοναδικό κωδικό του έργου και την ηλικία του καλλιτέχνη, η μια όψη για ηλικίες κάτω των 60 ετών, και
-- η άλλη όψη για ηλικίες άνω των 60 ετών (συμπεριλαμβάνοντας τα 60 έτη). Το τελικό αποτέλεσμα θα πρέπει
-- να υπολογιστεί κάνοντας χρήση της δεύτερης και της τρίτης όψης που δημιουργήσατε]
DROP VIEW IF EXISTS VIEW3;
CREATE VIEW VIEW3 AS
SELECT ARTWORK.ARTWORKID, ARTWORK.YEAROFCREATION::INT - ARTIST.YEAROFBIRTH::INT AS ARTISTAGEOFCREATION
FROM ARTWORK
         INNER JOIN ARTIST ON ARTWORK.CREATEDBY = ARTIST.ARTISTID;
SELECT *
FROM VIEW3;

DROP VIEW IF EXISTS VIEW4;
CREATE VIEW VIEW4 AS
SELECT ARTIST.ARTISTID, ARTWORK.ARTWORKID, VIEW3.ARTISTAGEOFCREATION
FROM VIEW3
         INNER JOIN ARTWORK ON VIEW3.ARTWORKID = ARTWORK.ARTWORKID
         INNER JOIN ARTIST ON ARTWORK.CREATEDBY = ARTIST.ARTISTID
WHERE VIEW3.ARTISTAGEOFCREATION < 60;
SELECT *
FROM VIEW4;

DROP VIEW IF EXISTS VIEW5;
CREATE VIEW VIEW5 AS
SELECT ARTIST.ARTISTID, ARTWORK.ARTWORKID, VIEW3.ARTISTAGEOFCREATION
FROM VIEW3
         INNER JOIN ARTWORK ON VIEW3.ARTWORKID = ARTWORK.ARTWORKID
         INNER JOIN ARTIST ON ARTWORK.CREATEDBY = ARTIST.ARTISTID
WHERE VIEW3.ARTISTAGEOFCREATION >= 60;
SELECT *
FROM VIEW5;

SELECT ARTIST.ARTISTID, ARTIST.NAME
FROM VIEW5
         INNER JOIN VIEW4 ON VIEW5.ARTISTID = VIEW4.ARTISTID
         INNER JOIN ARTIST ON VIEW4.ARTISTID = ARTIST.ARTISTID;