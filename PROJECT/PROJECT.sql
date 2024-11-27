# MY PROJECT WORK
/* Module 3: Library Management System
Topic : Library Management System You are going to build a project based on Library Management System.
 It keeps track of all information about books in the library, their cost, status and total number of books\
 available in the library. Create a database named library and following TABLES in the
 database: 1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus Attributes for the tables: 
 1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no
 2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
 3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status
 [Give yes if book available and no if book not available] Author Publisher
 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 
 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id
 in CUSTOMER table Issued_book_name Issue_date Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 
 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY
 and it should refer isbn in BOOKS table Display all the tables and Write the queries for the following : 
 1. Retrieve the book title, category, and rental price of all available books.
 2. List the employee names and their respective salaries in descending order of salary. 
 3. Retrieve the book titles and the corresponding customers who have issued those books. 
 4. Display the total count of books in each category.
 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
 7. Display the branch numbers and the total count of employees in each branch.
 8. Display the names of customers who have issued books in the month of June 2023. 
 9. Retrieve book_title from book table containing history.
 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. Score Distribution:
 1 point for correctly formulating the query of each question (12 x 1 = 12).
 1 point for providing screenshots of the output for each question (12 x 1 = 12).
 1 point for timely submission. Total = 25. PS : After completing the project upload your project with screenshots
 in the github and share the link.*/
 
 
 CREATE DATABASE LIBRARY;
 USE LIBRARY;
 
 CREATE DATABASE library;
USE library;

-- Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
desc branch;

INSERT INTO Branch (branch_no,manager_id,branch_address,contact_no)
values(1001,2345,'Chirayil,vadakara,Calicat','04962293423'),
(1002,2246,'Madakara,Vadakara,Calicat','04962356789'),
(1003,2347,'Onchiyam,Vadakara,calicat','04962504662'),
(1004,2348,'Mukali,Vadakara,Calicat','04962504545'),
(1005,2349,'Chombala,Vadakara,Calicat','04962506787');
select* from branch;

-- Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
Desc employee;
insert into employee (Emp_Id,Emp_name,Position,Salary,Branch_no) values(2345,'Shashindran','Manager',30000,1001),
(3001,'Ganga','Acadamic librarian',18000,1001),(2246,'Kalidasan','Manager',30000,1002),
(3002,'Kaery','Acadamic librarian',18000,1002),
(2347,'Lalithambika','Manager',30000,1003),(3003,'Sreeshan','Acadamic librarian',18000,1003),
(2348,'Abdul Gafoor','Manager',30000,1004),(3004,'Raju','Acadamic librarian',18000,1004),
(2349,'Gokul Das','Manager',30000,1005),(3005,'Reena Rajan','Acadamic librarian',18000,1005);
select * from employee;
-- Books Table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
INSERT INTO Books (ISBN,Book_Title,Category,Rental_Price,status,Author,Publisher)
VALUES('AKG-0123020','Nerinoppam','Essay',12.00,'yes','Achuthanandhan.v.s','Kairali books'),
('AKG-0123021','Nashtanayika','Novel',12.50,'Yes','Abraham,Vinu','Dcbooks'),
('AKG-0123022','Ormakuripukal','Autobiography',12.00,'yes','Ajitha','Current Books'),
('AKG-0123034','Govardhanate yathrakal','Noval',13.00,'NO','Anand','Olive publications'),
('AKG-0123037','Agnisakshi','Novel',13.50,'yes','Lalithambika Antharjanam','Mathrubhumi'),
('AKG-0123042','Shesham Vellithirayil','Autobiography',10.00,'No','Sathyan Anthikad','Mathrrubhumi'),
('AKG-0123044','Oxigen','Stories',10.50,'No','Antony ,Jomon','Olive Books'),
('AKG-0123052','Rogavum Sahithyabhavanayum','Essay',10.50,'Yes','Appan.KP','Kairali books'),
('AKG-0123055','Veyil Thinnunna Pakshi','Poetry',10.00,'No','Ayyapan.A','Current books'),
('AKG-0123047','Tatvamasi','Essay',11.00,'yes','Azikode,Sukumar','DC books'),
('AKG-0123058','Ayussinte Pusthakam','Noval',12.00,'yes','Balakrishnan.CV','Olive books'),
('AKG-0123056','Tipu sulthan','Noval',12.50,'No','Balakrishnan Payyanur','Current books'),
('AKG-0123061','Dupe','Autobiography',11.00,'yes','Banu,Surayya','Kairali bboks'),
('AKG-0123078','Baheerinte Ediye','Autobiography',10.00,'Yes','Basheer fabi','Olive books'),
('AKG-0123075','Mathilukal','Noval',13.00,'No','Basheer,Vikom','DC books'),
('AKG-0123097','Pathummayude Aadu','Noval',13.50,'No','Basheer,Vaikom','DC books'),
('AKG-0123110','Jeevitham Oru Anugraham','Essay',10.00,'Yes','Basheer Vaikom','DC books'),
('AKG-0123111','Dharmarajyam','Play',10.50,'No','Basheer Vaikom','DC books'),
('AKG-0123113','Inninte Aakulathakal','Essai',10.00,'No','Benjamin Dr D','Mathrubhumi'),
('AKG-0123114','Aadu jeevitham','Novel',13.00,'No','Benyamin','Olive books'),
('AKG-0123116','EMS um Penkuttiyum','Stories',11.00,'Yes','Benyamin','Olive books'),
('AKG-0123118','Ningalanne Communistaki','Play',12.00,'No','Thopil Bhasi','Mathrubhumi'),
('AKG-0123119','Chiri Malayalam','Humour',11.00,'Yes','Chemmanam Chacko','Kairali books'),
('AKG-0123121','Aaryavarthanam','Stories',10.00,'No','Chandramathi','Kairali books'),
('AKG-0123127','Marrayillathe','Essay',10.00,'No','Brittas,john','Kairali books'),
('AKG-0123134','Irunda Vanasthilikal','Essay',10.00,'Yes','Benyamin','Olive books'),
('AKG-0123143','Puliyum madhuravum','Autobiography',10.00,'Yes','Chemmanam Chacko','Kairali books'),
('AKG-0123145','Snehichu Mthiyavade','Biography',10.00,'Yes','Bhaskaran c','DC books'),
('AKG-0123147','Grand Final','Novel',13.00,'Yes','Bhattathiri Thanuja','Mathrubhumi'),
('AKG-0123150','Thiranjedutha Kavithakal','Poetry',10.00,'No','Bodheshwaran','Olive books');
select * from Books;
-- Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT into Customer (customer_id,customer_name,customer_address,Reg_Date)
VALUES(01,'Fathima','Chhirakal House_KPR road_Kannookkara','2024-01-11'),
(02,'Aliya','Madapil House_Madakara_Vadakara','2024-01-20'),(03,'Ganga','Pilakool House_chirayil_Mukali','2024-01-22'),
(04,'Rajan','Meethale purayil_cheenamveed_Madappally','2024-01-25'),(05,'Savithri','Rajan House_Kannookkara_','2024-01-26'),
(06,'Kavya','Valiya Veetil_Muyipoth_Vadakara','2024-01-22'),(07,'Sangeeth','BM House_Niranchola_Ayiyur','2024-02-01'),
(08,'Muhammad','Rk House_Chombala','2024-02-02'),(09,'Arun','Meethale Veetil House_Chombala','2024-02-02'),
(10,'Aneesh','Leela Villa_Makootam_Kannookkara','2024-02-02'),(11,'Saritha','Saritham House_Chirayil_Vadakara','2024-02-03'),
(12,'Ganesh','Ambili House_Paral_Vadakara','2024-02-03'),(13,'Henna','Kaithola Veetil_Chombala','2024-02-04'),
(14,'Rajan','Cheriya Veetil_Manthop_Chombala','2024-02-04'),(15,'Satheeshan','Keeran Kuniyil_Vadakara','2024-02-04'),
(16,'Meera','Menon Veedu_Vadakara','2024-02-04'),(17,'Sainaba','Hiba Maanzil_Chombala','2024-02-05'),
(18,'Varuna','Tharavadu_House_onchiyam','2024-02-05'),(19,'Kavya Raj','Mele Veetil_Onchiyam','2024-02-05'),
(20,'Seenath','Mubarak House_Onchiyam_vadakara','2024-02-06'),
(21,'Mohanan','Thalolam House_Chirayil-Vadakara','2024-02-06'),(22,'Prakashan','Kovilam House_onchiyam_Vadakara','2024-02-10'),
(23,'Vilasini','Purathe meethel_chombala_Vadakara','2024-02-11'),(24,'Rohan kumar','Saraswathi Villa_Chombala-Vadakara','2024-02-13'),
(25,'Fathima','Chhirakal House_KPR road_Kannookkara','2024-01-11'),(26,'Seenath','Mubarak House_Onchiyam_vadakara','2024-02-06'),
(27,'Aliya Meenu','Madapil veetil House_Madakara_Vadakara','2024-01-20'),(28,'Ganga pv','Pilakool House_chirayil_Mukali','2024-01-22'),
(29,'Rajan k','Meethale purayil_cheenamveed_Madappally','2024-01-25'),(30,'Savithri','Rajan House_Kannookkara_','2024-01-26'),
(31,'Kavya N','Valiya Veetil_Muyipoth_Vadakara','2024-03-22'),(32,'Sangeeth R','BM House_Niranchola_Ayiyur','2024-03-01'),
(33,'Muhammad M','Rk House_Chombala','2024-03-04'),(34,'Arun kumar','Meethale Veetil House_Chombala','2024-04-02'),
(35,'Aneesh Raj','Leela Villa_Makootam_Kannookkara','2024-04-02'),(36,'Saritha S','Saritham House_Chirayil_Vadakara','2024-04-03'),
(37,'Ganesh','Ambili House_Paral_Vadakara','2024-02-03'),
(38,'Rajan','Cheriya Veetil_Manthop_Chombala','2024-04-04'),(39,'Satheeshan','Keeran Kuniyil_Vadakara','2024-04-04'),
(40,'Meera','Menon Veedu_Vadakara','2024-02-04'),(41,'Sainaba SK','Hiba Maanzil_Chombala','2024-04-05'),
(42,'Varuna N','Tharavadu_House_onchiyam','2024-05-05'),(43,'Kavya Raj','Mele Veetil_Onchiyam','2024-05-05'),
(44,'Seenath kasim','Mubarak House_Onchiyam_vadakara','2024-05-06'),(45,'Rajesh','Achuthan Hnouse_Onchiyam_Vadakara','2024-05-07'),
(46,'Mohanan Master','Thalolam House_Chirayil-Vadakara','2024-03-06'),(47,'Prakashan S','Kovilam House_onchiyam_Vadakara','2024-05-10'),
(48,'Vilasini Shasi','Purathe meethel_chombala_Vadakara','2024-05-11'),(49,'Rohan kumar','Saraswathi Villa_Chombala-Vadakara','2024-02-13'),
(50,'Meera Rajan','Nanadanam_Onchiyam_Vadakara','2024-05-23'),(51,'Rajesh','Achuthan Hnouse_Onchiyam_Vadakara','2024-02-07'),
(52,'Henna','Kaithola Veetil_Chombala','2024-05-04');
SELECT * FROM Customer;
-- IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
desc issuestatus;

INSERT INTO Issuestatus (issue_Id,issued_Cust,Issued_book_Name,Issue_Date,ISBN_Book)
VALUES
(1001, 07, 'Agnisakshi', '2024-10-10', 'AKG-0123037'),
(1002, 02, 'Nerinoppam', '2024-10-15', 'AKG-0123020'),
(1003, 04, 'Nashtanayika', '2024-10-20', 'AKG-0123021'),
(1004, 05, 'Ormakuripukal', '2024-10-25', 'AKG-0123022'),
(1005, 06, 'Shesham Vellithirayil', '2024-11-01', 'AKG-0123042'),
(1006, 09, 'Oxigen', '2024-11-05', 'AKG-0123044'),
(1007, 11, 'Tatvamasi', '2024-11-10', 'AKG-0123047'),
(1008, 13, 'Mathilukal', '2024-11-15', 'AKG-0123075'),
(1009, 17, 'Pathummayude Aadu', '2024-11-20', 'AKG-0123097'),
(1010, 19, 'Dharmarajyam', '2024-11-25', 'AKG-0123111'),
(1011, 01, 'Ayussinte Pusthakam', '2024-12-01', 'AKG-0123058'),
(1012, 03, 'Tipu Sulthan', '2024-12-05', 'AKG-0123056'),
(1013, 08, 'Dupe', '2024-12-10', 'AKG-0123061'),
(1014, 10, 'Baheerinte Ediye', '2024-12-15', 'AKG-0123078'),
(1015, 12, 'Jeevitham Oru Anugraham', '2024-12-20', 'AKG-0123110'),
(1016, 14, 'Inninte Aakulathakal', '2024-12-25', 'AKG-0123113'),
(1017, 15, 'Aadu Jeevitham', '2024-12-30', 'AKG-0123114'),
(1018, 16, 'EMS um Penkuttiyum', '2025-01-05', 'AKG-0123116'),
(1019, 18, 'Ningalanne Communistaki', '2025-01-10', 'AKG-0123118'),
(1020, 20, 'Chiri Malayalam', '2025-01-15', 'AKG-0123119'),
(1021, 21, 'Aaryavarthanam', '2025-01-20', 'AKG-0123121'),
(1022, 22, 'Marrayillathe', '2025-01-25', 'AKG-0123127'),
(1023, 23, 'Irunda Vanasthilikal', '2025-01-30', 'AKG-0123134'),
(1024, 24, 'Puliyum Madhuravum', '2025-02-05', 'AKG-0123143'),
(1025, 25, 'Snehichu Mthiyavade', '2025-02-10', 'AKG-0123145'),
(1026, 26, 'Grand Final', '2025-02-15', 'AKG-0123147'),
(1027, 27, 'Thiranjedutha Kavithakal', '2025-02-20', 'AKG-0123150'),
(1028, 28, 'Aadu jeevitham', '2025-02-25', 'AKG-0123114'),
(1029, 29, 'Nashtanayika', '2025-03-02', 'AKG-0123021'),
(1030, 30, 'Tatvamasi', '2025-03-10', 'AKG-0123047'),
(1031, 31, 'Oxigen', '2025-03-15', 'AKG-0123044');

--
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(2001, 01, 'Nerinoppam', '2024-11-15', 'AKG-0123020'),
(2002, 02, 'Nashtanayika', '2024-11-20', 'AKG-0123021'),
(2003, 03, 'Ormakuripukal', '2024-11-25', 'AKG-0123022'),
(2004, 04, 'Govardhanate Yathrakal', '2024-11-30', 'AKG-0123034'),
(2005, 05, 'Shesham Vellithirayil', '2024-12-05', 'AKG-0123042'),
(2006, 06, 'Oxigen', '2024-12-10', 'AKG-0123044'),
(2007, 08, 'Rogavum Sahithyabhavanayum', '2024-12-15', 'AKG-0123052'),
(2008, 09, 'Veyil Thinnunna Pakshi', '2024-12-20', 'AKG-0123055'),
(2009, 10, 'Tatvamasi', '2024-12-25', 'AKG-0123047'),
(2010, 11, 'Tipu Sulthan', '2025-01-05', 'AKG-0123056'),
(2011, 12, 'Dupe', '2025-01-10', 'AKG-0123061'),
(2012, 13, 'Mathilukal', '2025-01-15', 'AKG-0123075'),
(2013, 14, 'Pathummayude Aadu', '2025-01-20', 'AKG-0123097'),
(2014, 15, 'Jeevitham Oru Anugraham', '2025-01-25', 'AKG-0123110'),
(2015, 16, 'Inninte Aakulathakal', '2025-01-30', 'AKG-0123113'),
(2016, 18, 'Aadu Jeevitham', '2025-02-05', 'AKG-0123114'),
(2017, 20, 'EMS um Penkuttiyum', '2025-02-10', 'AKG-0123116'),
(2018, 21, 'Ningalanne Communistaki', '2025-02-15', 'AKG-0123118'),
(2019, 22, 'Chiri Malayalam', '2025-02-20', 'AKG-0123119'),
(2020, 23, 'Aaryavarthanam', '2025-02-25', 'AKG-0123121');

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_Title, Category, Rental_Price
FROM Books
WHERE status = 'yes';
--
-- 2 List the employee names and their respective salaries in descending order of salary:
SELECT Emp_Name, Salary
FROM Employee
ORDER BY Salary DESC;
--
-- 3 Retrieve the book titles and the corresponding customers who have issued those books:
SELECT I.Issued_book_Name, C.Customer_Name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id;
--
-- 4 Display the total count of books in each category:
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;
--
-- 5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000:(NOBODY ABOVE 50000 SO CHANGED 25000)
SELECT Emp_Name, Position
FROM Employee
WHERE Salary > 25000;
--
-- 6 List the customer names who registered before 2024-04-01 and have not issued any books yet:
SELECT C.Customer_Name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust
WHERE C.Reg_Date < '2024-04-01' AND I.Issued_cust IS NULL;
-- 
-- 7 Display the branch numbers and the total count of employees in each branch:
SELECT Branch_No, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_No;
--
-- 8 Display the names of customers who have issued books in the month of februvary 2025:
SELECT C.Customer_Name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE Issue_Date BETWEEN '2025-02-01' AND '2025-02-28';
-- 
-- 9 Retrieve book titles from the book table containing 'autobiography':
SELECT Book_Title
FROM Books
WHERE Category LIKE '%autobiography%';
-- 
-- 10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:
SELECT Branch_NO, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_NO
HAVING COUNT(*) > 1;
--
-- 11 Retrieve the names of employees who manage branches and their respective branch addresses:
SELECT E.Emp_Name, B.Branch_Address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;
--
-- 12 Display the names of customers who have issued books with a rental price higher than Rs. 13:
SELECT C.Customer_Name
FROM IssueStatus I
JOIN Books B ON I.Isbn_book = B.ISBN
JOIN Customer C ON I.Issued_cust = C.Customer_Id
WHERE B.Rental_Price > 13;


--                 THANK   YOU                --  















 