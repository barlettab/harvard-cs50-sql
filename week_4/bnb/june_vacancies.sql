CREATE VIEW "june_vacancies" AS
SELECT l."id",
        l."property_type",
        l."host_name",
        COUNT(a."available") AS "days_vacant"
FROM "listings" AS l
JOIN "availabilities" AS a
ON a."listing_id" = l."id"
WHERE a."date" BETWEEN '2023-06-01' AND '2023-06-30'
AND a."available" = 'TRUE'
GROUP BY l."id";
