-- T146.tpl

define MONTH = random(1, 12, uniform);
define MIN_PROFIT = random(1000, 7000, uniform);

select
    d_month,
    sum(ss_net_paid_inc_tax) as monthly_profit
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_month = [MONTH]
group by
    d_month
having
    sum(ss_net_paid_inc_tax) > [MIN_PROFIT]
order by
    monthly_profit desc
limit 100;
