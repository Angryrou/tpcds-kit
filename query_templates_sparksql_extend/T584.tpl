-- T584.tpl

define CATEGORY = random(1, 10, uniform);
define MAX_TAX = random(1000, 5000, uniform);

select
    i_category,
    sum(cs_sales_tax) as total_tax
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_sales_tax) < [MAX_TAX]
order by
    total_tax asc
limit 100;
