/* Update street column of Listings table */
UPDATE Listings
SET street = split_part(street, ',', 1)

/* Update Listings columns */
UPDATE Listings
SET price = REPLACE(price,'$',''), 
	weekly_price = REPLACE(weekly_price,'$',''), 
	monthly_price = REPLACE(monthly_price,'$',''), 
	security_deposit = REPLACE(security_deposit,'$',''),
	cleaning_fee = REPLACE(cleaning_fee,'$','');

UPDATE Listings
SET price = REPLACE(price,',',''), 
	weekly_price = REPLACE(weekly_price,',',''), 
	monthly_price = REPLACE(monthly_price,',',''), 
	security_deposit = REPLACE(security_deposit,',',''),
	cleaning_fee = REPLACE(cleaning_fee,',','');
	
	
/* Change type of columns */	
ALTER TABLE Listings ALTER COLUMN price TYPE numeric USING price::numeric;
ALTER TABLE Listings ALTER COLUMN weekly_price TYPE numeric USING weekly_price::numeric;
ALTER TABLE Listings ALTER COLUMN monthly_price TYPE numeric USING monthly_price::numeric;
ALTER TABLE Listings ALTER COLUMN security_deposit TYPE numeric USING security_deposit::numeric;
ALTER TABLE Listings ALTER COLUMN cleaning_fee TYPE numeric USING cleaning_fee::numeric;