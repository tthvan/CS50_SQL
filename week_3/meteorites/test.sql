CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    "nametype" TEXT,
    PRIMARY KEY(id)
);

.import --csv --skip 1 meteorites.csv meteorites_temp

UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';

UPDATE "meteorites_temp" SET "mass" = ROUND("mass",2) WHERE "mass" IS NOT NULL;
UPDATE "meteorites_temp" SET "lat" = ROUND("lat",2) WHERE "lat" IS NOT NULL;
UPDATE "meteorites_temp" SET "long" = ROUND("long",2) WHERE "long" IS NOT NULL;

DELETE FROM "meteorites_temp" WHERE "nametype" = "Relict";

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL,
    PRIMARY KEY(id)
);

INSERT INTO "meteorites" ("id", "name", "class", "mass", "discovery", "year", "lat", "long")
SELECT
    ROW_NUMBER() OVER (ORDER BY "year" ASC, "name" ASC),
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
FROM meteorites_temp;

DROP TABLE "meteorites_temp";

