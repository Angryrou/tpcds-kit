-- T428.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MIN_EXPENSE = random(2000, 10000, uniform);

select
    c_loyalty_class,
    sum(cs_net_paid) as loyalty_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    loyalty_expense desc
limit 100;
