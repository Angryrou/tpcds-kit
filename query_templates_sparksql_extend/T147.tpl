-- T147.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_REFUND = random(300, 2000, uniform);

select
    s_state,
    sum(sr_return_amt) as total_refund
from
    store_returns sr,
    store s
where
    sr_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(sr_return_amt) < [MAX_REFUND]
order by
    total_refund asc
limit 100;
