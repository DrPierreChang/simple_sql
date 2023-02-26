SELECT prod_name
FROM Products;

SELECT prod_id, prod_name, prod_price
FROM Products;

SELECT * FROM Products;

SELECT DISTINCT vend_id
FROM Products;


SELECT DISTINCT vend_id, prod_price
FROM Products;

SELECT vend_id, prod_price FROM Products;

SELECT prod_name
FROM products
LIMIT 5;

SELECT prod_name
FROM products
LIMIT 5 OFFSET 5;

-- Упражнения
-- 1. Напишите инструкцию SQL для извлечения идентификаторов всех клиентов (cust_id) из таблицы
-- Customers.
-- 2. В таблице OrderItems хранится список всех заказанных товаров, причем некоторые товары были
-- заказаны неоднократно. Напишите инструкцию
-- SQL, которая возвращает перечень заказанных товаров (prod_id). Подсказка: вы должны получить
-- семь уникальных строк.
-- 3. Напишите инструкцию SQL, которая извлекает
-- все столбцы из таблицы Customers, и альтернативную инструкцию select , которая извлекает только
-- идентификаторы клиентов. Используйте комментарии, чтобы выполнять только одну из инструкций (но протестируйте обе).

SELECT cust_id
FROM customers;

SELECT DISTINCT prod_id
FROM orderitems;

/*SELECT *
FROM customers;*/
SELECT cust_id
FROM customers;