with source as (
    select *
    from {{ source("raw", "ecom_sales") }}
)

select
    row_id,
    order_id,
    order_date,
    customer_id,
    segment,
    region_code,
    product_code as product_id,
    quantity,
    sales,
    discount,
    profit
from source