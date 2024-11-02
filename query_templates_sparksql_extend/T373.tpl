-- T373.tpl

define AGE = random(30, 70, uniform);
define MIN_REVENUE = random(3000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as total_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
