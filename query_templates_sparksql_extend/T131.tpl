-- T131.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_REFUND = random(500, 3000, uniform);

select
    r_region_name,
    sum(sr_return_amt) as total_refund
from
    store_returns sr,
    region r,
    store s
where
    sr_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(sr_return_amt) > [MIN_REFUND]
order by
    total_refund desc
limit 100;
