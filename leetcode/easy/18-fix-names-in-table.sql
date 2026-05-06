-- https://leetcode.com/problems/fix-names-in-a-table/description/?source=submission-noac

-- Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
-- Return the result table ordered by user_id.

DROP TABLE IF EXISTS Users;

-- Schema
CREATE TABLE Users (
    user_id int,
    name varchar
);

INSERT INTO Users (user_id, name) VALUES 
(1, 'aLice'),
(2, 'bOB');

-- Solution
SELECT user_id,
    UPPER(SUBSTRING(name, 1, 1)) || LOWER(SUBSTRING(name, 2)) AS name
FROM Users
ORDER BY user_id ASC;