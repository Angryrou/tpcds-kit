-- T372.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_DISCOUNT = random(2000, 8000, uniform);

select
    s_state,
    sum(ss_ext_discount_amt) as total_discount
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
