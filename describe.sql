-- Hudson Fleurimond
-- CS 205-01
-- Fall 2019

-- describe.sql Version 2

-- Purpose: Script to describe all Rent-A-Computer Schema objects

-- Based on: Physical Schema, Version 3

-- Change Summary: Changed filename to describe.sql
		 -- changed customer_tbl to customer
                 -- changed staff_tbl to staff

-- The results of this script will be spooled to
-- 'spoolDescribe.txt'

\o 'spoolDescribe.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 

-- Describe Customer Table
\d customer

-- Describe Staff Table
\d staff

-- Describe Product Table
\d product_tbl

-- Describe Order Table
\d order_tbl

-- Describe Involves Table
\d involves_tbl

\qecho ' '
\qecho ------------------------------
\qecho 'End of Script'

-- Turn off Spooling
\o