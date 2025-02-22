## Sql Sales Retail Data Analysis

Create Database sql_project;
use sql_project;

-- Creating table

create table retail_sales 
( transactions_id int primary key,	
  sale_date	date,
  sale_time	time,
  customer_id int,
  gender varchar(20),
  age int,
  category varchar(20),
  quantiy int,
  price_per_unit float,
  cogs float,
  total_sale float );
  
  select * from retail_sales;

-- Data Cleaning  Looking for any NULL values in table

select * from retail_sales
where
transactions_id IS NULL 
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
age IS NULL
OR
category IS NULL
OR
quantiy IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;

-- Data Exploration

## How many sales we have?

select count(*) as total_sales from retail_sales;

## How many customers we have?

select count(customer_id) as sales from retail_sales;

## How many unique customers we have?

select count(DISTINCT customer_id) as total_customers from retail_sales;

## How many unique customers we have?

select count(DISTINCT category) as total_categories from retail_sales;

select DISTINCT category from retail_sales;

## Business Key Problems
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

-- 1)

select * from retail_sales
where
sale_date = '2022-11-05';

-- 2)

select * from retail_sales
where category = 'Clothing' and quantiy >= 2;

-- 3)

select category, SUM(total_sale) AS Net_sale ,
count(*) AS total_orders 
from retail_sales group by 1;

-- 4)

select AVG(age) as Average_age from retail_sales 
where category = 'Beauty';

-- 5)

select * from retail_sales
where total_sale > '1000';

-- 6)

select gender, category, count(*) as total_trans from retail_sales
group by gender, category ;

-- 7) 

select Year(sale_date), month(sale_date), AVG(total_sale) as sales_avg from retail_sales
group by 1, 2
order by 1, 3 desc;

-- 8)

select customer_id, SUM(total_sale) as total_sales from retail_sales
group by 1
order by 2 desc;

-- 9)

select category, count(distinct customer_id) as unique_customer from retail_sales
group by category;

-- 10)

with hourly_sales
As
(select *,
   CASE
       when hour(sale_time) < 12 then  'Morning'
       when hour(sale_time) between 12 and 17 then 'Afternoon'
       else 'Evening'
	end as SHIFT
from retail_sales)

select SHIFT, count(*) from hourly_sales
group by SHIFT;


----- END OF PROJECT ------










