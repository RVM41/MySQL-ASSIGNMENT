# Joins and Union #
 /* Consider the Country table and Persons table that you created earlier and perform the following: 
  (1)Perform inner join, Left join, and Right join on the tables.  
  (2)List all distinct country names from both the Country and Persons tables. 
 (3)List all country names from both the Country and Persons tables, including duplicates.
 (4)Round the ratings of all persons to the nearest integer in the Persons table.*/
 
use entry_d41;

 create table Country (Id int auto_increment primary key,Country_Name Varchar (30),Population int,Area varchar(30)) ;
create table Persons (id int primary key not null,Fname varchar (30),Lname varchar(30),Population int,
 Rating decimal(10,1),Country_Id varchar(30),Country_Name varchar(30));
desc country;
desc persons;

update persons set country_name="Canada"
where country_name="canaada";
set sql_safe_updates=0; 

insert into country(country_name,population,area) 
values ("india",1000000000,"south asia"),("pakisthan",400000000,"south asia"),
("srilanka",300000000,"soth asia"),("china",1300000000,"south asia"),
("Bangladesh",500000000,"south asia"),("south africa",60000000,"africa"),
("Kenya",350000000,"africa"),("America",650000000,"north america"),("France",450000000,"western eupersonsorope"),
("Germany",350000000,"central euorope");
select * from country;

insert into persons(id,fname,lname,population,rating,country_id,country_name) 
values(101,"Mukesh","Ambani",1500000,5.5,"IND","India"),(102,"Rathan","Tata",2000000,5.0,"IND","India"),
(103,"MA.Yousuf","Ali",1000000,3.7,"IND","India"),(105,"Barach","Obama",400000,3.5,"USA","United State Of America"),
(107,"Nicholas","Modo",1000000,6.5,"USA","United State Of America"),(109,"Kewen","Embeppe",1000000,6.0,"CAN","Canada"),
(110,"Ricky","Ponding",700000,5.5,"AUS","Australia"),(111,"Vein","Rooni",750000,6.0,"UK","United Kingdom"),(112,"Max","Well",400000,4.5,null,null),
(115,"Laika","Teresa",800000,5.7,"CAN","Canaada");
select *from persons;

-- (1)Perform inner join, Left join, and Right join on the tables.  
-- a) INNER JOIN
select country.*,persons.* 
from country inner join persons on country.Id=persons.Id;

-- b) LEFT JOIN
select country.*,persons.* 
from country LEFT join persons on country.Id=persons.Id;

-- c) RIGHT JOIN
select country.*,persons.* 
from country Right join persons on country.Id=persons.Id; 

-- (2)List all distinct country names from both the Country and Persons tables. 
select DISTINCT country_name from country
union
select DISTINCT country_name from persons;

 -- (3)List all country names from both the Country and Persons tables, including duplicates.
select country_name from country
union all
select country_name from persons;

-- (4)Round the ratings of all persons to the nearest integer in the Persons table.
SELECT fname, lname, ROUND(rating) AS rounded_rating
FROM Persons;

##THANK YOU##

