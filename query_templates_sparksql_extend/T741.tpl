-- T741.tpl

define AGE_GROUP = random(18, 70, uniform);
define MIN_REVENUE = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as total_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
