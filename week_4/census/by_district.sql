CREATE VIEW "by_district" AS
SELECT "district",
       SUM("families") AS "families",
       SUM("households") AS "total number of households",
       SUM("population") AS "total population",
       SUM("male") AS " total number of people identifying as male",
       SUM("female") AS " total number of people identifying as female"
FROM "census"
GROUP BY "district";
