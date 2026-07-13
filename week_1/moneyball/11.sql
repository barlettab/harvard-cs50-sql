SELECT p.first_name,
		p.last_name,
		s.salary / per.H AS "dollars per hit"
FROM "players" AS p
JOIN "salaries" AS s
ON p.id = s.player_id
JOIN "performances" AS per
ON p.id = per.player_id AND
per.year = s.year
WHERE s.year = 2001 AND	per.H > 0
ORDER BY "dollars per hit" ASC,
		        p.first_name ASC,
				p.last_name  ASC
LIMIT 10;
