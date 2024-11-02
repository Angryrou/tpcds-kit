-- T319.tpl

define REGION_CODE = random(1, 5, uniform);
define MIN_REVENUE = random(3000, 15000, uniform);

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
    and r_region_id = [REGION_CODE]
group by
    r_region_name
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    total_region_revenue desc
limit 100;
