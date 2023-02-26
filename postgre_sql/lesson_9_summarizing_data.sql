SELECT AVG(prod_price) AS avg_price
FROM products;

SELECT AVG(prod_price) AS avg_price
FROM products
WHERE vend_id = 'DLL01';

SELECT COUNT(*) AS num_cust
FROM customers;

SELECT COUNT(cust_email) AS num_cust
FROM customers;

SELECT MAX(prod_price) AS max_price
FROM products;

SELECT MIN(prod_price) AS min_price
FROM products;

SELECT SUM(quantity) AS item_ordered
FROM orderitems
WHERE order_num = 20005;

SELECT SUM(item_price * orderitems.quantity) AS total_price
FROM orderitems
WHERE order_num = 20005;

SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products
WHERE vend_id = 'DLL01';

SELECT COUNT(*) AS num_items,
       MIN(prod_price) AS min_price,
       MAX(prod_price) AS max_price,
       ROUND(AVG(prod_price), 2) AS avg_price
FROM products;


-- Упражнения
-- 1. Напишите инструкцию SQL, которая возвращает
-- общее количество заказанных товаров (используйте столбец q u a n tity таблицы Orderltems).

SELECT SUM(quantity) AS items_ordered
FROM orderitems;

-- 2. Модифицируйте предыдущую инструкцию, чтобы
-- она возвращала общее количество заказов товара
-- ’ BR01 1 (столбец prod_id).

SELECT SUM(quantity) AS items_ordered
FROM orderitems
WHERE prod_id = 'BR01';

-- 3. Напишите инструкцию SQL, возвращающую стоимость (prod_price) самого дорогого товара в таблице Products,
-- цена на который не превышает
-- 10. Назовите вычисляемое поле max_price.

SELECT MAX(prod_price) as max_price, round
FROM products
WHERE prod_price <= 10;
