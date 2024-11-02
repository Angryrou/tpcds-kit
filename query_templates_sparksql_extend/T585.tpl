-- T585.tpl

define STATE = random(1, 50, uniform);
define MIN_EXPENSE = random(5000, 20000, uniform);

select
    s_state,
    sum(ss_net_paid_inc_tax) as state_expense
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    state_expense desc
limit 100;
