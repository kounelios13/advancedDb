-- Να βρεθούν οι καλλιτέχνες που βρίσκονται εν ζωή
-- {τίτλοι στηλών στην εκτύπωση: ΌνομαΚαλλιτέχνη, ΈτοςΓέννησης}.
SELECT Name, YearOfBirth
FROM ARTIST
WHERE YearOfDeath IS NULL;

-- Να βρεθούν τα έργα τέχνης τα οποία ανήκουν στον τύπο έργων τέχνης που ονομάζεται 'oil on panel'
-- (δηλαδή ουσιαστικά αναζητούνται τα έργα που είναι πίνακες ζωγραφικής με την τεχνική «λάδι σε πάνελ»)
-- {τίτλος στήλης στην εκτύπωση: ΟνομασίαΈργου}.
SELECT ARTWORK.NAME
FROM ARTWORK
         INNER JOIN TYPEOFWORK ON ARTWORK.TYPEOFWORK = TYPEOFWORK.TYPEID
WHERE TYPEOFWORK.NAME = 'oil on panel';

-- Να βρεθούν οι καλλιτέχνες που έχουν δημιουργήσει έργα τέχνης τα οποία ανήκουν στον τύπο που
-- ονομάζεται 'metal object' (δηλαδή έργα με μέταλλο) {τίτλος στήλης στην εκτύπωση: ΌνομαΚαλλιτέχνη}.
SELECT ARTIST.NAME
FROM ARTIST
         INNER JOIN ARTWORK ON ARTIST.ARTISTID = ARTWORK.CREATEDBY
         INNER JOIN TYPEOFWORK ON ARTWORK.TYPEOFWORK = TYPEOFWORK.TYPEID
WHERE TYPEOFWORK.NAME = 'metal object';

-- Να βρεθεί για κάθε καλλιτέχνη το συνολικό πλήθος των διαφορετικών έργων του που
-- έχουν διατεθεί σε δημοπρασίες {τίτλοι στηλών στην εκτύπωση: ΚωδικόςΚαλλιτέχνη
-- ΌνομαΚαλλιτέχνη, ΣυνολικόΠλήθοςΈργων}. Τα αποτελέσματα να τυπωθούν
-- διατεταγμένα σε φθίνουσα διάταξη ως προς το συνολικό πλήθος έργων. Δεν χρειάζεται
-- να σας απασχολήσει το ενδεχόμενο ύπαρξης καλλιτέχνη για τον οποίο μπορεί να μην έχει
-- διατεθεί σε δημοπρασία κανένα έργο του.
SELECT ARTIST.ARTISTID, ARTIST.NAME, COUNT(DISTINCT ARTWORK.NAME) AS CNT
FROM INCLUDED
         INNER JOIN ARTWORK ON INCLUDED.ARTWORKID = ARTWORK.ARTWORKID
         INNER JOIN ARTIST ON ARTWORK.CREATEDBY = ARTIST.ARTISTID
GROUP BY ARTIST.NAME, ARTIST.ARTISTID
ORDER BY CNT DESC;