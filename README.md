# ETL Demo with AWS, Snowflake, and dbt

## Background

This demo project demonstrates my skills in building ETL pipelines using AWS, Snowflake, and dbt.

## Goal

To understand the average air temperature in the Milford Sound region using data from three monitoring stations: Cleddau, East Homer, and Mount Belle.

## Tools
- **AWS S3** for data storage.
- **Snowflake** for data warehousing (extract data from S3 and store the final results).
- **dbt Core** for data transformation.

## Key Steps

### 1. AWS S3

Created an S3 bucket and uploaded three sample CSV files containing hourly air temperature data from 2004.

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/e7490c99-d675-415a-be2b-5d04ca3a940b" />


### 2. Snowflake

Connected the Snowflake warehouse to S3. Extracted data from the S3 files and configured key components, including IAM roles, Storage Integration, Stages, and table schema.

(source code: `avalanche_extract.sql`)

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/567d479c-fe34-4e85-81ac-d3d71c6febc8" />


### 3. dbt

Built a SQL pipeline in dbt to transform the data and load the final results as a Snowflake view.

(source code: `etl_ava/models` folder)



#### DAG graphs from the generated dbt docs:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/1321d689-9950-4c2d-bee3-2222190ad6a5" />



#### dbt model outputs in the Snowflake view:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/cc9e57f1-b789-4cfa-8aa5-ab836216a21e" />



#### Final results in the generated dbt docs:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/285f4904-f23b-4adb-b378-19a88db9c92e" />



#### Final output showing the average temperature across the three stations:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/7b1ff938-80a1-431a-a6d3-2f7c43dc16b9" />





