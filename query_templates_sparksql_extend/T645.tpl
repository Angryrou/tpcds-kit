-- T645.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MIN_PURCHASES = random(3000, 12000, uniform);

select
    i_category,
    sum(cs_sales_price) as category_purchases
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_sales_price) > [MIN_PURCHASES]
order by
    category_purchases desc
limit 100;