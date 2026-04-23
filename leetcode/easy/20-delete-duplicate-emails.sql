-- https://leetcode.com/problems/delete-duplicate-emails/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

DROP TABLE IF EXISTS Users;

-- Schema
CREATE TABLE Users (
    id int,
    email varchar
);

INSERT INTO Users (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

-- Solution
SELECT * FROM Users;

DELETE FROM Users u1
USING Users u2
WHERE u1.email = u2.email 
    AND u1.id > u2.id;

SELECT * FROM Users;