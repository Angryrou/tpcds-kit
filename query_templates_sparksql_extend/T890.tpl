-- T890.tpl

define STATE = random(1, 50, uniform);
define MAX_SALES = random(3000, 12000, uniform);

select
    s_state,
    sum(cs_net_paid_inc_tax) as state_sales
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_net_paid_inc_tax) < [MAX_SALES]
order by
    state_sales asc
limit 100;
