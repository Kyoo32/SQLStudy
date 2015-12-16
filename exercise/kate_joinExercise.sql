use company;

#1
SELECT e.ssn, e.name, d.dnum, d.name, d.mgrssn
FROM employee as e
INNER JOIN department as d ON e.dnum = d.dnum;

#2
SELECT e.ssn, e.name, d.dnum, d.name, d.mgrssn
FROM employee as e
INNER JOIN department as d ON e.dnum = d.dnum
where d.name = '정보기획부';


#3
select d.name, e.name 
from employee as e
inner join department as d on d.mgrssn = e.ssn;



#4
select d.name, e.name 
from employee as e
inner join department as d on d.mgrssn = e.ssn
where d.name = '기획부';

#5
select d.name, e.name 
from employee as e
inner join department as d on d.mgrssn = e.ssn
where e.name = 'H Y Jung';


#6
SELECT p.pnum, p.name
FROM department as d
INNER JOIN project as p
ON d.dnum <> p.ctrl_dnum 
WHERE d.name = '기획부';


#7
SELECT distinct p.pnum, p.name 
FROM worksOn as w
INNER JOIN project as p
ON  p.pnum <> w.pnum 
WHERE w.ssn = 'D J Kim' ;


#8
SELECT e.name, w.pnum, w.hours
FROM employee as e
NATURAL JOIN worksOn as w;

#9
select e.name, sum(hours)
from employee as e
join worksOn as w
on w.ssn = e.ssn
group by e.name;

#10
select p.name, sum(hours)
from worksON as w
join project as p
on p.pnum = w.pnum
group by p.name;

#11
select p.name, sum(hours)
from worksON as w
join project as p
on p.pnum = w.pnum
where p.name = 'Product X'group by p.name;


#12
select p.name, sum(hours)
from worksON as w
join project as p
on p.pnum = w.pnum
group by p.name having sum(hours) >= 100 ;

