-- T246.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_PROFIT = random(2000, 10000, uniform);

select
    r_region_name,
    sum(cs_net_paid_inc_tax) as regional_profit
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(cs_net_paid_inc_tax) > [MIN_PROFIT]
order by
    regional_profit desc
limit 100;
