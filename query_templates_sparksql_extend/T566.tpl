-- T566.tpl

define REGION = random(1, 5, uniform);
define MAX_TAX = random(1000, 4000, uniform);

select
    r_region_name,
    sum(ss_sales_tax) as regional_tax
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
    sum(ss_sales_tax) < [MAX_TAX]
order by
    regional_tax asc
limit 100;
