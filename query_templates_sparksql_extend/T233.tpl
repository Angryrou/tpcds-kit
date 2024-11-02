-- T233.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_SPEND = random(2000, 10000, uniform);

select
    c_customer_age,
    sum(cs_net_paid_inc_tax) as age_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    age_spending desc
limit 100;
