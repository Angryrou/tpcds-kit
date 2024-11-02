-- T781.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MAX_NET_PROFIT = random(3000, 10000, uniform);

select
    c_loyalty_class,
    sum(ss_net_profit) as loyalty_net_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    loyalty_net_profit asc
limit 100;
