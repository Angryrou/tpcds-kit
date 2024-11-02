-- T362.tpl

define AGE_GROUP = random(20, 65, uniform);
define MAX_REVENUE = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(ss_net_paid_inc_tax) as total_age_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_net_paid_inc_tax) < [MAX_REVENUE]
order by
    total_age_revenue asc
limit 100;
