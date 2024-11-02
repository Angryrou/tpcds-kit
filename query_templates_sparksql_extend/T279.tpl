-- T279.tpl

define CATEGORY = random(1, 15, uniform);
define MIN_REVENUE = random(1000, 5000, uniform);

select
    i_category,
    sum(cs_sales_price) as category_revenue
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_sales_price) > [MIN_REVENUE]
order by
    category_revenue desc
limit 100;
