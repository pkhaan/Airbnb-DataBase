set client_encoding to ‘utf8’;
\copy Calendar FROM 'airbnb dataset/calendar.csv' DELIMITER ',' CSV HEADER;
\copy Listing FROM 'airbnb dataset/listings.csv' DELIMITER ',' CSV HEADER;
\copy Neighbourhoods FROM 'airbnb dataset/neighbourhoods.csv' DELIMITER ',' CSV HEADER;
\copy Reviews FROM 'airbnb dataset/reviews.csv' DELIMITER ',' CSV HEADER;
\copy Summary_Listings FROM 'airbnb dataset/summary_listings.csv' DELIMITER ',' CSV HEADER;
\copy Summary_Reviews FROM 'airbnb dataset/summary_reviews.csv' DELIMITER ',' CSV HEADER;
\copy Geolocation FROM 'airbnb dataset/geolocation.csv' DELIMITER '.' CSV HEADER;