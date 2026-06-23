WITH agencias AS (
    SELECT *
    FROM {{ ref('int_agencies_dimension') }}
)

SELECT *
FROM agencias