-- https://leetcode.com/problems/article-views-i/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.

DROP TABLE IF EXISTS Views;

-- Schema
CREATE TABLE Views (
    article_id int,
    author_id int, 
    viewed_id int, 
    view_date date
);

INSERT INTO Views (article_id, author_id, viewed_id, view_date) VALUES 
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-01'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-01'),
(4, 7, 1, '2019-08-01'),
(3, 4, 4, '2019-08-01'),
(3, 4, 4, '2019-08-01');

-- Solution
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewed_id
ORDER BY id ASC