-- T683.tpl

define STATE = random(1, 50, uniform);
define MIN_REVENUE = random(5000, 15000, uniform);

select
    s_state,
    sum(ss_net_paid) as state_revenue
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    state_revenue desc
limit 100;
