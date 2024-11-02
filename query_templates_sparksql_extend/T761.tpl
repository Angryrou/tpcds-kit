-- T761.tpl

define REGION_ID = random(1, 5, uniform);
define MIN_DISCOUNT = random(1000, 5000, uniform);

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
    and r_region_id = [REGION_ID]
group by
    r_region_name
having
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    region_discount desc
limit 100;
