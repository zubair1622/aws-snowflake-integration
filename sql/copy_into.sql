COPY INTO customers
FROM @customer_stage/Customers.csv
FILE_FORMAT = (FORMAT_NAME = csv_format);
