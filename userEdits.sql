-- Hudson Fleurimond
-- CS 205-01
-- Fall 2019

-- insertTable.sql Version 2

-- Purpose: Script to insert all Rent-A-Computer Schema objects

-- Based on: Physical Schema, Version 3

-- Change Summary: Removed DELETE FROM quires
 		 -- changed customer_tbl to customer
                 -- changed staff_tbl to staff

-- The results of this script will be spooled to
-- 'spooluserEdits.txt'

\o 'spooluserEdits.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


------------- Inserting Into Tables --------------

\qecho Inserting Into the Customer Table
\qecho ----------------------------

INSERT INTO customer
VALUES (4, 'Dylan Marshall', '34 Skyview Ave', 'Jacksonville', 'AZ', 34865, 'YES');


INSERT INTO customer
VALUES (5, 'John Hester', '45 Maple Ave', 'Elign', 'IL', 60120, 'NO');


INSERT INTO customer 
VALUES (6, 'Harry Church', '90 Camden Pl', 'Hopewell Junction', 'NY', 12533, 'YES');


INSERT INTO customer
VALUES (7, 'Jeffery Fegley', '3809 Geraldine Ln', 'New York', 'NY', 10013, 'YES');

\qecho ' '
\qecho ' '


\qecho Inserting Into the Staff Table
\qecho ----------------------------

INSERT INTO staff
VALUES (1, 'Stephanie PerryMan', '2000-11-28', '2017-03-04' );

INSERT INTO staff
VALUES (2, 'Shawn Goodman', '2016-11-28', '2017-11-27' );

INSERT INTO staff 
VALUES (3, 'Wilfred Guynn', '2010-05-04', '2015-07-03' );

INSERT INTO staff 
VALUES (5, 'Peter Walker', '2012-09-21', '2018-12-01' );


\qecho ' '
\qecho ' '

\qecho Inserting Into the Product Table
\qecho ----------------------------

INSERT INTO product_tbl
VALUES (2, 'AMD XFX RX580 8GB GPU', 8, 416.51);

INSERT INTO product_tbl
VALUES (3, 'Intel Core i9', 20, 572.74);

INSERT INTO product_tbl
VALUES (4, 'GIGABYTE X570 Gaming X AMD RYZEN 3000', 20, 272.74);

INSERT INTO product_tbl
VALUES (5, 'Nvidia GTX 1080 Founders Edition', 0, 724.23);

\qecho ' '
\qecho ' '

\qecho Inserting Into the Order Table
\qecho ----------------------------

INSERT INTO order_tbl
VALUES (1234, 5, 3, '2019-10-06', '2020-06-17');

INSERT INTO order_tbl
VALUES (2645, 5, 3, '2018-12-04', '2019-03-07');

INSERT INTO order_tbl
VALUES (3236, 7, 5, '2010-09-12', '2011-01-07');

\qecho ' '
\qecho ' '

\qecho Inserting Into the Involves Table
\qecho ----------------------------

INSERT INTO involves_tbl
VALUES (2, 2645,'2018-12-04', 3 );


INSERT INTO involves_tbl
VALUES (3, 1234,'2019-10-06', 12 );

\qecho ' '
\qecho ' '





---------------------- User Edits -----------------------


-- Customer is no longer a business Customer
UPDATE customer
SET isBusinessCustomer = 'f'
WHERE CID = 4;

-- Staff Member got fired
DELETE FROM staff
WHERE EID = 2;


-- Staff Member got married and changed their last name
UPDATE staff
SET name = 'Stephaine Walker'
WHERE EID = 1;


-- Product gets delete because there is no more in stock
DELETE FROM product_tbl
WHERE PID = 5;

-- Product gets price changed
UPDATE product_tbl
SET unitPrice = 320.50
WHERE PID = 4;

-- The order return date need to be changed
UPDATE order_tbl
SET DateReturned = '2019-04-07'
WHERE ORDERID = 2645;

-- The quantity needs to be changed
UPDATE involves_tbl
SET Quantity = 10
WHERE ORDERID = 1234;

\qecho -------------------------------------------
\qecho End of Script

-- Turn off spooling
\o

