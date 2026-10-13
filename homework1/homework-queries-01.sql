-- ============================================================
-- Homework 1: Querying the Shop Database (SQLite)
--
-- Tables: categories, products, customers, orders, order_items
--
-- Instructions:
--   * Write ONE query under each prompt.
--   * The row count in parentheses is how many rows your query
--     should return. Use it to check your work.
--   * Only show the columns the prompt asks for.
--   * These are read-only questions. Do NOT use INSERT, UPDATE,
--     DELETE, or DROP.
--
-- Hints:
--   * In the products table, discontinued = 1 means the product
--     is discontinued and discontinued = 0 means it is still sold.
--   * Dates are stored as text in 'YYYY-MM-DD' format, so they can
--     be compared with =, <, >, <=, and >=.
--   * When a question uses a category name (like 'Monitors'),
--     use the category name, not a hard-coded category_id.
-- ============================================================


-- 1. Which customers live in Washington (WA) or Oregon (OR)?
--    Show their first name, last name, city, and state, sorted
--    alphabetically by last name (A to Z). (11 rows)



-- 2. Which products are completely out of stock (0 in stock) but have
--    NOT been discontinued? Show the product name and price, with the
--    most expensive product first. If two products have the same
--    price, sort them alphabetically by name. (29 rows)



-- 3. What are the 5 cheapest products that we can sell right now?
--    A product can be sold if it is not discontinued AND has at
--    least 1 item in stock. Show the product name, price, and stock
--    quantity. Several products share the same price, so break ties
--    by sorting the product name alphabetically. (5 rows)



-- 4. Which orders have a status of 'Pending' or 'Processing' AND were
--    placed on or after June 1, 2026? Show all columns from the orders
--    table, newest orders first.
--    Hint: think carefully about how AND and OR are evaluated. (14 rows)



-- 5. Which products in the 'Monitors' category cost more than $300?
--    Show the product name and price, from most expensive to least
--    expensive. (9 rows)



-- 6. Which orders were 'Cancelled', and who placed them? Show the
--    order ID, order date, and the customer's first and last name,
--    from the oldest order to the newest. (7 rows)



-- 7. Which customers have never placed an order? Show their first
--    name, last name, and state, sorted by last name and then by
--    first name. (18 rows)



-- 8. Which discontinued products have never been ordered by anyone?
--    Show the product name and stock quantity, sorted alphabetically
--    by product name. (39 rows)



-- 9. For orders with a status of 'Shipped', which order items had a
--    quantity greater than 1? Show the order ID, order date, product
--    name, and quantity. Sort by order date (newest first), and then
--    by product name (A to Z). (9 rows)



-- 10. What are the 10 most expensive items (by the unit price paid)
--     that appear in 'Delivered' orders? Show the product name, the
--     unit price from the order, and the order date. Sort by unit
--     price from highest to lowest, breaking ties by the earliest
--     order date. (10 rows)


