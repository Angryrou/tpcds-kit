-- T138.tpl

define REGION_ID = random(1, 5, uniform);
define MAX_RETURN_AMT = random(1000, 5000, uniform);

select
    r_region_name,
    sum(sr_return_amt) as region_return
from
    store_returns sr,
    store s,
    region r
where
    sr_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(sr_return_amt) < [MAX_RETURN_AMT]
order by
    region_return asc
limit 100;
