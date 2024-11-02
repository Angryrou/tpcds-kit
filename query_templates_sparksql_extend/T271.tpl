-- T271.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_SALES = random(3000, 10000, uniform);

select
    s_state,
    sum(cs_net_paid_inc_tax) as total_sales
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    sum(cs_net_paid_inc_tax) > [MIN_SALES]
order by
    total_sales desc
limit 100;
