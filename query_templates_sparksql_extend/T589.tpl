-- T589.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_PROFIT = random(5000, 15000, uniform);

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
    sum(ss_net_profit) > [MIN_PROFIT]
order by
    age_group_net_profit desc
limit 100;
