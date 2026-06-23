WITH fonte_localidades AS (
    SELECT * 
    FROM {{ source('erp_banvic', 'localidades') }}
),

renomeado AS (
    SELECT
        cod_localidade AS pk_localidade,
        cast(cidade AS string) AS cidade,
        cast(uf AS string) AS uf
    FROM fonte_localidades
)

SELECT * 
FROM renomeado