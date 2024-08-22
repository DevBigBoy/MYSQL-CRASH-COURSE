
-- users Table Structure

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL UNIQUE,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Fake data into the users table

INSERT INTO `users` (`name`, `email`, `password`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
('John Doe', 'john.doe@example.com', '$2y$10$D9G5ZkC.9B1WLRuP45Yq.eWxN8ja5/TgrE8.HM5ICOCBwHkFYCI6O', '2024-08-01 10:00:00', 'xYz987qwerTyuioPlkMn', '2024-08-01 10:00:00', '2024-08-01 10:00:00'),
('Jane Smith', 'jane.smith@example.com', '$2y$10$mnAbKLHJKjhJHGrH7kN/YzD1eQ/WqIjeQ0BmUuoBOPn9iHdK/EUOe', '2024-08-02 11:00:00', 'AbCdEfGhIjKlMnOpQrSt', '2024-08-02 11:00:00', '2024-08-02 11:00:00'),
('Robert Brown', 'robert.brown@example.com', '$2y$10$pQWEPO9KN7G91zGZpHF/WuI9eF/0A3yRbbn7nFjBqGLMxKTGh/FUi', '2024-08-03 12:00:00', 'UvWxYzABC123DEFghiJK', '2024-08-03 12:00:00', '2024-08-03 12:00:00'),
('Emily Davis', 'emily.davis@example.com', '$2y$10$9shAKh6jZUIIhtdfD/JbFecK/H5/PGVXKKVfLwrL0nOq0BV0mNbwe', '2024-08-04 13:00:00', 'pQrSTUvwXyzABcDEfgHI', '2024-08-04 13:00:00', '2024-08-04 13:00:00'),
('Michael Johnson', 'michael.johnson@example.com', '$2y$10$HlOmEjOFwEeSLHQ3d9eOeuLJhlKhWtfTVW1ZyM9HF9FGAbPjA3HsO', NULL, NULL, '2024-08-05 14:00:00', '2024-08-05 14:00:00'),
('Sarah Lee', 'sarah.lee@example.com', '$2y$10$fRqBKpLI9HQQwEYm5pNdsTQHnvFW9JSHFw2RdktUYht2jds5LkwGq', '2024-08-06 15:00:00', 'zYXWvutSRQPonmLKJIHG', '2024-08-06 15:00:00', '2024-08-06 15:00:00'),
('David Wilson', 'david.wilson@example.com', '$2y$10$HjAk9GRZjxJMmWEqwF/lK3DzW9Zgk6rwNdUq4lKlNGb0sVN1yMvhA', NULL, NULL, '2024-08-07 16:00:00', '2024-08-07 16:00:00'),
('Laura Martinez', 'laura.martinez@example.com', '$2y$10$ZKTQ3HEt7kkl5kRk2JqBaOa/jHXwLKfjsHly34sDD2UiMFLsTuLx.', '2024-08-08 17:00:00', 'jKlMnOpQRsTuVwXyZAbC', '2024-08-08 17:00:00', '2024-08-08 17:00:00'),
('James Taylor', 'james.taylor@example.com', '$2y$10$Qg7UHTnDlIwg6kOIj9KjCezmLZ5DBkYZM2B9O9GZQXBmKYYZLNAE6', '2024-08-09 18:00:00', 'DEfGhIjkLmNoPqRsTUVw', '2024-08-09 18:00:00', '2024-08-09 18:00:00'),
('Patricia Anderson', 'patricia.anderson@example.com', '$2y$10$TNOicXFp6hMZoJHQzI5QX.GE5whn8NCI5Mjpoftgh1EIbHwd1SZGy', NULL, NULL, '2024-08-10 19:00:00', '2024-08-10 19:00:00');


CREATE TABLE `user_addresses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idx_user_id` (`user_id`),
  CONSTRAINT `fk_user_addresses_user`
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `user_addresses` (`user_id`, `address_line_1`, `address_line_2`, `city`, `state`, `postal_code`, `country`, `created_at`, `updated_at`) VALUES
(1, '123 Elm Street', 'Apt 4B', 'Springfield', 'IL', '62701', 'USA', '2024-08-01 10:00:00', '2024-08-01 10:00:00'),
(1, '456 Oak Avenue', NULL, 'Springfield', 'IL', '62702', 'USA', '2024-08-01 11:00:00', '2024-08-01 11:00:00'),
(2, '789 Maple Road', 'Suite 202', 'Metropolis', 'NY', '10001', 'USA', '2024-08-02 12:00:00', '2024-08-02 12:00:00'),
(3, '101 Pine Lane', NULL, 'Gotham', 'NJ', '07001', 'USA', '2024-08-03 13:00:00', '2024-08-03 13:00:00'),
(4, '202 Birch Street', 'Unit 3A', 'Smallville', 'KS', '66002', 'USA', '2024-08-04 14:00:00', '2024-08-04 14:00:00'),
(5, '303 Cedar Boulevard', NULL, 'Star City', 'CA', '90210', 'USA', '2024-08-05 15:00:00', '2024-08-05 15:00:00');


CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idx_parent_id` (`parent_id`),
  FOREIGN KEY (`parent_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert root categories (Level 1)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Electronics', NULL, '2024-08-01 09:00:00', '2024-08-01 09:00:00'),
('Furniture', NULL, '2024-08-01 09:15:00', '2024-08-01 09:15:00');

-- Insert subcategories under 'Electronics' (Level 2)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Computers', 1, '2024-08-01 09:30:00', '2024-08-01 09:30:00'),
('Mobile Phones', 1, '2024-08-01 09:45:00', '2024-08-01 09:45:00');

-- Insert subcategories under 'Furniture' (Level 2)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Living Room', 2, '2024-08-01 10:00:00', '2024-08-01 10:00:00'),
('Office Furniture', 2, '2024-08-01 10:15:00', '2024-08-01 10:15:00');

-- Insert subcategories under 'Computers' (Level 3)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Laptops', 3, '2024-08-01 10:30:00', '2024-08-01 10:30:00'),
('Desktops', 3, '2024-08-01 10:45:00', '2024-08-01 10:45:00');

-- Insert subcategories under 'Mobile Phones' (Level 3)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Smartphones', 4, '2024-08-01 11:00:00', '2024-08-01 11:00:00'),
('Feature Phones', 4, '2024-08-01 11:15:00', '2024-08-01 11:15:00');

-- Insert subcategories under 'Living Room' (Level 3)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Sofas', 5, '2024-08-01 11:30:00', '2024-08-01 11:30:00'),
('Coffee Tables', 5, '2024-08-01 11:45:00', '2024-08-01 11:45:00');

-- Insert subcategories under 'Office Furniture' (Level 3)
INSERT INTO `categories` (`name`, `parent_id`, `created_at`, `updated_at`) VALUES
('Desks', 6, '2024-08-01 12:00:00', '2024-08-01 12:00:00'),
('Office Chairs', 6, '2024-08-01 12:15:00', '2024-08-01 12:15:00');


CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  `quantity` int UNSIGNED DEFAULT '0',
  `category_id` bigint UNSIGNED NOT NULL,
  `status` enum('active', 'draft') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expire_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `idx_category_id` (`category_id`),
  INDEX `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `products`
MODIFY `category_id` bigint UNSIGNED NULL;

ALTER TABLE `products`
ADD CONSTRAINT `fk_products_category`
FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
ON DELETE SET NULL;

INSERT INTO `products` (`name`, `description`, `price`, `quantity`, `category_id`, `status`, `created_at`, `updated_at`, `expire_at`) VALUES
('Laptop', 'A powerful laptop with 16GB RAM and 512GB SSD.', 999.99, 50, 2, 'active', '2024-08-03 10:00:00', '2024-08-03 10:00:00', '2025-08-03 10:00:00'),
('Smartphone', 'A latest-generation smartphone with excellent camera.', 699.99, 100, 3, 'active', '2024-08-03 11:00:00', '2024-08-03 11:00:00', '2025-08-03 11:00:00'),
('Blender', 'A high-speed blender for smoothies and more.', 49.99, 200, 5, 'active', '2024-08-03 12:00:00', '2024-08-03 12:00:00', '2025-08-03 12:00:00'),
('Refrigerator', 'A large refrigerator with a freezer compartment.', 499.99, 30, 4, 'active', '2024-08-03 13:00:00', '2024-08-03 13:00:00', '2025-08-03 13:00:00'),
('Office Chair', 'An ergonomic office chair with lumbar support.', 199.99, 150, 6, 'active', '2024-08-03 14:00:00', '2024-08-03 14:00:00', '2025-08-03 14:00:00'),
('Microwave Oven', 'A compact microwave oven with multiple settings.', 79.99, 80, 5, 'draft', '2024-08-03 15:00:00', '2024-08-03 15:00:00', '2025-08-03 15:00:00'),
('Tablet', 'A lightweight tablet with a 10-inch display.', 299.99, 120, 2, 'active', '2024-08-03 16:00:00', '2024-08-03 16:00:00', '2025-08-03 16:00:00'),
('Headphones', 'Noise-canceling headphones with high-quality sound.', 149.99, 70, 1, 'active', '2024-08-03 17:00:00', '2024-08-03 17:00:00', '2025-08-03 17:00:00'),
('Sofa', 'A comfortable 3-seater sofa.', 399.99, 25, 6, 'draft', '2024-08-03 18:00:00', '2024-08-03 18:00:00', '2025-08-03 18:00:00'),
('Coffee Maker', 'An automatic coffee maker with a built-in grinder.', 99.99, 90, 5, 'active', '2024-08-03 19:00:00', '2024-08-03 19:00:00', '2025-08-03 19:00:00');


CREATE TABLE product_images (
    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` bigint UNSIGNED NOT NULL, 
    `image_url` VARCHAR(255) NOT NULL,
    `is_main` BOOLEAN DEFAULT FALSE,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_images` (`product_id`, `image_url`, `is_main`, `created_at`) VALUES
(1, 'https://example.com/images/laptop1.jpg', TRUE, '2024-08-01 10:00:00'),
(1, 'https://example.com/images/laptop2.jpg', FALSE, '2024-08-01 10:05:00'),
(2, 'https://example.com/images/smartphone1.jpg', TRUE, '2024-08-02 11:00:00'),
(2, 'https://example.com/images/smartphone2.jpg', FALSE, '2024-08-02 11:05:00'),
(3, 'https://example.com/images/blender1.jpg', TRUE, '2024-08-03 12:00:00'),
(3, 'https://example.com/images/blender2.jpg', FALSE, '2024-08-03 12:05:00'),
(4, 'https://example.com/images/refrigerator1.jpg', TRUE, '2024-08-04 13:00:00'),
(4, 'https://example.com/images/refrigerator2.jpg', FALSE, '2024-08-04 13:05:00'),
(5, 'https://example.com/images/office_chair1.jpg', TRUE, '2024-08-05 14:00:00'),
(5, 'https://example.com/images/office_chair2.jpg', FALSE, '2024-08-05 14:05:00');

 -- colors
 -- sizes
CREATE TABLE variants (
    `id` bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `variants` (`name`, `created_at`, `updated_at`) VALUES
('Color', '2024-08-01 10:00:00', '2024-08-01 10:00:00'),
('Size', '2024-08-01 10:15:00', '2024-08-01 10:15:00'),
('Material', '2024-08-01 10:30:00', '2024-08-01 10:30:00'),
('Style', '2024-08-01 10:45:00', '2024-08-01 10:45:00'),
('Pattern', '2024-08-01 11:00:00', '2024-08-01 11:00:00');


 -- red green blue 
 -- s xs m l xl xxl
CREATE TABLE variant_items (
    `id` bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `variant_id` bigint UNSIGNED ,
    `name` VARCHAR(255) NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP, 
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `fk_variant_items` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Insert data for 'Color' variant
INSERT INTO `variant_items` (`variant_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Red', '2024-08-01 12:00:00', '2024-08-01 12:00:00'),
(1, 'Blue', '2024-08-01 12:15:00', '2024-08-01 12:15:00'),
(1, 'Green', '2024-08-01 12:30:00', '2024-08-01 12:30:00');

-- Insert data for 'Size' variant
INSERT INTO `variant_items` (`variant_id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Small', '2024-08-01 13:00:00', '2024-08-01 13:00:00'),
(2, 'Medium', '2024-08-01 13:15:00', '2024-08-01 13:15:00'),
(2, 'Large', '2024-08-01 13:30:00', '2024-08-01 13:30:00');

-- Insert data for 'Material' variant
INSERT INTO `variant_items` (`variant_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Cotton', '2024-08-01 14:00:00', '2024-08-01 14:00:00'),
(3, 'Polyester', '2024-08-01 14:15:00', '2024-08-01 14:15:00'),
(3, 'Wool', '2024-08-01 14:30:00', '2024-08-01 14:30:00');

-- Insert data for 'Style' variant
INSERT INTO `variant_items` (`variant_id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Casual', '2024-08-01 15:00:00', '2024-08-01 15:00:00'),
(4, 'Formal', '2024-08-01 15:15:00', '2024-08-01 15:15:00'),
(4, 'Sporty', '2024-08-01 15:30:00', '2024-08-01 15:30:00');

-- Insert data for 'Pattern' variant
INSERT INTO `variant_items` (`variant_id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Solid', '2024-08-01 16:00:00', '2024-08-01 16:00:00'),
(5, 'Striped', '2024-08-01 16:15:00', '2024-08-01 16:15:00'),
(5, 'Plaid', '2024-08-01 16:30:00', '2024-08-01 16:30:00');


CREATE TABLE product_variants (
    `id` bigint UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `product_id` bigint UNSIGNED NOT NULL,
    `variant_id` bigint UNSIGNED NOT NULL,
    `variant_item_id` bigint UNSIGNED NOT NULL,
    `stock` INT DEFAULT 0,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP, 
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`variant_id`) REFERENCES `variants`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`variant_item_id`) REFERENCES `variant_items`(`id`) ON DELETE CASCADE
);

-- Insert data for products with various variants and variant items
INSERT INTO `product_variants` (`product_id`, `variant_id`, `variant_item_id`, `stock`, `created_at`, `updated_at`) VALUES
-- For Product 1 (e.g., Laptop)
(1, 1, 1, 50, '2024-08-01 10:00:00', '2024-08-01 10:00:00'), -- Color: Red
(1, 1, 2, 30, '2024-08-01 10:05:00', '2024-08-01 10:05:00'), -- Color: Blue
(1, 2, 1, 20, '2024-08-01 10:10:00', '2024-08-01 10:10:00'), -- Size: Small
(1, 2, 2, 15, '2024-08-01 10:15:00', '2024-08-01 10:15:00'), -- Size: Medium

-- For Product 2 (e.g., Smartphone)
(2, 1, 3, 40, '2024-08-02 11:00:00', '2024-08-02 11:00:00'), -- Color: Green
(2, 3, 1, 25, '2024-08-02 11:05:00', '2024-08-02 11:05:00'), -- Material: Cotton
(2, 4, 1, 10, '2024-08-02 11:10:00', '2024-08-02 11:10:00'), -- Style: Casual

-- For Product 3 (e.g., Blender)
(3, 2, 3, 60, '2024-08-03 12:00:00', '2024-08-03 12:00:00'), -- Size: Large
(3, 5, 1, 70, '2024-08-03 12:05:00', '2024-08-03 12:05:00'), -- Pattern: Solid

-- For Product 4 (e.g., Refrigerator)
(4, 3, 2, 45, '2024-08-04 13:00:00', '2024-08-04 13:00:00'), -- Material: Polyester
(4, 4, 2, 35, '2024-08-04 13:05:00', '2024-08-04 13:05:00'), -- Style: Formal

-- For Product 5 (e.g., Office Chair)
(5, 1, 1, 55, '2024-08-05 14:00:00', '2024-08-05 14:00:00'), -- Color: Red
(5, 2, 3, 25, '2024-08-05 14:05:00', '2024-08-05 14:05:00'); -- Size: Medium
