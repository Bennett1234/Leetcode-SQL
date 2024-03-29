SELECT W.TRANSACTION_COUNT, COUNT(DISTINCT W.USER_ID) AS VISITS_COUNT
FROM (SELECT *, (SELECT IFNULL(COUNT(*),0) FROM TRANSACTION AS T WHERE T.TRANSACTION_DATE = V.VISIT_DATE) AS TRANSACTION_COUNT
FROM VISIT AS V) AS W
GROUP BY W.TRANSACTION_COUNT
