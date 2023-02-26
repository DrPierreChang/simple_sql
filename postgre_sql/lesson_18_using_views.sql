SELECT cust_name, cust_contact
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
    AND orderitems.order_num = orders.order_num
    AND prod_id = 'RGAN01';


CREATE VIEW ProductCustomers AS
SELECT cust_name, cust_contact, prod_id
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
    AND orderitems.order_num = orders.order_num;

SELECT cust_name, cust_contact FROM productcustomers
WHERE prod_id = 'RGAN01';

SELECT RTRIM(vend_name) || ' (' ||
       RTRIM(vend_country) || ')'
       AS vend_title
FROM vendors
ORDER BY vend_name;


CREATE VIEW VendorLocation AS
SELECT RTRIM(vend_name) || ' (' ||
       RTRIM(vend_country) || ')'
       AS vend_title
FROM vendors;

SELECT * from VendorLocation
ORDER BY vend_title;

CREATE VIEW CustomerEmailList AS
SELECT cust_id, cust_name, cust_email
FROM customers
WHERE cust_email IS NOT NULL;

SELECT * FROM CustomerEmailList;

SELECT prod_id,
       quantity,
       item_price,
       quantity * item_price AS expanded_price
FROM orderitems
WHERE order_num = 20008;


CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
       prod_id,
       quantity,
       item_price,
       quantity * item_price AS expanded_price
FROM orderitems;

DROP VIEW OrderItemsExpanded;


SELECT * FROM orderitemsexpanded
WHERE order_num = 20008;


-- Упражнения
-- 1. Создайте представление CustomersWithOrders,
-- включающее все столбцы из таблицы Customers,
-- но содержащее записи только тех клиентов, которые разместили заказы.
-- Подсказка: выполните соединение с таблицей Orders для фильтрации клиентов,
-- после чего используйте инструкцию SELECT
-- для отбора нужных данных.

CREATE VIEW CustomersWithOrders AS
    SELECT customers.*
    FROM customers, orders
    WHERE customers.cust_id = orders.cust_id;


CREATE VIEW CustomersWithOrders_2 AS
SELECT Customers.cust_id,
Customers.cust_name,
Customers.cust_address,
Customers.cust_city,
Customers.cust_state,
Customers.cust_zip,
Customers.cust_country,
Customers.cust_contact,
Customers.cust_email
FROM Customers
JOIN Orders ON Customers.cust_id = Orders.cust_id ;

SELECT * FROM CustomersWithOrders;
SELECT * FROM CustomersWithOrders_2;


-- 2. Что неправильного в следующей инструкции SQL?
-- (Постарайтесь понять это, не выполняя саму инструкцию.)
CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
       prod_id,
       quantity,
       item_price,
       quantity*item_price AS expanded_price
FROM OrderItems;
