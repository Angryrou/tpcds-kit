-- T517.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_EXPENSE = random(2000, 10000, uniform);

select
    c_customer_age,
    sum(cs_net_paid_inc_tax) as total_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_net_paid_inc_tax) < [MAX_EXPENSE]
order by
    total_expense asc
limit 100;
