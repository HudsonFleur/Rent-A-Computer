-- Hudson Fleurimond
-- CS 205-01
-- Fall 2019

-- create.sql Version 2

-- Purpose: Script to create all Rent-A-Computer Schema objects

-- Based on: Physical Schema, Version 3

-- Change Summary: Changed filename to create.sql
		 -- changed customer_tbl to customer
                 -- changed staff_tbl to staff

-- The results of this script will be spooled to
-- 'spoolCreate.txt'

\o 'spoolCreate.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 


\qecho Creating Customer Table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS customer
(
	CID INTEGER NOT NULL PRIMARY KEY,
	CName VARCHAR(50) NOT NULL CHECK(TRIM(CName) <> ''),
	CStreet VARCHAR(50) NOT NULL CHECK(TRIM(CStreet) <> ''),
	CCity VARCHAR(50) NOT NULL CHECK(TRIM(CCity) <> ''), 
	CState CHAR(2) NOT NULL CHECK(TRIM(CState) <> ''), 
	CZip VARCHAR(10) NOT NULL CHECK(TRIM(CZip) <> ''),
	isBusinessCustomer BOOLEAN NOT NULL
);

\qecho ' '
\qecho ' '

\qecho Creating Staff Table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS staff
(
	EID INTEGER NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL CHECK(TRIM(NAME) <> ''),
	StartDate DATE,
	EndDate DATE CHECK (EndDate >= StartDate)
);

\qecho ' '
\qecho ' '

\qecho Creating Product Table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS Product_tbl
(
	PID INTEGER NOT NULL PRIMARY KEY,
	Name VARCHAR(50) NOT NULL CHECK(TRIM(NAME) <> ''),
	QuantityOnHand INTEGER NOT NULL,
	unitPrice DECIMAL (7,2) NOT NULL CHECK (unitPrice > 0)
);

\qecho ' '
\qecho ' '

\qecho Creating Order Table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS order_tbl
(
	OrderID INTEGER NOT NULL PRIMARY KEY,
	CID INTEGER NOT NULL REFERENCES customer,
	EID INTEGER NOT NULL REFERENCES staff,
	DateOut DATE NOT NULL CHECK (DateOut <= DateReturned),
	DateReturned DATE NOT NULL CHECK(DateReturned >= DateOut)
);

\qecho ' '
\qecho ' '

\qecho Creating Involves Table
\qecho ----------------------------

CREATE TABLE IF NOT EXISTS involves_tbl
(
	PID INTEGER NOT NULL REFERENCES product_tbl,
	OrderID INTEGER NOT NULL REFERENCES order_tbl,
	PurchaseDate DATE NOT NULL DEFAULT current_Date,
	Quantity INTEGER NOT NULL DEFAULT 0 CHECK (Quantity >= 0),
	PRIMARY KEY (PID, OrderID)
);


\qecho ' '
\qecho ' '

\qecho ' '
\qecho -------------------------------------------
\qecho End of Script

-- Turn off spooling
\o