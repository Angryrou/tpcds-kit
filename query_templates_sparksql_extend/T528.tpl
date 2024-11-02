-- T528.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_QUANTITY = random(1000, 3000, uniform);

select
    s_state,
    sum(ss_quantity) as total_quantity
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
