-- T511.tpl

define CATEGORY_ID = random(1, 15, uniform);
define MAX_NET_PROFIT = random(5000, 15000, uniform);

select
    i_category,
    sum(ss_net_profit) as category_net_profit
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    category_net_profit asc
limit 100;
