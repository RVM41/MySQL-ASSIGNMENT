# Functions
/* Consider the Country table and Persons table that you created earlier and perform the following:
--  1. Add a new column called DOB in Persons table with data type as Date. 
2. Write a user-defined function to calculate age using DOB. 
3. Write a select query to fetch the Age of all persons using the function that has been created. 
4. Find the length of each country name in the Country table.
 5. Extract the first three characters of each country's name in the Country table.
 6. Convert all country names to uppercase and lowercase in the Country table*/
 
 use entry_d41;

 create table Country (Id int auto_increment primary key,Country_Name Varchar (30),Population int,Area varchar(30)) ;
create table Persons (id int primary key not null,Fname varchar (30),Lname varchar(30),Population int,
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

insert into persons(id,fname,lname,population,rating,country_id,country_name) 
values(101,"Mukesh","Ambani",1500000,5.5,"IND","India"),(102,"Rathan","Tata",2000000,5.0,"IND","India"),
(103,"MA.Yousuf","Ali",1000000,3.7,"IND","India"),(105,"Barach","Obama",400000,3.5,"USA","United State Of America"),
(107,"Nicholas","Modo",1000000,6.5,"USA","United State Of America"),(109,"Kewen","Embeppe",1000000,6.0,"CAN","Canada"),
(110,"Ricky","Ponding",700000,5.5,"AUS","Australia"),(111,"Vein","Rooni",750000,6.0,"UK","United Kingdom"),(112,"Max","Well",400000,4.5,null,null),
(115,"Laika","Teresa",800000,5.7,"CAN","Canada");
select *from persons;

-- 1. Add a new column called DOB in Persons table with data type as Date. 
alter table persons add DOB date ;
desc persons;
 set sql_safe_updates =0;
update persons set DOB= '1964-11-22'
where fname ='Mukesh'and lname= 'Ambani';
update persons set DOB= '1980-11-22'
where fname ='Rathan'and lname= 'Tata';
update persons set DOB= '1975-09-12'
where fname ='MA.yousuf'and lname='Ali';
update persons set DOB= '1974-02-02'
where fname ='Barach'and lname= 'Obama';
update persons set DOB= '1971-08-13'
where fname ='Nicholas'and lname= 'Modo';
update persons set DOB= '1990-10-22'
where fname ='Kewen'and lname= 'Embeppe';
update persons set DOB= '1983-04-12'
where fname ='Ricky'and lname= 'Ponding';
update persons set DOB= '1988-07-02'
where fname ='Vein'and lname= 'Rooni';
update persons set DOB= '1988-05-13'
where fname ='Max'and lname= 'Well';
update persons set DOB= '1970-01-12'
where fname ='Laika'and lname= 'Teresa';
select* from persons;

-- 2. Write a user-defined function to calculate age using DOB.
 DELIMITER $$
 Create Function CalculateAge(DOB DATE)
 RETURNS INT 
 DETERMINISTIC
 BEGIN
     Declare Age int;
     SET Age=TIMESTAMPDIFF(YEAR ,DOB,CURDATE());
     RETURN AGE;
END $$
DELIMITER ;
DROP FUNCTION CALCULATEAGE;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created. 
SELECT ID,FNAME,LNAME,COUNTRY_NAME,DOB,CALCULATEAGE(DOB) as AGE from persons ;

 -- 4. Find the length of each country name in the Country table.
SELECT COUNTRY_NAME ,LENGTH(COUNTRY_NAME)AS NAME_LENGTH FROM COUNTRY;

 -- 5. Extract the first three characters of each country's name in the Country table.
 SELECT COUNTRY_NAME ,substring(country_name, 1,3)as short_name from country;
 
 -- 6. Convert all country names to uppercase and lowercase in the Country table
 select country_name ,upper(country_name)as upper_case from country;
 
 select country_name ,lower(country_name )as lower_case from country;
 
## thank you##

