-- T379.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_SALES = random(2000, 10000, uniform);

select
    s_state,
    sum(ss_sales_price) as total_state_sales
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(ss_sales_price) > [MIN_SALES]
order by
    total_state_sales desc
limit 100;
