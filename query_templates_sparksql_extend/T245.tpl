-- T245.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_REVENUE = random(5000, 15000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as total_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_sales_price) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
