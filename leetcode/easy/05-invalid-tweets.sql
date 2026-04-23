-- https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find the IDs of the invalid tweets. 
-- The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

DROP TABLE IF EXISTS Tweets;

-- Schema
 CREATE TABLE Tweets (
    tweet_id int, 
    content varchar
 );

INSERT INTO Tweets (tweet_id, content) VALUES 
(1, 'Let us Code'),
(2, 'More than fifteen chars are here!');

-- Solution
SELECT tweet_id
FROM Tweets
WHERE length(content) > 15