-- Customer revenue within the sample period.
SELECT
    c.customer_name,
    c.segment,
    COUNT(DISTINCT o.order_id) AS orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)), 2) AS revenue
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name, c.segment
ORDER BY revenue DESC;

-- Repeat customers.
SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS completed_orders
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY completed_orders DESC;
