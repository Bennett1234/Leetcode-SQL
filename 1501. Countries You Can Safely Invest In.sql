WITH  

tmp AS (
SELECT caller_id AS call_id, duration FROM (
SELECT DISTINCT caller_id, callee_id, duration FROM Calls
) AS a
UNION ALL
SELECT callee_id AS call_id, duration FROM (
SELECT DISTINCT caller_id, callee_id, duration FROM Calls
) AS b)

SELECT a.name AS country FROM Country AS a
LEFT JOIN Person AS b
ON a.country_code = LEFT(b.phone_number, 3)
LEFT JOIN tmp AS c
ON b.id = c.call_id
GROUP BY a.name
HAVING AVG(c.duration) > (SELECT AVG(duration) FROM tmp);
