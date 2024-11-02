-- T586.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_TAX = random(1000, 6000, uniform);

select
    r_region_name,
    sum(cs_sales_tax) as region_sales_tax
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    region_sales_tax desc
limit 100;
