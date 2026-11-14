SELECT
    customer_segment,
    COUNT(*) AS customers
FROM olist_customer_segments
GROUP BY customer_segment
ORDER BY customers DESC;
