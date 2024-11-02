-- T377.tpl

define LOYALTY_CLASS = random(1, 4, uniform);
define MIN_EXPENSE = random(3000, 12000, uniform);

select
    c_loyalty_class,
    sum(ss_net_paid) as total_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_net_paid) > [MIN_EXPENSE]
order by
    total_expense desc
limit 100;
