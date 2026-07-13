SELECT COUNT("title") AS "number of episodes in the last 6y"
FROM "episodes"
WHERE "air_date" BETWEEN '2018-01-01' AND '2023-12-31';
