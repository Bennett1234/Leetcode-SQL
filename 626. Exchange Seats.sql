SELECT
(CASE
WHEN MOD(id, 2) != 0 AND counts(*) != id THEN id + 1
WHEN MOD(id, 2) != 0 AND counts(*) = id THEN id
ELSE id - 1
END) AS id,
student
FROM seat
ORDER BY id ASC;


Select s1.id, ifnull(s2.student, s1.student) as student from
Seat s1
Inner join
Sear s2
On s1.id!=s2.id and div(s1.id-1,2)=div(s2.id-1, 2)
