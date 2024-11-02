-- T640.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_NET_PROFIT = random(2000, 8000, uniform);

select
    c_customer_age,
    sum(ss_net_profit) as age_group_net_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_net_profit) < [MAX_NET_PROFIT]
order by
    age_group_net_profit asc
limit 100;
