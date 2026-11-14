WITH historical_features AS (

    SELECT
        c.customer_unique_id,

        DATE_DIFF(
            'day',
            MAX(CAST(o.order_purchase_timestamp AS TIMESTAMP)),
            TIMESTAMP '2018-03-01 00:00:00'
        ) AS recency,

        COUNT(DISTINCT o.order_id) AS frequency,

        SUM(CAST(p.payment_value AS DOUBLE)) AS monetary,

        AVG(CAST(p.payment_value AS DOUBLE)) AS avg_order_value

    FROM olist_orders o

    JOIN olist_customers c
        ON o.customer_id = c.customer_id

    JOIN olist_order_payments p
        ON o.order_id = p.order_id

    WHERE CAST(o.order_purchase_timestamp AS TIMESTAMP)
          < TIMESTAMP '2018-03-01 00:00:00'

    GROUP BY c.customer_unique_id
),

future_spend AS (

    SELECT
        c.customer_unique_id,

        SUM(CAST(p.payment_value AS DOUBLE)) AS future_spend

    FROM olist_orders o

    JOIN olist_customers c
        ON o.customer_id = c.customer_id

    JOIN olist_order_payments p
        ON o.order_id = p.order_id

    WHERE CAST(o.order_purchase_timestamp AS TIMESTAMP)
          >= TIMESTAMP '2018-03-01 00:00:00'

      AND CAST(o.order_purchase_timestamp AS TIMESTAMP)
          < TIMESTAMP '2018-09-01 00:00:00'

    GROUP BY c.customer_unique_id
)

SELECT
    h.customer_unique_id,
    h.recency,
    h.frequency,
    h.monetary,
    h.avg_order_value,

    COALESCE(f.future_spend, 0) AS future_spend

FROM historical_features h

LEFT JOIN future_spend f
    ON h.customer_unique_id = f.customer_unique_id;

