-- T293.tpl

define COUNTY = random(1, rowcount("active_counties", "store"), uniform);
define STATE = distmember(fips_county, [COUNTY], 3);
define MIN_TAX = random(1000, 5000, uniform);

select
    s_state,
    sum(cs_sales_tax) as total_tax
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    total_tax desc
limit 100;
