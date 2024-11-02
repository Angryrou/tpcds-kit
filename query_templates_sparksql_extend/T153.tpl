-- T153.tpl

define COUNTY = random(1, rowcount("active_counties", "store"), uniform);
define STATE = distmember(fips_county, [COUNTY], 3);
define MIN_SPENDING = random(3000, 15000, uniform);

select
    s_state,
    sum(ss_ext_sales_price) as total_spending
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_ext_sales_price) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
