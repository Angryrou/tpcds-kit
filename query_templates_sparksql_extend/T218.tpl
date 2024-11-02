-- T218.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_RETURN = random(200, 1500, uniform);

select
    s_state,
    sum(sr_return_amt) as total_return
from
    store_returns sr,
    store s
where
    sr_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(sr_return_amt) > [MIN_RETURN]
order by
    total_return desc
limit 100;
