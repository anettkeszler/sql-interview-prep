-- https://leetcode.com/problems/find-followers-count/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution that will, for each user, return the number of followers.
-- Return the result table ordered by user_id in ascending order.

DROP TABLE IF EXISTS Followers;

-- Schema
CREATE TABLE Followers (
    user_id int,
    follower_id int
);

INSERT INTO Followers (user_id, follower_id) VALUES 
(0, 1),
(1, 0),
(2, 0),
(2, 1);

-- Solution
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;