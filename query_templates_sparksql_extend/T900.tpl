-- T900.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_PROFIT = random(3000, 15000, uniform);

select
    s_state,
    sum(cs_net_profit) as state_profit
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    state_profit desc
limit 100;
