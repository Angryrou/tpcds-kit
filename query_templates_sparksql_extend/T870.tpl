-- T870.tpl

define REGION_CODE = random(1, 5, uniform);
define MAX_PROFIT = random(5000, 15000, uniform);

select
    r_region_name,
    sum(ss_net_profit) as regional_profit
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
    sum(ss_net_profit) < [MAX_PROFIT]
order by
    regional_profit asc
limit 100;
