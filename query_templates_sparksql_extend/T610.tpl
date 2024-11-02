-- T610.tpl

define REGION_CODE = random(1, 5, uniform);
define MAX_SALES = random(5000, 25000, uniform);

select
    r_region_name,
    sum(ss_sales_price) as region_sales
from
    store_sales ss,
    region r,
    store s
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_CODE]
group by
    r_region_name
having
    sum(ss_sales_price) < [MAX_SALES]
order by
    region_sales asc
limit 100;
