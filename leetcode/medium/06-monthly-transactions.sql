-- https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

DROP TABLE IF EXISTS Transactions;

-- Schema
CREATE TABLE Transactions (
    id int,
    country varchar,
    state varchar,
    amount int,
    trans_date date
);

INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES 
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2018-01-07');

-- Solution
SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(amount) AS trans_total_amount,
    COUNT(*) FILTER (WHERE state = 'approved') AS approved_count,
    SUM(amount) FILTER (WHERE state = 'approved') AS approved_total_amount
FROM Transactions
GROUP BY month, country;