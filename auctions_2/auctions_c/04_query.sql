-- 1.	Εκτυπώστε τα είδη των έργων για τα οποία έχει εμπειρογνωμοσύνη ο εμπειρογνώμονας με ψευδώνυμο της επιλογής σας
select LIST_OF_TYPES
from expert
where nickname = 'marcelo97';

-- 2.	Εκτυπώστε τα ψευδώνυμα των αρχάριων (NOVICE)
select nickname
from only novice;

-- 3.	Εκτυπώστε το ψευδώνυμο, όνομα και επώνυμο όλων των παραστάσεων EXPERT
select collector.nickname, collector.firstname, collector.lastname
from only collector, expert
where expert.nickname = collector.nickname;

-- 4.	Εκτυπώστε όλα τα στοιχεία όσων είναι EXPERT
select collector.*, expert.list_of_types
from only collector, expert
where expert.nickname = collector.nickname;

-- 5.	Εκτυπώστε τις παραστάσεις τύπου NOVICE
select collector.*, novice.date_of_birth, novice.typeid
from only collector, novice
where novice.nickname = collector.nickname;

-- 6.	Εκτυπώστε το ψευδώνυμο, την ημερομηνία γέννησης και τύπο εκθέματος των αρχαρίων της βάσης
select novice.nickname, novice.date_of_birth, novice.typeid
from only novice;

-- 7.	Εκτυπώστε τις παραστάσεις από τον πίνακα EXPERT που ειδικεύονται σε πάνω από ένα τύπο εκθέματος
select collector.*, expert.list_of_types
from only collector, expert
where expert.nickname = collector.nickname
  and array_length(expert.list_of_types, 1) > 1;

-- 8.	Εκτυπώστε τα ψευδώνυμα και το περιεχόμενο των μηνυμάτων που κατέθεσαν εμπειρογνώμονες για όσα μηνύματα δεν περιλαμβάνουν αναφορά στο έργο με κωδικό 'AW22'
select expert.nickname, posts.postcontent
from posts,
     expert
where expert.nickname = posts.author
  and not 'AW22' = ANY ((postcontent).artworks);

-- 9.	Εκτυπώστε τα ψευδώνυμα των EXPERTS (μόνο) και τα περιεχόμενα των μηνυμάτων που ανάρτησαν (σε οποιοδήποτε τοίχο)
--      τα οποία αναφέρονται στο έργο με κωδικό της αρεσκείας (που να εμφανίζεται και σε μήνυμα από NOVICE)
select distinct expert.nickname, posts.postcontent
from only posts,
    expert,
    novice
where (expert.nickname = posts.author and 'AW08' = ANY ((postcontent).artworks))
   or (novice.nickname = posts.author and 'AW08' = ANY ((postcontent).artworks));

-- 10.	Να εκτυπωθούν οι κωδικοί και τα περιεχόμενα των μηνυμάτων που αναφέρονται σε έργο με κωδικό της αρεσκείας σας
--      και τα οποία (μηνύματα)  αναρτήθηκαν από κάποιον NOVICE στον τοίχο κάποιου EXPERT
select posts.postid, posts.postcontent
from posts,
     expert,
     novice
where expert.nickname = (postcontent).nickname
  and novice.nickname = posts.author
  and 'ΑW08' = ANY ((postcontent).artworks);