-- T240.tpl

define REGION = random(1, 5, uniform);
define MAX_DISCOUNT = random(0.05, 0.25, uniform);

select
    r_region_name,
    avg(cs_ext_discount_amt/cs_sales_price) as avg_discount
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    avg(cs_ext_discount_amt/cs_sales_price) < [MAX_DISCOUNT]
order by
    avg_discount asc
limit 100;
