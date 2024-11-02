-- T421.tpl

define CUSTOMER_AGE = random(20, 60, uniform);
define MIN_SPENDING = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as total_spending
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [CUSTOMER_AGE]
group by
    c_customer_age
having
    sum(ss_net_paid) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
