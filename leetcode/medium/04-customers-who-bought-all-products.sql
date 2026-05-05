-- https://leetcode.com/problems/customers-who-bought-all-products/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;

-- Schema
CREATE TABLE Customer (
    customer_id int,
    product_key int
); 

CREATE TABLE Product (
    product_key int
);

INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

INSERT INTO Product (product_key) VALUES
(5),
(6);

-- Solution
SELECT DISTINCT c.customer_id
FROM Customer c 
JOIN Product p
    ON c.product_key = p.product_key
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product);

-- Solution 2. 
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

-- Explanation
-- This is a “relational division” problem:
-- COUNT(DISTINCT product_key) → how many unique products each customer bought
-- (SELECT COUNT(*) FROM Product) → total number of products
-- If both match → the customer bought all products