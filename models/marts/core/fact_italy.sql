{{ config(
    materialized='incremental',
    unique_key='date',
    partition_by={'field': 'date', 'data_type': 'timestamp'}
    )
}}

with tbl1 as (

  SELECT *,
    (confirmed_cases - lag(confirmed_cases) OVER (PARTITION BY region_code, province_code ORDER BY date ASC)) as confirmed_cases_delta
  FROM {{ ref('base_italy_by_province') }}

)
SELECT *,
  AVG(confirmed_cases_delta) OVER (PARTITION BY region_code, province_code ORDER BY date ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as confirmed_cases_delta_7_days_avg
FROM tbl1

