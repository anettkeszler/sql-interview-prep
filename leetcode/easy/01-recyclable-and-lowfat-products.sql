-- https://leetcode.com/problems/recyclable-and-low-fat-products/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find the ids of products that are both low fat and recyclable.

DROP TABLE IF EXISTS Products;

-- Schema
CREATE TABLE Products (
    product_id int,
    low_fats CHAR(1),
    recyclable CHAR(1)
);

INSERT INTO Products (product_id, low_fats, recyclable) VALUES 
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N');

-- Solution
SELECT product_id
FROM Products
WHERE low_fats='Y' and recyclable='Y'

