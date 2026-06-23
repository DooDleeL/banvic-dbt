WITH colaboradores AS (
    SELECT *
    FROM {{ ref('int_employees_dimension') }}
)

SELECT *
FROM colaboradores