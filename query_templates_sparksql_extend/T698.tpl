-- T698.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_SALES = random(5000, 15000, uniform);

select
    i_category,
    sum(cs_sales_price) as category_sales
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_sales_price) > [MIN_SALES]
order by
    category_sales desc
limit 100;
