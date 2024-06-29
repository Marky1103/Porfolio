
-- 1. Combine the menu_items and order_details table into a single table.
SELECT *
FROM order_details as od
JOIN menu_items as mi 
	ON od.item_id = mi.menu_item_id;

-- 2. What were the least and most ordered items? What categories were they in?
SELECT item_id, COUNT(*) as num_items, category
FROM order_details as od
JOIN menu_items as mi 
	ON od.item_id = mi.menu_item_id
GROUP BY item_id
ORDER BY num_items;

SELECT item_id, COUNT(*) as num_items, category
FROM order_details as od
JOIN menu_items as mi 
	ON od.item_id = mi.menu_item_id
GROUP BY item_id
ORDER BY num_items DESC;

-- 3. What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) as total
FROM order_details as od
JOIN menu_items as mi 
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER By total DESC
LIMIT 5;

-- 4. View the details of the highest spend order. What insights can you gather?
	-- Spends a lot on Italian.
SELECT category, COUNT(item_id) AS num_items
FROM order_details as od
JOIN menu_items as mi 
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- 5. View the details of the top 5 highest spend orders. What insights can you gather?
	-- The top 5 highest orders spend a lot on Italian food.

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details as od
JOIN menu_items as mi 
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075, 1957,330,2675)
GROUP BY order_id, category;