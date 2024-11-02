-- T204.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_TAX = random(1000, 4000, uniform);

select
    s_state,
    sum(ss_sales_tax) as total_sales_tax
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    total_sales_tax asc
limit 100;
