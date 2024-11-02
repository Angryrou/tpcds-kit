-- T529.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_REVENUE = random(5000, 20000, uniform);

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
    sum(cs_net_paid) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
