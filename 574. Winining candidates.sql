SELECT Name FROM Candidate 
WHERE id =
(SELECT CandidateId FROM Vote
 GROUP BY CandidateId
 ORDER BY COUNT(*) DESC
 LIMIT 1
) ;

SELECT Name FROM Candidate AS a
JOIN
(SELECT CandidateId FROM Vote
 GROUP BY CandidateId
 ORDER BY COUNT(*) DESC
 LIMIT 1
) AS b
ON a.id = b.CandidateId;
