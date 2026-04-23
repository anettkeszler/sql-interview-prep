-- https://leetcode.com/problems/second-highest-salary/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null.

DROP TABLE IF EXISTS Employee;

-- Schema
CREATE TABLE Employee (
    id int,
    salary int
);

INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

-- Solution 
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    OFFSET 1
    LIMIT 1
) AS "SecondHighestSalary";

-- Explanation 
-- DISTINCT salary → removes duplicates
-- ORDER BY salary DESC → highest first
-- OFFSET 1 → skip the highest salary
-- LIMIT 1 → take the second one
-- Wrapped in a subquery → ensures: If no second salary exists → returns NULL