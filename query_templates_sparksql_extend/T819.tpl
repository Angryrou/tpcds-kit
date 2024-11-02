-- T819.tpl

define CATEGORY = random(1, 20, uniform);
define MIN_EXPENDITURE = random(5000, 20000, uniform);

select
    i_category,
    sum(ss_net_paid) as total_expenditure
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_net_paid) > [MIN_EXPENDITURE]
order by
    total_expenditure desc
limit 100;
