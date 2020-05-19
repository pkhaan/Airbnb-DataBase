/* Select hosts with more than 20 bedrooms overall and show their total bedrooms and their total listings 
Output: 31
*/
SELECT host_id, SUM (bedrooms), COUNT(host_id)
FROM listing
GROUP BY host_id
HAVING SUM (bedrooms) > 20
ORDER BY sum;


/* Select hosts with more than $10.000 possible income every month
Output: 78
*/
SELECT host_id, SUM (monthly_price)
FROM listing
GROUP BY host_id
HAVING SUM (monthly_price) > 10000
ORDER BY sum;


/* Find the summary of the houses that were reviewed on 2016's new year's eve and have the word 'Christmas' in them
Output: 6 rows
*/
SELECT listing.listing_url, listing.summary, review.comments, review.date
FROM review
INNER JOIN listing
ON listing.id = review.listing_id
WHERE review.date = '2015-12-31' and review.comments like '%Christmas%'
ORDER BY review.date;


/* Find the 50 most recent rentings in the neighborhood 'East Downtown'
Output: 100 rows
*/
SELECT listing.listing_url, calendar.date, listing.neighborhood
FROM listing
INNER JOIN calendar
ON listing.id = calendar.listing_id
WHERE listing.neighborhood = 'East Downtown'
ORDER BY calendar.date DESC LIMIT 50;


/* Find all neighborhoods with comments containing the words 'safe', 'quiet' and 'close to'
Output: 50 rows
*/
SELECT DISTINCT listing.neighborhood_overview, listing.neighborhood, neighborhood.zip_code
FROM listing
INNER JOIN neighborhood
ON listing.neighborhood = neighborhood.neighborhood_name
WHERE listing.neighborhood_overview LIKE '%safe%' 
	AND listing.neighborhood_overview LIKE '%quiet%'
	AND listing.neighborhood_overview LIKE '%close to%' 
ORDER BY listing.neighborhood;


/* Find all hosts in New York that have listings with maximum nights>10
Output: 47 rows
*/
SELECT DISTINCT listing.host_id, host.city, listing.maximum_nights
FROM listing
INNER JOIN host
ON listing.host_id = host.id
WHERE host.city = 'New York' AND listing.maximum_nights > 10
ORDER BY listing.maximum_nights;