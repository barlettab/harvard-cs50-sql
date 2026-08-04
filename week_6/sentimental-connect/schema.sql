CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password_hash` VARCHAR(128) NOT NULL,
    PRIMARY KEY(`id`)
)


CREATE TABLE `schools_universities`(
    `id` INT,
    `name` VARCHAR(60) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(30) NOT NULL,
    `foundation_year` INT,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_schools` (
    `id` INT,
    `user_id` INT,
    `school_id` INT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME,
    `type_degree` ENUM('AD', 'BA', 'MA', 'PhD') NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools_universities`(`id`)
);


CREATE TABLE `companies` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `company_industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(30) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_company` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `company_id` INT,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `title` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);


CREATE TABLE `connections_users`(
    `user_id` INT,
    `friend_id` INT,
    PRIMARY KEY(`user_id`, `friend_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`friend_id`) REFERENCES `users`(`id`)
);
