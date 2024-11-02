-- T201.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_QUANTITY = random(500, 1200, uniform);

select
    r_region_name,
    sum(ss_quantity) as total_quantity
from
    store_sales ss,
    region r,
    store s
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
