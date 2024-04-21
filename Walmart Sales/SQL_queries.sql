-- Create Database
CREATE DATABASE IF NOT EXISTS walmartSales;

-- Create Table
CREATE TABLE IF NOT EXISTS sales (
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

-- 												Feature Engineering

-- time_of_day
SELECT time, 
    (CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
        END
	) AS time_of_date
FROM sales;

-- Add time_of_day column
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- Update time_of_day column
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
);

-- day_name
SELECT date, DAYNAME(date)
FROM sales;

-- Add day_name column
ALTER TABLE sales ADD COLUMN day_name VARCHAR(20);

-- Update day_name column
UPDATE sales
SET day_name = DAYNAME(date);

-- month_name
SELECT date, MONTHNAME(date)
FROM sales;

-- Add month_name column
ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

-- Update month_name column
UPDATE sales
SET month_name = MONTHNAME(date);

-- 											Generic Questions

-- How many unique cities does the data have? (3)
SELECT DISTINCT city
FROM sales;

-- In which city is each branch?
SELECT DISTINCT city, branch
FROM sales;

-- 											Product Questions

-- How many unique product lines does the data have? (6)
SELECT COUNT(DISTINCT product_line)
FROM sales;

-- What is the most common payment method?
SELECT payment, COUNT(payment) AS count
FROM sales
GROUP BY payment
ORDER BY count DESC;

-- What is the most selling product line?
SELECT product_line, COUNT(product_line) AS count
FROM sales
GROUP BY product_line
ORDER BY count DESC;

-- What is the total revenue by month?
SELECT month_name, SUM(total) AS revenue
FROM sales
GROUP BY month_name
ORDER BY revenue DESC;

-- What month had the largest COGS?
SELECT month_name, SUM(cogs) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;

-- What product line had the largest revenue?
SELECT product_line, SUM(total) AS sum
FROM sales
GROUP BY product_line
ORDER BY sum DESC;

-- What is the city with the largest revenue?
SELECT city, SUM(total) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;

-- What product line had the largest VAT?
SELECT product_line, AVG(tax_pct) AS VAT 
FROM sales
GROUP BY product_line
ORDER BY VAT DESC;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

-- Which branch sold more products than average product sold?
SELECT branch, SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- What is the most common product line by gender?
SELECT gender, product_line, COUNT(gender) AS total_count
FROM sales
GROUP BY gender, product_line
ORDER BY total_count DESC;

-- What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- 									Sales Questions

-- Number of sales made in each time of the day per weekday
SELECT day_name, time_of_day, COUNT(*) as total_sales
FROM sales
GROUP BY time_of_day, day_name
ORDER BY total_sales DESC;

-- Which of the customer types brings the most revenue?
SELECT customer_type, ROUND(SUM(total), 2) AS revenue
FROM sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, ROUND(AVG(tax_pct), 2) AS VAT
FROM sales
GROUP BY city
ORDER BY VAT DESC;

-- Which customer type pays the most in VAT?
SELECT customer_type, ROUND(AVG(tax_pct), 2) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC;

-- 									Customer Question

-- How many unique customer types does the data have?
SELECT COUNT(DISTINCT(customer_type))
FROM sales;

-- How many unique payment methods does the data have?
SELECT COUNT(DISTINCT(payment))
FROM sales;

-- What is the most common customer type?
SELECT customer_type, COUNT(*) AS count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Which customer type buys the most?
SELECT customer_type, ROUND(SUM(total), 2) AS revenue
FROM sales
GROUP BY customer_type
ORDER BY revenue DESC;

-- What is the gender of most of the customers?
SELECT gender, COUNT(*) AS count
FROM sales
GROUP BY gender
ORDER BY count DESC;

-- What is the gender distribution per branch?
SELECT gender, branch, COUNT(*) AS count
FROM sales
GROUP BY gender, branch
ORDER BY count DESC;

-- Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which time of the day do customers give most ratings per branch?
SELECT time_of_day, branch, AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day, branch
ORDER BY avg_rating DESC;

-- Which day of the week has the best avg ratings?
SELECT day_name, ROUND(AVG(rating), 3) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC;

-- Which day of the week has the best average ratings per branch?
SELECT day_name, branch, ROUND(AVG(rating), 3) AS avg_rating
FROM sales
GROUP BY day_name, branch
ORDER BY avg_rating DESC;













