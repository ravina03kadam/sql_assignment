 -- ASSIGNMENT 6
 -- HR DB
-- 1.Write a query to display the last name and hire date of any employee in the same department as SALES.
select last_name,hire_date,department_name from employees join departments where department_name = 'sales';

-- 2.Create a query to display the employee numbers and last names of all employees who earn more than the average salary.
 -- Sort the results in ascending order of salary.
select employee_id,last_name,salary from employees where salary > (select avg(salary) from employees) order by salary;

-- 3.Write a query that displays the employee numbers and last names of all employees who work in a department with any
-- employee whose last name contains a' u
select employee_id,last_name from employees where department_id in (select department_id from employees where last_name like '%u%');

-- 4.Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
select last_name,department_id,job_id from employees where department_id in (select department_id from departments where location_id=1700);

-- 5.Display the last name and salary of every employee who reports to FILLMORE.
select last_name,salary from employees where manager_id in (select employee_id from employees where last_name ="fillmore");
select employee_id,salary,manager_id from employees where last_name = "fillmore";

-- 6.Display the department number, last name, and job ID for every employee in the OPERATIONS department.
select department_id,last_name,job_id from employees where department_id in
(select department_id from departments where department_name = "operations");

select * from departments;
select employees.department_id,employees.job_id,employees.last_name,departments.department_name from employees 
join departments
on employees.department_id = departments.department_id
where departments.department_name = 'Operations';

-- 7.Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average
-- salary and who work in a department with any employee with a 'u'in their name.
select employee_id,last_name,salary ,avg(salary) from employees where employee_id group by employee_id in (select department_id,department_name
from departments where department_name like '%a' or  department_name like '%u');

select employee_id,last_name,salary from employees
where department_id in (select department_id from employees where last_name like "%u%") and salary > (select avg(salary) from employees);

-- .Display the names of all employees whose job title is the same as anyone in the sales dept.

-- 9.Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries.
-- Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.
select employee_id,salary,(salary*0.05) "pay raise",department_id from employees where department_id in (10,30)
union all
select employee_id,salary,(salary*0.1) "pay raise" ,department_id from employees where department_id=20
union all
select employee_id,salary,(salary*0.15) "pay raise" ,department_id from employees where department_id in (40,50);

-- 10.Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
select employee_id, last_name ,salary,max(salary) from employees group by employee_id limit 3;

-- 11.Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the
-- commission column
select concat(first_name,' ',last_name) as 'full name',salary,commission_pct from employees where commission_pct is null;
select concat(first_name,' ',last_name) "Full Name",salary,coalesce(commission_pct,0) from employees;

-- 12.Display the Managers (name) with top three salaries along with their salaries and department information.
 select distinct e.salary,concat(e.first_name,' ',e.last_name) "Manager Name",e.department_id,d.department_name,d.manager_id 
from employees e join employees m join departments d on d.manager_id = e.manager_id
where m.manager_id=e.employee_id ;
 select * from employees;