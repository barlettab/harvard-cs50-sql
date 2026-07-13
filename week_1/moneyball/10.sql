SELECT p.first_name,
        p.last_name,
        s.salary,
        per.HR,
        s.year
FROM "players" AS p
JOIN "salaries" AS s
ON p.id = s.player_id
JOIN "performances" as per
ON p.id = per.player_id
    AND per.year = s.year
ORDER BY p.id ASC,
    per.year DESC,
    per.HR DESC,
    s.salary DESC;
