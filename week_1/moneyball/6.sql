SELECT t.name, SUM(p.H) AS "total hits"
FROM "teams" AS t
JOIN "performances" AS p
ON t.id = p.team_id
WHERE p.year = 2001
GROUP BY t.id
ORDER BY "total hits" DESC
LIMIT 5;
