-- T251.tpl

define STATE_ID = random(1, 50, uniform);
define MIN_PROFIT = random(3000, 12000, uniform);

select
    s_state_id,
    sum(ss_net_profit) as total_profit
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_id = [STATE_ID]
group by
    s_state_id
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    total_profit desc
limit 100;
