/* Find the 100 most recent rentings in the neighbourhood 'Barton Hills'
Output: 100 rows
*/
SELECT listings.listing_url, calendar.date, listings.neighbourhood
FROM listings
INNER JOIN calendar
ON listings.id = calendar.listing_id
WHERE listings.neighbourhood = 'Barton Hills'
ORDER BY calendar.date DESC LIMIT 100;



/* Find the summary of the houses that were reviewed On August 15, 2016
Output: 264 rows
*/
SELECT listings.listing_url, listings.summary, reviews.comments, reviews.date
FROM reviews
INNER JOIN listings
ON listings.id = reviews.listing_id
WHERE reviews.date = '2016-08-15'
ORDER BY reviews.date;



/* Find the reviews of rentings with a price above 100.000 dollars
Output: 13536 rows
*/
SELECT calendar.listing_id, reviews.comments, calendar.price, reviews.date
FROM reviews
INNER JOIN calendar
ON reviews.listing_id = calendar.listing_id
WHERE char_length(calendar.price) > 10;



/* For reviewer 111425869 find the decription of 10 most recent houses they reviewed
Output: 10 rows
*/
SELECT listings.listing_url, listings.description, reviews.reviewer_id, reviews.comments
FROM reviews
INNER JOIN listings
ON reviews.listing_id = listings.id
WHERE reviews.reviewer_id = 8740591
LIMIT 10;



/* Find all listings with 365 availability in neighbourhood 78702
Output: 6 rows
*/
SELECT summary_listings.name, summary_listings.neighbourhood, summary_listings.availability_365
FROM summary_listings
WHERE summary_listings.neighbourhood = 78702 AND summary_listings.availability_365 = 1
ORDER BY summary_listings.name;



/* Find all comments of all listings that have more than 300 reviews
Output: 5247 rows
*/
SELECT summary_listings.name, summary_listings.number_of_reviews, reviews.date, reviews.comments
FROM reviews
FULL OUTER JOIN summary_listings
ON reviews.listing_id = summary_listings.id
WHERE summary_listings.number_of_reviews > 300
ORDER BY summary_listings.number_of_reviews DESC, reviews.date DESC;



/* Find all listings with more than 10 minimum nights in neighbourhood 78702
Output: 20 rows
*/
SELECT listings.listing_url, summary_listings.minimum_nights, summary_listings.neighbourhood
FROM listings
INNER JOIN summary_listings 
ON listings.id = summary_listings.id
WHERE summary_listings.minimum_nights > 10 AND summary_listings.neighbourhood = 78702
ORDER BY summary_listings.minimum_nights DESC;



/* Find all listings that have more than 3 bedrooms and hosted more than 10 people
Output: 146 rows
*/
SELECT listings.listing_url, listings.bedrooms, summary_listings.calculated_host_listings_count
FROM listings 
INNER JOIN summary_listings 
ON listings.id = summary_listings.id
WHERE summary_listings.calculated_host_listings_count > 10 AND listings.bedrooms > 3
ORDER BY summary_listings.calculated_host_listings_count DESC;



/* Find all listings that have a price more expensive than 500
Output: 100 rows
*/
SELECT calendar.date, summary_listings.price
FROM summary_listings
INNER JOIN calendar
ON calendar.listing_id = summary_listings.id
WHERE summary_listings.price > 500
ORDER BY calendar.date DESC, summary_listings.price DESC 
LIMIT 100;



/* Find all reviewers whom names are ->John<-
Output: 1130 rows
*/
SELECT listings.listing_url, listings.summary, reviews.reviewer_name, reviews.comments, reviews.date
FROM reviews
INNER JOIN listings
ON listings.id = reviews.listing_id
WHERE reviews.reviewer_name LIKE '%John%'
ORDER BY reviews.reviewer_name DESC;



/* Find All listings that can host more than 5 minimum nights and have availability 365
Output: 2 rows
*/
SELECT listings.listing_url, summary_listings.minimum_nights, summary_listings.availability_365
FROM listings
FULL OUTER JOIN summary_listings
ON listings.id = summary_listings.id
WHERE summary_listings.minimum_nights > 5 AND summary_listings.availability_365 = 1
ORDER BY summary_listings.minimum_nights DESC, summary_listings.availability_365 DESC;



/* Find all reviews that have the word 'disgusting' in them
Output: 27 rows
*/
SELECT reviews.reviewer_name, reviews.comments
FROM reviews
WHERE reviews.comments LIKE '%disgusting%'
ORDER BY reviews.date DESC