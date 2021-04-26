/* Write an SQL query to find all dates' id with higher temperature compared to its previous dates (yesterday).

Return the result table in any order.*/

SELECT
    weather.id AS 'Id'
FROM
    weather
        JOIN
    weather w ON DATEDIFF(weather.recordDate, w.recordDate) = 1
        AND weather.Temperature > w.Temperature
        
-- originally using lag function, but would not work if the date is not contimuous

SELECT w.id
FROM (SELECT id,Temperature, recordDate,
     lag(Temperature) over(order by recordDate) as pre_tem
     from Weather ) as w
where w.Temperature > w.pre_tem
