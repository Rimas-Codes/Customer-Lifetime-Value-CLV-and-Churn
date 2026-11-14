CREATE EXTERNAL TABLE olist_order_payments (
    order_id STRING,
    payment_sequential INT,
    payment_type STRING,
    payment_installments INT,
    payment_value DOUBLE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\""
)
STORED AS TEXTFILE
LOCATION 's3://rimas-olist-clv-project2/payments/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);
