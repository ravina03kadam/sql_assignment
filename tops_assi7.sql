-- ASSIGNMENT 7
create database time;
use time;
create table emp_data(
Emp_id int,
Hire_date date,
Resignation_date date);

insert into emp_data (Emp_id,Hire_date,Resignation_date) values (1,'2000-01-01','2013-10-07');
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (2,'2003-12-04','2017-08-03');
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (3,'2012-09-22','2015-06-21');
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (4,'2015-04-13',NULL);
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (5,'2016-06-03',NULL);
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (6,'2017-08-08',NULL);
insert into emp_data (Emp_id,Hire_date,Resignation_date) values (7,'2016-11-13',NULL);

select * from emp_data;

-- 1)Find the date difference between the hire date and resignation_date for all the employees. Display in no.
-- of days, months and year(1 year 3 months 5 days). Emp_ID Hire Date Resignation_Date
-- 1 -- 1/1/2000 7/10/2013
-- 2 -- 4/12/2003 3/8/2017
-- 3  -- 22/9/2012 21/6/2015
-- 4  -- 13/4/2015 NULL
-- 5  -- 03/06/2016 NULL
-- 6  -- 08/08/2017 NULL
-- 7  -- 13/11/2016 NULL
select emp_id , datediff(resignation_date,hire_date)/365 as years,(datediff(resignation_date,hire_date)%365/30) as months,
datediff(resignation_date,hire_date)
 as days from emp_data;

-- 2)Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)
select date_format(hire_date,'%m%d%Y') as hire_date,
case
 when resignation_date  is null then '(DEC, 01th 1900)'
 when resignation_date is not null then date_format(resignation_date,'%M %D %Y')
 end as resignation_date
 from emp_data;
 
-- 3)Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)
select emp_id ,concat(coalesce(datediff(resignation_date,hire_date)/365,0),' ','years(s)',
abs(coalesce(datediff(resignation_date,hire_date)%365/30,0)),' ','months(s)') as experiance from emp_data;

-- 4) Display the count of days in the previous quarter
	select Datediff("2023-10-01","2023-07-01") as count_days_previous_quarter;
    
-- 5) Fetch the previous Quarter's second week's first day's date
	SELECT DATE_ADD(DATE_SUB("2023-10-01", INTERVAL 3 MONTH), INTERVAL 8 DAY) AS first_day_of_previous_quarter_second_week;
    
-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)
	SELECT DATE_FORMAT(DATE_ADD("2023-01-01", INTERVAL 15 WEEK), '%M %d %Y') AS first_day_of_financial_year_15th_week;
    
-- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with clause.
	With Last_saturday as (
		SELECT LAST_DAY(DATE_ADD("2015-01-01", INTERVAL (DAYOFWEEK("2015-01-01") - 1) DAY)) AS last_saturday_of_january
        )
    Select last_saturday_of_january from Last_saturday;    
	
   
    
    