-- 1. View the order_details table
SELECT *
FROM order_details;

-- 2. What is the date range of the table?
SELECT *
FROM order_details;

-- 3. How many orders were made within this date range?
SELECT MIN(order_date), MAX(order_date), COUNT(DISTINCT order_id)
FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT MIN(order_date), MAX(order_date), COUNT(order_id)
FROM order_details;

-- 5. Which orders had the most number of items?
SELECT order_id, Count(item_id) as num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*)
FROM

(SELECT order_id, Count(order_id) as num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_order;
