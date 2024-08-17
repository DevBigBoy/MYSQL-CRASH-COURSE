-- 
-- MySQL Crash Course
-- 
-- Chapter 4 – MySQL Data Types	
--
-- You will Explore how to choose tha best data types for your columns and the pros and cons of each type.

create database mysqldatatype;

create table solar_eclipse
(
	eclipse_date				date,
	time_of_greatest_eclipse	time,
	eclipse_type				varchar(10),
	magnitude					numeric(4,3)
);

	
insert into solar_eclipse (
	eclipse_date, 
	time_of_greatest_eclipse,
    eclipse_type,
	magnitude
	)
values 
	('2022-04-30', '20:42:36', 'Partial', 0.640),
	('2022-10-25', '11:01:20', 'Partial', 0.862),
	('2023-04-20', '04:17:56', 'Hybrid', 1.013);


insert into animal 
	(
    animal_name,
    animal_desc,
    animal_picture
    )
    values
    (
    'T-Rex',
    'T-Rex lived in western North America on what was then an island continent known as Laramidia 68 to 66 million years ago.',
    'C:\Users\location\T-Rex.jpg' -- This assumes you have a T-Rex image at this location
    );
	
insert into animal 
	(
    animal_name,
    animal_desc,
    animal_picture
    )
    values
    (
	'Lemur',
    'Lemurs are wet-nosed primates from the Lemuroidea family. They are native to the island of Madagascar.',
    'C:\Users\location\lemur.jpg' -- This assumes you have a lemur image at this location
    );

create table animal 
	(
    animal_name	    varchar(20),
    animal_desc     tinytext,
    animal_picture  mediumblob
    );	
	
insert into animal 
	(
    animal_name,
    animal_desc,
    animal_picture
    )
    values
    (
	'Blue Dragon',
    'The Blue Dragon or Glaucus Atlanticus floats upside down and uses its blue side to blend into the water. It looks like a small dragon.',
    'C:\Users\location\blue_dragon.jpg' -- This assumes you have a Blue Dragon image at this location
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


/*
=============
    enum
=============
- short for enumeration,
- lets you create a list of values that you want to allow in a `string` column
- If you try to add a value to column other than the ones in the list of premitted values, it will be rejected
- MySQL stores ENUM values as integers representing the index position of the value in the list of allowed values
- if you insert a value that is not in the list, MySQL will either insert NULL (if the column is nullable) 
    or insert a special empty string ('') if NOT NULL is specified and strict SQL mode is not enabled.
*/

create table student
	(
	student_id     int,
	student_class  enum('Freshman','Sophomore','Junior','Senior')
	);

/*
=============
    Set
=============
- set allows you to select multiple values.
- lets you create a list of values that you want to allow in a `string` column
- If you try to add a value to column other than the ones in the list of premitted values, it will be rejected
*/


/*

----------------------------------------------------------------------------------------------------------------
| Feature    |     		     ENUM                         |           SET                                      |
----------------------------------------------------------------------------------------------------------------
| Allowed    | Single value from a list	                  | One or more values from a list                     |
| Values     |	                                          |                                                    |  
----------------------------------------------------------------------------------------------------------------
| Storage    |	Stores as integer index	                  | Stores as a combination of bit flags               |                                 
----------------------------------------------------------------------------------------------------------------
| Use        |	Use when a field should                   | Use when a field can have multiple values          |
|   Case     |   have one value from a list               | from a list                                        |
----------------------------------------------------------------------------------------------------------------
| Default    | Default to NULL or empty string if invalid |	 Ignores invalid values and stores only valid ones |
| Behavior   |	value is inserted (non-strict mode)       |                                                    |
----------------------------------------------------------|-----------------------------------------------------
| Storage    | More efficient for a single choice among   |  More efficient when multiple options need to      |
| Efficiency |	many options                              |      be stored together                            |
----------------------------------------------------------------------------------------------------------------

 */
create table interpreter
    (
    interpreter_id     int,
    language_spoken    set('English','German','French','Spanish')
    );

/*
================================================
    tinytext, text, mediumtext, and longtext
================================================
- Mysql Includes four text data types that store variable-length
	         		            
------------------------------------------------------------------------------------------------------------------------
| Data Type   |  Maximum Length            |           Use Case                                    | Storage Overhead  |
------------------------------------------------------------------------------------------------------------------------
| TINYTEXT    | 255 characters	           | Very short text, like brief comments or labels        |   1 byte          |
------------------------------------------------------------------------------------------------------------------------
| TEXT        |	65,535 characters    	   | Medium-length text, such as descriptions or comments  |   2 bytes         |                         
------------------------------------------------------------------------------------------------------------------------
| MEDIUMTEXT  | 16,777,215 characters      | Large text, such as articles or logs                  |   3 bytes         |
------------------------------------------------------------------------------------------------------------------------
| LONGTEXT    | 4,294,967,295 characters   | Extremely large text, such as books or extensive logs |   4 bytes         |
------------------------------------------------------------------------------------------------------------------------

*/

create table book(
    book_id int, 
    author_bio tinytext,
    book_proposal text,
    entire_book mediumtext
);