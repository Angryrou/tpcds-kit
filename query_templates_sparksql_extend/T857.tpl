-- T857.tpl

define CATEGORY = random(1, 20, uniform);
define MAX_EXPENSE = random(3000, 15000, uniform);

select
    i_category,
    sum(cs_net_paid) as category_expense
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_paid) < [MAX_EXPENSE]
order by
    category_expense asc
limit 100;
