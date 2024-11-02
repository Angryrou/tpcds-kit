-- T709.tpl

define REGION_CODE = random(1, 5, uniform);
define MIN_EXPENSE = random(5000, 15000, uniform);

select
    r_region_name,
    sum(cs_net_paid) as regional_expense
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_CODE]
group by
    r_region_name
having
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    regional_expense desc
limit 100;
