CREATE TABLE ingredients(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" NUMERIC NOT NULL CHECK("price_per_unit" > 0),
    "quantity" NUMERIC NOT NULL CHECK("quantity" > 0),
    "unit" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donuts(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten" TEXT NOT NULL CHECK("gluten" IN ('free', 'not free')),
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE donuts_ingredients(
    "ingredients_id" INTEGER,
    "donuts_id" INTEGER,
    PRIMARY KEY("ingredients_id", "donuts_id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("donuts_id") REFERENCES "donuts"("id")
);


CREATE TABLE orders(
    "id" INTEGER,
    "id_customer" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("id_customer") REFERENCES "customers"("id")
);

CREATE TABLE order_items(
    "order_id" INTEGER,
    "donuts_id" INTEGER,
    "quantity" INTEGER,
    PRIMARY KEY("order_id", "donuts_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donuts_id") REFERENCES "donuts"("id")
);

CREATE TABLE customers(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY("id")
);
