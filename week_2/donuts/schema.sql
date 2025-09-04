CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "price" REAL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "ingredient_id" INTEGER,
    "gluten_free" INTEGER,
    "price" REAL,
    PRIMARY KEY("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "donut_id" INTEGER,
    "customer_id" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "order_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id")
);

