-- https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;

-- Schema
CREATE TABLE Sales (
    sale_id int, 
    product_id int,
    year int, 
    quantity int, 
    price int
);

CREATE TABLE Products (
    product_id int,
    product_name varchar
); 

INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

INSERT INTO Products (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');

-- Solution 
SELECT product_name, year, price
FROM Sales
JOIN Products on Sales.product_id = Products.product_id

