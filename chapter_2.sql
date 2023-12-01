-- ==============================
-- CREATING DATABASES AND TABLES
-- ==============================
-- you will learn how to create tables to store datain those databases.

-- Get a list of Available mysql databases;
show databases;
SHOW SCHEMAS;

-- Creating databases
create database circus;
create database finance;
create database music;

/*
 ! Your database's name should describe the type of data stored there
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
   continent_id		int,
   continent_name	varchar(20),
   population		bigint
);

-- If you want to load the continent table with data, you can run these commands:
insert into continent (continent_id, continent_name, population) values (1, 'Asia', 4641054775);
insert into continent (continent_id, continent_name, population) values (2, 'Africa', 1340598147);
insert into continent (continent_id, continent_name, population) values (3, 'Europe', 747636026);
insert into continent (continent_id, continent_name, population) values (4, 'North America', 592072212);
insert into continent (continent_id, continent_name, population) values (5, 'South America', 430759766);
insert into continent (continent_id, continent_name, population) values (6, 'Australia', 43111704);
insert into continent (continent_id, continent_name, population) values (7, 'Antarctica', 0);

-- Constraints

/*
    When you create your own database table, mysql allows you to put constraints, or rules on the data they contain.
Contraints help maintain data integrity.
ex :
    primary key
    foreign key
    not null
    unique
    cheeck
    default
*/
-- Primary Keys
create table customer
(
    customer_id     int,
    first_name	    varchar(50),
    last_name       varchar(50),
    address         varchar(100),
    primary key (customer_id)
); 

insert into customer (customer_id, first_name, last_name, address)
values
(1, 'Bob', 'Smith', '12 Dreary Lane'),
(2, 'Sally', 'Jones', '76 Boulevard Meugler'),
(3, 'Karen', 'Bellyacher', '354 Main Street');
/*
    making customer_id the primary key benefits me in three ways:
    1 - it prevent duplicate customer IDs from being inserted into the table.
    2 - prevents users from adding null value.
    those two benefits fall under the category of data intergrity
    3 - it causes mysql to create an index. an index will help speed up the performance of sql queries that select from the table
note: for performance reasons it's best to keep the PK values as short as possible

primary key that consists of more than one column which is known as a composite key
*/

-- Load data into the high_temperature table
insert into high_temperature (city, year, high_temperature)
values
('Death Valley, CA', 		2020,	130),
('International Falls, MN', 2020,	78),
('New York, NY', 			2020,	96),
('Death Valley, CA', 		2021,	128),
('International Falls, MN', 2021,	77),
('New York, NY', 			2021,	98);

-- Foreign keys

create table complaint
(
    complaint_id int,
    customer_id int,
    complaint varchar(200),
    primary key (complaint_id),
    foreign key (customer_id) references customer (customer_id)
);
-- Insert one row of data into the complaint table
insert into complaint (complaint_id, customer_id, complaint)
values (1, 3, 'I want to speak to your manager');