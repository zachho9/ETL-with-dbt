WITH easthomer_temp AS (
    SELECT 
        CAST(DATE_TRUNC('day', TIMESTAMP) AS DATE) AS day,
        CAST(AIR AS DECIMAL(5, 3)) AS easthomer_temp
    FROM {{ source('avalanche', 'easthomer') }}
),

easthomer_temp_agg AS (
    SELECT 
        day, 
        CAST(AVG(easthomer_temp) AS DECIMAL(5, 3)) AS easthomer_temp_avg
    FROM easthomer_temp
    GROUP BY day
)

SELECT * FROM easthomer_temp_agg
ORDER BY day