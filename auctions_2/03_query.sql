-- 6. Να βρεθούν τα εκθέματα που ενδιαφέρουν τον συμμετέχοντα με ψευδώνυμο της επιλογής
-- σας στην δημοπρασία με κωδικό AU01
SELECT (postcontent).artworks
FROM posts
WHERE posts.author = 'john'
  AND posts.auction = 'AU01';

-- 7. Εκτυπώστε από μία φορά όλα τ/α εκθέματα που υπάρχουν σε μηνύματα που ανάρτησαν
-- συμμετέχοντες στις δημοπρασίες που έχουν καταχωρηθεί στη βάση δεδομένων
drop view if exists artwork_id_in_posts;
create view artwork_id_in_posts as
select distinct unnest((postcontent).artworks) as id
from posts;
select *
from artwork_id_in_posts a
         inner join artwork on a.id = artwork.artworkid;

-- 8. Εκτυπώστε το περιεχόμενο και τον συγγραφέα των μηνυμάτων που δεν περιλαμβάνουν
-- κάποιο συγκεκριμένο έκθεμα της επιλογής σας
select postcontent, author
from posts
where not 'ΑW08' = ANY ((postcontent).artworks);

-- 9. Να υπολογιστεί το πλήθος των μηνυμάτων που έχουν αναρτήσει συμμετέχοντες και τα οποία
-- αναφέρονται σε ένα έκθεμα της επιλογής σας
select count(*) as "Post count"
from posts
where 'ΑW08' = ANY ((postcontent).artworks);

-- 10. Να υπολογιστεί το πλήθος των μηνυμάτων που αναρτήθηκαν από συμμετέχοντα με
-- ψευδώνυμο της επιλογής σας (σε οποιοδήποτε τοίχο) και αναφέροντα στο κάποιο
-- συγκεκριμένο έκθεμα της επιλογής σας
select count(*) as "Message count"
from posts
where posts.author = 'marcelo97'
  and 'ΑW08' = ANY ((postcontent).artworks);

-- 11. Να εκτυπωθούν τα περιεχόμενα των μηνυμάτων και ο τοίχος που αναρτήθηκαν από το
-- συμμετέχοντα με ψευδώνυμο της επιλογής σας και αναφέροντα στο κάποιο συγκεκριμένο
-- έκθεμα της επιλογής σας
select (postcontent).posttext, (postcontent).nickname
from posts
where posts.author = 'marcelo97'
  and 'ΑW08' = ANY ((postcontent).artworks);

-- 12. Να εκτυπωθούν τα περιεχόμενα των μηνυμάτων που αναφέρονται σε έκθεμα 1 (της επιλογής
-- σας) ή έκθεμα 2 (της επιλογής σας) - Χρήση του operator &&
select postcontent
from posts
where 'ΑW10' = ANY ((postcontent).artworks)
   or 'ΑW19' = ANY ((postcontent).artworks);

-- 13. Να εκτυπωθεί μόνο το πρώτο έκθεμα και τα περιεχόμενα των μηνυμάτων που αναφέρονται
-- και σε κάποιο άλλο έκθεμα (της επιλογής σας) και να ομαδοποιηθούν ως προς το πρώτο
-- έκθεμα - Χρήση του τελεστή @>
select (postcontent).artworks[1] as id, (postcontent).posttext, author
from posts
where (postcontent).artworks @> ARRAY ['ΑW08']
group by id, postcontent, author;

-- 14. Να εκτυπωθούν οι κωδικοί και τα περιεχόμενα των μηνυμάτων που αναφέρονται σε έκθεμα
-- (της επιλογής σας) και αναρτήθηκαν από τον χρήστη με ψευδώνυμο της επιλογής σας στον
-- τοίχο κάποιου άλλου χρήστη της επιλογής σας
-- select *
select postid, postcontent
from posts
where author = 'john'
  and (postcontent).nickname = 'mariap';

-- 15. Για όλα τα μηνύματα που αναφέρονται στο έκθεμα της επιλογής σας να εκτυπωθούν οι
-- ημερομηνίες ανάρτησης, τα περιεχόμενα των μηνυμάτων, οι συγγραφείς τους και οι
-- ιδιοκτήτες των τοίχων που αναρτήθηκαν τα μηνύματα
select (postcontent).postdate, (postcontent).posttext, author, (postcontent).nickname
from posts
where 'ΑW08' = ANY ((postcontent).artworks);