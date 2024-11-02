-- T679.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_EXPENSE = random(5000, 15000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as total_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_net_paid) > [MIN_EXPENSE]
order by
    total_expense desc
limit 100;
