-- Querying Data
-- Insert 10 rows into both tables, as given below. Create a table named Country 
-- with fields: Id Country_name Population Area Create another table named Persons
--  with fields: Id Fname Lname Population Rating Country_Id Country_name 
 -- (1)List the distinct country names from the Persons table (2)Select first names and last names from the Persons table with aliases.
 -- (3)Find all persons with a rating greater than 4.0. (4)Find countries with a population greater than 10 lakhs. 
 -- (5)Find persons who are from 'USA' or have a rating greater than 4.5. (6)Find all persons where the country name is NULL.
 -- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'.
 -- (8)Find all persons not from the countries 'India' and 'Australia'. 
 -- (9)Find all countries with a population between 5 lakhs and 20 lakhs.

 create table Country (Id int auto_increment primary key,Country_Name Varchar (30),Population int,Area varchar(30)) ;
create table Persons (id int auto_increment primary key,Fname varchar (30),Lname varchar(30),Population int,
 Rating int,Country_Id varchar(30),Country_Name varchar(30));
