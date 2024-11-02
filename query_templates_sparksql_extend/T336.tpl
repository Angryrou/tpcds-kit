-- T336.tpl

define LOYALTY_LEVEL = random(1, 4, uniform);
define MIN_NET_PROFIT = random(1000, 4000, uniform);

select
    c_loyalty_class,
    sum(ss_net_profit) as loyalty_net_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_net_profit) > [MIN_NET_PROFIT]
order by
    loyalty_net_profit desc
limit 100;
