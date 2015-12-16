UPDATE tablename
SET column =
CASE
	WHEN column1 = somevalue1
		then newvalue1
	WHEN column2 = somevalue2
		then newvalue2
	ELSE newvalue3
END;

SELECT columns FROM tablename ORDER BY column ASC/DESC;
SELECT SUM(column) FROM tablename WHERE ;
SELECT columnSTD, SUM(column) FROM tablename GROUP BY columnSTD;
/AVG(column);
/MAX(column);
/MIN(column);
/COUNT('distinct' column);

LIMIT x.x;



