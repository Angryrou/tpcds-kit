-- T798.tpl

define AGE = random(18, 70, uniform);
define MIN_EXPENSE = random(3000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as age_expense
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_EXPENSE]
order by
    age_expense desc
limit 100;