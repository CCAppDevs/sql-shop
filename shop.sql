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
-- 40 categories, 800 products, 120 customers,
-- 240 orders, and 668 order items are included.
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
(10, 'Webcams', 'Webcams and video conferencing equipment'),
(11, 'Tablets', 'Tablet computers for entertainment, school, and work'),
(12, 'Printers', 'Inkjet, laser, photo, and label printers'),
(13, 'Printer Supplies', 'Ink, toner, paper, and printer maintenance supplies'),
(14, 'Speakers', 'Desktop, Bluetooth, and home audio speakers'),
(15, 'Microphones', 'Microphones and audio recording equipment'),
(16, 'Graphics Cards', 'Video cards for gaming, design, and workstations'),
(17, 'Processors', 'Desktop and workstation CPUs'),
(18, 'Memory', 'Desktop, laptop, and server RAM'),
(19, 'Motherboards', 'Motherboards for desktop computers'),
(20, 'Power Supplies', 'Computer power supply units'),
(21, 'Computer Cases', 'Computer cases and enclosures'),
(22, 'Cooling', 'CPU coolers, case fans, and thermal products'),
(23, 'Smartphones', 'Mobile phones and smartphones'),
(24, 'Smartwatches', 'Smartwatches, fitness bands, and wearables'),
(25, 'Projectors', 'Home, office, and portable projectors'),
(26, 'Docking Stations', 'Laptop docks and port expanders'),
(27, 'Power Protection', 'Surge protectors, UPS units, and power strips'),
(28, 'Software', 'Productivity, security, and creative software'),
(29, 'Game Controllers', 'Gamepads, racing wheels, and flight sticks'),
(30, 'VR Headsets', 'Virtual and mixed reality headsets and accessories'),
(31, 'Drawing Tablets', 'Pen tablets and pen displays for digital art'),
(32, 'Office Furniture', 'Desks, chairs, and workspace furniture'),
(33, 'Smart Home', 'Smart plugs, lights, locks, and home automation'),
(34, 'Security Cameras', 'Indoor, outdoor, and dash cameras'),
(35, 'Bags and Cases', 'Laptop bags, sleeves, and device cases'),
(36, 'Chargers and Batteries', 'Chargers, power banks, and batteries'),
(37, 'Cleaning Supplies', 'Cleaning and maintenance supplies for electronics'),
(38, 'Network Storage', 'NAS devices and network storage drives'),
(39, 'E-Readers', 'E-book readers and accessories'),
(40, 'Streaming Devices', 'Media streamers and content creation gear');


-- ============================================================
-- PRODUCTS
-- Exactly 800 products (20 per category)
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
(200, 'Legacy Webcam', 10, 24.99, 1, 1),

-- ------------------------------------------------------------
-- Tablets (201-220)
-- ------------------------------------------------------------

(201, 'Tab Lite 8 Tablet', 11, 129.99, 34, 0),
(202, 'Tab Lite 10 Tablet', 11, 159.99, 29, 0),
(203, 'Tab 10 Tablet', 11, 229.99, 22, 0),
(204, 'Tab 11 Tablet', 11, 279.99, 18, 0),
(205, 'Tab Plus 11 Tablet', 11, 349.99, 15, 0),
(206, 'Tab Plus 12 Tablet', 11, 399.99, 12, 0),
(207, 'Tab Pro 11 Tablet', 11, 599.99, 9, 0),
(208, 'Tab Pro 13 Tablet', 11, 799.99, 7, 0),
(209, 'Tab Pro 13 Cellular Tablet', 11, 949.99, 0, 0),
(210, 'Kids Tablet 7', 11, 89.99, 41, 0),
(211, 'Kids Tablet 10', 11, 119.99, 33, 0),
(212, 'Student Tab 10', 11, 199.99, 26, 0),
(213, 'Business Tab 12', 11, 649.99, 8, 0),
(214, 'Rugged Tab 8', 11, 449.99, 6, 0),
(215, 'Rugged Tab 10', 11, 549.99, 4, 0),
(216, 'Tab Mini 8 Tablet', 11, 329.99, 14, 0),
(217, 'Tab Mini 8 Cellular Tablet', 11, 449.99, 10, 0),
(218, 'Creator Tab 13', 11, 1099.99, 5, 0),
(219, 'Tab Max 14 Tablet', 11, 1199.99, 3, 0),
(220, 'Legacy Tab 9 Tablet', 11, 99.99, 0, 1),

-- ------------------------------------------------------------
-- Printers (221-240)
-- ------------------------------------------------------------

(221, 'Inkjet Printer 100', 12, 59.99, 27, 0),
(222, 'Inkjet Printer 200', 12, 79.99, 23, 0),
(223, 'Inkjet All-in-One 300', 12, 99.99, 19, 0),
(224, 'Inkjet All-in-One 500', 12, 149.99, 14, 0),
(225, 'Photo Printer 1', 12, 179.99, 9, 0),
(226, 'Photo Printer Pro', 12, 329.99, 5, 0),
(227, 'Laser Printer Mono 1', 12, 129.99, 18, 0),
(228, 'Laser Printer Mono 2', 12, 179.99, 13, 0),
(229, 'Laser Printer Color 1', 12, 249.99, 10, 0),
(230, 'Laser Printer Color 2', 12, 349.99, 7, 0),
(231, 'Laser All-in-One Pro', 12, 449.99, 6, 0),
(232, 'Office Laser 4000', 12, 699.99, 3, 0),
(233, 'Office Laser 6000', 12, 999.99, 2, 0),
(234, 'Tank Printer 100', 12, 199.99, 12, 0),
(235, 'Tank Printer 300', 12, 279.99, 8, 0),
(236, 'Label Printer 1', 12, 79.99, 21, 0),
(237, 'Label Printer Pro', 12, 139.99, 11, 0),
(238, 'Portable Printer', 12, 149.99, 0, 0),
(239, 'Receipt Printer', 12, 119.99, 9, 0),
(240, 'Legacy Inkjet 50', 12, 39.99, 3, 1),

-- ------------------------------------------------------------
-- Printer Supplies (241-260)
-- ------------------------------------------------------------

(241, 'Black Ink Cartridge 100', 13, 19.99, 120, 0),
(242, 'Color Ink Cartridge 100', 13, 24.99, 105, 0),
(243, 'Black Ink Cartridge 200 XL', 13, 34.99, 84, 0),
(244, 'Color Ink Cartridge 200 XL', 13, 39.99, 76, 0),
(245, 'Ink Bottle Black', 13, 14.99, 92, 0),
(246, 'Ink Bottle Color 4 Pack', 13, 44.99, 48, 0),
(247, 'Mono Toner Standard', 13, 69.99, 37, 0),
(248, 'Mono Toner High Yield', 13, 99.99, 26, 0),
(249, 'Color Toner Set', 13, 229.99, 12, 0),
(250, 'Photo Paper 4x6 100 Sheets', 13, 12.99, 88, 0),
(251, 'Photo Paper 8x10 50 Sheets', 13, 17.99, 64, 0),
(252, 'Copy Paper Ream', 13, 8.99, 150, 0),
(253, 'Copy Paper Case 10 Reams', 13, 54.99, 30, 0),
(254, 'Cardstock 100 Sheets', 13, 13.99, 47, 0),
(255, 'Label Roll Small', 13, 9.99, 110, 0),
(256, 'Label Roll Large', 13, 15.99, 72, 0),
(257, 'Receipt Paper 10 Pack', 13, 21.99, 40, 0),
(258, 'Drum Unit Mono', 13, 89.99, 15, 0),
(259, 'Printer Maintenance Kit', 13, 129.99, 6, 0),
(260, 'Legacy Ink Cartridge 50', 13, 16.99, 0, 1),

-- ------------------------------------------------------------
-- Speakers (261-280)
-- ------------------------------------------------------------

(261, 'Desktop Speakers 100', 14, 24.99, 44, 0),
(262, 'Desktop Speakers 200', 14, 39.99, 36, 0),
(263, 'Desktop Speakers Pro', 14, 79.99, 21, 0),
(264, 'Bluetooth Speaker Mini', 14, 29.99, 52, 0),
(265, 'Bluetooth Speaker 100', 14, 49.99, 38, 0),
(266, 'Bluetooth Speaker 200', 14, 79.99, 27, 0),
(267, 'Bluetooth Speaker Pro', 14, 129.99, 15, 0),
(268, 'Soundbar 100', 14, 99.99, 18, 0),
(269, 'Soundbar 300', 14, 199.99, 11, 0),
(270, 'Soundbar Pro', 14, 349.99, 6, 0),
(271, 'Studio Monitors Pair 1', 14, 149.99, 9, 0),
(272, 'Studio Monitors Pair 2', 14, 249.99, 7, 0),
(273, 'Gaming Speakers 2.1', 14, 89.99, 16, 0),
(274, 'Gaming Speakers 5.1', 14, 179.99, 8, 0),
(275, 'Smart Speaker Mini', 14, 39.99, 47, 0),
(276, 'Smart Speaker', 14, 99.99, 22, 0),
(277, 'Outdoor Speaker', 14, 119.99, 0, 0),
(278, 'Party Speaker', 14, 249.99, 4, 0),
(279, 'Subwoofer 10 Inch', 14, 159.99, 7, 0),
(280, 'Classic Speakers', 14, 19.99, 1, 1),

-- ------------------------------------------------------------
-- Microphones (281-300)
-- ------------------------------------------------------------

(281, 'USB Microphone Basic', 15, 29.99, 39, 0),
(282, 'USB Microphone 100', 15, 49.99, 31, 0),
(283, 'USB Microphone 200', 15, 79.99, 22, 0),
(284, 'USB Microphone Pro', 15, 129.99, 14, 0),
(285, 'Podcast Microphone 1', 15, 99.99, 17, 0),
(286, 'Podcast Microphone Pro', 15, 169.99, 9, 0),
(287, 'Streaming Microphone 1', 15, 89.99, 19, 0),
(288, 'Streaming Microphone Pro', 15, 149.99, 10, 0),
(289, 'XLR Microphone 1', 15, 69.99, 15, 0),
(290, 'XLR Microphone Pro', 15, 199.99, 6, 0),
(291, 'Lavalier Microphone', 15, 24.99, 43, 0),
(292, 'Wireless Lavalier Kit', 15, 129.99, 12, 0),
(293, 'Conference Microphone 1', 15, 89.99, 13, 0),
(294, 'Conference Microphone Pro', 15, 249.99, 5, 0),
(295, 'Shotgun Microphone', 15, 119.99, 8, 0),
(296, 'Microphone Arm Stand', 15, 34.99, 28, 0),
(297, 'Pop Filter', 15, 12.99, 56, 0),
(298, 'Audio Interface 1', 15, 109.99, 11, 0),
(299, 'Audio Interface 2', 15, 219.99, 0, 0),
(300, 'Legacy Desk Microphone', 15, 14.99, 2, 1),

-- ------------------------------------------------------------
-- Graphics Cards (301-320)
-- ------------------------------------------------------------

(301, 'GPU Basic 2GB', 16, 89.99, 12, 0),
(302, 'GPU Basic 4GB', 16, 129.99, 14, 0),
(303, 'GPU Office 4GB', 16, 149.99, 10, 0),
(304, 'GPU Gamer 100 8GB', 16, 249.99, 13, 0),
(305, 'GPU Gamer 200 8GB', 16, 299.99, 11, 0),
(306, 'GPU Gamer 300 12GB', 16, 399.99, 9, 0),
(307, 'GPU Gamer 400 12GB', 16, 499.99, 7, 0),
(308, 'GPU Gamer 500 16GB', 16, 649.99, 5, 0),
(309, 'GPU Gamer 600 16GB', 16, 799.99, 4, 0),
(310, 'GPU Gamer 700 20GB', 16, 999.99, 3, 0),
(311, 'GPU Gamer 800 24GB', 16, 1599.99, 2, 0),
(312, 'GPU Creator 12GB', 16, 899.99, 3, 0),
(313, 'GPU Creator 16GB', 16, 1199.99, 2, 0),
(314, 'GPU Workstation 24GB', 16, 2199.99, 1, 0),
(315, 'GPU Workstation 48GB', 16, 3999.99, 1, 0),
(316, 'GPU Low Profile 4GB', 16, 179.99, 8, 0),
(317, 'GPU Mini 8GB', 16, 349.99, 6, 0),
(318, 'GPU Gamer 650 16GB', 16, 699.99, 0, 0),
(319, 'GPU Gamer 900 32GB', 16, 1999.99, 0, 0),
(320, 'Legacy GPU 1GB', 16, 49.99, 2, 1),

-- ------------------------------------------------------------
-- Processors (321-340)
-- ------------------------------------------------------------

(321, 'CPU Core 3 4-Core', 17, 109.99, 21, 0),
(322, 'CPU Core 5 6-Core', 17, 179.99, 24, 0),
(323, 'CPU Core 5 Plus 6-Core', 17, 219.99, 17, 0),
(324, 'CPU Core 7 8-Core', 17, 299.99, 15, 0),
(325, 'CPU Core 7 Plus 12-Core', 17, 379.99, 10, 0),
(326, 'CPU Core 9 16-Core', 17, 549.99, 7, 0),
(327, 'CPU Core 9 Plus 24-Core', 17, 649.99, 4, 0),
(328, 'CPU Ryzo 3 4-Core', 17, 99.99, 18, 0),
(329, 'CPU Ryzo 5 6-Core', 17, 159.99, 23, 0),
(330, 'CPU Ryzo 5 Plus 8-Core', 17, 209.99, 16, 0),
(331, 'CPU Ryzo 7 8-Core', 17, 279.99, 14, 0),
(332, 'CPU Ryzo 7 Plus 12-Core', 17, 359.99, 9, 0),
(333, 'CPU Ryzo 9 16-Core', 17, 529.99, 6, 0),
(334, 'CPU Ryzo 9 Plus 16-Core', 17, 699.99, 3, 0),
(335, 'CPU Workstation 32-Core', 17, 1999.99, 1, 0),
(336, 'CPU Workstation 64-Core', 17, 4499.99, 1, 0),
(337, 'CPU Core 5 Low Power', 17, 149.99, 11, 0),
(338, 'CPU Ryzo 5 Graphics 6-Core', 17, 189.99, 12, 0),
(339, 'CPU Core 9 Extreme 24-Core', 17, 799.99, 0, 0),
(340, 'Legacy CPU 2-Core', 17, 39.99, 3, 1),

-- ------------------------------------------------------------
-- Memory (341-360)
-- ------------------------------------------------------------

(341, 'DDR4 RAM 8GB', 18, 24.99, 64, 0),
(342, 'DDR4 RAM 16GB (2x8GB)', 18, 44.99, 55, 0),
(343, 'DDR4 RAM 32GB (2x16GB)', 18, 79.99, 38, 0),
(344, 'DDR4 RAM 64GB (2x32GB)', 18, 149.99, 15, 0),
(345, 'DDR5 RAM 16GB', 18, 59.99, 42, 0),
(346, 'DDR5 RAM 32GB (2x16GB)', 18, 109.99, 33, 0),
(347, 'DDR5 RAM 64GB (2x32GB)', 18, 199.99, 18, 0),
(348, 'DDR5 RAM 96GB (2x48GB)', 18, 299.99, 8, 0),
(349, 'DDR5 RAM 128GB (4x32GB)', 18, 429.99, 5, 0),
(350, 'DDR5 RGB RAM 32GB', 18, 129.99, 21, 0),
(351, 'Laptop RAM DDR4 8GB', 18, 22.99, 47, 0),
(352, 'Laptop RAM DDR4 16GB', 18, 39.99, 39, 0),
(353, 'Laptop RAM DDR5 16GB', 18, 54.99, 31, 0),
(354, 'Laptop RAM DDR5 32GB', 18, 99.99, 19, 0),
(355, 'Server RAM ECC 32GB', 18, 179.99, 9, 0),
(356, 'Server RAM ECC 64GB', 18, 329.99, 4, 0),
(357, 'DDR5 RAM 48GB (2x24GB)', 18, 159.99, 0, 0),
(358, 'DDR4 RGB RAM 16GB', 18, 54.99, 26, 0),
(359, 'DDR5 RAM 32GB Low Profile', 18, 119.99, 11, 0),
(360, 'Legacy DDR3 RAM 8GB', 18, 19.99, 4, 1),

-- ------------------------------------------------------------
-- Motherboards (361-380)
-- ------------------------------------------------------------

(361, 'Motherboard Micro A1', 19, 89.99, 18, 0),
(362, 'Motherboard Micro A2', 19, 109.99, 16, 0),
(363, 'Motherboard ATX B1', 19, 139.99, 15, 0),
(364, 'Motherboard ATX B2', 19, 169.99, 13, 0),
(365, 'Motherboard ATX B3', 19, 199.99, 11, 0),
(366, 'Motherboard Gaming X1', 19, 249.99, 9, 0),
(367, 'Motherboard Gaming X2', 19, 299.99, 8, 0),
(368, 'Motherboard Gaming X3', 19, 379.99, 5, 0),
(369, 'Motherboard Creator Z1', 19, 449.99, 4, 0),
(370, 'Motherboard Creator Z2', 19, 599.99, 3, 0),
(371, 'Motherboard Mini ITX 1', 19, 159.99, 7, 0),
(372, 'Motherboard Mini ITX 2', 19, 229.99, 6, 0),
(373, 'Motherboard Workstation W1', 19, 799.99, 2, 0),
(374, 'Motherboard Ryzo ATX 1', 19, 149.99, 14, 0),
(375, 'Motherboard Ryzo ATX 2', 19, 199.99, 12, 0),
(376, 'Motherboard Ryzo Gaming 1', 19, 279.99, 8, 0),
(377, 'Motherboard Ryzo Gaming 2', 19, 349.99, 0, 0),
(378, 'Motherboard Ryzo Micro 1', 19, 99.99, 17, 0),
(379, 'Motherboard Ryzo ITX 1', 19, 189.99, 6, 0),
(380, 'Legacy Motherboard', 19, 59.99, 1, 1),

-- ------------------------------------------------------------
-- Power Supplies (381-400)
-- ------------------------------------------------------------

(381, 'Power Supply 450W', 20, 44.99, 26, 0),
(382, 'Power Supply 550W', 20, 54.99, 31, 0),
(383, 'Power Supply 650W', 20, 69.99, 28, 0),
(384, 'Power Supply 750W', 20, 89.99, 24, 0),
(385, 'Power Supply 850W', 20, 109.99, 18, 0),
(386, 'Power Supply 1000W', 20, 149.99, 12, 0),
(387, 'Power Supply 1200W', 20, 219.99, 6, 0),
(388, 'Modular Power Supply 650W', 20, 89.99, 15, 0),
(389, 'Modular Power Supply 750W', 20, 109.99, 17, 0),
(390, 'Modular Power Supply 850W', 20, 129.99, 14, 0),
(391, 'Modular Power Supply 1000W', 20, 179.99, 9, 0),
(392, 'Platinum Power Supply 850W', 20, 179.99, 7, 0),
(393, 'Platinum Power Supply 1000W', 20, 239.99, 5, 0),
(394, 'Titanium Power Supply 1200W', 20, 349.99, 3, 0),
(395, 'SFX Power Supply 600W', 20, 99.99, 10, 0),
(396, 'SFX Power Supply 750W', 20, 139.99, 8, 0),
(397, 'Quiet Power Supply 650W', 20, 99.99, 0, 0),
(398, 'Power Supply Cable Kit', 20, 29.99, 33, 0),
(399, 'Power Supply Tester', 20, 19.99, 22, 0),
(400, 'Legacy Power Supply 350W', 20, 29.99, 2, 1),

-- ------------------------------------------------------------
-- Computer Cases (401-420)
-- ------------------------------------------------------------

(401, 'Case Micro Basic', 21, 49.99, 22, 0),
(402, 'Case Mid Tower Basic', 21, 59.99, 27, 0),
(403, 'Case Mid Tower Airflow', 21, 79.99, 24, 0),
(404, 'Case Mid Tower Glass', 21, 99.99, 19, 0),
(405, 'Case Mid Tower RGB', 21, 119.99, 15, 0),
(406, 'Case Full Tower 1', 21, 149.99, 9, 0),
(407, 'Case Full Tower 2', 21, 199.99, 6, 0),
(408, 'Case Mini ITX 1', 21, 89.99, 11, 0),
(409, 'Case Mini ITX 2', 21, 129.99, 7, 0),
(410, 'Case Silent Tower', 21, 139.99, 8, 0),
(411, 'Case Showcase Dual Chamber', 21, 179.99, 5, 0),
(412, 'Case Workstation Tower', 21, 249.99, 3, 0),
(413, 'Case Compact Cube', 21, 109.99, 9, 0),
(414, 'Case Open Frame', 21, 169.99, 4, 0),
(415, 'Case Mid Tower White', 21, 89.99, 16, 0),
(416, 'Case Mid Tower Black', 21, 89.99, 18, 0),
(417, 'Case HTPC Slim', 21, 99.99, 0, 0),
(418, 'Case Fan Kit 3 Pack', 21, 39.99, 37, 0),
(419, 'Case Dust Filter Set', 21, 14.99, 41, 0),
(420, 'Legacy Case Tower', 21, 39.99, 1, 1),

-- ------------------------------------------------------------
-- Cooling (421-440)
-- ------------------------------------------------------------

(421, 'CPU Air Cooler Basic', 22, 24.99, 35, 0),
(422, 'CPU Air Cooler 100', 22, 34.99, 30, 0),
(423, 'CPU Air Cooler 200', 22, 49.99, 26, 0),
(424, 'CPU Air Cooler Pro', 22, 89.99, 14, 0),
(425, 'Liquid Cooler 120mm', 22, 79.99, 15, 0),
(426, 'Liquid Cooler 240mm', 22, 119.99, 13, 0),
(427, 'Liquid Cooler 280mm', 22, 139.99, 9, 0),
(428, 'Liquid Cooler 360mm', 22, 169.99, 8, 0),
(429, 'Liquid Cooler 360mm RGB', 22, 199.99, 6, 0),
(430, 'Case Fan 120mm', 22, 9.99, 95, 0),
(431, 'Case Fan 140mm', 22, 12.99, 78, 0),
(432, 'RGB Case Fan 120mm 3 Pack', 22, 44.99, 31, 0),
(433, 'Thermal Paste 4g', 22, 7.99, 110, 0),
(434, 'Thermal Paste Pro', 22, 12.99, 72, 0),
(435, 'Laptop Cooling Pad', 22, 29.99, 34, 0),
(436, 'Laptop Cooling Pad Pro', 22, 49.99, 18, 0),
(437, 'Fan Controller', 22, 34.99, 12, 0),
(438, 'Low Profile CPU Cooler', 22, 39.99, 16, 0),
(439, 'GPU Support Bracket', 22, 14.99, 0, 0),
(440, 'Legacy CPU Cooler', 22, 14.99, 3, 1),

-- ------------------------------------------------------------
-- Smartphones (441-460)
-- ------------------------------------------------------------

(441, 'Phone Lite 64GB', 23, 179.99, 33, 0),
(442, 'Phone Lite 128GB', 23, 219.99, 28, 0),
(443, 'Phone 5 128GB', 23, 399.99, 21, 0),
(444, 'Phone 5 256GB', 23, 459.99, 17, 0),
(445, 'Phone 6 128GB', 23, 599.99, 19, 0),
(446, 'Phone 6 256GB', 23, 699.99, 14, 0),
(447, 'Phone 6 Plus 256GB', 23, 799.99, 11, 0),
(448, 'Phone Pro 256GB', 23, 999.99, 9, 0),
(449, 'Phone Pro 512GB', 23, 1199.99, 6, 0),
(450, 'Phone Pro Max 512GB', 23, 1299.99, 5, 0),
(451, 'Phone Pro Max 1TB', 23, 1499.99, 0, 0),
(452, 'Phone Fold 512GB', 23, 1799.99, 2, 0),
(453, 'Phone Flip 256GB', 23, 999.99, 4, 0),
(454, 'Phone Rugged 128GB', 23, 449.99, 7, 0),
(455, 'Phone Mini 128GB', 23, 499.99, 10, 0),
(456, 'Phone Senior Easy', 23, 99.99, 15, 0),
(457, 'Phone Basic Flip', 23, 49.99, 24, 0),
(458, 'Phone Gaming 512GB', 23, 899.99, 3, 0),
(459, 'Phone 6 Refurbished 128GB', 23, 449.99, 8, 0),
(460, 'Legacy Phone 4 64GB', 23, 249.99, 0, 1),

-- ------------------------------------------------------------
-- Smartwatches (461-480)
-- ------------------------------------------------------------

(461, 'Fitness Band 1', 24, 39.99, 45, 0),
(462, 'Fitness Band 2', 24, 59.99, 36, 0),
(463, 'Fitness Band Pro', 24, 89.99, 22, 0),
(464, 'Smartwatch 100', 24, 149.99, 25, 0),
(465, 'Smartwatch 200', 24, 199.99, 19, 0),
(466, 'Smartwatch 300', 24, 249.99, 15, 0),
(467, 'Smartwatch Pro', 24, 399.99, 9, 0),
(468, 'Smartwatch Pro Cellular', 24, 499.99, 6, 0),
(469, 'Smartwatch Sport', 24, 299.99, 11, 0),
(470, 'Smartwatch Outdoor', 24, 449.99, 5, 0),
(471, 'Smartwatch Ultra', 24, 799.99, 2, 0),
(472, 'Kids Smartwatch', 24, 79.99, 18, 0),
(473, 'Smartwatch Classic Leather', 24, 349.99, 7, 0),
(474, 'Smart Ring', 24, 299.99, 0, 0),
(475, 'Watch Band Silicone', 24, 14.99, 64, 0),
(476, 'Watch Band Metal', 24, 39.99, 28, 0),
(477, 'Watch Charger Dock', 24, 24.99, 41, 0),
(478, 'Watch Screen Protector 2 Pack', 24, 9.99, 83, 0),
(479, 'Smartwatch Mini', 24, 129.99, 13, 0),
(480, 'Legacy Smartwatch 1', 24, 99.99, 1, 1),

-- ------------------------------------------------------------
-- Projectors (481-500)
-- ------------------------------------------------------------

(481, 'Mini Projector', 25, 79.99, 21, 0),
(482, 'Portable Projector 100', 25, 149.99, 15, 0),
(483, 'Portable Projector 200', 25, 229.99, 11, 0),
(484, 'Home Projector 720p', 25, 199.99, 12, 0),
(485, 'Home Projector 1080p', 25, 349.99, 9, 0),
(486, 'Home Projector 1080p Pro', 25, 499.99, 7, 0),
(487, 'Home Projector 4K', 25, 899.99, 4, 0),
(488, 'Home Projector 4K Pro', 25, 1499.99, 2, 0),
(489, 'Short Throw Projector 1', 25, 799.99, 3, 0),
(490, 'Short Throw Projector 4K', 25, 1999.99, 1, 0),
(491, 'Office Projector 1', 25, 449.99, 8, 0),
(492, 'Office Projector 2', 25, 649.99, 5, 0),
(493, 'Classroom Projector', 25, 549.99, 6, 0),
(494, 'Laser Projector 4K', 25, 2999.99, 0, 0),
(495, 'Projector Screen 100 Inch', 25, 89.99, 14, 0),
(496, 'Projector Screen 120 Inch', 25, 129.99, 9, 0),
(497, 'Projector Ceiling Mount', 25, 39.99, 22, 0),
(498, 'Projector Stand', 25, 49.99, 17, 0),
(499, 'Projector Carry Case', 25, 34.99, 13, 0),
(500, 'Legacy Projector SVGA', 25, 299.99, 1, 1),

-- ------------------------------------------------------------
-- Docking Stations (501-520)
-- ------------------------------------------------------------

(501, 'USB-C Dock 5-in-1', 26, 49.99, 34, 0),
(502, 'USB-C Dock 7-in-1', 26, 69.99, 29, 0),
(503, 'USB-C Dock 9-in-1', 26, 89.99, 23, 0),
(504, 'USB-C Dock 12-in-1', 26, 129.99, 16, 0),
(505, 'Thunderbolt Dock 1', 26, 199.99, 12, 0),
(506, 'Thunderbolt Dock 2', 26, 249.99, 9, 0),
(507, 'Thunderbolt Dock Pro', 26, 329.99, 6, 0),
(508, 'Dual Monitor Dock', 26, 149.99, 14, 0),
(509, 'Triple Monitor Dock', 26, 219.99, 8, 0),
(510, 'Universal Laptop Dock', 26, 179.99, 10, 0),
(511, 'Vertical Laptop Dock', 26, 59.99, 13, 0),
(512, 'Travel Dock Mini', 26, 39.99, 27, 0),
(513, 'Business Dock 100', 26, 159.99, 11, 0),
(514, 'Business Dock 200', 26, 239.99, 7, 0),
(515, 'Docking Station Stand', 26, 99.99, 9, 0),
(516, 'SSD Enclosure Dock', 26, 44.99, 19, 0),
(517, 'Drive Docking Station 2 Bay', 26, 59.99, 12, 0),
(518, 'Tablet Dock', 26, 49.99, 0, 0),
(519, 'Phone Dock', 26, 29.99, 25, 0),
(520, 'Legacy USB 3.0 Dock', 26, 59.99, 2, 1),

-- ------------------------------------------------------------
-- Power Protection (521-540)
-- ------------------------------------------------------------

(521, 'Surge Protector 6 Outlet', 27, 14.99, 72, 0),
(522, 'Surge Protector 8 Outlet', 27, 24.99, 51, 0),
(523, 'Surge Protector 12 Outlet', 27, 39.99, 33, 0),
(524, 'Surge Protector USB', 27, 29.99, 46, 0),
(525, 'Travel Surge Protector', 27, 19.99, 38, 0),
(526, 'UPS 450VA', 27, 59.99, 18, 0),
(527, 'UPS 600VA', 27, 79.99, 21, 0),
(528, 'UPS 900VA', 27, 119.99, 14, 0),
(529, 'UPS 1500VA', 27, 189.99, 9, 0),
(530, 'UPS 2200VA', 27, 349.99, 4, 0),
(531, 'UPS Rack Mount 1500VA', 27, 499.99, 2, 0),
(532, 'UPS Replacement Battery', 27, 49.99, 15, 0),
(533, 'Power Strip Basic', 27, 9.99, 85, 0),
(534, 'Power Strip Desk Mount', 27, 34.99, 22, 0),
(535, 'Smart Power Strip', 27, 44.99, 19, 0),
(536, 'Extension Cord 10ft', 27, 12.99, 61, 0),
(537, 'Extension Cord 25ft', 27, 19.99, 43, 0),
(538, 'Line Conditioner', 27, 149.99, 0, 0),
(539, 'Portable Power Station 500Wh', 27, 449.99, 5, 0),
(540, 'Legacy Surge Protector', 27, 9.99, 3, 1),

-- ------------------------------------------------------------
-- Software (541-560)
-- ------------------------------------------------------------

(541, 'Office Suite Home', 28, 69.99, 200, 0),
(542, 'Office Suite Business', 28, 249.99, 120, 0),
(543, 'Office Suite Subscription 1 Year', 28, 99.99, 250, 0),
(544, 'Antivirus 1 Device', 28, 29.99, 300, 0),
(545, 'Antivirus 3 Devices', 28, 49.99, 260, 0),
(546, 'Internet Security 5 Devices', 28, 79.99, 180, 0),
(547, 'Photo Editor', 28, 79.99, 90, 0),
(548, 'Photo Editor Pro', 28, 199.99, 60, 0),
(549, 'Video Editor', 28, 99.99, 75, 0),
(550, 'Video Editor Pro', 28, 299.99, 40, 0),
(551, 'Operating System Home', 28, 139.99, 110, 0),
(552, 'Operating System Pro', 28, 199.99, 95, 0),
(553, 'Backup Software', 28, 49.99, 85, 0),
(554, 'PDF Editor', 28, 119.99, 70, 0),
(555, 'Password Manager 1 Year', 28, 39.99, 150, 0),
(556, 'VPN Service 1 Year', 28, 59.99, 140, 0),
(557, 'Accounting Software', 28, 179.99, 45, 0),
(558, 'Typing Tutor', 28, 24.99, 65, 0),
(559, '3D Modeling Suite', 28, 499.99, 20, 0),
(560, 'Legacy Office Suite 2016', 28, 49.99, 0, 1),

-- ------------------------------------------------------------
-- Game Controllers (561-580)
-- ------------------------------------------------------------

(561, 'Wired Gamepad', 29, 24.99, 48, 0),
(562, 'Wireless Gamepad 100', 29, 39.99, 41, 0),
(563, 'Wireless Gamepad 200', 29, 59.99, 32, 0),
(564, 'Wireless Gamepad Pro', 29, 129.99, 15, 0),
(565, 'Arcade Fight Stick', 29, 149.99, 7, 0),
(566, 'Racing Wheel 100', 29, 199.99, 8, 0),
(567, 'Racing Wheel Pro', 29, 449.99, 3, 0),
(568, 'Racing Pedals Set', 29, 99.99, 9, 0),
(569, 'Flight Stick', 29, 79.99, 11, 0),
(570, 'Flight HOTAS Kit', 29, 249.99, 4, 0),
(571, 'Mobile Game Controller', 29, 49.99, 26, 0),
(572, 'Retro Gamepad 2 Pack', 29, 29.99, 35, 0),
(573, 'Controller Charging Station', 29, 29.99, 31, 0),
(574, 'Controller Battery Pack', 29, 19.99, 44, 0),
(575, 'Controller Thumb Grips', 29, 8.99, 77, 0),
(576, 'Adaptive Controller', 29, 99.99, 6, 0),
(577, 'One-Handed Gaming Keypad', 29, 69.99, 10, 0),
(578, 'Wireless Gamepad Elite', 29, 179.99, 0, 0),
(579, 'Gamepad Carry Case', 29, 19.99, 22, 0),
(580, 'Legacy Joystick', 29, 19.99, 2, 1),

-- ------------------------------------------------------------
-- VR Headsets (581-600)
-- ------------------------------------------------------------

(581, 'VR Headset Starter', 30, 199.99, 12, 0),
(582, 'VR Headset 128GB', 30, 299.99, 15, 0),
(583, 'VR Headset 256GB', 30, 399.99, 10, 0),
(584, 'VR Headset Pro', 30, 999.99, 4, 0),
(585, 'VR Headset PC Tethered', 30, 499.99, 6, 0),
(586, 'VR Headset PC Pro', 30, 899.99, 3, 0),
(587, 'Mixed Reality Headset', 30, 1499.99, 2, 0),
(588, 'Mixed Reality Headset Pro', 30, 3499.99, 0, 0),
(589, 'VR Head Strap Comfort', 30, 29.99, 34, 0),
(590, 'VR Head Strap Battery', 30, 69.99, 19, 0),
(591, 'VR Controller Grips', 30, 19.99, 27, 0),
(592, 'VR Link Cable 16ft', 30, 39.99, 18, 0),
(593, 'VR Lens Protector', 30, 9.99, 52, 0),
(594, 'VR Face Cushion', 30, 24.99, 30, 0),
(595, 'VR Carry Case', 30, 39.99, 21, 0),
(596, 'VR Charging Dock', 30, 49.99, 14, 0),
(597, 'VR Prescription Lens Inserts', 30, 79.99, 8, 0),
(598, 'VR Fitness Accessory Kit', 30, 34.99, 16, 0),
(599, 'VR Base Station', 30, 149.99, 5, 0),
(600, 'Legacy VR Headset 1', 30, 149.99, 1, 1),

-- ------------------------------------------------------------
-- Drawing Tablets (601-620)
-- ------------------------------------------------------------

(601, 'Drawing Tablet Small', 31, 39.99, 33, 0),
(602, 'Drawing Tablet Medium', 31, 69.99, 26, 0),
(603, 'Drawing Tablet Large', 31, 119.99, 15, 0),
(604, 'Drawing Tablet Wireless Medium', 31, 99.99, 18, 0),
(605, 'Drawing Tablet Pro Medium', 31, 249.99, 9, 0),
(606, 'Drawing Tablet Pro Large', 31, 449.99, 5, 0),
(607, 'Pen Display 13', 31, 299.99, 8, 0),
(608, 'Pen Display 16', 31, 549.99, 6, 0),
(609, 'Pen Display 22', 31, 899.99, 3, 0),
(610, 'Pen Display Pro 24', 31, 1999.99, 1, 0),
(611, 'Pen Display Pro 16', 31, 1299.99, 2, 0),
(612, 'Replacement Pen Standard', 31, 29.99, 37, 0),
(613, 'Replacement Pen Pro', 31, 79.99, 14, 0),
(614, 'Pen Nibs 10 Pack', 31, 9.99, 88, 0),
(615, 'Drawing Glove 2 Pack', 31, 9.99, 61, 0),
(616, 'Pen Display Stand', 31, 49.99, 12, 0),
(617, 'Express Key Remote', 31, 79.99, 9, 0),
(618, 'Student Drawing Tablet', 31, 29.99, 42, 0),
(619, 'Drawing Tablet Medium Bundle', 31, 149.99, 0, 0),
(620, 'Legacy Drawing Tablet', 31, 49.99, 2, 1),

-- ------------------------------------------------------------
-- Office Furniture (621-640)
-- ------------------------------------------------------------

(621, 'Computer Desk Basic', 32, 99.99, 14, 0),
(622, 'Computer Desk Large', 32, 179.99, 9, 0),
(623, 'L-Shaped Desk', 32, 249.99, 6, 0),
(624, 'Standing Desk Manual', 32, 249.99, 7, 0),
(625, 'Standing Desk Electric', 32, 399.99, 8, 0),
(626, 'Standing Desk Electric Pro', 32, 649.99, 4, 0),
(627, 'Gaming Desk', 32, 199.99, 10, 0),
(628, 'Office Chair Basic', 32, 79.99, 18, 0),
(629, 'Office Chair Mesh', 32, 149.99, 15, 0),
(630, 'Office Chair Ergonomic', 32, 299.99, 9, 0),
(631, 'Office Chair Ergonomic Pro', 32, 599.99, 4, 0),
(632, 'Gaming Chair 100', 32, 179.99, 11, 0),
(633, 'Gaming Chair Pro', 32, 349.99, 5, 0),
(634, 'Desk Mat Large', 32, 19.99, 52, 0),
(635, 'Footrest', 32, 29.99, 26, 0),
(636, 'Monitor Arm Single', 32, 49.99, 23, 0),
(637, 'Monitor Arm Dual', 32, 89.99, 16, 0),
(638, 'Under Desk Drawer', 32, 24.99, 31, 0),
(639, 'Chair Mat', 32, 39.99, 0, 0),
(640, 'Legacy Office Chair', 32, 69.99, 2, 1),

-- ------------------------------------------------------------
-- Smart Home (641-660)
-- ------------------------------------------------------------

(641, 'Smart Plug', 33, 14.99, 85, 0),
(642, 'Smart Plug 4 Pack', 33, 44.99, 38, 0),
(643, 'Smart Bulb White', 33, 9.99, 110, 0),
(644, 'Smart Bulb Color', 33, 19.99, 79, 0),
(645, 'Smart Bulb Color 4 Pack', 33, 64.99, 27, 0),
(646, 'Smart Light Strip 16ft', 33, 34.99, 41, 0),
(647, 'Smart Thermostat', 33, 129.99, 14, 0),
(648, 'Smart Thermostat Pro', 33, 229.99, 8, 0),
(649, 'Smart Lock', 33, 179.99, 10, 0),
(650, 'Smart Lock Pro', 33, 279.99, 6, 0),
(651, 'Video Doorbell', 33, 99.99, 17, 0),
(652, 'Video Doorbell Pro', 33, 199.99, 9, 0),
(653, 'Smart Hub', 33, 79.99, 13, 0),
(654, 'Smart Display 7', 33, 89.99, 16, 0),
(655, 'Smart Display 10', 33, 179.99, 8, 0),
(656, 'Smart Smoke Detector', 33, 109.99, 11, 0),
(657, 'Smart Water Leak Sensor', 33, 29.99, 33, 0),
(658, 'Smart Motion Sensor', 33, 24.99, 36, 0),
(659, 'Smart Blinds Motor', 33, 149.99, 0, 0),
(660, 'Legacy Smart Hub', 33, 49.99, 1, 1),

-- ------------------------------------------------------------
-- Security Cameras (661-680)
-- ------------------------------------------------------------

(661, 'Indoor Camera 1080p', 34, 29.99, 46, 0),
(662, 'Indoor Camera 2K', 34, 49.99, 34, 0),
(663, 'Indoor Pan Tilt Camera', 34, 59.99, 27, 0),
(664, 'Outdoor Camera 1080p', 34, 79.99, 22, 0),
(665, 'Outdoor Camera 2K', 34, 119.99, 17, 0),
(666, 'Outdoor Camera 4K', 34, 179.99, 9, 0),
(667, 'Floodlight Camera', 34, 199.99, 8, 0),
(668, 'Spotlight Camera', 34, 149.99, 11, 0),
(669, 'Battery Camera 1', 34, 99.99, 15, 0),
(670, 'Battery Camera 2 Pack', 34, 179.99, 9, 0),
(671, 'Solar Panel for Camera', 34, 39.99, 21, 0),
(672, 'Baby Monitor Camera', 34, 89.99, 13, 0),
(673, 'Pet Camera Treat Dispenser', 34, 129.99, 7, 0),
(674, 'Security System 4 Camera', 34, 399.99, 5, 0),
(675, 'Security System 8 Camera', 34, 699.99, 3, 0),
(676, 'Network Video Recorder 8 Channel', 34, 249.99, 4, 0),
(677, 'Dash Camera', 34, 69.99, 19, 0),
(678, 'Dash Camera Front and Rear', 34, 129.99, 0, 0),
(679, 'Camera Mount Kit', 34, 14.99, 39, 0),
(680, 'Legacy IP Camera', 34, 39.99, 2, 1),

-- ------------------------------------------------------------
-- Bags and Cases (681-700)
-- ------------------------------------------------------------

(681, 'Laptop Sleeve 13', 35, 19.99, 54, 0),
(682, 'Laptop Sleeve 15', 35, 22.99, 49, 0),
(683, 'Laptop Backpack Basic', 35, 39.99, 37, 0),
(684, 'Laptop Backpack Pro', 35, 89.99, 21, 0),
(685, 'Laptop Backpack Travel', 35, 119.99, 12, 0),
(686, 'Laptop Messenger Bag', 35, 59.99, 18, 0),
(687, 'Laptop Briefcase', 35, 79.99, 13, 0),
(688, 'Rolling Laptop Case', 35, 149.99, 6, 0),
(689, 'Tablet Case 10', 35, 24.99, 43, 0),
(690, 'Tablet Keyboard Case', 35, 79.99, 19, 0),
(691, 'Phone Case Clear', 35, 14.99, 92, 0),
(692, 'Phone Case Rugged', 35, 29.99, 57, 0),
(693, 'Phone Wallet Case', 35, 24.99, 38, 0),
(694, 'Hard Drive Case', 35, 12.99, 46, 0),
(695, 'Tech Organizer Pouch', 35, 19.99, 41, 0),
(696, 'Camera Bag', 35, 49.99, 15, 0),
(697, 'Gaming Laptop Backpack', 35, 129.99, 9, 0),
(698, 'Headphone Case', 35, 17.99, 33, 0),
(699, 'Hard Shell Equipment Case', 35, 99.99, 0, 0),
(700, 'Legacy Laptop Bag', 35, 29.99, 3, 1),

-- ------------------------------------------------------------
-- Chargers and Batteries (701-720)
-- ------------------------------------------------------------

(701, 'USB-C Charger 20W', 36, 19.99, 76, 0),
(702, 'USB-C Charger 30W', 36, 24.99, 63, 0),
(703, 'USB-C Charger 65W', 36, 44.99, 41, 0),
(704, 'USB-C Charger 100W', 36, 69.99, 26, 0),
(705, 'GaN Charger 3 Port', 36, 59.99, 33, 0),
(706, 'Wireless Charger Pad', 36, 24.99, 47, 0),
(707, 'Wireless Charger Stand', 36, 34.99, 35, 0),
(708, '3-in-1 Wireless Charger', 36, 79.99, 16, 0),
(709, 'Power Bank 5000mAh', 36, 19.99, 58, 0),
(710, 'Power Bank 10000mAh', 36, 29.99, 61, 0),
(711, 'Power Bank 20000mAh', 36, 49.99, 37, 0),
(712, 'Laptop Power Bank 26800mAh', 36, 129.99, 11, 0),
(713, 'Car Charger Dual USB', 36, 14.99, 52, 0),
(714, 'AA Rechargeable Batteries 8 Pack', 36, 24.99, 44, 0),
(715, 'AAA Rechargeable Batteries 8 Pack', 36, 22.99, 39, 0),
(716, 'Battery Charger AA/AAA', 36, 19.99, 28, 0),
(717, 'Universal Laptop Charger', 36, 49.99, 22, 0),
(718, 'Replacement Laptop Battery', 36, 79.99, 9, 0),
(719, 'Charging Station 6 Port', 36, 54.99, 0, 0),
(720, 'Legacy Micro-USB Charger', 36, 9.99, 4, 1),

-- ------------------------------------------------------------
-- Cleaning Supplies (721-740)
-- ------------------------------------------------------------

(721, 'Screen Cleaning Kit', 37, 9.99, 120, 0),
(722, 'Screen Cleaning Spray', 37, 7.99, 98, 0),
(723, 'Microfiber Cloth 6 Pack', 37, 11.99, 86, 0),
(724, 'Compressed Air 2 Pack', 37, 14.99, 75, 0),
(725, 'Compressed Air 6 Pack', 37, 34.99, 36, 0),
(726, 'Electric Air Duster', 37, 59.99, 18, 0),
(727, 'Keyboard Cleaning Gel', 37, 8.99, 67, 0),
(728, 'Electronics Wipes 80 Count', 37, 9.99, 81, 0),
(729, 'Cleaning Swabs 100 Pack', 37, 6.99, 94, 0),
(730, 'Mini Vacuum for Keyboards', 37, 24.99, 23, 0),
(731, 'Anti-Static Wrist Strap', 37, 7.99, 55, 0),
(732, 'Anti-Static Mat', 37, 24.99, 19, 0),
(733, 'Precision Screwdriver Set', 37, 29.99, 34, 0),
(734, 'PC Toolkit Pro', 37, 49.99, 16, 0),
(735, 'Isopropyl Alcohol 99% 16oz', 37, 12.99, 42, 0),
(736, 'Lens Cleaning Pen', 37, 8.99, 51, 0),
(737, 'Phone Sanitizer Box', 37, 49.99, 9, 0),
(738, 'Thermal Pad Kit', 37, 14.99, 27, 0),
(739, 'Cable Ties 100 Pack', 37, 5.99, 0, 0),
(740, 'Legacy Cleaning Kit', 37, 4.99, 6, 1),

-- ------------------------------------------------------------
-- Network Storage (741-760)
-- ------------------------------------------------------------

(741, 'NAS 1 Bay', 38, 129.99, 11, 0),
(742, 'NAS 2 Bay', 38, 199.99, 14, 0),
(743, 'NAS 2 Bay Plus', 38, 299.99, 9, 0),
(744, 'NAS 4 Bay', 38, 449.99, 6, 0),
(745, 'NAS 4 Bay Plus', 38, 599.99, 4, 0),
(746, 'NAS 6 Bay', 38, 899.99, 2, 0),
(747, 'NAS 8 Bay Rackmount', 38, 1599.99, 1, 0),
(748, 'NAS Drive 4TB', 38, 109.99, 18, 0),
(749, 'NAS Drive 8TB', 38, 189.99, 13, 0),
(750, 'NAS Drive 12TB', 38, 269.99, 8, 0),
(751, 'NAS Drive 16TB', 38, 349.99, 5, 0),
(752, 'NAS Drive 20TB', 38, 449.99, 3, 0),
(753, 'Personal Cloud Drive 4TB', 38, 179.99, 10, 0),
(754, 'Personal Cloud Drive 8TB', 38, 279.99, 7, 0),
(755, 'NAS SSD Cache 1TB', 38, 129.99, 9, 0),
(756, 'NAS Memory Upgrade 8GB', 38, 69.99, 12, 0),
(757, 'NAS 10GbE Network Card', 38, 149.99, 0, 0),
(758, 'Network Media Server', 38, 249.99, 4, 0),
(759, 'NAS 2 Bay Bundle 4TB', 38, 399.99, 5, 0),
(760, 'Legacy NAS 2 Bay', 38, 149.99, 1, 1),

-- ------------------------------------------------------------
-- E-Readers (761-780)
-- ------------------------------------------------------------

(761, 'E-Reader Basic 6', 39, 99.99, 29, 0),
(762, 'E-Reader 6 Ad-Free', 39, 119.99, 22, 0),
(763, 'E-Reader Paper 7', 39, 149.99, 25, 0),
(764, 'E-Reader Paper 7 32GB', 39, 179.99, 16, 0),
(765, 'E-Reader Paper Signature', 39, 199.99, 12, 0),
(766, 'E-Reader Color 7', 39, 219.99, 9, 0),
(767, 'E-Reader Oasis 7', 39, 249.99, 7, 0),
(768, 'E-Reader Kids 6', 39, 119.99, 18, 0),
(769, 'E-Reader Writer 10', 39, 339.99, 5, 0),
(770, 'E-Reader Writer 10 Premium', 39, 399.99, 3, 0),
(771, 'E-Reader Waterproof 6', 39, 129.99, 14, 0),
(772, 'E-Reader Cover Basic', 39, 19.99, 46, 0),
(773, 'E-Reader Cover Leather', 39, 39.99, 21, 0),
(774, 'E-Reader Kids Cover', 39, 24.99, 26, 0),
(775, 'E-Reader Stylus', 39, 59.99, 11, 0),
(776, 'E-Reader Charging Dock', 39, 29.99, 17, 0),
(777, 'E-Reader Screen Protector', 39, 9.99, 38, 0),
(778, 'E-Reader Book Light', 39, 14.99, 33, 0),
(779, 'E-Reader Color 7 Cellular', 39, 299.99, 0, 0),
(780, 'Legacy E-Reader Touch', 39, 79.99, 2, 1),

-- ------------------------------------------------------------
-- Streaming Devices (781-800)
-- ------------------------------------------------------------

(781, 'Streaming Stick HD', 40, 29.99, 52, 0),
(782, 'Streaming Stick 4K', 40, 49.99, 44, 0),
(783, 'Streaming Stick 4K Max', 40, 59.99, 31, 0),
(784, 'Streaming Box 4K', 40, 99.99, 22, 0),
(785, 'Streaming Box Pro', 40, 149.99, 13, 0),
(786, 'Streaming Box Gaming', 40, 199.99, 8, 0),
(787, 'Capture Card 1080p', 40, 99.99, 15, 0),
(788, 'Capture Card 4K', 40, 179.99, 9, 0),
(789, 'Capture Card Pro 4K', 40, 249.99, 5, 0),
(790, 'Stream Deck Mini', 40, 59.99, 18, 0),
(791, 'Stream Deck 15 Key', 40, 149.99, 12, 0),
(792, 'Stream Deck XL', 40, 249.99, 6, 0),
(793, 'Ring Light 10 Inch', 40, 29.99, 39, 0),
(794, 'Ring Light 18 Inch', 40, 69.99, 17, 0),
(795, 'Key Light Panel', 40, 129.99, 9, 0),
(796, 'Green Screen Collapsible', 40, 99.99, 7, 0),
(797, 'HDMI Splitter 4K', 40, 24.99, 28, 0),
(798, 'Universal Remote', 40, 39.99, 23, 0),
(799, 'Video Switcher 4 Input', 40, 299.99, 0, 0),
(800, 'Legacy Media Player', 40, 39.99, 1, 1);


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
(30, 'Ashley', 'Moore', 'ashley.moore@example.com', 'Madison', 'WI'),
(31, 'Jesse', 'Harlan', 'jesse@jesse.com', 'Centralia', 'WA'),
(32, 'Emily', 'Nguyen', 'emily.nguyen@example.com', 'Tacoma', 'WA'),
(33, 'Carlos', 'Ramirez', 'carlos.ramirez@example.com', 'San Antonio', 'TX'),
(34, 'Priya', 'Patel', 'priya.patel@example.com', 'Edison', 'NJ'),
(35, 'Kevin', 'O''Connor', 'kevin.oconnor@example.com', 'Boston', 'MA'),
(36, 'Hiroshi', 'Tanaka', 'hiroshi.tanaka@example.com', 'San Jose', 'CA'),
(37, 'Aaliyah', 'Washington', 'aaliyah.washington@example.com', 'Baltimore', 'MD'),
(38, 'Brian', 'Murphy', 'brian.murphy@example.com', 'Providence', 'RI'),
(39, 'Sofia', 'Hernandez', 'sofia.hernandez@example.com', 'Los Angeles', 'CA'),
(40, 'Tyler', 'Brooks', 'tyler.brooks@example.com', 'Louisville', 'KY'),
(41, 'Grace', 'Kim', 'grace.kim@example.com', 'Bellevue', 'WA'),
(42, 'Ahmed', 'Hassan', 'ahmed.hassan@example.com', 'Dearborn', 'MI'),
(43, 'Olivia', 'Chen', 'olivia.chen@example.com', 'San Francisco', 'CA'),
(44, 'Marcus', 'Johnson', 'marcus.johnson@example.com', 'Memphis', 'TN'),
(45, 'Hannah', 'Schmidt', 'hannah.schmidt@example.com', 'Milwaukee', 'WI'),
(46, 'Diego', 'Torres', 'diego.torres@example.com', 'Albuquerque', 'NM'),
(47, 'Chloe', 'Martin', 'chloe.martin@example.com', 'Burlington', 'VT'),
(48, 'Ethan', 'Wright', 'ethan.wright@example.com', 'Indianapolis', 'IN'),
(49, 'Fatima', 'Ali', 'fatima.ali@example.com', 'Houston', 'TX'),
(50, 'Lucas', 'Rivera', 'lucas.rivera@example.com', 'Orlando', 'FL'),
(51, 'Mei', 'Lin', 'mei.lin@example.com', 'New York', 'NY'),
(52, 'Jonathan', 'Price', 'jonathan.price@example.com', 'Scottsdale', 'AZ'),
(53, 'Isabella', 'Rossi', 'isabella.rossi@example.com', 'Philadelphia', 'PA'),
(54, 'Andre', 'Dubois', 'andre.dubois@example.com', 'New Orleans', 'LA'),
(55, 'Rachel', 'Goldberg', 'rachel.goldberg@example.com', 'New York', 'NY'),
(56, 'Samuel', 'Okafor', 'samuel.okafor@example.com', 'Columbus', 'OH'),
(57, 'Natalie', 'Ward', 'natalie.ward@example.com', 'Anchorage', 'AK'),
(58, 'Benjamin', 'Foster', 'benjamin.foster@example.com', 'Boston', 'MA'),
(59, 'Ava', 'Thompson', 'ava.thompson@example.com', 'Nashville', 'TN'),
(60, 'Raj', 'Mehta', 'raj.mehta@example.com', 'Fremont', 'CA'),
(61, 'Lauren', 'Mitchell', 'lauren.mitchell@example.com', 'Fargo', 'ND'),
(62, 'Jacob', 'Sullivan', 'jacob.sullivan@example.com', 'Hartford', 'CT'),
(63, 'Yuki', 'Sato', 'yuki.sato@example.com', 'Honolulu', 'HI'),
(64, 'Michael', 'Johnson', 'michael.johnson@example.com', 'Chicago', 'IL'),
(65, 'Michael', 'Johnson', 'michael.johnson2@example.com', 'Austin', 'TX'),
(66, 'Zoe', 'Campbell', 'zoe.campbell@example.com', 'Charleston', 'SC'),
(67, 'Gabriel', 'Silva', 'gabriel.silva@example.com', 'Newark', 'NJ'),
(68, 'Amanda', 'Lopez-Rivera', 'amanda.lopezrivera@example.com', 'El Paso', 'TX'),
(69, 'Noah', 'Bergstrom', 'noah.bergstrom@example.com', 'Duluth', 'MN'),
(70, 'Victoria', 'Chang', 'victoria.chang@example.com', 'Irvine', 'CA'),
(71, 'Isaac', 'Cohen', 'isaac.cohen@example.com', 'Miami', 'FL'),
(72, 'Megan', 'Riley', 'megan.riley@example.com', 'Wichita', 'KS'),
(73, 'Omar', 'Farouk', 'omar.farouk@example.com', 'Paterson', 'NJ'),
(74, 'Jasmine', 'Brooks', 'jasmine.brooks@example.com', 'Louisville', 'KY'),
(75, 'Liam', 'McCarthy', 'liam.mccarthy@example.com', 'Billings', 'MT'),
(76, 'Elena', 'Petrova', 'elena.petrova@example.com', 'Seattle', 'WA'),
(77, 'Derek', 'Holmes', 'derek.holmes@example.com', 'Little Rock', 'AR'),
(78, 'Kayla', 'Jenkins', 'kayla.jenkins@example.com', 'Jackson', 'MS'),
(79, 'Wei', 'Zhang', 'wei.zhang@example.com', 'Plano', 'TX'),
(80, 'Brianna', 'Coleman', 'brianna.coleman@example.com', 'Birmingham', 'AL'),
(81, 'Alexander', 'Novak', 'alexander.novak@example.com', 'Denver', 'CO'),
(82, 'Maya', 'Singh', 'maya.singh@example.com', 'Sacramento', 'CA'),
(83, 'Connor', 'Doyle', 'connor.doyle@example.com', 'Cheyenne', 'WY'),
(84, 'Leah', 'Abrams', 'leah.abrams@example.com', 'Rochester', 'NY'),
(85, 'Javier', 'Morales', 'javier.morales@example.com', 'Tucson', 'AZ'),
(86, 'Hailey', 'Peterson', 'hailey.peterson@example.com', 'Sioux Falls', 'SD'),
(87, 'Dmitri', 'Volkov', 'dmitri.volkov@example.com', 'Spokane', 'WA'),
(88, 'Nora', 'Fitzgerald', 'nora.fitzgerald@example.com', 'Manchester', 'NH'),
(89, 'Trevor', 'Grant', 'trevor.grant@example.com', 'Des Moines', 'IA'),
(90, 'Ana', 'Souza', 'ana.souza@example.com', 'Fall River', 'MA'),
(91, 'Jamal', 'Robinson', 'jamal.robinson@example.com', 'Atlanta', 'GA'),
(92, 'Erin', 'Walsh', 'erin.walsh@example.com', 'Eugene', 'OR'),
(93, 'Kenji', 'Watanabe', 'kenji.watanabe@example.com', 'Honolulu', 'HI'),
(94, 'Rebecca', 'Stone', 'rebecca.stone@example.com', 'Lexington', 'KY'),
(95, 'Mateo', 'Gutierrez', 'mateo.gutierrez@example.com', 'Fresno', 'CA'),
(96, 'Allison', 'Reed', 'allison.reed@example.com', 'Boise', 'ID'),
(97, 'Darnell', 'Hayes', 'darnell.hayes@example.com', 'Detroit', 'MI'),
(98, 'Ingrid', 'Larsen', 'ingrid.larsen@example.com', 'Saint Paul', 'MN'),
(99, 'Peter', 'Novak', 'peter.novak@example.com', 'Denver', 'CO'),
(100, 'Theresa', 'Quinn', 'theresa.quinn@example.com', 'Dallas', 'TX'),
(101, 'Luis', 'Fernandez', 'luis.fernandez@example.com', 'Miami', 'FL'),
(102, 'Courtney', 'Hall', 'courtney.hall@example.com', 'Oklahoma City', 'OK'),
(103, 'Arjun', 'Reddy', 'arjun.reddy@example.com', 'Redmond', 'WA'),
(104, 'Molly', 'Byrne', 'molly.byrne@example.com', 'Syracuse', 'NY'),
(105, 'Hassan', 'Karimi', 'hassan.karimi@example.com', 'Irvine', 'CA'),
(106, 'Jenna', 'Price', 'jenna.price@example.com', 'Scottsdale', 'AZ'),
(107, 'Xavier', 'Bell', 'xavier.bell@example.com', 'Jacksonville', 'FL'),
(108, 'Leila', 'Haddad', 'leila.haddad@example.com', 'Dearborn', 'MI'),
(109, 'Cody', 'Stewart', 'cody.stewart@example.com', 'Lincoln', 'NE'),
(110, 'Simone', 'Laurent', 'simone.laurent@example.com', 'Burlington', 'VT'),
(111, 'Trent', 'Wallace', 'trent.wallace@example.com', 'Reno', 'NV'),
(112, 'Paige', 'Hamilton', 'paige.hamilton@example.com', 'Knoxville', 'TN'),
(113, 'Andrei', 'Popescu', 'andrei.popescu@example.com', 'Chicago', 'IL'),
(114, 'Brooke', 'Sanders', 'brooke.sanders@example.com', 'Savannah', 'GA'),
(115, 'Felipe', 'Castro', 'felipe.castro@example.com', 'San Diego', 'CA'),
(116, 'Imani', 'Carter', 'imani.carter@example.com', 'Denver', 'CO'),
(117, 'Garrett', 'Lund', 'garrett.lund@example.com', 'Bismarck', 'ND'),
(118, 'Tara', 'D''Souza', 'tara.dsouza@example.com', 'Portland', 'OR'),
(119, 'Wyatt', 'Young', 'wyatt.young@example.com', 'Helena', 'MT'),
(120, 'Naomi', 'Feldman', 'naomi.feldman@example.com', 'Pittsburgh', 'PA');


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
(60, 30, '2026-04-22', 'Delivered'),
(61, 58, '2026-04-23', 'Delivered'),
(62, 36, '2026-04-24', 'Delivered'),
(63, 1, '2026-04-25', 'Delivered'),
(64, 34, '2026-04-27', 'Delivered'),
(65, 32, '2026-04-28', 'Delivered'),
(66, 2, '2026-04-30', 'Delivered'),
(67, 81, '2026-05-01', 'Delivered'),
(68, 45, '2026-05-02', 'Delivered'),
(69, 33, '2026-05-03', 'Delivered'),
(70, 76, '2026-05-04', 'Delivered'),
(71, 42, '2026-05-05', 'Delivered'),
(72, 99, '2026-05-06', 'Delivered'),
(73, 35, '2026-05-07', 'Delivered'),
(74, 3, '2026-05-08', 'Delivered'),
(75, 2, '2026-05-09', 'Delivered'),
(76, 37, '2026-05-10', 'Delivered'),
(77, 52, '2026-05-11', 'Delivered'),
(78, 58, '2026-05-12', 'Delivered'),
(79, 38, '2026-05-13', 'Delivered'),
(80, 34, '2026-05-14', 'Delivered'),
(81, 39, '2026-05-15', 'Delivered'),
(82, 5, '2026-05-16', 'Delivered'),
(83, 41, '2026-05-17', 'Cancelled'),
(84, 45, '2026-05-18', 'Delivered'),
(85, 43, '2026-05-19', 'Delivered'),
(86, 76, '2026-05-20', 'Delivered'),
(87, 7, '2026-05-21', 'Delivered'),
(88, 44, '2026-05-22', 'Delivered'),
(89, 99, '2026-05-23', 'Delivered'),
(90, 46, '2026-05-24', 'Delivered'),
(91, 2, '2026-05-26', 'Delivered'),
(92, 48, '2026-05-27', 'Delivered'),
(93, 36, '2026-05-28', 'Delivered'),
(94, 49, '2026-05-28', 'Delivered'),
(95, 58, '2026-05-29', 'Delivered'),
(96, 50, '2026-05-30', 'Delivered'),
(97, 9, '2026-05-31', 'Delivered'),
(98, 34, '2026-06-01', 'Delivered'),
(99, 51, '2026-06-02', 'Delivered'),
(100, 45, '2026-06-03', 'Delivered'),
(101, 53, '2026-06-04', 'Delivered'),
(102, 81, '2026-06-05', 'Delivered'),
(103, 11, '2026-06-06', 'Delivered'),
(104, 76, '2026-06-07', 'Delivered'),
(105, 54, '2026-06-08', 'Delivered'),
(106, 2, '2026-06-09', 'Delivered'),
(107, 56, '2026-06-10', 'Delivered'),
(108, 99, '2026-06-11', 'Delivered'),
(109, 57, '2026-06-12', 'Delivered'),
(110, 5, '2026-06-13', 'Delivered'),
(111, 58, '2026-06-14', 'Delivered'),
(112, 59, '2026-06-15', 'Delivered'),
(113, 60, '2026-06-16', 'Delivered'),
(114, 34, '2026-06-17', 'Delivered'),
(115, 62, '2026-06-18', 'Delivered'),
(116, 13, '2026-06-19', 'Delivered'),
(117, 36, '2026-06-20', 'Delivered'),
(118, 45, '2026-06-21', 'Delivered'),
(119, 64, '2026-06-22', 'Delivered'),
(120, 65, '2026-06-23', 'Delivered'),
(121, 67, '2026-06-24', 'Delivered'),
(122, 76, '2026-06-25', 'Delivered'),
(123, 68, '2026-06-26', 'Delivered'),
(124, 99, '2026-06-27', 'Delivered'),
(125, 69, '2026-06-28', 'Cancelled'),
(126, 16, '2026-06-29', 'Delivered'),
(127, 2, '2026-06-30', 'Delivered'),
(128, 71, '2026-07-01', 'Delivered'),
(129, 34, '2026-07-02', 'Delivered'),
(130, 52, '2026-07-03', 'Delivered'),
(131, 73, '2026-07-04', 'Delivered'),
(132, 58, '2026-07-05', 'Delivered'),
(133, 70, '2026-07-06', 'Delivered'),
(134, 74, '2026-07-07', 'Delivered'),
(135, 4, '2026-07-08', 'Delivered'),
(136, 45, '2026-07-09', 'Delivered'),
(137, 75, '2026-07-10', 'Delivered'),
(138, 99, '2026-07-11', 'Delivered'),
(139, 36, '2026-07-12', 'Delivered'),
(140, 77, '2026-07-13', 'Delivered'),
(141, 2, '2026-07-14', 'Delivered'),
(142, 79, '2026-07-15', 'Delivered'),
(143, 76, '2026-07-16', 'Delivered'),
(144, 80, '2026-07-17', 'Delivered'),
(145, 5, '2026-07-18', 'Delivered'),
(146, 82, '2026-07-19', 'Delivered'),
(147, 63, '2026-07-20', 'Cancelled'),
(148, 34, '2026-07-21', 'Delivered'),
(149, 84, '2026-07-22', 'Delivered'),
(150, 58, '2026-07-23', 'Delivered'),
(151, 85, '2026-07-24', 'Delivered'),
(152, 17, '2026-07-25', 'Delivered'),
(153, 81, '2026-07-26', 'Delivered'),
(154, 86, '2026-07-27', 'Delivered'),
(155, 99, '2026-07-28', 'Delivered'),
(156, 87, '2026-07-29', 'Delivered'),
(157, 45, '2026-07-30', 'Delivered'),
(158, 89, '2026-07-31', 'Delivered'),
(159, 90, '2026-08-01', 'Delivered'),
(160, 33, '2026-08-02', 'Delivered'),
(161, 2, '2026-08-03', 'Delivered'),
(162, 42, '2026-08-04', 'Delivered'),
(163, 91, '2026-08-05', 'Delivered'),
(164, 76, '2026-08-06', 'Delivered'),
(165, 52, '2026-08-07', 'Delivered'),
(166, 92, '2026-08-08', 'Delivered'),
(167, 34, '2026-08-09', 'Delivered'),
(168, 8, '2026-08-10', 'Delivered'),
(169, 94, '2026-08-11', 'Delivered'),
(170, 58, '2026-08-12', 'Delivered'),
(171, 39, '2026-08-13', 'Delivered'),
(172, 95, '2026-08-14', 'Delivered'),
(173, 36, '2026-08-15', 'Delivered'),
(174, 96, '2026-08-16', 'Delivered'),
(175, 99, '2026-08-17', 'Delivered'),
(176, 12, '2026-08-18', 'Delivered'),
(177, 98, '2026-08-19', 'Delivered'),
(178, 45, '2026-08-20', 'Delivered'),
(179, 5, '2026-08-21', 'Delivered'),
(180, 101, '2026-08-22', 'Cancelled'),
(181, 101, '2026-08-22', 'Delivered'),
(182, 103, '2026-08-23', 'Delivered'),
(183, 76, '2026-08-24', 'Delivered'),
(184, 104, '2026-08-25', 'Delivered'),
(185, 49, '2026-08-26', 'Delivered'),
(186, 19, '2026-08-27', 'Delivered'),
(187, 105, '2026-08-28', 'Delivered'),
(188, 58, '2026-08-29', 'Delivered'),
(189, 107, '2026-08-31', 'Delivered'),
(190, 108, '2026-09-01', 'Delivered'),
(191, 81, '2026-09-02', 'Delivered'),
(192, 43, '2026-09-03', 'Delivered'),
(193, 2, '2026-09-04', 'Delivered'),
(194, 14, '2026-09-05', 'Delivered'),
(195, 70, '2026-09-06', 'Delivered'),
(196, 110, '2026-09-07', 'Delivered'),
(197, 53, '2026-09-08', 'Delivered'),
(198, 34, '2026-09-09', 'Delivered'),
(199, 52, '2026-09-10', 'Delivered'),
(200, 60, '2026-09-11', 'Delivered'),
(201, 20, '2026-09-12', 'Delivered'),
(202, 112, '2026-09-13', 'Delivered'),
(203, 64, '2026-09-14', 'Delivered'),
(204, 99, '2026-09-15', 'Delivered'),
(205, 113, '2026-09-16', 'Delivered'),
(206, 109, '2026-09-17', 'Cancelled'),
(207, 21, '2026-09-18', 'Delivered'),
(208, 71, '2026-09-19', 'Delivered'),
(209, 5, '2026-09-20', 'Delivered'),
(210, 118, '2026-09-21', 'Delivered'),
(211, 109, '2026-09-22', 'Cancelled'),
(212, 79, '2026-09-23', 'Delivered'),
(213, 58, '2026-09-24', 'Delivered'),
(214, 23, '2026-09-25', 'Delivered'),
(215, 82, '2026-09-26', 'Shipped'),
(216, 36, '2026-09-27', 'Delivered'),
(217, 87, '2026-09-28', 'Shipped'),
(218, 25, '2026-09-29', 'Delivered'),
(219, 45, '2026-09-30', 'Shipped'),
(220, 100, '2026-10-01', 'Shipped'),
(221, 115, '2026-10-01', 'Shipped'),
(222, 2, '2026-10-02', 'Shipped'),
(223, 81, '2026-10-02', 'Shipped'),
(224, 27, '2026-10-03', 'Shipped'),
(225, 91, '2026-10-03', 'Shipped'),
(226, 52, '2026-10-04', 'Shipped'),
(227, 42, '2026-10-04', 'Processing'),
(228, 34, '2026-10-05', 'Processing'),
(229, 95, '2026-10-05', 'Processing'),
(230, 29, '2026-10-05', 'Processing'),
(231, 5, '2026-10-06', 'Processing'),
(232, 103, '2026-10-06', 'Processing'),
(233, 36, '2026-10-06', 'Pending'),
(234, 70, '2026-10-06', 'Pending'),
(235, 76, '2026-10-07', 'Pending'),
(236, 100, '2026-10-07', 'Pending'),
(237, 2, '2026-10-07', 'Pending'),
(238, 52, '2026-10-07', 'Pending'),
(239, 116, '2026-10-07', 'Pending'),
(240, 120, '2026-10-07', 'Pending');


-- ============================================================
-- ORDER ITEMS
-- Each order contains one or more products.
-- Most quantities are 1 to 5; business/school orders buy in bulk.
-- unit_price is the price at the time of the order, so bulk
-- orders may have a discounted unit_price.
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
(167, 60, 118, 1, 64.99),

(168, 61, 161, 1, 7.99),
(169, 61, 723, 1, 11.99),

(170, 62, 13, 1, 1099.99),
(171, 62, 48, 1, 399.99),
(172, 62, 89, 1, 79.99),
(173, 62, 684, 1, 89.99),

(174, 63, 131, 1, 89.99),
(175, 63, 724, 2, 14.99),

(176, 64, 241, 2, 19.99),
(177, 64, 252, 3, 8.99),

(178, 65, 203, 1, 229.99),
(179, 65, 689, 1, 24.99),
(180, 65, 701, 1, 19.99),
(181, 65, 706, 1, 24.99),

(182, 66, 165, 2, 8.99),
(183, 66, 179, 1, 12.99),

(184, 67, 310, 1, 999.99),
(185, 67, 333, 1, 529.99),
(186, 67, 347, 1, 199.99),
(187, 67, 376, 1, 279.99),
(188, 67, 390, 1, 129.99),
(189, 67, 406, 1, 149.99),
(190, 67, 428, 1, 169.99),

(191, 68, 643, 4, 9.99),

(192, 69, 445, 1, 599.99),
(193, 69, 692, 1, 29.99),
(194, 69, 701, 1, 19.99),
(195, 69, 713, 1, 14.99),

(196, 70, 81, 1, 14.99),
(197, 70, 634, 1, 19.99),

(198, 71, 52, 12, 161.99),
(199, 71, 61, 12, 17.99),
(200, 71, 81, 12, 12.99),
(201, 71, 162, 12, 8.99),

(202, 72, 730, 1, 24.99),

(203, 73, 15, 1, 1199.99),
(204, 73, 113, 1, 59.99),
(205, 73, 91, 1, 49.99),
(206, 73, 435, 1, 29.99),

(207, 74, 44, 1, 199.99),
(208, 74, 162, 1, 9.99),
(209, 74, 177, 1, 34.99),

(210, 75, 137, 3, 9.99),

(211, 76, 763, 1, 149.99),
(212, 76, 773, 1, 39.99),
(213, 76, 778, 1, 14.99),

(214, 77, 487, 1, 899.99),
(215, 77, 496, 1, 129.99),
(216, 77, 270, 1, 349.99),
(217, 77, 784, 1, 99.99),

(218, 78, 709, 1, 19.99),
(219, 78, 713, 1, 14.99),

(220, 79, 625, 1, 399.99),
(221, 79, 629, 1, 149.99),
(222, 79, 636, 1, 49.99),
(223, 79, 634, 1, 19.99),

(224, 80, 250, 2, 12.99),

(225, 81, 207, 1, 599.99),
(226, 81, 690, 1, 79.99),
(227, 81, 612, 1, 29.99),

(228, 82, 32, 1, 1599.99),
(229, 82, 50, 2, 649.99),
(230, 82, 70, 1, 99.99),
(231, 82, 89, 1, 79.99),

(232, 83, 764, 1, 179.99),

(233, 84, 721, 1, 9.99),
(234, 84, 728, 1, 9.99),

(235, 85, 607, 1, 299.99),
(236, 85, 614, 1, 9.99),
(237, 85, 615, 1, 9.99),

(238, 86, 433, 1, 7.99),
(239, 86, 727, 1, 8.99),

(240, 87, 582, 1, 299.99),
(241, 87, 589, 1, 29.99),
(242, 87, 593, 1, 9.99),

(243, 88, 304, 1, 249.99),
(244, 88, 383, 1, 69.99),
(245, 88, 422, 1, 34.99),

(246, 89, 731, 1, 7.99),
(247, 89, 733, 1, 29.99),

(248, 90, 664, 2, 79.99),
(249, 90, 661, 1, 29.99),
(250, 90, 679, 1, 14.99),

(251, 91, 169, 2, 6.99),
(252, 91, 153, 1, 24.99),

(253, 92, 544, 1, 29.99),
(254, 92, 543, 1, 99.99),
(255, 92, 555, 1, 39.99),

(256, 93, 311, 1, 1599.99),
(257, 93, 385, 1, 109.99),

(258, 94, 441, 1, 179.99),
(259, 94, 691, 1, 14.99),
(260, 94, 701, 1, 19.99),

(261, 95, 702, 1, 24.99),
(262, 95, 166, 1, 11.99),

(263, 96, 465, 1, 199.99),
(264, 96, 475, 1, 14.99),
(265, 96, 477, 1, 24.99),

(266, 97, 135, 1, 109.99),
(267, 97, 343, 1, 79.99),
(268, 97, 733, 1, 29.99),

(269, 98, 242, 2, 24.99),
(270, 98, 241, 1, 19.99),

(271, 99, 9, 1, 429.99),
(272, 99, 683, 1, 39.99),
(273, 99, 83, 1, 24.99),
(274, 99, 543, 1, 99.99),

(275, 100, 641, 2, 14.99),

(276, 101, 485, 1, 349.99),
(277, 101, 495, 1, 89.99),
(278, 101, 497, 1, 39.99),

(279, 102, 584, 1, 999.99),
(280, 102, 595, 1, 39.99),
(281, 102, 590, 1, 69.99),

(282, 103, 625, 1, 399.99),
(283, 103, 637, 1, 89.99),
(284, 103, 635, 1, 29.99),

(285, 104, 94, 1, 19.99),

(286, 105, 267, 1, 129.99),
(287, 105, 706, 1, 24.99),
(288, 105, 701, 1, 19.99),

(289, 106, 172, 1, 19.99),
(290, 106, 168, 1, 8.99),

(291, 107, 742, 1, 199.99),
(292, 107, 748, 2, 109.99),
(293, 107, 170, 1, 11.99),

(294, 108, 724, 2, 14.99),

(295, 109, 539, 1, 449.99),
(296, 109, 711, 1, 49.99),
(297, 109, 536, 1, 12.99),

(298, 110, 14, 1, 1299.99),
(299, 110, 505, 1, 199.99),
(300, 110, 176, 1, 49.99),
(301, 110, 684, 1, 89.99),

(302, 111, 691, 1, 14.99),

(303, 112, 761, 1, 99.99),
(304, 112, 772, 1, 19.99),
(305, 112, 777, 1, 9.99),

(306, 113, 446, 1, 699.99),
(307, 113, 692, 1, 29.99),
(308, 113, 703, 1, 44.99),

(309, 114, 255, 3, 9.99),
(310, 114, 256, 1, 15.99),

(311, 115, 566, 1, 199.99),
(312, 115, 568, 1, 99.99),
(313, 115, 569, 1, 79.99),

(314, 116, 148, 1, 129.99),
(315, 116, 151, 1, 44.99),
(316, 116, 170, 2, 11.99),

(317, 117, 609, 1, 899.99),
(318, 117, 613, 1, 79.99),
(319, 117, 617, 1, 79.99),

(320, 118, 644, 2, 19.99),
(321, 118, 658, 1, 24.99),

(322, 119, 22, 1, 749.99),
(323, 119, 52, 1, 179.99),
(324, 119, 78, 1, 39.99),
(325, 119, 98, 1, 27.99),

(326, 120, 683, 1, 39.99),
(327, 120, 710, 1, 29.99),
(328, 120, 695, 1, 19.99),

(329, 121, 662, 3, 49.99),
(330, 121, 667, 1, 199.99),

(331, 122, 721, 1, 9.99),
(332, 122, 723, 1, 11.99),

(333, 123, 212, 2, 199.99),
(334, 123, 689, 2, 24.99),

(335, 124, 735, 1, 12.99),
(336, 124, 729, 1, 6.99),

(337, 125, 470, 1, 449.99),

(338, 126, 189, 1, 159.99),
(339, 126, 793, 1, 29.99),
(340, 126, 283, 1, 79.99),
(341, 126, 297, 1, 12.99),

(342, 127, 163, 1, 14.99),

(343, 128, 34, 1, 1199.99),
(344, 128, 56, 1, 349.99),
(345, 128, 71, 1, 59.99),
(346, 128, 90, 1, 34.99),

(347, 129, 252, 5, 8.99),
(348, 129, 243, 1, 34.99),

(349, 130, 448, 1, 999.99),
(350, 130, 708, 1, 79.99),
(351, 130, 471, 1, 799.99),

(352, 131, 621, 1, 99.99),
(353, 131, 628, 1, 79.99),
(354, 131, 634, 1, 19.99),

(355, 132, 161, 2, 7.99),

(356, 133, 4, 15, 719.99),
(357, 133, 501, 15, 49.99),
(358, 133, 683, 15, 39.99),
(359, 133, 545, 5, 49.99),

(360, 134, 781, 2, 29.99),
(361, 134, 798, 1, 39.99),
(362, 134, 797, 1, 24.99),

(363, 135, 47, 1, 299.99),
(364, 135, 177, 1, 34.99),
(365, 135, 164, 1, 12.99),

(366, 136, 657, 2, 29.99),

(367, 137, 539, 1, 449.99),
(368, 137, 711, 1, 49.99),
(369, 137, 713, 1, 14.99),

(370, 138, 433, 1, 7.99),
(371, 138, 430, 2, 9.99),

(372, 139, 335, 1, 1999.99),
(373, 139, 373, 1, 799.99),
(374, 139, 355, 4, 179.99),
(375, 139, 394, 1, 349.99),
(376, 139, 412, 1, 249.99),

(377, 140, 122, 1, 64.99),
(378, 140, 553, 1, 49.99),
(379, 140, 694, 1, 12.99),

(380, 141, 81, 1, 14.99),
(381, 141, 634, 1, 19.99),

(382, 142, 305, 1, 299.99),
(383, 142, 322, 1, 179.99),
(384, 142, 364, 1, 169.99),
(385, 142, 342, 1, 44.99),
(386, 142, 403, 1, 79.99),
(387, 142, 383, 1, 69.99),

(388, 143, 179, 2, 12.99),

(389, 144, 222, 1, 79.99),
(390, 144, 241, 1, 19.99),
(391, 144, 242, 1, 24.99),
(392, 144, 252, 2, 8.99),

(393, 145, 36, 1, 1999.99),
(394, 145, 59, 1, 599.99),
(395, 145, 116, 1, 139.99),
(396, 145, 93, 1, 89.99),
(397, 145, 73, 1, 109.99),

(398, 146, 202, 1, 159.99),
(399, 146, 689, 1, 24.99),
(400, 146, 706, 1, 24.99),

(401, 147, 584, 1, 999.99),
(402, 147, 589, 1, 29.99),

(403, 148, 257, 1, 21.99),

(404, 149, 763, 1, 149.99),
(405, 149, 778, 1, 14.99),
(406, 149, 773, 1, 39.99),

(407, 150, 710, 1, 29.99),

(408, 151, 18, 1, 799.99),
(409, 151, 682, 1, 22.99),
(410, 151, 703, 1, 44.99),
(411, 151, 86, 1, 49.99),

(412, 152, 667, 1, 199.99),
(413, 152, 665, 2, 119.99),
(414, 152, 671, 2, 39.99),

(415, 153, 59, 2, 599.99),
(416, 153, 178, 1, 69.99),
(417, 153, 116, 1, 139.99),

(418, 154, 461, 1, 39.99),
(419, 154, 475, 1, 14.99),

(420, 155, 722, 2, 7.99),
(421, 155, 723, 1, 11.99),

(422, 156, 287, 1, 89.99),
(423, 156, 296, 1, 34.99),
(424, 156, 297, 1, 12.99),
(425, 156, 790, 1, 59.99),

(426, 157, 643, 6, 9.99),
(427, 157, 646, 1, 34.99),

(428, 158, 147, 1, 99.99),
(429, 158, 154, 1, 34.99),
(430, 158, 169, 4, 6.99),

(431, 159, 466, 1, 249.99),
(432, 159, 476, 1, 39.99),
(433, 159, 478, 1, 9.99),

(434, 160, 785, 1, 149.99),
(435, 160, 268, 1, 99.99),
(436, 160, 797, 1, 24.99),
(437, 160, 162, 2, 9.99),

(438, 161, 165, 3, 8.99),
(439, 161, 701, 1, 19.99),

(440, 162, 528, 10, 119.99),
(441, 162, 521, 20, 14.99),
(442, 162, 170, 25, 11.99),

(443, 163, 2, 1, 599.99),
(444, 163, 543, 1, 99.99),
(445, 163, 682, 1, 22.99),

(446, 164, 82, 1, 19.99),
(447, 164, 61, 1, 19.99),

(448, 165, 452, 1, 1799.99),
(449, 165, 705, 1, 59.99),
(450, 165, 693, 1, 24.99),

(451, 166, 761, 1, 99.99),
(452, 166, 772, 1, 19.99),
(453, 166, 777, 1, 9.99),

(454, 167, 244, 1, 39.99),
(455, 167, 243, 1, 34.99),

(456, 168, 664, 2, 79.99),
(457, 168, 651, 1, 99.99),
(458, 168, 641, 2, 14.99),

(459, 169, 9, 1, 429.99),
(460, 169, 683, 1, 39.99),
(461, 169, 544, 1, 29.99),
(462, 169, 82, 1, 19.99),

(463, 170, 706, 1, 24.99),

(464, 171, 611, 1, 1299.99),
(465, 171, 616, 1, 49.99),
(466, 171, 548, 1, 199.99),

(467, 172, 581, 1, 199.99),
(468, 172, 589, 1, 29.99),

(469, 173, 747, 1, 1599.99),
(470, 173, 752, 8, 449.99),
(471, 173, 757, 1, 149.99),
(472, 173, 755, 2, 129.99),

(473, 174, 264, 1, 29.99),
(474, 174, 701, 1, 19.99),
(475, 174, 275, 1, 39.99),

(476, 175, 734, 1, 49.99),

(477, 176, 128, 1, 199.99),
(478, 176, 553, 1, 49.99),
(479, 176, 532, 1, 49.99),

(480, 177, 763, 1, 149.99),
(481, 177, 778, 1, 14.99),
(482, 177, 772, 1, 19.99),

(483, 178, 642, 1, 44.99),

(484, 179, 449, 1, 1199.99),
(485, 179, 468, 1, 499.99),
(486, 179, 708, 1, 79.99),
(487, 179, 691, 1, 14.99),

(488, 180, 1, 1, 549.99),
(489, 180, 81, 1, 14.99),

(490, 181, 9, 1, 429.99),
(491, 181, 81, 1, 14.99),

(492, 182, 13, 1, 1099.99),
(493, 182, 505, 1, 199.99),
(494, 182, 48, 2, 399.99),

(495, 183, 727, 1, 8.99),
(496, 183, 729, 1, 6.99),

(497, 184, 541, 1, 69.99),
(498, 184, 545, 1, 49.99),
(499, 184, 555, 1, 39.99),

(500, 185, 709, 1, 19.99),
(501, 185, 691, 1, 14.99),

(502, 186, 624, 1, 249.99),
(503, 186, 630, 1, 299.99),
(504, 186, 636, 1, 49.99),

(505, 187, 742, 1, 199.99),
(506, 187, 749, 2, 189.99),

(507, 188, 713, 2, 14.99),

(508, 189, 15, 1, 1199.99),
(509, 189, 697, 1, 129.99),
(510, 189, 113, 1, 59.99),
(511, 189, 435, 1, 29.99),

(512, 190, 665, 2, 119.99),
(513, 190, 662, 2, 49.99),
(514, 190, 676, 1, 249.99),
(515, 190, 679, 2, 14.99),

(516, 191, 488, 1, 1499.99),
(517, 191, 496, 1, 129.99),
(518, 191, 270, 1, 349.99),
(519, 191, 279, 1, 159.99),
(520, 191, 786, 1, 199.99),

(521, 192, 605, 1, 249.99),
(522, 192, 612, 1, 29.99),
(523, 192, 614, 1, 9.99),
(524, 192, 547, 1, 79.99),

(525, 193, 162, 1, 9.99),

(526, 194, 8, 1, 999.99),
(527, 194, 504, 1, 129.99),
(528, 194, 45, 2, 249.99),
(529, 194, 166, 2, 11.99),
(530, 194, 685, 1, 119.99),

(531, 195, 625, 8, 399.99),
(532, 195, 630, 8, 299.99),
(533, 195, 637, 8, 89.99),
(534, 195, 634, 8, 19.99),
(535, 195, 533, 8, 9.99),

(536, 196, 767, 1, 249.99),
(537, 196, 773, 1, 39.99),
(538, 196, 778, 1, 14.99),

(539, 197, 652, 1, 199.99),
(540, 197, 649, 1, 179.99),
(541, 197, 653, 1, 79.99),
(542, 197, 644, 4, 19.99),

(543, 198, 245, 2, 14.99),
(544, 198, 246, 1, 44.99),

(545, 199, 626, 1, 649.99),
(546, 199, 631, 1, 599.99),
(547, 199, 50, 2, 649.99),
(548, 199, 509, 1, 219.99),
(549, 199, 637, 1, 89.99),

(550, 200, 464, 1, 149.99),
(551, 200, 475, 1, 14.99),
(552, 200, 477, 1, 24.99),

(553, 201, 223, 1, 99.99),
(554, 201, 241, 2, 19.99),
(555, 201, 242, 2, 24.99),
(556, 201, 250, 1, 12.99),
(557, 201, 252, 2, 8.99),

(558, 202, 2, 1, 599.99),
(559, 202, 682, 1, 22.99),
(560, 202, 83, 1, 24.99),
(561, 202, 544, 1, 29.99),

(562, 203, 25, 1, 999.99),
(563, 203, 53, 2, 229.99),
(564, 203, 64, 1, 34.99),
(565, 203, 84, 1, 29.99),
(566, 203, 527, 1, 79.99),
(567, 203, 164, 2, 12.99),

(568, 204, 726, 1, 59.99),

(569, 205, 324, 1, 299.99),
(570, 205, 366, 1, 249.99),
(571, 205, 346, 1, 109.99),
(572, 205, 307, 1, 499.99),
(573, 205, 389, 1, 109.99),
(574, 205, 405, 1, 119.99),
(575, 205, 426, 1, 119.99),
(576, 205, 136, 1, 189.99),

(577, 206, 474, 1, 299.99),

(578, 207, 785, 1, 149.99),
(579, 207, 269, 1, 199.99),
(580, 207, 798, 1, 39.99),

(581, 208, 586, 1, 899.99),
(582, 208, 592, 1, 39.99),
(583, 208, 599, 2, 149.99),
(584, 208, 591, 1, 19.99),

(585, 209, 315, 1, 3999.99),
(586, 209, 336, 1, 4499.99),
(587, 209, 356, 4, 329.99),
(588, 209, 133, 2, 299.99),

(589, 210, 718, 1, 79.99),
(590, 210, 717, 1, 49.99),

(591, 211, 474, 1, 299.99),

(592, 212, 309, 1, 799.99),
(593, 212, 386, 1, 149.99),
(594, 212, 432, 1, 44.99),

(595, 213, 702, 1, 24.99),
(596, 213, 165, 2, 8.99),

(597, 214, 205, 1, 349.99),
(598, 214, 690, 1, 79.99),
(599, 214, 701, 1, 19.99),

(600, 215, 211, 1, 119.99),
(601, 215, 689, 1, 24.99),
(602, 215, 210, 1, 89.99),

(603, 216, 452, 1, 1799.99),
(604, 216, 471, 1, 799.99),
(605, 216, 708, 1, 79.99),

(606, 217, 788, 1, 179.99),
(607, 217, 791, 1, 149.99),
(608, 217, 795, 2, 129.99),
(609, 217, 796, 1, 99.99),

(610, 218, 131, 2, 89.99),
(611, 218, 352, 2, 39.99),
(612, 218, 733, 1, 29.99),

(613, 219, 643, 4, 9.99),
(614, 219, 641, 2, 14.99),

(615, 220, 212, 30, 179.99),
(616, 220, 689, 30, 24.99),
(617, 220, 683, 30, 39.99),
(618, 220, 101, 30, 24.99),

(619, 221, 446, 1, 699.99),
(620, 221, 692, 1, 29.99),
(621, 221, 702, 1, 24.99),

(622, 222, 169, 2, 6.99),
(623, 222, 161, 1, 7.99),

(624, 223, 587, 1, 1499.99),
(625, 223, 595, 1, 39.99),
(626, 223, 597, 1, 79.99),

(627, 224, 744, 1, 449.99),
(628, 224, 749, 4, 189.99),
(629, 224, 527, 1, 79.99),

(630, 225, 106, 1, 49.99),
(631, 225, 264, 1, 29.99),

(632, 226, 584, 1, 999.99),
(633, 226, 590, 1, 69.99),
(634, 226, 595, 1, 39.99),
(635, 226, 591, 1, 19.99),

(636, 227, 12, 10, 679.99),
(637, 227, 508, 10, 149.99),
(638, 227, 52, 20, 179.99),
(639, 227, 117, 10, 44.99),

(640, 228, 241, 2, 19.99),
(641, 228, 252, 4, 8.99),

(642, 229, 563, 2, 59.99),
(643, 229, 573, 1, 29.99),

(644, 230, 3, 1, 749.99),
(645, 230, 501, 1, 49.99),
(646, 230, 87, 1, 39.99),

(647, 231, 311, 1, 1599.99),
(648, 231, 387, 1, 219.99),
(649, 231, 429, 1, 199.99),

(650, 232, 609, 1, 899.99),
(651, 232, 613, 1, 79.99),

(652, 233, 494, 1, 2999.99),
(653, 233, 496, 1, 129.99),
(654, 233, 270, 1, 349.99),

(655, 234, 543, 25, 99.99),
(656, 234, 546, 25, 79.99),

(657, 235, 98, 1, 27.99),
(658, 235, 179, 1, 12.99),

(659, 236, 182, 30, 39.99),
(660, 236, 117, 30, 44.99),

(661, 237, 165, 1, 8.99),

(662, 238, 449, 1, 1199.99),
(663, 238, 691, 1, 14.99),

(664, 239, 225, 1, 179.99),
(665, 239, 251, 2, 17.99),
(666, 239, 250, 2, 12.99),

(667, 240, 201, 1, 129.99),
(668, 240, 689, 1, 24.99);


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
