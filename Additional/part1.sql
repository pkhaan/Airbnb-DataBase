/* Remove '%' from response_rate and set 'N/A' to null */
UPDATE Host
SET response_rate = REPLACE(response_rate,'%','');

UPDATE Host
SET response_rate = NULL
WHERE response_rate LIKE 'N/A';

/* Alter response_rate type to numeric */
ALTER TABLE Host ALTER COLUMN response_rate TYPE numeric USING response_rate::numeric;

/* Add new columns to Host table */
ALTER TABLE Host
ADD COLUMN city text,
ADD COLUMN state text,
ADD COLUMN country text;

/* Fill new columns with data from 'location' field */
UPDATE Host
SET city = SPLIT_PART(location,',', 1)
WHERE location LIKE '%,%,%';

UPDATE Host
SET state = SPLIT_PART(location,',', 2)
WHERE location LIKE '%,%,%';

UPDATE Host
SET country = SPLIT_PART(location,',', 3)
WHERE location LIKE '%,%,%';

UPDATE Host
SET state = SPLIT_PART(location,',', 1)
WHERE location LIKE '%,%' AND location NOT LIKE '%,%,%';

UPDATE Host
SET country = SPLIT_PART(location,',', 2)
WHERE location LIKE '%,%' AND location NOT LIKE '%,%,%';

UPDATE Host
SET country = location
WHERE location NOT LIKE '%,%';

/* Delete 'location' */
ALTER TABLE Host 
DROP COLUMN location;

/* Create Amenity table */
UPDATE Listing
SET amenities = REPLACE(amenities,'{','');
UPDATE Listing
SET amenities = REPLACE(amenities,'}','');
UPDATE Listing
SET amenities = REPLACE(amenities,'"','');

CREATE TABLE Amenity AS 
SELECT DISTINCT regexp_split_to_table(amenities, ',') 
FROM Listing
WHERE amenities NOT LIKE ''

ALTER TABLE Amenity RENAME COLUMN regexp_split_to_table TO amenity_name;
ALTER TABLE Amenity ADD COLUMN amenity_id SERIAL;

ALTER TABLE Amenity ADD PRIMARY KEY (amenity_id)

/* Create new table (Listing_Amenity) with columns 'listing_id' and 'amenity_id' */
CREATE TABLE Listing_Amenity AS
SELECT regexp_split_to_table(amenities, ',') , id
FROM listing;

UPDATE Listing_Amenity
SET regexp_split_to_table = (
	SELECT amenity_id
	FROM amenity
	WHERE amenity_name = regexp_split_to_table
);

ALTER TABLE Listing_Amenity RENAME COLUMN regexp_split_to_table TO amenity_id;
ALTER TABLE Listing_Amenity RENAME COLUMN id TO listing_id;

ALTER TABLE Listing_Amenity ALTER COLUMN amenity_id TYPE integer USING amenity_id::integer;

ALTER TABLE Listing_Amenity
ADD CONSTRAINT listing_fk FOREIGN KEY (listing_id) 
REFERENCES Listing (id);

ALTER TABLE Listing_Amenity
ADD CONSTRAINT amenity_fk FOREIGN KEY (amenity_id) 
REFERENCES Amenity (amenity_id);

/* Delete 'amenities' from Listing */
ALTER TABLE Listing DROP COLUMN amenities;