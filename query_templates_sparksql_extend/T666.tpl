-- T666.tpl

define REGION = random(1, 5, uniform);
define MAX_DISCOUNT = random(2000, 7000, uniform);

select
    r_region_name,
    sum(ss_ext_discount_amt) as region_discount
from
    store_sales ss,
    region r,
    store s
where
    ss_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    region_discount asc
limit 100;
