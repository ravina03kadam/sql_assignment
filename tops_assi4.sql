-- ASSIGNMENT 4
-- 1.Write a query to display the last name, department number, department name for all employees.
select employees.last_name ,departments.department_id,departments.department_name from employees
join departments
on employees.department_id = departments.department_id;

-- 2.Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
select distinct(jobs.job_title),departments.location_id from jobs 
join departments 
on jobs.job_id =  departments.department_id;

-- *3.Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
select e.last_name, d.department_name, d.location_id, l.city from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and e.commission_pct is not null;

-- 4.Display the employee last name and department name of all employees who have an 'a' in their last name
select employees.last_name,departments.department_name from employees
join departments
on employees.department_id = departments.department_id
having employees.last_name  like '%a' ;

-- 5.Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.
select e.last_name,j.job_title,	d.department_name from employees e
join departments d
on e.department_id = d.department_id
join jobs j
on j.job_id = e.job_id;
-- 2
select 	e.last_name, e.job_id, e.department_id,d.department_name from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id where l.city = 'atlanta';

-- 6.Display the employee last name and employee number along with their manager's last name and manager number.
select e.last_name 'EMP_Name',e.employee_id 'EMP_id',m.last_name 'Manager_Name',m.employee_id 'Manager_id'
from employees e join employees m on e.employee_id=m.manager_id; 

-- 7.Display the employee last name and employee number along with their manager's last name and manager number
-- (including the employees who have no manager).
select e.last_name 'EMP_Name',e.employee_id 'EMP_id',m.last_name 'Manager_Name',m.employee_id 'Manager_id'
from employees e left outer join employees m on e.employee_id=m.manager_id; 

-- 8.Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.
select e.department_id 'Department_number',e.last_name 'Employee',s.last_name 'Other_Emp' from employees e join employees s
on e.department_id=s.department_id  where e.employee_id <> s.employee_id order by 2,1,3;

-- 9.Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on 
-- salary(>=50000=A, >=30000=B,<30000=C)
SELECT  employees.first_name,employees.salary,departments.department_name,jobs.job_title,
case
when salary >= 5000 then 'A' 
when salary >= 3000 then 'B'
when salary <= 3000 then 'C'
else
'salary'
end as 'GRADE'
 FROM employees 
  join jobs 
     on jobs.job_id = employees.job_id
   JOIN departments
     ON employees.department_id = employees.department_id;
     

-- 10.Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date.
-- Label the columns as Employee name, emp_hire_date,manager name,man_hire_date
select concat(first_name,' ','last_name')as 'emplyee name' ,hire_date as emp_hire_date,concat(manager_id,' - ',hire_date)as man_hire_date
from employees;