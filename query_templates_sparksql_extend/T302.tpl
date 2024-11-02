-- T302.tpl

define CATEGORY_ID = random(1, 10, uniform);
define MIN_SPEND = random(3000, 10000, uniform);

select
    i_category,
    sum(cs_sales_price) as category_spend
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_sales_price) > [MIN_SPEND]
order by
    category_spend desc
limit 100;
