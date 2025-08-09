WITH mountbelle_temp AS (
    SELECT 
        CAST(DATE_TRUNC('day', TIMESTAMP) AS DATE) AS day,
        CAST(AIR AS DECIMAL(5, 3)) AS mountbelle_temp_1,
        CAST(AIR_2 AS DECIMAL(5, 3)) AS mountbelle_temp_2
    FROM {{ source('avalanche', 'mountbelle') }}
),

mountbelle_temp_agg AS (
    SELECT 
        day, 
        CAST((AVG(mountbelle_temp_1) + AVG(mountbelle_temp_2)) / 2 AS DECIMAL(5, 3)) AS mountbelle_temp_avg
    FROM mountbelle_temp
    GROUP BY day
)

SELECT * FROM mountbelle_temp_agg
ORDER BY day