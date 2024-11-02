-- T449.tpl

define STATE = random(1, 50, uniform);
define MIN_DISCOUNT = random(2000, 10000, uniform);

select
    s_state,
    sum(ss_ext_discount_amt) as total_discount
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
