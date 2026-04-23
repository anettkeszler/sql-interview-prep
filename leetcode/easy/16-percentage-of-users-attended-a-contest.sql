-- https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find the percentage of the users registered in each contest rounded to two decimals
-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order

DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Register;

-- Schema
CREATE TABLE Users (
    user_id int,
    user_name varchar
);

CREATE TABLE Register (
    contest_id int,
    user_id int
);

INSERT INTO Users (user_id, user_name) VALUES
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

INSERT INTO Register (contest_id, user_id) VALUES
(215, 6),
(209, 2),
(208, 2),
(210, 6),
(208, 6),
(209, 7),
(209, 6),
(215, 7),
(208, 7),
(210, 2),
(207, 2),
(210, 7);


-- Solution
SELECT r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users),
        2) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
