SELECT
    cd.day,
    CAST((cd.cleddau_temp_avg + eh.easthomer_temp_avg + mb.mountbelle_temp_avg) / 3 AS DECIMAL(5, 3))  AS temp_avg
FROM
    {{ ref('cleddau_temp') }} cd
INNER JOIN
    {{ ref('easthomer_temp') }} eh ON cd.day = eh.day
INNER JOIN
    {{ ref('mountbelle_temp') }} mb ON cd.day = mb.day