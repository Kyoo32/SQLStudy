UPDATE my_contacts
SET interest1 = SUBSTRING_INDEX(interests, ',', 1)
SET interests = SUBSTR(interests, LENGH(interest1)+2);


CREATE TABLE profession AS
	SELECT profession FROM my_contacts
	GROUP BY profession
	ORDER BY profession;
ALTER TABLE profession
	ADD COLUMN id NOT NULL AUTO_INCREMENT FIRST,
	ADD PRIMARY KEY(id);


CREATE TABLE profession(
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	profession varchar(20)
) AS
	SELECT profession FROM my_contacts
	GROUP BY profession
	ORDER BY profession;

SELECT profession (AS) mc_prof
FROM my_contacts (AS) mc
GROUP BY profession
ORDER BY profession;

SELECT t.toy b.boy 
FROM toys AS t
	CROSS JOIN
	boys AS b;

==

SELECT toys.toy, boys.boy
FROM toys, boys;

SELECT columns
FROM tb1
	INNER JOIN
	tb2
on(WHERE) conditions;


