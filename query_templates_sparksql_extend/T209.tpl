-- T209.tpl

define YEAR = random(2001, 2004, uniform);
define MIN_PROFIT = random(1000, 5000, uniform);

select
    d_year,
    sum(ss_net_paid) as total_net_profit
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(ss_net_paid) > [MIN_PROFIT]
order by
    total_net_profit desc
limit 100;
