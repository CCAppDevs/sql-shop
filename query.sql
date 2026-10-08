-- 1. What are all the products in the database?
-- SELECT product_name FROM products;

-- 2. What are all the customers in the database?
-- SELECT * FROM customers;

-- 3. What are all the orders in the database?
-- SELECT * FROM orders;

-- 4. What are the names and prices of all products?
-- SELECT product_name, price FROM products;

-- 5. What are the first names, last names, and cities of all customers?
-- SELECT 
--     first_name,
--     last_name,
--     city
-- FROM customers;

-- 6. What are all the products that are monitors?
-- SELECT * FROM products
-- WHERE category_id = 3;


-- 7. What are all the products that are laptops?
-- SELECT * FROM categories;

-- SELECT * FROM products
-- WHERE category_id = 1;

-- 8. What are all the products that cost more than $1,000?
-- SELECT product_name FROM products
-- WHERE price > 1000;

-- 9. What are all the products that cost less than $50?
-- SELECT * FROM products
-- WHERE price < 50
-- ORDER BY product_id ASC;

-- 10. What are all the products that have exactly 0 in stock?
-- SELECT * FROM products
-- WHERE stock_quantity = 0;


-- 11. What are all the products that are discontinued?
-- SELECT * FROM products
-- WHERE discontinued = 1;

-- 12. What are all the products that are currently available and have more than 20 items in stock?


-- 13. What are all the customers who live in Washington?


-- 14. What are all the customers who live in California?


-- 15. What are all the orders that have been delivered?


-- 16. What are all the orders that were placed after February 1, 2026?
-- 2024-01-25 01:15:05:00gmt
-- SELECT * FROM orders
-- WHERE 
--     (order_date BETWEEN '2026-02-01' AND '2026-02-05'
-- OR
--     order_date BETWEEN '2026-02-20' AND '2026-02-25')
-- AND
--     customer_id BETWEEN 20 AND 29
-- ORDER BY order_date DESC;


-- 17. What are all the products, sorted from lowest price to highest price?


-- 18. What are all the products, sorted from highest price to lowest price?


-- 19. What are all the customers, sorted alphabetically by last name?


-- 20. What are all the products, sorted by the amount of stock from highest to lowest?


-- 21. What are the 10 most expensive products?
-- SELECT product_name, price FROM products
-- ORDER BY price DESC, product_name ASC
-- LIMIT 11;

-- SELECT DISTINCT price FROM products
-- ORDER BY price DESC, product_name ASC
-- LIMIT 11;


-- 22. What are the 5 least expensive products?


-- 23. What are the 10 products with the most items in stock?


-- 24. What are the names of the products in the 5 most recently placed orders?
-- SELECT * FROM orders
-- INNER JOIN order_items ON orders.order_id = order_items.order_id
-- ORDER BY order_date DESC;

-- SELECT * FROM products limit 10;

-- 25. What are the 5 earliest orders in the database?


-- 26. What are the 5 most expensive monitors?


-- 27. What are the 5 least expensive laptops?


-- 28. What are the 10 least expensive products that are not discontinued?


-- 29. What are the 10 most expensive products that are currently in stock?


-- 30. What are the 5 most expensive products that have more than 10 items in stock?


-- 31. What are the product names and prices of products that cost more than $500?


-- 32. What are the names and stock quantities of products that have fewer than 10 items in stock?


-- 33. What are the names and prices of products that cost between $100 and $500?


-- 34. What are the first names and last names of customers who live in Texas?


-- 35. What are the names and prices of products that are monitors and cost less than $300?


-- 36. What are the names and prices of products that are laptops and cost more than $1,000?


-- 37. What are the names and prices of products that are either laptops or desktop computers?


-- 38. What are the names and prices of products that are either monitors or webcams?


-- 39. What are the names and prices of products that are not discontinued?


-- 40. What are the names and prices of products that are not monitors?


-- 41. What are the names and stock quantities of products that are not discontinued and have more than 20 items in stock?


-- 42. What are the names and prices of products that cost less than $100 or have more than 50 items in stock?


-- 43. What are the names and prices of products that are monitors or cost more than $1,500?


-- 44. What are the names and prices of products that are not discontinued and cost less than $50?


-- 45. What are the names, prices, and stock quantities of the 10 cheapest products?


-- 46. What are the product names and category IDs of the 15 products with the most stock?


-- 47. What are the first names, last names, and cities of the first 10 customers alphabetically by last name?


-- 48. What are the order IDs, order dates, and statuses of the 10 most recent orders?


-- 49. What are the names and prices of the 5 most expensive products that are not discontinued?


-- 50. What are the names and prices of the 10 cheapest products that are either monitors or keyboards?


-- Joins Exercises

-- INNER JOIN

-- 51. I want to know all orders and their customers

-- SELECT * FROM orders
-- INNER JOIN customers
-- ON orders.customer_id = customers.customer_id;

-- 52. I want to know all customers and their orders, sorted by customer_id

-- SELECT * FROM orders
-- INNER JOIN customers
-- ON orders.customer_id = customers.customer_id
-- ORDER BY orders.customer_id ASC;

-- INSERT INTO customers (
--     customer_id,
--     first_name,
--     last_name,
--     email,
--     city,
--     state
-- ) VALUES (
--     31, 'Jesse', 'Harlan', 'jesse@jesse.com', 'Centralia', 'WA'
-- );


-- 53. Which customers have 0 orders?
-- SELECT first_name, last_name FROM customers
-- LEFT JOIN orders ON customers.customer_id = orders.customer_id
-- WHERE orders.order_id IS NULL;

-- 54. I want to know all customers and all orders and I need 
-- it if they have no orders or the order has no customer

-- SELECT * FROM customers
-- FULL OUTER JOIN orders
-- ON customers.customer_id = orders.order_id;

-- 55. I want to know how many orders we have per customer?
-- SELECT count(*), * FROM orders
-- INNER JOIN customers ON customers.customer_id = orders.customer_id
-- GROUP BY customers.customer_id;

-- SELECT COUNT(*), * FROM customers
-- LEFT JOIN orders ON customers.customer_id = orders.customer_id
-- GROUP BY customers.customer_id
-- HAVING orders.order_id IS NOT NULL;


-- SELECT COUNT(*), * FROM customers
-- LEFT JOIN orders ON customers.customer_id = orders.customer_id
-- WHERE customers.customer_id > 10
-- GROUP BY customers.customer_id
-- HAVING orders.order_id IS NOT NULL;

-- SELECT COUNT(*) as num_orders, * FROM customers
-- LEFT JOIN orders ON customers.customer_id = orders.customer_id
-- GROUP BY customers.customer_id
-- HAVING num_orders < 2;




-- I want to know how much money each customer has spent 
-- over their lifetime and sort it from highest to lowest.

-- TABLES: customers, orders, order_items 

-- COLUMNS: first_name, last_name, qty, price

-- SORT HIGH TO LOW

--SELECT name FROM sqlite_master WHERE type='table';

-- SELECT
--     customers.first_name,
--     customers.last_name,
--     SUM(order_items.unit_price * order_items.quantity) AS lifetime_spent
-- FROM customers
-- LEFT JOIN orders ON customers.customer_id = orders.customer_id
-- LEFT JOIN order_items ON orders.order_id = order_items.order_id
-- GROUP BY customers.customer_id
-- ORDER BY lifetime_spent DESC;

-- 844.94 @ Maria Bennett

-- same three tables

-- I want to know what the average expenditure of all customers is.
-- SELECT
--     *,
--     AVG(order_items.unit_price * order_items.quantity) AS average_spent
-- FROM customers
-- LEFT JOIN orders ON customers.customer_id = orders.customer_id
-- LEFT JOIN order_items ON orders.order_id = order_items.order_id;

-- how many rows are in each table?
SELECT 'categories' AS table_name, COUNT(*) AS row_count FROM categories
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
ORDER BY row_count DESC;