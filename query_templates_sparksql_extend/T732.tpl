-- T732.tpl

define REGION = random(1, 5, uniform);
define MAX_SALES = random(5000, 25000, uniform);

select
    r_region_name,
    sum(cs_sales_price) as regional_sales
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
    sum(cs_sales_price) < [MAX_SALES]
order by
    regional_sales asc
limit 100;
