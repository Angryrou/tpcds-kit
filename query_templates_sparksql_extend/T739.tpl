-- T739.tpl

define CATEGORY = random(1, 15, uniform);
define MIN_EXPENSE = random(3000, 10000, uniform);

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
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    category_expense desc
limit 100;