-- T160.tpl

define REGION = random(1, 5, uniform);
define MAX_TAX = random(1000, 5000, uniform);

select
    r_region_name,
    sum(ss_sales_tax) as total_sales_tax
from
    store_sales ss,
    store s,
    region r
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    total_sales_tax asc
limit 100;
