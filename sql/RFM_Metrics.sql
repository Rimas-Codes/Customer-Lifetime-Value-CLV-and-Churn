CREATE VIEW olist_rfm_calc AS
WITH customer_rfm AS (
    SELECT
        customer_unique_id,
        DATE('2018-09-01') AS analysis_date,
        CAST(MAX(order_purchase_timestamp) AS DATE) AS last_order_date,
        COUNT(DISTINCT order_id) AS frequency,
        SUM(total_order_value) AS monetary
    FROM olist_rfm_base
    GROUP BY customer_unique_id
)

SELECT
    customer_unique_id,
    analysis_date,
    last_order_date,
    date_diff(
        'day',
        last_order_date,
        analysis_date
    ) AS recency,
    frequency,
    monetary
FROM customer_rfm;
