SELECT p.first_name, p.last_name
FROM "players" AS p
WHERE p.id IN (
    SELECT per.player_id
    FROM "performances" AS per
    JOIN "salaries" AS s
		ON per.player_id = s.player_id AND s.year = per.year
    WHERE s.year = 2001 AND per.H > 0
    ORDER BY s.salary / per.H ASC, s.player_id ASC
    LIMIT 10
)
AND p.id IN (
    SELECT per.player_id
    FROM "performances" AS per
    JOIN "salaries" AS s
		ON per.player_id = s.player_id AND s.year = per.year
    WHERE s.year = 2001 AND per.RBI > 0
    ORDER BY s.salary / per.RBI ASC, s.player_id ASC
    LIMIT 10
)
ORDER BY p.id;
