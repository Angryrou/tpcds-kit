-- T615.tpl

define STATE_CODE = random(1, 50, uniform);
define MAX_TAX = random(2000, 6000, uniform);

select
    s_state,
    sum(ss_sales_tax) as state_tax
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
    state_tax asc
limit 100;
