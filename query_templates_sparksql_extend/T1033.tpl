-- T1033.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MIN_EXPENSE = random(5000, 15000, uniform);

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
    sum(ss_net_paid) > [MIN_EXPENSE]
order by
    loyalty_expense desc
limit 100;
