CREATE VIEW olist_customer_features AS
SELECT
    customer_unique_id,
    recency,
    frequency,
    monetary,
    monetary / NULLIF(frequency, 0) AS avg_order_value,
    CASE
        WHEN recency > 180 THEN 1
        ELSE 0
    END AS churned
FROM olist_rfm_calc;
