WITH cleddau_temp AS (
    SELECT 
        CAST(DATE_TRUNC('day', TIMESTAMP) AS DATE) AS day,
        CAST(AIR_1 AS DECIMAL(5, 3)) AS cleddau_temp_1,
        CAST(AIR_2 AS DECIMAL(5, 3)) AS cleddau_temp_2
    FROM {{ source('avalanche', 'cleddau') }}
),

cleddau_temp_agg AS (
    SELECT 
        day, 
        CAST((AVG(cleddau_temp_1) + AVG(cleddau_temp_2)) / 2 AS DECIMAL(5, 3)) AS cleddau_temp_avg
    FROM cleddau_temp
    GROUP BY day
)

SELECT * FROM cleddau_temp_agg
ORDER BY day