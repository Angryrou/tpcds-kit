-- T216.tpl

define REGION_CODE = random(1, 5, uniform);
define MIN_SPEND = random(5000, 25000, uniform);

select
    r_region_name,
    sum(cs_net_paid_inc_tax) as regional_spending
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
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    regional_spending desc
limit 100;
