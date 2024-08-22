



SELECT products.name, categories.name 
FROM `products` 
INNER JOIN categories 
WHERE products.category_id = categories.id;


