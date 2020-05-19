/* Update Calendar column price */
UPDATE Calendar
SET price = REPLACE(price,'$','');
UPDATE Calendar
SET price = REPLACE(price,',','');

/* Change type of column price */	
ALTER TABLE Calendar ALTER COLUMN price TYPE numeric USING price::numeric;