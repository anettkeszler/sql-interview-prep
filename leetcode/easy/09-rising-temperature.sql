-- https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

DROP TABLE IF EXISTS Weather;

-- Schema
CREATE TABLE Weather (
    id int,
    record_date date,
    temperature int
); 

INSERT INTO Weather (id, record_date, temperature) VALUES 
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

-- Solution
SELECT id
FROM (
    SELECT 
        id,
        temperature, 
        record_date, 
        LAG(temperature) OVER (ORDER BY record_date) AS prev_temp,
        LAG(record_date) OVER (ORDER BY record_date) AS prev_date
    FROM Weather
) t
WHERE temperature > prev_temp AND record_date = prev_date + INTERVAL '1 day';

