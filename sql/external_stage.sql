CREATE OR REPLACE STAGE customer_stage
URL = 's3://your-bucket/general-files'
STORAGE_INTEGRATION = aws_snowflake_connect
FILE_FORMAT = csv_format;
