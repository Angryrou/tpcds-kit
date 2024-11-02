-- T475.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_NET_PROFIT = random(3000, 12000, uniform);

select
    i_category,
    sum(ss_net_profit) as total_category_profit
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    total_category_profit asc
limit 100;
