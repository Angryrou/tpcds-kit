-- T248.tpl

define COUNTY = random(1, rowcount("active_counties", "store"), uniform);
define STATE = distmember(fips_county, [COUNTY], 3);
define MIN_PURCHASES = random(100, 500, uniform);

select
    s_state,
    count(cs_ticket_number) as purchase_count
from
    catalog_sales cs,
    store s
where
    cs_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    count(cs_ticket_number) > [MIN_PURCHASES]
order by
    purchase_count desc
limit 100;
