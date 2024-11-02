-- T745.tpl

define AGE = random(25, 70, uniform);
define MAX_EXPENSE = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as age_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_net_paid) < [MAX_EXPENSE]
order by
    age_expense asc
limit 100;
