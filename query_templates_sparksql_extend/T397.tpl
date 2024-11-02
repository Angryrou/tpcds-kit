-- T397.tpl

define CUSTOMER_AGE = random(18, 60, uniform);
define MAX_REVENUE = random(5000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as total_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [CUSTOMER_AGE]
group by
    c_customer_age
having
    sum(cs_net_paid) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
