WITH date_spine AS (
    {{ 
        dbt_utils.date_spine(
            datepart="day",
            start_date="cast('2019-01-01' as date)",
            end_date="cast('2020-01-01' as date)"
        )
    }}
),

criar_datas AS (
    SELECT
        ROW_NUMBER() OVER(ORDER BY date_day ASC) AS pk_data,
        TO_CHAR(date_day, 'yyyy-mm-dd') AS data_completa,
        EXTRACT(YEAR FROM date_day) AS ano,
        EXTRACT(MONTH FROM date_day) AS mes,
        EXTRACT(DAY FROM date_day) AS dia,
        EXTRACT(QUARTER FROM date_day) AS trimestre,
        EXTRACT(dow FROM date_day) AS dia_da_semana,
        CASE 
            WHEN EXTRACT(dow FROM date_day) IN (0, 6) THEN true
            ELSE false
        END AS is_weekend
        FROM date_spine
)

SELECT *
FROM criar_datas