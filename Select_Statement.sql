-- SELECT Statment


-- SELECT is used to retrieve rows selected from one or more tables and can include union statements and subqueries

SELECT * FROM products;

SELECT `id`, `name` FROM products;

SELECT CURRENT_TIMESTAMP;

SELECT * FROM `products`
WHERE `price` < 100;

SELECT * FROM `products` 
WHERE `price` > 100 and `price` <= 150;

SELECT * FROM `products` 
WHERE `price` between 100 and 150;


SELECT * from products
order by price DESC
limit 1 ;

SELECT * from products
order by price 
limit 1 ;

SELECT * from products
order by price , name


select * from products
order by rand()

SELECT * FROM products ORDER by expire_at ASC;
