with source as (
    select *
    from {{ ref("stg_date") }}
)

select
    to_char(date_day, 'YYYYMMDD') as date_key,
    date_day as full_date,
    to_char(date_day, 'YYYY-MM') as year_month,
    month_of_year as month,
    quarter_of_year as quarter,
    year_number as year
from source