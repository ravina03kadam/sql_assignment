create database exercies_9;
use exercies_9;
create table  cran_log_tbl(
date_value date,
time_value time,
size int,
r_version varchar(12),
r_arch varchar(12),
r_os varchar(12),
package varchar(30),
version varchar(20),
country char(2),
ip_id int );
select * from cran_log_tbl;

# database -> reverse engineer

-- 9.1 give the total number of recordings in this table
select count(*) as total_recordings from cran_log_tbl;
-- 9.2 the number of packages listed in this table?
-- select package from cran_log_tbl;
select count(distinct package) from cran_log_tbl;
-- 9.3 How many times the package "Rcpp" was downloaded?
select count(package) from cran_log_tbl where package ='Rcpp';
SELECT 
    COUNT(*)
FROM
    cran_log_tbl
WHERE
    package = 'Rcpp';
-- 9.4 How many recordings are from China ("CN")?
select count(country) from cran_log_tbl where country ='cn';
SELECT 
    COUNT(*)
FROM
    cran_log_tbl
WHERE
    country = 'CN';
-- 9.5 Give the package name and how many times they're downloaded. Order by the 2nd column descently.
select package,count(package) as times_to_download from cran_log_tbl group by package order by  2 DESC ;
SELECT 
    package, COUNT(*)
FROM
    cran_log_tbl
GROUP BY package
ORDER BY 2 DESC;
-- *9.6 Give the package ranking (based on how many times it was downloaded) during 9AM to 11AM

select a.package, count(*) 
from 
(select * from cran_log_tbl  
	where 
		substr(time_value, 1, 5)<"11:00" 
        and 
        substr(time_value, 1, 5)>"09:00")
as a
group by a.package 
order by 2 desc;
select * from cran_log_tbl where time_value<'11:00' order by time_value desc;
-- 9.7 How many recordings are from China ("CN") or Japan("JP") or Singapore ("SG")?
	select count(country)from cran_log_tbl where country in('CN','JP','SG');
    SELECT 
    COUNT(*)
FROM
    cran_log_tbl
WHERE
    country IN ('CN' , 'JP', 'SG');
-- *9.8 Print the countries whose downloaded are more than the downloads from China ("CN")
select country,count(country) from cran_log_tbl group by country having count(country) >count('cn');
SELECT 
    TEMP.country
FROM
    (SELECT 
        country, COUNT(*) AS downloads
    FROM
        cran_log_tbl
    GROUP BY country) AS TEMP
WHERE
    TEMP.downloads > (SELECT 
            COUNT(*)
        FROM
            cran_log_tbl
        WHERE
            country = 'CN');
-- *9.9 Print the average length of the package name of all the UNIQUE packages
select distinct(package), avg(size) from cran_log_tbl;
SELECT AVG(LENGTH(temp.packages)) 
FROM 
(
SELECT DISTINCT package as packages
	FROM cran_log_tbl
) temp;
select avg(length(package))from cran_log_tbl where package in( select distinct package from cran_log_tbl );
-- 9.10 Get the package whose downloading count ranks 2nd (print package name and it's download count).
SELECT temp.a package, temp.b count
FROM
(
SELECT package a, count(*) b
	FROM cran_log_tbl
	GROUP BY package
	ORDER BY b DESC
	LIMIT 2
) temp
ORDER BY temp.b ASC
LIMIT 1;

-- 9.11 Print the name of the package whose download count is bigger than 1000.
SELECT package
FROM cran_log_tbl
GROUP BY package
HAVING count(*) > 1000;

-- Solution 2 (with sub-query)
SELECT temp.package
FROM
(
SELECT package, COUNT(*) AS count
	FROM cran_log_tbl
	GROUP BY package
) AS temp
WHERE temp.count > 1000;

-- *9.12 The field "r_os" is the operating system of the users.
-- 	Here we would like to know what main system we have (ignore version number), the relevant counts, and the proportion (in percentage).
   SELECT SUBSTR(r_os, 1, 5) AS OS, 
	COUNT(*) AS Download, 
	SUBSTR(COUNT(*)/((SELECT COUNT(*) FROM cran_log_tbl)*1.0)*100, 1, 4) || "%" AS PROPORTION
FROM cran_log_tbl
GROUP BY SUBSTR(r_os, 1, 5);
