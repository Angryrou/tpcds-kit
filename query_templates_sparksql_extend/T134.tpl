-- T134.tpl

define STATE_ID = random(1, 50, uniform);
define MIN_TAX = random(1000, 5000, uniform);

select
    s_state_id,
    sum(ss_sales_tax) as total_tax
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_id = [STATE_ID]
group by
    s_state_id
having
    sum(ss_sales_tax) > [MIN_TAX]
order by
    total_tax desc
limit 100;
