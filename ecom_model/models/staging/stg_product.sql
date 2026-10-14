with source as (
    select *
    from {{ source("raw", "product") }}
)

select
    product_code as product_id,
    product,
    category,
    subcategory
from source