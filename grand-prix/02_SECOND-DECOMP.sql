DROP TABLE IF EXISTS GRANDPRIX CASCADE;
DROP TABLE IF EXISTS RESULTS CASCADE;
DROP TABLE IF EXISTS BASELINE CASCADE;

CREATE TABLE GRANDPRIX
(
    GRANDPRIXID   INTEGER NOT NULL,
    GRANDPRIXNAME TEXT,
    PRIMARY KEY (GRANDPRIXID)
);

CREATE TABLE RESULTS
(
    GRANDPRIXID      INTEGER NOT NULL,
    BASELINEPOSITION INTEGER NOT NULL,
    FOREIGN KEY (GRANDPRIXID) REFERENCES GRANDPRIX (GRANDPRIXID),
    PRIMARY KEY (GRANDPRIXID, BASELINEPOSITION)
);

CREATE TABLE BASELINE
(
    BASELINEPOSITION INTEGER NOT NULL,
    PILOTID          INTEGER NOT NULL,
    CARNAME          TEXT,
    PILOTNAME        TEXT,
--FOREIGN KEY (BASELINEPOSITION) REFERENCES RESULTS(BASELINEPOSITION),
    PRIMARY KEY (BASELINEPOSITION, PILOTID)
);

INSERT INTO GRANDPRIX
VALUES (1, 'GRANDPRIX MONAKO');
INSERT INTO GRANDPRIX
VALUES (2, 'GRANDPRIX VIETNAM');

INSERT INTO RESULTS
VALUES (1, 56);
INSERT INTO RESULTS
VALUES (2, 56);

INSERT INTO BASELINE
VALUES (56, 123, 'MACLAREN', 'N. LAUDA');
INSERT INTO BASELINE
VALUES (56, 124, 'FERRARI', 'N. LAUDA');

SELECT *
FROM BASELINE
         NATURAL JOIN RESULTS
         NATURAL JOIN GRANDPRIX;