-- T740.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_NET_PROFIT = random(3000, 12000, uniform);

select
    s_state,
    sum(ss_net_profit) as state_net_profit
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    state_net_profit asc
limit 100;
