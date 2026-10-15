select
    p.category,
    round(100.0 * sum(iff(s.segment = 'Consumer', s.revenue, 0))
    / nullif(sum(s.revenue), 0), 2) as consumer_pct,
    round(100.0 * sum(iff(s.segment = 'Corporate', s.revenue, 0))
    / nullif(sum(s.revenue), 0), 2) as corporate_pct,
    round(100.0 * sum(iff(s.segment = 'Self-Employed', s.revenue, 0))
    / nullif(sum(s.revenue), 0), 2) as self_employed_pct,
    sum(s.revenue) as total_revenue
from {{ ref("fct_ecom_sales") }} s 
join {{ ref("dim_product") }} p on s.product_key = p.product_key
group by p.category
order by consumer_pct desc