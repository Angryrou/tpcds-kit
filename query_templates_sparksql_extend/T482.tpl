-- T482.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_TAX = random(1000, 4000, uniform);

select
    i_category,
    sum(ss_sales_tax) as total_tax
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
    total_tax asc
limit 100;
