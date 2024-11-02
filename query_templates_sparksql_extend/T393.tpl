-- T393.tpl

define REGION = random(1, 5, uniform);
define MIN_REVENUE = random(3000, 12000, uniform);

select
    r_region_name,
    sum(cs_net_paid_inc_tax) as regional_revenue
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    sum(cs_net_paid_inc_tax) > [MIN_REVENUE]
order by
    regional_revenue desc
limit 100;
