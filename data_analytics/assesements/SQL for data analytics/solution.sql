-- =============================================================================
-- Module 4: SQL for Data Analytics Assessment (M4-A1)
-- Stack: MySQL
-- =============================================================================

-- Database Initialization
CREATE DATABASE IF NOT EXISTS food_analytics_assessment;
USE food_analytics_assessment;


-- =============================================================================
-- SECTION B: PRACTICAL CODING TASKS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Task 1: Menu & Order Explorer
-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS food_orders;

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    item_ordered VARCHAR(100),
    quantity INT,
    price_per_item DECIMAL(10, 2),
    order_date DATE,
    city VARCHAR(50)
);

INSERT INTO food_orders (customer_name, restaurant_name, item_ordered, quantity, price_per_item, order_date, city) VALUES 
('Aarav Mehta', 'Bastian', 'Lobster Thermidor', 1, 3200.00, '2026-10-01', 'Mumbai'),
('Diya Patel', 'Pizza By The Bay', 'Margherita Pizza', 2, 750.00, '2026-10-02', 'Mumbai'),
('Rohan Sharma', 'The Bombay Canteen', 'Pork Ribs', 1, 1450.00, '2026-10-03', 'Mumbai'),
('Ananya Iyer', 'Saravana Bhavan', 'Ghee Roast Dosa', 3, 180.00, '2026-10-03', 'Chennai'),
('Vikram Singh', 'Karim''s', 'Mutton Nihari', 2, 650.00, '2026-10-04', 'Delhi'),
('Sneha Joshi', 'Mainland China', 'Dim Sum Platter', 2, 850.00, '2026-10-05', 'Mumbai'),
('Karan Verma', 'Bukhara', 'Dal Bukhara', 2, 2800.00, '2026-10-06', 'Delhi'),
('Pooja Nair', 'Empire Restaurant', 'Chicken Biryani', 4, 320.00, '2026-10-07', 'Bengaluru'),
('Aditya Rao', 'Toit', 'Woodfired Pizza', 2, 650.00, '2026-10-08', 'Bengaluru');

-- Query 1.1: Orders placed in 'Mumbai', sorted by price_per_item DESC
SELECT 
    order_id, 
    customer_name, 
    restaurant_name, 
    item_ordered, 
    quantity, 
    price_per_item, 
    order_date, 
    city 
FROM food_orders 
WHERE city = 'Mumbai' 
ORDER BY price_per_item DESC;

-- Query 1.2: Distinct restaurant names that received at least one order
SELECT DISTINCT 
    restaurant_name 
FROM food_orders 
ORDER BY restaurant_name ASC;

-- Query 1.3: Top 5 most expensive individual orders using ORDER BY and LIMIT
SELECT 
    order_id, 
    customer_name, 
    restaurant_name, 
    item_ordered, 
    quantity, 
    price_per_item, 
    (quantity * price_per_item) AS total_order_value 
FROM food_orders 
ORDER BY (quantity * price_per_item) DESC 
LIMIT 5;


-- -----------------------------------------------------------------------------
-- Task 2: Restaurant Revenue Summary
-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS delivery_orders;

CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(50),
    order_date DATE
);

INSERT INTO delivery_orders (restaurant_name, city, total_amount, order_status, order_date) VALUES 
('Mainland China', 'Mumbai', 3500.00, 'Delivered', '2026-10-01'),
('Mainland China', 'Mumbai', 4200.00, 'Delivered', '2026-10-03'),
('Mainland China', 'Mumbai', 3800.00, 'Delivered', '2026-10-05'),
('Saravana Bhavan', 'Chennai', 850.00, 'Delivered', '2026-10-01'),
('Saravana Bhavan', 'Chennai', 1200.00, 'Delivered', '2026-10-02'),
('Saravana Bhavan', 'Chennai', 950.00, 'Delivered', '2026-10-04'),
('Punjab Grill', 'Delhi', 2800.00, 'Delivered', '2026-10-02'),
('Punjab Grill', 'Delhi', 3400.00, 'Delivered', '2026-10-04'),
('Punjab Grill', 'Delhi', 1900.00, 'Delivered', '2026-10-06'),
('Empire Restaurant', 'Bengaluru', 2200.00, 'Delivered', '2026-10-02'),
('Empire Restaurant', 'Bengaluru', 2900.00, 'Delivered', '2026-10-04'),
('Empire Restaurant', 'Bengaluru', 1800.00, 'Delivered', '2026-10-06');

-- Aggregated Revenue Query with HAVING > 5000 and CASE WHEN classification
SELECT 
    restaurant_name, 
    COUNT(order_id) AS total_orders, 
    SUM(total_amount) AS total_revenue, 
    ROUND(AVG(total_amount), 2) AS average_order_value, 
    CASE 
        WHEN SUM(total_amount) > 10000 THEN 'High Revenue'
        ELSE 'Moderate Revenue'
    END AS revenue_category 
FROM delivery_orders 
GROUP BY restaurant_name 
HAVING SUM(total_amount) > 5000 
ORDER BY total_revenue DESC;


-- -----------------------------------------------------------------------------
-- Task 3: Customer-Order-Restaurant Joined Report
-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS restaurants;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    amount DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO customers (name, city, phone) VALUES 
('Rahul Verma', 'Mumbai', '9820198201'),
('Pooja Hegde', 'Bengaluru', '9845198451'),
('Karan Johar', 'Delhi', '9811198111'),
('Diya Mirza', 'Mumbai', '9822198221'),
('Amit Patel', 'Ahmedabad', '9898198981'),      -- Zero orders
('Sneha Kulkarni', 'Pune', '9867198671');       -- Zero orders

INSERT INTO restaurants (name, cuisine_type, city) VALUES 
('Bastian', 'Seafood', 'Mumbai'),
('Toit', 'Brewery', 'Bengaluru'),
('Bukhara', 'North Indian', 'Delhi'),
('Bombay Canteen', 'Modern Indian', 'Mumbai'),
('Karim''s', 'Mughlai', 'Delhi'),
('Truffles', 'American', 'Bengaluru');

INSERT INTO orders (customer_id, restaurant_id, amount, order_date) VALUES 
(1, 1, 4500.00, '2026-10-01'),
(1, 4, 1800.00, '2026-10-03'),
(2, 2, 2200.00, '2026-10-02'),
(3, 3, 3100.00, '2026-10-04'),
(4, 2, 1500.00, '2026-10-05'),
(2, 6, 950.00, '2026-10-06');

-- Query 3.1: INNER JOIN (Orders with Customer Name & Restaurant Name)
SELECT 
    o.order_id, 
    c.name AS customer_name, 
    r.name AS restaurant_name, 
    o.amount, 
    o.order_date 
FROM orders o 
INNER JOIN customers c ON o.customer_id = c.customer_id 
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id 
ORDER BY o.order_id ASC;

-- Query 3.2: LEFT JOIN (All Customers, Showing NULL for Non-Orderers)
SELECT 
    c.customer_id, 
    c.name AS customer_name, 
    c.city AS customer_city, 
    o.order_id, 
    o.amount, 
    o.order_date 
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id 
ORDER BY c.customer_id ASC;

-- Query 3.3: Same-City Orders Filter
SELECT 
    o.order_id, 
    c.name AS customer_name, 
    c.city AS customer_city, 
    r.name AS restaurant_name, 
    r.city AS restaurant_city, 
    o.amount, 
    o.order_date 
FROM orders o 
INNER JOIN customers c ON o.customer_id = c.customer_id 
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id 
WHERE c.city = r.city 
ORDER BY o.order_id ASC;


-- -----------------------------------------------------------------------------
-- Task 4: Delivery Agent Performance Ranking
-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS deliveries;

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    delivery_time_mins INT,
    order_date DATE
);

INSERT INTO deliveries (agent_name, restaurant_name, delivery_time_mins, order_date) VALUES 
('Ramesh Kumar', 'Bastian', 22, '2026-10-01'),
('Ramesh Kumar', 'Pizza By The Bay', 26, '2026-10-02'),
('Ramesh Kumar', 'Bombay Canteen', 24, '2026-10-03'),
('Suresh Raina', 'Toit', 38, '2026-10-01'),
('Suresh Raina', 'Truffles', 42, '2026-10-02'),
('Suresh Raina', 'Empire Restaurant', 40, '2026-10-03'),
('Mahesh Yadav', 'Bukhara', 28, '2026-10-01'),
('Mahesh Yadav', 'Karim''s', 32, '2026-10-02'),
('Mahesh Yadav', 'Punjab Grill', 30, '2026-10-04'),
('Dinesh Karthik', 'Saravana Bhavan', 34, '2026-10-01'),
('Dinesh Karthik', 'Mainland China', 36, '2026-10-03');

-- CTE + Window Function + Scalar Subquery Query
WITH agent_stats AS (
    SELECT 
        agent_name, 
        ROUND(AVG(delivery_time_mins), 1) AS avg_delivery_time 
    FROM deliveries 
    GROUP BY agent_name
)
SELECT 
    agent_name, 
    avg_delivery_time, 
    RANK() OVER (ORDER BY avg_delivery_time ASC) AS speed_rank, 
    ROUND((SELECT AVG(delivery_time_mins) FROM deliveries), 1) AS platform_avg_time, 
    CASE 
        WHEN avg_delivery_time <= (SELECT AVG(delivery_time_mins) FROM deliveries) THEN 'On Track'
        ELSE 'Needs Improvement'
    END AS performance_status 
FROM agent_stats 
ORDER BY speed_rank ASC;


-- =============================================================================
-- SECTION C: MINI CAPSTONE PROJECT (Food Delivery Analytics - SQL Backend)
-- =============================================================================

DROP TABLE IF EXISTS capstone_orders;
DROP TABLE IF EXISTS capstone_delivery_agents;
DROP TABLE IF EXISTS capstone_restaurants;
DROP TABLE IF EXISTS capstone_customers;

-- 1. Customers Table
CREATE TABLE capstone_customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at DATE NOT NULL
);

-- 2. Restaurants Table
CREATE TABLE capstone_restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    rating DECIMAL(2, 1) DEFAULT 4.0
);

-- 3. Delivery Agents Table
CREATE TABLE capstone_delivery_agents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL
);

-- 4. Orders Table
CREATE TABLE capstone_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    agent_id INT NOT NULL,
    order_amount DECIMAL(10, 2) NOT NULL,
    delivery_time_mins INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES capstone_customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES capstone_restaurants(restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (agent_id) REFERENCES capstone_delivery_agents(agent_id) ON DELETE CASCADE
);

-- Capstone Data Insertion
INSERT INTO capstone_customers (customer_name, email, city, created_at) VALUES 
('Aarav Mehta', 'aarav@gmail.com', 'Mumbai', '2026-01-10'),
('Diya Patel', 'diya@gmail.com', 'Mumbai', '2026-01-15'),
('Karan Verma', 'karan@gmail.com', 'Delhi', '2026-02-01'),
('Sneha Joshi', 'sneha@gmail.com', 'Bengaluru', '2026-02-10'),
('Rohan Sharma', 'rohan@gmail.com', 'Delhi', '2026-02-14'),
('Pooja Hegde', 'pooja@gmail.com', 'Bengaluru', '2026-03-01'),
('Aditya Rao', 'aditya@gmail.com', 'Mumbai', '2026-03-12'),
('Vikram Singh', 'vikram@gmail.com', 'Delhi', '2026-03-20'),
('Ananya Iyer', 'ananya@gmail.com', 'Bengaluru', '2026-04-05'),
('Kavita Shah', 'kavita@gmail.com', 'Mumbai', '2026-04-18');

INSERT INTO capstone_restaurants (restaurant_name, cuisine, city, rating) VALUES 
('Bastian', 'Seafood', 'Mumbai', 4.7),
('Bombay Canteen', 'Modern Indian', 'Mumbai', 4.6),
('Pizza By The Bay', 'Italian', 'Mumbai', 4.3),
('Bukhara', 'North Indian', 'Delhi', 4.9),
('Karim''s', 'Mughlai', 'Delhi', 4.4),
('Punjab Grill', 'North Indian', 'Delhi', 4.2),
('Toit', 'Brewery', 'Bengaluru', 4.8),
('Truffles', 'American', 'Bengaluru', 4.6),
('Empire Restaurant', 'Biryani', 'Bengaluru', 4.1),
('Meghana Foods', 'Andhra', 'Bengaluru', 4.5);

INSERT INTO capstone_delivery_agents (agent_name, phone, city, vehicle_type) VALUES 
('Ramesh Kumar', '9820011111', 'Mumbai', 'Bike'),
('Santosh Shinde', '9820022222', 'Mumbai', 'EV Scooter'),
('Ganesh Patil', '9820033333', 'Mumbai', 'Bike'),
('Amit Yadav', '9811044444', 'Delhi', 'Bike'),
('Sunil Sharma', '9811055555', 'Delhi', 'Scooter'),
('Manish Tiwari', '9811066666', 'Delhi', 'Bike'),
('Suresh Gowda', '9845077777', 'Bengaluru', 'EV Scooter'),
('Manjunath R', '9845088888', 'Bengaluru', 'Bike'),
('Kiran Kumar', '9845099999', 'Bengaluru', 'Bike'),
('Naveen Prasad', '9845000000', 'Bengaluru', 'Scooter');

INSERT INTO capstone_orders (customer_id, restaurant_id, agent_id, order_amount, delivery_time_mins, order_date) VALUES 
(1, 1, 1, 3200.00, 25, '2026-10-28'),
(1, 1, 1, 2400.00, 22, '2026-10-29'),
(2, 1, 2, 1800.00, 30, '2026-10-30'),
(7, 1, 3, 2900.00, 28, '2026-10-31'),
(3, 4, 4, 4500.00, 35, '2026-10-28'),
(5, 4, 4, 3800.00, 32, '2026-10-29'),
(8, 4, 5, 2900.00, 40, '2026-10-31'),
(3, 4, 6, 2100.00, 38, '2026-11-01'),
(4, 7, 7, 1500.00, 24, '2026-10-29'),
(6, 7, 7, 2100.00, 26, '2026-10-30'),
(9, 7, 8, 1800.00, 28, '2026-10-31'),
(4, 7, 9, 2200.00, 25, '2026-11-02'),
(1, 2, 2, 850.00, 35, '2026-10-27'),
(2, 3, 3, 1200.00, 45, '2026-10-26'),
(5, 5, 5, 950.00, 42, '2026-10-25'),
(6, 8, 10, 650.00, 20, '2026-10-28');

-- Query C.1: Revenue report for restaurants with more than 3 orders
SELECT 
    r.restaurant_id, 
    r.restaurant_name, 
    r.city, 
    COUNT(o.order_id) AS total_orders, 
    SUM(o.order_amount) AS total_revenue, 
    ROUND(AVG(o.order_amount), 2) AS average_order_value 
FROM capstone_restaurants r 
INNER JOIN capstone_orders o ON r.restaurant_id = o.restaurant_id 
GROUP BY r.restaurant_id, r.restaurant_name, r.city 
HAVING COUNT(o.order_id) > 3 
ORDER BY total_revenue DESC;

-- Query C.2: Customer segmentation using CASE WHEN
SELECT 
    c.customer_id, 
    c.customer_name, 
    c.city, 
    COALESCE(SUM(o.order_amount), 0) AS total_spend, 
    CASE 
        WHEN COALESCE(SUM(o.order_amount), 0) > 5000 THEN 'Platinum'
        WHEN COALESCE(SUM(o.order_amount), 0) >= 2000 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_segment 
FROM capstone_customers c 
LEFT JOIN capstone_orders o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.customer_name, c.city 
ORDER BY total_spend DESC;

-- Query C.3: Top 3 performing restaurants in each city using DENSE_RANK()
WITH restaurant_city_revenue AS (
    SELECT 
        r.city, 
        r.restaurant_name, 
        SUM(o.order_amount) AS total_revenue 
    FROM capstone_restaurants r 
    INNER JOIN capstone_orders o ON r.restaurant_id = o.restaurant_id 
    GROUP BY r.city, r.restaurant_name
),
ranked_restaurants AS (
    SELECT 
        city, 
        restaurant_name, 
        total_revenue, 
        DENSE_RANK() OVER (
            PARTITION BY city 
            ORDER BY total_revenue DESC
        ) AS city_rank 
    FROM restaurant_city_revenue
)
SELECT 
    city, 
    restaurant_name, 
    total_revenue, 
    city_rank 
FROM ranked_restaurants 
WHERE city_rank <= 3 
ORDER BY city ASC, city_rank ASC;

-- Query C.4: Each customer's single most recent order using ROW_NUMBER()
WITH customer_order_history AS (
    SELECT 
        c.customer_id, 
        c.customer_name, 
        o.order_id, 
        o.order_amount, 
        o.order_date, 
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id 
            ORDER BY o.order_date DESC, o.order_id DESC
        ) AS recency_rank 
    FROM capstone_customers c 
    INNER JOIN capstone_orders o ON c.customer_id = o.customer_id
)
SELECT 
    customer_id, 
    customer_name, 
    order_id, 
    order_amount, 
    order_date 
FROM customer_order_history 
WHERE recency_rank = 1 
ORDER BY customer_id ASC;

-- View Definition: vw_daily_order_summary
DROP VIEW IF EXISTS vw_daily_order_summary;

CREATE VIEW vw_daily_order_summary AS 
SELECT 
    o.order_date, 
    c.customer_name, 
    r.restaurant_name, 
    da.agent_name, 
    o.order_amount, 
    o.delivery_time_mins 
FROM capstone_orders o 
INNER JOIN capstone_customers c ON o.customer_id = c.customer_id 
INNER JOIN capstone_restaurants r ON o.restaurant_id = r.restaurant_id 
INNER JOIN capstone_delivery_agents da ON o.agent_id = da.agent_id;

-- Query the View (Orders placed in last 7 days)
SELECT * 
FROM vw_daily_order_summary 
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY) 
ORDER BY order_date DESC;


-- =============================================================================
-- SECTION D: AI-AUGMENTED LEARNING (Debugged & Corrected Final Query)
-- =============================================================================

WITH agent_city_metrics AS (
    SELECT 
        da.city, 
        da.agent_id, 
        da.agent_name, 
        COUNT(o.order_id) AS completed_orders, 
        ROUND(AVG(o.delivery_time_mins), 2) AS avg_delivery_time 
    FROM capstone_delivery_agents da 
    INNER JOIN capstone_orders o ON da.agent_id = o.agent_id 
    WHERE o.delivery_time_mins IS NOT NULL 
    GROUP BY da.city, da.agent_id, da.agent_name 
    HAVING COUNT(o.order_id) > 1 -- Scaled for sample data size
),
ranked_agents AS (
    SELECT 
        city, 
        agent_name, 
        completed_orders, 
        avg_delivery_time, 
        DENSE_RANK() OVER (
            PARTITION BY city 
            ORDER BY completed_orders DESC
        ) AS agent_rank 
    FROM agent_city_metrics
)
SELECT 
    city, 
    agent_name, 
    completed_orders, 
    avg_delivery_time, 
    agent_rank 
FROM ranked_agents 
WHERE agent_rank <= 3 
ORDER BY city ASC, agent_rank ASC;