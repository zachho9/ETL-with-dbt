/* Set up warehouse, database, schema */
CREATE WAREHOUSE ETL_WH;
CREATE DATABASE ETL_DB;
CREATE SCHEMA ETL_DB.AVALANCHE;

/* Connect to S3 */
CREATE OR REPLACE STORAGE INTEGRATION ETL_S3_CONNECTOR
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = 'S3'
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::905418166140:role/zach-etl-role'
    STORAGE_ALLOWED_LOCATIONS = ('s3://zach-etl-demo/');

/* Find ARN and External ID, Every run will generate a new external id */
DESCRIBE INTEGRATION ETL_S3_CONNECTOR;

/* Set up file format to remove header */
CREATE OR REPLACE FILE FORMAT CSV_FORMAT 
    TYPE = CSV 
    FIELD_DELIMITER = ',' 
    SKIP_HEADER = 1 
    NULL_IF = ('NULL', 'null') 
    EMPTY_FIELD_AS_NULL = TRUE;

/* CLEDDAU *************************************************/

/* Set up stage data */
CREATE OR REPLACE STAGE ETL_CLEDDAU_STG
    STORAGE_INTEGRATION = ETL_S3_CONNECTOR
    URL = 's3://zach-etl-demo/Cleddau_2004.csv'
    FILE_FORMAT = CSV_FORMAT;

/* Set up table schema */
CREATE OR REPLACE TABLE CLEDDAU
(
    Timestamp DATETIME,
    Wind_Spd VARCHAR(10),
    Wind_Dir VARCHAR(10),
    Air_1 VARCHAR(10),
    Air_2 VARCHAR(10),
    Air_P VARCHAR(10),
    Rad VARCHAR(10),
    Snow_D_m VARCHAR(10),
    Wind_Speed_Max VARCHAR(10),
    Wind_Dir_Max VARCHAR(10),
    Dew VARCHAR(10),
    RH VARCHAR(10)
);

/* Copy data from stage to table */
COPY INTO CLEDDAU FROM @ETL_CLEDDAU_STG;

/* Query */
SELECT TOP 100 * FROM ETL_DB.AVALANCHE.CLEDDAU;


/* EASTHOMER *************************************************/

CREATE OR REPLACE STAGE ETL_EASTHOMER_STG
    STORAGE_INTEGRATION = ETL_S3_CONNECTOR
    URL = 's3://zach-etl-demo/EastHomer_2004.csv'
    FILE_FORMAT = CSV_FORMAT;


CREATE OR REPLACE TABLE EASTHOMER
(
    Timestamp DATETIME,
    Air VARCHAR(10),
    Air_Pess VARCHAR(10),
    Snow_Depth VARCHAR(10),
    Precip VARCHAR(10)
);


COPY INTO EASTHOMER FROM @ETL_EASTHOMER_STG;


SELECT TOP 100 * FROM ETL_DB.AVALANCHE.EASTHOMER;


/* MOUNTBELLE *************************************************/

CREATE OR REPLACE STAGE ETL_MOUNTBELLE_STG
    STORAGE_INTEGRATION = ETL_S3_CONNECTOR
    URL = 's3://zach-etl-demo/MountBelle_2004.csv'
    FILE_FORMAT = CSV_FORMAT;


CREATE OR REPLACE TABLE MOUNTBELLE
(
    Timestamp DATETIME,
    Wind_Spd VARCHAR(10),
    Wind_Dir VARCHAR(10),
    Air VARCHAR(10),
    Rad VARCHAR(10),
    Snow_Depth VARCHAR(10),
    Wind_Max VARCHAR(10),
    Rain VARCHAR(10),
    WS_60Av VARCHAR(10),
    WD_60Av VARCHAR(10),
    Air_2 VARCHAR(10),
    Air_60Av VARCHAR(10)
);


COPY INTO MOUNTBELLE FROM @ETL_MOUNTBELLE_STG;


SELECT TOP 100 * FROM ETL_DB.AVALANCHE.MOUNTBELLE;


/******************************************************/

/* Clean up */
DROP DATABASE IF EXISTS ETL_DB;
DROP WAREHOUSE IF EXISTS ETL_WH;
