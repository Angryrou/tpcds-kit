-- T555.tpl

define STATE = random(1, 50, uniform);
define MIN_NET_PROFIT = random(2000, 10000, uniform);

select
    s_state,
    sum(ss_net_profit) as state_net_profit
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_net_profit) > [MIN_NET_PROFIT]
order by
    state_net_profit desc
limit 100;
