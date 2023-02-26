SELECT prod_name
FROM products
ORDER BY prod_name;

SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price, prod_name;

SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY 2, 3;

SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price DESC, prod_name ;

-- Упражнения
-- 1. Напишите инструкцию SQL, которая извлекает
-- имена всех клиентов (cust_name) из таблицы
-- Customers и сортирует результаты по убыванию.
-- 2. Напишите инструкцию SQL, которая извлекает
-- идентификаторы клиентов (cust_id) и номера заказов (order_num) из таблицы Orders и сортирует
-- результаты сначала по идентификатору, а затем по
-- дате заказа в обратном хронологическом порядке.
-- 3. В нашем вымышленном магазине активно продаются дорогие товары. Напишите инструкцию SQL, которая извлекает информацию о количестве и цене
-- (item _price) товаров из таблицы Orderltem s,
-- сортируя результаты сначала по убыванию количества, а затем по убыванию цены.
-- 4. Что неправильного в следующей инструкции SQL?
-- (Постарайтесь понять это, не выполняя саму инструкцию).
-- SELECT vend_name,
-- FROM Vendors
-- ORDER vend_name DESC;

-- 1
SELECT cust_name
FROM Customers
ORDER BY cust_name DESC ;

-- 2
SELECT cust_id, order_num
FROM Orders
ORDER BY  cust_id, order_date DESC ;

-- 3
SELECT quantity, item_price
FROM OrderItems
ORDER BY quantity DESC , item_price DESC ;

--4
SELECT vend_name
FROM Vendors
ORDER BY vend_name DESC;