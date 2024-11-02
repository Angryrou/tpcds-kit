-- T303.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_DISCOUNT = random(1000, 4000, uniform);

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
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
