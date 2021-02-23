-- Hudson Fleurimond
-- CS 205-01
-- Fall 2019

-- drop.sql Version 2

-- Purpose: Script to drop all Rent-A-Computer Schema objects

-- Based on: Physical Schema, Version 3

-- Change Summary:

-- The results of this script will be spooled to
-- 'spoolDrop.txt'

\o 'spoolDrop.txt'

-- Output script execution data
\qecho -n 'Script run on '
\qecho -n `date /t`
\qecho -n 'at '
\qecho `time /t`
\qecho -n 'Script run by ' :USER ' on server ' :HOST ' with db ' :DBNAME
\qecho ' '
\qecho 

\qecho Dropping Order Table
\qecho ---------------------------------

DROP TABLE IF EXISTS order_tbl CASCADE;

\qecho ' '

\qecho Dropping Involves Table
\qecho ---------------------------------

DROP TABLE IF EXISTS involves_tbl CASCADE;

\qecho ' '
\qecho ---------------------------------

\qecho Dropping Customer Table
\qecho ---------------------------------

DROP TABLE IF EXISTS customer CASCADE;

\qecho ' '

\qecho Dropping Staff Table
\qecho ---------------------------------

DROP TABLE IF EXISTS staff CASCADE;

\qecho ' '

\qecho Dropping Product Table
\qecho ---------------------------------

DROP TABLE IF EXISTS product_tbl CASCADE;

\qecho ' '

\qecho End of Script

-- Turn off Spooling
\o
