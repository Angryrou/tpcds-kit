-- T258.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_PROFIT = random(500, 4000, uniform);

select
    c_customer_age,
    sum(ss_net_profit) as age_profit
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    age_profit desc
limit 100;
