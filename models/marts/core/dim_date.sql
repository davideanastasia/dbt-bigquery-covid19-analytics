{{ config(
    materialized='incremental',
    unique_key='date',
    partition_by={'field': 'date', 'data_type': 'date'}
    )
}}

SELECT date
FROM UNNEST(GENERATE_DATE_ARRAY('2020-01-01', '2021-12-31', INTERVAL 1 DAY)) AS date