-- T764.tpl

define STATE = random(1, 50, uniform);
define MAX_EXPENSE = random(3000, 10000, uniform);

select
    s_state,
    sum(cs_net_paid) as state_expense
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_net_paid) < [MAX_EXPENSE]
order by
    state_expense asc
limit 100;
