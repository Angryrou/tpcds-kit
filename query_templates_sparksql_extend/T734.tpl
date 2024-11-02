-- T734.tpl

define CATEGORY = random(1, 10, uniform);
define MAX_PROFIT = random(2000, 8000, uniform);

select
    i_category,
    sum(cs_net_profit) as category_profit
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_profit) < [MAX_PROFIT]
order by
    category_profit asc
limit 100;
