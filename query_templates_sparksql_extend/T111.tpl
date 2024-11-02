-- T111.tpl

define REGION = random(1, 5, uniform);
define MIN_SALES = random(2000, 8000, uniform);

select
    r_region_name,
    sum(ss_sales_price) as total_sales
from
    store_sales ss,
    store s,
    region r
where
    ss_store_sk = s.s_store_sk
    and s.s_region_sk = r.r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    sum(ss_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
