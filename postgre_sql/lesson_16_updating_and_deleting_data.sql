UPDATE customers
SET cust_email = 'kim@thetoystore.com'
WHERE cust_id = '1000000005';

UPDATE customers
SET cust_contact = 'Sam Roberts',
    cust_email = 'sam@toyland.com'
WHERE cust_id = '1000000006';

UPDATE customers
SET cust_email = NULL
WHERE cust_id = '1000000005';

DELETE
FROM customers
WHERE cust_id = '1000000006';

-- Упражнения
-- 1. Аббревиатуры штатов США должны записываться прописными буквами. Напишите инструкцию
-- SQL, которая обновляет все адреса, относящиеся
-- к США, чтобы как штат поставщика (поле v e n d _
-- state таблицы Vendors), так и штат клиента (поле
-- cust_s t a t e таблицы Customers) были записаны
-- в верхнем регистре.

UPDATE vendors
SET vend_state = UPPER(vend_state)
WHERE vend_country = 'USA';

UPDATE customers
SET cust_state = UPPER(cust_state)
WHERE cust_country = 'USA';

-- 2. В упражнении 1 на предыдущем уроке вы добавили
-- самого себя в таблицу Customers. Теперь удалите
-- свою запись. Не забудьте использовать предложение W H E R E (предварительно протестировав его с
-- помощью инструкции SELECT, прежде чем выполнять инструкцию DELETE), иначе вы рискуете удалить всех клиентов!

DELETE
FROM customers
WHERE cust_id = '1000000777';
