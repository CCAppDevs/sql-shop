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


-- 11. What are all the products that are discontinued?


-- 12. What are all the products that are currently available and have more than 20 items in stock?


-- 13. What are all the customers who live in Washington?


-- 14. What are all the customers who live in California?


-- 15. What are all the orders that have been delivered?


-- 16. What are all the orders that were placed after February 1, 2026?


-- 17. What are all the products, sorted from lowest price to highest price?


-- 18. What are all the products, sorted from highest price to lowest price?


-- 19. What are all the customers, sorted alphabetically by last name?


-- 20. What are all the products, sorted by the amount of stock from highest to lowest?


-- 21. What are the 10 most expensive products?


-- 22. What are the 5 least expensive products?


-- 23. What are the 10 products with the most items in stock?


-- 24. What are the 5 most recently placed orders?


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