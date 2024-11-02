-- T730.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_REVENUE = random(5000, 20000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as age_group_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_net_paid) < [MAX_REVENUE]
order by
    age_group_revenue asc
limit 100;
