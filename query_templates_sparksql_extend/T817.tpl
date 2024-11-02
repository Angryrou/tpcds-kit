-- T817.tpl

define AGE = random(18, 70, uniform);
define MAX_PROFIT = random(3000, 15000, uniform);

select
    c_customer_age,
    sum(ss_net_profit) as age_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_net_profit) < [MAX_PROFIT]
order by
    age_profit asc
limit 100;
