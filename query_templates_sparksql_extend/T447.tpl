-- T447.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_REVENUE = random(5000, 20000, uniform);

select
    i_category,
    sum(cs_net_paid) as total_revenue
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_paid) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
