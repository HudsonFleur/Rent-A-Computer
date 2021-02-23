-- Hudson Fleurimond
-- CS 205-01
-- Fall 2019

-- reportsEtc.sql Version 1

-- Purpose: Script to Report all the data of Rent-A-Computer Schema objects

-- Based on:

-- Change Summary: changed customer_tbl to customer


-- The results of this script will be spooled to
-- 'spoolreportsEtc.txt'

\o 'spoolreportsEtc.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


\qecho -- List Names of all business customers
SELECT ID, Name, Street, City, State, ZipCode 
FROM 
(SELECT cid ID, cname AS Name, cstreet Street, 
	ccity City, cstate State, czip ZipCode, 
	isbusinesscustomer 
	FROM customer WHERE isbusinesscustomer = 't')
AS customer_tbl_t;



\qecho -- List most popular to least popular items
SELECT Name, Count(involves_tbl_t) AS Frequency 
	FROM (SELECT PID ID, Name FROM product_tbl) AS product_tbl_t 
	JOIN (SELECT pid FROM involves_tbl) AS involves_tbl_t 
ON product_tbl_t.id = involves_tbl_t.pid 
Group By Name 
ORDER BY Frequency DESC;


\qecho -- Generate Bill
SELECT DISTINCT ID, Name, SUM(Price*quantity) As totalPrice 
FROM (SELECT CID ID, cname AS NAME FROM customer) AS customer_tbl_t 
JOIN (SELECT ORDERID, CID  FROM order_tbl) AS order_tbl_t 
ON ID = CID
JOIN (SELECT unitPrice Price, pid FROM product_tbl) AS product_tbl_t ON OrderID = orderID
JOIN (SELECT quantity, pid FROM involves_tbl) AS involves_tbl_t
ON product_tbl_t.pid = involves_tbl_t.pid
GROUP BY ID, Name;

\o