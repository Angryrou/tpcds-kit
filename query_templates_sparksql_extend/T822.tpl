-- T822.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MAX_EXPENSE = random(5000, 10000, uniform);

select
    i_category,
    sum(cs_net_paid_inc_tax) as category_expense
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_net_paid_inc_tax) < [MAX_EXPENSE]
order by
    category_expense asc
limit 100;
