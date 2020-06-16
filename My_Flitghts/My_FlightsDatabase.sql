DROP TABLE IF EXISTS Flights;

CREATE TABLE Flights (
       flight_id TEXT,
       start TEXT,
       dest TEXT,
       departs TEXT,
       arrives TEXT,
       CONSTRAINT FlightsPK PRIMARY KEY (flight_id)
);
INSERT INTO Flights(flight_id, start, dest, departs, arrives) VALUES ('A3 230', 'HER', 'ATH', to_char(current_timestamp, '07:00:00'), to_char(current_timestamp, '07:40:00'));
INSERT INTO Flights(flight_id, start, dest, departs, arrives) VALUES ('OA 123', 'HER', 'ATH', to_char(current_timestamp, '17:00:00'), to_char(current_timestamp, '18:00:00'));
INSERT INTO Flights(flight_id, start, dest, departs, arrives) VALUES ('BA 210', 'ATH', 'LGW', to_char(current_timestamp, '07:00:00'), to_char(current_timestamp, '12:00:00'));
INSERT INTO Flights(flight_id, start, dest, departs, arrives) VALUES ('BA 800', 'ATH', 'LGW', to_char(current_timestamp, '17:00:00'), to_char(current_timestamp, '21:00:00'));
INSERT INTO Flights(flight_id, start, dest, departs, arrives) VALUES ('EZY1234', 'LGW', 'SKY',to_char(current_timestamp, '21:00:00'), to_char(current_timestamp, '03:00:00'));
INSERT INTO Flights(flight_id, start, dest, departs, arrives) VALUES ('A3 321', 'SKY', 'JFK', to_char(current_timestamp, '22:00:00'), to_char(current_timestamp, '23:00:00'));



-- Διάσχυση του γράφου χωρίς συνθήκες έναρξης - λήξης ή έλεγχο απόστασης
-- Βρες όλες τις διαδρομές που μπορώ να κάνω (δεν απασχολεί η απόσταση μεταξύ των κόμβων)  
WITH RECURSIVE itenary(start, dest, distance, path_string, departs, arrives) AS
( SELECT S.start, D.dest, 1 AS distance,  S.departs, S.arrives,
S.start || '.' || D.dest || '.' || S.departs || '.' || S.arrives || '.' AS path_string,
D.dest AS direct_connection
FROM Flights AS S JOIN Flights AS D
        ON S.dest = D.start
        AND S.arrives <= D.departs -- source
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1, tc.departs, tc.arrives,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%'
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.departs, itenary.arrives
FROM itenary
ORDER BY distance, start, dest;

-- Διάσχυση του γράφου χωρίς συνθήκες έναρξης αλλά με έλεγχο απόστασης μεταξλυ κόμβων 
-- Βρες όλες τις διαδρομές που μπορώ να κάνω και φτάνουν μέχρι δύο (2) κόμβους μακριά  
WITH RECURSIVE itenary(start, dest, distance, path_string) AS
( SELECT S.start, D.dest, 1 AS distance,
S.start || '.' || D.dest || '.' AS path_string,
D.dest AS direct_connection
FROM Flights AS S JOIN Flights AS D
        ON S.dest = D.start
        AND S.arrives <= D.departs -- source
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%' AND tc.distance < 2
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.distance
FROM itenary
ORDER BY distance, start, dest;


-- Βρες όλες τις διαδρομές που μπορώ να κάνω και φτάνουν μέχρι τρεις (3) κόμβους μακριά  
WITH RECURSIVE itenary(start, dest, distance, path_string) AS
( SELECT S.start, D.dest, 1 AS distance,
S.start || '.' || D.dest || '.' AS path_string,
D.dest AS direct_connection
FROM Flights AS S JOIN Flights AS D
        ON S.dest = D.start
        AND S.arrives <= D.departs -- source
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%' AND tc.distance < 3
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.distance
FROM itenary
ORDER BY distance, start, dest;


-- Διάσχυση του γράφου με συνθήκες έναρξης - λήξης και έλεγχο απόστασης
-- Βρες όλες τις διαδρομές που θα με πάνε από ATH στο JFK με μέχρι δύο στάσεις 
WITH RECURSIVE itenary(start, dest, distance, path_string) AS
( SELECT S.start, D.dest, 1 AS distance,
S.start || '.' || D.dest || '.' AS path_string,
D.dest AS direct_connection
FROM Flights AS S JOIN Flights AS D
        ON S.dest = D.start
        AND S.start = 'ATH'
        AND S.arrives <= D.departs -- source
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%' AND tc.distance < 2
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.distance
FROM itenary
WHERE dest = 'JFK' -- the target node
ORDER BY distance, start, dest;

-- Διάσχυση του γράφου με συνθήκες έναρξης - λήξης
-- Βρες όλες τις διαδρομές που θα με πάνε από HER στο JFK με μέχρι δύο στάσεις 
WITH RECURSIVE itenary(start, dest, distance, path_string) AS
( SELECT S.start, D.dest, 1 AS distance,
S.start || '.' || D.dest || '.' AS path_string,
D.dest AS direct_connection
FROM Flights AS S JOIN Flights AS D
        ON S.dest = D.start
        AND S.start = 'HER'
        AND S.arrives <= D.departs -- source
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%' AND tc.distance < 3
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.distance
FROM itenary
WHERE dest = 'JFK' -- the target node
ORDER BY distance, start, dest;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
WITH RECURSIVE itenary(start, dest, distance, path_string) AS
( SELECT S.start, D.dest, 1 AS distance,
S.start || '.' || D.dest || '.' AS path_string,
D.dest AS direct_connection
FROM Flights AS S JOIN Flights AS D
        ON S.dest = D.start
        AND S.arrives <= D.departs -- source
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%'
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.distance
FROM itenary
WHERE itenary.start = 'ATH' AND itenary.dest='JFK'
ORDER BY distance, start, dest;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
WITH RECURSIVE itenary(start, dest, distance, path_string) AS
( SELECT start, dest, 1 AS distance,
start || '.' || dest || '.' AS path_string,
dest AS direct_connection
FROM Flights
UNION ALL
SELECT tc.start, e.dest, tc.distance + 1,
tc.path_string || e.dest || '.' AS path_string, tc.direct_connection
FROM Flights AS e
JOIN itenary AS tc ON e.start = tc.dest
WHERE tc.path_string NOT LIKE '%' || e.dest || '.%'
)
SELECT itenary.start, itenary.dest, itenary.direct_connection, itenary.path_string, itenary.distance
FROM itenary
ORDER BY distance, start, dest;
