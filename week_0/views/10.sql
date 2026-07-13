SELECT "englisht_title", "contrast"
FROM "views"
WHERE "artist" IS 'Hokusai'
ORDER BY "entropy" DESC
LIMIT 10;
