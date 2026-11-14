CREATE OR REPLACE VIEW olist_db.customer_analytics AS
SELECT
    f.customer_unique_id,
    f.recency,
    f.frequency,
    f.monetary,
    f.avg_order_value,
    f.churned,
    f.customer_segment,
    p.predicted_clv
FROM olist_db.customer_features_current_snapshot f
LEFT JOIN olist_db.clv_predictions p
    ON f.customer_unique_id = p.customer_unique_id;
