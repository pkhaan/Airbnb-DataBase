create table public. "Calendar"(
   listing_id int,
   date date ,
   available boolean,
   price varchar(10),
   adjusted_price varchar(10),
   minimum_nights int,
   maximum_nights int,
   primary key (listing_id , date)
);