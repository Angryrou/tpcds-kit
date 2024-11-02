-- T352.tpl

define CATEGORY = random(1, 20, uniform);
define MAX_NET_PROFIT = random(5000, 15000, uniform);

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
    sum(cs_net_profit) < [MAX_NET_PROFIT]
order by
    total_net_profit asc
limit 100;
