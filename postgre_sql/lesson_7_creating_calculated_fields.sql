SELECT vend_name || ' (' || vend_country ||')' AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT Concat(rtrim(vend_name), ' (', rtrim(vend_country), ')') AS vend_title
FROM vendors
ORDER BY vend_name;

SELECT prod_id, quantity, item_price
FROM orderitems
WHERE order_num = 20008;

SELECT prod_id,
       quantity,
       item_price,
       quantity * orderitems.item_price AS expanded_price
FROM orderitems
WHERE order_num = 20008;

SELECT current_date AS date;


-- Упражнения
-- 1. Псевдонимы обычно применяются для переименования полей в результатах запроса. Напишите инструкцию SQL, которая извлекает поля vend_id,
-- vend_name, vend_address и v en d _ city из таблицы Vendors, переименовывая vend_name в vname,
-- v en d _ city в v c ity и vend_address в vaddress.
-- Отсортируйте результаты по имени поставщика
-- (можете использовать как оригинальное, так и переименованное поле).

SELECT vend_id,
       vend_name vname,
       vend_address vaddress,
       vend_city vcity
FROM vendors
ORDER BY vname;


-- 2. Б нашем магазине проводится распродажа, и все
-- товары подешевели на 10%. Напишите инструкцию
-- SQL, которая возвращает поля prod_id, prod_
-- p ric e и s a le _ p ric e из таблицы P roducts, где
-- s a le _ p ric e — это вычисляемое поле скидочной
-- цены. Подсказка: оригинальную цену можно умножить на 0.9 для получения скидки 10%.

SELECT prod_id,
       prod_price,
       prod_price * 0.9 AS sale_price
FROM products;