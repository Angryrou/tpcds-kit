-- T582.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MAX_NET_PROFIT = random(5000, 15000, uniform);

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
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    loyalty_net_profit asc
limit 100;
