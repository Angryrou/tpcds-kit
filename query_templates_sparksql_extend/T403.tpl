-- T403.tpl

define REGION_CODE = random(1, 5, uniform);
define MAX_TAX = random(500, 3000, uniform);

select
    r_region_name,
    sum(cs_sales_tax) as regional_sales_tax
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_CODE]
group by
    r_region_name
having
    sum(cs_sales_tax) < [MAX_TAX]
order by
    regional_sales_tax asc
limit 100;
