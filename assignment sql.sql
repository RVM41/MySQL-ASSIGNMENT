# DDL Commands
### Create a database named School and perform all the DDL commands(CREATE, ALTER, DROP, RENAME, TRUNCATE)
### for the table named STUDENT with fields: Roll_No Name Marks Grade Create data on your own based on the given columns
### (1) Use the select command to display the table. (2) Add a column named Contact to the STUDENT table.
### (3) Remove the Grade column from the Student table. (4) Rename the table to CLASSTEN. (5) Delete all rows from the table.
## (6) Remove the table from the database.

use entry_d41;
create table STUDENT(Roll_no int,First_name varchar(30),Marks int,Grade varchar(10));
desc student;
insert into student(roll_no,first_name,marks,grade) values (1,"Ashish",539,"A"),
(2,"Anasar",450,"B"),(3,"Murali", 470,"B"),
(4,"Fathima",540,"A"),(5,"Noora",560,"A"),(6,"Hameed",400,"B"),
(7,"Neelu",447,"B"),(8,"Kajal",509,"A"),(9,"Ashar",430,"B"),
(10,"Leela",456,"B"),(11,"Fasila",568,"A"),(12,"Geethu",465,"A"),
(13,"Ashok",540,"A"),(14,"Varun",420,"B"),(15,"Rheem",480,"B");

###1- Use the select command to display the table
select * from  student;

### 2- Add a column named Contact to the STUDENT table.

alter table student add column Contact varchar(10);
select * from  student;
 set sql_safe_updates=0;
update student  set Contact = "04347673";

###(3) Remove the Grade column from the Student table
alter table student drop column grade;
desc student;

  ### (4) Rename the table to CLASSTEN.
  rename table student to CLASSTEN;
  DESC CLASSTEN;
  
  ### (5) Delete all rows from the table.
  truncate table classten;
  desc classten;
  
  ## (6) Remove the table from the database.
  Drop table classten;
  
  ##### CONYCLUSION   :In summary, creating the student table using MySQL DDL commands provides an essential framework
  ###for organizing and managing student data effectively. This process ensures data integrity, accuracy, and uniqueness 
  ### by defining appropriate data types and constraints. Establishing this structure is a crucial step in building a reliable
  ### and efficient database system for future data operations and management.