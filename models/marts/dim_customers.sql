WITH clientes AS (
    SELECT *
    FROM {{ ref('int_customers_dimension') }}
)

SELECT *
FROM clientes