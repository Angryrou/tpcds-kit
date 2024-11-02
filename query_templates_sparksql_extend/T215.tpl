-- T215.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_PURCHASES = random(100, 500, uniform);

select
    i_category,
    count(cs_ticket_number) as total_purchases
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    count(cs_ticket_number) > [MIN_PURCHASES]
order by
    total_purchases desc
limit 100;
