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
 -- (10)Find all countries whose names do not start with 'C'.
use entry_d41;
 create table Country (Id int auto_increment primary key,Country_Name Varchar (30),Population int,Area varchar(30)) ;
create table Persons (id int auto_increment primary key,Fname varchar (30),Lname varchar(30),Population int,
 Rating decimal(10,1),Country_Id varchar(30),Country_Name varchar(30));
desc country;
desc persons;

insert into country(country_name,population,area) 
values ("india",1000000000,"south asia"),("pakisthan",400000000,"south asia"),
("srilanka",300000000,"soth asia"),("china",1300000000,"south asia"),
("Bangladesh",500000000,"south asia"),("south africa",60000000,"africa"),
("Kenya",350000000,"africa"),("America",650000000,"north america"),("France",450000000,"western eupersonsorope"),
("Germany",350000000,"central euorope");
select * from country;

insert into persons(fname,lname,population,rating,country_id,country_name) 
values("Mukesh","Ambani",1500000,5.5,"IND","India"),("Rathan","Tata",2000000,5.0,"IND","India"),
("MA.Yousuf","Ali",1000000,3.7,"IND","India"),("Barach","Obama",400000,3.5,"USA","United State Of America"),
("Nicholas","Modo",1000000,6.5,"USA","United State Of America"),("Kewen","Embeppe",1000000,6.0,"CAN","Canada"),
("Ricky","Ponding",700000,5.5,"AUS","Australia"),("Vein","Rooni",750000,6.0,"UK","United Kingdom"),("Max","Well",400000,4.5,null,null),
("Laika","Teresa",800000,5.7,"CAN","Canaada");
set sql_safe_updates=0; 
update persons set country_name="Canada"
where country_name="canaada";
select *from persons;

-- (1)List the distinct country names from the Persons table 
select distinct country_name from persons ;

-- (2)Select first names and last names from the Persons table with aliases.
select Fname as  First_Name, lname as Last_name from persons;

-- (3)Find all persons with a rating greater than 4.0.
select id,Fname from persons where rating > 4.0;

-- (4)Find countries with a population greater than 10 lakhs. 
select country_name from persons where population >1000000;

-- (5)Find persons who are from 'USA' or have a rating greater than 4.5.
select Fname from persons where Country_Name ='United State Of America' and Rating>4.5;

-- (6)Find all persons where the country name is NULL.
select Fname from persons where Country_Name is null;

 -- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'.
select Fname,id from persons where Country_Name in ('united state of america','canada','uk');

-- (8)Find all persons not from the countries 'India' and 'Australia'. 
select id ,Fname from persons where  Country_Name not in ('india','australia');

-- (9)Find all countries with a population between 5 lakhs and 20 lakhs.
select Country_Name from persons where Population between 500000 and 2000000;

-- (10)Find all countries whose names do not start with 'C'. -- no names start whith 'c'in persons table,
--  I changed first spell of fname column starts with 'M' 
select * from persons where fname not like 'm%' ;

##Thank You##
drop table country , persons;

