/* Create table Neighborhood */
CREATE TABLE Neighborhood AS 
SELECT DISTINCT neighbourhood, neighbourhood_cleansed
FROM Listings;

/* Rename Neighborhood table columns */
ALTER TABLE Neighborhood RENAME COLUMN neighbourhood TO neighborhood_name;
ALTER TABLE Neighborhood RENAME COLUMN neighbourhood_cleansed TO zip_code;

/* Delete all Neighborhood rows containing a null element */
DELETE FROM Neighborhood
WHERE neighborhood_name IS NULL OR zip_code IS NULL;

/* Delete neighbourhood_group_cleansed from Listings */
ALTER TABLE Listings DROP COLUMN neighbourhood_group_cleansed;

/* Rename Listings column */
ALTER TABLE Listings RENAME COLUMN neighbourhood TO neighborhood;

/* Add composite primary key to Neighborhood */
ALTER TABLE Neighborhood ADD PRIMARY KEY (neighborhood_name, zip_code);

/* Add foreign keys to Listings */
ALTER TABLE Listings 
ADD CONSTRAINT neighborhood_fk FOREIGN KEY (neighborhood, neighbourhood_cleansed) 
REFERENCES Neighborhood (neighborhood_name, zip_code);

/* Rename Summary_Listings column */
ALTER TABLE Summary_Listings RENAME COLUMN neighbourhood TO zip_code;

/* Delete neighbourhood_group from Summary_Listings */
ALTER TABLE Summary_Listings DROP COLUMN neighbourhood_group;