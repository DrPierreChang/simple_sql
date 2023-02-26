SELECT RTRIM(vend_name) || ' (' ||
       RTRIM(vend_country) || ')' AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT cust_name, cust_contact
FROM customers AS c, orders AS o, orderitems AS oi
WHERE c.cust_id = o.cust_id
    AND oi.order_num = o.order_num
    AND prod_id = 'RGAN01';


SELECT cust_id, cust_name, cust_contact
FROM customers
WHERE cust_name = (SELECT cust_name
                   FROM customers
                   WHERE cust_contact = 'Jim Jones');

SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM customers c1, customers c2
WHERE c1.cust_name = c2.cust_name
AND c2.cust_contact = 'Jim Jones';

SELECT c.*, o.order_num, o.order_date,
       oi.prod_id, oi.quantity, oi.item_price
FROM customers c, orders o, orderitems oi
WHERE c.cust_id = o.cust_id
    AND oi.order_num = o.order_num
    AND prod_id = 'RGAN01';


SELECT c.cust_id, o.order_num
FROM customers c
INNER JOIN orders o
ON c.cust_id = o.cust_id;

SELECT c.cust_id, o.order_num
FROM customers c
LEFT OUTER JOIN orders o
ON c.cust_id = o.cust_id;

SELECT c.cust_id, o.order_num
FROM customers c
RIGHT OUTER JOIN orders o
ON c.cust_id = o.cust_id;


SELECT c.cust_id, o.order_num
FROM customers c
FULL OUTER JOIN orders o
ON c.cust_id = o.cust_id;

SELECT c.cust_id,
       COUNT(o.order_num) num_ord
FROM customers c
INNER JOIN orders o
    ON c.cust_id = o.cust_id
GROUP BY c.cust_id;

SELECT c.cust_id,
       count(o.order_num) num_ord
FROM customers c
LEFT OUTER JOIN orders o
ON c.cust_id = o.cust_id
GROUP BY c.cust_id;


-- Упражнения
-- 1. Напишите инструкцию SQL, которая возвращает
-- имя клиента (поле cust_name таблицы Customers)
-- и номера всех его заказов (поле order_num таблицы Orders) с использованием оператора INNER
-- JOIN.

SELECT c.cust_name, o.order_num
FROM customers c
INNER JOIN orders o
ON c.cust_id = o.cust_id
ORDER BY c.cust_name;


-- 2. Модифицируйте предыдущую инструкцию SQL
-- для получения списка всех клиентов, даже тех, кто
-- еще не сделал ни одного заказа.

SELECT c.cust_name, o.order_num
FROM customers c
LEFT OUTER JOIN orders o
ON c.cust_id = o.cust_id
ORDER BY c.cust_name;

-- 3. Используйте оператор OUTER JOIN для соединения таблиц Products и Orderltem s,
-- чтобы получить отсортированный список названий товаров
-- (prod_name) и соответствующих им номеров заказов (order_num).

SELECT p.prod_name, oi.order_num
FROM products p
LEFT OUTER JOIN orderitems oi
ON p.prod_id = oi.prod_id
ORDER BY p.prod_name, oi.order_num;


-- 4. Модифицируйте предыдущую инструкцию SQL,
-- чтобы получить общее количество заказов по каждому товару (а не номера заказов).

SELECT p.prod_name, COUNT(oi.order_num) as total_order
FROM products p
LEFT OUTER JOIN orderitems oi
ON p.prod_id = oi.prod_id
GROUP BY p.prod_name
ORDER BY p.prod_name;

-- 5. Напишите инструкцию SQL, которая возвращает список поставщиков (поле vend_id таблицы
-- Vendors) и количество предлагаемых ими товаров,
-- включая поставщиков, у которых нет товаров. Для
-- подсчета количества товаров в таблице Products
-- понадобится использовать оператор OUTER JOIN и
-- итоговую функцию COUNT (). Будьте внимательны:
-- столбец vend_id имеется в нескольких таблицах,
-- поэтому при ссылке на него придется указывать
-- полное имя.

SELECT v.vend_id, COUNT(p.prod_id) as prod_total
FROM vendors v
LEFT OUTER JOIN products p
ON v.vend_id = p.vend_id
GROUP BY v.vend_id
ORDER BY v.vend_id;