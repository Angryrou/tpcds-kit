-- T549.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_SPENDING = random(5000, 20000, uniform);

select
    c_customer_type,
    sum(ss_net_paid) as total_spending
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_net_paid) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
