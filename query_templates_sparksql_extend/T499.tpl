-- T499.tpl

define STATE = random(1, 50, uniform);
define MIN_DISCOUNT = random(2000, 8000, uniform);

select
    s_state,
    sum(cs_ext_discount_amt) as total_discount
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_ext_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
