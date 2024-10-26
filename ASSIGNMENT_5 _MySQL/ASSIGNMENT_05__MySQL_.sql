## Sorting and Grouping data
-- Insert 10 rows into both tables, as given below. Create a table named Country with fields:
--  Id Country_name Population Area 
-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
-- 2. Write an SQL query to concatenate first name and last name from Persons table.
--  3. Write an SQL query to count the number of unique country names from Persons table. 
-- 4. Write a query to print the maximum population from the Country table.
--  5. Write a query to print the minimum population from Persons table. 
-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
-- 7. Write a query to find the number of rows in the Persons table.
--  8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
-- 10. List all persons ordered by their rating in descending order. 11. Find the total population for each country in the Persons table.
-- 12. Find countries in the Persons table with a total population greater than 50,000 
-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons,
--  ordered by the average rating in ascending order.

use entry_d41;
 create table Country (Id int auto_increment primary key ,Country_Name Varchar (30),Population int,Area varchar(30)) auto_increment=101 ;
create table Persons (id int auto_increment primary key,Fname varchar (30),Lname varchar(30),Population int,
 Rating decimal(10,1),Country_Id varchar(30),Country_Name varchar(30)) auto_increment=1001;
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
("Laika","Teresa",800000,5.7,"CAN","Canada");

select *from persons;

-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
select substring(country_name,1,3) as Country from country;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.
select concat (Fname,' ',Lname) as Full_name from persons ;

--  3. Write an SQL query to count the number of unique country names from Persons table. 
select  count(Distinct country_name ) as count_unique_country_name from persons;

-- 4. Write a query to print the maximum population from the Country table.
select (country_name), (population)  from country where population=(select max(population)as maximum_population from country);

--  5. Write a query to print the minimum population from Persons table. 
select min(population) from  persons;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
insert into  persons (fname,lname,population,rating,country_id,country_name) values("Gilbar",Null,900000,5.6,"CAN","Canada"),
("Velkar",Null,120000,6.6,"AUS","Australia");
select* from persons;
select count(lname) as count_of_last_name from persons;

 -- 7. Write a query to find the number of rows in the Persons table.
select count(*) as number_of_rows from persons;

--  8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
select id,population from country limit 3;

-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
select * from country order by RAND() limit 3;
 
-- 10. List all persons ordered by their rating in descending order.
select * from persons order by rating desc;

-- 12. Find countries in the Persons table with a total population greater than 50,000 
select country_name ,sum(population)as Total_population from persons 
group by country_name having total_population>50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons,
--  ordered by the average rating in ascending order.
select country_name ,count(*) as Total_No_Of_Persons,Avg(rating) as average_rating from 
persons group by country_name
Having count(*)>2
order by average_rating asc;

##TANK YOU##
