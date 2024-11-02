-- T255.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_REVENUE = random(10000, 50000, uniform);

select
    s_state,
    sum(ss_net_paid_inc_tax) as total_revenue
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_paid_inc_tax) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
