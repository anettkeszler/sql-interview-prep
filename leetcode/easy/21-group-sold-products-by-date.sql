-- https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.

DROP TABLE IF EXISTS Activities;

-- Schema
CREATE TABLE Activities (
    sell_date date, 
    product varchar
);

INSERT INTO Activities (sell_date, product) VALUES 
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-shirt');

-- Solution
SELECT * FROM Activities;

SELECT sell_date, 
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS product
FROM Activities
GROUP BY sell_date
ORDER BY sell_date ASC;