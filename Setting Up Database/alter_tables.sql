ALTER TABLE Calendar
    ADD CONSTRAINT fk_calendar_listings FOREIGN KEY (listing_id) REFERENCES Listings (id);

ALTER TABLE Summary_Reviews
    ADD CONSTRAINT fk_sum_rev_listings FOREIGN KEY (listing_id) REFERENCES Listings (id);

ALTER TABLE Reviews
    ADD CONSTRAINT fk_reviews_listings FOREIGN KEY (listing_id) REFERENCES Listings (id);

ALTER TABLE Summary_Listings
    ADD CONSTRAINT fk_sum_list_listings FOREIGN KEY (id) REFERENCES Listings (id);

ALTER TABLE Summary_Listings
    ADD CONSTRAINT fk_sum_list_neighb FOREIGN KEY (neighbourhood) REFERENCES Neighbourhoods (neighbourhood);