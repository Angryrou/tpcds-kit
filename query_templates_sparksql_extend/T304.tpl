-- T304.tpl

define AGE_RANGE = random(18, 65, uniform);
define MAX_NET_PROFIT = random(2000, 10000, uniform);

select
    c_customer_age,
    sum(ss_net_profit) as net_profit_by_age
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    net_profit_by_age asc
limit 100;