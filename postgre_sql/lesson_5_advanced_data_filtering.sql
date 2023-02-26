SELECT prod_id, prod_price, prod_name
FROM products
WHERE vend_id = 'DLL01' AND prod_price <= 4
ORDER BY prod_name;

SELECT prod_name, prod_price
FROM products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

SELECT prod_name, prod_price
FROM products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01')
AND prod_price >=10;

SELECT prod_name, prod_price
FROM products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER BY prod_name;

SELECT prod_name, prod_price
FROM products
WHERE vend_id = 'DLL01' or vend_id = 'BRS01'
ORDER BY prod_name;

SELECT prod_name
FROM products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;

SELECT prod_name
FROM products
WHERE vend_id <> 'DLL01'
ORDER BY prod_name;


-- Упражнения
-- 1. Напишите инструкцию SQL, которая извлекает
-- имя поставщика (vend_name) из таблицы Vendors,
-- возвращая только поставщиков из Калифорнии.
-- (Для этого потребуется применить фильтр как по
-- стране ['USA'], так и по штату ['СА']. Кто знает,
-- может, Калифорния существует и за пределами
-- США?). Подсказка: в предложении фильтрации
-- придется сравнивать строки.

SELECT vend_name
FROM vendors
WHERE vend_state = 'CA'
AND  vend_country = 'USA';

-- 2. Напишите инструкцию SQL для поиска всех заказов, содержащих как минимум 100 элементов
-- ' BR01', ' BR02 т или ' BR03 Инструкция должна
-- возвращать номер заказа (order_num), идентификатор товара (prod_id) и количество товара из
-- таблицы O rder Item s, фильтруя результаты как по
-- идентификатору товара, так и по количеству. Подсказка: при составлении фильтра учитывайте порядок проверки значений.


SELECT order_num, prod_id, quantity
FROM orderitems
WHERE prod_id IN ('BR01', 'BR02', 'BR03')
AND quantity >= 100;

-- 3. Вернемся к упражнению из предыдущего урока.
-- Напишите инструкцию SQL, извлекающую название товара (prod_name) и цену товара (prod_
-- p ric e ) из таблицы P roducts для всех товаров,
-- цена на которые находится в диапазоне от 3 до 6.
-- Используйте оператор AND и отсортируйте результаты по цене.

SELECT prod_name, prod_price
FROM products
WHERE prod_price >= 3 AND prod_price <= 6
ORDER BY prod_price;

-- 4. Что неправильного в следующей инструкции SQL?
-- (Постарайтесь понять это, не выполняя саму инструкцию.)
-- SELECT vend_name
-- FROM Vendors
-- ORDER BY vend_name
-- WHERE vend_country = 'USA' AND
-- vend_state = 'CA';

SELECT vend_name
FROM vendors
WHERE vend_country = 'USA'
AND vend_state = 'CA'
ORDER BY vend_name;
