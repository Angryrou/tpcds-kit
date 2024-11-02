-- T224.tpl

define COUNTY = random(1, rowcount("active_counties", "store"), uniform);
define STATE = distmember(fips_county, [COUNTY], 3);
define MIN_TAX = random(500, 3000, uniform);

select
    s_state,
    sum(ss_sales_tax) as total_tax
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_sales_tax) > [MIN_TAX]
order by
    total_tax desc
limit 100;
