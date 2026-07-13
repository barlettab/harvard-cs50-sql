SELECT p.first_name, p.last_name
FROM "players" AS p
JOIN "salaries" AS s
ON p.id = s.player_id
WHERE s.salary = (
	SELECT MAX(salaries.salary)
	FROM salaries
);
