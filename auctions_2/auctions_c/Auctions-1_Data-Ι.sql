/* Εισαγωγή δεδομένων στον πίνακα AUCTIONHOUSE */
INSERT INTO AUCTIONHOUSE
VALUES ('AH01', 'Stavros Mihalarias Art Center', ROW ('260 Kifissias Avenue', 'Kifissia', '14562'),
        '{28103334444, 6973555555}',
        'https://en.wikipedia.org/wiki/Mihalarias_Art_Center');
INSERT INTO AUCTIONHOUSE
VALUES ('AH02', 'Christies', ROW ('7 Central Park, Central Way', 'Park Royal', 'London NΑW10 7FY'),
        '{2810444333, 6949390637}',
        'https://en.wikipedia.org/wiki/Christie%27s');
INSERT INTO AUCTIONHOUSE
VALUES ('AH03', 'Sothebys', ROW ('1334 York Avenue', 'New York', 'New York 10021'),
        '{2810123456, 6912345678}',
        'https://en.wikipedia.org/wiki/Sotheby%27s');

/* Εισαγωγή δεδομένων στον πίνακα AUCTION */
INSERT INTO AUCTION
VALUES ('AU01', 'Stavros Mihalarias: The March 1988 Art Sale', 'The March 1988 Stavros Mihalarias Art Sale.',
        '1988-03-01', 'Athens', NULL, 'AH01');
INSERT INTO AUCTION
VALUES ('AU02', 'Christies: The 1996 Greek Sale', 'The December 1996 Christies Greek Sale.', '1996-12-09', 'Athens',
        NULL, 'AH02');
INSERT INTO AUCTION
VALUES ('AU03', 'Sothebys: The 2007 Greek Sale', 'The May 2007 Sothebys Greek Sale.', '2007-05-10', 'London',
        'https://www.sothebys.com/en/auctions/2007/the-greek-sale-l07100.html', 'AH03');
INSERT INTO AUCTION
VALUES ('AU04', 'Sothebys: The 2008 Greek Sale', 'The November 2008 Sothebys Greek Sale.', '2008-11-11', 'London',
        'https://www.sothebys.com/en/auctions/2008/the-greek-sale-l08102.html', 'AH03');
INSERT INTO AUCTION
VALUES ('AU05', 'Sothebys: The 2010 Greek Sale',
        'The November 2010 Sothebys Greek Sale offers a selection of major works by 19th Century artists such as Georgios Jakobides, Theodoros Ralli, Konstantinos Volanakis and Nikolaos Gyzis as well as paintings by 20th Century masters such as Spyros Papaloukas, Konstantinos Maleas, Panagiotis Tetsis, Alecos Fassianos and Pavlos. We look forward to seeing you in London in November. ',
        '2010-11-22', 'London', 'https://www.sothebys.com/en/auctions/2010/the-greek-sale-l10103.html', 'AH03');
INSERT INTO AUCTION
VALUES ('AU06', 'Sothebys: The 2011 Greek Sale',
        'The May 2011 Sothebys Greek Sale offers a selection of major works by 19th Century artists such as Konstantinos Volanakis, , Nikolaos Gyzis and Theodoros Ralli as well as paintings by 20th Century masters such as Yannis Moralis, Konstantinos Parthenis, Yiannis Tsarouchis, Hadjikiriakos-Ghika, Alecos Fassianos and Pavlos. We look forward to seeing you in London in May.',
        '2011-05-09', 'London', 'https://www.sothebys.com/en/auctions/2011/the-greek-sale-l11100.html', 'AH03');
INSERT INTO AUCTION
VALUES ('AU07', 'Christies: Antiquities, October 2019',
        'The Christies October 2019 Antiquities Sale features an exciting selection of works from across the ancient world. Highlighting the sale is an Egyptian Painted Wood Anthropoid Coffin for Pa-Di-Tu-Amun, sold to benefit the Mougins Museum of Classical Art. This life-sized coffin, dating to the Third Intermediate Period (945-889 B.C.), is noteworthy for its remarkable state of preservation and pictorial representations that cover nearly every surface. Also from the Mougins Museum of Classical Art is an Egyptian Blue Cosmetic Vessel of Bes, first published in 1698 and perhaps the earliest documented image of Bes in western literature. Other top lots include a remarkable Roman Marble Relief with the Dioscuri, a powerful Roman Marble Torso of the Diadumenos of Polykleitos from the Collection of Roger Thomas, and a large Greek Gold Oak Wreath.',
        '2019-10-28', 'New York',
        'https://www.christies.com/SaleLanding/index.aspx?intsaleid=28295&lid=1&entry=greek#lot_6228307', 'AH02');

/* Εισαγωγή δεδομένων στον πίνακα ARTIST */
INSERT INTO ARTIST
VALUES ('AR01', 'Pietro Luchini', 'Male', 'Italian', 1800, 1883,
        'Pietro Luchini trained at the Accademia di Carrara in Bergamo under Giuseppe Diotti (1779-1846). He moved to Rome in 1820. He travelled to Paris and London in 1832 and eventually journeyed to Constantinople in the 1850s, where he settled for a decade. Little is known about the artist beyond his intense activity as a portrait painter.',
        NULL);
INSERT INTO ARTIST
VALUES ('AR02', 'John Frederick Lewis', 'Male', 'British', 1804, 1876,
        'John Frederick Lewis RA was an English Orientalist painter. He specialized in Oriental and Mediterranean scenes in detailed watercolour or oils, very often repeating the same composition in a version in each medium. He lived for several years in a traditional mansion in Cairo, and after his return to England in 1851 he specialized in highly detailed works showing both realistic genre scenes of Middle Eastern life and more idealized scenes in upper class Egyptian interiors with little apparent Western influence.',
        'https://en.wikipedia.org/wiki/John_Frederick_Lewis');
INSERT INTO ARTIST
VALUES ('AR03', 'Georg Christian Perlberg', 'Male', 'German', 1806, 1884,
        'Georg Christian Perlberg was the son of the painter Friedrich Perlberg, who relocated to Nuremberg around 1813. In Nuremberg he studied with his father and 1829-1831 at the School of Applied Arts . In the wake of King Otto, he went to Greece in 1833/34 and began in 1834 a study at the Art Academy in Munich. From 1837 he lived and worked in Nuremberg.',
        'https://de.wikipedia.org/wiki/Georg_Christian_Perlberg');
INSERT INTO ARTIST
VALUES ('AR04', 'Helen Boukoura-Altamoura', 'Female', 'Greek', 1821, 1900,
        'Helen Boukoura-Altamoura (Greek: Ελένη Μπούκουρα-Αλταμούρα; Spetses, 1821 - Spetses, 19 March 1900) was the first Greek female painter to become famous. The novel HELEN by Rea Galanakis is about her tragic life.',
        'https://el.wikipedia.org/wiki/Ελένη_Μπούκουρα-Αλταμούρα');
INSERT INTO ARTIST
VALUES ('AR05', 'Nikiforos Lytras', 'Male', 'Greek', 1832, 1904,
        'Nikiforos Lytras (Greek: Νικηφόρος Λύτρας; 1832, Pyrgos, Tinos – June 13, 1904, Athens) was a nineteenth-century Greek painter. He was born in Tinos, and trained in Athens at the School of Arts. In 1860 he won a scholarship to Royal Academy of Fine Arts of Munich. After completing these studies, he became a professor at the School of Arts in 1866, a position he held for the rest of his life. He remained faithful to the precepts and principles of the Munich School, while paying greatest attention both to ethographic themes and portraiture. His most famous portrait was of the royal couple, Otto and Amalia, and his most well-known landscape a depiction of the region of Lavrio.',
        'https://el.wikipedia.org/wiki/Νικηφόρος_Λύτρας');
INSERT INTO ARTIST
VALUES ('AR06', 'Konstantinos Volanakis', 'Male', 'Greek', 1837, 1907,
        'Konstantinos Volanakis (Greek: Κωνσταντίνος Βολανάκης; 1837, Heraklion - 29 June 1907, Piraeus) was a Greek painter who became known as the father of Greek seascape painting.',
        'https://el.wikipedia.org/wiki/Κωνσταντίνος_Βολανάκης');
INSERT INTO ARTIST
VALUES ('AR07', 'Nikolaos Gyzis', 'Male', 'Greek', 1842, 1901,
        'Nikolaos Gyzis (Greek: Νικόλαος Γύζης) was considered one of the most important 19th-century Greek painters. He was most famous for his work Eros and the Painter, his first genre painting. It was auctioned in May 2006 at Bonhams in London, being last exhibited in Greece in 1928. He was the major representative of the so-called Munich School, the major 19th-century Greek art movement.',
        'https://el.wikipedia.org/wiki/Νικόλαος_Γύζης');
INSERT INTO ARTIST
VALUES ('AR08', 'Ioannis Altamouras', 'Male', 'Greek', 1852, 1878,
        'Ioannis Altamouras (Greek: Ιωάννης Αλταμούρας, Florence or Naples, Italy, 1852 - Spetses, May 1878) was a Greek painter who was distinguished mainly for his seascape paintings. He died of tuberculosis at the age of 26. His death and the death of his sister, a few years earlier (also from tuberculosis) caused their mother to lose her mind.',
        'https://el.wikipedia.org/wiki/Ιωάννης_Αλταμούρας');
INSERT INTO ARTIST
VALUES ('AR09', 'Georgios Jakobides', 'Male', 'Greek', 1853, 1932,
        'Georgios Jakobides (Γεώργιος Ιακωβίδης) was a painter and one of the main representatives of the Greek artistic movement of the Munich School. He founded and was the first curator of the National Gallery of Greece in Athens.',
        'https://el.wikipedia.org/wiki/Γεώργιος_Ιακωβίδης');
INSERT INTO ARTIST
VALUES ('AR10', 'Theofilos Hatzimihail', 'Male', 'Greek', 1870, 1934,
        'Theophilos Hatzimihail (Greek: Θεόφιλος Χατζημιχαήλ or Θεόφιλος Κεφαλάς; born c. 1870, Vareia, near Mytilene, island of Lesbos; died in Vareia, Greece, 24 March 1934), known simply as Theophilos, was a major folk painter of modern Greek art. The main subject of his works are Greek characters and the illustration of Greek traditional folklife and history.',
        'https://el.wikipedia.org/wiki/Θεόφιλος_Κεφαλάς_-_Χατζημιχαήλ');
INSERT INTO ARTIST
VALUES ('AR11', 'Thalia Flora-Karavia', 'Female', 'Greek', 1871, 1960,
        'Thalia Flora-Karavia (Greek: Θάλεια Φλωρά-Καραβία, 1871 Siatista – 1960 Athens) was one of the most important and productive Greek painters. Her work has not yet been fully cataloged. However, it is certain that her oil paintings exceed 2,500, and her designs and watercolors are numerous.',
        'https://el.wikipedia.org/wiki/Θάλεια_Φλωρά-Καραβία');
INSERT INTO ARTIST
VALUES ('AR12', 'Konstantinos Parthenis', 'Male', 'Greek', 1878, 1967,
        'Konstantinos Parthenis (Greek: Κωνσταντίνος Παρθένης) was a distinguished Greek painter, born in Alexandria. Parthenis broke with the Greek academic tradition of the 19th century and introduced modern elements together with traditional themes, like the figure of Christ, in his art.',
        'https://el.wikipedia.org/wiki/Κωνσταντίνος_Παρθένης');
INSERT INTO ARTIST
VALUES ('AR13', 'Nikolaos Lytras', 'Male', 'Greek', 1883, 1927,
        'Nikolaos Lytras (Greek: Νικόλαος Λύτρας; Athens, 2 May 1883 - December 1927) was a Greek modernist painter who specialized in portraits, still-lifes and landscapes.',
        'https://el.wikipedia.org/wiki/Νικόλαος_Λύτρας');
INSERT INTO ARTIST
VALUES ('AR14', 'Georgios Zongolopoulos', 'Male', 'Greek', 1903, 2004,
        'George Zongolopoulos (Greek: Γιώργος Ζογγολόπουλος) was an important Greek sculptor, painter and architect. Zongolopoulos, who was often called the eternal teenager was a representative of the so-called Generation of 1930s while his work extends from the 1920s until his late life.',
        'https://el.wikipedia.org/wiki/Γιώργος_Ζογγολόπουλος');
INSERT INTO ARTIST
VALUES ('AR15', 'Nikos Hadjikyriakos-Ghikas', 'Male', 'Greek', 1906, 1994,
        'Nikos Hadjikyriakos-Ghikas (Greek: Νίκος Χατζηκυριάκος–Γκίκας), also known as Niko Ghika, was a leading Greek painter, sculptor, engraver, writer and academic. He was a founding member of the Association of Greek Art Critics, AICA-Hellas, International Association of Art Critics.',
        'https://el.wikipedia.org/wiki/Νίκος_Χατζηκυριάκος_-_Γκίκας');
INSERT INTO ARTIST
VALUES ('AR16', 'Nikos Engonopoulos', 'Male', 'Greek', 1907, 1985,
        'Nikos Engonopoulos (Greek: Νίκος Εγγονόπουλος) was a modern Greek painter and poet. He is one of the most important members of Generation of the 1930s, as well as a major representative of the surrealist movement in Greece. His work as a writer also includes critique and essays.',
        'https://el.wikipedia.org/wiki/Νίκος_Εγγονόπουλος');
INSERT INTO ARTIST
VALUES ('AR17', 'Yannis Tsarouchis', 'Male', 'Greek', 1910, 1989,
        'Yannis Tsarouchis (Greek: Γιάννης Τσαρούχης) was a Greek painter.',
        'https://el.wikipedia.org/wiki/Γιάννης_Τσαρούχης');
INSERT INTO ARTIST
VALUES ('AR18', 'Yannis Moralis', 'Male', 'Greek', 1916, 2009,
        'Yannis Moralis (Greek: Γιάννης Μόραλης) was an important Greek visual artist and part of the so-called Generation of the 1930s.',
        'https://el.wikipedia.org/wiki/Γιάννης_Μόραλης');
INSERT INTO ARTIST
VALUES ('AR19', 'Dimitris Mytaras', 'Male', 'Greek', 1934, 2017,
        'Dimitris Mytaras (Greek: Δημήτρης Μυταράς) was a Greek artist who is considered one of the important Greek painters of the 20th century.',
        'https://el.wikipedia.org/wiki/Δημήτρης_Μυταράς');
INSERT INTO ARTIST
VALUES ('AR20', 'Alekos Fassianos', 'Male', 'Greek', 1935, NULL,
        'Alekos Fassianos (Greek: Αλέκος Φασιανός) is a Greek painter.',
        'https://el.wikipedia.org/wiki/Αλέκος_Φασιανός');

/* Εισαγωγή δεδομένων στον πίνακα TYPEOFWORK */
INSERT INTO TYPEOFWORK
VALUES ('T01', 'acrylic on paper', 'https://en.wikipedia.org/wiki/Acrylic_paint');
INSERT INTO TYPEOFWORK
VALUES ('T02', 'metal object', 'https://en.wikipedia.org/wiki/Metalworking');
INSERT INTO TYPEOFWORK
VALUES ('T03', 'oil on canvas', 'https://en.wikipedia.org/wiki/Oil_painting');
INSERT INTO TYPEOFWORK
VALUES ('T04', 'oil on panel', 'https://en.wikipedia.org/wiki/Panel_painting');
INSERT INTO TYPEOFWORK
VALUES ('T05', 'oil on paper', 'https://en.wikipedia.org/wiki/Oil_print_process');
INSERT INTO TYPEOFWORK
VALUES ('T06', 'pencil, coloured chalk and watercolour on paper', 'https://en.wikipedia.org/wiki/Watercolor_painting');

/* Εισαγωγή δεδομένων στον πίνακα ARTWORK */
INSERT INTO ARTWORK
VALUES ('ΑW01', 'A Greek gold oak wreath',
        'Late classical to early Hellenistic Period, circa 4th-3rd Century B.C.. 17.5 in. (44.4 cm.) wide.', -350,
        'https://www.christies.com/lotfinder/ancient-art-antiquities/a-greek-gold-oak-wreath-late-classical-6228307-details.aspx?from=salesummery&intObjectID=6228307&sid=94052cb5-8386-4550-8c38-1ff3a5c129c9',
        NULL, 'T02');
INSERT INTO ARTWORK
VALUES ('ΑW02', 'A Greek gold and garnet strap-necklace',
        'Hellenistic Period, circa late 3rd-early 2nd Century B.C.. 14 9/16 in. (36.9 cm.) long.', -250,
        'https://www.christies.com/lotfinder/ancient-art-antiquities/a-greek-gold-and-garnet-strap-necklace-hellenistic-6228306-details.aspx?from=salesummery&intObjectID=6228306&sid=94052cb5-8386-4550-8c38-1ff3a5c129c9',
        NULL, 'T02');
INSERT INTO ARTWORK
VALUES ('ΑW03', 'Portrait of Katerina Rosa Botsaris',
        'Katerina Rosa Botsaris was the daughter of Markos Botsaris, the famed Greek klepht leader of the Greek War of Independence. Upon the accession of King Otto of Greece (1833-1862) and after his marriage to Amalia of Oldenburg, Katerina Botsaris was taken into the Queen s service. The arrival of the Bavarian Queen Amalia and King Otto in 1837 was greeted with excitement by the Greek people, the citizens of a newly-autonomous Greek state under King Otto. The creation of a folk dress of Queen Amalia inspired a national Greek costume known as the Amalia dress, as worn by Katerina Botzaris in her 1841 portrait by Joseph Stieler, commissioned by King Ludwig I of Bavaria. Katerina Botsaris was greatly admired in the Greek and European courts for her beauty, and a damask rose bred in 1856 was named Rosa Botzaris after her. In 1844 she got married to the military officer George Karatzas, who descended from the Fanari region. They had four children.',
        1845, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.19.html', 'AR01', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW04', 'A Suliote, 1840',
        'Lewis traveled in 1840 to Corfu, Albania, Greece, Smyrna (modern Izmir), and eventually, Constantinople (modern Istanbul), inspired a number of single-figure studies, including a small series of soldiers in national dress.  The present work is a particularly fine example of this type, and one of the few remaining drawings by Lewis from this formative period of travel. The subject of a Souliote would have been well known to British contemporaries and European art lovers alike: renowned for their resistance against Ottoman rule and active in the Greek War of Independence beginning in 1821, the Souliotes had been made famous by the exhilarating prose of Lord Byron (1788-1824), and their colorful dress had already been recorded by a number of prominent artist-travellers, including that of Eugene Delacroix. In Lewis work, however, the dramatic feats and picturesque costumes of these legendary soldiers take on a secondary role; it is the profile of this figure, and his complicated comportment, that has captured the attention of the artist. Rifle set across his shoulders and edged weapons tucked securely in his belt, the man takes a half-step forward, weary from his fight. It is the emphasis of Lewis on the psychology of the Souliote, and on the quieter moments of his day, which differentiate this sketch from nearly every other of its kind. The size of this work is similar to others of the sketches that Lewis made in 1840, suggesting that he drew from a supply of materials that he had in hand. In addition to paper, Lewis may also have carried tubes of Chinese white, introduced by Winsor & Newton in 1834. By mixing this pigment with his watercolours, Lewis could infuse his works with an intensity and opaqueness of hue not typically associated with the medium. The artist John Sell Cotman (1782-1842) was not alone in his envy, upon seeing the result of the distinctive approach of Lewis: ... I saw above three hundred most splendid drawings by Lewis. Words cannot convey ... their splendour. My poor Reds, Blues and Yellows ... are faded fades to what I saw there, (letter from J.S. Cotman to Dawson Turner, 6 January 1834).',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.26.html', 'AR02', 'T06');
INSERT INTO ARTWORK
VALUES ('ΑW05', 'Battle scene from the Greek War of Independence',
        'In this dramatic and richly finished work, Perlberg presents the viewer with a wealth of details, from the thick smoke at the centre to the still-life at the lower right, and, most poignantly of all, the raised Greek flag on the Acropolis in the distance. With the soldiers composed in a curve from the left-distance to the extreme-right, the work presents the sort of clear, legible narrative that is the hallmark of academic history painting: in this case the triumph of the Greeks over the Ottomans. Perlberg contrasts the white horses and uniforms of the Greeks with the darker colours of the Ottomans, including their eastern camels. The presence of a faceless Greek soldier fallen in battle in the foreground serves to underline the soldiers sacrifice. All underlines the steely determination of the Greeks as against the fleeing Ottomans, while the setting of the scene implies what is at stake: nothing less than the ancient cultural heritage of Greece, and the independence of the Greek nation. Brother of Christian Perlberg, a renowned Nuremberg history painter, Georg Perlberg is known primarily for his genre scenes and landscapes. It is the latter skill which he deploys particularly here, the work exhibiting a strong sense of depth and interest in the play of light on the ruins.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.22.html', 'AR03', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW06', 'Self-portrait',
        'Self-portrait by Helen Boukoura Altamoura dressed as a boy, during her studies in Italy (either in Naples or in Rome or in Florence).',
        NULL,
        'https://paletaart.files.wordpress.com/2013/10/mcf80cebfcf8dcebacebfcf85cf81ceb1-acebbcf84ceb1cebccebfcf8dcf81ceb1-ceb5cebbceadcebdceb7-ceb1cf85cf84cebfcf80cf81cebfcf83cf89cf80cebf.jpg?w=700&h=',
        'AR04', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW07', 'Pomegranates',
        'Still lifes by Lytras are rare and the present work is a wonderful example executed with meticoulous attention to detail that attains a high degree of verisimilitude. Discussing the importance and scarcity of the still lifes of Lytras, Marina Lambraki–Plaka comments Infrequent and prized are the still lifes of Nikephoros Lytras (Marina Lambraki-Plaka, National Gallery 100 Years, Four Centuries of Greek Painting, Athens, 1999, p. 342). Representing fertility, abundance and marriage, it is probable that Lytras chose to depict pomegranates for their inherent symbolic meaning. On important days in the Greek Orthodox calendar, such as the presentation of the Virgin Mary or on Christmas Day, it is traditional to have at the dinner table polysporia, also known by their ancient name panspermia in some regions of Greece. In ancient times they were offered to Demeter and to the other gods for fertile land, for the spirits of the dead and in honour of compassionate Dionysus. Pomegranates are also prominent at Greek weddings and funerals. It is traditional in Greece to break a pomegranate on the ground at weddings and on New Years, and to bring a pomegranate as a house warming gift, when it is placed under or near the ikonostasi (home altar) of the house as a symbol of abundance, fertility and good luck. Lytras incorporated the motif of the pomegranet into his genre painting The Gift. An image of a young woman is painted on the reverse.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2007/the-greek-sale-l07100/lot.33.html', 'AR05', 'T04');
INSERT INTO ARTWORK
VALUES ('ΑW08', 'The burning of a Turkish frigate',
        'The Burning of a Turkish Frigate depicts a strategic battle scheme used by Greek revolutionary fighters to attack their Turkish oppressors which eventually lead to the liberation of Greece. The tactic of attaching a small boat laden with explosives (known as a fire ship) to the side of a frigate was used by maritime heroes such as Canaris, Papamanolis and Barbatsis. One of the most famous of such ambushes was the destruction of the Mansourija. On the evening of 27 May 1821 the thirty three year old freedom fighter Dimitris Papamanolis sailed his small vessel up to the port side of the frigate and set it ablaze. The devastating fire spread throughout the Turkish ship killing 600 sailors. Another historic victory was witnessed on the night of 6 and 7 June 1822 by Constantine Canaris off Chios when he destroyed the flagship of the Ottoman admiral Pasha Kara-Ali in revenge for the Massacre of Chios. When his fire ship was set ablaze and the powder keg on the Ottoman frigate caught fire, all on board perished. The devastating fire spread to other ships in the fleet and the Ottoman casualties numbered 2,000 men. Kara-Ali died later while being transported to shore. Off the coasts of Spetses and Hydra on 8 September 1822, during a raging sea battle, two Greek freedom fighters, Andres Pipinos from Hydra and Kosmas Barbatsis from Spetses attached their fire ships to a Turkish corvette. The boat of Pipinos was detached by the Turkish crew but the boat of Barbatsis exploded, damaging the Turkish flagship. In the end, although the Turks managed to save their corvette, the intervention of the fire ships caused them to retreat. Other contemporary Greek and European painters such as Nikiforos Lytras, Vasilios Chatzis and Ivan Aivazovsky also glorified the marine angle of the Greek struggle for freedom. The monumental painting of Lytras, The Sinking of a Turkish Flagship by Canaris now in the Pinakothiki Averoff, Metsovo, portrays the moment the Turkish ship was set ablaze. Volanakis won renown as the foremost Greek marine painter of the nineteenth century through his masterful representation of ships, detailed recordings of naval battles and sensitive rendering of atmospheric changes. In the present work, through the use of light and colour, Volanakis has presented the ambush to theatrical effect. The billowing flames from the smaller fire ship set against the tilting frigate are dramatized by a swirling cloud of smoke. Volanakis has chosen to set the scene against an almost monochromatic moonlit sky and sea, setting into relief the vibrant reds and yellows of the smoke and flames.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.61.html', 'AR06', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW09', 'The arrival of Karaiskakis at Faliro',
        'Never before offered at auction, The Arrival of Karaiskakis at Faliro, is the most important work by the artist to appear on the international art market. Most historical works by Volanakis of this scale and importance are in museums, institutions and corporate collections, making this painting one of the few examples still in private hands. This monumental scene from the Greek War of Independence celebrates the arrival in 1827 of the fledgling Greek navy and one of its commanders, Georgios Karaiskakis, on the shores of Faliro, near Piraeus, in preparation for the campaign to liberate Athens, under siege from Ottoman forces. Altogether some ten thousand Greek soldiers convened at Piraeus. The fleet was made up of vessels assembled by various islands and forces under the command of Karaiskakis and the English philhellene, Lord Cochrane, the first ships landing in Piraeus on 5 February 1827. Karaiskakis was mortally wounded during the ensuing confrontation on the open plain between Piraeus and Athens, and died on 23 April 1827, going down in Greek history as one of the greatest heroes of the war. The quality of timeless calm characteristic of the painting of Volanakis adds tension to the depiction of the disembarkation of the Greeks. A 24-gun frigate leads the convoy of masted ships, all bearing the Greek flag that had been recently adopted in 1822. The high tide, still waters and sky are heavy with the anticipation of the imminent battle, as the Greek force prepare to attack the Ottoman battalion on the plain of Athens. Deeply inspired by the bravery of Karaiskakis, Volanakis painted a further version of his arrival at Faliro, though seen from the other side of the bay, and with greater focus on the cavalry and the landed troops. Both paintings capture the tension-wrought atmosphere of the eerie calm before the event, and reinforce its iconographic nature to the people of Greece. Kraiskakis Arriving at Faliro is one of numerous tableaux by Volanakis celebrating the vital naval of Greece exploits. These include The Inauguration of the Corinth Canal, The Exodus of Areas, and The Battle of Salaminas, all of them key works in major Greek collections, including the National Gallery and National Bank of Greece. The large scale of these works adds to their sense of monumentality and drama and accentuates their patriotic content: The struggle of Greece for independence and autonomy, from which it would eventually emerge victorious. The signature atmosphere of calm and industrious order of Volanakis is manipulated by the artist into the creation of a scene of great intensity, weight and expectancy describing a theme of historical significance. The resurgence in interest among painters like Volanakis during the second half of the nineteenth century for the military victories of Greece fought decades earlier was in large part fuelled by the abdication in 1862 of the unpopular King Otto. His departure marked a renewed resurgence of national pride, leading many artists, most of them Munich-trained, to adopt distinctly Greek subjects. Known as the Bard of the Greek Sea, Volanakis was a keen and affectionate observer of nature, whose knowledge of the sea encouraged the fullest expression of his talents. The focus of Volanakis on marine painting allowed him to examine every possible angle and element of the seascapes he observed first hand in the Mediterranean. His painting The Battle of Lissa was bought by the Austrian Emperor, after Volanakis won a competition for its depiction, and The Battle of Trafalgar was exhibited and sold in London. The interest of Volanakis in marine subjects was first exposed during his time as an accountant in his brother-in-law (Georgios Afentoulis) sugar refinery. There his sketches of the harbour and small ships on the ledgers of the firm drew the enthusiastic attention of his employer, and the artist was sent, with the financial backing of his family, to the Academy of Arts in Munich to study under Karl von Piloty. After his studies he worked in Munich and travelled to Venice and Trieste, cities whose picturesque port and harbour-oriented topography would prove inspirational. It was during his stay in Vienna that Volanakis had the opportunity to travel throughout the Mediterranean in the training ship of the Austrian navy, which would prove the inspiration for his coastal and full ocean scenes, and the characters that populate his beloved marine panoramas. Please note that this painting will be available for inspection by prospective buyers in Athens by appointment with Sothebys. The painting will be located in Greece during the auction and will be available for collection by the successful bidder in Athens. The export of this painting from Greece is subject to the obtaining of an export permit.  The obtaining of any such permit shall be the sole responsibility of the buyer.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.11.html', 'AR06', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW10', 'Volos Harbour at night',
        'Volanakis was born and raised in Crete. In 1856 he moved to Trieste where he worked as an accountant for the sugar firm Aphentoulis. His artistic talent and passion for seascapes and observations of vessels became clearly apparent to his employer when he found numerous sketches of boats, ships and the docks scribbled in the ledger books of Volanakis. Rather than fire his young employee, Aphentoulis encouraged Volanakis to take up painting as a profession and paid for him to study at the Munich Academy under Karl von Piloty. After a successful stay in the Bavarian capital Volanakis returned to Greece in 1884 and settled in Piraeus. Living close to the sea provided a continual source of inspiration for Volanakis. During his Greek period (1884-1907) his Munich School training gave way to more progressive styles, a genuine quest for the effects of light and colour, and a lyrical description of atmosphere as evinced by the present work. The impressionistic tendencies of some of his works were far ahead of their time and were ideally suited for his interpretation of the Greek coast.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2007/the-greek-sale-l07100/lot.30.html', 'AR06', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW11', 'The departure',
        'In this majestic composition from the Munich period of Volanakis, a steel-hulled steamship makes ready to sail. The hoisted blue signal flag or blue peter on the bow mast denotes that the ship is about to leave port. The engines idle, with smoke billowing from the funnel of the ship, the last provisions are loaded from a lighter on the starboard side, and elegantly dressed passengers embark from the port ferry which has tied up at the stern. The keenly observed ship contrasts with the serenely calm waters and sky of a summer day, revealing the abilities of Volanakis both as an accomplished technical draftsman and as a marine painter.',
        1877, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.3.html', 'AR06', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW12', 'The neighbours (the gossips)',
        'Considered by many to be the father of Greek nineteenth-century painting, Nicholas Gyzis was at the apex of his career when he painted The Neighbours (The Gossips) in the early 1880s. Illustrating the rapt attention with which two neighbours gossip and chat, the painting celebrates the importance of community and domestic life. The women huddle around the glowing embers in a brazier, grinding coffee beans and drinking coffee, their only onlooker a curious cat. This scene was inspired by the village of Gyzis on the island of Tinos, and along with other works of this period, is a tribute to the birthplace of the artist and the daily rituals of his countrymen. As Montandon notes in his 1902 monograph on the artist, based on the records of the artist that were later destroyed during an air raid in 1944: Now starts the most fruitful period of the genre painting of the artist; Gyzis is in Munich only in body; his thoughts constantly return to the beauty of the Aegean Sea. His brush conveys powerful images of daily life in Athens, Smyrna and Tinos (Marcel Montandon, Nikolaos Gyzis, Bielefeld & Leipzig, 1902, p. 56b). The Neighbours (The Gossips) decorated the house of the daughter of Gyzis in Munich for many years. According to Nelli Missirli, it was during the 1880s that the painter preferred depicting two or three human figures, at close proximity, set in a simple and unadorned interior. In this and his other genre paintings of the period Gyzis took a keen interest in exploring Greek manners, customs, rituals, costumes and physiognomy. The gnarled, sinewy hands of the women indicate a long, full life and exude character and spirit. The Franco-Greek critic and gallerist Christian Zervos called this close observation The Adoration of the Hands, believing that expression in depiction of hands such as these by Gyzis spoke volumes about the sitter. Having initially studied at the School of Fine Arts in Athens, in 1865 Gyzis was awarded a scholarship to continue his studies at the Academy of Fine Arts in Munich. Under the tutelage of Karl von Piloty he developed an obsession for depicting textures evident in the meticulous rendering of fabric patterns, the contrast between soft animal fur and glazed ceramic cups, and between coarse wood and polished metal. ',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.23.html', 'AR07', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW13', 'The orphans',
        'Considered by many to be the father of Greek 19th Century painting, Nicholaos Gyzis was at the pinnacle of his career when he painted The Orphans in the early 1870s. Depicting a girl woman preparing a meal for her younger siblings, the painting celebrates the importance of family life. In this and his other genre paintings of the period Gyzis took a keen interest in exploring Greek manners, customs, rituals, costumes and physiognomy. The family, as a basic unit of society, held a special significance for Gyzis, and narrative paintings such as The Orphans, The New Arrival and The Barber typically built anecdotes around children in ways that would touch the viewer, either by their humouristic content, or, as in the case of the present work, by their emotive subject. While firmly rooted in German romanticism, The Orphans superbly illustrates the transcendence of Gyzis beyond his masters teachings and assimilation of other continental trends. From the early tutelage of Karl von Piloty he had developed an obsession for depicting textures. In The Orphans the virtuoso rendition of fabrics, and complexions, and teh contrast between rough and polished wood demonstrates the new life that had been breathed into representation by Courbet and French realism. Likewise the warm, earthy palette and strong chiaroscuro suggest the pre-occupation with light that captivated Gyzis during this period. Underpinned by a powerful, yet deceptively simple, draughtsmanship, these factors give the composition a rich materiality. Another version of the present work signed and dated 1871 is currently in a private collection, Athens.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2007/the-greek-sale-l07100/lot.32.html', 'AR07', 'T04');
INSERT INTO ARTWORK
VALUES ('ΑW14', 'Frigate on calm waters',
        'The present work exemplifies the distinctive atmospheric effects and silvery haze for which the seascapes of Altamouras are known, and has a certain lyricism, freshness and immediacy which reflect his exposure to the currents of early Impressionism. His seascapes have a crisp light heartedness and sensitivity to atmospheric change, whether they illustrate the harbours, steamships and sailing-vessels of the North or of the Aegean. Though he died at the early age of 26, the talents of Ioannis Altamoura ensured that he is remembered as one of the finest Greek marine painters of his generation, ranked alongside Volanakis and Chatzis. Both the parents of Altamouras were respected painters, and his precocious artistic talent and inclination were encouraged from a young age, culminating in his studies at the School of Fine Arts in Athens under Nikiforos Lytras after which he was sent by King George I to Copenhagen on a painting scholarship. Ironically the passion of Altamoura for seascapes brought his life to a premature end, when a long-term chest ailment was aggravated by his studies in Denmark and his time exposed to the pernicious seaside climate in Greece.',
        1877, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.83.html', 'AR08', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW15', 'The favourite grandchild',
        'The Favourite Grandchild is a picture of familial bliss transcending the generations, in which a toddler is transfixed by his grandfather pipe. Known for his heartfelt and wry depictions of the relations between children and adults, Jakobides appealed to the sentimentality of nineteenth-century audiences with his illustrations of the triumphs and scrapes associated with childhood. As in The New Pipe, the artist favoured a coarsely-painted and neutral-toned background to emphasise the prominent central figures, lovingly and meticulously rendered in far richer tones and values. Both paintings, much like the Little Smuggler of Jakobides, highlight the humour in these precocious children interest in a symbol of male adulthood and maturity. Like Nicholaos Gyzis and Nikiforos Lytras, Jakobides is known to have repeated his most popular compositions. Another version of the present work, larger in size, is in a private collection, Athens.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.21.html', 'AR09', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW16', 'The first steps',
        'Known for his heartfelt and wry depictions of the relations between children and adults, in the present work, a grandmother lovingly supports a giggling toddler in his first steps on the family table-top, encouraged by his sister. The painting is one of three known versions of this subject painted by Jakobides. The largest version was exhibited in Munich in 1892, to great acclaim, and is now in the collection of the National Gallery and Alexandros Soutzos Museum, Athens, of the two smaller versions this is the only one dated. An atmosphere of warmth and enthusiasm pervades the familiar image, assisted by the light slanting through the window and bathing the scene with a gentle glow. The training of Jakobides in Munich is evident in the clarity of the light that illuminates the edges and outlines, in contrast to the fluid and solvent quality seen in French Impressionism at the time. Each pictorial element of the interior scene is carefully chosen and meticulously painted in order to build a scene imbued with a familial richness and expressing the idyllic tranquillity of domestic family life. The discarded ball of yarn and knitting needles, the faint outlines of distant houses seen through the open windows and the cheerful flowerpot on the windowsill speak of domestic and familial bliss.',
        1893, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.13.html', 'AR09', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW17', 'Battle scene with Greek and Turk',
        'Please note that due to Greek regulations, this painting currently cannot be exported from Greece and will be available for inspection by prospective buyers in Athens by appointment with Sothebys. The painting will be located in Greece during the auction. Please also note that the sale of the painting will be conditional upon the Greek State failing to pre-empt the sale of this lot at the time of the auction. The successful buyer will be able to collect the work in Athens. Should you have any queries regarding the sale of this work please contact a member of the department.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.60.html', 'AR10', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW18', 'Athanasios Diakos',
        'The grandson of an icon painter from Mytilini, Theofilos began painting as an itinerant craftsman around 1890. For thirty years he travelled extensively in Greece decorating walls of houses, shops and inns in his naive style. The vogue for authentic, folkloric idioms that seized the Parisian avant garde in the 1920s resulted in his discovery and elevation to the vanguard of progressive Greek painting. According to legend, it was Georgios Gounaropoulos who noticed murals by the unknown Theofilos while walking in Volos. Photographs of these which Gounaropoulos dispatched to Paris captured the imagination of the art critic and collector Eliphteriadis Tériade, who subsequently invited Theofilos to come to Paris in 1929. Having befriended the artist, Tériade commissioned a number of works from him and launched his career among the intellectual circles in the French capital. His mission, noted Tériade, would henceforth be to put Theofilos in the place he deserves next to the most noble creations in Greek art from Byzantine times to the present day (quoted in Athinaika Nea, 20 September 1935). He kept his word and in 1965 the Theofilos Museum was opened in Vareia - a gift of Tériade. Please note that due to Greek regulations, this painting currently cannot be exported from Greece and will be available for inspection by prospective buyers in Athens by appointment with Sothebys. The painting will be located in Greece during the auction. Please also note that the sale of the painting will be conditional upon the Greek State failing to pre-empt the sale of this lot at the time of the auction. The successful buyer will be able to collect the work in Athens. Should you have any queries regarding the sale of this work please contact a member of the department.',
        1929, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.15.html', 'AR10', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW19', 'Landscape in Mariout', '50 cm by 73 cm, 19.75 in by 28.75 in.', NULL,
        'https://www.sothebys.com/en/auctions/ecatalogue/2007/the-greek-sale-l07102/lot.12.html', 'AR11', 'T01');
INSERT INTO ARTWORK
VALUES ('ΑW20', 'Still life with Japanese vase',
        'Painted in soft washes of pastel colours, the present work can be compared with a series of nature mortes that Parthenis executed whilst in Greece during the 1930s. With its superb subtle colouring and forcefulness of design, the present work is a prime example of the powers of Parthenis as a draughtsman. The importance that Parthenis attached to drawing is evident in the prominence of line. These fine lines are enhanced only by the most delicate use of light and colour, picking out the highlights of the vase and evoking the texture of the white cloth with a few judicious undulating strokes. On this technique, Parthenis is quoted as having told his students, You must remember! Light = colour. This is what creates shape (Dimitris Papastamos, Painting 1930-40, Astir Company, 1981, p. 66). The work of Parthenis was tremendously significant in the development of twentieth century Greek art. As a prominent member of the Omni Techni group of 1917 he was responsible, along with Konstantinos Maleas, for introducing ideas of light and colour into Greek painting. With this movement and the influence that Parthenis exerted as Professor at the Athens School of Fine Arts from 1929-1947, the lingering influences of German academicism were finally banished from the artistic circles of Athens, and a new path was laid, paving the way for experimentation in form and colour previously untried in Greek art. Influenced by the modern currents he encountered when in Paris before World War I, Parthenis, through his art, introduced elements of Art Nouveau and cubism to Greece. We must create for the future and be inspired by the future. In any case, this will happen and prevail; the more we move away from the past, the better we shall see, and we will stop to be short-sighted. (Konstantinos Parthenis, quoted in Dimitris Papastamos, Painting 1930-40, Astir Company, 1981, p. 68).',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.82.html', 'AR12', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW21', 'The walk of the Caryatid',
        'The walk of the Caryatid is a major work from the 1930s when Parthenis was at the height of his artistic powers. On the right of the composition, a ghostlike figure has descended from the Acropolis to stroll through the city. In the background, The Arch and columns of Hadrian from the Temple of the Olympeus Zeus, monuments of the glorious past of Greece, are offset against a vibrant blue sky. Parthenis has also incorporated modern elements such as the tram and electric pylons possibly symbolizing the meeting of the ancient world of the past and the modern world of the present. Influenced by the modern currents he encountered when in Paris before World War I, Parthenis, through his art, introduced elements of Art Nouveau and cubism to Greece. We must create for the future and be inspired by the future. In any case, this will happen and prevail; the more we move away from the past, the better we shall see, and we will stop to be short-sighted. (Konstantinos Parthenis, quoted in Dimitris Papastamos, Painting 1930-40, Astir Company, 1981, p. 68). The importance that Parthenis attached to drawing is evident in the prominent use of line in the present work. Fine lines are enhanced only by the most delicate use of light and colour. The subtle hues of blue, brown and green, used to accentuate objects, imbue this painting with a mysticism typical of the mature work of Parthenis. He was quoted as saying to his students: You must remember! Light = colour. This is what creates shape. (ibid., p. 66). A professor at the Athens School of Fine Arts from 1929 to 1947, Parthenis encouraged his students to paint using their mind and soul: Gentlemen, the greatest labour in the creation of art is the work of the mind, and the painter should also work with the mind and soul, just as the poet is never tired of noting the verses with a pencil, but labour intellectually and his whole work is done with the mind and the emotions. (Konstantinos Parthenis, ibid., p. 66). The present work was among the fifty-six paintings Parthenis chose to exhibit at the Venice Biennale of 1938.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2007/the-greek-sale-l07100/lot.6.html', 'AR12', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW22', 'A lady of the Belle Epoque (portrait of the artist Sophia Laskaridou)',
        'Standing at three-quarters to the viewer, with arms and umbrella forming right angles, the artist Sophia Laskaridou confidently eyes the viewer. Parthenis has sensitively depicted the play of the light on her coat, giving them depth with vertical, delicately toned strokes. Parthenis would have travelled within similar circles as the prominent Viennese Symbolist, potentially through connections with the Macedonian philanthropist and patron of the arts Nicholas Doumbas (1830-1900), who donated Vienna Musikverein to the city, and commissioned Klimt to paint an iconic image of Schubert in his music room. The cross-pollination of ideas and styles that was occurring between artists of various nationalities in Vienna at the turn of the century informed the work of Parthenis. The emergent styles opened the modernist floodgates within the scope of the Hellenistic aesthetic of the fin de siecle, allowing theoretical and visual space for the artist to develop an inimitably Greek visual expression later in the span of his oeuvre.',
        1900, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.15.html', 'AR12', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW23', 'Portrait of a woman',
        'This work is accompanied by a black and white photograph of the sitter in the studio of the artist in front of this portrait.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.129.html', 'AR13', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW24', 'The artist in his studio',
        'The Artist in his Studio is a major addition to the oeuvre of Lytras and one of the few self-portraits by the artist to appear at auction. Together with Konstantinos Parthenis and Konstantinos Maleas, Nikolaos Lytras was a pioneer of twentieth-century Greek painting. Like many of his contemporaries, he studied at the Munich academy under Ludwig von Löfftz and Karl von Piloty. The son of Munich master Nikiforos Lytras, his work provided a crucial link between Romanticism and modernism in the development of Greek painting in the early decades of the last century. An ability to mould his knowledge of contemporary avant-garde currents from abroad and his excellent technique into an idiom of form entirely his own, enabled him to reach great heights. His oeuvre is characterised by the imposition of colour on form and of the internal element on the external. Lytras opened new pathways and attracted a coterie of younger artists who strove to release Greek painting from the formula of the past (Chrisanthos Christou, The National Gallery: 19th and 20th Century Greek Paintings, Athens, 1992, p. 20). The absorption of mainstream influences of Lytras led to a studied avoidance of references to Hellenistic tradition. The broad free brushstrokes and vigorous colouring of the present work exhibits the highly expressive use of pigment and non-illusionistic space that defined the style of Lytras.',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2008/the-greek-sale-l08102/lot.9.html', 'AR13', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW25', 'Hoop with lens', 'Height: 135 cm, 53 in (including the base); 121 cm, 47.75 in (excluding the base).',
        NULL, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.50.html', 'AR14', 'T02');
INSERT INTO ARTWORK
VALUES ('ΑW26', 'Olive tree',
        'An identical version of the present work can be found in the collection of the Zongolopoulos Foundation, and a similar, smaller work in chromium-plated brass is located in the premises of the Alpha Bank building in Psychiko, Athens. ',
        1965, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.38.html', 'AR14', 'T02');
INSERT INTO ARTWORK
VALUES ('ΑW27', 'Mistras',
        'In this late landscape Ghika depicts the ruins of Mistras, a fortified medieval town built on Mount Taygetus on the Peloponnese. The work is an important example of the lyrical depictions of the Greek landscape that Ghikas so admired, with sinuous line and lyrical dynamic. Labyrinthine paths and ruined arches lead the eye over an almost-abstract architectural network, with strong expressionist strokes and vivid blocks of colour to the centre-left contrasting with the pastel-coloured background to the right. This pulsing and contorted landscape is a familiar idiom in the oeuvre of Ghika, but his earlier angular geometry is cast aside for an even more emotional and directly descriptive rendering. With a virtuoso wealth of strokes and hues, the present work presents a rich display of the painterly skill of Ghikas. Beginning and ending his life in Greece, Nicos Hadjikiriakos-Ghika began his artistic scholarship under Konstantinos Parthenis in Athens, relocating to Paris to enrol at the Sorbonne, the Ranson Academy and the studio of Dimitris Galanis. This erudite, well-travelled and sophisticated background would nourish a hungry mind, open to the concept of an analytic and mathematical form of modernism. This visual vocabulary owed much to the methodical teaching of Parthenis, with its emphasis on geometric principles, the Byzantine art that Ghika cherished, incorporating its strictness, the geometric, hierarchy, and the work of artistic luminaries of the Parisian modernist enclave such as Pablo Picasso and Georges Braque (in Marina Lambraki-Plaka, ed., Four Centuries of Greek Painting, Athens, 1999, p. 139).',
        1973, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.3.html', 'AR15', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW28', 'Orpheus',
        'In the present work, Engonopoulos pays homage to the richness of Greek myth, as Orpheus stands muscular and poised, holding the lyre by which he plays divine music. Bound by a railing, with the Mediterranean beyond, the stage on which Orpheus seems to stand reflects the interest of Engonopoulos in set design. His figures are placed within an enigmatic system of poetic metaphor, based on classicistic compositional structure (Haris Kambouridis and George Levounis, Modern Greek Art of the 20th Century: The Complete Guide to the Collections of the Rhodes Municipality Modern Greek Art Museum, Athens, 1999, p. 116). In such works, the faceless figures represent the people of modern Greece within a traditional and uniquely Greek frame of reference. A student of Parthenis at the School of Fine Art in Athens, Engonopoulos is considered the founder of surrealism in Greek art. In his imagery, the association of reality and myth, classical and modern, embodies the preoccupations of modern Greece through the subconscious. As Niki Loizidi notes, Engonopoulos gave [Greece] one version of surrealism, universal, but at the same time deeply rooted in Greekness (Niki Loizidi, cited in Kambouridis and Levounis, ibid., p. 116).',
        1972, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.6.html', 'AR16', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW29', 'Soldier dancing zeimbekiko',
        'Scenes of sailors and soldiers make up a characteristic part of the work of Tsarouchis. In this full-length, life-size portrait, Tsarouchis has depicted a single soldier dancing, his rugged, masculine face with square jawline and broad shoulders forming a contrast with his swaying, unsteady movement. The initial training of Tsarouchis was at the School of Fine Arts in Athens under Georgios Jakobides and Konstantinos Parthenis while also working in the studio of Fotis Kontoglou, a religious painter who exposed him to Byzantine art. In 1935 Tsarouchis left Athens for Paris. It was in the French capital that he was able to study the work of the Renaissance masters and French Impressionists. Immersing himself in Parisian art circles, he befriended painters such as Matisse, Laurens and Giacometti. By 1936 Tsarouchis had returned to his beloved Athens, organising his first solo exhibition. Widely acclaimed as a painter of the Greek people, his work attempted a reconciliation of Western and Eastern pictorial traditions. Like many of the Greek avant-garde intellectuals and artists of his time, Tsarouchis became actively involved with the popular art movement and the search for the Greek in art. He travelled extensively in Greece, Turkey, Asia Minor and France, where he studied Byzantine music, painting and textiles, and was particularly inspired by the works of Matisse and Demetrios Galanis. One of the most important representatives of the Thirties Generation, Tsarouchis embodied in his work the ideal of Greek. With a multiplicity of influences from Hellenistic and Byzantine art, the art of the Renaissance as well as the work of Matisse, Theophilos and Kontoglou, and the figures of Karaghiozis shadow puppets, he created a unique personal style and depicted landscapes, still lifes, nudes and allegorical scenes.',
        1963, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.67.html', 'AR17', 'T03');
INSERT INTO ARTWORK
VALUES ('ΑW30', 'Young man with helmet (portrait of Alain)',
        'In this intimate portrait, Tsarouchis captures the uncertainty of youth, his sitter engaging directly with the viewer while his timid gaze belies his muscular physique. This work is listed as no. 1166 in the archives of the Tsarouchis Foundation.',
        1975, 'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.9.html', 'AR17', 'T05');
INSERT INTO ARTWORK
VALUES ('ΑW31', 'Figure I',
        'Like his teacher Konstantinos Parthenis, Moralis was inspired by the art of Greek antiquity, re-inventing it, using a new idiom. However unlike Parthenis, whose work is characterized by soft and sweeping contours, Moralis preferred starkly geometric forms, reflecting his life-long interest in mosaic art which he studied as a student in Paris. The female figure became a favourite motif throughout his oeuvre. The work of Moralis from the late 1970s to the early 1980s is distinguished by a synthesis of colour, monumentality, complexity of design, solid compositional structure, geometric vocabulary of form and poetic, and curved lines. The origins of the abstract works of Moralis, of which Figure I is a fine example, lie in the portraits he painted during the German occupation (1941-44), which were characterised by a restricted palette, an opposition of light and shadow, and a concern for the flattening of form and space. After 1970 Moralis produced works containing completely schematic presences. His preoccupation with compositional structure and colour relationships is paramount in Figure I, which has both a delicate formal balance between its white and black forms and a chromatic harmony overall.',
        1981, 'https://www.sothebys.com/en/auctions/ecatalogue/2007/the-greek-sale-l07100/lot.24.html', 'AR18', 'T01');
INSERT INTO ARTWORK
VALUES ('ΑW32', 'Mother and child',
        'Related literature: Vlassis Frissiras, ed., The Vlassis Frissiras Collection - Contemporary Painting, Athens, 1989, p. 76.',
        1989, 'https://www.sothebys.com/en/auctions/ecatalogue/2010/the-greek-sale-l10103/lot.125.html', 'AR19', 'T01');
INSERT INTO ARTWORK
VALUES ('ΑW33', 'Kea', '87 cm by 100 cm., 34.25 in by 39.5 in.', 1976,
        'https://www.sothebys.com/en/auctions/ecatalogue/2011/the-greek-sale-l11100/lot.68.html', 'AR20', 'T01');

/* Εισαγωγή δεδομένων στον πίνακα INCLUDED */
INSERT INTO INCLUDED
VALUES ('AU01', 'ΑW14', 70000, 100000, 217103);
INSERT INTO INCLUDED
VALUES ('AU01', 'ΑW22', 10000, 20000, 21035);
INSERT INTO INCLUDED
VALUES ('AU02', 'ΑW29', 100000, 180000, 191050);
INSERT INTO INCLUDED
VALUES ('AU03', 'ΑW07', 45000, 75000, 52952);
INSERT INTO INCLUDED
VALUES ('AU03', 'ΑW10', 120000, 180000, 951965);
INSERT INTO INCLUDED
VALUES ('AU03', 'ΑW13', 170000, 270000, 523640);
INSERT INTO INCLUDED
VALUES ('AU03', 'ΑW19', 14000, 22000, 17738);
INSERT INTO INCLUDED
VALUES ('AU03', 'ΑW21', 170000, 270000, 853121);
INSERT INTO INCLUDED
VALUES ('AU03', 'ΑW31', 150000, 220000, 457744);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW03', 25000, 35000, NULL);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW04', 85000, 110000, NULL);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW09', 1800000, 2500000, 1975186);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW12', 370000, 620000, 443397);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW15', 180000, 250000, 222465);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW16', 120000, 185000, 163550);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW18', 25000, 40000, NULL);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW22', 100000, 150000, 119364);
INSERT INTO INCLUDED
VALUES ('AU04', 'ΑW24', 75000, 100000, 89907);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW05', 25000, 35000, 120771);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW14', 120000, 180000, 183935);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW20', 210000, 260000, 254117);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW22', 35000, 60000, 43571);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW26', 30000, 40000, NULL);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW27', 180000, 200000, 520809);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW29', 350000, 600000, 408517);
INSERT INTO INCLUDED
VALUES ('AU05', 'ΑW32', 35000, 60000, 43571);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW08', 300000, 400000, NULL);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW11', 90000, 140000, 219250);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW17', 50000, 70000, 56012);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW23', 9000, 14000, NULL);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW25', 20000, 28000, 27011);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW28', 90000, 140000, NULL);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW30', 70000, 90000, 83307);
INSERT INTO INCLUDED
VALUES ('AU06', 'ΑW33', 50000, 70000, 56012);
INSERT INTO INCLUDED
VALUES ('AU07', 'ΑW01', 135000, 230000, 294890);
INSERT INTO INCLUDED
VALUES ('AU07', 'ΑW02', 70000, 110000, 136103);

INSERT INTO COLLECTOR (nickname, firstname, lastname, sex, address)
VALUES ('marcelo97', 'marcelo', 'mollaj', 'Male', ROW ('L. Minoos 42', 'Herakleion', '71303'));

INSERT INTO COLLECTOR (nickname, firstname, lastname, sex, address)
VALUES ('mitsos13', 'dimitris', 'mimis', 'Male', ROW ('Andrea Kalvou 12', 'Syros', '84100'));

INSERT INTO COLLECTOR (nickname, firstname, lastname, sex, address)
VALUES ('mariap', 'maria', 'papa', 'Female', ROW ('East Bay 211', 'San Francisco', '44352'));

INSERT INTO COLLECTOR (nickname, firstname, lastname, sex, address)
VALUES ('john', 'gianis', 'spaliaras', 'Male', ROW ('Petrou Ralli 12', 'Athina', '96000'));

INSERT INTO expert (nickname, list_of_types)
VALUES ('marcelo97', ARRAY ['T02', 'T06']);
INSERT INTO expert (nickname, list_of_types)
VALUES ('mitsos13', ARRAY ['T02', 'T06']);

INSERT INTO novice (nickname, date_of_birth, typeid)
VALUES ('mariap', '1997-05-17', ARRAY ['T03', 'T04']);
INSERT INTO novice (nickname, date_of_birth, typeid)
VALUES ('john', '1965-09-02', ARRAY ['T04', 'T05']);
-- ----------------------------------------------------------------------------------
-- INSERT INTO expert (nickname, firstname, lastname, sex, address, list_of_types)
-- VALUES ('marcelo97', 'marcelo', 'mollaj', 'Male', ROW ('L. Minoos 42', 'Herakleion', '71303'), ARRAY ['T02', 'T06']);
-- INSERT INTO expert (nickname, firstname, lastname, sex, address, list_of_types)
-- VALUES ('mitsos13', 'dimitris', 'mimis', 'Male', ROW ('Andrea Kalvou 12', 'Syros', '84100'), ARRAY ['T02', 'T06']);
--
-- INSERT INTO novice (nickname, firstname, lastname, sex, address, date_of_birth, typeid)
-- VALUES ('mariap', 'maria', 'papa', 'Female', ROW ('East Bay 211', 'San Francisco', '44352'), '1997-05-17',
--         ARRAY ['T03', 'T04']);
-- INSERT INTO novice (nickname, firstname, lastname, sex, address, date_of_birth, typeid)
-- VALUES ('john', 'gianis', 'spaliaras', 'Male', ROW ('Petrou Ralli 12', 'Athina', '96000'), '1965-09-02',
--         ARRAY ['T04', 'T05']);

insert into interest
values ('marcelo97', 'AU01');
insert into interest
values ('marcelo97', 'AU02');
insert into interest
values ('marcelo97', 'AU05');
insert into interest
values ('marcelo97', 'AU06');

insert into interest
values ('mitsos13', 'AU01');
insert into interest
values ('mitsos13', 'AU03');
insert into interest
values ('mitsos13', 'AU05');
insert into interest
values ('mitsos13', 'AU07');

insert into interest
values ('mariap', 'AU02');
insert into interest
values ('mariap', 'AU04');
insert into interest
values ('mariap', 'AU06');
insert into interest
values ('mariap', 'AU03');

insert into interest
values ('john', 'AU01');
insert into interest
values ('john', 'AU02');
insert into interest
values ('john', 'AU03');
insert into interest
values ('john', 'AU04');

insert into posts
values (1001, 'marcelo97', 'AU04', ROW ('marcelo97','this art is amazing', NOW(),ARRAY ['ΑW04']));
insert into posts
values (1002, 'marcelo97', 'AU06', ROW ('marcelo97','worth a million dollars', NOW(),ARRAY ['ΑW06','ΑW08']));

insert into posts
values (1003, 'mitsos13', 'AU07', ROW ('mitsos13','wanna buy some of this', NOW(),ARRAY ['ΑW01','ΑW05','AW22']));
insert into posts
values (1004, 'mitsos13', 'AU05', ROW ('mariap','will fit in your collection', NOW(),ARRAY ['ΑW05','ΑW08']));

insert into posts
values (1005, 'mariap', 'AU04', ROW ('mitsos13','do you need this?', NOW(),ARRAY ['ΑW09','ΑW08']));
insert into posts
values (1006, 'mariap', 'AU03', ROW ('mariap','I love this one <3 <3', NOW(),ARRAY ['ΑW10']));

insert into posts
values (1007, 'john', 'AU01', ROW ('mitsos13','you won`t boy nothing he he he', NOW(),ARRAY ['ΑW14','ΑW22', 'AW08']));
insert into posts
values (1008, 'john', 'AU04',
        ROW ('mariap','you won`t boy nothing  he he he', NOW(),ARRAY ['ΑW03','ΑW04','ΑW09','ΑW12']));
insert into posts
values (1009, 'john', 'AU03',
        ROW ('marcelo97','you won`t boy nothing he he he', NOW(),ARRAY ['ΑW07','ΑW10','ΑW13','ΑW19']));
insert into posts
values (1010, 'john', 'AU07', ROW ('john','this are mine', NOW(),ARRAY ['ΑW01','ΑW02', 'AW08']));