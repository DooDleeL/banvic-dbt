WITH colaboradores AS (
    SELECT *
    FROM {{ ref('stg_erp__colaboradores') }}
),

localidades AS (
    SELECT *
    FROM {{ ref('stg_erp__localidades') }}
),

colaboradores_enriquecidos AS (
    SELECT
        colaboradores.pk_colaborador,
        colaboradores.nome_colaborador,
        colaboradores.email_colaborador,
        colaboradores.cpf_colaborador,
        colaboradores.data_nascimento_colaborador,
        colaboradores.endereco_colaborador,
        colaboradores.cep_colaborador,
        localidades.cidade AS cidade_colaborador,
        localidades.uf AS uf_colaborador
    FROM colaboradores
    LEFT JOIN localidades ON colaboradores.fk_localidade = localidades.pk_localidade
)

SELECT *
FROM colaboradores_enriquecidos