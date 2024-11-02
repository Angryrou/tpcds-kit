-- T241.tpl

define AGE = random(25, 70, uniform);
define MIN_SPENDING = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(cs_net_paid_inc_tax) as total_spent
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_net_paid_inc_tax) > [MIN_SPENDING]
order by
    total_spent desc
limit 100;
