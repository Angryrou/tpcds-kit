-- T331.tpl

define REGION = random(1, 5, uniform);
define MIN_PURCHASES = random(100, 500, uniform);

select
    r_region_name,
    count(cs_ticket_number) as total_purchases
from
    catalog_sales cs,
    region r,
    store s
where
    cs_store_sk = s_store_sk
    and s_region_sk = r_region_sk
    and r_region_id = [REGION]
group by
    r_region_name
having
    count(cs_ticket_number) > [MIN_PURCHASES]
order by
    total_purchases desc
limit 100;
