SElECT *, 
FROM {{ source('covid19_italy_eu', 'data_by_province') }}