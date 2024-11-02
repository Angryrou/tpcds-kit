-- T736.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MIN_TAX = random(1000, 5000, uniform);

select
    i_category,
    sum(cs_sales_tax) as category_tax
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    category_tax desc
limit 100;
