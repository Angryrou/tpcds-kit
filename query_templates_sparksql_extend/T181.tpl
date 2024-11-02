-- T181.tpl

define REGION_CODE = random(1, 5, uniform);
define MIN_QUANTITY = random(500, 1500, uniform);

select
    r_region_name,
    sum(cs_quantity) as total_quantity
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
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
