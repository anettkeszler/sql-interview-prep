-- https://leetcode.com/problems/project-employees-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;

-- Schema
CREATE TABLE Project (
    project_id int,
    employee_id int
);

CREATE TABLE Employee (
    employee_id int,
    name varchar,
    experience_years int
);

INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);


-- Solution
SELECT * FROM Project;

SELECT * FROM Employee;

SELECT 
    p.project_id, 
    ROUND(
        COALESCE(SUM(e.experience_years) / COUNT(p.project_id), 0),
        2
    ) AS average_years
FROM Project p 
JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id