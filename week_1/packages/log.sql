
-- *** The Lost Letter ***
-- Find ID of the from_address
SELECT *
FROM "addresses"
WHERE "address" LIKE "900 Somerville%";

SELECT *
FROM "packages"
WHERE "from_address_id" = 432; -- package id is 384

SELECT *
FROM "scans"
WHERE "package_id" = 384; --package was dropped at address ID 854

SELECT *
FROM "addresses"
WHERE "id" = 854;


-- *** The Devious Delivery ***
SELECT *
FROM "packages"
WHERE "from_address_id" IS NULL; --product id 5098

SELECT *
FROM "scans"
WHERE "package_id" = 5098;

SELECT *
FROM "addresses"
WHERE "id" = 348;

-- *** The Forgotten Gift ***
SELECT *
FROM "addresses"
WHERE "address" like "%728%"; --address id (from): 9873 -> 4983

SELECT *
FROM "packages"
WHERE "from_address_id" = 9873
AND "to_address_id" = 4983; --product id 9523

SELECT *
FROM "scans"
WHERE "package_id" = 9523;

SELECT *
FROM "drivers"
WHERE "id" = 17; --Mikel has the package
