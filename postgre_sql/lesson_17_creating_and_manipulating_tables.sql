SELECT CURRENT_DATE;

ALTER TABLE vendors
ADD vend_phone CHAR(20);

ALTER TABLE vendors
DROP COLUMN vend_phone;

DROP TABLE custcopy;

-- Упражнения
-- 1. Добавьте столбец для адресов сайтов (vend_web) в
-- таблицу Vendors. Текстовое поле должно быть достаточно большим, чтобы вместить URL-адрес.

ALTER TABLE vendors
ADD COLUMN vend_web VARCHAR(1000);

-- 2. Используйте инструкцию UPDATE для обновления
-- таблицы Vendors, добавив в нее адрес какого-нибудь сайта (можете использовать любой адрес).

UPDATE vendors
SET vend_web = 'www.example.com'
WHERE vend_id = 'FNG01';