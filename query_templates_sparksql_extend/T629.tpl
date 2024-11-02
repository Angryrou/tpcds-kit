-- T629.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_PROFIT = random(5000, 15000, uniform);

select
    i_category,
    sum(ss_net_profit) as category_net_profit
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    category_net_profit desc
limit 100;
