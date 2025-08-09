# ETL Demo with AWS, Snowflake, and dbt

## Background

To demonstrate my familarity and hands-on experience with AWS, Snowflake, and dbt.

## Goal

To understand average air temperature at Mildford Sound region with data from three monitoring stations (cleddau, easthomer, and mountbelle) .

## Key Steps

### 1. AWS S3

Created S3 bucket. Uploaded three demo csv files. These files contains hourly air temperature data in 2004.

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/e7490c99-d675-415a-be2b-5d04ca3a940b" />


### 2. Snowflake

Connected Snowflake warehouse with S3. Extracted data from S3 files. Set up key information such as IAM, Storage Integration, Stages, and table schema. 

(source code: `avalanche_extract.sql`)

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/567d479c-fe34-4e85-81ac-d3d71c6febc8" />


### 3. dbt

Built SQL pipeline to perform transformation and load the final results as Snowflake view.

(source code: `etl_ava/models` folder)



Below is DAG graphs in generated dbt docs:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/1321d689-9950-4c2d-bee3-2222190ad6a5" />



Below is dbt models in Snowflake view:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/cc9e57f1-b789-4cfa-8aa5-ab836216a21e" />



Below is final results in generated dbt docs:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/285f4904-f23b-4adb-b378-19a88db9c92e" />



Below is final results, showing average temperature across three stations:

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/7b1ff938-80a1-431a-a6d3-2f7c43dc16b9" />





