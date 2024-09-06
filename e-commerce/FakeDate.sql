
INSERT INTO users (name, email, password, phone, address, created_at, updated_at)
VALUES
('John Doe', 'johndoe@example.com', '$2y$10$TKh8H1.PvXQ0o8kG8bpA6Od5l5Ej5x6AeqYJOq/60woXzM1axEmFq', '555-1234', NOW(), NOW()), -- Fake hashed password
('Jane Smith', 'janesmith@example.com', '$2y$10$k4NIXE64.UhF7z3OoKQgIuM/zoefRApTr5J6t/UqZ8OYvC8HJ.VSO', '555-5678', NOW(), NOW()),
('Bob Johnson', 'bobjohnson@example.com', '$2y$10$TKh8H1.PvXQ0o8kG8bpA6Od5l5Ej5x6AeqYJOq/60woXzM1axEmFq', '555-8765',  NOW(), NOW()),
('Alice Brown', 'alicebrown@example.com', '$2y$10$k4NIXE64.UhF7z3OoKQgIuM/zoefRApTr5J6t/UqZ8OYvC8HJ.VSO', '555-4321', NOW(), NOW()),
('Charlie Davis', 'charliedavis@example.com', '$2y$10$TKh8H1.PvXQ0o8kG8bpA6Od5l5Ej5x6AeqYJOq/60woXzM1axEmFq', '555-6789',  NOW(), NOW());


INSERT INTO products (name, description, price, stock, created_at, updated_at)
VALUES 
('Wireless Mouse', 'Ergonomic wireless mouse with adjustable DPI and USB receiver.', 19.99, 150, NOW(), NOW()),
('Bluetooth Headphones', 'Over-ear Bluetooth headphones with noise cancellation and 30-hour battery life.', 89.99, 80, NOW(), NOW()),
('Mechanical Keyboard', 'RGB mechanical keyboard with blue switches and programmable keys.', 59.99, 120, NOW(), NOW()),
('Smartphone Stand', 'Adjustable smartphone stand, compatible with all models and brands.', 12.99, 300, NOW(), NOW()),
('USB-C Charger', 'Fast USB-C wall charger, compatible with all USB-C devices.', 24.99, 200, NOW(), NOW()),
('Laptop Sleeve', 'Water-resistant laptop sleeve for 13-inch to 15-inch laptops.', 29.99, 90, NOW(), NOW()),
('Wireless Earbuds', 'True wireless earbuds with charging case and touch controls.', 39.99, 160, NOW(), NOW()),
('Portable Power Bank', '10,000mAh portable power bank with dual USB output.', 34.99, 100, NOW(), NOW()),
('Smartwatch', 'Fitness-focused smartwatch with heart rate monitor and GPS.', 129.99, 60, NOW(), NOW()),
('4K Monitor', '27-inch 4K UHD monitor with adjustable stand and eye care technology.', 299.99, 40, NOW(), NOW());


INSERT INTO orders (user_id, total_price, order_status, payment_method, shipping_address, order_date, updated_at)
VALUES
(1, 59.98, 'pending', 'credit card', '123 Main St, Cityville', NOW(), NOW()),  -- User 1 orders 2 products
(2, 129.99, 'shipped', 'paypal', '456 Elm St, Townville', NOW(), NOW()),       -- User 2 orders a smartwatch
(3, 19.99, 'delivered', 'credit card', '789 Oak St, Villageville', NOW(), NOW()), -- User 3 orders a mouse
(1, 89.99, 'pending', 'credit card', '123 Main St, Cityville', NOW(), NOW()),  -- User 1 orders headphones
(4, 34.99, 'shipped', 'paypal', '101 Pine St, Metrocity', NOW(), NOW());       -- User 4 orders a power bank


-- Order 1 (User 1) ordered 2 products
INSERT INTO order_items (order_id, product_id, quantity, price, total, created_at, updated_at)
VALUES
(1, 1, 2, 19.99, 39.98, NOW(), NOW()),  -- 2 Wireless Mice
(1, 4, 1, 12.99, 12.99, NOW(), NOW());  -- 1 Smartphone Stand

-- Order 2 (User 2) ordered 1 product
INSERT INTO order_items (order_id, product_id, quantity, price, total, created_at, updated_at)
VALUES
(2, 9, 1, 129.99, 129.99, NOW(), NOW());  -- 1 Smartwatch

-- Order 3 (User 3) ordered 1 product
INSERT INTO order_items (order_id, product_id, quantity, price, total, created_at, updated_at)
VALUES
(3, 1, 1, 19.99, 19.99, NOW(), NOW());  -- 1 Wireless Mouse

-- Order 4 (User 1) ordered 1 product
INSERT INTO order_items (order_id, product_id, quantity, price, total, created_at, updated_at)
VALUES
(4, 2, 1, 89.99, 89.99, NOW(), NOW());  -- 1 Bluetooth Headphones

-- Order 5 (User 4) ordered 1 product
INSERT INTO order_items (order_id, product_id, quantity, price, total, created_at, updated_at)
VALUES
(5, 8, 1, 34.99, 34.99, NOW(), NOW());  -- 1 Portable Power Bank
