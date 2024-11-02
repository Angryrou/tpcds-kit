-- T726.tpl

define STATE = random(1, 50, uniform);
define MAX_REVENUE = random(5000, 20000, uniform);

select
    s_state,
    sum(ss_net_paid_inc_tax) as state_revenue
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_net_paid_inc_tax) < [MAX_REVENUE]
order by
    state_revenue asc
limit 100;
