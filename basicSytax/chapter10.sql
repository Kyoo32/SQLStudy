SELECT g.girl, t.toy
FROM toys t
LEFT OUTER JOIN girls g
ON g.toy_id = t.toy_id;


SELECT g.girl, t.toy
FROM girls g
RIGHT OUTER JOIN toys t
on g.toy_id = t.toy_id;


SELECT c1.name, c2.nage AS boss
FROM clown_info c1
innner join clown_info c2
on c1.boss_id = c2.id;
=
SELECT c1.name
(SELECT name FROM clown_info WHERE c1.boss_id = id) AS boss FROM clown_info c1;

SELECT title FROM job_current
UNION(ALL)
SELECT title FROM job_desired
UNION(ALL)
SELECT title FROM job_listings
ORDER by title;


CREATE table my_union AS
SELECT title FROM job_current
UNION(ALL)
SELECT title FROM job_desired
UNION(ALL)
SELECT title FROM job_listings;

SELECT title  FROM job_current
INTERSECT
SELECT title FROM job_desired;

SELECT title FROM job_current
EXCEPT
SELECT title FROM job_desired;


SELECT title FROM job_listings WHERE salary = (SELECT MAX(salary) FROM job_listings);
=
SELECT title FROM job_listings ORDER BY salary DESC LIMIT 1;

SELECT mc.first_name, mc.last_name FROM my_contacts mc
NATURAL JOIN job_current jc WHERE jc.salary > (SELECT AVG(salary) FROM job_current);

