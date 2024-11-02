-- T423.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_REVENUE = random(5000, 25000, uniform);

select
    s_state,
    sum(ss_sales_price) as state_revenue
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_sales_price) > [MIN_REVENUE]
order by
    state_revenue desc
limit 100;
