-- https://leetcode.com/problems/classes-with-at-least-5-students/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find all the classes that have at least five students.
-- Return the result table in any order.

DROP TABLE IF EXISTS Courses;

-- Schema
CREATE TABLE Courses (
    student varchar,
    class varchar
);

INSERT INTO Courses (student, class) VALUES
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Math');

-- Solution
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;


