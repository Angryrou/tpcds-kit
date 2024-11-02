-- T808.tpl

define REGION = random(1, 5, uniform);
define MIN_EXPENDITURE = random(3000, 15000, uniform);

select
    r_region_name,
    sum(cs_net_paid) as region_expenditure
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
    sum(cs_net_paid) > [MIN_EXPENDITURE]
order by
    region_expenditure desc
limit 100;
