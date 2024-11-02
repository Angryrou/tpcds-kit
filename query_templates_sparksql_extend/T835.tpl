-- T835.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_EXPENSE = random(5000, 15000, uniform);

select
    s_state,
    sum(ss_net_paid) as state_expense
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_paid) < [MAX_EXPENSE]
order by
    state_expense asc
limit 100;
