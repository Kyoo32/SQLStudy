<various usage of SHOW>
SHOW columns FROM tablename;
SHOW CREATE DATABASE databasename;
SHOW INDEX FROM tablename;
SHOW WARNINGS;

CREATE TABLE my_contacts
(
	contact_id INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(contact_id)	
);

ALTER TABLE tablename
ADD COLUMN columnname type NOT NULL AUTO_INCREMENT
 FIRST/SECOND /THIRD / AFTER colunmname/ BEFORE  / LAST,
ADD PRIMARY KEY(column name);
