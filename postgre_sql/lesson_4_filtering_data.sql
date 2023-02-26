SELECT prod_name, prod_price
FROM products
WHERE prod_price != 3.49;

SELECT prod_name, prod_price
FROM products
WHERE prod_price < 10;

SELECT prod_name, prod_price
FROM products
WHERE prod_price <= 10;

SELECT vend_id, prod_name
FROM products
WHERE vend_id <> 'DLL01';

SELECT vend_id, prod_name
FROM products
WHERE vend_id != 'DLL01';

SELECT prod_name, prod_price
FROM products
WHERE prod_price BETWEEN 5 and 10;

SELECT prod_price
FROM products
WHERE prod_price IS NULL;

SELECT cust_name, cust_email
FROM Customers
WHERE cust_email IS NULL;

-- Упражнения
-- 1. Напишите инструкцию SQL, которая извлекает
-- идентификатор товара (prod_id) и название товара (prod_name) из таблицы Products, возвращая
-- только товары с ценой 9.49.

SELECT prod_id, prod_name
FROM products
WHERE prod_price = 9.49;

-- 2. Напишите инструкцию SQL, которая извлекает
-- идентификатор товара (prod_id) и название товара (prod_name) из таблицы Products, возвращая
-- только товары с ценой не ниже 9.

SELECT prod_id, prod_name
FROM products
WHERE prod_price >= 9;

-- 3. Напишите инструкцию SQL, которая извлекает из
-- таблицы OrderItem s список уникальных номеров
-- заказов (order_num), содержащих не менее 100
-- единиц какого-либо товара.

SELECT DISTINCT order_num
FROM orderitems
WHERE quantity >= 100;

-- 4. Напишите инструкцию SQL, извлекающую название товара (prod_name) и цену товара (prod_
-- price ) из таблицы Products для всех товаров,
-- цена на которые находится в диапазоне от 3 до б.
-- Результаты должны быть отсортированы по цене.
-- (Существует несколько вариантов решения, как
-- будет показано в следующей главе. Используйте те
-- возможности языка, которые изучили на данный
-- момент.)

SELECT prod_name, prod_price
FROM products
WHERE prod_price BETWEEN 3 AND 6
ORDER BY prod_price;
