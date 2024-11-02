-- T291.tpl

define AGE_GROUP = random(20, 60, uniform);
define MIN_EXPENSE = random(2000, 12000, uniform);

select
    c_customer_age,
    sum(cs_net_paid_inc_tax) as age_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_net_paid_inc_tax) > [MIN_EXPENSE]
order by
    age_expense desc
limit 100;
