-- Revenue and units sold by product.
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0)), 2) AS revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC;

-- Estimated gross profit based on stored unit cost.
SELECT
    p.product_name,
    ROUND(SUM(oi.quantity * (oi.unit_price * (1 - oi.discount_pct / 100.0) - p.unit_cost)), 2) AS estimated_gross_profit
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY estimated_gross_profit DESC;
