-- T128.tpl

define MAX_REVENUE = random(5000, 30000, uniform);
define REGION_ID = random(1, 5, uniform);

select
    r_region_name,
    sum(ss_ext_sales_price) as region_revenue
from
    store_sales ss,
    store s,
    region r
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(ss_ext_sales_price) < [MAX_REVENUE]
order by
    region_revenue asc
limit 100;
