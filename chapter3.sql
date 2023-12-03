-- 
-- MySQL Crash Course
-- 
-- Chapter 3 – Introduction to SQL								
-- 

/*
    To select data from a MySQL database, you’ll use Structured Query Language (SQL). 
    SQL is the standard language for querying and managing data in an RDBMS like MySQL.
*/

-- Data Definition Language (DDL) statements
-- Data Manipulation Language (DML) statements

-- 
-- Querying Data from a Table
-- 

-- The land database and the continent table were created in the last chapter's script: chapter_2.sql
use land;


-- Selecting 3 columns from the continent table
select continent_id,
       continent_name,
       population
from   continent;

-- Selecting 3 columns from the continent table for Asia
select continent_id,
       continent_name,
       population
from   continent
where  continent_name = 'Asia';


-- Where clause filters the results.

-- Selecting just the population column from the continent table for Asia
select population
from   continent
where  continent_name   = 'Asia';

--
-- Using the Wildcard Character
--
select *
from   continent;

--
-- Ordering Rows
--
select continent_id,
       continent_name,
       population
from   continent
order by continent_name;

-- Ordering rows by population in descending order
select continent_id,
       continent_name,
       population
from   continent
order by population desc;