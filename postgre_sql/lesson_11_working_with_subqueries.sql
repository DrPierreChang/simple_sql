SELECT order_num
FROM orderitems
where prod_id = 'RGAN01';

SELECT cust_id
FROM orders
where order_num IN (20007, 20008) ;

SELECT cust_id
FROM orders
where order_num IN (SELECT order_num
                    FROM orderitems
                    where prod_id = 'RGAN01');

SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (SELECT cust_id
                  FROM orders
                  WHERE order_num IN (SELECT order_num
                                      FROM orderitems
                                      where prod_id = 'RGAN01'));


SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = '1000000001';

SELECT cust_name,
       cust_state,
       (SELECT COUNT(*)
        FROM orders
        WHERE Orders.cust_id = Customers.cust_id)
AS orders
FROM customers
ORDER BY cust_name;


-- Упражнения
-- 1. Используйте подзапрос для получения списка
-- клиентов, которые купили товары по цене 10 или
-- выше. Найдите соответствующие номера заказов
-- (order_num) в таблице OrderItems, а затем используйте таблицу Orders,
-- чтобы найти клиентские идентификаторы (cust_id ) для этих заказов.


SELECT cust_id
FROM orders
WHERE order_num IN (SELECT order_num
                    FROM orderitems
                    WHERE item_price >= 10);


-- 2. Нам нужно узнать даты заказов товара 'BRO1'
-- Напишите инструкцию SQL, которая использует подзапрос для нахождения заказов (в таблице
-- O rder Item s), содержащих товар с идентификатором ' BR01' (prod_id),
-- а затем возвращает идентификатор клиента (cu st_ id ) и дату заказа (ord er_
-- date) из таблицы O rders. Отсортируйте результаты по дате заказа.

SELECT cust_id, order_date
FROM orders
WHERE order_num in (SELECT order_num
                    FROM orderitems
                    WHERE prod_id = 'BR01')
ORDER BY order_date;

-- 3. Давайте усложним задачу. Модифицируйте предыдущую инструкцию, чтобы она возвращала адрес
-- электронной почты клиента (поле cu st_ em ail
-- таблицы Customers) для любого клиента, купившего товар с идентификатором 'BR01'. Подсказка:
-- вам понадобятся несколько вложенных инструкций
-- SELECT, самая внутренняя из которых возвращает
-- поле order_num из таблицы O rderltem s, а средняя
-- возвращает поле c u st_ id n 3 таблицы O rders.


SELECT cust_email
FROM customers
WHERE cust_id IN
(SELECT cust_id
FROM orders
WHERE order_num in (SELECT order_num
                    FROM orderitems
                    WHERE prod_id = 'BR01')
ORDER BY order_date);

-- 4. Нам нужен список клиентских идентификаторов
-- с общей суммой заказов по каждому из них. Напишите инструкцию SQL, которая возвращает
-- идентификатор клиента (поле c u s t_ id таблицы
-- O rders) и поле to ta l_ o rd e re d , содержащее общую сумму заказов по каждому клиенту (это должен быть подзапрос). Отсортируйте результаты
-- по убыванию суммы заказов. Подсказка: ранее вы
--     уже использовали функцию SUM () для вычисления
-- итогов по заказам.


SELECT cust_id,
       (SELECT SUM(quantity * item_price)
        FROM orderitems
        WHERE orders.order_num = orderitems.order_num)
AS total_ordered
FROM orders
ORDER BY total_ordered DESC ;


-- 5. Напишите инструкцию SQL, которая возвращает
-- названия всех товаров (prodjname) из таблицы
-- Products, а также вычисляемый столбец quant_
-- sold, содержащий общее количество проданных
-- единиц по каждому товару (для этого применяется подзапрос к таблице Order Items, включающий
-- функцию SUM (q u a n tity )).

SELECT prod_name,
(SELECT SUM(quantity)
FROM orderitems
where products.prod_id = orderitems.prod_id
GROUP BY prod_id) AS quant_sold
FROM products;


select prod_id, (select sum(generate_series) res from (SELECT generate_series(1, 8)) as res)
from products;

