--Write a SQL query to find all numbers that appear at least three times consecutively.

SELECT DISTINCT a.Num AS ConsecutiveNums FROM Logs a, Logs b, Logs c
WHERE a.Num-b.Num=0
AND b.Num-c.Num = 0
AND c.Id-b.Id = 1
AND b.Id-a.Id = 1

SELECT DISTINCT a.Num AS ConsecutiveNums FROM Logs AS a
INNER JOIN Logs AS b ON  a.Id + 1 = b.Id
INNER JOIN Logs AS c ON a.Id + 2 = c.Id
WHERE a.Num = b.Num
AND b.Num = c.Num
-- must include distinct other wise will return multiple number when more than 3 times consecutively showed up
