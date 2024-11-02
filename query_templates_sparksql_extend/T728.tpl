-- T728.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MAX_EXPENSE = random(3000, 12000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid) as loyalty_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_net_paid) < [MAX_EXPENSE]
order by
    loyalty_expense asc
limit 100;
