-- https://leetcode.com/problems/product-sales-analysis-iii/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find all sales that occurred in the first year each product was sold.
-- For each product_id, identify the earliest year it appears in the Sales table.
-- Return all sales entries for that product in that year.
-- Return a table with the following columns: product_id, first_year, quantity, and price.
-- Return the result in any order.

DROP TABLE IF EXISTS Sales;

-- Schema
CREATE TABLE Sales (
    sale_id int,
    product_id int,
    year int,
    quantity int, 
    price int
);

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

-- Solution 
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN (
    SELECT product_id, MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
) t
ON s.product_id = t.product_id
AND s.year = t.first_year;

-- Explanation 
-- 1. Find the earliest year per product_id: Subquery t finds the first year each product appears
-- 2. Return all rows from that year for each product: Join ensures we only keep rows where: product matches and year = first year
--       This naturally returns all sales in that first year (even if multiple rows exist)