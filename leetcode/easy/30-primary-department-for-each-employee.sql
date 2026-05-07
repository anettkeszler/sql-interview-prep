-- https://leetcode.com/problems/primary-department-for-each-employee/?envType=study-plan-v2&envId=top-sql-50

-- Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. 
-- Note that when an employee belongs to only one department, their primary column is 'N'.
-- Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

DROP TABLE IF EXISTS Employee;

-- Schema
CREATE TABLE Employee (
    employee_id int,
    department_id int,
    primary_flag varchar
);

INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES
(1, 1, 'N'), 
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');

-- Solution
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
WHERE employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(*) = 1
);