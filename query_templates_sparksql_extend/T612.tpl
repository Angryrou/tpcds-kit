-- T612.tpl

define CATEGORY_ID = random(1, 10, uniform);
define MIN_NET_PROFIT = random(3000, 12000, uniform);

select
    i_category,
    sum(cs_net_profit) as category_net_profit
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(cs_net_profit) > [MIN_NET_PROFIT]
order by
    category_net_profit desc
limit 100;
