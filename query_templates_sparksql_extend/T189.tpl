-- T189.tpl

define MIN_PROFIT = random(1000, 5000, uniform);
define STATE_CODE = random(1, 50, uniform);

select
    s_state,
    sum(ss_net_profit) as total_profit
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    total_profit desc
limit 100;
