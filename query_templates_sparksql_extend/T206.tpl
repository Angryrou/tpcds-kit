-- T206.tpl

define CATEGORY_ID = random(1, 20, uniform);
define MIN_EXPENSE = random(2000, 15000, uniform);

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
    sum(cs_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    category_expense desc
limit 100;
