-- T430.tpl

define REGION_CODE = random(1, 5, uniform);
define MAX_EXPENSE = random(2000, 8000, uniform);

select
    r_region_name,
    sum(ss_net_paid) as regional_expense
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
    sum(ss_net_paid) < [MAX_EXPENSE]
order by
    regional_expense asc
limit 100;
