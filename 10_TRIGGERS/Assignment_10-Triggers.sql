# 10-Triggers
 
 ## 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.
--  2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative”
-- if the salary inserted to the table is less than zero.  
-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action
--  timestamp to a table called teacher_log when a new entry gets inserted to the teacher table.
-- tecaher_id -> column of teacher table, action -> the trigger action,
-- timestamp -> time at which the new row has got inserted.
-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience
-- greater than 10 years. 
-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
Use product; 
-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows.

Create table Teachers (ID INT primary key ,Name varchar (50),Subject varchar (50),Experience INT ,Salary Decimal(10,2)) ;
Insert into Teachers (ID,Name,subject,experience,salary)
values(1,'Soosan','Maths',10,53000),(2,'Praveen','Physics',8,50000),
(3,'Vikram Mehtha','History',14,53000),(4,'Gouthami','Malayalam',07,50000),
(5,'Manoj Kumar','Biology',11,53000),(6,'Parvathi Krisna','Chemistry',08,50000),
(7,'Lthika','Geography',14,55000),(8,'Gopan','English',09,50000) ;

select * from teachers;
--  2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative”
--  if the salary inserted to the table is less than zero.  
DELIMITER $$
CREATE TRIGGER before_insert_Teacher
BEFORE INSERT ON Teachers
FOR EACH ROW 
BEGIN
    IF NEW.SALARY < 0 THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ' Salary cannot be negative ';
    END IF;
END $$
DELIMITER ;
insert into teachers(ID,Name,subject,experience,salary)values(18,'David','sports',5,-25000);
DROP  TRIGGER  before_insert_Teacher ;
-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action

CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);
DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'insert', NOW());
END $$
DELIMITER ;
insert into teachers(ID,Name,subject,experience,salary)values(11,'David','sports',5,25000);
SELECT * FROM TEACHER_LOG;

-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience
-- greater than 10 years.
DELIMITER $$
CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END$$
DELIMITER ;
DELETE from Teachers where experience=14;
set sql_safe_updates=0;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
Use product; 
DELIMITER $$
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'delete', NOW());
END $$

DELETE from Teachers where experience=8;
SELECT * FROM TEACHER_LOG;




