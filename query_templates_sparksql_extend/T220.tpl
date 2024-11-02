-- T220.tpl

define REGION = random(1, 5, uniform);
define MAX_EXPENSE = random(5000, 20000, uniform);

select
    r_region_name,
    sum(ss_net_paid_inc_tax) as region_expense
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
    sum(ss_net_paid_inc_tax) < [MAX_EXPENSE]
order by
    region_expense asc
limit 100;
