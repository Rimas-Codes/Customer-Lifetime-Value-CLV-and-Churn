SELECT
    churned,
    COUNT(*) AS customers
FROM olist_churn_dataset
GROUP BY churned;
