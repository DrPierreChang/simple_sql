SELECT COUNT(*) AS num_pods
FROM products
WHERE vend_id = 'DLL01';

SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id;

SELECT cust_id, COUNT(*) AS orders
FROM Orders
GROUP BY cust_id
HAVING COUNT(*) >=2;

SELECT vend_id, COUNT(*) AS num_prods
FROM products
WHERE prod_price >= 4
GROUP BY vend_id
HAVING COUNT(*) >= 2
ORDER BY num_prods;

SELECT vend_id, COUNT(*) AS num_prods
FROM products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT order_num, COUNT(*) AS items
FROM orderitems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;


-- Упражнения
-- 1. В таблице Order Items перечислены элементы
-- каждого заказа. Напишите инструкцию SQL, которая возвращает количество позиций (в виде поля
-- order_lines) для каждого номера заказа (order__
-- num), и отсортируйте результаты по полю o r d e r _
-- lines.

SELECT order_num, COUNT(*) AS order_lines
FROM orderitems
GROUP BY order_num
ORDER BY order_lines;

-- 2. Напишите инструкцию SQL, которая возвращает
-- поле cheapest_item, содержащее самый дешевый
-- товар по каждому поставщику (используйте поле
-- p r o d _ p r i c e таблицы Products), и отсортируйте
-- результаты по возрастанию цены.

SELECT vend_id, MIN(prod_price) as cheapest_item
from products
GROUP BY vend_id
ORDER BY cheapest_item;

-- 3. Нам важно знать лучших клиентов, поэтому напишите инструкцию SQL, которая возвращает номер
-- заказа (поле o r d e r _ n u m таблицы Orderltems) для
-- всех заказов, содержащих минимум 100 элементов.

SELECT order_num
FROM orderitems
GROUP BY order_num
HAVING SUM(quantity) >= 100
ORDER BY order_num;

-- 4. Для выявления лучших клиентов можно также
-- проверять, сколько денег они потратили. Напишите инструкцию SQL, которая возвращает номер
-- заказа (поле o r d e r _ n u m таблицы Orderltems) для
-- всех заказов с суммарной ценой как минимум 1000.
-- Подсказка: в данном упражнении необходимо создать вычисляемое поле (значение it e m _ p r i c e умножается на quantity) и просуммировать итог по
-- нему. Отсортируйте результаты по номеру заказа.

SELECT order_num, SUM(item_price * quantity) as total_price
FROM orderitems
GROUP BY order_num
HAVING SUM(item_price * quantity) >= 1000
ORDER BY order_num;


-- 5. Что неправильного в следующей инструкции SQL?
-- (Постарайтесь понять это, не выполняя саму инструкцию.)
SELECT order_num, COUNT(*) AS items
FROM orderitems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;

