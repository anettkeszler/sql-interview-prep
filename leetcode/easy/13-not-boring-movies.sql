-- https://leetcode.com/problems/not-boring-movies/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

DROP TABLE IF EXISTS Cinema;

-- Schema
CREATE TABLE Cinema (
    id int,
    movie varchar,
    description varchar,
    rating float
);

INSERT INTO Cinema (id, movie, description,rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'Irish', 'boring', 6.2),
(4, 'Ice Song', 'fantasy', 8.6),
(5, 'House Card', 'interesting', 9.1);

-- Solution
SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 != 0 AND description != 'boring'
ORDER BY rating DESC

