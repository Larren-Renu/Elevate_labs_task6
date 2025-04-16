create database task4;
use task4;
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_amount DECIMAL(10, 2) AS (quantity * unit_price) STORED,
    payment_method VARCHAR(50),
    region VARCHAR(100)
);
INSERT INTO sales (sale_date, customer_id, product_id, quantity, unit_price, payment_method, region) VALUES
('2025-01-01', 101, 201, 2, 499.99, 'Credit Card', 'North'),
('2025-01-02', 102, 202, 1, 1299.00, 'Cash', 'South'),
('2025-01-03', 103, 203, 3, 199.50, 'UPI', 'East'),
('2025-01-04', 104, 204, 5, 89.99, 'Debit Card', 'West'),
('2025-01-05', 105, 205, 4, 149.99, 'Net Banking', 'Central'),
('2025-01-06', 101, 206, 1, 899.00, 'Credit Card', 'North'),
('2025-01-07', 102, 207, 6, 39.99, 'Cash', 'South'),
('2025-01-08', 106, 208, 2, 649.99, 'UPI', 'East'),
('2025-01-09', 107, 209, 1, 299.00, 'Debit Card', 'West'),
('2025-01-10', 108, 210, 3, 109.00, 'Net Banking', 'Central'),
('2025-01-11', 109, 211, 2, 499.00, 'Credit Card', 'North'),
('2025-01-12', 110, 212, 5, 159.99, 'Cash', 'South'),
('2025-01-13', 111, 213, 1, 799.99, 'UPI', 'East'),
('2025-01-14', 112, 214, 4, 199.00, 'Debit Card', 'West'),
('2025-01-15', 113, 215, 3, 349.00, 'Net Banking', 'Central'),
('2025-01-16', 114, 216, 2, 599.00, 'Credit Card', 'North'),
('2025-01-17', 115, 217, 6, 59.99, 'Cash', 'South'),
('2025-01-18', 116, 218, 1, 999.99, 'UPI', 'East'),
('2025-01-19', 117, 219, 2, 129.00, 'Debit Card', 'West'),
('2025-01-20', 118, 220, 3, 199.99, 'Net Banking', 'Central'),
('2025-01-21', 119, 221, 1, 459.00, 'Credit Card', 'North'),
('2025-01-22', 120, 222, 4, 249.99, 'Cash', 'South'),
('2025-01-23', 121, 223, 2, 699.00, 'UPI', 'East'),
('2025-01-24', 122, 224, 5, 149.00, 'Debit Card', 'West'),
('2025-01-25', 123, 225, 1, 849.00, 'Net Banking', 'Central'),
('2025-01-26', 124, 226, 3, 109.99, 'Credit Card', 'North'),
('2025-01-27', 125, 227, 6, 29.99, 'Cash', 'South'),
('2025-01-28', 126, 228, 2, 549.00, 'UPI', 'East'),
('2025-01-29', 127, 229, 1, 199.99, 'Debit Card', 'West'),
('2025-01-30', 128, 230, 4, 299.00, 'Net Banking', 'Central');

# to see the entire data
Select * from sales;

# to see the data where quantity order is greater than 2 and payment mode is UPI
select * from sales where quantity>2 and payment_method like 'UPI'; 

-- 1. Sales from the 'North' region
SELECT * FROM sales WHERE region = 'North';

-- 2. Sales with payment method 'UPI'
SELECT * FROM sales WHERE payment_method = 'UPI';

-- 3. Sales after '2025-01-15'
SELECT * FROM sales WHERE sale_date > '2025-01-15';

-- 4. Sales with quantity > 3
SELECT * FROM sales WHERE quantity > 3;

-- 5. Sales with unit_price > 500
SELECT * FROM sales WHERE unit_price > 500;

-- 6. Total sales amount
SELECT SUM(total_amount) AS total_sales FROM sales;

-- 7. Total sales by region
SELECT region, SUM(total_amount) AS total_sales FROM sales GROUP BY region;

-- 8. Average unit_price per payment method
SELECT payment_method, AVG(unit_price) AS avg_price FROM sales GROUP BY payment_method;

-- 9. Total quantity sold in the 'South' region
SELECT SUM(quantity) AS total_quantity FROM sales WHERE region = 'South';

-- 10. Customer with highest total purchase
SELECT customer_id, SUM(total_amount) AS total_spent
FROM sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;


-- 11. Top 5 sales with highest total amount
SELECT * FROM sales ORDER BY total_amount DESC LIMIT 5;

-- 12. Sales in ascending order of sale_date
SELECT * FROM sales ORDER BY sale_date ASC;

-- 13. Latest sale
SELECT * FROM sales ORDER BY sale_date DESC LIMIT 1;

-- 14. First 10 sales with lowest quantity
SELECT * FROM sales ORDER BY quantity ASC LIMIT 10;

-- 15. Customers with more than one purchase
SELECT customer_id, COUNT(*) AS num_purchases
FROM sales
GROUP BY customer_id
HAVING num_purchases > 1;

-- 16. Products sold only once
SELECT product_id
FROM sales
GROUP BY product_id
HAVING COUNT(*) = 1;

-- 17. Region with maximum total sales
SELECT region, SUM(total_amount) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC
LIMIT 1;

-- 18. Sales above average total amount
SELECT * FROM sales
WHERE total_amount > (
    SELECT AVG(total_amount) FROM sales
);

-- 19. Max unit price per payment method
SELECT payment_method, MAX(unit_price) AS max_price
FROM sales
GROUP BY payment_method;

-- 20. Product with highest total revenue
SELECT product_id, SUM(total_amount) AS total_revenue
FROM sales
GROUP BY product_id
ORDER BY total_revenue DESC
LIMIT 1;

-- 21. Number of sales per day
SELECT sale_date, COUNT(*) AS total_sales
FROM sales
GROUP BY sale_date;

-- 22. Total quantity sold each week
SELECT WEEK(sale_date) AS week_num, SUM(quantity) AS total_quantity
FROM sales
GROUP BY WEEK(sale_date);

-- 23. Day of week with most sales
SELECT DAYNAME(sale_date) AS day, COUNT(*) AS total_sales
FROM sales
GROUP BY day
ORDER BY total_sales DESC
LIMIT 1;

-- 24. Compare first and second half of the month
SELECT
    CASE
        WHEN DAY(sale_date) <= 15 THEN 'First Half'
        ELSE 'Second Half'
    END AS month_half,
    SUM(total_amount) AS total_sales
FROM sales
GROUP BY month_half;

-- 25. Sales on weekends
SELECT * FROM sales
WHERE DAYOFWEEK(sale_date) IN (1, 7);  -- 1 = Sunday, 7 = Saturday


