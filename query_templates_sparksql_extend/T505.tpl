-- T505.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_REVENUE = random(5000, 25000, uniform);

select
    s_state,
    sum(ss_net_paid) as total_revenue
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
