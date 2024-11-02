-- T402.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_SPENDING = random(2000, 12000, uniform);

select
    s_state,
    sum(ss_net_paid) as state_spending
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_net_paid) > [MIN_SPENDING]
order by
    state_spending desc
limit 100;
