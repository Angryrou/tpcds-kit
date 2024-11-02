-- T406.tpl

define CATEGORY_ID = random(1, 20, uniform);
define MIN_PROFIT = random(3000, 12000, uniform);

select
    i_category,
    sum(cs_net_profit) as category_profit
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
    category_profit desc
limit 100;
