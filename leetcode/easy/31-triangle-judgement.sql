-- https://leetcode.com/problems/triangle-judgement/description/?envType=study-plan-v2&envId=top-sql-50

-- Report for every three line segments whether they can form a triangle.
-- Return the result table in any order.

DROP TABLE IF EXISTS Triangle;

-- Schema
CREATE TABLE Triangle (
    x int,
    y int,
    z int
);

INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);

-- Solution
SELECT x, y, z,
    CASE
        WHEN x + y > z 
         AND x + z > y
         AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;