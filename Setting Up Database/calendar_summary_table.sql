/* Create table Calendar_Summary */
CREATE TABLE Calendar_Summary AS 
SELECT id, calendar_updated, calendar_last_scraped, availability_30, availability_60, availability_90
FROM Listings;

/* Rename Calendar_Summary table columns */
ALTER TABLE Calendar_Summary RENAME COLUMN id TO listing_id;
ALTER TABLE Calendar_Summary RENAME COLUMN calendar_last_scraped TO from_date;

/* Add composite primary key to Calendar_Summary */
ALTER TABLE Calendar_Summary ADD PRIMARY KEY (listing_id, from_date);

/* Add foreign key to Calendar_Summary */
ALTER TABLE Calendar_Summary 
ADD CONSTRAINT listing_id_fk FOREIGN KEY (listing_id) REFERENCES Listings (id);

/* Delete copied columns from Listings, except from listing_id */
ALTER TABLE Listings 
DROP COLUMN calendar_updated,
DROP COLUMN calendar_last_scraped, 
DROP COLUMN availability_30,
DROP COLUMN availability_60,
DROP COLUMN availability_90;