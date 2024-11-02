-- T580.tpl

define REGION_CODE = random(1, 5, uniform);
define MAX_DISCOUNT = random(2000, 8000, uniform);

select
    r_region_name,
    sum(cs_ext_discount_amt) as total_discount
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_CODE]
group by
    r_region_name
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
