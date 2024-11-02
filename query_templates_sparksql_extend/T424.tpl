-- T424.tpl

define CATEGORY = random(1, 15, uniform);
define MIN_NET_PROFIT = random(1000, 8000, uniform);

select
    i_category,
    sum(cs_net_profit) as total_net_profit
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_profit) > [MIN_NET_PROFIT]
order by
    total_net_profit desc
limit 100;
