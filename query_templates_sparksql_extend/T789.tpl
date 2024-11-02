-- T789.tpl

define CATEGORY_ID = random(1, 20, uniform);
define MIN_EXPENDITURE = random(3000, 10000, uniform);

select
    i_category,
    sum(ss_net_paid) as category_expenditure
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(ss_net_paid) > [MIN_EXPENDITURE]
order by
    category_expenditure desc
limit 100;
