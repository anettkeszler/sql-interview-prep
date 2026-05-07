-- https://leetcode.com/problems/employees-whose-manager-left-the-company/description/?envType=study-plan-v2&envId=top-sql-50

-- Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. 
-- When a manager leaves the company, their information is deleted from the Employees table, but the reports 
-- still have their manager_id set to the manager that left.
-- Return the result table ordered by employee_id.

DROP TABLE IF EXISTS Employees;

-- Schema
CREATE TABLE Employees (
    employee_id int,
    name varchar,
    manager_id int,
    salary int
);

INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES
(3, 'Mila', 9, 60301),
(12, 'Antonella', null, 31000),
(13, 'Emery', null, 67084),
(1, 'Kalel', 11, 21241),
(9, 'Mikaela', null, 50937),
(11, 'Joziah', 6, 28485);

-- Solution
SELECT employee_id
FROM Employees e
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id
      FROM Employees
  )
ORDER BY employee_id;