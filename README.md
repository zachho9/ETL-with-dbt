# ETL Demo with AWS, Snowflake, and dbt

## Background

To demonstrate my familarity and hands-on experience with AWS, Snowflake, and dbt.

## Goal

Calculate average air temperature at three avalanche monitoring stations (cleddau, easthomer, and mountbelle) at Mildford Sound region.

## Key Steps

### 1. AWS S3

Created S3 bucket. Uploaded three demo csv files. These files contains hourly air temperature data in 2004.

<img width="1920" height="935" alt="Image" src="https://github.com/user-attachments/assets/e7490c99-d675-415a-be2b-5d04ca3a940b" />

### 2. Snowflake

Connected Snowflake warehouse with S3. Extracted data from S3 files. Set up key information such as IAM, Storage Integration, Stages, and table schema. 

(source code: `avalanche_extract.sql`)

![sf_tables](screenshots\sf_tables.png)

### 3. dbt

Built SQL pipeline to perform transformation and load the final results as Snowflake view.

(source code: `etl_ava/models` folder)



Below is DAG graphs in generated dbt docs:

![dbt_graph](screenshots\dbt_graph.png)



Below is dbt models in Snowflake view:

![sf_views](screenshots\sf_views.png)



Below is final results in generated dbt docs:

![dbt_final_view](screenshots\dbt_final_view.png)



Below is final results, showing average temperature across three stations:

![sf_final_outputs](screenshots\sf_final_outputs.png)





