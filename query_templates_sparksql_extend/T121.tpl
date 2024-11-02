-- T121.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_PROFIT = random(500, 2000, uniform);

select
    i_category,
    d_month,
    sum(ss_net_profit) as monthly_profit
from
    store_sales ss,
    item i,
    date_dim d
where
    ss_item_sk = i_item_sk
    and ss_sold_date_sk = d_date_sk
    and i_category_id = [CATEGORY]
group by
    i_category,
    d_month
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    monthly_profit desc
limit 100;
