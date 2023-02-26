SELECT vend_name,
       UPPER(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;

SELECT cust_name, cust_contact
FROM customers
WHERE cust_contact = 'Michael Green';

SELECT order_num
FROM orders
WHERE date_part('year', order_date) = 2020;

SELECT order_num
FROM orders
WHERE extract(year from order_date) = 2020;

SELECT order_num
FROM orders
WHERE order_date
    BETWEEN to_date('2020-01-01', 'yyyy-mm-dd')
    AND to_date('2020-12-31', 'yyyy-mm-dd');

-- Упражнения
-- 1. У нашего магазина появился сайт, и нужно создать
-- учетные записи клиентов. Имя пользователя, назначаемое по умолчанию, будет представлять собой комбинацию клиентского имени и названия города.
-- Напишите инструкцию SQL, возвращающую идентификатор клиента (cust_id), имя клиента (cust_name)
-- и поле user_login, которое должно быть записано
-- в верхнем регистре и содержать первые два символа
-- контактного имени (cust_contact) и первые три
-- символа названия города (cust_city). Например,
-- в моем случае (клиент ' Ben F o r t a ' из города 1 Oak
-- P a r k') именем пользователя будет ВЕОАК. Подсказка:
-- в этом упражнении потребуется применить несколько функций, операцию конкатенации и псевдоним.

SELECT cust_id,
       cust_name,
       UPPER(LEFT(cust_contact, 2) || LEFT(cust_city, 3)) as user_login
FROM customers;

-- 2. Напишите инструкцию SQL, которая возвращает
-- номер заказа (order_num) и дату заказа (order_
-- date) для всех заказов, сделанных в январе 2020
-- года, причем список должен быть отсортирован по
-- дате заказа. Имеющихся у вас знаний должно быть
-- достаточно, но в случае необходимости загляните в
-- документацию к своей СУБД.

SELECT order_num, order_date
FROM orders
WHERE date_part('year', order_date) = 2020
AND date_part('month', order_date) = 1
ORDER BY order_date DESC ;