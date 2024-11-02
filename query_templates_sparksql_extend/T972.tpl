-- T972.tpl

define CATEGORY_ID = random(1, 10, uniform);
define MAX_REVENUE = random(5000, 12000, uniform);

select
    i_category,
    sum(cs_net_paid_inc_tax) as category_revenue
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_net_paid_inc_tax) < [MAX_REVENUE]
order by
    category_revenue asc
limit 100;
