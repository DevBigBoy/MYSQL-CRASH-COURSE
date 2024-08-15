

CREATE TABLE `users` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `first_name` varchar(100) NOT NULL,
    `last_name` varchar(100) NOT NULL,
    `username` varchar(70) NOT NULL,
    `password` varchar(255) NOT NULL,
    `email` varchar(255) DEFAULT NULL,
    `geneder` enum('male', 'female') DEFAULT NULL,
    `birthday` date DEFAULT NULL,
    `status` enum('active', 'inactive') DEFAULT 'active',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `categories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL UNIQUE,
    `parent_id` bigint unsigned NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- I can give it more than one tabe like => drop table categories, users, ....
DROP TABLE categories; -- Error if not exists
DROP TABLE if exists categories; -- waring if not exists



CREATE TABLE `categories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL UNIQUE,
    `parent_id` bigint unsigned NULL,
    CONSTRAINT categories_parent_id_fk FOREIGN KEY (parent_id) REFERENCES categories(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Insert a top-level category
INSERT INTO `categories` (`name`, `parent_id`) VALUES ('Electronics', NULL);

-- Insert a subcategory under Electronics
INSERT INTO `categories` (`name`, `parent_id`) VALUES ('Mobile Phones', 1);

-- Insert a child category under Mobile Phones
INSERT INTO `categories` (`name`, `parent_id`) VALUES ('Smartphones', 2);

-- Insert another top-level category
INSERT INTO `categories` (`name`, `parent_id`) VALUES ('Furniture', NULL);

-- Insert a subcategory under Furniture
INSERT INTO `categories` (`name`, `parent_id`) VALUES ('Chairs', 4);



CREATE TABLE `categories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL UNIQUE,
    `parent_id` bigint unsigned NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (`parent_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE
);

/*
    Electronics (id = 1)
        Mobile Phones (id = 2, parent_id = 1)
            Smartphones (id = 3, parent_id = 2)
    Furniture (id = 4)
        Chairs (id = 5, parent_id = 4)
*/

CREATE TABLE products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    `description` text Null,
    `price` float unsigned NOT NULL,
    `quantity` int unsigned DEFAULT 0,
    `category_id` bigint unsigned NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT products_category_id_fk FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 


CREATE TABLE products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    `description` text Null,
    `price` float unsigned NOT NULL,
    `quantity` int unsigned DEFAULT '0',
    `category_id` bigint unsigned NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT products_category_id_fk FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci; 

/*
     ON DELETE CASCADE
    ON DELETE RESTRICT
    ON DELETE SET NULL
*/