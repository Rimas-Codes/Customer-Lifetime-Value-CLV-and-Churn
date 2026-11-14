CREATE EXTERNAL TABLE olist_customers (
    customer_id STRING,
    customer_unique_id STRING,
    customer_zip_code_prefix STRING,
    customer_city STRING,
    customer_state STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\""
)
STORED AS TEXTFILE
LOCATION 's3://rimas-olist-clv-project2/customers/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);
