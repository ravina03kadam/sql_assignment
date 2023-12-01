-- ASSIGNMENT 2
-- 1)Display the maximum, minimum and average salary and commission earned.
select min(salary),max(salary),avg(salary),avg(commission_pct) from employees;

-- 2)Display the department number, total salary payout and total commission payout for each department.
select department_id,sum(salary),sum(commission_pct) from employees group by department_id;

-- 3)Display the department number and number of employees in each department.
select department_id,count(employee_id) from employees group by department_id;

-- 4)Display the department number and total salary of employees in each department.
select department_id,sum(salary) from employees group by department_id;

-- 5)Display the employee's name who doesn't earn a commission. Order the result set without using the column name
select first_name,last_name,commission_pct from employees where commission_pct is null order by 1;

-- 6)Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'.
-- Name the columns appropriately
select first_name,last_name,department_id,commission_pct is null as 'no commission' from employees ;

-- 7)Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, 
-- then display as 'No commission. Name the columns appropriately
select department_id,first_name,commission_pct * 2 from employees;

-- *8)Display the employee's name, department id who have the first name same as another employee in the same department
select e.first_name,e.last_name,e.department_id,count(*) from emp_details_view
group by e.department_id,e.first_name
having count(*) > 1;

-- 9)Display the sum of salaries of the employees working under each Manager.
select sum(salary),manager_id from employees group by manager_id;

-- 10)Select the Managers name, the count of employees working under and the department ID of the manager.
select e1 employee_id,e1 first_name,e1 last_name,count(*) as total_employee
from employees e1, employees e2
where e1.employee = e2.manager_id
group by e1.employee_id;

-- *11)Select the employee name, department id, and the salary. Group the result with the manager name and the
-- employee last name should have second letter 'a!
select first_name,last_name,department_id,salary from employees where last_name like '_a%' group by manager_id ; 

-- 12)Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.
select department_id, sum(salary) from employees group by department_id order by 1;

-- 13)Select the maximum salary of each department along with the department id
select d.department_id,d.department_name,max(e.salary) as max_salary from employees e join departments d group by d.department_id;

-- *14)Display the commission, if not null display 10% of salary, if null display a default value 1
select commission_pct,
case 
	when commission_pct>0 then salary*0.1
    else 1
end as cm_salary    
from employees;
