WITH fonte_agencias AS (
    SELECT * 
    FROM {{ source('erp_banvic', 'agencias') }}
),

renomeado AS (
    SELECT
        CAST(cod_agencia AS int) AS pk_agencia,
        CAST(cod_localidade AS int) AS fk_localidade,
        nome AS nome_agencia,
        tipo_agencia,
        CAST(data_abertura AS date) AS data_abertura_agencia,
        endereco AS endereco_agencia
    FROM fonte_agencias
)

SELECT * 
FROM renomeado