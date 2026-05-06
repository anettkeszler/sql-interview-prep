-- https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
-- In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

DROP TABLE IF EXISTS Activity;

-- Schema
CREATE TABLE Activity (
    player_id int,
    device_id int,
    event_date date,
    games_played int
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

-- Solution
SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) * 1.0 
        / (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) b
ON a.player_id = b.player_id
AND a.event_date = b.first_login + INTERVAL '1 day';