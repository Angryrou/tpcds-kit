-- T273.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_PROFIT = random(2000, 9000, uniform);

select
    c_customer_age,
    sum(cs_net_profit) as age_profit
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_net_profit) > [MIN_PROFIT]
order by
    age_profit desc
limit 100;
