-- T405.tpl

define AGE_RANGE = random(18, 70, uniform);
define MAX_EXPENSE = random(5000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_paid_inc_tax) as age_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_net_paid_inc_tax) < [MAX_EXPENSE]
order by
    age_expense asc
limit 100;
