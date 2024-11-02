-- T269.tpl

define CATEGORY = random(1, 10, uniform);
define MAX_REVENUE = random(5000, 15000, uniform);

select
    i_category,
    sum(ss_sales_price) as category_revenue
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_sales_price) < [MAX_REVENUE]
order by
    category_revenue asc
limit 100;