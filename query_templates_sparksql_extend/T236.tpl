-- T236.tpl

define AGE = random(20, 60, uniform);
define MAX_PROFIT = random(1000, 7000, uniform);

select
    c_customer_age,
    sum(cs_net_profit) as total_age_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_net_profit) < [MAX_PROFIT]
order by
    total_age_profit asc
limit 100;
