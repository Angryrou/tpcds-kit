-- T693.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_QUANTITY = random(1000, 5000, uniform);

select
    s_state,
    sum(cs_quantity) as total_quantity
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
