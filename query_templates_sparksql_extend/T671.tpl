-- T671.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_PROFIT = random(3000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as age_range_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_PROFIT]
order by
    age_range_profit desc
limit 100;
