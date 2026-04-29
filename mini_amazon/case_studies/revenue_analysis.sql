-- Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM Orders;

-- Top Customers
SELECT customer_id, SUM(total_amount) AS revenue
FROM Orders
GROUP BY customer_id
ORDER BY revenue DESC;

-- Orders with payment status
SELECT o.id, p.status, o.total_amount
FROM Orders o 
JOIN Payments p
    ON o.id = p.order_id;

