-- ASSIGNMENT 3
create database warehouse;
use warehouse; 
CREATE TABLE Warehouses (
   Code INTEGER NOT NULL,
   Location VARCHAR(255) NOT NULL ,
   Capacity INTEGER NOT NULL,
   PRIMARY KEY (Code)
 );
CREATE TABLE Boxes (
    Code CHAR(4) NOT NULL,
    Contents VARCHAR(255) NOT NULL ,
    Value REAL NOT NULL ,
    Warehouse INTEGER NOT NULL,
    PRIMARY KEY (Code),
    FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
 ) ENGINE=INNODB;
 
  INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);
 
-- 3.1 Select all warehouses.
select * from warehouses;

-- 3.2 Select all boxes with a value larger than $150.
select * from boxes where value > 150;

-- 3.3 Select all distinct contents in all the boxes.
select distinct contents  from boxes;

-- 3.4 Select the average value of all the boxes.
select avg(value) from boxes;	

-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.
select warehouse, avg(value) from boxes group by warehouse;

-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
select value from boxes where value > 150 in (select avg(value) from boxes);

select warehouse, avg(value) 
from boxes 
group by warehouse
having avg(value)> 150;

-- 3.7 Select the code of each box, along with the name of the city the box is located in.
select boxes.code,warehouses.location
from boxes 
inner join warehouses
on boxes.code = warehouses.code;

-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
select warehouse,count(*) from boxes group by warehouse;

-- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).

-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
create view saturated_warehouse as
 (select warehouses.code,count(*),capacity from boxes join warehouses
on boxes.warehouse = warehouses.code
group by warehouses.code
having count(*) > capacity);

-- 3.10 Select the codes of all the boxes located in Chicago.
select boxes.code
from boxes join warehouses
on boxes.warehouse = warehouses.code
where warehouses.location = 'chicago';

-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes.
insert into warehouses values (6,'New york',3);

-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
insert into boxes values('HSRT','papers','200',2);
-- 3.13 Reduce the value of all boxes by 15%.
update boxes set value= value * 15;

-- 3.14 Remove all boxes with a value lower than $100.
delete from boxes where value < 100;

-- 3.15 Remove all boxes from saturated warehouses.
 delete from boxes
 where warehouse in(select code from saturated_warehouse);

-- 3.16 Add Index for column "Warehouse" in table "boxes"
create index index_warehouses on boxes(warehouse);

-- !!!NOTE!!!: index should NOT be used on small tables in practice.
    
-- 3.17 Print all the existing indexes
SHOW INDEX FROM Boxes FROM 
Exercise_DB2;

-- !!!NOTE!!!: index should NOT be used on small tables in practice
-- 3.18 Remove (drop) the index you added just


    -- !!!NOTE!!!: index should NOT be used on small tables in practice
    
    
