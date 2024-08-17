/*
    Data Definition Statements (DDL)
        CREATE TABLE `humen`;
        ALTER TABLE users;
        DROP TABLE users;
        TRUNCATE TABLE;
*/

/*
 changes the structure of a table
 You can add or delete columns, create or destroy indexes, change he type of existing columns or rename columns or table itself
*/

ALTER TABLE users
ADD `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

ALTER TABLE `categories`
MODIFY COLUMN `name` varchar(500) NOT NULL,
ADD COLUMN `status` ENUM('active','draft') DEFAULT 'active' AFTER `name`,
RENAME COLUMN `parent_id` to `super_id`;
    
ALTER TABLE categories
DROP COLUMN `status`,
DROP CONSTRAINT `categories_parent_id_fk`,
ADD CONSTRAINT `categories_super_id_fk` FOREIGN KEY (`super_id`) REFERENCES `categories`(`id`);

ALTER Table products
    drop primary key;

Alter Table products
    add primary key(id);

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

Alter table products
    add column status enum('active', 'draft','archived') Default 'active' AFTER quantity;

ALTER TABLE categories DROP INDEX `name`;

TRUNCATE TABLE products; -- DDL drop and recreate auto_increment 
delete table products; -- DML auto_increment continues by the last value

/*
    Data Manipulation Statements (DML)
    INSERT
    UPDATE
    DELETE
    SELETE

*/

INSERT INTO categories(`name`) VALUES('mens');

INSERT INTO categories(`name`, `status`) VALUES('boys', 'inactive');

INSERT INTO categories VALUES
(null, 'computers',9,'inactive'),
(null, 'clothes',9,'inactive'),
(null, 'tvs',9,'inactive'),
(null, 'mobile phones',9,'inactive'),
(null, 'laptops',9,'inactive'),
(null, 'hard drives',9,'inactive');