-- T300.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_PROFIT = random(5000, 15000, uniform);

select
    r_region_name,
    sum(ss_net_profit) as region_profit
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
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    region_profit desc
limit 100;
