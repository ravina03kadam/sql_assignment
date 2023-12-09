create database project;
use project;
create table pizza_sales(
pizza_id int primary key ,
order_id int ,
pizza_name_id varchar(100),
quantity int,
order_date date,
order_time time,
unit_price int,
pizza_size varchar(10),
pizza_category varchar(50),
pizza_ingredients varchar(100),
pizza_name varchar(100)
);
select * from pizza_sales;
-- 1. Total Revenue: The sum of the total price of all pizza orders
select round(sum(total_price),2)as Total_revenue from pizza_sales;

-- 2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.
select round(sum(total_price)/count(distinct(order_id)),2)as Average_amount from  pizza_sales;

-- 3. Total Pizzas Sold: The sum of the quantities of all pizza sold.
select sum(quantity)as Total_Quantity  from  pizza_sales;

-- 4. Total Orders: The total number of orders placed.
select count(distinct(order_id))as Total_orders from pizza_sales;

-- 5. Average Pizza Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total
-- number of orders
select round(sum(quantity)/count(distinct(order_id)),2)as Average from  pizza_sales;
