-- T199.tpl

define MIN_PROFIT = random(1500, 7000, uniform);
define CATEGORY = random(1, 10, uniform);

select
    i_category,
    sum(cs_net_profit) as total_profit
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    total_profit desc
limit 100;
