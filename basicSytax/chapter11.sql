CREATE TABLE piggy_bank
(
	id INT AUTO_INCREMENT NOT NULL PRIMARE KEY,
	coin CHAR(1) CHECK (coin IN ('P', 'N', 'D', 'Q'))
)

WITH CHECK OPTION;

ALTER TABLE my_contacts
ADD CONSTRAINT CHECK gender IN ('M', 'F');

CHECK (column1 > 200)
CHECK (column2 NOT IN ('x', 'y', 'z'))
CHECK ('A' = SUBSTRING(column_3, 1, 1))
CHECK ('A' = SUBSTRING(column_4, 1, 1))


CREATE VIEW web_designers AS
SELECT mc.first_name, mc.last_name, mc.phone, mc.email
FROM my_contacts mc
NATURAL JOIN job_desired job_desired
WHERE jd.title = 'Web Designer';

CREATE VIEW tech_writer_jobs AS
SELECT title, salary, description, zip
FROM job_listings
WHERE title = 'Technical Writer';

=>
SELECT * FROM web_designers;


CREATE VIEW job_raise AS
SELECT mc.first_name, mc.last_name, mc.email, mc.phone, jc.contact_id, jc.salary, 
jd.salary_low, jd.salary_low - jc.salary AS raise
FROM job_current jc
INNER JOIN job_desired jd
INNER JOIN my_contacts mc
WHERE jc.contact_id = jd.contact_id AND jc.contact_id = mc.contact_id;
