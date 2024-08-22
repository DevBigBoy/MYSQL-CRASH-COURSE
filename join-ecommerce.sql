

SELECT p.name, c.name 
from products as p
INNER JOIN categories as c
on p.category_id = c.id;


SELECT child_categories.name as child, sub_categories.name as sub, categories.name as cate
FROM child_categories
INNER JOIN sub_categories
ON child_categories.sub_category_id = sub_categories.id
INNER JOIN categories
on sub_categories.category_id = categories.id
ORDER BY sub_categories.name;