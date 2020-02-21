-- Να βρεθούν οι καλλιτέχνες που βρίσκονται εν ζωή
-- {τίτλοι στηλών στην εκτύπωση: ΌνομαΚαλλιτέχνη, ΈτοςΓέννησης}.
SELECT Name,YearOfBirth FROM ARTIST WHERE YearOfDeath IS NULL;

-- Να βρεθούν τα έργα τέχνης τα οποία ανήκουν στον τύπο έργων τέχνης που ονομάζεται 'oil on panel'
-- (δηλαδή ουσιαστικά αναζητούνται τα έργα που είναι πίνακες ζωγραφικής με την τεχνική «λάδι σε πάνελ»)
-- {τίτλος στήλης στην εκτύπωση: ΟνομασίαΈργου}.
SELECT * FROM ARTWORK inner join TYPEOFWORK on ARTWORK.TypeOfWork=TYPEOFWORK.TypeID WHERE TYPEOFWORK.Name='oil on panel';;