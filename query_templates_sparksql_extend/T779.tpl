-- T779.tpl

define STATE = random(1, 50, uniform);
define MIN_QUANTITY = random(1000, 5000, uniform);

select
    s_state,
    sum(cs_quantity) as state_quantity
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    state_quantity desc
limit 100;
