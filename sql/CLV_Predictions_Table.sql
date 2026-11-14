CREATE EXTERNAL TABLE IF NOT EXISTS olist_db.clv_predictions (
    customer_unique_id string,
    predicted_clv double
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\""
)
STORED AS TEXTFILE
LOCATION 's3://rimas-olist-clv-project2/ml/predictions/'
TBLPROPERTIES ("skip.header.line.count"="1");
