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

ALTER TABLE products
ADD `expire_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP; 

INSERT INTO products (name, description, price, quantity, category_id, created_at, updated_at) VALUES
('Product 1', 'Description for product 1', 100.50, 10, 1, NOW(), NOW()),
('Product 2', 'Description for product 2', 150.75, 5, 2, NOW(), NOW()),
('Product 3', 'Description for product 3', 75.00, 20, 3, NOW(), NOW()),
('Product 4', 'Description for product 4', 250.99, 8, 4, NOW(), NOW()),
('Product 5', 'Description for product 5', 300.40, 15, 5, NOW(), NOW());

Alter table products
    add column status enum('active', 'draft','archived') Default 'active' AFTER quantity;

ALTER TABLE categories DROP INDEX `name`;

ALTER TABLE categories
        ADD CONSTRAINT `categories_super_id_fk` FOREIGN KEY (`super_id`) REFERENCES `categories`(`id`) on DELETE SET NUll;
ALTER TABLE categories
        ADD CONSTRAINT `categories_super_id_fk` FOREIGN KEY (`super_id`) REFERENCES `categories`(`id`) on DELETE SET Null;

ALTER TABLE categories
	DROP CONSTRAINT `categories_super_id_fk`;



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

INSERT INTO products (`name`,`category_id`,`price`,`quantity`) VALUES
('samsung tv',12,1000,2),
('LG tv',12,1000,2);

INSERT INTO products (`name`,`category_id`,`price`,`quantity`) VALUES
('DELL laptop',14,1000,2),
('HP Laptop',14,1000,2);



INSERT INTO categories VALUES
(null, 'computers',9,'inactive'),
(null, 'clothes',9,'inactive'),
(null, 'tvs',9,'inactive'),
(null, 'mobile phones',9,'inactive'),
(null, 'laptops',9,'inactive'),
(null, 'hard drives',9,'inactive');


delete from categories where id=9;


DELETE from categories
WHERE super_id is null
LIMIT 1;

select row_count();

UPDATE categories
SET name = 'women'
WHERE id=7
LIMIT 1;

UPDATE products
SET price = 500000

UPDATE products SET
status = 'archived'
WHERE datediff(expire_date, now()) <=30