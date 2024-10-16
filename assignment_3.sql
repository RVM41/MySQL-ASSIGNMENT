/* DML Commands
Create a table named Managers with fields : Manager_Id First_name Last_Name DOB Age ->Use check constraint
 Last_update Gender Department Salary -> NOT NULL 1. Insert 10 rows. 2. Write a query that retrieves the name and date of birth
 of the manager with Manager_Id 1. 3. Write a query to display the annual income of all managers.
 4. Write a query to display records of all managers except ‘Aaliya’.
 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month.
 6. Write a query to display details of managers whose salary is between 10000 and 35000.*/
 use entry_d41 ;
 create table Managers (Manager_ID int, First_Name varchar(30), Last_Name varchar(20) ,DOB date ,Age int) ;
 desc managers;
 
 drop table managers;
create table Managers( 
 Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 18),  Last_Update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);
desc managers;
## 1. Insert 10 rows
insert into managers(manager_id,first_name,last_name,DOB,Age,last_update,gender,department,salary) values
(1211,"Rekha","Varma","1990-10-12",34,"2024-10-16","F","HR",35000.00),
(1200,"Ashok","Malhotra","1986-08-01",38,"2024-10-16","M","Planning&engineering",45000.00),
(1207,"Goury","Nanda","1995-07-22",29,"2024-10-16","F","Purchase Manager",40000.00),
(1220,"Hakeem" ,"javed","1989-04-22",35,"2024-10-16","M","Sales Manager",40000.00),
(1210,"Jeorge", "hexo","1984-02-22",40,"2024-10-16","M","General Manager",60000.00),
(1224,"Jooli","Cheriyan","1993-09-26",31,"2024-10-16","F","Assistend purchase manager",35000.00),
(1218,"Adwerd", "Stephen","1989-12-23",31,"2024-10-16","M","Customer relation Manager",45000.00),
(1214,"Rekha","Menon","1989-07-03",31,"2024-10-16","F","Accounts Manager",45000.00),
(1215,"Seetha","Mohan","1988-06-22",36,"2024-10-16","F","Clearance manager",44000.00),
(1233,"Hameed ","Ansari","1993-03-22",31,"2024-10-16","M","Assistent clearance manager",34000.00);
select *from Managers;
## 2. Write a query that retrieves the name and date of birth  of the manager with Manager_Id 
select manager_id ,first_name, last_name, dob from managers;

##  Write a query to display the annual income of all managers.
select *, (salary * 12) as annual_income from managers ;

## 4. Write a query to display records of all managers except "goury".
select * from Managers where first_name != "goury";

 ## 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month.
 select * from managers where salary>25000  and department="it" ;
 
 ## 6. Write a query to display details of managers whose salary is between 10000 and 35000.*/
 
 select * from managers where salary between 10000 and 35000;
   ### Thank you###
   