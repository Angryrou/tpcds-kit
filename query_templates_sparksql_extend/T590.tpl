-- T590.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_TAX = random(1000, 4000, uniform);

select
    s_state,
    sum(cs_sales_tax) as state_sales_tax
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_sales_tax) < [MAX_TAX]
order by
    state_sales_tax asc
limit 100;
