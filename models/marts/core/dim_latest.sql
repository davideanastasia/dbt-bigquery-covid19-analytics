with tbl1 as (

  SELECT row_number() OVER (PARTITION BY location_key ORDER BY date DESC) rn, *
  FROM {{ ref('base_covid19_open_data') }} 
  WHERE date >= DATE_SUB(CURRENT_DATE(), INTERVAL 14 DAY)

)
SELECT * except(rn)
FROM tbl1
WHERE rn = 1