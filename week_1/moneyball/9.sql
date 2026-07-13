SELECT t.name, ROUND(AVG(s.salary), 2) AS "average salary"
FROM "teams" AS t
JOIN "salaries" AS s
ON t.id = s.team_id
WHERE s.year = 2001
GROUP BY t.id
ORDER BY "average salary" ASC
LIMIT 5;
