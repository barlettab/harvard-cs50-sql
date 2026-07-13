SELECT "birth_country", COUNT(*) AS "Total of players"
FROM "players"
WHERE "birth_country" NOT IN ('US',' United States')
GROUP BY "birth_country"
ORDER BY "birth_country" ASC;
