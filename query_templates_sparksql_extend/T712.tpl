-- T712.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_DISCOUNT = random(2000, 6000, uniform);

select
    s_state,
    sum(cs_ext_discount_amt) as state_discount
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    state_discount asc
limit 100;
