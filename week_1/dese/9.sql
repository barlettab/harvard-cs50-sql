SELECT d.name
FROM "districts" AS d
JOIN "expenditures" AS e
ON e.district_id = d.id
ORDER BY e.pupils ASC
LIMIT 1;
