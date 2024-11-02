-- T659.tpl

define AGE_RANGE = random(18, 70, uniform);
define MIN_EXPENSE = random(5000, 20000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as total_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    total_expense desc
limit 100;
