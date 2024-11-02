-- T477.tpl

define REGION_CODE = random(1, 5, uniform);
define MIN_QUANTITY = random(1000, 5000, uniform);

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
    and r_region_id = [REGION_CODE]
group by
    r_region_name
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
