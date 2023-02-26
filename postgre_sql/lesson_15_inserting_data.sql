INSERT INTO customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country,
                      cust_contact,
                      cust_email)
VALUES (1000000006,
        'Toy Land',
        '123 Any Street',
        'New Your',
        'NY',
        '11111',
        'USA',
        NULL,
        NULL);

-------------------------
-- Create CustNew table
-------------------------
CREATE TABLE CustNew
(
  cust_id      char(10)  NOT NULL ,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  ,
  cust_city    char(50)  ,
  cust_state   char(5)   ,
  cust_zip     char(10)  ,
  cust_country char(50)  ,
  cust_contact char(50)  ,
  cust_email   char(255)
);

---------------------------
-- Populate CustNew table
---------------------------
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000007', 'Village Toys', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'John Smith', 'sales@villagetoys.com');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('1000000008', 'Kids Place', '333 South Lake Drive', 'Columbus', 'OH', '43333', 'USA', 'Michelle Green');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000009', 'Fun4All', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'jjones@fun4all.com');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000010', 'Fun4All', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Denise L. Stephens', 'dstephens@fun4all.com');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('1000000011', 'The Toy Store', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'Kim Howard');


INSERT INTO customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country)
SELECT cust_id,
       cust_name,
       cust_address,
       cust_city,
       cust_state,
       cust_zip,
       cust_country
FROM custnew;

CREATE TABLE CustCopy AS SELECT * FROM customers;

-- Упражнения
-- 1. Добавьте самого себя в таблицу Customers с помощью инструкции INSERT. Укажите в явном виде
-- все добавляемые столбцы, но только те, для которых предоставляется значение.
-- 2. Создайте резервные копии таблиц Orders и
-- Orderltems.

SELECT * FROM customers
LIMIT 1;

INSERT INTO customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country,
                      cust_contact,
                      cust_email)
VALUES (1000000777,
        'Pierre Chang',
        'Island',
        'Station Orchid',
        'IU',
        '674480',
        'China',
        'Ben',
        'p.chang@gmail.com');


CREATE TABLE OrdersBackup AS SELECT * FROM orders;

CREATE TABLE OrdersItemsBackup AS SELECT * FROM orderitems;
