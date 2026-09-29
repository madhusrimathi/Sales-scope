-- Salesperson leaderboard based on completed sales.
SELECT
    s.salesperson_name,
    s.region,
    COUNT(DISTINCT o.order_id) AS completed_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)), 2) AS revenue
FROM salespeople s
JOIN orders o ON o.salesperson_id = s.salesperson_id
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY s.salesperson_id, s.salesperson_name, s.region
ORDER BY revenue DESC;
