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
 Product_Category varchar(20) not null ,
 Ordered_item varchar(20),
 Contact_No Varchar(10) not null unique);
 desc orders;
 
/* 1. Add a new column named “order_quantity” to the
 orders table*/
alter table orders add column order_quantity int ;
set sql_safe_updates=0;
alter table sales_orders drop column Product_Category;
alter table sales_orders add column  Product_category varchar(20) not null;
## 2. Rename the orders table to the sales_orders table.
rename table orders to Sales_Orders;
desc sales_orders;
## 3. Insert 10 rows into the sales_orders table.
insert into sales_orders(Order_ID,Costomer_Name,Product_Category,Ordered_item,Contact_No,order_quantity) values (1001,"Gopika","Electronics","Fan",
"9847363476",23) ,(1002,"Shekar","Toys","Remote car","9023457654",30) ,(1003,"Ahmed","Electronics","Torch light","9832763490",32) ,(1004,
"Sujadha","Home Appliance","Gas stove","9045876521",12) ,(1005,"Hariharan","Electronics","Led bulb","9087123465",35),
(1006,"Ahmed","Electronics","Emergency Lamb","9787676532",10) ,(1007,"Hajara","Toys","Helicopter","9009897856",22) ,(1008,"Ashokan","Toys","Doll","9190983421",10),
(1009,"Sajna","Home Appliance","Gas stove Liter","9190948744",20) ,(1010,"Hariharan","Electronics","Reachargeble Bulb","9645234578",25);
drop data
drop database sales;