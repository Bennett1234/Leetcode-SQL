SELECT name, population, area
FROM World
WHERE EXISTS (
SELECT population, area
WHERE (population > 25000000) OR (area > 3000000)
);
