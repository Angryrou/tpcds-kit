-- T523.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MAX_SPENDING = random(5000, 15000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid) as total_spending
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_paid) < [MAX_SPENDING]
order by
    total_spending asc
limit 100;
