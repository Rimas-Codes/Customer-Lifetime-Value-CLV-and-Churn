CREATE VIEW olist_customer_segments AS
SELECT
    *,
    CASE
        WHEN monetary >= 500 THEN 'High Value'
        WHEN monetary >= 200 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM olist_customer_features;
