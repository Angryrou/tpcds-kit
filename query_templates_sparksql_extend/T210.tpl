-- T210.tpl

define REGION_ID = random(1, 5, uniform);
define MAX_SALES = random(5000, 20000, uniform);

select
    r_region_name,
    sum(ss_sales_price) as total_sales
from
    store_sales ss,
    region r,
    store s
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(ss_sales_price) < [MAX_SALES]
order by
    total_sales asc
limit 100;
