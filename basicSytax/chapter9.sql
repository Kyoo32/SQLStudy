SELECT mc.last, mc.phone
FROM my_contacts AS mc
	NATURAL JOIN
	job_desired AS jd
WHERE jd.title = 'Web Developer'
	AND jd.salary_low < 105000;

SELECT mc.first, mc.phone, jc.title
FROM job_current AS jc
 	NATURAL JOIN my_contacts AS mc
 	WHERE 
 	jc.title in ('Cook', 'Hairdresser', 'Web Designer', 'Web Developer');

SELECT mc.first, mc.phone, jc.title
FROM job_current AS jc
 	NATURAL JOIN my_contacts AS mc
 	WHERE 
 	jc.title in (SELECT title FROM job_listings);

 SELECT last_name, first_name
 FROM my_contacts
 WHERE zip_code = (SELECT zip_code FROM zip_code WHERE city = 'Memphis' AND state = 'TN');


SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc 
	NATURAL JOIN job_current as jc
	WHERE jc.salary = ( SELECT MAX(jc.salary) FROM job_current );

SELECT mc.first_name, mc.last_name,
(SELECT state FROM zip_code WHERE mc.zip_code = zip_code ) AS state
FROM my_contacts mc;

SELECT mc.first_name, mc.last_name, jc.salary
FROM my_contacts AS mc 
	NATURAL JOIN job_current AS jc
	WHERE jc.salary > 
	(SELECT jc.salary FROM my_contacts mc NATURAL JOIN job_current jc 
		WHERE email = 'xx@xx');
	
  