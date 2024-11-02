-- T163.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_PROFIT = random(2000, 10000, uniform);

select
    s_state,
    sum(ss_net_profit) as total_net_profit
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_profit) < [MAX_PROFIT]
order by
    total_net_profit asc
limit 100;
