-- T186.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MIN_REVENUE = random(2000, 10000, uniform);

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
    sum(cs_net_paid_inc_tax) > [MIN_REVENUE]
order by
    category_revenue desc
limit 100;
