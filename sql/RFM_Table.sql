CREATE VIEW olist_rfm_base AS
SELECT
    o.order_id,
    c.customer_unique_id,
    o.order_purchase_timestamp,
    SUM(p.payment_value) AS total_order_value
FROM olist_orders o
LEFT JOIN olist_order_payments p
    ON o.order_id = p.order_id
LEFT JOIN olist_customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY
    o.order_id,
    c.customer_unique_id,
    o.order_purchase_timestamp;
