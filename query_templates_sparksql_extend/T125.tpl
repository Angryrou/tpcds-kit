-- T125.tpl

define AGE_RANGE = random(20, 60, uniform);
define MIN_SPEND = random(1000, 5000, uniform);

select
    c_customer_id,
    c_customer_age,
    sum(cs_net_paid_inc_tax) as total_spent
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_id,
    c_customer_age
having
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    total_spent desc
limit 100;
