CREATE TABLE passengers(
    "id" INTEGER,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")

);

CREATE TABLE check_ins(
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")

);

CREATE TABLE airlines(
    "id" INTEGER,
    "name" VARCHAR(50) NOT NULL,
    "concourse" VARCHAR(1) NOT NULL CHECK("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY("id")
);

CREATE TABLE flights(
    "id" INTEGER,
    "airline_id" INTEGER,
    "code_departing" VARCHAR(3) NOT NULL,
    "code_heading" VARCHAR(3) NOT NULL,
    "departure" NUMERIC NOT NULL,
    "arrival" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);


