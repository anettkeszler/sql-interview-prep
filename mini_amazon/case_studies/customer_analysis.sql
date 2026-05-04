-- Customer LifeTime Value (CLV) 
SELECT customer_id,
    COUNT(customer_id) AS total_orders,
    SUM(total_amount) AS lifetime_value
FROM orders
GROUP BY customer_id
ORDER BY lifetime_value DESC;

-- Repeat vs one-time customers 
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'one-time'
        ELSE 'repeat'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT 
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) t
GROUP BY customer_type;

-- First purchase per customer 
SELECT customer_id,
    MIN(order_date) AS first_order_date
FROM orders
GROUP BY customer_id;
