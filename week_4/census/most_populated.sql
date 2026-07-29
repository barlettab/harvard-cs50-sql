CREATE VIEW "most_populated" AS
SELECT "district",
        SUM("families") AS "total number of families",
        SUM("households") AS "total number of households",
        SUM("population") AS "total population",
        SUM("male") AS "number of people identifying as male",
        SUM("female") AS "number of people identifying as female"
FROM "census"
GROUP BY "district"
ORDER BY "total population" DESC;
