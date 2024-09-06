
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,       -- Unique user ID
    name VARCHAR(100) NOT NULL,              -- User's name
    email VARCHAR(150) NOT NULL UNIQUE,      -- User's email, unique for each user
    password VARCHAR(255) NOT NULL,          -- User's password (hashed)
    phone VARCHAR(15) NOT NULL UNIQUE,                       -- User's phone number
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Account creation time
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Last updated timestamp
);


CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,       -- Unique product ID
    name VARCHAR(255) NOT NULL,              -- Product name
    description TEXT,                        -- Product description
    price DECIMAL(10, 2) NOT NULL,           -- Product price
    stock INT NOT NULL,                      -- Number of items available in stock
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Time product was added
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Last updated timestamp
);

CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,       -- Unique order ID
    user_id BIGINT NOT NULL,                    -- Foreign key to the users table
    total_price DECIMAL(10, 2) NOT NULL,     -- Total price for the order
    order_status ENUM('pending', 'shipped', 'delivered', 'canceled') DEFAULT 'pending', -- Order status
    payment_method VARCHAR(50),              -- Payment method (e.g., 'credit card', 'paypal')
    shipping_address TEXT,                   -- Shipping address
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Order placement time
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Last updated timestamp

    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE -- When a user is deleted, delete all their orders
);

CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,       -- Unique ID for each order item
    order_id BIGINT NOT NULL,                   -- Foreign key linking to the orders table
    product_id BIGINT NOT NULL,                 -- Foreign key linking to the products table
    quantity INT DEFAULT 1,                  -- Quantity of the product
    price DECIMAL(10, 2) NOT NULL,           -- Price of one unit of the product
    total DECIMAL(10, 2) NOT NULL,           -- Total price for this item (price * quantity)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- When the item was added
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- When the item was last updated

    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE, -- Links to orders
    FOREIGN KEY (product_id) REFERENCES products(id) -- Links to products
);


ALTER TABLE products
ADD COLUMN total_items INT NOT NULL DEFAULT 0;


ALTER TABLE products
DROP COLUMN total_items;


ALTER TABLE orders
ADD COLUMN total_items INT NOT NULL DEFAULT 0;

ALTER TABLE orders
MODIFY COLUMN total_price DECIMAL(10, 2) DEFAULT 0;
