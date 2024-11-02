-- T562.tpl

define REGION_ID = random(1, 5, uniform);
define MAX_EXPENSE = random(5000, 20000, uniform);

select
    r_region_name,
    sum(ss_net_paid) as region_expense
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
    sum(ss_net_paid) < [MAX_EXPENSE]
order by
    region_expense asc
limit 100;
