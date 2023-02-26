SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE 'Fish%';


SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '%bean bag%';

SELECT prod_name

FROM products
WHERE prod_name LIKE 'F%y%'; -- добавляются пробелы для заполнения до указанного размера поля

SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '__ inch teddy bear%';

SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '% inch teddy bear%';

-- Упражнения
-- 1. Напишите инструкцию SQL, которая извлекает название товара (prod_name) и его описание (prod_
-- desc) из таблицы Products, возвращая только товары со словом ' toy в описании.

SELECT prod_name, prod_desc
FROM products
WHERE prod_desc LIKE '%toy%';

-- 2. Теперь сделаем противоположное. Напишите инструкцию SQL, которая извлекает название товара
-- (prod_name) и его описание (prod_desc) из таблицы Products, возвращая только товары без слова
-- 'toy' в описании. На этот раз отсортируйте результаты по названию товара.

SELECT prod_name, prod_desc
FROM products
WHERE prod_desc NOT LIKE '%toy%'
ORDER BY prod_name;

-- 3. Напишите инструкцию SQL, которая извлекает название товара (prod_name) и его описание (prod_
-- desc) из таблицы Products, возвращая только товары со словами ’to y ' и 'c a r r o t s 1 в описании.
-- Это можно сделать несколькими способами, но в
-- данном случае используйте оператор AND и два предиката LIKE.

SELECT prod_name, prod_desc
FROM products
WHERE prod_desc LIKE '%toy%'
   AND prod_desc LIKE '%carrots%';

-- 4. Следующее упражнение посложнее. Соответствующий синтаксис не был рассмотрен в данной главе,
-- поэтому постарайтесь определить его самостоятельно.
-- Напишите инструкцию SQL, которая извлекает название товара (prod_name) и его описание (prod_desc) из таблицы Products, возвращая
-- только товары со словами 'to y ' и 'c a r r o t s ' в
-- описании, причем слова должны встречаться именно в таком порядке (слово 'to y ' должно предшествовать слову 'c a r r o ts ') .
-- Подсказка: вам понадобится один предикат LIKE с тремя символами %

SELECT prod_name, prod_desc
FROM products
WHERE prod_desc LIKE '%toy%carrots%';