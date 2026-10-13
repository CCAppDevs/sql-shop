-- ============================================================
-- Homework 1: Querying the Shop Database (SQLite) - ANSWER KEY
--
-- Every query below was run against shop.db and returns the row
-- count listed in its prompt. Other correct solutions are
-- possible (for example, different table aliases or an
-- equivalent WHERE clause).
-- ============================================================


-- 1. Which customers live in Washington (WA) or Oregon (OR)?
--    Show their first name, last name, city, and state, sorted
--    alphabetically by last name (A to Z). (11 rows)

SELECT first_name, last_name, city, state
FROM customers
WHERE state = 'WA' OR state = 'OR'
ORDER BY last_name ASC;


-- 2. Which products are completely out of stock (0 in stock) but have
--    NOT been discontinued? Show the product name and price, with the
--    most expensive product first. If two products have the same
--    price, sort them alphabetically by name. (29 rows)

SELECT product_name, price
FROM products
WHERE stock_quantity = 0
  AND NOT discontinued = 1
ORDER BY price DESC, product_name ASC;

-- Also correct: WHERE stock_quantity = 0 AND discontinued = 0


-- 3. What are the 5 cheapest products that we can sell right now?
--    A product can be sold if it is not discontinued AND has at
--    least 1 item in stock. Show the product name, price, and stock
--    quantity. Several products share the same price, so break ties
--    by sorting the product name alphabetically. (5 rows)

SELECT product_name, price, stock_quantity
FROM products
WHERE discontinued = 0
  AND stock_quantity > 0
ORDER BY price ASC, product_name ASC
LIMIT 5;


-- 4. Which orders have a status of 'Pending' or 'Processing' AND were
--    placed on or after June 1, 2026? Show all columns from the orders
--    table, newest orders first.
--    Hint: think carefully about how AND and OR are evaluated. (14 rows)

SELECT *
FROM orders
WHERE (status = 'Pending' OR status = 'Processing')
  AND order_date >= '2026-06-01'
ORDER BY order_date DESC;

-- Common mistake: leaving out the parentheses. AND is evaluated
-- before OR, so the query below returns 17 rows because it also
-- includes Pending orders from before June 1:
--   WHERE status = 'Pending' OR status = 'Processing' AND order_date >= '2026-06-01'


-- 5. Which products in the 'Monitors' category cost more than $300?
--    Show the product name and price, from most expensive to least
--    expensive. (9 rows)

SELECT products.product_name, products.price
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE categories.category_name = 'Monitors'
  AND products.price > 300
ORDER BY products.price DESC;


-- 6. Which orders were 'Cancelled', and who placed them? Show the
--    order ID, order date, and the customer's first and last name,
--    from the oldest order to the newest. (7 rows)

SELECT orders.order_id, orders.order_date, customers.first_name, customers.last_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id
WHERE orders.status = 'Cancelled'
ORDER BY orders.order_date ASC;


-- 7. Which customers have never placed an order? Show their first
--    name, last name, and state, sorted by last name and then by
--    first name. (18 rows)

SELECT customers.first_name, customers.last_name, customers.state
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL
ORDER BY customers.last_name ASC, customers.first_name ASC;


-- 8. Which discontinued products have never been ordered by anyone?
--    Show the product name and stock quantity, sorted alphabetically
--    by product name. (39 rows)

SELECT products.product_name, products.stock_quantity
FROM products
LEFT JOIN order_items ON products.product_id = order_items.product_id
WHERE order_items.order_item_id IS NULL
  AND products.discontinued = 1
ORDER BY products.product_name ASC;


-- 9. For orders with a status of 'Shipped', which order items had a
--    quantity greater than 1? Show the order ID, order date, product
--    name, and quantity. Sort by order date (newest first), and then
--    by product name (A to Z). (9 rows)

SELECT orders.order_id, orders.order_date, products.product_name, order_items.quantity
FROM orders
INNER JOIN order_items ON orders.order_id = order_items.order_id
INNER JOIN products ON order_items.product_id = products.product_id
WHERE orders.status = 'Shipped'
  AND order_items.quantity > 1
ORDER BY orders.order_date DESC, products.product_name ASC;


-- 10. What are the 10 most expensive items (by the unit price paid)
--     that appear in 'Delivered' orders? Show the product name, the
--     unit price from the order, and the order date. Sort by unit
--     price from highest to lowest, breaking ties by the earliest
--     order date. (10 rows)

SELECT products.product_name, order_items.unit_price, orders.order_date
FROM order_items
INNER JOIN products ON order_items.product_id = products.product_id
INNER JOIN orders ON order_items.order_id = orders.order_id
WHERE orders.status = 'Delivered'
ORDER BY order_items.unit_price DESC, orders.order_date ASC
LIMIT 10;
