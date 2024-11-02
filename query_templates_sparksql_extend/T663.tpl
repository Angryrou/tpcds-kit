-- T663.tpl

define STATE = random(1, 50, uniform);
define MIN_TAX = random(2000, 6000, uniform);

select
    s_state,
    sum(cs_sales_tax) as state_tax
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    state_tax desc
limit 100;
