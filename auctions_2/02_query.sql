-- Να βρεθούν τα AUCTIONHOUSE {AUCTIONHOUSEID, name website} που δηλώνουν ως
-- έδρα μια πόλη της αρεσκείας σας (π.χ. την πόλη (New York).
SELECT AUCTIONHOUSEID, NAME, WEBSITE
FROM AUCTIONHOUSE
WHERE (AUCTIONHOUSE.ADDRESS).POLH = 'New York';

-- Να βρεθεί το κινητό τηλέφωνο του υπευθύνου του ΑCTIONHOUSE που δηλώνει σταθερό
-- τηλέφωνο επικοινωνίας της αρεσκείας σας (π.χ. το 2810379190). Στην απάντηση σας να
-- αποτυπώνεται το όνομα του AUCTIONHOUSE και το κινητό τηλέφωνο του υπευθύνου
SELECT NAME, Phone[2]
FROM auctionhouse
WHERE Phone[1] = '2810444333';