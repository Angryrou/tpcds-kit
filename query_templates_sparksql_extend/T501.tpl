-- T501.tpl

define CATEGORY_ID = random(1, 10, uniform);
define MIN_SPENDING = random(5000, 15000, uniform);

select
    i_category,
    sum(ss_net_paid) as category_spending
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(ss_net_paid) > [MIN_SPENDING]
order by
    category_spending desc
limit 100;
