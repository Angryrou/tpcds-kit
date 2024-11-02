-- T280.tpl

define STATE_ID = random(1, 50, uniform);
define MAX_TAX = random(2000, 10000, uniform);

select
    s_state_id,
    sum(ss_sales_tax) as state_tax
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_id = [STATE_ID]
group by
    s_state_id
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    state_tax asc
limit 100;
