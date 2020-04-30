-- Να βρεθούν οι καλλιτέχνες που βρίσκονται εν ζωή {ΌνομαΚαλλιτέχνη, ΈτοςΓέννησης}και
-- είναι άνδρες.
SELECT Name, YearOfBirth
FROM ARTIST
WHERE YearOfDeath IS NULL
  and Sex = 'Male';

-- Να βρεθούν οι καλλιτέχνες {ΌνομαΚαλλιτέχνη, ΈτοςΓέννησης} που είναι γυναίκες.
SELECT Name, YearOfBirth
FROM ARTIST
WHERE Sex = 'Female';

-- Να βρεθεί για κάθε γυναίκα καλλιτέχνη το συνολικό πλήθος των διαφορετικών έργων του
-- που έχουν διατεθεί σε δημοπρασίες {ΚωδικόςΚαλλιτέχνη, ΌνομαΚαλλιτέχνη,
-- ΣυνολικόΠλήθοςΈργων}. Τα αποτελέσματα να τυπωθούν διατεταγμένα σε φθίνουσα
-- διάταξη ως προς το συνολικό πλήθος έργων.
SELECT AR.ArtistID , AR.Name , COUNT(DISTINCT AW.ArtWorkID)
FROM ARTIST AR, ARTWORK AW, INCLUDED I
WHERE AR.ArtistID = AW.ArtistID AND AW.ArtWorkID = I.ArtWorkID and AR.sex = 'Female'
GROUP BY AR.ArtistID, AR.Name
ORDER BY COUNT(DISTINCT AW.ArtWorkID) DESC;
