-- ============================================================
-- Introductory SQL Test Database
-- SQLite-compatible
--
-- Tables:
--   categories
--   products
--   customers
--   orders
--   order_items
--
-- 200 products are included.
-- ============================================================

PRAGMA foreign_keys = ON;

-- ------------------------------------------------------------
-- Remove existing tables so the script can be run repeatedly.
-- ------------------------------------------------------------

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS categories;


-- ============================================================
-- CATEGORIES
-- ============================================================

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE,
    description TEXT
);


INSERT INTO categories (category_id, category_name, description) VALUES
(1, 'Laptops', 'Portable computers for work, school, and personal use'),
(2, 'Desktop Computers', 'Desktop computers and workstations'),
(3, 'Monitors', 'Computer monitors and displays'),
(4, 'Keyboards', 'Computer keyboards'),
(5, 'Mice', 'Computer mice and pointing devices'),
(6, 'Headphones', 'Headphones and headsets'),
(7, 'Storage', 'Hard drives, SSDs, and storage devices'),
(8, 'Networking', 'Routers, switches, and networking equipment'),
(9, 'Accessories', 'Computer cables, adapters, and accessories'),
(10, 'Webcams', 'Webcams and video conferencing equipment');


-- ============================================================
-- PRODUCTS
-- Exactly 200 products
-- ============================================================

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    price REAL NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    discontinued INTEGER NOT NULL DEFAULT 0 CHECK (discontinued IN (0, 1)),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


INSERT INTO products
    (product_id, product_name, category_id, price, stock_quantity, discontinued)
VALUES

-- ------------------------------------------------------------
-- Laptops (1-20)
-- ------------------------------------------------------------

(1, 'Aspire 14 Laptop', 1, 549.99, 24, 0),
(2, 'Aspire 15 Laptop', 1, 599.99, 18, 0),
(3, 'ProBook 13 Laptop', 1, 749.99, 12, 0),
(4, 'ProBook 14 Laptop', 1, 799.99, 15, 0),
(5, 'ProBook 15 Laptop', 1, 849.99, 9, 0),
(6, 'UltraBook 13 Laptop', 1, 899.99, 11, 0),
(7, 'UltraBook 14 Laptop', 1, 949.99, 8, 0),
(8, 'UltraBook 15 Laptop', 1, 999.99, 14, 0),
(9, 'StudentBook 13 Laptop', 1, 429.99, 31, 0),
(10, 'StudentBook 15 Laptop', 1, 479.99, 27, 0),
(11, 'WorkMate 14 Laptop', 1, 679.99, 16, 0),
(12, 'WorkMate 15 Laptop', 1, 729.99, 13, 0),
(13, 'Creator 14 Laptop', 1, 1099.99, 7, 0),
(14, 'Creator 16 Laptop', 1, 1299.99, 6, 0),
(15, 'GamePro 15 Laptop', 1, 1199.99, 10, 0),
(16, 'GamePro 17 Laptop', 1, 1499.99, 5, 0),
(17, 'TravelMate 12 Laptop', 1, 699.99, 19, 0),
(18, 'TravelMate 14 Laptop', 1, 799.99, 17, 0),
(19, 'Classic 15 Laptop', 1, 499.99, 22, 1),
(20, 'Classic 17 Laptop', 1, 579.99, 4, 1),

-- ------------------------------------------------------------
-- Desktop Computers (21-40)
-- ------------------------------------------------------------

(21, 'Office Tower A1', 2, 649.99, 14, 0),
(22, 'Office Tower A2', 2, 749.99, 11, 0),
(23, 'Office Tower A3', 2, 849.99, 9, 0),
(24, 'Office Tower B1', 2, 899.99, 7, 0),
(25, 'Office Tower B2', 2, 999.99, 6, 0),
(26, 'Office Tower B3', 2, 1099.99, 8, 0),
(27, 'Home Desktop 100', 2, 549.99, 16, 0),
(28, 'Home Desktop 200', 2, 649.99, 13, 0),
(29, 'Home Desktop 300', 2, 749.99, 12, 0),
(30, 'Home Desktop 400', 2, 849.99, 10, 0),
(31, 'Creator Station 1', 2, 1299.99, 5, 0),
(32, 'Creator Station 2', 2, 1599.99, 4, 0),
(33, 'Creator Station 3', 2, 1899.99, 3, 0),
(34, 'Game Station 100', 2, 1199.99, 8, 0),
(35, 'Game Station 200', 2, 1499.99, 7, 0),
(36, 'Game Station 300', 2, 1999.99, 3, 0),
(37, 'Mini Desktop 10', 2, 399.99, 18, 0),
(38, 'Mini Desktop 20', 2, 499.99, 15, 0),
(39, 'Mini Desktop 30', 2, 599.99, 12, 0),
(40, 'Legacy Tower 500', 2, 449.99, 2, 1),

-- ------------------------------------------------------------
-- Monitors (41-60)
-- ------------------------------------------------------------

(41, 'ViewMax 21 Monitor', 3, 149.99, 25, 0),
(42, 'ViewMax 22 Monitor', 3, 169.99, 21, 0),
(43, 'ViewMax 23 Monitor', 3, 189.99, 18, 0),
(44, 'ViewMax 24 Monitor', 3, 199.99, 30, 0),
(45, 'ViewMax 27 Monitor', 3, 249.99, 22, 0),
(46, 'ViewMax 32 Monitor', 3, 329.99, 15, 0),
(47, 'ColorPro 24 Monitor', 3, 299.99, 13, 0),
(48, 'ColorPro 27 Monitor', 3, 399.99, 11, 0),
(49, 'ColorPro 32 Monitor', 3, 499.99, 9, 0),
(50, 'ColorPro 34 Monitor', 3, 649.99, 6, 0),
(51, 'OfficeView 22 Monitor', 3, 159.99, 24, 0),
(52, 'OfficeView 24 Monitor', 3, 179.99, 27, 0),
(53, 'OfficeView 27 Monitor', 3, 229.99, 20, 0),
(54, 'OfficeView 32 Monitor', 3, 319.99, 14, 0),
(55, 'GameView 24 Monitor', 3, 249.99, 12, 0),
(56, 'GameView 27 Monitor', 3, 349.99, 10, 0),
(57, 'GameView 32 Monitor', 3, 449.99, 8, 0),
(58, 'UltraWide 29 Monitor', 3, 379.99, 7, 0),
(59, 'UltraWide 34 Monitor', 3, 599.99, 5, 0),
(60, 'BasicView 20 Monitor', 3, 119.99, 3, 1),

-- ------------------------------------------------------------
-- Keyboards (61-80)
-- ------------------------------------------------------------

(61, 'Basic USB Keyboard', 4, 19.99, 50, 0),
(62, 'Comfort USB Keyboard', 4, 29.99, 42, 0),
(63, 'Slim USB Keyboard', 4, 24.99, 38, 0),
(64, 'Wireless Keyboard 100', 4, 34.99, 31, 0),
(65, 'Wireless Keyboard 200', 4, 44.99, 27, 0),
(66, 'Wireless Keyboard 300', 4, 54.99, 23, 0),
(67, 'Mechanical Keyboard Blue', 4, 69.99, 19, 0),
(68, 'Mechanical Keyboard Red', 4, 69.99, 17, 0),
(69, 'Mechanical Keyboard Brown', 4, 74.99, 15, 0),
(70, 'Mechanical Keyboard Pro', 4, 99.99, 12, 0),
(71, 'Gaming Keyboard 100', 4, 59.99, 20, 0),
(72, 'Gaming Keyboard 200', 4, 79.99, 18, 0),
(73, 'Gaming Keyboard 300', 4, 109.99, 10, 0),
(74, 'Compact Keyboard 60', 4, 49.99, 22, 0),
(75, 'Compact Keyboard 75', 4, 54.99, 16, 0),
(76, 'Ergonomic Keyboard 1', 4, 64.99, 14, 0),
(77, 'Ergonomic Keyboard 2', 4, 84.99, 9, 0),
(78, 'Office Keyboard Pro', 4, 39.99, 25, 0),
(79, 'Travel Keyboard', 4, 29.99, 29, 0),
(80, 'Classic Keyboard', 4, 14.99, 2, 1),

-- ------------------------------------------------------------
-- Mice (81-100)
-- ------------------------------------------------------------

(81, 'Basic USB Mouse', 5, 14.99, 60, 0),
(82, 'Comfort USB Mouse', 5, 19.99, 52, 0),
(83, 'Wireless Mouse 100', 5, 24.99, 45, 0),
(84, 'Wireless Mouse 200', 5, 29.99, 41, 0),
(85, 'Wireless Mouse 300', 5, 34.99, 38, 0),
(86, 'Wireless Mouse Pro', 5, 49.99, 29, 0),
(87, 'Precision Mouse 1', 5, 39.99, 31, 0),
(88, 'Precision Mouse 2', 5, 59.99, 24, 0),
(89, 'Precision Mouse 3', 5, 79.99, 18, 0),
(90, 'Gaming Mouse 100', 5, 34.99, 27, 0),
(91, 'Gaming Mouse 200', 5, 49.99, 22, 0),
(92, 'Gaming Mouse 300', 5, 69.99, 16, 0),
(93, 'Gaming Mouse Pro', 5, 89.99, 11, 0),
(94, 'Travel Mouse', 5, 19.99, 35, 0),
(95, 'Mini Mouse', 5, 16.99, 28, 0),
(96, 'Ergonomic Mouse 1', 5, 44.99, 20, 0),
(97, 'Ergonomic Mouse 2', 5, 54.99, 15, 0),
(98, 'Office Mouse Pro', 5, 27.99, 33, 0),
(99, 'Silent Mouse', 5, 31.99, 19, 0),
(100, 'Classic Mouse', 5, 11.99, 1, 1),

-- ------------------------------------------------------------
-- Headphones (101-120)
-- ------------------------------------------------------------

(101, 'Basic Headphones', 6, 24.99, 35, 0),
(102, 'Comfort Headphones', 6, 39.99, 29, 0),
(103, 'Studio Headphones 1', 6, 79.99, 18, 0),
(104, 'Studio Headphones 2', 6, 99.99, 14, 0),
(105, 'Studio Headphones Pro', 6, 149.99, 9, 0),
(106, 'Wireless Headphones 100', 6, 49.99, 25, 0),
(107, 'Wireless Headphones 200', 6, 69.99, 22, 0),
(108, 'Wireless Headphones 300', 6, 89.99, 19, 0),
(109, 'Wireless Headphones Pro', 6, 129.99, 12, 0),
(110, 'Noise Canceling 100', 6, 99.99, 16, 0),
(111, 'Noise Canceling 200', 6, 149.99, 11, 0),
(112, 'Noise Canceling Pro', 6, 199.99, 7, 0),
(113, 'Gaming Headset 100', 6, 59.99, 21, 0),
(114, 'Gaming Headset 200', 6, 79.99, 17, 0),
(115, 'Gaming Headset 300', 6, 109.99, 13, 0),
(116, 'Gaming Headset Pro', 6, 139.99, 8, 0),
(117, 'Office Headset 1', 6, 44.99, 20, 0),
(118, 'Office Headset 2', 6, 64.99, 15, 0),
(119, 'Travel Headphones', 6, 54.99, 26, 0),
(120, 'Classic Headphones', 6, 19.99, 2, 1),

-- ------------------------------------------------------------
-- Storage (121-140)
-- ------------------------------------------------------------

(121, 'Portable HDD 500GB', 7, 49.99, 30, 0),
(122, 'Portable HDD 1TB', 7, 64.99, 27, 0),
(123, 'Portable HDD 2TB', 7, 89.99, 21, 0),
(124, 'Portable HDD 4TB', 7, 129.99, 14, 0),
(125, 'Desktop HDD 2TB', 7, 79.99, 19, 0),
(126, 'Desktop HDD 4TB', 7, 119.99, 17, 0),
(127, 'Desktop HDD 6TB', 7, 159.99, 10, 0),
(128, 'Desktop HDD 8TB', 7, 199.99, 8, 0),
(129, 'SSD 250GB', 7, 39.99, 35, 0),
(130, 'SSD 500GB', 7, 54.99, 31, 0),
(131, 'SSD 1TB', 7, 89.99, 25, 0),
(132, 'SSD 2TB', 7, 159.99, 16, 0),
(133, 'SSD 4TB', 7, 299.99, 7, 0),
(134, 'NVMe SSD 500GB', 7, 69.99, 24, 0),
(135, 'NVMe SSD 1TB', 7, 109.99, 19, 0),
(136, 'NVMe SSD 2TB', 7, 189.99, 13, 0),
(137, 'USB Flash Drive 32GB', 7, 9.99, 55, 0),
(138, 'USB Flash Drive 64GB', 7, 14.99, 48, 0),
(139, 'USB Flash Drive 128GB', 7, 24.99, 39, 0),
(140, 'Legacy HDD 1TB', 7, 54.99, 2, 1),

-- ------------------------------------------------------------
-- Networking (141-160)
-- ------------------------------------------------------------

(141, 'Basic Router 100', 8, 39.99, 25, 0),
(142, 'Basic Router 200', 8, 49.99, 21, 0),
(143, 'Home Router 300', 8, 69.99, 19, 0),
(144, 'Home Router 500', 8, 89.99, 15, 0),
(145, 'Home Router 700', 8, 119.99, 12, 0),
(146, 'WiFi Router Pro', 8, 149.99, 9, 0),
(147, 'WiFi 6 Router 100', 8, 99.99, 14, 0),
(148, 'WiFi 6 Router 200', 8, 129.99, 11, 0),
(149, 'WiFi 6 Router Pro', 8, 179.99, 7, 0),
(150, 'WiFi Extender 100', 8, 29.99, 28, 0),
(151, 'WiFi Extender 200', 8, 44.99, 22, 0),
(152, 'WiFi Extender Pro', 8, 69.99, 15, 0),
(153, 'Ethernet Switch 5 Port', 8, 24.99, 34, 0),
(154, 'Ethernet Switch 8 Port', 8, 34.99, 29, 0),
(155, 'Ethernet Switch 16 Port', 8, 69.99, 17, 0),
(156, 'Ethernet Switch 24 Port', 8, 99.99, 11, 0),
(157, 'Business Router 1', 8, 199.99, 6, 0),
(158, 'Business Router 2', 8, 249.99, 5, 0),
(159, 'Mesh Router 2 Pack', 8, 179.99, 8, 0),
(160, 'Legacy Router', 8, 39.99, 1, 1),

-- ------------------------------------------------------------
-- Accessories (161-180)
-- ------------------------------------------------------------

(161, 'HDMI Cable 3ft', 9, 7.99, 80, 0),
(162, 'HDMI Cable 6ft', 9, 9.99, 75, 0),
(163, 'HDMI Cable 10ft', 9, 14.99, 62, 0),
(164, 'DisplayPort Cable 6ft', 9, 12.99, 58, 0),
(165, 'USB-C Cable 3ft', 9, 8.99, 70, 0),
(166, 'USB-C Cable 6ft', 9, 11.99, 65, 0),
(167, 'USB-C Cable 10ft', 9, 16.99, 52, 0),
(168, 'USB-A Cable 6ft', 9, 8.99, 63, 0),
(169, 'Ethernet Cable 6ft', 9, 6.99, 90, 0),
(170, 'Ethernet Cable 15ft', 9, 11.99, 71, 0),
(171, 'Ethernet Cable 25ft', 9, 17.99, 49, 0),
(172, 'USB Hub 4 Port', 9, 19.99, 37, 0),
(173, 'USB Hub 7 Port', 9, 29.99, 31, 0),
(174, 'USB-C Hub 6 Port', 9, 39.99, 26, 0),
(175, 'Laptop Stand Basic', 9, 24.99, 33, 0),
(176, 'Laptop Stand Pro', 9, 49.99, 18, 0),
(177, 'Monitor Stand Single', 9, 34.99, 24, 0),
(178, 'Monitor Stand Dual', 9, 69.99, 13, 0),
(179, 'Cable Organizer Pack', 9, 12.99, 45, 0),
(180, 'Legacy Adapter Pack', 9, 9.99, 2, 1),

-- ------------------------------------------------------------
-- Webcams (181-200)
-- ------------------------------------------------------------

(181, 'Basic Webcam 720p', 10, 29.99, 28, 0),
(182, 'Basic Webcam 1080p', 10, 39.99, 31, 0),
(183, 'HD Webcam 1080p', 10, 49.99, 25, 0),
(184, 'HD Webcam 1080p Pro', 10, 69.99, 19, 0),
(185, 'Full HD Webcam 1', 10, 79.99, 16, 0),
(186, 'Full HD Webcam 2', 10, 89.99, 14, 0),
(187, 'Full HD Webcam Pro', 10, 109.99, 10, 0),
(188, '4K Webcam 1', 10, 129.99, 8, 0),
(189, '4K Webcam 2', 10, 159.99, 6, 0),
(190, '4K Webcam Pro', 10, 199.99, 5, 0),
(191, 'Conference Camera 1', 10, 149.99, 9, 0),
(192, 'Conference Camera 2', 10, 199.99, 7, 0),
(193, 'Conference Camera Pro', 10, 299.99, 4, 0),
(194, 'Streaming Webcam 1', 10, 99.99, 13, 0),
(195, 'Streaming Webcam 2', 10, 129.99, 11, 0),
(196, 'Streaming Webcam Pro', 10, 179.99, 6, 0),
(197, 'Travel Webcam', 10, 44.99, 20, 0),
(198, 'Privacy Webcam', 10, 54.99, 17, 0),
(199, 'Office Webcam', 10, 59.99, 23, 0),
(200, 'Legacy Webcam', 10, 24.99, 1, 1);


-- ============================================================
-- CUSTOMERS
-- ============================================================

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);


INSERT INTO customers
    (customer_id, first_name, last_name, email, city, state)
VALUES
(1, 'James', 'Anderson', 'james.anderson@example.com', 'Seattle', 'WA'),
(2, 'Maria', 'Bennett', 'maria.bennett@example.com', 'Portland', 'OR'),
(3, 'Robert', 'Carter', 'robert.carter@example.com', 'Denver', 'CO'),
(4, 'Linda', 'Davis', 'linda.davis@example.com', 'Austin', 'TX'),
(5, 'Michael', 'Evans', 'michael.evans@example.com', 'Chicago', 'IL'),
(6, 'Patricia', 'Foster', 'patricia.foster@example.com', 'Boston', 'MA'),
(7, 'David', 'Garcia', 'david.garcia@example.com', 'Phoenix', 'AZ'),
(8, 'Jennifer', 'Harris', 'jennifer.harris@example.com', 'Atlanta', 'GA'),
(9, 'William', 'Jackson', 'william.jackson@example.com', 'Miami', 'FL'),
(10, 'Elizabeth', 'King', 'elizabeth.king@example.com', 'Portland', 'ME'),
(11, 'Richard', 'Lewis', 'richard.lewis@example.com', 'Dallas', 'TX'),
(12, 'Susan', 'Martin', 'susan.martin@example.com', 'Boise', 'ID'),
(13, 'Joseph', 'Nelson', 'joseph.nelson@example.com', 'Spokane', 'WA'),
(14, 'Jessica', 'Parker', 'jessica.parker@example.com', 'San Diego', 'CA'),
(15, 'Thomas', 'Roberts', 'thomas.roberts@example.com', 'Sacramento', 'CA'),
(16, 'Sarah', 'Scott', 'sarah.scott@example.com', 'Salt Lake City', 'UT'),
(17, 'Charles', 'Taylor', 'charles.taylor@example.com', 'Las Vegas', 'NV'),
(18, 'Karen', 'Thompson', 'karen.thompson@example.com', 'Nashville', 'TN'),
(19, 'Christopher', 'Walker', 'christopher.walker@example.com', 'Charlotte', 'NC'),
(20, 'Nancy', 'White', 'nancy.white@example.com', 'Columbus', 'OH'),
(21, 'Daniel', 'Wilson', 'daniel.wilson@example.com', 'Minneapolis', 'MN'),
(22, 'Lisa', 'Adams', 'lisa.adams@example.com', 'Kansas City', 'MO'),
(23, 'Matthew', 'Baker', 'matthew.baker@example.com', 'Omaha', 'NE'),
(24, 'Betty', 'Clark', 'betty.clark@example.com', 'Tulsa', 'OK'),
(25, 'Anthony', 'Collins', 'anthony.collins@example.com', 'Richmond', 'VA'),
(26, 'Margaret', 'Cooper', 'margaret.cooper@example.com', 'Raleigh', 'NC'),
(27, 'Mark', 'Edwards', 'mark.edwards@example.com', 'Cleveland', 'OH'),
(28, 'Sandra', 'Green', 'sandra.green@example.com', 'Pittsburgh', 'PA'),
(29, 'Donald', 'Hill', 'donald.hill@example.com', 'Detroit', 'MI'),
(30, 'Ashley', 'Moore', 'ashley.moore@example.com', 'Madison', 'WI');


-- ============================================================
-- ORDERS
-- ============================================================

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TEXT NOT NULL,
    status TEXT NOT NULL CHECK (
        status IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')
    ),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO orders
    (order_id, customer_id, order_date, status)
VALUES
(1, 1, '2026-01-03', 'Delivered'),
(2, 2, '2026-01-04', 'Delivered'),
(3, 3, '2026-01-05', 'Shipped'),
(4, 4, '2026-01-07', 'Delivered'),
(5, 5, '2026-01-09', 'Delivered'),
(6, 6, '2026-01-11', 'Processing'),
(7, 7, '2026-01-12', 'Delivered'),
(8, 8, '2026-01-14', 'Shipped'),
(9, 9, '2026-01-15', 'Delivered'),
(10, 10, '2026-01-17', 'Cancelled'),
(11, 11, '2026-01-19', 'Delivered'),
(12, 12, '2026-01-20', 'Delivered'),
(13, 13, '2026-01-22', 'Processing'),
(14, 14, '2026-01-24', 'Delivered'),
(15, 15, '2026-01-25', 'Shipped'),
(16, 16, '2026-01-27', 'Delivered'),
(17, 17, '2026-01-29', 'Delivered'),
(18, 18, '2026-02-01', 'Processing'),
(19, 19, '2026-02-03', 'Delivered'),
(20, 20, '2026-02-04', 'Shipped'),
(21, 21, '2026-02-06', 'Delivered'),
(22, 22, '2026-02-08', 'Delivered'),
(23, 23, '2026-02-10', 'Pending'),
(24, 24, '2026-02-11', 'Delivered'),
(25, 25, '2026-02-13', 'Shipped'),
(26, 26, '2026-02-15', 'Delivered'),
(27, 27, '2026-02-17', 'Delivered'),
(28, 28, '2026-02-19', 'Processing'),
(29, 29, '2026-02-20', 'Delivered'),
(30, 30, '2026-02-22', 'Delivered'),
(31, 1, '2026-02-24', 'Delivered'),
(32, 3, '2026-02-25', 'Shipped'),
(33, 5, '2026-02-27', 'Delivered'),
(34, 7, '2026-03-01', 'Delivered'),
(35, 9, '2026-03-03', 'Processing'),
(36, 11, '2026-03-05', 'Delivered'),
(37, 13, '2026-03-07', 'Delivered'),
(38, 15, '2026-03-09', 'Shipped'),
(39, 17, '2026-03-11', 'Delivered'),
(40, 19, '2026-03-13', 'Delivered'),
(41, 21, '2026-03-15', 'Processing'),
(42, 23, '2026-03-17', 'Delivered'),
(43, 25, '2026-03-19', 'Shipped'),
(44, 27, '2026-03-21', 'Delivered'),
(45, 29, '2026-03-23', 'Delivered'),
(46, 2, '2026-03-25', 'Pending'),
(47, 4, '2026-03-27', 'Delivered'),
(48, 6, '2026-03-29', 'Shipped'),
(49, 8, '2026-03-31', 'Delivered'),
(50, 10, '2026-04-02', 'Delivered'),
(51, 12, '2026-04-04', 'Processing'),
(52, 14, '2026-04-06', 'Delivered'),
(53, 16, '2026-04-08', 'Shipped'),
(54, 18, '2026-04-10', 'Delivered'),
(55, 20, '2026-04-12', 'Delivered'),
(56, 22, '2026-04-14', 'Pending'),
(57, 24, '2026-04-16', 'Delivered'),
(58, 26, '2026-04-18', 'Shipped'),
(59, 28, '2026-04-20', 'Delivered'),
(60, 30, '2026-04-22', 'Delivered');


-- ============================================================
-- ORDER ITEMS
-- Each order contains multiple products.
-- Quantity varies from 1 to 5.
-- ============================================================

CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price REAL NOT NULL CHECK (unit_price >= 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 1, 549.99),
(2, 1, 61, 1, 19.99),
(3, 1, 81, 1, 14.99),

(4, 2, 45, 2, 249.99),
(5, 2, 67, 1, 69.99),

(6, 3, 11, 1, 679.99),
(7, 3, 83, 1, 24.99),
(8, 3, 101, 1, 24.99),

(9, 4, 22, 1, 749.99),
(10, 4, 44, 2, 199.99),

(11, 5, 13, 1, 1099.99),
(12, 5, 88, 1, 59.99),

(13, 6, 52, 1, 179.99),
(14, 6, 72, 1, 79.99),
(15, 6, 107, 1, 69.99),

(16, 7, 29, 1, 749.99),
(17, 7, 98, 2, 27.99),

(18, 8, 46, 1, 329.99),
(19, 8, 74, 1, 49.99),
(20, 8, 183, 1, 49.99),

(21, 9, 15, 1, 1199.99),
(22, 9, 91, 1, 49.99),

(23, 10, 63, 1, 24.99),
(24, 10, 84, 1, 29.99),

(25, 11, 31, 1, 1299.99),
(26, 11, 58, 1, 379.99),
(27, 11, 105, 1, 149.99),

(28, 12, 129, 2, 39.99),
(29, 12, 130, 1, 54.99),
(30, 12, 165, 2, 8.99),

(31, 13, 143, 1, 69.99),
(32, 13, 153, 1, 24.99),

(33, 14, 3, 1, 749.99),
(34, 14, 47, 1, 299.99),
(35, 14, 172, 1, 19.99),

(36, 15, 34, 1, 1199.99),
(37, 15, 73, 1, 109.99),
(38, 15, 115, 1, 109.99),

(39, 16, 53, 2, 229.99),
(40, 16, 76, 1, 64.99),
(41, 16, 87, 1, 39.99),

(42, 17, 6, 1, 899.99),
(43, 17, 92, 1, 69.99),

(44, 18, 24, 1, 899.99),
(45, 18, 148, 1, 129.99),
(46, 18, 169, 3, 6.99),

(47, 19, 17, 1, 699.99),
(48, 19, 166, 2, 11.99),

(49, 20, 59, 1, 599.99),
(50, 20, 70, 1, 99.99),
(51, 20, 194, 1, 99.99),

(52, 21, 27, 1, 549.99),
(53, 21, 82, 1, 19.99),
(54, 21, 101, 1, 24.99),

(55, 22, 135, 1, 109.99),
(56, 22, 136, 1, 189.99),
(57, 22, 173, 1, 29.99),

(58, 23, 43, 1, 189.99),
(59, 23, 55, 1, 249.99),

(60, 24, 38, 1, 499.99),
(61, 24, 142, 1, 49.99),
(62, 24, 154, 1, 34.99),

(63, 25, 14, 1, 1299.99),
(64, 25, 48, 1, 399.99),
(65, 25, 109, 1, 129.99),

(66, 26, 64, 1, 34.99),
(67, 26, 85, 2, 34.99),
(68, 26, 162, 3, 9.99),

(69, 27, 35, 1, 1499.99),
(70, 27, 93, 1, 89.99),

(71, 28, 122, 1, 64.99),
(72, 28, 131, 1, 89.99),
(73, 28, 174, 1, 39.99),

(74, 29, 4, 1, 799.99),
(75, 29, 45, 1, 249.99),
(76, 29, 106, 1, 49.99),

(77, 30, 21, 1, 649.99),
(78, 30, 57, 1, 449.99),
(79, 30, 177, 1, 34.99),

(80, 31, 8, 1, 999.99),
(81, 31, 69, 1, 74.99),
(82, 31, 98, 1, 27.99),

(83, 32, 32, 1, 1599.99),
(84, 32, 50, 1, 649.99),

(85, 33, 131, 2, 89.99),
(86, 33, 138, 2, 14.99),
(87, 33, 179, 1, 12.99),

(88, 34, 28, 1, 649.99),
(89, 34, 52, 1, 179.99),
(90, 34, 117, 1, 44.99),

(91, 35, 16, 1, 1499.99),
(92, 35, 73, 1, 109.99),

(93, 36, 33, 1, 1899.99),
(94, 36, 49, 1, 499.99),
(95, 36, 136, 1, 189.99),

(96, 37, 10, 1, 479.99),
(97, 37, 61, 1, 19.99),
(98, 37, 81, 1, 14.99),

(99, 38, 36, 1, 1999.99),
(100, 38, 93, 1, 89.99),
(101, 38, 115, 1, 109.99),

(102, 39, 7, 1, 949.99),
(103, 39, 59, 1, 599.99),
(104, 39, 108, 1, 89.99),

(105, 40, 23, 1, 849.99),
(106, 40, 143, 1, 69.99),
(107, 40, 154, 1, 34.99),

(108, 41, 47, 1, 299.99),
(109, 41, 67, 1, 69.99),
(110, 41, 134, 1, 69.99),

(111, 42, 12, 1, 729.99),
(112, 42, 46, 1, 329.99),
(113, 42, 166, 2, 11.99),

(114, 43, 15, 1, 1199.99),
(115, 43, 56, 1, 349.99),
(116, 43, 113, 1, 59.99),

(117, 44, 30, 1, 849.99),
(118, 44, 79, 1, 29.99),
(119, 44, 171, 1, 17.99),

(120, 45, 39, 1, 599.99),
(121, 45, 88, 1, 59.99),
(122, 45, 147, 1, 99.99),

(123, 46, 44, 1, 199.99),
(124, 46, 63, 1, 24.99),
(125, 46, 183, 1, 49.99),

(126, 47, 18, 1, 799.99),
(127, 47, 57, 1, 449.99),
(128, 47, 173, 1, 29.99),

(129, 48, 5, 1, 849.99),
(130, 48, 68, 1, 69.99),
(131, 48, 112, 1, 199.99),

(132, 49, 42, 1, 169.99),
(133, 49, 86, 1, 49.99),
(134, 49, 182, 1, 39.99),

(135, 50, 26, 1, 1099.99),
(136, 50, 96, 1, 44.99),
(137, 50, 153, 1, 24.99),

(138, 51, 125, 1, 79.99),
(139, 51, 130, 1, 54.99),
(140, 51, 164, 1, 12.99),

(141, 52, 13, 1, 1099.99),
(142, 52, 54, 1, 319.99),
(143, 52, 191, 1, 149.99),

(144, 53, 37, 1, 399.99),
(145, 53, 90, 1, 34.99),
(146, 53, 155, 1, 69.99),

(147, 54, 19, 1, 499.99),
(148, 54, 52, 1, 179.99),
(149, 54, 116, 1, 139.99),

(150, 55, 9, 1, 429.99),
(151, 55, 71, 1, 59.99),
(152, 55, 165, 2, 8.99),

(153, 56, 41, 1, 149.99),
(154, 56, 94, 1, 19.99),
(155, 56, 181, 1, 29.99),

(156, 57, 25, 1, 999.99),
(157, 57, 62, 1, 29.99),
(158, 57, 87, 1, 39.99),

(159, 58, 34, 1, 1199.99),
(160, 58, 50, 1, 649.99),
(161, 58, 108, 1, 89.99),

(162, 59, 132, 1, 159.99),
(163, 59, 137, 2, 9.99),
(164, 59, 174, 1, 39.99),

(165, 60, 20, 1, 579.99),
(166, 60, 45, 1, 249.99),
(167, 60, 118, 1, 64.99);


-- ============================================================
-- INDEXES
--
-- These aren't necessary for basic SQL exercises, but give
-- students an opportunity to inspect and learn about indexes.
-- ============================================================

CREATE INDEX idx_products_category
    ON products(category_id);

CREATE INDEX idx_products_price
    ON products(price);

CREATE INDEX idx_orders_customer
    ON orders(customer_id);

CREATE INDEX idx_orders_date
    ON orders(order_date);

CREATE INDEX idx_order_items_order
    ON order_items(order_id);

CREATE INDEX idx_order_items_product
    ON order_items(product_id);
