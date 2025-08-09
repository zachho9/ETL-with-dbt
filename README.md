# Data Pipeline Demo with AWS, Snowflake, and dbt

## Background

This demo project demonstrates my skills in building data pipelines (ETL/ELT) using AWS, Snowflake, and dbt.

## Goal

To understand the daily average air temperature in the Milford Sound region using data from three monitoring stations: Cleddau, East Homer, and Mount Belle.

## Tools
- **AWS S3** for data storage.
- **Snowflake** for data warehousing (read data from S3 and write the final results to views).
- **dbt Core** for data transformation pipeline.

## Key Steps

### 1. AWS S3

Created an S3 bucket and uploaded three sample CSV files containing hourly air temperature data from 2004.

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/d2e12ba9-3ad8-46b6-9c63-0c5f90d5762f" />


### 2. Snowflake

Connected the Snowflake warehouse to S3.  
Configured key components including IAM roles, storage integration, stages, and table schema.  
Read data from the S3 files.  
(source code: `avalanche_extract.sql`)

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/567d479c-fe34-4e85-81ac-d3d71c6febc8" />

#### Table schema example:
<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/523716d2-3b0a-41ed-8709-c12198e9e5fd" />

### 3. dbt

Built a SQL pipeline in dbt to transform the data and load the final results as a Snowflake view.  
(source code: `etl_ava/models` folder)



#### DAG graphs in the generated dbt docs:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/1321d689-9950-4c2d-bee3-2222190ad6a5" />



#### dbt model outputs in the Snowflake view:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/cc9e57f1-b789-4cfa-8aa5-ab836216a21e" />


#### Final output showing the average temperature across the three stations:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/cf04154c-34eb-438e-8363-bb78f3601411" />


#### Final results in the generated dbt docs:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/285f4904-f23b-4adb-b378-19a88db9c92e" />


#### Visualise final results:

<img width="1644" height="717" alt="Image" src="https://github.com/user-attachments/assets/7863a6dd-2495-4453-8bc4-56a1ee50bd98" />






