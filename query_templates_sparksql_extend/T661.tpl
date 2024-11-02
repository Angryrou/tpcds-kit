-- T661.tpl

define CATEGORY_ID = random(1, 20, uniform);
define MIN_REVENUE = random(5000, 15000, uniform);

select
    i_category,
    sum(cs_net_paid) as category_revenue
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_net_paid) > [MIN_REVENUE]
order by
    category_revenue desc
limit 100;
