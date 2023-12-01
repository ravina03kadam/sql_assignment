
-- Q1 Write an SQL query to print all Worker details from the Worker table order
# by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker order by first_name ,department desc; 

#Q2 Write an SQL query to print details for Workers with the
# first names “Vipul” and “Satish” from the Worker table.
select * from worker where first_name ='vipul' and 'satish';

#Q3 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
select * from worker where first_name like '_____h';

#Q4 Write an SQL query to print details of the Workers whose SALARY lies between 1. 
select * from worker where salary <100000;

#Q5  Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT Worker_id, COUNT(Worker_id)
FROM worker
GROUP BY worker_id
HAVING COUNT(worker_id) > 1;

#Q6 Write an SQL query to show the top 6 records of a table. 
select * from worker limit 6;

#Q7 Write an SQL query to fetch the departments that have less than five people in them. 
select count(first_name),first_name from worker  group by department having  count(first_name)<5;

#Q8  Write an SQL query to show all departments along with the number of people in there. 
 SELECT department, COUNT(*)
  FROM worker
  GROUP BY department;

#9 Write an SQL query to print the name of employees having the highest salary in each department.
select first_name from worker group by department order by salary desc limit 1;
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- --------------------------------------------school database-------------------------------------------------
create database school;
use school;
drop table student;
create table student (
 stdid int primary key,
 stdName varchar(50) not null,
 sex varchar(20) not null,
 percentage decimal,
 class int ,
 sec char(1) ,
 stream varchar(100),
 DOB date
);
insert into student values
(1001,"Surekha joshi","female",82,12,"A","science","1998-08-03"),
(1002,"Maahi Agarwal","female",56,11,"c","commerce","2008-11-23"),
(1003,"Rohit pulkit","male",59,11,"c","commerce","2006-6-29"),
(1004,"sanam verma","male",63,11,"c","commerce","1997-05-11"),
(1005,"Dipesh puri","male",78,11,'B','science',"2003-09-14"),
(1006,'sanam kumar','female',60,11,'B','commerce',"2008-07-11"),
(1007,'Sahil Saras','male',23,12,'F','commerce',"1998-08-03"),
(1008,'Akshra Agarwal','male',56,11,'c','commerce',"2008-07-11"),
(1009,'Stuti Mishra','female',72,12,'B','commerce',"1996-01-10"),
(1010,'sanam verma','female',39,11,'F','science',"2008-11-23"),
(1011,'Harsh Agarwal','male',42,11,'c','science',"1998-08-03"),
(1012,'Nikunj Agarwal','male',49,12,'c','commerce',"1998-06-28"),
(1013,'Akriti Saxena','female',89,12,'A','science',"2008-11-23"),
(1014,'Tani Rastogi','female',82,12,'A','science',"2008-11-23")
;
-- Q 1 To display all the records form STUDENT table. 
SELECT * FROM student ; 
-- Q2. To display any name and date of birth from the table STUDENT.
 SELECT StdName, DOB 
FROM student ; 
-- Q3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM student WHERE percentage >= 80; 
-- Q4. To display student name, stream and percentage where percentage of student is more than 80 
SELECT StdName, Stream, Percentage from student WHERE percentage > 80; 
-- Q5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT * From student WHERE stream = ‘Science’ AND percentage > 75;
