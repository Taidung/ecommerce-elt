with source as (
    select *
    from {{ source("raw", "region") }}
)

select
    region_code,
    city,
    state,
    country,
    country_latitude,
    country_longitude,
    region,
    market
from source