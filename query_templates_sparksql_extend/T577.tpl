-- T577.tpl

define CATEGORY_ID = random(1, 10, uniform);
define MIN_SALES = random(5000, 25000, uniform);

select
    i_category,
    sum(cs_sales_price) as total_sales
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
