SELECT p.first_name, p.last_name, s.salary
FROM "players" AS p
JOIN "salaries" AS s
ON p.id = s.player_id
WHERE "year" = 2001
ORDER BY s.salary ASC, p.first_name ASC, p.last_name ASC, s.player_id
LIMIT 50;
