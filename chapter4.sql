-- 
-- MySQL Crash Course
-- 
-- Chapter 4 – MySQL Data Types	
--
-- You will Explore how to choose tha best data types for your columns and the pros and cons of each type.

create database mysqldatatype;

create table solar_eclipse (
    eclipse_date date,
    time_of_greatest_eclipse time,
    eclipse_type varchar(10), -- to set the maximum number of characters to 10
    magnitude decimal(4,3)
);

-- How To Copy Table
create table new_solar_eclipse like solar_eclipse;
-- With Data
create table new_solar_eclipse As SELECT * From solar_eclipse;

/*
String Data Types(
    char(n):
        - fixed-length strings, 
        - strings that hold an exact number of characters
        - MySQL will allow you to insert a string with fewer than three characters, such as JP ; 
        - it simply adds a space to the end of JP and saves the value in the column.
    varchar:


    
)
*/