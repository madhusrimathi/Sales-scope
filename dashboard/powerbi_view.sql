-- Reporting view for Power BI.
-- One row represents one order line, with descriptive fields already joined.
CREATE OR REPLACE VIEW vw_sales_dashboard AS
SELECT
    o.order_id,
    o.order_date,
    DATE_TRUNC('month', o.order_date)::date AS sales_month,
    o.status,
    c.customer_id,
    c.customer_name,
    c.segment AS customer_segment,
    c.country,
    s.salesperson_id,
    s.salesperson_name,
    s.region,
    s.team,
    p.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct,
    ROUND(oi.quantity * oi.unit_price, 2) AS gross_sales,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0), 2) AS net_sales,
    ROUND(oi.quantity * (oi.unit_price * (1 - oi.discount_pct / 100.0) - p.unit_cost), 2) AS estimated_gross_profit
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN salespeople s ON s.salesperson_id = o.salesperson_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id;
