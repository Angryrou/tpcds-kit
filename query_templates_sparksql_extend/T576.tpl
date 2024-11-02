-- T576.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_NET_PROFIT = random(5000, 20000, uniform);

select
    c_customer_type,
    sum(ss_net_profit) as customer_net_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    customer_net_profit asc
limit 100;
