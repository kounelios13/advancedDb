﻿DROP TABLE IF EXISTS ARTWORK CASCADE;
DROP TABLE IF EXISTS TYPEOFWORK CASCADE;
DROP TABLE IF EXISTS ARTIST CASCADE;
DROP TABLE IF EXISTS AUCTION CASCADE;
DROP TABLE IF EXISTS AUCTIONHOUSE CASCADE;
DROP TABLE IF EXISTS INCLUDED CASCADE;

-- Table: AUCTIONHOUSE
CREATE TABLE AUCTIONHOUSE (
	AuctionHouseID TEXT NOT NULL,
	Name TEXT NOT NULL UNIQUE,
	Address TEXT,
	Website TEXT,
	PRIMARY KEY(AuctionHouseID)
);
-- Table: AUCTION
CREATE TABLE AUCTION (
	AuctionID TEXT NOT NULL,
	Name TEXT NOT NULL UNIQUE,
	Overview TEXT,
	Date TEXT NOT NULL,
	Location TEXT,
	WebLink TEXT,
	ActionHouse TEXT REFERENCES AUCTIONHOUSE(AuctionHouseID),
	PRIMARY KEY(AuctionID)
);
-- Table: ARTIST
CREATE TABLE ARTIST (
	ArtistID TEXT NOT NULL,
	Name TEXT NOT NULL, 
	Nationality TEXT, 
	YearOfBirth TEXT NOT NULL, 
	YearOfDeath TEXT, 
	ShortCV TEXT, 
	WebLink TEXT,
	PRIMARY KEY(ArtistID)
);
-- Table: TYPEOFWORK
CREATE TABLE TYPEOFWORK (
	TypeID TEXT NOT NULL,
	Name TEXT NOT NULL UNIQUE, 
	WebLink TEXT,
	PRIMARY KEY(TypeID)
);
-- Table: ARTWORK
CREATE TABLE ARTWORK (
	ArtWorkID TEXT NOT NULL,
	Name TEXT NOT NULL,
	Description TEXT,
	YearOfCreation TEXT,
	Photo TEXT,
	CreatedBy TEXT REFERENCES ARTIST(ArtistID),
	TypeOfWork TEXT REFERENCES TYPEOFWORK(TypeID),
	PRIMARY KEY(ArtWorkID)
);
-- Table: INCLUDED
CREATE TABLE INCLUDED (
	AuctionID TEXT REFERENCES AUCTION(AuctionID),
	ArtWorkID TEXT REFERENCES ARTWORK(ArtWorkID),
	ValuedFrom INTEGER,
	ValuedTo INTEGER,
	SoldFor INTEGER,
	PRIMARY KEY(AuctionID, ArtWorkID)
);