-- T228.tpl

define STATE_ID = random(1, 50, uniform);
define MIN_REVENUE = random(5000, 15000, uniform);

select
    s_state_id,
    sum(ss_net_paid) as total_revenue
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_id = [STATE_ID]
group by
    s_state_id
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
