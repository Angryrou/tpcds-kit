-- T633.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_REVENUE = random(5000, 15000, uniform);

select
    s_state,
    sum(cs_net_paid) as state_revenue
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_net_paid) > [MIN_REVENUE]
order by
    state_revenue desc
limit 100;
