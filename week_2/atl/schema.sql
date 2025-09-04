CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_number" TEXT,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_number") REFERENCES "flights"("flight_number"),
    PRIMARY KEY("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT CHECK("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "flight_number" TEXT,
    "airline_id" INTEGER,
    "airport_from" TEXT,
    "airport_to" TEXT,
    "departure_datetime" NUMERIC,
    "arrival_datetime" NUMERIC,
    PRIMARY KEY ("flight_number"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id")
);

