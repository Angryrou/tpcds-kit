-- T366.tpl

define STATE = random(1, 50, uniform);
define MIN_REVENUE = random(5000, 20000, uniform);

select
    s_state,
    sum(cs_net_paid_inc_tax) as state_revenue
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_net_paid_inc_tax) > [MIN_REVENUE]
order by
    state_revenue desc
limit 100;
