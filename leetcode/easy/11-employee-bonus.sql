-- https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to report the name and bonus amount of each employee who satisfies either of the following:
-- The employee has a bonus less than 1000.
-- The employee did not get any bonus.

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Bonus;


-- Schema 
CREATE TABLE Employee (
    empId int,
    name varchar,
    supervisor int,
    salary int
);

CREATE TABLE Bonus (
    empId int,
    bonus int
);

INSERT INTO Employee (empId, name, supervisor, salary) VALUES
(3, 'Brad', null, 4000),
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(4, 'Thomas', 3, 4000);

INSERT INTO Bonus (empId, bonus) VALUES
(2, 500),
(4, 2000);


-- Solution
SELECT name, bonus
FROM Employee e
LEFT JOIN Bonus b
    ON e.empId = b.empId
WHERE bonus < 1000 OR b.empId IS null;