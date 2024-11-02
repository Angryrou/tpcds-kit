-- T399.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_REVENUE = random(5000, 25000, uniform);

select
    r_region_name,
    sum(ss_net_paid) as total_region_revenue
from
    store_sales ss,
    region r,
    store s
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    total_region_revenue desc
limit 100;
