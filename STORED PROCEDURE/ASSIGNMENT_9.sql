USE  PRODUCT;
#  ASSIGNMENT_9   STORED PROCEDURE
 /* Consider the Worker table with following fields:
 Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), 
 JoiningDate DATETIME, Department CHAR(25)) 
 1. Create a stored procedure that takes in IN parameters for
 all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
 It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter.
 Then make the procedure call.
 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT.
 It should update the department of the worker with the given ID. Then make a procedure call.
 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount.
 It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter.
 Make procedure call.
 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
 It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary
 parameter and call the procedure.
*/
# CREAT AND USING PRCEDURE
CREATE TABLE WORKER (WORKER_ID INT ,FIRST_NAME CHAR(25),LAST_NAME CHAR(25),SALARY INT,JOINING_DATE DATETIME,
DEPARTMENT CHAR(25));

INSERT INTO WORKER (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
 VALUES(101,'Subin','Das',37000, '2023-11-11 09:00:00','IT'),
(102,'Ashok','Varma',46000, '2022-09-20 09:00:00','IT'),
(103,'Latha','Mohan',40000,'2021-03-13 08:30:00','Accounts'),
(104,'Fathims','Begam',45000,'2019-06-12 08:00:00','IT'),(105,'Gopala','Krishnan',60000,'2015-02-10 09:30:00','IT'),
(106,'muhammad','Ashraf',45000,'2021-04-10 09:30:00','Accounts');

--  1. Create a stored procedure that takes in IN parameters for
--  all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
# 1.INSERT ROW PROCEDURE
DELIMITER $$
CREATE PROCEDURE INSERT_ROW(IN P_WORKER_ID INT ,  IN P_FIRST_NAME CHAR(25),
IN P_LAST_NAME CHAR(25),IN P_SALARY INT,
IN P_JOINING_DATE DATETIME,
IN P_DEPARTMENT CHAR(25))
BEGIN
   INSERT INTO  WORKER (WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT)
   VALUES(P_WORKER_ID,P_FIRST_NAME,P_LAST_NAME,P_SALARY,P_JOINING_DATE,P_DEPARTMENT);
END $$
DELIMITER ;                
# INVOKING THE PROCEDURE
   CALL INSERT_ROW(110,'Anwar','Sadique',50000,'2024-10-30 09:00:00','HR');
SELECT *FROM WORKER;

--  2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
--  It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter.
 -- Then make the procedure call.
 # FETCH SALARY PROCEDURE
DELIMITER $$
  CREATE PROCEDURE FETCH_SALARY(IN NUM INT,OUT P_SALARY INT)
  BEGIN
	SELECT SALARY INTO P_SALARY FROM WORKER WHERE WORKER_ID=NUM;
END $$
DELIMITER ;
# INVOKING THE PROCEDURE
  SET @SALARY=0;
  CALL FETCH_SALARY(102,@SALARY);
  SELECT @SALARY;
-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT.
 -- It should update the department of the worker with the given ID. Then make a procedure call.
 # UPDATE DEPARTMENT PROCEDURE
DELIMITER $$
CREATE PROCEDURE UPDATE_DEPARTMENT(IN P_WORKER_ID int,
IN P_DEPARTMENT varchar (25))
BEGIN
    UPDATE WORKER 
    SET DEPARTMENT = P_DEPARTMENT
    WHERE WORKER_ID = P_WORKER_ID ;
END $$
DELIMITER ;
  # INVOKING THE PROCEDURE
-- UPDATE DEPATRMENT IT INTO HR;  
call update_department(102,'HR');  
SET SQL_SAFE_UPDATES  =0;
SELECT *FROM WORKER;
    
 -- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount.
--  It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter.
 -- Make procedure call.   
 
 # GET WORKER COUNT BY DEPARTMENT PROCREDURE
 DELIMITER $$
 CREATE Procedure GetWorker_countbyDepartment(IN P_Department VARCHAR (25),OUT P_Workercount INT)
 BEGIN
    SELECT COUNT(*) INTO P_Workercount FROM WORKER  WHERE
    Department=P_Department;
END $$
DELIMITER ;
# INVOKING THE  PROCEDURE
 -- Setting the OUT parameter
SET @workernumber=0;
-- Calling the procedure
CALL GetWorker_countbyDepartment('IT',@workernumber);
 -- Retrieving the OUT parameter
select @workernumber as IT_Department;
CALL GetWorker_countbyDepartment('accounts',@workernumber);

--  5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
--  It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary
 -- parameter and call the procedure.
 # AVERAGE SALARY BY DEPARTMENT PROCEDURE
  DELIMITER $$
  CREATE PROCEDURE AverageSalaryByDepartment(IN P_Department VARCHAR(25),OUT P_Avgsalary float)
  BEGIN
     SELECT AVG(Salary) INTO P_Avgsalary from worker
     where Department = P_Department;
 END $$
 DELIMITER ;
 # INVOKING THE PROCEDURE
 -- Setting the OUT parameter
 SET @avgsalary =0;

 -- Calling the procedure
 CALL AverageSalaryByDepartment('IT',@avgsalary);
 
 -- Retrieving the OUT parameter
    select @avgsalary as IT_avgsalary;
    
     ## Thank you
    
    
    