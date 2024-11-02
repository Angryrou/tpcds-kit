-- T564.tpl

define AGE_RANGE = random(20, 70, uniform);
define MAX_REVENUE = random(5000, 20000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as total_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(ss_net_paid) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
