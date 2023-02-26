SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name;

SELECT  cust_name, cust_contact, cust_email
FROM customers
WHERE cust_state IN ('IL', 'IN', 'MI')
    OR cust_name = 'Fun4All';

SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;



-- Упражнения
-- 1. Напишите инструкцию SQL, которая объединяет две инструкции SELECT,
-- возвращающие идентификатор товара (prod_id) и его количество
-- (quantity) из таблицы Orderltem s, причем одна
-- инструкция должна отбирать строки, в которых
-- количество равно 100, а вторая должна отбирать
-- товары, идентификатор которых начинается с префикса 'BNBG'. Отсортируйте результаты по идентификатору товара.

SELECT prod_id, quantity
FROM orderitems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM orderitems
WHERE prod_id LIKE 'BNBG%'
ORDER BY prod_id;


-- 2. Перепишите предыдущую инструкцию SQL, чтобы в ней использовалось только одно предложение
-- SELECT.

SELECT prod_id, quantity
FROM orderitems
WHERE quantity = 100 OR prod_id LIKE 'BNBG%'
ORDER BY prod_id;

-- 3. Это упражнение может показаться немного бессмысленным,
-- но оно хорошо иллюстрирует принципы объединения таблиц с разными столбцами.
-- Напишите инструкцию SQL, которая возвращает названия товаров (prod_name) из таблицы
-- Products, а также имена клиентов (cust_name) из
-- таблицы Customers. Отсортируйте результаты по
-- названию товара.

SELECT prod_name
FROM products
UNION
SELECT cust_name
FROM customers
ORDER BY prod_name;

-- 4. Что неправильного в следующей инструкции SQL?
-- (Постарайтесь понять это, не выполняя саму инструкцию.)
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'MI'
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'IL'
ORDER BY cust_name;