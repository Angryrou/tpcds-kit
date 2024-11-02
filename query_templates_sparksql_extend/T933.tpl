-- T933.tpl

define AGE = random(18, 70, uniform);
define MAX_EXPENSE = random(3000, 12000, uniform);

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
    sum(cs_net_paid) < [MAX_EXPENSE]
order by
    age_expense asc
limit 100;
