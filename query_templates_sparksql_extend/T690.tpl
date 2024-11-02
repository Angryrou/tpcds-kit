-- T690.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_PROFIT = random(3000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_profit) as age_group_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_net_profit) < [MAX_PROFIT]
order by
    age_group_profit asc
limit 100;
