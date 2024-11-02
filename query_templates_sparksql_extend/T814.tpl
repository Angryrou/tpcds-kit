-- T814.tpl

define STATE = random(1, 50, uniform);
define MAX_TAX = random(1000, 5000, uniform);

select
    s_state,
    sum(ss_sales_tax) as state_sales_tax
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    state_sales_tax asc
limit 100;
