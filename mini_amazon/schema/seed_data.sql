INSERT INTO customers (name, signup_date) VALUES
('Alice', '2023-01-10'),
('Bob', '2023-02-15'),
('Charlie', '2023-03-01'),
('Diana', '2023-03-20'),
('Ethan', '2023-04-05');

INSERT INTO products (name, category, price) VALUES
('iPhone 14', 'Electronics', 999.99),
('Samsung Galaxy S22', 'Electronics', 899.99),
('MacBook Air', 'Electronics', 1299.99),
('Nike Shoes', 'Fashion', 120.00),
('Levi Jeans', 'Fashion', 80.00),
('Coffee Beans', 'Grocery', 15.50),
('Tea Pack', 'Grocery', 12.00);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-05-01', 1019.99),
(1, '2023-05-10', 120.00),
(2, '2023-05-03', 1299.99),
(3, '2023-05-05', 95.50),
(4, '2023-05-07', 899.99),
(5, '2023-05-09', 27.50);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(1, 6, 1, 15.50),
(2, 4, 1, 120.00),
(3, 3, 1, 1299.99),
(4, 6, 2, 15.50),
(4, 7, 5, 12.00),
(5, 2, 1, 899.99),
(6, 7, 1, 12.00),
(6, 6, 1, 15.50);

INSERT INTO payments (order_id, payment_method, status) VALUES
(1, 'credit_card', 'completed'),
(2, 'paypal', 'completed'),
(3, 'credit_card', 'completed'),
(4, 'debit_card', 'pending'),
(5, 'credit_card', 'completed'),
(6, 'paypal', 'failed');