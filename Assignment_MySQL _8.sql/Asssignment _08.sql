# Subqueries and Views
/* Consider the Country table and Persons table that you created earlier and perform the following:
 1. Find the number of persons in each country. 
 2. Find the number of persons in each country sorted from high to low.
 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
 4. Find the countries with the same rating as the USA. (Use Subqueries) 
 5. Select all countries whose population is greater than the average population of all nations.
 Create a database named Product and create a table called Customer with the following fields in the
 Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.
 Then perform the SELECT operation for the customer_info view. 
 2. Create a view named US_Customers that displays customers located in the US.
 3. Create another view named Customer_details with columns full name(Combine first_name and last_name),
 email, phone_no, and state. 4. Update phone numbers of customers who live in California for Customer_details view.
 5. Count the number of customers in each state and show only states with more than 5 customers.
 6. Write a query that will return the number of customers in each state, 
 based on the "state" column in the "customer_details" view. 
 7. Write a query that returns all the columns from the "customer_details" view,
 sorted by the "state" column in ascending order.*/
 select * from persons;
 
 -- 1. Find the number of persons in each country. 
SELECT country_name, COUNT(*) AS number_of_persons
FROM Persons
GROUP BY country_name

UNION ALL

SELECT country_name, COUNT(*) AS number_of_persons
FROM country
GROUP BY country_name;


 -- 2. Find the number of persons in each country sorted from high to low.
SELECT country_name, COUNT(*) AS number_of_persons
FROM Persons
GROUP BY country_name

UNION ALL

SELECT country_name, COUNT(*) AS number_of_persons
FROM country
GROUP BY country_name

ORDER BY number_of_persons desc;

--  3. 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
SELECT country_name, avg_rating
FROM (
    SELECT country_name, AVG(rating) AS avg_rating
    FROM Persons
    GROUP BY country_name
) AS subquery
WHERE avg_rating > 3.0;

--  4. Find the countries with the same rating as the USA. (Use Subqueries) 
select Country_Name from persons where rating in(select rating from persons where Country_Name ='United state of America') group by Country_Name;

-- 5. Select all countries whose population is greater than the average population of all nations.
SELECT AVG(population) AS avg_population
FROM Country;
SELECT country_name
FROM Country
WHERE population > (SELECT AVG(population) FROM Country);

/* Create a database named Product and create a table called Customer with the following fields in the
 Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country */

create database Product;
use product;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(20),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);
insert into  customer(First_name,Last_name,Email,Phone_no,Address,City,State,Zip_code,Country)
values('Mohan','Jodaro','mohan@linko.com','0987655472','Kindo no365','bimphi','Newyork','new1212','USA'),
('lailu','gamaro','lai@linko.com','098655549','dhano_65','hikon','california','dl6542','USA'),
('jamuna','rani','jamu@linko.com','0788655472','mimp no365','Mnama','california','MIMP121','USA'),
('Meenu','Joerge','maeen@linko.com','0787653472','califno365','mnama','california','cal0512','USA'),
('Sarkar','Franko','sar@linko.com','546655472','jupit no115','drong','Newyork','new1212','USA'),
('Sofia','tomar','tomar@linko.com','984565547','Kindo no365','frank','california','cal1212','USA'),
('Perly','Arnao','arna12n@linko.com','0983245472','hgtyno390','drong','Newyork','new1243','USA'),
('George','bodaro','bodn@linko.com','0987234547','hjuydf bul5','filalo','California','new1212','USA'),
('Rmesh','sijo','sijn@linko.com','63456552','wereno305','greent','Newyork','new12','USA'),
('Leeno','Paro','parn@linko.com','095456552','Kindo no365','greeno','Newyork','new1342','USA');

--  1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.
 -- Then perform the SELECT operation for the customer_info view. 
 CREATE VIEW customer_info AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name,
    Email
FROM Customer;
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name,
    Email,
    Address,
    City,
    State,
    Zip_code,
    Country
FROM Customer
WHERE Country = 'USA';
select *from US_customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name),
select *from customer;
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name,
    Email,
    Phone_no,
    Address,
    City,
    State,
    Zip_code,
    Country
FROM Customer;
SELECT * FROM Customer_details;

SET SQL_SAFE_UPDATES = 0;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer
SET Phone_no = CASE 
    WHEN Customer_Id = 2 THEN '555-1234'
    WHEN Customer_Id = 3 THEN '555-5678'
    WHEN Customer_Id = 4 THEN '555-9012'
    WHEN Customer_Id = 6 THEN '555-3456'
    WHEN Customer_Id = 8 THEN '555-7890'
    ELSE Phone_no
END
WHERE State = 'California';

SELECT * FROM Customer_details WHERE State = 'California';

-- 5_ Count the number of customers in each state and show only states with more than 5 customers.

SELECT State, number_of_customers
FROM (
    SELECT State, COUNT(*) AS number_of_customers
    FROM Customer
    GROUP BY State
) AS subquery
WHERE number_of_customers >= 5;

-- 6. Write a query that will return the number of customers in each state, 
--  based on the "state" column in the "customer_details" view. 
SELECT State, number_of_customers
FROM (
    SELECT State, COUNT(*) AS number_of_customers
    FROM Customer_details
    GROUP BY State
) AS subquery;

-- 7. Write a query that returns all the columns from the "customer_details" view,
--  sorted by the "state" column in ascending order.

SELECT *
FROM Customer_details
ORDER BY State ASC;


