/* DDL Constraints
Create a database called “Sales” and create a new table named “Orders” in the Sales database with
 columns: (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No).
 Use constraints: Primary Key Unique Not Null 1. Add a new column named “order_quantity” to the
 orders table. 2. Rename the orders table to the sales_orders table. 3. Insert 10 rows into the sales_orders table.
 4. Retrieve customer_name and Ordered_Item from the sales_orders table.
 5. Use the update command to change the name of the product for any row. 6. Delete the sales_orders table from the database.*/
 
 create database Sales ;
 use sales;
 Create table Orders(Order_ID int primary key,
 Costomer_Name varchar(20) not null,
 Product_Category varchar(20) not null Unique,
 Ordered_item varchar(20),
 Contact_No Varchar(10) not null unique);
 desc orders;

