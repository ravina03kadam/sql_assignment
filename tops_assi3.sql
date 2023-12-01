-- ASSIGNMENT 3
use hrdb;
-- 1.Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all 
-- other letters lowercase, Give each column an appropriate label.
select last_name,concat(upper(left(substr(last_name,2,5),1)),lower(right(substr(last_name,2,5),2)))"Last Name" from employees;

-- 2.Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram;
--  last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.
select concat_ws('-',first_name,last_name) "Employee Name",monthname(start_date) "Joined Month" from employees join job_history;

-- *3.Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by
-- 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.
select last_name,
case
	when (salary/2) > 10000 then (salary*0.1)+1500
    else (salary*0.115)+1500
end "Salary With Bonus"    
from employees;

-- 4.Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case,
-- if the Manager name consists of 'z' replace it with '$!
select concat(substring(e.employee_id,1,2),"E") "Employee id" , e.department_id,e.salary,
replace(concat(m.first_name,' ',m.last_name),'z','$') "Manager Name"
from employees e
LEFT OUTER JOIN employees m
       ON e.manager_id = m.employee_id;

-- 5.Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase,
-- and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label.
-- Sort the results by the employees' last names
select CONCAT(UPPER(SUBSTRING(last_name,1,1)),LOWER(SUBSTRING(last_name,2))) "Name", length(last_name) "Length of Name"
from employees
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
order by last_name;

-- 6.Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $.
-- Label the column SALARY
select last_name,lpad(salary,15,'$') as SALARY from employees;

-- *7.Display the employee's name if it is a palindrome
select first_name from employees where reverse(first_name)=first_name;

-- 8.Display First names of all employees with initcaps.
select CONCAT(UPPER(SUBSTRING(first_name,1,1)),LOWER(SUBSTRING(first_name,2))) "First Name" from employees;

-- *9.From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.
select street_address,substr(street_address,locate(" ",street_address)+1,locate(" ",street_address,
locate(" ",street_address)+1)-locate(" ",street_address)) "Word" from locations;

-- 10.Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. 
-- Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.
select first_name,concat(lower(substring(first_name,1,1)),lower(last_name),'@systechusa.com') "Email Address" from employees;

-- *11.Display the names and job titles of all employees with the same job as Trenna.
select concat(e.first_name,' ',e.last_name) "Full Name",j.job_title from employees e join jobs j where j.job_id='st_clerk';

-- *12.Display the names and department name of all employees working in the same city as Trenna.
select concat(e.first_name,' ',e.last_name) "Full Name",d.department_name
from employees e 
inner join departments d
	on e.department_id=d.department_id
inner join locations l
	on d.location_id=l.location_id
where city in('London','Roma','Venice','Tokyo','Hiroshima','Southlake','South San Francisco','South Brunswick','Seattle','Toronto',
'Whitehorse','Beijing','Bombay','Sydney','Singapore','London','Oxford','Stretford','Munich','Sao Paulo','Geneva','Bern','Utrecht','Mexico City');

-- 13.Display the name of the employee whose salary is the lowest.
select concat(first_name,' ',last_name) "Employee Name",min(Salary) as Salary from employees;

-- 14.Display the names of all employees except the lowest paid.
select concat(first_name,' ',last_name) "Employee Name",Salary from employees where salary!=2100 order by 1;

