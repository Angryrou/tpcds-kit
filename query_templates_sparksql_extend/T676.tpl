-- T676.tpl

define REGION = random(1, 5, uniform);
define MAX_DISCOUNT = random(1000, 6000, uniform);

select
    r_region_name,
    sum(cs_ext_discount_amt) as region_discount
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
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    region_discount asc
limit 100;