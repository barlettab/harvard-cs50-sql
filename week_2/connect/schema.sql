CREATE TABLE users(
    "id" INTEGER,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "username" VARCHAR(30) NOT NULL UNIQUE,
    "password_hash" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE schools_universities(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "foundation_year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE connections_schools(
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools_universities"("id")
);


CREATE TABLE companies(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "company_industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE connections_company(
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" TEXT NOT NULL,
    "end_date" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);


CREATE TABLE connections_users(
    "user_id" INTEGER,
    "friend_id" INTEGER,
    PRIMARY KEY("user_id", "friend_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("friend_id") REFERENCES "users"("id")
);
