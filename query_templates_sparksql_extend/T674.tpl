-- T674.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MAX_EXPENDITURE = random(5000, 12000, uniform);

select
    i_category,
    sum(ss_net_paid) as total_expenditure
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(ss_net_paid) < [MAX_EXPENDITURE]
order by
    total_expenditure asc
limit 100;
