-- https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan-v2&envId=top-sql-50

-- Find the names of the customer that are either: referred by any customer with id != 2 or 
-- not referred by any customer

DROP TABLE IF EXISTS Customer;

-- Schema 
CREATE TABLE Customer (
    id int,
    name varchar,
    referee_id int
);

INSERT INTO Customer (id, name, referee_id) VALUES 
(1, 'Will', null),
(2, 'Jane', null),
(3, 'Alex', 2),
(4, 'Bill', null),
(5, 'Zack', 1),
(6, 'Mark', 2);

-- Solution
SELECT name
FROM Customer
WHERE referee_id != 2 or referee_id is null