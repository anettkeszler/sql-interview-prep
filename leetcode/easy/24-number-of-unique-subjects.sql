-- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to calculate the number of unique subjects each teacher teaches in the university.
-- Return the result table in any order.

DROP TABLE IF EXISTS Teacher;

-- Schema 
CREATE TABLE Teacher (
    teacher_id int,
    subject_id int,
    dept_id int
);

INSERT INTO Teacher (teacher_id, subject_id, dept_id) VALUES
(1, 2, 3),
(1, 2, 4),
(1, 3, 3),
(2, 1, 1),
(2, 2, 1),
(2, 3, 1),
(2, 4, 1);

-- Solution
SELECT teacher_id, 
    COUNT(DISTINCT subject_id) AS cnt 
FROM Teacher
GROUP BY teacher_id;
