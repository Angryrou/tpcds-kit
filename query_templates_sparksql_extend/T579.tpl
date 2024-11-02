-- T579.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MIN_REVENUE = random(5000, 20000, uniform);

select
    i_category,
    sum(ss_net_paid) as category_revenue
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    category_revenue desc
limit 100;
