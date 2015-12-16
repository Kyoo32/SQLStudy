use exercise;


#1
alter table book add column  inventory int(5) not null default 0;
#2
ALTER TABLE book rename to book_inventory;
desc book_inventory;

#3
AlTER TABLE book_inventory ADD PRIMARY KEY(ISBN);
AlTER TABLE book_inventory ADD unique KEY(cost);
-> ERROR

#4
Alter table book_inventory add column pub_location varchar(256) default 'Seoul Kr';

SET SQL_SAFE_UPDATES = 0;
update book_inventory set pub_location = 'NewYork Us' where id >25 and id <= 50; 
update book_inventory set pub_location = 'Dokyo Jp' where id >50 and id <= 75; 
update book_inventory set pub_location = 'Paris Fr' where id >75; 

ALTER table book_inventory ADD COLUMN pub_loc_city varchar(128);
update book_inventory set pub_loc_city = substring_index(pub_location,' ',1) ;

ALTER table book_inventory ADD COLUMN pub_loc_nation varchar(128);
update book_inventory set pub_loc_nation = substring_index(pub_location,' ',-1) ;