CREATE VIEW olist_churn_dataset AS
SELECT
    customer_unique_id,
    recency,
    frequency,
    monetary,
    CASE
        WHEN recency > 180 THEN 1
        ELSE 0
    END AS churned
FROM olist_rfm_calc;
