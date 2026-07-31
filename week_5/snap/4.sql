SELECT u."username"
FROM "users" AS u
JOIN "messages" AS m
ON u."id" = m."to_user_id"
GROUP BY u."id"
ORDER BY COUNT(m."to_user_id") DESC
LIMIT 1;
