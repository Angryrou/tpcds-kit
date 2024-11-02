-- T150.tpl

define REGION = random(1, 5, uniform);
define MAX_PROFIT = random(3000, 10000, uniform);

select
    r_region_name,
    sum(ss_net_paid_inc_tax) as total_profit
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
    sum(ss_net_paid_inc_tax) < [MAX_PROFIT]
order by
    total_profit asc
limit 100;
