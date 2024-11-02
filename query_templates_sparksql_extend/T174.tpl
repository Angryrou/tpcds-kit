-- T174.tpl

define COUNTY = random(1, rowcount("active_counties", "store"), uniform);
define STATE = distmember(fips_county, [COUNTY], 3);
define MIN_PROFIT = random(3000, 10000, uniform);

select
    s_state,
    sum(ss_net_profit) as total_net_profit
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state = '[STATE]'
group by
    s_state
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    total_net_profit desc
limit 100;
