-- Hudson Fleurimond
-- CS 205-01
-- Fall 2019

-- allData.sql Version 2

-- Purpose: Script to read all Rent-A-Computer Schema objects

-- Based on: Physical Schema, Version 3

-- Change Summary: changed customer_tbl to customer
                 -- changed staff_tbl to staff

-- The results of this script will be spooled to
-- 'spoolAllData.txt'

\o 'spoolAllData.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 

--Read Customer Table
\qecho Customer Table 
\qecho -------------------------------------
\qecho ' '

SELECT CID, CName, CStreet, CCity, CState, CZip, isBusinessCustomer
From customer
ORDER BY CID;

\qecho ' '

--Read Staff Table
\qecho Staff Table 
\qecho -------------------------------------
\qecho ' '

SELECT EID, Name, StartDate, EndDate
From staff
ORDER BY EID;

\qecho ' '

--Read Product Table
\qecho Product Table 
\qecho -------------------------------------
\qecho ' '

SELECT PID, Name, QuantityOnHand, unitPrice
From product_tbl
ORDER BY PID;

\qecho ' '

--Read Order Table
\qecho Order Table 
\qecho -------------------------------------
\qecho ' '

SELECT OrderID, CID, EID, DateOut, DateReturned
From order_tbl
ORDER BY OrderID;

\qecho ' '

--Read Involves Table
\qecho Involves Table 
\qecho -------------------------------------
\qecho ' '

SELECT PID, OrderID, PurchaseDate, Quantity
From involves_tbl;

\qecho ' '
\qecho -------------------------------------
\qecho End of Script

--Turn off Spooling
\o

