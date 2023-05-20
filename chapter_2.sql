-- ==============================
-- CREATING DATABASES AND TABLES
-- ==============================
-- you will learn how to create tables to store datain those databases.

-- Get a list of your databases
show databases;

-- Creating databases
create database circus;
create database finance;
create database music;

/*
 ! Your database's name should be describe the type of data stored there
*/

-- TO remove A database
drop database circus;
drop database finance;
drop database music;

-- create a new database called land
create database land;

-- Set your default database to land before you create the tables below
-- so they will be created in the land database
use land;

create table continent
(
    continent_id  int,
    continent_name varchar(20),
    population bigint
);

