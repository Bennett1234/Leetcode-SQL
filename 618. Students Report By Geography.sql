SELECT AMERICA, EUROP, ASIA
FROM
(SELECT name as AMERICA, row_number() OVER(PARTITION BY continent order by name) as rk
from student) as t1
left join 
(SELECT name as ASIA, row_number() OVER(PARTITION BY continent order by name) as rk
from student) as t2 on t1.rk = t2.rk
left join
(SELECT name as EUROP, row_number() OVER(PARTITION BY continent order by name) as rk
from student) as t3 on t2.rk = t3.rk
ORDER BY t1.rk

/*
OR you can try following
*/

WITH continent_pivot AS
(
SELECT
CASE WHEN continent = 'America' THEN name END AS 'America',
CASE WHEN continent = 'Asia' THEN name END AS 'Asia',
CASE WHEN continent = 'Europe' THEN name END AS 'Europe',
ROW_NUMBER() OVER(PARTITION BY continent ORDER BY name) AS rk
FROM student
)

SELECT
MAX(America) AS America,
MAX(Asia) AS Asia,
MAX(Europe) AS Europe
FROM continent_pivot
GROUP BY rk;
