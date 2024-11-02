-- T219.tpl

define MIN_PROFIT = random(1000, 6000, uniform);
define CATEGORY_ID = random(1, 15, uniform);

select
    i_category,
    sum(cs_net_profit) as total_category_profit
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    total_category_profit desc
limit 100;
