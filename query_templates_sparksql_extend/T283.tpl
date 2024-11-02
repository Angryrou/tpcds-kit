-- T283.tpl

define MONTH = random(1, 12, uniform);
define MIN_NET_PROFIT = random(2000, 8000, uniform);

select
    d_moy,
    sum(ss_net_profit) as monthly_net_profit
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    sum(ss_net_profit) > [MIN_NET_PROFIT]
order by
    monthly_net_profit desc
limit 100;
