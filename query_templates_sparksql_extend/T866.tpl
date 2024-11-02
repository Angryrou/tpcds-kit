-- T866.tpl

define REGION_ID = random(1, 5, uniform);
define MAX_NET_PROFIT = random(5000, 20000, uniform);

select
    r_region_name,
    sum(cs_net_profit) as region_net_profit
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
    sum(cs_net_profit) < [MAX_NET_PROFIT]
order by
    region_net_profit asc
limit 100;
