-- T487.tpl

define REGION = random(1, 5, uniform);
define MIN_QUANTITY = random(100, 800, uniform);

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
    and r_region_id = [REGION]
group by
    r_region_name
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
