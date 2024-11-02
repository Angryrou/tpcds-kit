-- T244.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_TAX = random(500, 2000, uniform);

select
    s_state,
    sum(cs_sales_tax) as total_sales_tax
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    total_sales_tax desc
limit 100;
