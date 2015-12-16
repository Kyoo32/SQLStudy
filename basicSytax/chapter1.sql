

cd /usr/local/
cd /mysql/bin
./mysql -u() -p


CREATE DATABASE ();
USE (DATEBASE);

CREATE TABLE my_contacts
(
	last_name VARCHAR(30), NOT NULL,
	first_name VARCHAR(20), NOT NULL,
	email VARCHAR(50),
	gender CHAR(1),
	birthday DATE,
	profession VARCHAR(50),
	location VARCHAR(50),
	status VARCHAR(20), DEFAULT 'good',
	seeking VARCHAR(100)
);

DESC my_contacts;

INSERT INTO my_contacts (last_name , first_name, birthday) VALUES('Anderson', 'Jillian', '1980-09-05');

CREATE TABLE doughnut_purchases
(
	doughnut_type VARCHAR(10),
	dozens INT, 
	topping VARCHAR(20), 
	price DEC(2,2)
);

INSERT INTO doughnut_purchases(doughnut_type, dozens, topping, price) VALUES ('jelly', 3, 'sprinkles', 3.50);

SELECT * FROM doughnut_purchases;