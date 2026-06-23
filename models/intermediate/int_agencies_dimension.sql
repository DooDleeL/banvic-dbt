WITH agencias AS (
    SELECT *
    FROM {{ ref('stg_erp__agencias') }}
),

localidades AS (
    SELECT *
    FROM {{ ref('stg_erp__localidades') }}
),

agencias_enriquecidos AS (
    SELECT
        agencias.pk_agencia,
        agencias.nome_agencia,
        agencias.tipo_agencia,
        agencias.data_abertura_agencia,
        agencias.endereco_agencia,
        localidades.cidade AS cidade_agencia,
        localidades.uf AS uf_agencia
    FROM agencias
    LEFT JOIN localidades ON agencias.fk_localidade = localidades.pk_localidade
)

SELECT *
FROM agencias_enriquecidos