-- T780.tpl

define CATEGORY = random(1, 15, uniform);
define MIN_EXPENSE = random(3000, 15000, uniform);

select
    i_category,
    sum(ss_net_paid) as category_expense
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_net_paid) > [MIN_EXPENSE]
order by
    category_expense desc
limit 100;
