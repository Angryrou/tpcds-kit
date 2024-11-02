-- T652.tpl

define REGION = random(1, 5, uniform);
define MIN_SALES = random(5000, 15000, uniform);

select
    r_region_name,
    sum(ss_sales_price) as regional_sales
from
    store_sales ss,
    region r,
    store s
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    sum(ss_sales_price) > [MIN_SALES]
order by
    regional_sales desc
limit 100;
