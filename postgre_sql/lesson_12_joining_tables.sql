SELECT vend_name, prod_name, prod_price
FROM vendors, products
WHERE vendors.vend_id = products.vend_id;

SELECT vend_name, prod_name, prod_price
FROM vendors v INNER JOIN products p
ON v.vend_id = p.vend_id;

SELECT prod_name,vend_name, prod_price, quantity
FROM orderitems, products, vendors
WHERE products.vend_id = vendors.vend_id
    AND orderitems.prod_id = products.prod_id
    AND order_num = 20007;

SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN
    (SELECT cust_id
     FROM orders
     WHERE order_num IN (SELECT order_num
                         FROM orderitems
                         WHERE prod_id = 'RGAN01'));


SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
    AND orders.order_num = orderitems.order_num
    AND  orderitems.prod_id = 'RGAN01';


-- Упражнения
-- 1. Напишите инструкцию SQL, которая возвращает
-- имя клиента (cust_name) из таблицы Customers и
-- соответствующие ему номера заказов (order_num)
-- из таблицы Orders, сортируя результаты сначала
-- по имени клиента, а затем по номеру заказа.
-- Предложите два варианта запроса: один — с использованием простого синтаксиса соединений по равенству,
-- а второй — с использованием оператора
-- INNER JOIN.

-- соединение по равенству
SELECT cust_name, order_num
FROM customers, orders
WHERE customers.cust_id = orders.cust_id
ORDER BY cust_name, order_num;


-- синтаксис ANSI
SELECT cust_name, order_num
FROM customers INNER JOIN orders
ON customers.cust_id = orders.cust_id
ORDER BY  cust_name, order_num;


-- 2. Давайте доработаем предыдущее упражнение. В
-- дополнение к имени клиента и номеру заказа добавьте третий столбец, O rderTotal, содержащий
-- общую стоимость каждого заказа. Это можно сделать двумя способами: путем создания подзапроса
-- к таблице O rderltem s или путем соединения таблицы Order Items с существующими таблицами
-- с последующим применением итоговой функции.
-- Подсказка: следите за тем, где должны использоваться полные имена столбцов.

-- решение с использованием соединений
SELECT cust_name,
       orders.order_num,
       SUM(item_price * quantity) AS OrderTotal
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id AND orders.order_num = orderitems.order_num
GROUP BY cust_name, orders.order_num
ORDER BY cust_name, order_num;

-- 3. Вернемся к упражнению 2 из урока 11. Напишите
-- инструкцию SQL, возвращающую даты заказов товара ' BR01',
-- но на этот раз с использованием простого синтаксиса соединений по равенству.
-- Результат должен получиться таким же, как и на уроке 11.

-- SELECT cust_id, order_date
-- FROM orders
-- WHERE order_num in (SELECT order_num
--                     FROM orderitems
--                     WHERE prod_id = 'BR01')
-- ORDER BY order_date;


SELECT cust_id, order_date
FROM orders, orderitems
WHERE orders.order_num = orderitems.order_num AND orderitems.prod_id = 'BR01'
ORDER BY order_date;

-- 4. Продолжим в том же духе. Перепишите запрос из
-- упражнения 3 урока 11, на этот раз с использованием синтаксиса ANSI (оператор INNER JOIN).
-- Предыдущая инструкция содержала два вложенных запроса. Теперь вам понадобятся два оператора INNER JOIN, с которыми вы познакомились
-- на данном уроке. И не забудьте выполнить фильтрацию по полю prod_id с помощью предложения
-- WHERE.

-- SELECT cust_email
-- FROM customers
-- WHERE cust_id IN
-- (SELECT cust_id
-- FROM orders
-- WHERE order_num in (SELECT order_num
--                     FROM orderitems
--                     WHERE prod_id = 'BR01')
-- ORDER BY order_date);


SELECT cust_email
FROM customers
INNER JOIN orders
    ON customers.cust_id = orders.cust_id
INNER JOIN orderitems
    ON orders.order_num = orderitems.order_num
WHERE prod_id = 'BR01';




-- 5. На этот раз ради интереса попробуем применить
-- соединения, итоговые функции и группирование
-- данных. На уроке 10 вы написали запрос для нахождения всех номеров заказов, стоимость которых составляла не менее 1000. Хотелось бы также
-- узнать имена клиентов, сделавших такие заказы.
-- Напишите инструкцию SQL, использующую соединения для получения имени клиента (cust_name)
-- из таблицы Customers и общей стоимости всех
-- его заказов из таблицы Order Items. Подсказка:
-- в соединение придется также включить таблицу
-- Orders, поскольку таблица Customers не связана
-- напрямую с таблицей Order Items; вместо этого
-- она связана с таблицей Orders, которая, в свою очередь, связана с таблицей Order Items. Не забудьте
-- применить предложения GROUP BY и HAVING, а
-- также отсортировать результаты по имени клиента. Можно использовать как простой синтаксис
-- соединений по равенству, так и синтаксис ANSI с
-- оператором INNER JOIN. А еще лучше, напишите
-- оба варианта.

-- SELECT order_num, SUM(item_price * quantity) as total_price
-- FROM orderitems
-- GROUP BY order_num
-- HAVING SUM(item_price * quantity) >= 1000
-- ORDER BY order_num;


SELECT cust_name, SUM(item_price * quantity) as total_price
FROM customers, orderitems, orders
WHERE customers.cust_id = orders.cust_id AND orders.order_num = orderitems.order_num
GROUP BY cust_name
HAVING SUM(item_price * quantity) >= 1000
ORDER BY cust_name;

SELECT cust_name, SUM(item_price * quantity) as total_price
FROM customers INNER JOIN orders
    ON customers.cust_id = orders.cust_id
INNER JOIN orderitems
    ON orders.order_num = orderitems.order_num
GROUP BY cust_name
HAVING SUM(item_price * quantity) >= 1000
ORDER BY cust_name;
