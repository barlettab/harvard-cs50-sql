-- *** The Lost Letter ***
SELECT "type", "address"
FROM "addresses"
WHERE "id" IN (
    SELECT "to_address_id"
    FROM "packages"
    WHERE "contents" LIKE '%Congratulatory%'
    AND "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" = '900 Somerville Avenue'
    )
);

-- *** The Devious Delivery ***
SELECT a.type, p.contents
FROM addresses AS a
JOIN scans AS s
    ON a.id = s.address_id
JOIN packages AS p
    ON p.id = s.package_id
WHERE p.from_address_id IS NULL
  AND s.action = 'Drop';

-- *** The Forgotten Gift ***
SELECT p.contents, a.address, d.name, s.timestamp
FROM "packages" AS p
JOIN "addresses" AS a
ON p.to_address_id = a.id
JOIN "scans" AS s
ON p.id = s.package_id
JOIN "drivers" AS d
ON d.id = s.driver_id AND
p.from_address_id = (
    SELECT "id"
    FROM "addresses"
    WHERE "address" = '109 Tileston Street'
)
ORDER BY s.timestamp;
