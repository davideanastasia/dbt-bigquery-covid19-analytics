SELECT *
FROM {{ source('covid19_open_data_eu', 'covid19_open_data') }}