-- T479.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MIN_SPENDING = random(2000, 8000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid) as total_spending
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_net_paid) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
