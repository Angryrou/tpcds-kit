-- T318.tpl

define CATEGORY_ID = random(1, 20, uniform);
define MAX_TAX = random(500, 3000, uniform);

select
    i_category,
    sum(cs_sales_tax) as category_sales_tax
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_sales_tax) < [MAX_TAX]
order by
    category_sales_tax asc
limit 100;
