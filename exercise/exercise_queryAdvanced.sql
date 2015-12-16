
use exercise;

#1
update book_inventory
set pub_loc_nation = 
case 
	when pub_loc_nation = 'Kr'
		then 'Korea'
	when pub_loc_nation = 'Us'
		then 'United States of America'
	when pub_loc_nation = 'Jp'
		then 'Japan'
	else 'France'
end;


#2
select * from book_inventory Order by pub_loc_nation, pub_loc_city;
select * from book_inventory Order by pub_loc_nation, pub_loc_city, cost DESC;

#before 3
create table book_sales
(
	id int not null auto_increment,
    title varchar(128) not null,
    sales_quantity int(10) not null default 0,
    sales_price int(10) not null default 0,
    sales_date varchar(10) not null default '0',
    primary key(id)
);

load data local infile '/users/katekyuwon/Desktop/bookSales.csv' into table book_sales fields terminated by ',' enclosed by '"'(title, sales_quantity, sales_price, sales_date) set id = NULL; 

#3
select title, sum(sales_quantity), sum(sales_price) from book_sales group by title having title like '이기적%';

#4
select title, sum(sales_quantity), sum(sales_price) from book_sales group by title order by sum(sales_quantity) desc limit 3;

#5
select substring_index(sales_date,'.',1), sum(sales_price), sum(sales_quantity) from book_sales group by substring_index(sales_date,'.',1);

#6
select title, sum(sales_price) from book_sales group by title having sum(sales_price) >= 200000;
select title, sum(sales_price) from book_sales group by title having sum(sales_price) <= 20000;