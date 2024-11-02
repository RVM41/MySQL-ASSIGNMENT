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
 select Country_Name,count(*) as Numberof_persons from persons group by Country_Name;-- using group by
 
  SELECT Country_Name, COUNT(*) AS number_of_persons
FROM Persons
WHERE Country_Name IN (SELECT DISTINCT Country_Name FROM Persons)
GROUP BY Country_Name;                                            --  IN (SELECT DISTINCT Country_Name FROM Persons) sub query

 -- 2. Find the number of persons in each country sorted from high to low.
 SELECT Country_Name, number_of_persons
FROM (
    SELECT Country_Name, COUNT(*) AS number_of_persons
    FROM Persons
    WHERE Country_Name IS NOT NULL
    GROUP BY Country_Name
) AS subquery
ORDER BY number_of_persons desc;

--  3. 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select avg (Rating) from persons where (select * from persons where avg(rating) );