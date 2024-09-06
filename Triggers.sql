DELIMITER //

CREATE TRIGGER update_total_items
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    -- Update the total_items in the orders table after a new item is inserted
    UPDATE orders
    SET total_items = total_items + NEW.quantity
    WHERE id = NEW.order_id;
END //

DELIMITER ;

-- ====================================================================================
DELIMITER //

CREATE TRIGGER update_total_price
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    -- Update the total_price in the orders table after a new item is inserted
    UPDATE orders
    SET total_price = (
        SELECT SUM(price * quantity)
        FROM order_items
        WHERE order_id = NEW.order_id
    )
    WHERE id = NEW.order_id;
END //

DELIMITER ;


-- ====================================================================================

DROP TRIGGER IF EXISTS update_total_items;


-- ====================================================================================
DELIMITER //

CREATE TRIGGER update_total_price_and_items
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    -- Update total_price in the orders table
    UPDATE orders
    SET total_price = (
        SELECT SUM(price * quantity)
        FROM order_items
        WHERE order_id = NEW.order_id
    ),
    -- Update total_items in the orders table
    total_items = (
        SELECT SUM(quantity)
        FROM order_items
        WHERE order_id = NEW.order_id
    )
    WHERE id = NEW.order_id;
END //

DELIMITER ;

-- ====================================================================================
