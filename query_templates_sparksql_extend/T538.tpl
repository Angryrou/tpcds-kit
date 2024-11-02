-- T538.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_TAX = random(2000, 8000, uniform);

select
    i_category,
    sum(ss_sales_tax) as category_tax
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    category_tax asc
limit 100;
