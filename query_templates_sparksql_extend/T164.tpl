-- T164.tpl

define AGE_RANGE = random(18, 60, uniform);
define MIN_SPEND = random(3000, 20000, uniform);

select
    c_customer_id,
    sum(cs_net_paid_inc_tax) as total_spend
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_id
having
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    total_spend desc
limit 100;
