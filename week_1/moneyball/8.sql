SELECT s.salary
FROM "salaries" AS s
JOIN "performances" AS p
ON p.player_id = s.player_id
WHERE s.year = 2001 AND
p.HR = (
	SELECT MAX("HR")
	FROM "performances"
    WHERE "year" = 2001
);
