-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find managers with at least five direct reports.
-- classic self-join + aggregation problem

DROP TABLE IF EXISTS Employee;

-- Schema 
CREATE TABLE Employee (
    id int,
    name varchar,
    department varchar,
    managerId int
); 

INSERT INTO Employee (id, name, department, managerId) VALUES 
(101, 'John', 'A', null),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Ann', 'A', 101),
(106, 'Ron', 'B', 101);

-- Solution
SELECT e2.name 
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
GROUP BY e2.id, e2.name
HAVING COUNT(*) >= 5